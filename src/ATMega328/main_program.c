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
}

// runs forever
void loop(void) {

    // send some bits
    // setMagData(magDataBuffer); //1000 0001
    // transmit();
    // magDataBuffer++;
    // delay(500);

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