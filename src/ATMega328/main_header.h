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

// timer controls
// turning timer 1 or timer 0 on or off
#define TIMER0_ENABLED
#define TIMER1_ENABLED
// #define TIMER2_ENABLED

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

// commands
#define CMD_LEFT 0x01
#define CMD_RIGHT 0x02
#define CMD_FORWARD 0x03
#define CMD_BACK 0x04
#define CMD_STOP 0x05
#define CMD_180 0x06

// main functions
void setup(void);
void loop(void);

// timer/isr functions
void timer_init(void);
unsigned long millis(void);
void setMagEnabled(uint8_t enabled);
uint8_t getMagEnabled(void);
void delayms(uint16_t count);
void delayus(uint16_t count);

// mag functions
void transmit(uint8_t command);

// user functions
void pinMode(char port, unsigned char pin);
uint8_t getInput(void);
uint8_t mapDigital(uint16_t adc, uint16_t low, uint16_t high);
uint8_t digitalRead(char port, uint8_t pin);

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

// sound functions
// void buzz(float duration, float period);
// void alert(void);
void note(int n, int octave);

void LCD_pulse (void);
void LCD_byte (unsigned char x);
void WriteData (unsigned char x);
void WriteCommand (unsigned char x);
void LCD_4BIT (void);
void LCDprint(char * string, unsigned char line, uint8_t clear);



