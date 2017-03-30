// include libararies
#define F_CPU 16000000UL
#include <avr/io.h>
#include <stdio.h>
#include <util/delay.h>
#include "main_header.h"

// global constants
uint8_t magDataBuffer = 0x00;
uint8_t controller_x, controller_y, controller_sw;

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
    pinMode('d', 7);

    // Turn on timer 0 for square output
    timer_init();

    // turn on ADC
    adc_init();
}

// runs forever
void loop(void) {
    // get control direction        
    // getInput();

    switch (magDataBuffer) {
        case 1: printf("LEFT\n"); break;
        case 2: printf("RIGHT\n"); break;
        case 3: printf("FORWARD\n"); break;
        case 4: printf("BACK\n"); break;
        case 5: printf("BUTTON\b"); break;
        default: printf("\n");
    }

    // send some bits
    // setMagData(magDataBuffer);
    setMagData(0x8C);
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
void getInput(void) {
    controller_x = mapDigital(adc_read(0), 180, 800);
    controller_y = mapDigital(adc_read(1), 300, 700);
    controller_sw = PORTD & 0x80;
    magDataBuffer = 0;

    // parse control into commands
    if (controller_sw) {
        // magDataBuffer = 0x30;
    }

    // L/R has more dominance control
    if (!magDataBuffer) {
        if (controller_x == 0) {
            magDataBuffer = 0x01;
        } else if (controller_x == 1) {
            magDataBuffer = 0x02;
        }
    }

    // F/W second priority
    if (!magDataBuffer) {
        if (controller_y == 0) {
            magDataBuffer = 0x04;
        } else if (controller_y == 1) {
            magDataBuffer = 0x03;
        }        
    }
}