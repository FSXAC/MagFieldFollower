// timer c file that includes timer interrupts
#include <stdio.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include "main_header.h"

#define TIMER0_ENABLED
#define TIMER1_ENABLED

// ===[global variables]===
volatile unsigned char counter0 = 0;
volatile unsigned char counter1 = 0;
volatile unsigned char magData = 1;

// ===[interrupt service routine]===
#ifdef TIMER0_ENABLED
ISR(TIMER0_OVF_vect) {
	// toggle pin 15 on and off
	counter0++;
	if (counter0 > 1 && magData) {
		counter0 = 0;
		PORTB ^= 0x02;
	} else PORTB &= ~0x02;
}
#endif

#ifdef TIMER1_ENABLED
ISR(TIMER1_OVF_vect) {
	counter1++;
	if (counter1 > 5) {
		counter1 = 0;
		magData = !magData;
	}
}
#endif

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
		TCCR1B |= 0x01; // 1024 prescaler
		TIFR1 = 1<<TOV1;
		TIMSK1 = 1<<TOIE1;
	#endif
	sei();
}