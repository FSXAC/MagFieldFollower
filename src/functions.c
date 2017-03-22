// include libararies
#include <avr/io.h>
#include <stdio.h>

// I'm not exactly sure what this line does
static FILE mystdout = FDEV_SETUP_STREAM(usart_putchar_printf, NULL, _FDEV_SETUP_WRITE);

// initialize UART for SPI output
void usart_init(void) {
    // setup our stdio stream
    stdout = &mystdout;

    // Not necessary; initialize anyway (LOL)
    DDRD |= _BV(PD1);
    DDRD &= ~_BV(PD0);

    // Set baud rate; lower byte and top nibble
    UBRR0H = ((_UBRR) & 0xF00);
    UBRR0L = (uint8_t) ((_UBRR) & 0xFF);

    // start sending and listening
    TX_START();
    RX_START();

    // Set frame format = 8-N-1
    UCSR0C = (_DATA << UCSZ00);
}

