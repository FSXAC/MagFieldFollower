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
   MOTOR_LEFT0 =0;
   MOTOR_LEFT1 =0;
   MOTOR_RIGHT0 =0;
   MOTOR_RIGHT1 =0;
   
   currentstate = 1;  	//initialize the car to be stopped
   currentcmd = 1;		//initialize the command to be null


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
		//readData(); //check for incoming commands
		
		printf("adc readings = %f\r\n", Volts_at_Pin(LQFP32_MUX_P1_0));
		
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

void readData (void) {
	int commandflag = 0;					//determines if there's a real command coming in or not
	
	if (COMMAND_PIN == 0) {					//0---
		waitms(6);
		if (COMMAND_PIN == 1) {				//01--
			waitms(4);
			if (COMMAND_PIN == 0) {			//010-
				waitms(4);
				if (COMMAND_PIN == 0) {		//0100	
					currentcmd = 4;
				}
				else {						//0101
					currentcmd = 5;
				}
			}
			else {							//011-
				waitms(4);
				if (COMMAND_PIN == 0) {		//0110
					currentcmd = 6;
				}
			}
		}
		else {								//00--
			waitms(4);
			if (COMMAND_PIN == 1) {			//001-
				waitms(4);
				if (COMMAND_PIN == 1) {		//0011
					currentcmd = 3;
				}
				else {						//0010
					currentcmd = 2;
				}
			}
			else {							//000-
				waitms(4);
				if (COMMAND_PIN == 1) {		//0001	
					currentcmd == 1;
				}
				else {						//0000 this is no signal, set commandflag to 1 and go back to main loop
					commandflag = 1;
				}
			}
		}
	}
	if (commandflag == 0) {					//only wait for signal to end if a command has been received. 
		while (COMMAND_PIN == 0) {}
	}
	
	printf("current command is %d\r\n", currentcmd);		
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
		pwm_Left0 = pwm_Left1;
		pwm_Left1 = -1;
		pwm_Right1 = pwm_Right1;
		pwm_Right0 = -1;
	}
	
	//printf("2.3 = %f, 2.4 = %f, LeftMotor = %4d, RightMotor = %4d, command: %d\r", vleft, vright, pwm_Left1, pwm_Right0, currentcmd);
	
}

void stopcar(void) {
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

void uturn(void) {
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
