// FreqF38x.c: Measure the frequency of a signal on pin T0 (normally P0.0).
//
// By:  Jesus Calvino-Fraga

#include <C8051f38x.h>
#include <stdio.h>
#include "global.h"

unsigned char overflow_count;
void waitms (unsigned int ms);

void TIMER0_Init(void)
{
	TMOD&=0b_1111_0000; // Set the bits of Timer/Counter 0 to zero
	TMOD|=0b_0000_0101; // Timer/Counter 0 used as a 16-bit counter
	TR0=0; // Stop Timer/Counter 0
}

void main (void) 
{
	unsigned long F;
	
	TIMER0_Init();
	
	printf("\x1b[2J"); // Clear screen using ANSI escape sequence.

	printf ("Frequency measurement using Timer/Counter 0.\n"
	        "File: %s\n"
	        "Compiled: %s, %s\n\n",
	        __FILE__, __DATE__, __TIME__);

	while(1)
	{
		TL0=0;
		TH0=0;
		overflow_count=0;
		TF0=0;
		TR0=1; // Start Timer/Counter 0
		waitms(1000);
		TR0=0; // Stop Timer/Counter 0
		F=overflow_count*0x10000L+TH0*0x100L+TL0;

		printf("\rf=%luHz", F);
		printf("\x1b[0K"); // ANSI: Clear from cursor to end of line.
	}
	
}


 