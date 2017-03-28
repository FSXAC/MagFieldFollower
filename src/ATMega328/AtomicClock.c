// This is a experimental program designed 
// based on gist.github.com/adnbr

// 16MHz clock
#define F_CPU 16000000UL

// CTC match value in OCR1A
#define CTC_MATCH_OVERFLOW ((F_CPU/1000)8)

// libraries
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/atomic.c>

// used to keep track milliseconds
volatile unsigned long timer1_millis;
long milliseconds_since;

// ===[Interrupt Service Routine]===
ISR(TIMER1_COMPA_vect) {
    timer1_millis++;
}

// millis function
unsigned long millis() {
    unsigned long millis_return;

    // the following cannot be disrupted
    ATOMIC_BLOCK(ATOMIC_FORCEON) {
        millis_return = timer1_millis;
    }

    return millis_return;
}

// this flashing LED function will execute every 1000 milliseconds
void second(void) {
    unsigned long milliseconds_current = millis();
    if (milliseconds_current - milliseconds_since > 1000) {

        // toggle LED on and off
        PORTB ^= 0x01;

        // update milliseconds
        milliseconds_since = milliseconds_current;
    }
}

// main function
void main(void) {
    // set pin mode
    DDRB |= 0x01;

    // ===[Initial timer 1]===
    // CTC (Clear Timer on Compare) mode, Clk/8 prescaling
    TCCR1B |= (1<<WGM12) | (1<<CS11);

    // Load high byte and low byte
    OCR1AH = (CTC_MATCH_OVERFLOW >> 8);
    OCR1AL = CTC_MATCH_OVERFLOW;

    // enable compare match interrupt
    TIMSK1 |= (1<<OCIE1A);

    // enable global interrupt
    sei();

    // forever loop
    while (1) {
        second();
    }
}