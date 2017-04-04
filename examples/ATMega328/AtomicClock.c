/* Counting Milliseconds with Timer1
 * ---------------------------------
 * For more information see
 * http://www.adnbr.co.uk/articles/counting-milliseconds
 *
 * 620 bytes - ATmega168 - 16MHz
 */

// 16MHz Clock
#define F_CPU 16000000UL
 
// Calculate the value needed for 
// the CTC match value in OCR1A.
#define CTC_MATCH_OVERFLOW ((F_CPU / 1000) / 8) 
 
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/atomic.h>
 
volatile unsigned long timer1_millis;
long milliseconds_since;
 
ISR (TIMER1_COMPA_vect)
{
    timer1_millis++;
}

unsigned long millis ()
{
    unsigned long millis_return;

    // Ensure this cannot be disrupted
    ATOMIC_BLOCK(ATOMIC_FORCEON) {
        millis_return = timer1_millis;
    }
 
    return millis_return;
}

void flash_led ()
{
    unsigned long milliseconds_current = millis();

    if (milliseconds_current - milliseconds_since > 1000) {
        // LED connected to PC0/Analog 0
        PORTC ^= (1 << PC0);
        milliseconds_since = milliseconds_current;
    }
}
 
int main(void)
{
    // CTC mode, Clock/8
    TCCR1B |= (1 << WGM12) | (1 << CS11);
 
    // Load the high byte, then the low byte
    // into the output compare
    OCR1AH = (CTC_MATCH_OVERFLOW >> 8);
    OCR1AL = CTC_MATCH_OVERFLOW;
 
    // Enable the compare match interrupt
    TIMSK1 |= (1 << OCIE1A);
    
    // PC0/Analog 0 to Output
    DDRC |= (1 << PC0);

    // Now enable global interrupts
    sei();
 
    while (1)
    {
        flash_led();
    }
}