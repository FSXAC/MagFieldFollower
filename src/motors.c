//  square.c: Uses timer 2 interrupt to generate a square wave in pin
//  P2.0 and a 75% duty cycle wave in pin P2.1
//  Copyright (c) 2010-2015 Jesus Calvino-Fraga
//  ~C51~

#include <C8051F38x.h>
#include <stdlib.h>
#include <stdio.h>

#define SYSCLK    48000000L // SYSCLK frequency in Hz
#define BAUDRATE  115200L   // Baud rate of UART in bps

#define MOTOR_LEFT0 P1_5
#define MOTOR_LEFT1 P1_6
#define MOTOR_RIGHT0 P2_0
#define MOTOR_RIGHT1 P2_1

#define COMMAND_PIN P1_1

#define	CMDFRQ 70  				//frequency of signal, time to wait in between each bit of received signal

volatile  char pwm_count=0;
volatile  char mode = 0;
volatile  char pwm_both =0;
volatile  char pwm_Left0 = 0; //p1.5
volatile  char pwm_Left1 = 0; //p1.6
volatile  char pwm_Right0 = 0; //p2.0
volatile  char pwm_Right1 = 0; //p2.1
volatile  char direction = 0; // 1 for back 0 for forward

volatile  char currentcmd = 0;
volatile  char currentstate = 1;



char _c51_external_startup (void)
{
	PCA0MD&=(~0x40) ;    // DISABLE WDT: clear Watchdog Enable bit
	VDM0CN=0x80; // enable VDD monitor
	RSTSRC=0x02|0x04; // Enable reset on missing clock detector and VDD

	// CLKSEL&=0b_1111_1000; // Not needed because CLKSEL==0 after reset
	#if (SYSCLK == 12000000L)
		//CLKSEL|=0b_0000_0000;  // SYSCLK derived from the Internal High-Frequency Oscillator / 4
	#elif (SYSCLK == 24000000L)
		CLKSEL|=0b_0000_0010; // SYSCLK derived from the Internal High-Frequency Oscillator / 2.
	#elif (SYSCLK == 48000000L)
		CLKSEL|=0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
	#else
		#error SYSCLK must be either 12000000L, 24000000L, or 48000000L
	#endif
	OSCICN |= 0x03; // Configure internal oscillator for its maximum frequency

	// Configure UART0
	SCON0 = 0x10;
#if (SYSCLK/BAUDRATE/2L/256L < 1)
	TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	CKCON |=  0x08;
#elif (SYSCLK/BAUDRATE/2L/256L < 4)
	TH1 = 0x10000-(SYSCLK/BAUDRATE/2L/4L);
	CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 01
	CKCON |=  0x01;
#elif (SYSCLK/BAUDRATE/2L/256L < 12)
	TH1 = 0x10000-(SYSCLK/BAUDRATE/2L/12L);
	CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 00
#else
	TH1 = 0x10000-(SYSCLK/BAUDRATE/2/48);
	CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 10
	CKCON |=  0x02;
#endif
	TL1 = TH1;      // Init Timer1
	TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
	TMOD |=  0x20;
	TR1 = 1; // START Timer1
	TI = 1;  // Indicate TX0 ready

	// Configure the pins used for square output
	P2MDOUT|=0b_0000_0011;
	P0MDOUT |= 0x10; // Enable UTX as push-pull output
	XBR0     = 0x01; // Enable UART on P0.4(TX) and P0.5(RX)
	XBR1     = 0x40; // Enable crossbar and weak pull-ups

	// Initialize timer 2 for periodic interrupts
	TMR2CN=0x00;   // Stop Timer2; Clear TF2;
	CKCON|=0b_0001_0000;
	TMR2RL=(-(SYSCLK/(2*48))/(100L)); // Initialize reload value
	TMR2=0xffff;   // Set to reload immediately
	ET2=1;         // Enable Timer2 interrupts
	TR2=1;         // Start Timer2

	EA=1; // Enable interrupts

	return 0;
}


void Timer3us(unsigned char us)
{
	unsigned char i;               // usec counter
	
	// The input for Timer 3 is selected as SYSCLK by setting T3ML (bit 6) of CKCON:
	CKCON|=0b_0100_0000;
	
	TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	
	TMR3CN = 0x04;                 // Sart Timer3 and clear overflow flag
	for (i = 0; i < us; i++)       // Count <us> overflows
	{
		while (!(TMR3CN & 0x80));  // Wait for overflow
		TMR3CN &= ~(0x80);         // Clear overflow indicator
	}
	TMR3CN = 0 ;                   // Stop Timer3 and clear overflow flag
}

void waitms (unsigned int ms)
{
	unsigned int j;
	for(j=ms; j!=0; j--)
	{
		Timer3us(249);
		Timer3us(249);
		Timer3us(249);
		Timer3us(250);
	}
}


void Timer2_ISR (void) interrupt 5
{
	TF2H = 0; // Clear Timer2 interrupt flag

	pwm_count++;
	if(pwm_count>100) pwm_count=0;

// To fully turn off one pin pass -1 to their pwm_***
	MOTOR_LEFT0 = pwm_count > pwm_Left0 ? 0 : 1; //p1.5
	MOTOR_LEFT1 = pwm_count > pwm_Left1 ? 0 : 1; //p1.6
	MOTOR_RIGHT0 = pwm_count > pwm_Right0 ? 0 : 1; //p2.0
	MOTOR_RIGHT1 = pwm_count > pwm_Right1 ? 0 : 1; //p2.1
}

/* Program that controls forward/reverse direction of the robot.
	Parameters
	pwm_both: the value of pwm that controls speed of motors
	direction: flag to set whether robot goes forwards(0) or backwards(1). */
void forward_backward(unsigned char direction)
{

	if (direction == 0) { //p2.1,1.6 on
		pwm_Left0 = pwm_Right0 = -1;
		pwm_Left1 = pwm_Right1 = pwm_both;  //MOTOR_LEFT1 = MOTOR_RIGHT1 = pwm_both;
	}

	else if (direction == 1) { //p2.0,1.5 on
		pwm_Left1 = pwm_Right1 = -1;
		pwm_Left0 = pwm_Right0 = pwm_both; 
		//MOTOR_LEFT0 = MOTOR_RIGHT0 = pwm_both;
		//MOTOR_LEFT1 = MOTOR_RIGHT1 = 0;
	}

}
void InitADC (void)
{
	// Init ADC
	ADC0CF = 0xF8; // SAR clock = 31, Right-justified result
	ADC0CN = 0b_1000_0000; // AD0EN=1, AD0TM=0
  	REF0CN = 0b_0000_1000; //Select VDD as the voltage reference for the converter
}

void InitPinADC (unsigned char portno, unsigned char pinno)
{
	unsigned char mask;
	
	mask=1<<pinno;
	
	switch (portno)
	{
		case 0:
			P0MDIN &= (~mask); // Set pin as analog input
			P0SKIP |= mask; // Skip Crossbar decoding for this pin
		break;
		case 1:
			P1MDIN &= (~mask); // Set pin as analog input
			P1SKIP |= mask; // Skip Crossbar decoding for this pin
		break;
		case 2:
			P2MDIN &= (~mask); // Set pin as analog input
			P2SKIP |= mask; // Skip Crossbar decoding for this pin
		break;
		case 3:
			P3MDIN &= (~mask); // Set pin as analog input
			P3SKIP |= mask; // Skip Crossbar decoding for this pin
		break;
		default:
		break;
	}
}

unsigned int ADC_at_Pin(unsigned char pin)
{
	AMX0P = pin;             // Select positive input from pin
	AMX0N = LQFP32_MUX_GND;  // GND is negative input (Single-ended Mode)
	// Dummy conversion first to select new pin
	AD0BUSY=1;
	while (AD0BUSY); // Wait for dummy conversion to finish
	// Convert voltage at the pin
	AD0BUSY = 1;
	while (AD0BUSY); // Wait for conversion to complete
	return (ADC0L+(ADC0H*0x100));
}

float Volts_at_Pin(unsigned char pin)
{
	 return ((ADC_at_Pin(pin)*3.30)/1024.0);
}


void readData (void) {
	int commandflag = 1;					//determines if there's a real command coming in or not
	
	if (COMMAND_PIN == 0) {					//0---
		waitms(CMDFRQ*1.5);
		if (COMMAND_PIN == 1) {				//01--
			waitms(CMDFRQ);
			if (COMMAND_PIN == 0) {			//010-
				waitms(CMDFRQ);
				if (COMMAND_PIN == 0) {		//0100	
					currentcmd = 4;
					commandflag = 0;
				}
				else {						//0101
					currentcmd = 5;
					commandflag = 0;
				}
			}
			else {							//011-
				waitms(CMDFRQ);
				if (COMMAND_PIN == 0) {		//0110
					currentcmd = 6;
					commandflag = 0;
				}
			}
		}
		else {								//00--
			waitms(CMDFRQ);
			if (COMMAND_PIN == 1) {			//001-
				waitms(CMDFRQ);
				if (COMMAND_PIN == 1) {		//0011
					currentcmd = 3;
					commandflag = 0;
				}
				else {						//0010
					currentcmd = 2;
					commandflag = 0;
				}
			}
			else {							//000-
				waitms(CMDFRQ);
				if (COMMAND_PIN == 1) {		//0001	
					currentcmd == 1;
					commandflag = 0;
				}
				else {						//0000 this is no signal, set commandflag to 1 and go back to main loop
					commandflag = 1;
				}
			}
		}
		printf("current command is %d, commandflag = %d\r\n", currentcmd, commandflag);		
	}
	
	
	//if (COMMAND_PIN) printf("TRIGGERED!\n");
	
	if (commandflag == 0) {					//only wait for signal to end if a command has been received. 
		while (COMMAND_PIN == 0) {}
	}
}


void linetrack (int forwardbackward) {
	volatile float vleft;
	volatile float vright;
	
	vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
	vright=Volts_at_Pin(LQFP32_MUX_P2_4);
	
	pwm_Left0 = -1;
//	pwm_Left1 = vright*100/(vright+vleft);
	pwm_Left1 = vright*vright*75/(vright*vright+vleft*vleft);
	pwm_Right1 = -1;
//	pwm_Right0 = vleft*100/(vright+vleft);
	pwm_Right0 = vleft*vleft*75/(vright*vright+vleft*vleft);
	
	if (forwardbackward) {
//		pwm_Left0 = vleft*75/(vleft+vright);
//		pwm_Left1 = -1;
//		pwm_Right1 = vright*75/(vleft+vright);
//		pwm_Right0 = -1;
//		if (pwm_Left0 > 40) {
//			pwm_Right0 = pwm_Right1;
//			pwm_Right1 = -1;
//		}
//		if (pwm_Right1 > 40) {
//			pwm_Left1 = pwm_Left0;
//			pwm_Left0 = -1;
//		}

//		if ((vleft - vright) < 0.2 && (vleft - vright) > -0.2) {
//			pwm_Left1 = -1;
//			pwm_Left0 = 25;
//			pwm_Right1 = 25;
//			pwm_Right0 = -1;
//			waitms(300);
//		}
//				
//		else if (vleft > vright) {
//			pwm_Left1 = -1;
//			pwm_Left0 = 25;
//			pwm_Right1 = -1;
//			pwm_Right0 = -1;
//			waitms(300);
//		}
//		else {
//			pwm_Left1 = -1;
//			pwm_Left0 = -1;
//			pwm_Right1 = 25;
//			pwm_Right0 = -1;
//			waitms(300);
//		} 

		if (vleft > 1) {
			pwm_Left1 = -1;
			pwm_Left0 = -1;
			pwm_Right1 = 25;
			pwm_Right0 = -1;
			waitms(200);
			while (vright < 1);
		}
		else if (vright > 1) {
			pwm_Left1 = -1;
			pwm_Left0 = 25;
			pwm_Right1 = -1;
			pwm_Right0 = -1;
			waitms(400);
			while (vleft < 1);
		}		
		else {
			pwm_Left1 = -1;
			pwm_Left0 = 25;
			pwm_Right1 = 25;
			pwm_Right0 = -1;
		}
	}
	
	printf("2.3 = %f, 2.4 = %f, LeftMotor = %4d, RightMotor = %4d, command: %d\r\n", vleft, vright, pwm_Left0, pwm_Right1, currentcmd);
	
}

void stopcar () {
	pwm_Left1 = -1;
	pwm_Right1 = -1;
	pwm_Left0 = -1;
	pwm_Right0 = -1;
}

void turncar (int leftright) {
	volatile float vleft;
	volatile float vright;
			
	pwm_Left0 = -1;
	pwm_Left1 = -1;
	pwm_Right0 = -1;
	pwm_Right1 = -1;


	if (leftright == 0) {
		//turn left
		pwm_Right0 = 50;
		
		waitms(1000);
	
		vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
		vright=Volts_at_Pin(LQFP32_MUX_P2_4);
		
		while (((vleft - vright) > 0.2) || ((vleft - vright) < (-0.2))) {
			//get voltages
			vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
			vright=Volts_at_Pin(LQFP32_MUX_P2_4);
			//linetrack(0); this worked but only for left and right turns
		}
	
		pwm_Right0 = -1; 		
	}
	
	else if (leftright == 1) {
		//turn right
		pwm_Left1 = 50;
				
		waitms(1000);
	
		vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
		vright=Volts_at_Pin(LQFP32_MUX_P2_4);
		
		while (((vleft - vright) > 0.2) || ((vleft - vright) < (-0.2))) {
			//get voltages
			vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
			vright=Volts_at_Pin(LQFP32_MUX_P2_4);
			//linetrack(0); 
		}
	
		pwm_Left1 = -1; 
	}
}

void uturn () {
	volatile float vleft;
	volatile float vright;
	
	vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
	vright=Volts_at_Pin(LQFP32_MUX_P2_4);
	
	pwm_Left0 = -1;
	pwm_Left1 = 50;
	pwm_Right0 = -1;
	pwm_Right1 = 50;
	
	waitms(4000);
	
	while (((vleft - vright) > 0.2) || ((vleft - vright) < (-0.2))) {
			//get voltages
		vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
		vright=Volts_at_Pin(LQFP32_MUX_P2_4);
	}
}	

void main (void)
{
	
   MOTOR_LEFT0 =0;
   MOTOR_LEFT1 =0;
   MOTOR_RIGHT0 =0;
   MOTOR_RIGHT1 =0;
   
   currentstate = 1;  	//initialize the car to be stopped
   currentcmd = 0;		//initialize the command to be null


	printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
//	printf("Square wave generator for the F38x.\r\n"
//	       "Check pins P2.1 and P2.2 with the oscilloscope.\r\n");
//	printf("Please enter motors mode 1-6\n");
//	scanf("%d \n",&mode);
//	if(mode == 1) {printf("Enter pwm and direction\n"); scanf("%d %d",&pwm_both, &direction);forward_backward(direction); }
 //   if(mode == 2) {printf("Stop mode triggered"); pwm_both = -1;forward_backward(direction); }
    //printf("%d\n", pwm_Left1);
    
    InitPinADC(2, 3); // Configure P2.3 as analog input
	InitPinADC(2, 4); // Configure P2.4 as analog input
	InitPinADC(1, 0);
	InitADC();

	while(1)
	{	
		readData(); //check for incoming commands
		
		//printf("adc readings = %f\r\n", Volts_at_Pin(LQFP32_MUX_P1_0));
	   	//printf("%d\r\n",(P1_1 ? 1 : 0));
	   	//puts(P1_0 ? '1' : '0');
	   	//while(P1_1 !=0);
	   	//printf("1\r\n");
	   	//while(P1_1 !=1);
	   	//printf("0\r\n");
	   	
	   	
	   	
		switch (currentstate) {
			case 1:
				linetrack(0);	//forwards
				break;
			case 2:
				linetrack(1);	//backwards
				break;
			case 3:
				stopcar();		//stop car
				break;
		}
				
		switch (currentcmd) {
			//case for left turn
			case 0 :
				//if moving forward, and hits an intersection with no commands, move forwards. 
				if (currentstate == 1) {
					if (Volts_at_Pin(LQFP32_MUX_P2_3) > 1 && Volts_at_Pin(LQFP32_MUX_P2_4) > 1) {
						//printf("\n\r reached intersection :D");
						pwm_Left1 = 35;
						pwm_Left0 = -1;
						pwm_Right0 = 35;
						pwm_Right1 = -1;						
						waitms(1500);
					}
				}
				break;
			case 1 :
				//check for intersections
				if (Volts_at_Pin(LQFP32_MUX_P2_3) > 1 && Volts_at_Pin(LQFP32_MUX_P2_4) > 1) {
						//printf("\n\r reached intersection :D");
						pwm_Left1 = 35;
						pwm_Left0 = -1;
						pwm_Right0 = 35;
						pwm_Right1 = -1;						
						waitms(1500);
					//if at intersection {
						turncar(0); //0 = left
						currentcmd = 0;
					//}
					} 
				break;
			//---------------------------------//	
			//case for right turn			
			case 2 :
				//check for intersection
				if (Volts_at_Pin(LQFP32_MUX_P2_4) > 1 || Volts_at_Pin(LQFP32_MUX_P2_3) > 1) {
						printf("\n\r reached intersection :D");
						pwm_Left1 = 35;
						pwm_Left0 = -1;
						pwm_Right0 = 35;
						pwm_Right1 = -1;
						waitms(1500);
					//if at intersection {
						turncar(1); //1 = right
						currentcmd = 0;
					} 
				break;
			//---------------------------------//
			//case for forwards
			case 3 :
				currentstate = 1;
				currentcmd = 0;
				break;
			//---------------------------------//
			//case for backwards
			case 4 :
				currentstate = 2;
				currentcmd = 0;
				break;
			//---------------------------------//
			//case for stop
			case 5 :
				currentstate = 3;
				currentcmd = 0;
				break;
			//---------------------------------//	
			//case for 180 turn 
			case 6 :
				uturn();  //uturn
				currentcmd = 0;
				break;
			default: 
				currentstate = 1;
		}
			
		
		
	  //	switch(mode)
	  //	{
	  //		//forward_backward mode
      //			case 1 : forward_backward(direction);

	  //	}
	 //printf("%d\n",MOTOR_LEFT0);

	}
}
