//  all_timers.c: Uses timer 0 to 5 overflow interrupts to generate a square
//  wave at pins P2.0 to P2.5.  Also use the PCA with interrupts to
//  generate PWM signal at pins P1.0 to P1.4
//
//  Copyright (c) 2010-2015 Jesus Calvino-Fraga
//
//  ~C51~

#include <C8051F38x.h>
#include <stdlib.h>
#include <stdio.h>

#define SYSCLK    48000000L // SYSCLK frequency in Hz
#define TIMER_0_FREQ 1000L
#define TIMER_1_FREQ 2000L
#define TIMER_2_FREQ 3000L
#define TIMER_3_FREQ 4000L
#define TIMER_4_FREQ 5000L
#define TIMER_5_FREQ 6000L
#define PCA_0_FREQ 7000L
#define PCA_1_FREQ 8000L
#define PCA_2_FREQ 9000L
#define PCA_3_FREQ 10000L
#define PCA_4_FREQ 11000L

#define TIMER_OUT_0 P2_0
#define TIMER_OUT_1 P2_1
#define TIMER_OUT_2 P2_2
#define TIMER_OUT_3 P2_3
#define TIMER_OUT_4 P2_4
#define TIMER_OUT_5 P2_5
#define MAIN_OUT    P2_6 // Updated in the main program
#define PCA_OUT_0   P1_0
#define PCA_OUT_1   P1_1
#define PCA_OUT_2   P1_2
#define PCA_OUT_3   P1_3
#define PCA_OUT_4   P1_4

#define PUSH_SFRPAGE _asm push _SFRPAGE _endasm
#define POP_SFRPAGE _asm pop _SFRPAGE _endasm

char _c51_external_startup (void)
{
	PCA0MD&=(~WDTE) ;    // DISABLE WDT: clear Watchdog Enable bit
	VDM0CN=0x80; // enable VDD monitor
	RSTSRC=0x02|0x04; // Enable reset on missing clock detector and VDD

	// CLKSEL&=0b_1111_1000; // Not needed because CLKSEL==0 after reset
	#if (SYSCLK == 12000000L)
		//CLKSEL|=0b_0000_0000;  // SYSCLK derived from the Internal High-Frequency Oscillator / 4 
	#elif (SYSCLK == 24000000L)
		CLKSEL|=0b_0000_0010; // SYSCLK derived from the Internal High-Frequency Oscillator / 2.
	#elif (SYSCLK == 48000000L)
		CLKSEL|=0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
	#else
		#error SYSCLK must be either 12000000L, 24000000L, or 48000000L
	#endif
	OSCICN |= 0x03; // Configure internal oscillator for its maximum frequency

	// Configure the pins used for square output
	P1MDOUT|=0b_0001_1111;
	P2MDOUT|=0b_0111_1111;
	XBR1     = 0x40; // Enable crossbar and weak pull-ups

	// Initialize timer 0 for periodic interrupts
	TR0=0;
	TF0=0;
	CKCON|=0b_0000_0100; // Timer 0 uses the system clock
	TMOD&=0xf0;
	TMOD|=0x01; // Timer 0 in mode 1: 16-bit timer
	// Initialize reload value
	TH0=(65536L-(SYSCLK/(2*TIMER_0_FREQ)))/0x100;
	TL0=(65536L-(SYSCLK/(2*TIMER_0_FREQ)))%0x100;
	ET0=1;     // Enable Timer0 interrupts
	TR0=1;     // Start Timer0

	// Initialize timer 1 for periodic interrupts
	TR1=0;
	TF1=0;
	CKCON|=0b_0000_1000; // Timer 1 uses the system clock
	TMOD&=0x0f;
	TMOD|=0x10; // Timer 1 in mode 1: 16-bit timer
	// Initialize reload value
	TH1=(65536L-(SYSCLK/(2*TIMER_1_FREQ)))/0x100;
	TL1=(65536L-(SYSCLK/(2*TIMER_1_FREQ)))%0x100;
	ET1=1;     // Enable Timer1 interrupts
	TR1=1;     // Start Timer1

	// Initialize timer 2 for periodic interrupts
	TMR2CN=0x00;   // Stop Timer2; Clear TF2;
	CKCON|=0b_0001_0000; // Timer 2 uses the system clock
	TMR2RL=(0x10000L-(SYSCLK/(2*TIMER_2_FREQ))); // Initialize reload value
	TMR2=0xffff;   // Set to reload immediately
	ET2=1;         // Enable Timer2 interrupts
	TR2=1;         // Start Timer2 (TMR2CN is bit addressable)

	// Initialize timer 3 for periodic interrupts
	TMR3CN=0x00;   // Stop Timer3; Clear TF3;
	CKCON|=0b_0100_0000; // Timer 3 uses the system clock
	TMR3RL=(0x10000L-(SYSCLK/(2*TIMER_3_FREQ))); // Initialize reload value
	TMR3=0xffff;   // Set to reload immediately
	EIE1|=ET3;     // Enable Timer3 interrupts
	TMR3CN|=TR3;   // Start Timer3 (TMR3CN is not bit addressable)

	// Initialize timer 4 for periodic interrupts
	SFRPAGE=0xf;   // WARNING: Select SFR page 0xf!
	TMR4CN=0x00;   // Stop Timer4; Clear TF4;
	CKCON1|=0b_0000_0001; // Timer 4 uses the system clock
	TMR4RL=(0x10000L-(SYSCLK/(2*TIMER_4_FREQ))); // Initialize reload value
	TMR4=0xffff;   // Set to reload immediately
	EIE2|=ET4;     // Enable Timer3 interrupts
	TMR4CN|=TR4;   // Start Timer4 (TMR4CN is not bit addressable)

	// Initialize timer 5 for periodic interrupts
	SFRPAGE=0xf;   // WARNING: Select SFR page 0xf!
	TMR5CN=0x00;   // Stop Timer5; Clear TF5;
	CKCON1|=0b_0000_0100; // Timer 5 uses the system clock
	TMR5RL=(0x10000L-(SYSCLK/(2*TIMER_5_FREQ))); // Initialize reload value
	TMR5=0xffff;   // Set to reload immediately
	EIE2|=ET5;     // Enable Timer5 interrupts
	TR5=1;         // Start Timer5 (TMR5CN is bit addressable)

	// Initialize the Prgramable Counter Array to generate four servo 
	// signals at pins P1.0 to P1.2
	SFRPAGE=0x0;
	PCA0MD=0x00; // Disable and clear everything in the PCA
	PCA0L=0; // Initialize the PCA counter to zero
	PCA0H=0;
	PCA0MD=CPS2; // Configure PCA.  CLK is the frequency input for the PCA
	// Enable all PCS modules comparators and to generate interrupts
	PCA0CPM0=PCA0CPM1=PCA0CPM2=PCA0CPM3=PCA0CPM4=ECOM|MAT|ECCF;
	// The frequency for PCA channel 0
	PCA0CPL0=(SYSCLK/(2*PCA_0_FREQ))%0x100; //Always write low byte first!
	PCA0CPH0=(SYSCLK/(2*PCA_0_FREQ))/0x100;
	// The frequency for PCA channel 1
	PCA0CPL1=(SYSCLK/(2*PCA_1_FREQ))%0x100; //Always write low byte first!
	PCA0CPH1=(SYSCLK/(2*PCA_1_FREQ))/0x100;
	// The frequency for PCA channel 2
	PCA0CPL2=(SYSCLK/(2*PCA_2_FREQ))%0x100; //Always write low byte first!
	PCA0CPH2=(SYSCLK/(2*PCA_2_FREQ))/0x100;
	// The frequency for PCA channel 3
	PCA0CPL3=(SYSCLK/(2*PCA_3_FREQ))%0x100; //Always write low byte first!
	PCA0CPH3=(SYSCLK/(2*PCA_3_FREQ))/0x100;
	// The frequency for PCA channel 4
	PCA0CPL4=(SYSCLK/(2*PCA_4_FREQ))%0x100; //Always write low byte first!
	PCA0CPH4=(SYSCLK/(2*PCA_4_FREQ))/0x100;
	CR=1; // Enable PCA counter
	EIE1|=EPCA0; // Enable PCA interrupts
	
	EA=1; // Enable interrupts
	
	return 0;
}

void Timer0_ISR (void) interrupt INTERRUPT_TIMER0
{
	PUSH_SFRPAGE;
	SFRPAGE=0x0;
	// Timer 0 in 16-bit mode doesn't have auto reload
	TH0=(0x10000L-(SYSCLK/(2*TIMER_0_FREQ)))/0x100;
	TL0=(0x10000L-(SYSCLK/(2*TIMER_0_FREQ)))%0x100;
	TIMER_OUT_0=!TIMER_OUT_0;
	POP_SFRPAGE;
}

void Timer1_ISR (void) interrupt INTERRUPT_TIMER1
{
	PUSH_SFRPAGE;
	SFRPAGE=0x0;
	// Timer 1 in 16-bit mode doesn't have auto reload
	TH1=(0x10000L-(SYSCLK/(2*TIMER_1_FREQ)))/0x100;
	TL1=(0x10000L-(SYSCLK/(2*TIMER_1_FREQ)))%0x100;
	TIMER_OUT_1=!TIMER_OUT_1;
	POP_SFRPAGE;
}

void Timer2_ISR (void) interrupt INTERRUPT_TIMER2
{
	PUSH_SFRPAGE;
	SFRPAGE=0x0;
	TF2H = 0; // Clear Timer2 interrupt flag
	TIMER_OUT_2=!TIMER_OUT_2;
	POP_SFRPAGE;
}

void Timer3_ISR (void) interrupt INTERRUPT_TIMER3
{
	PUSH_SFRPAGE;
	SFRPAGE=0x0;
	TMR3CN&=~TF3H; // Clear Timer3 interrupt flag
	TIMER_OUT_3=!TIMER_OUT_3;
	POP_SFRPAGE;
}

void Timer4_ISR (void) interrupt INTERRUPT_TIMER4
{
	PUSH_SFRPAGE;
	SFRPAGE=0xf;
	TMR4CN&=~TF4H; // Clear Timer4 interrupt flag
	TIMER_OUT_4=!TIMER_OUT_4;
	POP_SFRPAGE;
}

void Timer5_ISR (void) interrupt INTERRUPT_TIMER5
{
	PUSH_SFRPAGE;
	SFRPAGE=0xf;
	TF5H = 0; // Clear Timer5 interrupt flag
	SFRPAGE=0xf;
	TIMER_OUT_5=!TIMER_OUT_5;
	POP_SFRPAGE;
}

void PCA_ISR (void) interrupt INTERRUPT_PCA0
{
	unsigned int j;
	
	PUSH_SFRPAGE;
	SFRPAGE=0x0;
	
	if (CCF0)
	{
		j=(PCA0CPH0*0x100+PCA0CPL0)+(SYSCLK/(2L*PCA_0_FREQ));
		PCA0CPL0=j%0x100; //Always write low byte first!
		PCA0CPH0=j/0x100;
		CCF0=0;
		PCA_OUT_0=!PCA_OUT_0;
	}
	if (CCF1)
	{
		j=(PCA0CPH1*0x100+PCA0CPL1)+(SYSCLK/(2L*PCA_1_FREQ));
		PCA0CPL1=j%0x100; //Always write low byte first!
		PCA0CPH1=j/0x100;
		CCF1=0;
		PCA_OUT_1=!PCA_OUT_1;
	}
	if (CCF2)
	{
		j=(PCA0CPH2*0x100+PCA0CPL2)+(SYSCLK/(2L*PCA_2_FREQ));
		PCA0CPL2=j%0x100; //Always write low byte first!
		PCA0CPH2=j/0x100;
		CCF2=0;
		PCA_OUT_2=!PCA_OUT_2;
	}
	if (CCF3)
	{
		j=(PCA0CPH3*0x100+PCA0CPL3)+(SYSCLK/(2L*PCA_3_FREQ));
		PCA0CPL3=j%0x100; //Always write low byte first!
		PCA0CPH3=j/0x100;
		CCF3=0;
		PCA_OUT_3=!PCA_OUT_3;
	}
	if (CCF4)
	{
		j=(PCA0CPH4*0x100+PCA0CPL4)+(SYSCLK/(2L*PCA_4_FREQ));
		PCA0CPL4=j%0x100; //Always write low byte first!
		PCA0CPH4=j/0x100;
		CCF4=0;
		PCA_OUT_4=!PCA_OUT_4;
	}

	CF=0;
	POP_SFRPAGE;
}

void main (void)
{
	while(1)
	{
		MAIN_OUT=!MAIN_OUT;
	}
}
