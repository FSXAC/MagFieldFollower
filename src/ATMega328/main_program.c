// include libararies
#define F_CPU 16000000UL
#include <avr/io.h>
#include <stdio.h>
#include <util/delay.h>
#include "main_header.h"

// global constants
uint8_t magDataBuffer = 0x00;
uint8_t controller_x, controller_y, controller_sw;
uint32_t ms_since;

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

    // set pin for input
    // pin 2 for one input
    DDRB &= ~(1<<PB2);

    // Turn on timer 0 for square output
    timer_init();

    // turn on ADC
    adc_init();
}

// runs forever
// void loop(void) {
//     // get control direction        
//     getInput();

//     switch (magDataBuffer) {
//         case CMD_LEFT: printf("LEFT\n"); break;
//         case CMD_RIGHT: printf("RIGHT\n"); break;
//         case CMD_FORWARD: printf("FORWARD\n"); break;
//         case CMD_BACK: printf("BACK\n"); break;
//         case CMD_STOP: printf("HALT\n"); break;
//         case CMD_180: printf("180\n"); break;
//         default: printf("\n");
//     }

//     // send some bits
//     setMagData(magDataBuffer);
//     // setMagData(0x8C);
//     transmit();
//     // delay(30);
//     // magToggle();

//     delay(1000);
// }

void loop(void) {
    unsigned long ms_current = millis();
    if (ms_current - ms_since > 500) {
        PORTB toggle(0);
        ms_since = ms_current;
    }
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
    if (digitalRead('b', 2)) {
        // stop
        if (!controller_y) magDataBuffer = CMD_180;
        else magDataBuffer = CMD_STOP;
    }

    // L/R has more dominance control
    if (!magDataBuffer) {
        if (controller_x == 0) {
            magDataBuffer = CMD_LEFT;
        } else if (controller_x == 1) {
            magDataBuffer = CMD_RIGHT;
        }
    }

    // F/W second priority
    if (!magDataBuffer) {
        if (controller_y == 0) {
            magDataBuffer = CMD_BACK;
        } else if (controller_y == 1) {
            magDataBuffer = CMD_FORWARD;
        }        
    }
}

// get digital reading
uint8_t digitalRead(char port, uint8_t pin) {
    return PINB & (1<<pin);
}