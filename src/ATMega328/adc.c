#include <avr/io.h>
#include <stdint.h>

// initialize ADC
void adc_init(void) {
	ADCSRA |= _BV(ADEN);
}

// adc read function from pin adcx
uint16_t adc_read(uint8_t adcx) {
	ADMUX &= 0xf0;
	ADMUX |= adcx;

	// start conversion
	ADCSRA |= _BV(ADSC);

	// wait for conversion
	while (ADCSRA & _BV(ADSC));

	// return value
	return ADC;
}