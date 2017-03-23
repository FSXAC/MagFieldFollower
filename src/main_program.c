// include libararies
#define F_CPU 16000000UL
#include <avr/io.h>
#include <stdio.h>
#include <util/delay.h>
#include "main_header.h"

// ===[starting vector]===
int main(void) {setup(); while (1) loop();}

// runs once
void setup(void) {
    int j;

    // initialize usart
    usart_init();
    printf("Hello World!\n");

    // initialize some pins
    // set direction of port/pin
    DDRB  |= (0x01) | (0x02);
    PORTB |= 0x01;

    // Turn on timer 0 for square output
    timer_init();
}

// runs forever
void loop(void) {
    // blink some LEDs on pin 14 for me fam
    // PORTB &= (~0x01);
    // delay(1000);
    // PORTB |= 0x01;
    // delay(1000);
    printf("THE END IS NEVER ");
}