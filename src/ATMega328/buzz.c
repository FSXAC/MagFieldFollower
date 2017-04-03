// #define F_CPU 16000000UL

// buzzing and sound functions
// #include <stdio.h>
// #include <avr/io.h>
// #include <avr/pgmspace.h>
// #include "main_header.h"

// void buzz(float duration, float period) {
// 	// initialize variables
// 	long int i, cycles;
// 	float half_period;

// 	// compute number of cycles and compute half cycle period
// 	cycles = duration / period;
// 	half_period = period / 2;

// 	// toggle the speaker n times
// 	for (i = 0; i < cycles; i++) {
// 		// delayms(half_period);
// 		// PORTD turnOn(7);
// 		// delayms(half_period);
// 		// PORTD turnOff(7);
// 		delayms(1);
// 		PORTD toggle(7);
// 	}
// 	return;
// }

// void alert(void) {
// 	int i;
// 	for (i = 0; i < 4; i++) {
// 		buzz(75, 0.5);
// 		_delay_ms(75);
// 	}
// 	return;
// }
// const uint8_t scale[] PROGMEM = {239,226,213,201,190,179,169,160,151,142,134,127};

// timer 2 ISR
#ifdef TIMER2_ENABLED
ISR(TIMER2_COMPA_vect) {
	PORTD toggle(7);
	return 0;
}
#endif

// void note(int n, int octave) {
	// set port as output
	// DDRD |= 1<<DDD7;
	// PORTD toggle(7);

	// use timer 2 for tone, toggle OC2B on match
	// TCCR2A = 0<<COM2A0 | 1<<COM2B0 | 2<<WGM20;
	// int prescaler = 9 - (octave+n/12);
	// if (prescaler < 3 || prescaler > 6) prescaler = 0;
	// OCR2A = pgm_read_byte(&scale[n % 12]) - 1;
	// OCR2A = 250;
	// TCCR2B = 0<<WGM22 | prescaler<<CS20;
// }