// timer c file that includes timer interrupts
#include <avr/io.h>
#include <avr/interrupt.h>
#include "main_header.h"

// ===[global variables]===
unsigned int counter = 0;

// ===[interrupt service routine]===
ISR(TIMER1_OVF_vect) {
    counter++;
    if (counter > 1) {
        counter = 0;

        // toggle pin 15
        PORTB ^= 0x02;
    }
}
