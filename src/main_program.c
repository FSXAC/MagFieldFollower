// include libararies
#define F_CPU 16000000UL
#include <avr/io.h>
#include <stdio.h>
#include <util/delay.h>
#include "main_header.h"

// program starts here
int main(void) {setup(); while (1) loop();}

// runs once
void setup(void) {
    int j;

    // initialize usart
    usart_init();
    printf("Hello World!\n");

    // initialize some pins
    // set direction of port/pin
    DDRB  |= 0x01;
    PORTB |= 0x01;

    // print some numbers
    for (j = 0; j<10; j++) printf("square(j)=%d\n", j*j);
}

// runs forever
void loop(void) {
    // blink some LEDs on pin 14 for me fam
    PORTB &= (~0x01);
    delay(1000);
    PORTB |= 0x01;
    delay(1000);
    printf("THE END IS NEVER ");
}