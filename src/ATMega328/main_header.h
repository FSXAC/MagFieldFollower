// header preprocessor constants
#define _BAUD 19200UL
#define FOSC 16000000UL
#define _UBRR (FOSC/16)/_BAUD - 1 // Used for UBRRL and UBRRH
#define _DATA 0x03 // Number of data bits in frame = byte tranmission
#define TX_START() UCSR0B |= _BV(TXEN0)  // Enable TX
#define TX_STOP()  UCSR0B &= ~_BV(TXEN0) // Disable TX
#define RX_START() UCSR0B |= _BV(RXEN0)  // Enable RX
#define RX_STOP()  UCSR0B &= ~_BV(RXEN0) // Disable RX
#define delay(x) _delay_ms(x) // short hand for _delay_ms
#define turnOff(x) &=~(1<<x)
#define turnOn(x) |=(1<<x)
#define toggle(x) ^=(1<<x)

// pin definitions
#define LED_PIN 0x01
#define WIRE_PIN 0x02

// useful definitions
#define HIGH 1
#define LOW 0
#define BYTE_TO_BINARY_PATTERN "%c%c%c%c%c%c%c%c"
#define BYTE_TO_BINARY(byte)  \
  (byte & 0x80 ? '1' : '0'), \
  (byte & 0x40 ? '1' : '0'), \
  (byte & 0x20 ? '1' : '0'), \
  (byte & 0x10 ? '1' : '0'), \
  (byte & 0x08 ? '1' : '0'), \
  (byte & 0x04 ? '1' : '0'), \
  (byte & 0x02 ? '1' : '0'), \
  (byte & 0x01 ? '1' : '0') 

// main functions
void setup(void);
void loop(void);

// timer/isr functions
void timer_init(void);

// mag functions
void setMagData(unsigned char new_data);
void transmit(void);

// usart function prototypes for serial
void usart_init(void);
char usart_getchar( void );
void usart_putchar( char data );
void usart_pstr(char *s);
unsigned char usart_kbhit(void);
int usart_putchar_printf(char var, FILE *stream);

// adc functions
uint16_t adc_read(uint8_t adcx);
void adc_init(void);

// user functions
void pinMode(char port, unsigned char pin);
uint8_t mapDigital(uint16_t adc, uint16_t low, uint16_t high);
void getInput(void);

