// include libararies
#define F_CPU 16000000UL
#include <avr/io.h>
#include <stdio.h>
#include <util/delay.h>
#include "main_header.h"

// global constants
uint8_t magDataBuffer = 0x55;
uint8_t controller_x, controller_y;

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
    controller_x = mapDigital(adc_read(0), 180, 800);
    controller_y = mapDigital(adc_read(1), 300, 700);
    magDataBuffer = 0;
        
    // parse control into commands
    // L/R has more dominance control
    if (controller_x == 0) {
        magDataBuffer = 1;
    } else if (controller_x == 1) {
        magDataBuffer = 2;
    }

    // F/W second priority
    if (!magDataBuffer) {
        if (controller_y == 0) {
            magDataBuffer = 4;
        } else if (controller_y == 1) {
            magDataBuffer = 3;
        }        
    }

    // printf("%d\n", controller_x);
    // if (magDataBuffer) printf("\nTransmission: 0b_" BYTE_TO_BINARY_PATTERN, BYTE_TO_BINARY(magDataBuffer));
    // else printf("\n");
    switch (magDataBuffer) {
        case 1: printf("LEFT\n"); break;
        case 2: printf("RIGHT\n"); break;
        case 3: printf("FORWARD\n"); break;
        case 4: printf("BACK\n"); break;
        default: printf("\n");
    }

    // send some bits
    setMagData(magDataBuffer); 
    transmit();

    delay(250);
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

// convert adc into a digital signal
uint8_t mapDigital(uint16_t adc, uint16_t low, uint16_t high) {
    // printf("adc: %4d\t", adc);
    return (adc < low) ? 0 : (adc > high) ? 1 : 2;
}

// parse ADC into direction
void parseDirection(void) {
    
}