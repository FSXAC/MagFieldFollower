// Timer C program
// contains all functions that relating to timing

// turning timer 1 or timer 0 on or off
// #define TIMER0_ENABLED
#define TIMER1_ENABLED

// clock
#define F_CPU 16000000UL
#define CTC_MATCH_OVERFLOW ((F_CPU/1000)/8)

// libraries
#include <stdio.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/atomic.h>
#include "main_header.h"

// ===[global variables]===
volatile uint8_t counter = 0;
volatile unsigned long timer1_millis;

// magnetic field database transmission parameters
volatile uint8_t magEnabled = 1;
volatile uint8_t magData = 0x01;
volatile uint8_t magDataBit = 0;

// ===[interrupt service routine]===
// Timer 0
#ifdef TIMER0_ENABLED
ISR(TIMER0_OVF_vect) {
	// toggle pin 15 on and off
	counter++;	
	if (counter % 2) {
		if (magEnabled) PORTB turnOff(1);
		else PORTB toggle(1);
	}
}
#endif

// Timer 1
#ifdef TIMER1_ENABLED
// ISR(TIMER1_OVF_vect) {
// 	// if the bit at magDatabit is 1, turn the modulation on; otherwise, off
// 	if (magDataBit < 8) {
// 		// toggle square wave vs non
// 		magEnabled = (magData>>(8-magDataBit++)) & 1;
// 		if (magEnabled) PORTB turnOn(0);
// 		else PORTB turnOff(0);
// 	}
// }

// CHANGED
ISR(TIMER1_COMPA_vect) {
	timer1_millis++;
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

	// initialize timer 1
	#ifdef TIMER1_ENABLED
		TCCR1B |= (1<<WGM12) | (1<<CS11);

		// load high and low
		OCR1AH = (CTC_MATCH_OVERFLOW >> 8);
		OCR1AL = CTC_MATCH_OVERFLOW;

		// enable compare match interrupt
		TIMSK1 |= (1<<OCIE1A);
	#endif

	// enable global interrupt
	sei();
}

// returns the number of milliseconds
unsigned long millis() {
	unsigned long millis_return;

	// #ifdef ATOMIC_BLOCK
	// // [UNDISRUPTED]
	// ATOMIC_BLOCK(ATOMIC_FORCEON) {
	// 	millis_return = timer1_millis;
	// }
	// #else
	millis_return = timer1_millis;
	// #endif

	return millis_return;
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
	// printf("Transmitting: %04x\n", magData);
}

void magToggle(void) {
	magEnabled = !magEnabled;
}