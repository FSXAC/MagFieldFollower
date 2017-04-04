#define F_CPU 16000000UL

#include <avr/io.h>
#include <stdio.h>
#include <util/delay.h>
#include "main_header.h"

void LCD_pulse(void) {
	PORTD turnOn(4);
	delayus(40);
	PORTD turnOff(4);
}

void LCD_byte(unsigned char x) {
	if (x&0x80) PORTD turnOn(3); else PORTD turnOff(3);
	if (x&0x40) PORTD turnOn(7); else PORTD turnOff(7);
	if (x&0x20) PORTD turnOn(6); else PORTD turnOff(6);
	if (x&0x10) PORTD turnOn(5); else PORTD turnOff(5);
	
	LCD_pulse();
	delayus(40);
	
	if (x&0x08) PORTD turnOn(3); else PORTD turnOff(3);
	if (x&0x04) PORTD turnOn(7); else PORTD turnOff(7);
	if (x&0x02) PORTD turnOn(6); else PORTD turnOff(6);
	if (x&0x01) PORTD turnOn(5); else PORTD turnOff(5);
	
	LCD_pulse();
}

void WriteData (unsigned char x)
{
	PORTD turnOn(2);
	LCD_byte(x);
	delay(2);	
}

void WriteCommand (unsigned char x)
{
	PORTD turnOff(2);
	LCD_byte(x);
	delay(5);		
}

void LCD_4BIT (void)
{
	PORTD turnOff(4);
	delay(20);
	
	WriteCommand(0x33);
	WriteCommand(0x33);
	WriteCommand(0x32); // Change to 4-bit mode

	// Configure the LCD
	WriteCommand(0x28);
	WriteCommand(0x0c);
	WriteCommand(0x01); // Clear screen command (takes some time)

	delay(20);
}

void LCDprint(char * string, unsigned char line, uint8_t clear) {
	int j;
	
	WriteCommand(line==2?0xc0:0x80);
	delay(5);
	for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
	if(clear) for(; j<16; j++) WriteData(' ');	
}