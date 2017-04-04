#define F_CPU 16000000UL
#define TX_BITS 3
#define TX_BIT_DELAY 50
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
int main(void) {
	setup(); 
	while (1) {
		loop();
	}
}

// runs once
void setup(void) {
    // initialize usart
    usart_init();
    //printf("Hello World!\n");

    // initialize some pins
    // set direction of port/pin
    pinMode('b', 0);
    pinMode('b', 1);
	
	// output for LCD pins
	DDRD |= 0xFC;

    // set pin for input
    // pin 2 for one input
    DDRB &= ~(1<<PB2);

    // Turn on timer 0 for square output
    timer_init();

    // turn on ADC
    adc_init();
    PORTB turnOff(1);
    
    // initialize LCD
	LCD_4BIT();
	LCDprint("TRANSMITTER", 1, 1);
}

// loop forever
void loop(void) {
    // get milliseconds

    ms_current = millis();

    // executed every 1 seconds
    if (ms_current - ms_since > TX_PERIOD) {
        // get control inputs
        magDataBuffer = getInput();
		
		// output to LCD
		switch(magDataBuffer) {
			case CMD_FORWARD:
				LCDprint("FORWARD", 2, 1); break;
			case CMD_BACK:
				LCDprint("REVERSE", 2, 1); break;
			case CMD_LEFT:
				LCDprint("LEFT TURN", 2, 1); break;
			case CMD_RIGHT:
				LCDprint("RIGHT TURN", 2, 1); break;
			case CMD_STOP:
				LCDprint("STOP!!", 2, 1); break;
			case CMD_180:
				LCDprint("TURN AROUND", 2, 1); break;
			default:
				LCDprint("Awaiting Command", 2, 1); break;
		}
		
        if (magDataBuffer) {
            //printf("TRANSMITTING COMMAND 0x%02x\n", magDataBuffer);
            transmit(magDataBuffer);
            ms_since = ms_current;
        }
    }
}

// delay milliseconds functions
void delayms(uint16_t count) {
    while(count--) delay(1);
}

// delay microseconds functions
void delayus(uint16_t count) {
    while(count--) _delay_us(1);
}

// transmission function
void transmit(uint8_t command) {
    uint8_t i = 0;
    
    // send initial bits
    setMagEnabled(0);
    delay(TX_BIT_DELAY);
    setMagEnabled(1);
    delay(TX_BIT_DELAY);

    // send command bits
    for (; i < TX_BITS; i++) {
        // set magnetic signal on or off
        setMagEnabled((command >> (TX_BITS-i-1)) & 1);

        // use the LED pin to indicate if transmission
        if (!getMagEnabled()) PORTB turnOn(0);
        else PORTB turnOff(0);

        // delay in the signal
        delay(TX_BIT_DELAY);
    }
    setMagEnabled(1);
    delay(TX_PERIOD);
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
        return CMD_STOP;
    }

    // 180
    if (PINC & (1<<2)) {
        return CMD_180;
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