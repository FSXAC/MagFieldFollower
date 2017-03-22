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

// write a single character
void usart_putchar(char data) {
    // Wait for empty transmit buffer
    while (!(UCSR0A & (_BV(UDRE0))));

    // Start transmission of data
    UDR0 = data;
}

// read a single character
char usart_getchar(void) {
    // Wait for incoming data
    while (!(UCSR0A & (_BV(RXC0)))); 

    // Return received data
    return UDR0; 
}

// WTF is this shit?
unsigned char usart_kbhit(void) {
    //return nonzero if char waiting polled version
    return (UCSR0A & (1<<RXC0)) ? 1 : 0; 
}

// write a string
void usart_pstr(char *s) {
    // loop through entire string
    while (*s) {
        usart_putchar(*s);
        s++;
    }
}

// what???
int usart_putchar_printf(char var, FILE *stream) {
    // translate \n to \r + \n
    if (var == '\n') usart_putchar('\r'); 
    usart_putchar(var);
    return 0;
}