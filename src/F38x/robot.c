// ELEC 291 Project 2

#include <C8051F38x.h>
#include <stdlib.h>
#include <stdio.h>
#include "robot_header.h"

#define CMDFRQ 70	

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

  	MOTOR_LEFT0 =0;
   	MOTOR_LEFT1 =0;
   	MOTOR_RIGHT0 =0;
   	MOTOR_RIGHT1 =0;
   
   	//INITIAL STATE
   	currentstate = 2;  	//1-FORWARD, 2-BACKWARDS, 3-STOPPED, 4-DEBUGGER
   	currentcmd = 2;		//0-NO COMMAND, 1-TURN LEFT, 2-TURN RIGHT, 3-FORWARDS, 4-BACKWARDS, 5-STOP, 6-UTURN

	//CLEAR PUTTY SCREEN
	printf("\x1b[2J"); // Clear screen using ANSI escape sequence.

    //INITIALIZE ADC PINS
    InitPinADC(2, 3); // Configure P2.3 as analog input (tank1)
	InitPinADC(2, 4); // Configure P2.4 as analog input	(tank1)
	InitPinADC(2, 5); // Configure P2.5 as analog input (tank2)
	InitPinADC(2, 6); // Configure P2.6 as analog input (tank2)
	
	//COMPARATOR...?
//	InitPinADC(1, 0);

	//INITIALIZE ADC
	InitADC();
	
	
	//MAIN CODE
	while(1)
	{	
		//RECEIVE COMMANDS
		readData(); 
		
		printf("frontL %f frontR %f backL %f backR %f command %1d\r\n", Volts_at_Pin(LQFP32_MUX_P2_3),Volts_at_Pin(LQFP32_MUX_P2_4),Volts_at_Pin(LQFP32_MUX_P2_5),Volts_at_Pin(LQFP32_MUX_P2_6), currentcmd);
		
		//CURRENT STATE
		switch (currentstate) {
			case 1:
				linetrack(0);	//forwards
				//GET VOLTAGE
				v1 = Volts_at_Pin(LQFP32_MUX_P2_3);
				v2 = Volts_at_Pin(LQFP32_MUX_P2_4);
				break;
			case 2:
				linetrack(1);	//backwards
				//GET VOLTAGE
				v1 = Volts_at_Pin(LQFP32_MUX_P2_5);
				v2 = Volts_at_Pin(LQFP32_MUX_P2_6);
				break;
			case 3:
				stopcar();		//stop car
				break;
		}
		
		//CURRENT COMMAND		
		switch (currentcmd) {
			//case for left turn
			case 0 :
				//MOVE STRAIGHT THROUGH INTERSECTION WHEN NO COMMANDS
				if ((currentstate-1)? (v1 > 1.2 && v2 > 1.2):(v1 > 0.7 && v2 > 1)) {
					printf("\nINTERSECTION\n");
					if (currentstate == 1) {
						if (Volts_at_Pin(LQFP32_MUX_P2_5)>Volts_at_Pin(LQFP32_MUX_P2_6)) {
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
					}
					if (currentstate == 2) {
						if (Volts_at_Pin(LQFP32_MUX_P2_3)>Volts_at_Pin(LQFP32_MUX_P2_4)) {
							pwm_Left0 = 50;
							pwm_Left1 = -1;
							pwm_Right1 = 30;
							pwm_Right0 = -1;
						}
						else {
							pwm_Left0 = 30;
							pwm_Left1 = -1;
							pwm_Right1 = 50;
							pwm_Right0 = -1;
						}
					}																		 
					waitms(1500);
				} 
				break;
			//--------------------------------------------------//	
			case 1 :
				///CHECK FOR INTERSECTION
				if (v1 > 0.7 && v2 >1)  {
						printf("\n\r INTERSECTION\n");
					
						//TURN
						turncar(currentstate); //1 = forward left, 2 = backward left
						currentcmd = 0;
				} 
				break;
			//---------------------------------//	
			//case for right turn			
			case 2 :
				//CHECK FOR INTERSECTION
				if (v1 > 0.7 && v2 >1) {
						printf("\n\r INTERSECTION\n");

						//TURN
						turncar(currentstate+2); //3 = forward right, 4 = backward right
						currentcmd = 0;
					} 
				break;
			//---------------------------------//
			//case for forwards
			case 3 :
				//CHANGE TO FORWARD STATE
				currentstate = 1;
				currentcmd = 0;
				break;
			//---------------------------------//
			//case for backwards
			case 4 :
				//CHANGE TO BACKWARDS STATE
				currentstate = 2;
				currentcmd = 0;
				break;
			//---------------------------------//
			//case for stop
			case 5 :
				//CHANGE TO STOPPED STATE
				currentstate = 3;
				currentcmd = 0;
				break;
			//---------------------------------//	
			//case for 180 turn 
			case 6 :
				uturn();
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
void forward_backward(unsigned char direction) {
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


//--------------------------------------------------//
// RECEIVE COMMANDS
//--------------------------------------------------//
void readData (void) {
	int commandflag = 0;					//determines if there's a real command coming in or not
	
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
	}
	
	//STAYS IN READ DATA UNTIL END OF RECEIVE (IF A PROPER COMMAND IS RECEIVED)
	if (commandflag == 0)	{while (COMMAND_PIN == 0);} 
	
	//PRINT INCOMING COMMAND 
	//printf("\ncurrent command is %d\r\n", currentcmd);		
}


//--------------------------------------------------//
// FOLLOW THE LINE
//--------------------------------------------------//
void linetrack (int forwardbackward) {
	// 0 = forward with front, 1 = backward with rear, 2 = forward with rear, 3 = backward with front
	volatile float vleft;
	volatile float vright;
	
	//GET ADC INPUT 
	if (forwardbackward == 0) {
		vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
		vright=Volts_at_Pin(LQFP32_MUX_P2_4);
		
	//SET PWM DEPENDING ON TANK CIRCUIT VOLTAGES
	pwm_Left0 = -1;
	pwm_Left1 = vright*vright*75/(vright*vright+vleft*vleft);
	pwm_Right1 = -1;
	pwm_Right0 = vleft*vleft*75/(vright*vright+vleft*vleft);
	
	}
	
	//IF LINE TRACKING BACKWARDS
	if ((forwardbackward == 1)) {
		//GET ADC INPUT 
		vleft=Volts_at_Pin(LQFP32_MUX_P2_5);
		vright=Volts_at_Pin(LQFP32_MUX_P2_6);			
	
		//SET PWM DEPENDING ON TANK CIRCUIT VOLTAGES
		pwm_Left1 = -1;
		pwm_Left0 = vright*vright*75/(vright*vright+vleft*vleft);
		pwm_Right0 = -1;
		pwm_Right1 = vleft*vleft*75/(vright*vright+vleft*vleft);
	}
	
	//TRACK VOLTAGE, PWM, AND COMMANDS
	//printf("2.3= %f, 2.4= %f, LeftF= %4d, RightF= %4d, LeftB= %4d, RightB= %4d, command:%1d, state:%1d\r", vleft, vright, pwm_Left1, pwm_Right0, pwm_Left0, pwm_Right1, currentcmd, currentstate);
	
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
	//LEFT = 0, RIGHT = 1
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
	
		waitms(100);
		
		//CHECK FOR VOLTAGES AND WAIT TILL OPPOSITE IS HIGH
		v= direction ? Volts_at_Pin(LQFP32_MUX_P2_4) : Volts_at_Pin(LQFP32_MUX_P2_6);
						
		while (v < 1.3) {
			//get voltage
			v= direction ? Volts_at_Pin(LQFP32_MUX_P2_4) : Volts_at_Pin(LQFP32_MUX_P2_6);
			printf("Intersection voltage v = %f\r\n", v);
		}
		
		waitms(300);
		
		//STOP MOTOR AGAIN 
		pwm_Right0 = -1; 
		pwm_Left0 = -1;		
	}
	
	//CODE FOR TURNING RIGHT
	else if (leftright == 3) {
		//SET ONLY LEFT MOTOR
		pwm_Left1 = 75;
		
		waitms(200);
	
		//CHECK FOR VOLTAGES AND WAIT TILL OPPOSITE IS HIGH
		v= direction ? Volts_at_Pin(LQFP32_MUX_P2_3) : Volts_at_Pin(LQFP32_MUX_P2_5);

		while (v < 1.3) {
			//get voltage
			v= direction ? Volts_at_Pin(LQFP32_MUX_P2_3) : Volts_at_Pin(LQFP32_MUX_P2_5);
			printf("Intersection voltage v = %f\r\n", v);
		}
		
		//waitms(300);
	
		//SET MOTOR BACK TO 0
		pwm_Left1 = -1; 
		pwm_Right1 = -1; 
	}
	else if (leftright == 2) {
		//SET ONLY RIGHT MOTOR
		pwm_Right1 = 100;
	
		waitms(100);
		
		//CHECK FOR VOLTAGES AND WAIT TILL OPPOSITE IS HIGH
		v= direction ? Volts_at_Pin(LQFP32_MUX_P2_4) : Volts_at_Pin(LQFP32_MUX_P2_6);
		printf("Intersection voltage v = %f\r\n", v);
						
		while (v < 1) {
			//get voltage
			v= direction ? Volts_at_Pin(LQFP32_MUX_P2_4) : Volts_at_Pin(LQFP32_MUX_P2_6);
			printf("Intersection voltage v = %f\r\n", v);
		}
		
		waitms(300);
		
		//STOP MOTOR AGAIN 
		pwm_Right1 = -1; 
	}
	else if (leftright == 4) {
		//SET ONLY LEFT MOTOR
		pwm_Left0 = 75;
		
		waitms(200);
	
		//CHECK FOR VOLTAGES AND WAIT TILL OPPOSITE IS HIGH
		v= direction ? Volts_at_Pin(LQFP32_MUX_P2_3) : Volts_at_Pin(LQFP32_MUX_P2_5);
				
		while (v < 0.9) {
			//get voltage
			v= direction ? Volts_at_Pin(LQFP32_MUX_P2_3) : Volts_at_Pin(LQFP32_MUX_P2_5);
			printf("Intersection voltage v = %f\r\n", v);
		}
		
		//waitms(300);
	
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
	
	vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
	vright=Volts_at_Pin(LQFP32_MUX_P2_4);
	
	//SET PWM TO SPIN CAR
	pwm_Left0 = -1;
	pwm_Left1 = 50;
	pwm_Right0 = -1;
	pwm_Right1 = 50;
	
	//SPIN FOR AMOUNT OF TIME
	waitms(4000);
	
	//WAIT FOR WHEN VOLTAGES ARE EQUAL AGAIN
	while (((vleft - vright) > 0.2) || ((vleft - vright) < (-0.2))) {
			//get voltages
		vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
		vright=Volts_at_Pin(LQFP32_MUX_P2_4);
	}
}	

//--------------------------------------------------//
// STRAIGHT LINE
//--------------------------------------------------//
void movecar (int forback, int power) {
	//1 = forwards, 2 = backwards, power = PWM
	if (forback == 1) {
		pwm_Left1 = power;
		pwm_Left0 = -1;
		pwm_Right0 = power;
		pwm_Right1 = -1;
	}
	else if (forback == 2) {
		pwm_Left0 = power;
		pwm_Left1 = -1;
		pwm_Right1 = power;
		pwm_Right0 = -1;
	}
}
		
		