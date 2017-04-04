// ELEC 291 Project 2

#include <C8051F38x.h>
#include <stdlib.h>
#include <stdio.h>
#include "robot_header.h"

volatile char pwm_count=0;
volatile char mode = 0;
volatile char pwm_both =0;
volatile char pwm_Left0 = 0; //p1.5
volatile char pwm_Left1 = 0; //p1.6
volatile char pwm_Right0 = 0; //p2.0
volatile char pwm_Right1 = 0; //p2.1
volatile char direction = 0; // 1 for back 0 for forward

volatile char currentcmd = 0;
volatile char currentstate = 1;

unsigned char overflow_count;
volatile float time = 0.0f;
volatile float distance = 0.0f;

void main(void) {
	//VARIABLES FOR VOLTAGES
	volatile float v1 = 0;
	volatile float v2 = 0;

  	MOTOR_LEFT0 = 0;
   	MOTOR_LEFT1 = 0;
   	MOTOR_RIGHT0 = 0;
   	MOTOR_RIGHT1 = 0;
   
   	//INITIAL STATE
   	currentstate = 1;  	//1-FORWARD, 2-BACKWARDS, 3-STOPPED, 4-DEBUGGER
   	currentcmd = 0;		//0-NO COMMAND, 1-TURN LEFT, 2-TURN RIGHT, 3-FORWARDS, 4-BACKWARDS, 5-STOP, 6-UTURN

	//CLEAR PUTTY SCREEN
	//printf("\x1b[2J"); // Clear screen using ANSI escape sequence.

    //INITIALIZE ADC PINS
    InitPinADC(2, 3); // Configure P2.3 as analog input (tank1)
	InitPinADC(2, 4); // Configure P2.4 as analog input	(tank1)
	InitPinADC(2, 5); // Configure P2.5 as analog input (tank2)
	InitPinADC(2, 6); // Configure P2.6 as analog input (tank2)

	//INITIALIZE ADC
	InitADC();	
	
	mxInit();
	
	//MAIN CODE
	while (1) {	

		//RECEIVE COMMANDS
		currentcmd = readData(currentcmd); 
		
		// FOR DEBUGGING
		//printf("frontL %f frontR %f backL %f backR %f command %1d, state %1d left0 %3d left1 %3d right0 %3d right1 %3d\r", Volts_at_Pin(TANK_FL),Volts_at_Pin(TANK_FR),Volts_at_Pin(TANK_RL),Volts_at_Pin(TANK_RR), currentcmd, currentstate, pwm_Left0, pwm_Left1, pwm_Right0, pwm_Right1);

		// LED Matrix output
		if (currentcmd == CMD_LEFT) mxDirection(0);
		else if (currentcmd == CMD_RIGHT) mxDirection(1);
		else if (currentcmd == CMD_STOP||currentstate == 3) mxStop();
		else if (currentcmd == CMD_UTURN) mxUTurn();
		else if (currentcmd == CMD_NONE) mxClear();

		// collision detection
		Sonar_Reading();
		if (distance < 7) {
			stopcar();
			while (distance < 7) {
				Sonar_Reading();
				mxStop();
			}
		}		 

		// CURRENT STATE
		switch (currentstate) {
			case FORWARD_STATE:
				linetrack(0);	// forwards
				// GET VOLTAGE FROM FRONT TANK CIRCUITS
				v1 = Volts_at_Pin(TANK_FL);
				v2 = Volts_at_Pin(TANK_FR);
				break;
			case REVERSE_STATE:
				linetrack(1);	// backwards
				// GET VOLTAGE FROM REAR TANK CIRCUITS
				v2 = Volts_at_Pin(TANK_RL);
				v1 = Volts_at_Pin(TANK_RR);
				break;
			case STOP_STATE:
				stopcar();		// stop car
				mxStop();
				break;
		}
		
		// CURRENT COMMAND		
		switch (currentcmd) {
			//case for left turn
			case CMD_NONE:
				// MOVE STRAIGHT THROUGH INTERSECTION WHEN NO COMMANDS
				if ((currentstate-1) ? 
					(v1 > 1.2 && v2 > 1.2) :
					(v1 > 0.7 && v2 > 1)) {
					//printf("\nINTERSECTION\n");

					if (currentstate == 1) {
						if (Volts_at_Pin(TANK_RL)>Volts_at_Pin(TANK_RR)) {
							pwm_Left1 = 50;
							pwm_Left0 = -1;
							pwm_Right0 = 30;
							pwm_Right1 = -1;
						}
						else {
							pwm_Left1 = 30;
							pwm_Left0 = -1;
							pwm_Right0 = 50;
							pwm_Right1 = -1;
						}
					} else if (currentstate == 2) {
						if (Volts_at_Pin(TANK_FL)>Volts_at_Pin(TANK_FR)) {
							pwm_Left0 = 50;
							pwm_Left1 = -1;
							pwm_Right0 = -1;
							pwm_Right1 = 30;
						}
						else {
							pwm_Left0 = 30;
							pwm_Left1 = -1;
							pwm_Right0 = -1;
							pwm_Right1 = 50;
						}
					}												 
			
					waitms(1500);
					
				} 
				break;
			//--------------------------------------------------//	
			case CMD_LEFT:
				/// CHECK FOR INTERSECTION
			//	printf("Turn left at the next intersection\n");
				if (v1 > 0.7 && v2 >1)  {
						//printf("\n\r INTERSECTION\n");

						// 1 for forward left, 2 for reverse left
						turncar(currentstate);
						currentcmd = 0;
				} 
				break;
			//---------------------------------//	
			//case for right turn			
			case CMD_RIGHT:
				//CHECK FOR INTERSECTION
				//printf("\nTurn right at the next intersection\n");
				if (v1 > 0.7 && v2 >1) {
						////printf("\n\r INTERSECTION\n");
						//TURN
						turncar(currentstate + 2); //1 = right
						currentcmd = 0;
					} 
				break;
			//---------------------------------//
			//case for forwards
			case CMD_FORWARD:
				// CHANGE TO FORWARD STATE
				//printf("\nGO!\n");
				currentstate = 1;
				currentcmd = 0;
				break;
			//---------------------------------//
			//case for backwards
			case CMD_REVERSE:
				//CHANGE TO BACKWARDS STATE
				//printf("\nReverse Reverse!\n");
				currentstate = 2;
				currentcmd = 0;
				break;
			//---------------------------------//
			//case for stop
			case CMD_STOP:
				//CHANGE TO STOPPED STATE
				//printf("\nHALT peasants!\n");
				currentstate = 3;
				currentcmd = 0;
				break;
			//---------------------------------//	
			//case for 180 turn 
			case CMD_UTURN:
				mxUTurn();
				uturn();
				//printf("\nUTURN\n");
				currentcmd = 0;
				mxInit(); 
				break;
				
			//DEFAULT TO MOVE FORWARDS
			default: 
				currentstate = 1;
		}
	}
}

void Timer2_ISR (void) interrupt 5 {
	TF2H = 0; // Clear Timer2 interrupt flag

	pwm_count++;
	if(pwm_count>100) pwm_count=0;

	// To fully turn off one pin pass -1 to their pwm_***
	MOTOR_LEFT0 = pwm_count > pwm_Left0 ? 0 : 1; //p1.5
	MOTOR_LEFT1 = pwm_count > pwm_Left1 ? 0 : 1; //p1.6
	MOTOR_RIGHT0 = pwm_count > pwm_Right0 ? 0 : 1; //p2.0
	MOTOR_RIGHT1 = pwm_count > pwm_Right1 ? 0 : 1; //p2.1
}

unsigned char readData(unsigned char prevcommand) {
	unsigned char command = prevcommand;
	if (!COMMAND_PIN) {
		command = 0; 
		while (!COMMAND_PIN);
		waitms((int)(CMDFRQ + CMDFRQ/2));
		command |= COMMAND_PIN<<2;
		waitms(CMDFRQ);
		command |= COMMAND_PIN<<1;
		waitms(CMDFRQ);
		command |= COMMAND_PIN;
		while (!COMMAND_PIN);
		if (command > 6) command = prevcommand; 
		
	}
	return command;
}


//--------------------------------------------------//
// FOLLOW THE LINE
//--------------------------------------------------//
void linetrack (int forwardbackward) {
	// 0 = forward with front, 1 = backward with rear, 2 = forward with rear, 3 = backward with front
	volatile float vleft;
	volatile float vright;
	
	//GET ADC INPUT 

	// line track forward
	if (forwardbackward == 0) {
		vleft=Volts_at_Pin(TANK_FL);
		vright=Volts_at_Pin(TANK_FR);

		// SET PWM DEPENDING ON TANK CIRCUIT VOLTAGES
		pwm_Left0 = -1;
		pwm_Left1 = vright*vright*75/(vright*vright+vleft*vleft);
		pwm_Right1 = -1;
		pwm_Right0 = vleft*vleft*75/(vright*vright+vleft*vleft);
	} else if (forwardbackward == 1) {

		//GET ADC INPUT 
		vleft=Volts_at_Pin(TANK_RL);
		vright=Volts_at_Pin(TANK_RR);
		
		//SET PWM DEPENDING ON TANK CIRCUIT VOLTAGES
		pwm_Left1 = -1;
		pwm_Left0 = vright*vright*75/(vright*vright+vleft*vleft);
		pwm_Right0 = -1;
		pwm_Right1 = vleft*vleft*75/(vright*vright+vleft*vleft);
	}	
}


//--------------------------------------------------//
// STOP
//--------------------------------------------------//
void stopcar(void) {
	//STOP ALL MOTORS
	pwm_Left1 = -1;
	pwm_Right1 = -1;
	pwm_Left0 = -1;
	pwm_Right0 = -1;
}

//--------------------------------------------------//
// TURN AT INTERSECTION
//--------------------------------------------------//
void turncar (int leftright) {
	// F LEFT: 1
	// R LEFT: 2
	// F RIGHT: 3
	// R RIGHT: 4
	volatile float 	v;
		
	//SET ALL PWM TO 0		
	// pwm_Left0 = -1;
	// pwm_Left1 = -1;
	// pwm_Right0 = -1;
	// pwm_Right1 = -1;
	stopcar();

	//CODE FOR TURNING LEFT
	if (leftright == 1) {
		//SET ONLY RIGHT MOTOR
		pwm_Right0 = 100;
		
		waitms(750);	
		
		//CHECK FOR VOLTAGES AND WAIT TILL OPPOSITE IS HIGH
		v = Volts_at_Pin(TANK_RR);
				
		while (v < 1) {
			//get voltage
			v = Volts_at_Pin(TANK_RR);
			//printf ("\nv = %f\r\n", v);
		}

		// turning
		waitms(300);
		
		//STOP MOTOR AGAIN 
		pwm_Right0 = -1; 
	}
	
	// CODE FOR TURNING RIGHT
	else if (leftright == 3) {
		//SET ONLY LEFT MOTOR
		pwm_Left1 = 75;
		waitms(750);
	
		// CHECK FOR VOLTAGES AND WAIT TILL OPPOSITE IS HIGH
		v = Volts_at_Pin(TANK_RL);
				
		while (v < 0.7) {
			//get voltage
			v = Volts_at_Pin(TANK_RL);
			//printf ("\nv = %f\r\n", v);
		}
		
		waitms(300);
		
		//SET MOTOR BACK TO 0
		pwm_Left1 = -1; 
	}

	// REVERSE TURN LEFT
	else if (leftright == 2) {
		//SET ONLY RIGHT MOTOR
		pwm_Right1 = 75;
		pwm_Left0 = 75;
		
		waitms(250);
		pwm_Left0 = -1;
	//	pwm_Left0 = 30;
	
		waitms(1000);
		//CHECK FOR VOLTAGES AND WAIT TILL OPPOSITE IS HIGH
		v = Volts_at_Pin(TANK_RR);
				
		while (v < 0.7) {
			//get voltage
			v = Volts_at_Pin(TANK_RR);
			//printf ("\nv = %f\r\n", v);
		}
		
		//STOP MOTOR AGAIN 
		pwm_Right1 = -1; 
	}
	
	// CODE FOR TURNING RIGHT
	else if (leftright == 4) {
		//SET ONLY LEFT MOTOR
		pwm_Left0 = 75;
//		pwm_Right1 = 30;
		pwm_Right1 = 75;
		
		waitms(250);
		
		pwm_Right1 = -1;
		
		waitms(1000);
	
		// CHECK FOR VOLTAGES AND WAIT TILL OPPOSITE IS HIGH
		v = Volts_at_Pin(TANK_RL);
				
		while (v < 0.7) {
			//get voltage
			v = Volts_at_Pin(TANK_RL);
			//printf ("\nv = %f\r\n", v);
		}
		
		//SET MOTOR BACK TO 0
		pwm_Left0 = -1; 
	}
}

//--------------------------------------------------//
// UTURN
//--------------------------------------------------//
void uturn(void) {
	volatile float vleft;
	volatile float vright;
	
	vleft = Volts_at_Pin(TANK_FL);
	vright = Volts_at_Pin(TANK_FR);
	
	//SET PWM TO SPIN CAR
	pwm_Left0 = -1;
	pwm_Left1 = 50;
	pwm_Right0 = -1;
	pwm_Right1 = 50;
	
	//SPIN FOR AMOUNT OF TIME
	waitms(2000);

	while ((Volts_at_Pin(TANK_FL)-Volts_at_Pin(TANK_FR))<-0.3 || (Volts_at_Pin(TANK_FL)-Volts_at_Pin(TANK_FR))>0.3);
	
	
}	

void Sonar_Reading(void) {
	// Reset the counter
	TL0=0; 
	TH0=0;
	TF0=0;
	overflow_count=0;
	
	//initial the sonar
	Trigger = 0; 
	Timer3us(2);
	Trigger = 1; // turn on trig
	Timer3us(10);//10us delay 
	Trigger = 0; // trun off trig 
	while(Echo!=0); // Wait for the signal to be zero
	while(Echo!=1); // Wait for the signal to be one

	// start the timer 0 
	TR0=1; // Start the timer
	while(Echo!=0) // Wait for the signal to be zero
	{
		if(TF0==1) // Did the 16-bit timer overflow?
		{
			TF0=0;
			overflow_count++;
		}
	}
	TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
	time=(overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK);
	distance = ((time/2.0f)/29.1f)*100000;
}