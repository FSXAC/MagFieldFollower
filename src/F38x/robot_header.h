#define SYSCLK    48000000L // SYSCLK frequency in Hz
#define BAUDRATE  115200L   // Baud rate of UART in bps

// motor pins
#define MOTOR_LEFT0 P1_5
#define MOTOR_LEFT1 P1_6
#define MOTOR_RIGHT0 P2_0
#define MOTOR_RIGHT1 P2_1

// ADC read pins
#define TANK_FL LQFP32_MUX_P2_3
#define TANK_FR LQFP32_MUX_P2_4
#define TANK_RL LQFP32_MUX_P2_5
#define TANK_RR LQFP32_MUX_P2_6

// Command receiving
#define COMMAND_PIN P1_1
#define	CMDFRQ 70

// Commands
#define CMD_NONE 0
#define CMD_LEFT 1
#define CMD_RIGHT 2
#define CMD_FORWARD 3
#define CMD_REVERSE 4
#define CMD_STOP 5
#define CMD_UTURN 6

// Robot states
#define FORWARD_STATE 1
#define REVERSE_STATE 2
#define STOP_STATE 3
#define DEBUG_STATE 4


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
unsigned char readData(void);
void forward_backward(unsigned char direction);
void linetrack(int forwardbackward);
void stopcar(void);
void turncar(int leftright);
void uturn(void);
void movecar (int forback, int power);