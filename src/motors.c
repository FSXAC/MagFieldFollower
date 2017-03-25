//  square.c: Uses timer 2 interrupt to generate a square wave in pin
//  P2.0 and a 75% duty cycle wave in pin P2.1
//  Copyright (c) 2010-2015 Jesus Calvino-Fraga
//  ~C51~

#include <C8051F38x.h>
#include <stdlib.h>
#include <stdio.h>

#define SYSCLK    48000000L // SYSCLK frequency in Hz
#define BAUDRATE  115200L   // Baud rate of UART in bps

#define MOTOR_LEFT0 P1_5
#define MOTOR_LEFT1 P1_6
#define MOTOR_RIGHT0 P2_0
#define MOTOR_RIGHT1 P2_1

volatile  char pwm_count=0;
volatile  char mode = 0;
volatile  char pwm_both =0;
volatile  char pwm_Left0 = 0; //p1.5
volatile  char pwm_Left1 = 0; //p1.6
volatile  char pwm_Right0 = 0; //p2.0
volatile  char pwm_Right1 = 0; //p2.1
volatile char direction = 0; // 1 for back 0 for forward

char _c51_external_startup (void)
{
	PCA0MD&=(~0x40) ;    // DISABLE WDT: clear Watchdog Enable bit
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

	// Configure UART0
	SCON0 = 0x10;
#if (SYSCLK/BAUDRATE/2L/256L < 1)
	TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	CKCON |=  0x08;
#elif (SYSCLK/BAUDRATE/2L/256L < 4)
	TH1 = 0x10000-(SYSCLK/BAUDRATE/2L/4L);
	CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 01
	CKCON |=  0x01;
#elif (SYSCLK/BAUDRATE/2L/256L < 12)
	TH1 = 0x10000-(SYSCLK/BAUDRATE/2L/12L);
	CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 00
#else
	TH1 = 0x10000-(SYSCLK/BAUDRATE/2/48);
	CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 10
	CKCON |=  0x02;
#endif
	TL1 = TH1;      // Init Timer1
	TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
	TMOD |=  0x20;
	TR1 = 1; // START Timer1
	TI = 1;  // Indicate TX0 ready

	// Configure the pins used for square output
	P2MDOUT|=0b_0000_0011;
	P0MDOUT |= 0x10; // Enable UTX as push-pull output
	XBR0     = 0x01; // Enable UART on P0.4(TX) and P0.5(RX)
	XBR1     = 0x40; // Enable crossbar and weak pull-ups

	// Initialize timer 2 for periodic interrupts
	TMR2CN=0x00;   // Stop Timer2; Clear TF2;
	CKCON|=0b_0001_0000;
	TMR2RL=(-(SYSCLK/(2*48))/(100L)); // Initialize reload value
	TMR2=0xffff;   // Set to reload immediately
	ET2=1;         // Enable Timer2 interrupts
	TR2=1;         // Start Timer2

	EA=1; // Enable interrupts

	return 0;
}


void Timer2_ISR (void) interrupt 5
{
	TF2H = 0; // Clear Timer2 interrupt flag

	pwm_count++;
	if(pwm_count>100) pwm_count=0;

// To fully turn off one pin pass -1 to their pwm_***
	MOTOR_LEFT0 = pwm_count > pwm_Left0 ? 0 : 1; //p1.5
	MOTOR_LEFT1 = pwm_count > pwm_Left1 ? 0 : 1; //p1.6
	MOTOR_RIGHT0 = pwm_count > pwm_Right0 ? 0 : 1; //p2.0
	MOTOR_RIGHT1 = pwm_count > pwm_Right1 ? 0 : 1; //p2.1
}

/* Program that controls forward/reverse direction of the robot.
	Parameters
	pwm_both: the value of pwm that controls speed of motors
	direction: flag to set whether robot goes forwards(0) or backwards(1). */
void forward_backward(unsigned char direction)
{

	if (direction == 0) { //p2.1,1.6 on
		pwm_Left0 = pwm_Right0 = -1;
		pwm_Left1 = pwm_Right1 = pwm_both;  //MOTOR_LEFT1 = MOTOR_RIGHT1 = pwm_both;
	}

	else if (direction == 1) { //p2.0,1.5 on
		pwm_Left1 = pwm_Right1 = -1;
		pwm_Left0 = pwm_Right0 = pwm_both; 
		//MOTOR_LEFT0 = MOTOR_RIGHT0 = pwm_both;
		//MOTOR_LEFT1 = MOTOR_RIGHT1 = 0;
	}

}


void main (void)
{
	
   MOTOR_LEFT0 =0;
   MOTOR_LEFT1 =0;
   MOTOR_RIGHT0 =0;
   MOTOR_RIGHT1 =0;


	printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	printf("Square wave generator for the F38x.\r\n"
	       "Check pins P2.1 and P2.2 with the oscilloscope.\r\n");
	printf("Please enter motors mode 1-6\n");
	scanf("%d \n",&mode);
	if(mode == 1) {printf("Enter pwm and direction\n"); scanf("%d %d",&pwm_both, &direction);forward_backward(direction); }
    if(mode == 2) {printf("Stop mode triggered"); pwm_both = -1;forward_backward(direction); }
    //printf("%d\n", pwm_Left1);

	while(1)
	{	
	  //	switch(mode)
	  //	{
	  //		//forward_backward mode
      //			case 1 : forward_backward(direction);

	  //	}
	 //printf("%d\n",MOTOR_LEFT0);

	}
}
