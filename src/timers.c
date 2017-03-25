// timer c file that includes timer interrupts
#include <stdio.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include "main_header.h"

#define TIMER0_ENABLED
#define TIMER1_ENABLED

// ===[global variables]===
volatile unsigned char counter0 = 0;
volatile unsigned char magEnabled = 1;
volatile unsigned char magData = 0x01;
volatile unsigned char magDataBit = 0;
volatile unsigned char flag = 1;

// ===[interrupt service routine]===
// Timer 0
#ifdef TIMER0_ENABLED
ISR(TIMER0_OVF_vect) {
	// toggle pin 15 on and off
	counter0++;
	if (counter0 > 1) {
		counter0 = 0;
		// PORTB toggle(1);
		if (magEnabled) {
			PORTB turnOff(1);
		} else {
			PORTB toggle(1);
		}
	}
}
#endif

// Timer 1
#ifdef TIMER1_ENABLED
ISR(TIMER1_OVF_vect) {
	// if the bit at magDatabit is 1, turn the modulation on; otherwise, off
	// magEnabled = (1<<magDataBit++) & magData;
	if (magDataBit < 8) {
		magEnabled = magData & (1<<magDataBit++);
		// if (magData & (1<<magDataBit++)) PORTB turnOn(0);
		// else PORTB turnOff(0);
	}
}
#endif

// intialize timers
void timer_init(void) {
	// timer 0
	#ifdef TIMER0_ENABLED
		// prescaler
		TCCR0B = 1<<CS00;

		// clear overflow flag
		TIFR0 = 1<<TOV0;

		// enable overflow interrupt
		TIMSK0 = 1<<TOIE0;
	#endif

	// timer 1
	#ifdef TIMER1_ENABLED
		// prescaler
		TCCR1B |= 0x02;
		TIFR1 = 1<<TOV1;
		TIMSK1 = 1<<TOIE1;
	#endif
	sei();
}

// set magnetic data
void setMagData(unsigned char new_data) {
	magData = new_data;
}

// start transmission
void transmit(void) {
	magDataBit = 0;
	TCCR1B |= 0x01;
	TCNT1L = 0;
	TCNT1H = 0;
}