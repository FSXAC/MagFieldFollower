#define F_CPU 16000000UL
#define TX_BITS 8
#define TX_BIT_DELAY 70
#define TX_PERIOD (TX_BIT_DELAY*TX_BITS*2)

// include libararies
#include <avr/io.h>
#include <stdio.h>
#include <util/delay.h>
#include "main_header.h"

// global constants
uint8_t magDataBuffer;
uint8_t controller_x, controller_y, controller_sw;
uint32_t ms_current, ms_since;

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

// loop forever
void loop(void) {
    // get milliseconds
    ms_current = millis();

    // get control inputs
    magDataBuffer = getInput();
    if (magDataBuffer) {
        // executed every 1 seconds
        if (ms_current - ms_since > TX_PERIOD) {
            transmit(magDataBuffer);
            ms_since = ms_current;
        }
    }
}

// transmission function
void transmit(uint8_t command) {
    uint8_t i = 0;
    for (; i < 8; i++) {
        // set magnetic signal on or off
        setMagEnabled((command >> (TX_BITS-i)) & 1);

        // use the LED pin to indicate if transmission
        if (getMagEnabled()) PORTB turnOn(0);
        else PORTB turnOff(0);

        // delay in the signal
        delay(TX_BIT_DELAY);
    }
}

// set pin output
void pinMode(char port, uint8_t pin) {
    switch (port) {
        case 'b': DDRB |= (1<<pin); return;
        case 'c':
            if (pin < 7) DDRC |= (1<<pin); 
            return;
        case 'd': DDRD |= (1<<pin); return;
        default: return;
    }
}

// convert adc into a digital signal
uint8_t mapDigital(uint16_t adc, uint16_t low, uint16_t high) {
    return (adc < low) ? 0 : (adc > high) ? 1 : 2;
}

// parse ADC into direction
uint8_t getInput(void) {
    controller_x = mapDigital(adc_read(0), 180, 800);
    controller_y = mapDigital(adc_read(1), 300, 700);
    controller_sw = PORTD & 0x80;

    // parse control into commands
    if (digitalRead('b', 2)) {
        // stop
        if (!controller_y) return CMD_180;
        else return CMD_STOP;
    }

    // L/R has more dominance control
    if (controller_x == 0) return CMD_LEFT;
    else if (controller_x == 1) return CMD_RIGHT;

    // F/W second priority
    if (controller_y == 0) return CMD_BACK;
    else if (controller_y == 1) return CMD_FORWARD;

    // return 0 by default
    return 0;
}

// get digital reading
uint8_t digitalRead(char port, uint8_t pin) {
    return PINB & (1<<pin);
}