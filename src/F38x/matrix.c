// functions containing stuff for LED matrix

// Matrix pins
#define LED_CS P1_2
#define LED_DATA P1_3
#define LED_CLK P1_4

// libraries
#include <stdio.h>
#include <c8051f38x.h>
#include "robot_header.h"

// LED MATRIX IMAGE IN MEMORY (COMPRESSED)
unsigned char MX_TURN[8] = {0x10, 0x30, 0x70, 0xFC, 0x76, 0x32, 0x12, 0x02};
unsigned char MX_GO[4] = {0x13, 0x7F, 0xD9, 0x11};
unsigned char MX_STOP[2] = {0x37, 0xF8};
unsigned char MX_UTURN[8] = {0x1C, 0x36, 0x22, 0x22, 0x22, 0xFA, 0x72, 0x22};

// reverses the bytes
unsigned char reverse(unsigned char b) {
   b = (b & 0xF0) >> 4 | (b & 0x0F) << 4;
   b = (b & 0xCC) >> 2 | (b & 0x33) << 2;
   b = (b & 0xAA) >> 1 | (b & 0x55) << 1;
   return b;
}

// display to screen
// PARAMS:
// *grid: the array of bits to send
// options:
//		bit 0: normal / flip horizontal
// 		bit 1: normal / flip vertical
// 		bit 2: normal / mirror horizontal
// 		bit 3: normal / mirror vertical
void mxDisplay(unsigned char *grid, unsigned char options) {
	unsigned char i;
	for (i = 0; i < 8; i++) {
		if (options & 0x01) mxWrite(i+1, reverse(grid[i]));
		else mxWtite(i+1, grid[i]);	
	}
}

// write a byte to the MAX7219
void mxWrite(unsigned char address, unsigned char value) {
	if ((address < 1) || (address > 8)) return;
	mxSPI(address);
	mxSPI(value);
	mxPulse();
}

// send one byte
void mxSPI(unsigned char value) {
	unsigned char j, temp;
	for (j = 0; j < 8; j++) {
		temp = value & 0x80;
		LED_DATA = (temp == 0x80) ? HIGH : LOW;

		// toggle clock
		LED_CLK = HIGH;
		Timer3us(20);
		LED_CLK = LOW;

		// shift one bit over
		value = value << 1;
	}
}

// send one byte in reverse
void mxSPIR(unsigned char value) {
	unsigned char j, temp;
	for (j = 0; j < 8; j++) {
		temp = value & 0x01;
		LED_DATA = (temp == 0x01) ? HIGH : LOW;

		// toggle clock
		LED_CLK = HIGH;
		Timer3us(20);
		LED_CLK = LOW;

		// shift one bit over
		value = value >> 1;
	}
}

// pulse at LED select
void mxPulse(void) {
	LED_CS = HIGH;
	waitms(1);
	LED_CS = LOW;
}

// clear all memory in MAX7219
void msClear(void) {
	unsigned char j;
	for (j = 1; j <= 8; j++) {
		mxSPI(j);
		mxSPI(0x00);
		mxPulse();
	}
}

// set intensity of the LED matrix screen
void mxIntensity(unsigned char intensity) {
	if (intensity > 0x0F) return;
	mxSPI(0x0A);
	mxSPI(intensity);
	mxPulse();
}

// initialize matrix
void mxInit(void) {
	// set pin out as open drain
	P1MDOUT &= 0b_1111_0001;

	LED_CS = LOW;

	// set decode mode (no-decode)
	mxSPI(0x09);
	mxSPI(0x00);
	mxPulse();

	// set intensity
	mxSPI(0x0A);
	mxSPI(0x01);
	mxPulse();

	// set scan limit
	mxSPI(0x0b);
	mxSPI(0x07);
	mxPulse();

	// clear memory
	mxClear();

	// set for normal operation
	mxSPI(0x0C);
	mxSPI(0x01);
	mxPulse();
}

// turn on LED for testing
void mxTest(void) {
	mxSPI(0x0F);
    mxSPI(0x01);
    mxPulse();
    waitms(1000);
    mxSPI(0x0F);
    mxSPI(0x00);
    mxPulse();
}