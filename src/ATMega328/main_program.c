// include libararies
#define F_CPU 16000000UL
#include <avr/io.h>
#include <stdio.h>
#include <util/delay.h>
#include "main_header.h"

// global constants
uint8_t magDataBuffer = 0x55;

// ===[starting vector]===
int main(void) {setup(); while (1) loop();}

// runs once
void setup(void) {
    // initialize usart
    usart_init();
    printf("Hello World!\n");

    // initialize some pins
    // set direction of port/pin
    pinMode('b', 0);
    pinMode('b', 1);

    // Turn on timer 0 for square output
    timer_init();

    // turn on ADC
    adc_init();
}

// runs forever
void loop(void) {
    uint8_t iter = 0;
    uint16_t adc_value;

    // send some bits
    // setMagData(magDataBuffer); //1000 0001
    // transmit();
    // magDataBuffer++;
    // delay(500);

    // read adc and print to screen
    adc_value = adc_read(0);
    printf("ADC reading: %4d\t", adc_value);
    for (; iter < adc_value / 40; iter++) printf("#");
    printf("\n");
    delay(50);
}

// set pin output
void pinMode(char port, uint8_t pin) {
    switch (port) {
        case 'B':
        case 'b': DDRB |= (1<<pin); return;
        case 'C':
        case 'c':
            if (pin < 7) DDRC |= (1<<pin); 
            return;
        case 'D':
        case 'd': DDRD |= (1<<pin); return;
        default: return;
    }
}