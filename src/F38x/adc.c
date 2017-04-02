#define VREF 3.3

#include <C8051F38x.h>
#include <stdlib.h>
#include "robot_header.h"

// initialize adc 
void InitADC(void) {
	// Init ADC
	ADC0CF = 0xF8; // SAR clock = 31, Right-justified result
	ADC0CN = 0b_1000_0000; // AD0EN=1, AD0TM=0
  	REF0CN = 0b_0000_1000; //Select VDD as the voltage reference for the converter
}

// initialize which pin is ready for adc input
void InitPinADC (unsigned char portno, unsigned char pinno) {
	unsigned char mask;
	
	mask=1<<pinno;
	
	switch (portno) {
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
		default: break;
	}
}

// get adc at pin
unsigned int ADC_at_Pin(unsigned char pin) {
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

// get voltage
float Volts_at_Pin(unsigned char pin) {
	 return ((ADC_at_Pin(pin)*VREF)/1024.0);
}