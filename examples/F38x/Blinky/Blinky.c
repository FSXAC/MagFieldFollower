#include <C8051f38x.h>
#include <stdio.h>

#define SYSCLK      48000000L  // SYSCLK frequency in Hz

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

	// Configure the pin used for output
	P2MDOUT|=0b_0000_0010; // P2.1 has the LED
	XBR1     = 0x40; // Enable crossbar and weak pull-ups
	
	return 0;
}

void delay (unsigned int x)
{
	unsigned char j;
	while(--x)
	{
		for(j=0; j<100; j++);
	}
}

void main (void)
{
	while(1)
	{
		P2_1=0;
		delay(50000);
		P2_1=1;
		delay(50000);
	}
}
