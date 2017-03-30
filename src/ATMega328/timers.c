// timer c file that includes timer interrupts
#include <stdio.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include "main_header.h"

#define TIMER0_ENABLED
#define TIMER1_ENABLED

// ===[global variables]===
volatile uint8_t counter = 0;
volatile uint8_t magEnabled = 1;
volatile uint8_t magData = 0x01;
volatile uint8_t magDataBit = 0;
volatile uint8_t flag = 1;

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
ISR(TIMER1_OVF_vect) {
	// if the bit at magDatabit is 1, turn the modulation on; otherwise, off
	if (magDataBit < 8) {
		// toggle square wave vs non
		magEnabled = (magData>>(8-magDataBit++)) & 1;
		if (magEnabled) PORTB turnOn(0);
		else PORTB turnOff(0);
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
		TCCR1B |= 0x01;
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
	printf("Transmitting: %04x\n", magData);
}