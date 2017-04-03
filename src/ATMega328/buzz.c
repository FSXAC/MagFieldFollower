#define F_CPU 16000000UL

// buzzing and sound functions
#include <stdio.h>
#include <avr/io.h>
#include <util/delay.h>
#include "main_header.h"

void buzz(float duration, float period) {
	// initialize variables
	long int i, cycles;
	float half_period;

	// compute number of cycles and compute half cycle period
	cycles = duration / period;
	half_period = period / 2;

	// toggle the speaker n times
	for (i = 0; i < cycles; i++) {
		delayms(half_period);
		PORTD turnOn(7);
		delayms(half_period);
		PORTD turnOff(7);
	}
	return;
}

void alert(void) {
	int i;
	for (i = 0; i < 4; i++) {
		buzz(75, 0.5);
		_delay_ms(75);
	}
	return;
}