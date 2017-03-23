// timer c file that includes timer interrupts
#include <stdio.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include "main_header.h"

// ===[global variables]===
unsigned int counter = 0;
unsigned char magData = 0;

// ===[interrupt service routine]===
ISR(TIMER0_OVF_vect) {
	// toggle pin 15 on and off
	counter++;
	if (counter > 1 && magData) {
		PORTB ^= 0x02;
		counter = 0;
	}
}

ISR(TIMER1_OVF_vect) {
    // toggle data on and off
	// magData = !magData;
	PORTB ^= 0x01;
}

// intialize timer 0
void timer_init(void) {
	#ifdef TIMER0_ENABLED
		TCCR0B = 1<<CS00;

		// clear overflow flag
		TIFR0 = 1<<TOV0;

		// enable overflow interrupt
		TIMSK0 = 1<<TOIE0;
	#endif

	#ifdef TIMER1_ENABLED
		TCCR1B = 1<<CS01;
		TIFR1 = 1<<TOV1;
		TIMSK1 = 1<<TOIE1;
	#endif
	sei();
}