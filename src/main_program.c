// include libararies
#include <avr/io.h>
#include <stdio.h>

// header preprocessor constants
#define _BAUD 19200UL
#define FOSC 16000000UL
#define _UBRR (FOSC/16)/_BAUD - 1 // Used for UBRRL and UBRRH
#define _DATA 0x03 // Number of data bits in frame = byte tranmission
#define TX_START() UCSR0B |= _BV(TXEN0)  // Enable TX
#define TX_STOP()  UCSR0B &= ~_BV(TXEN0) // Disable TX
#define RX_START() UCSR0B |= _BV(RXEN0)  // Enable RX
#define RX_STOP()  UCSR0B &= ~_BV(RXEN0) // Disable RX

// main functions
void setup(void);
void loop(void);

// usart function prototypes for serial
void usart_init(void);
char usart_getchar( void );
void usart_putchar( char data );
void usart_pstr(char *s);
unsigned char usart_kbhit(void);
int usart_putchar_printf(char var, FILE *stream);

// program starts here
int main(void) {setup(); while (1) loop();}

// runs once
void setup(void) {
    int j;

    // initialize usart
    usart_init();
    printf("Hello World!\n");

    // print some numbers
    for (j = 0; j<10; j++) printf("square(j)=%d\n", j*j);
}

// runs forever
void loop(void) {
    // do nothing
}