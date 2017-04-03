#define SYSCLK    48000000L // SYSCLK frequency in Hz
#define BAUDRATE  115200L   // Baud rate of UART in bps

#define MOTOR_LEFT0 P1_5
#define MOTOR_LEFT1 P1_6
#define MOTOR_RIGHT0 P2_0
#define MOTOR_RIGHT1 P2_1

#define COMMAND_PIN P1_1
#define	CMDFRQ 70

// ===[FUNCTION PROTOTYPES]===
// system functions
char _c51_external_startup(void);

// timing functions
void Timer3us(unsigned char us);
void waitms (unsigned int ms);

// adc functions
void InitADC(void);
void InitPinADC(unsigned char portno, unsigned char pinno);
unsigned int ADC_at_Pin(unsigned char pin);
float Volts_at_Pin(unsigned char pin);

// robot control functions
void readData(void);
void forward_backward(unsigned char direction);
void linetrack(int forwardbackward);
void stopcar(void);
void turncar(int leftright);
void uturn(void);