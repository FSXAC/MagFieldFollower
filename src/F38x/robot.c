// ELEC 291 Project 2

#include <C8051F38x.h>
#include <stdlib.h>
#include <stdio.h>
#include "robot_header.h"

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
	printf("\x1b[2J"); // Clear screen using ANSI escape sequence.

    //INITIALIZE ADC PINS
    InitPinADC(2, 3); // Configure P2.3 as analog input (tank1)
	InitPinADC(2, 4); // Configure P2.4 as analog input	(tank1)
	InitPinADC(2, 5); // Configure P2.5 as analog input (tank2)
	InitPinADC(2, 6); // Configure P2.6 as analog input (tank2)

	//INITIALIZE ADC
	InitADC();	
	
	//MAIN CODE
	while (1) {	

		//RECEIVE COMMANDS
		currentcmd = readData(); 
		
		// FOR DEBUGGING
		printf("frontL %f frontR %f backL %f backR %f command %1d, state %1d left0 %3d left1 %3d right0 %3d right1 %3d\r", Volts_at_Pin(TANK_FL),Volts_at_Pin(TANK_FR),Volts_at_Pin(TANK_RL),Volts_at_Pin(TANK_RR), currentcmd, currentstate, pwm_Left0, pwm_Left1, pwm_Right0, pwm_Right1);
		// waitms(100);
		// continue;


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
					printf("\nINTERSECTION\n");

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
				printf("Turn left at the next intersection\n");
				if (v1 > 0.7 && v2 >1)  {
						printf("\n\r INTERSECTION\n");
						//MOVE FORWARDS UNTIL AT INTERSECTION
					
						//TURN
						// 1 for forward left, 2 for reverse left
						turncar(currentstate);
						currentcmd = 0;
				} 
				break;
			//---------------------------------//	
			//case for right turn			
			case CMD_RIGHT:
				//CHECK FOR INTERSECTION
				printf("Turn right at the next intersection\n");
				if (v1 > 0.7 && v2 >1) {
						printf("\n\r INTERSECTION\n");
						//TURN
						turncar(currentstate + 2); //1 = right
						currentcmd = 0;
					} 
				break;
			//---------------------------------//
			//case for forwards
			case CMD_FORWARD:
				// CHANGE TO FORWARD STATE
				printf("GO!\n");
				currentstate = 1;
				currentcmd = 0;
				break;
			//---------------------------------//
			//case for backwards
			case CMD_REVERSE:
				//CHANGE TO BACKWARDS STATE
				printf("Reverse Reverse!\n");
				currentstate = 2;
				currentcmd = 0;
				break;
			//---------------------------------//
			//case for stop
			case CMD_STOP:
				//CHANGE TO STOPPED STATE
				printf("HALT peasants!\n");
				currentstate = 3;
				currentcmd = 0;
				break;
			//---------------------------------//	
			//case for 180 turn 
			case CMD_UTURN:
				uturn();
				printf("UTURN\n");
				currentcmd = 0;
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

/* Program that controls forward/reverse direction of the robot.
	Parameters
	pwm_both: the value of pwm that controls speed of motors
	direction: flag to set whether robot goes forwards(0) or backwards(1). */
// void forward_backward(unsigned char direction) {
// 	if (direction == 0) { //p2.1,1.6 on
// 		pwm_Left0 = pwm_Right0 = -1;
// 		pwm_Left1 = pwm_Right1 = pwm_both;  //MOTOR_LEFT1 = MOTOR_RIGHT1 = pwm_both;
// 	}

// 	else if (direction == 1) { //p2.0,1.5 on
// 		pwm_Left1 = pwm_Right1 = -1;
// 		pwm_Left0 = pwm_Right0 = pwm_both; 
// 		//MOTOR_LEFT0 = MOTOR_RIGHT0 = pwm_both;
// 		//MOTOR_LEFT1 = MOTOR_RIGHT1 = 0;
// 	}

// }


//--------------------------------------------------//
// RECEIVE COMMANDS
//--------------------------------------------------//
/*void readData(void) {
	int commandflag = 1;					//determines if there's a real command coming in or not
	
	//ENTER CODE ONLY IF TRIGGERED BY 0
	if (COMMAND_PIN == 0) {					//0---
		waitms(CMDFRQ*1.5);
		if (COMMAND_PIN == 1) {				//01--
			waitms(CMDFRQ);
			if (COMMAND_PIN == 0) {			//010-
				waitms(CMDFRQ);
				if (COMMAND_PIN == 0) 	currentcmd = 4;	//0100	
				else 					currentcmd = 5;	//0101
			}
			else {							//011-
				waitms(CMDFRQ);
				if (COMMAND_PIN == 0) 	currentcmd = 6;	//0110
			}
		}
		else {								//00--
			waitms(CMDFRQ);
			if (COMMAND_PIN == 1) {			//001-
				waitms(CMDFRQ);
				if (COMMAND_PIN == 1) 	currentcmd = 3;	//0011
				else 					currentcmd = 2;	//0010
			}
			else {							//000-
				waitms(CMDFRQ);
				if (COMMAND_PIN == 1) 	currentcmd = 1; //0001
				else {						//0000 this is no signal, set commandflag to 1 and go back to main loop
					commandflag = 1;
				}
			}
		}
		printf("\n\r current command is %d, commandflag = %d\r\n", currentcmd, commandflag);		
	}
	
	//STAYS IN READ DATA UNTIL END OF RECEIVE (IF A PROPER COMMAND IS RECEIVED)
	if (commandflag == 0)	{while (COMMAND_PIN == 0);} 
}*/

// returns the 4 bits that was transmitted
// unsigned char readData(void) {
// 	unsigned char index = 1;
// 	unsigned char command = 0;
// 	if (!COMMAND_PIN) {
// 		waitms(CMDFRQ*1.5);
// 		for (; index < 4; index++) {
// 			// read the next one
// 			printf("*****%d:::%d*****\n", index, COMMAND_PIN);
// 			command |= COMMAND_PIN << index;
// 			waitms(CMDFRQ);
// 		}
// 	}

// 	// check the validity of the command
// 	if ((command == CMD_LEFT) ||
// 		(command == CMD_RIGHT) ||
// 		(command == CMD_FORWARD) ||
// 		(command == CMD_REVERSE) ||
// 		(command == CMD_STOP) ||
// 		(command == CMD_UTURN))	{
// 		printf("Command received: 0x%02x\n", command);
// 		return command;
// 	}
// 	else return CMD_NONE;
// }

unsigned char readData(void) {
	unsigned char command = 0;
	if (!COMMAND_PIN) {
		while (!COMMAND_PIN);
		P1_4 = 1;
		waitms((int)(CMDFRQ + CMDFRQ/2));
		P1_4 = 0;
		command |= COMMAND_PIN<<2;
		waitms(CMDFRQ);
		P1_4 = 1;
		command |= COMMAND_PIN<<1;
		waitms(CMDFRQ);
		P1_4 = 0;
		command |= COMMAND_PIN;
		while (!COMMAND_PIN);
		printf("\nCommand received: 0b_0%c%c%c\n", 
			(command & 0x04) ? '1' : '0',
			(command & 0x02) ? '1' : '0',
			(command & 0x01) ? '1' : '0');
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
	// FLEFT: 1
	// RLEFT: 2
	// FRIGHT: 3
	// RRIGHT: 4
	volatile float 	v;
	volatile char 	direction;
		
	//SET ALL PWM TO 0		
	pwm_Left0 = -1;
	pwm_Left1 = -1;
	pwm_Right0 = -1;
	pwm_Right1 = -1;
	
	direction = currentstate - 1;

	//CODE FOR TURNING LEFT
	if (leftright == 1) {
		//SET ONLY RIGHT MOTOR
		pwm_Right0 = 100;
	
		//CHECK FOR VOLTAGES AND WAIT TILL OPPOSITE IS HIGH
		v = direction ? Volts_at_Pin(TANK_FR) : Volts_at_Pin(TANK_RR);
				
		while (v < 1.3) {
			//get voltage
			v = direction ? Volts_at_Pin(TANK_FR) : Volts_at_Pin(TANK_RR);
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
		waitms(200);
	
		// CHECK FOR VOLTAGES AND WAIT TILL OPPOSITE IS HIGH
		v = direction ? Volts_at_Pin(TANK_FL) : Volts_at_Pin(TANK_RL);
				
		while (v < 1.3) {
			//get voltage
			v = direction ? Volts_at_Pin(TANK_FL) : Volts_at_Pin(TANK_RL);
		}
		
		//SET MOTOR BACK TO 0
		pwm_Left1 = -1; 
	}

	// REVERSE TURN LEFT
	else if (leftright == 2) {
		//SET ONLY RIGHT MOTOR
		pwm_Right1 = 100;
	
		//CHECK FOR VOLTAGES AND WAIT TILL OPPOSITE IS HIGH
		v = direction ? Volts_at_Pin(TANK_FR) : Volts_at_Pin(TANK_RR);
				
		while (v < 0.9) {
			//get voltage
			v = direction ? Volts_at_Pin(TANK_FR) : Volts_at_Pin(TANK_RR);
		}

		// turning
		waitms(300);
		
		//STOP MOTOR AGAIN 
		pwm_Right1 = -1; 
	}
	
	// CODE FOR TURNING RIGHT
	else if (leftright == 4) {
		//SET ONLY LEFT MOTOR
		pwm_Left0 = 75;
		waitms(200);
	
		// CHECK FOR VOLTAGES AND WAIT TILL OPPOSITE IS HIGH
		v = direction ? Volts_at_Pin(TANK_FL) : Volts_at_Pin(TANK_RL);
				
		while (v < 0.9) {
			//get voltage
			v = direction ? Volts_at_Pin(TANK_FL) : Volts_at_Pin(TANK_RL);
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
	waitms(3000);

	while ((Volts_at_Pin(TANK_FL)-Volts_at_Pin(TANK_FR))<-0.3 || (Volts_at_Pin(TANK_FL)-Volts_at_Pin(TANK_FR))>0.3);
	
	
}	

//--------------------------------------------------//
// STRAIGHT LINE
//--------------------------------------------------//
// void movecar (int forback, int power) {
// 	//1 = forwards, 2 = backwards, power = PWM
// 	if (forback == 1) {
// 		pwm_Left1 = power;
// 		pwm_Left0 = -1;
// 		pwm_Right0 = power;
// 		pwm_Right1 = -1;
// 	}
// 	else if (forback == 2) {
// 		pwm_Left0 = power;
// 		pwm_Left1 = -1;
// 		pwm_Right1 = power;
// 		pwm_Right0 = -1;
// 	}
// }
		
// 		