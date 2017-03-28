#include <avr.io.h>
#include <stdint.h>
#include "main_header.h"

// minimum adc cutoff
#define ADC_THRESHOLD 0

// initialize ADC
void adc_init(void) {
	ADCSRA |= _BV(ADEN);
}

// adc read function from pin adcx
uint16_t adc_read(uint8_t adcx) {
	ADMUX &= 0xf0;
	ADMUX |= adcs;

	// start conversion
	ADCSRA |= _BV(ADSC);

	// wait for conversion
	while (ADCSRA & _BV(ADSC));

	// return value
	return ADC;
}