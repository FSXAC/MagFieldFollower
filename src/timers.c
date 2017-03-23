// timer c file that includes timer interrupts
#include <stdio.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include "main_header.h"

// ===[global variables]===
unsigned int counter = 0;

// ===[interrupt service routine]===
// ISR(TIMER1_OVF_vect) {
//     counter++;
//     if (counter > 1) {
//         counter = 0;

//         // toggle pin 15
//         PORTB ^= 0x02;
//     }
// }
ISR(TIMER0_OVF_vect) {
	// toggle pin 15 on and off
	counter++;
	if (counter > 1) {
		PORTB ^= 0x02;
		counter = 0;
	}
}

// intialize timer 0
void timer0_init(void) {
	// timer clock
	// TCCR0B = (1<<CS01) | (1<<CS00);
	TCCR0B = (1<<CS00);

	// clear overflow flag
	TIFR0 = 1<<TOV0;

	// enable overflow interrupt
	TIMSK0 = 1<<TOIE0;
	sei();
}