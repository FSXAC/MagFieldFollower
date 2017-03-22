#include <C8051F38x.h>
#include "lcd.h"

void main (void)
{
	// Configure the LCD
	LCD_4BIT();
	
   	// Display something in the LCD
	LCDprint("LCD 4-bit test:", 1, 1);
	LCDprint("Hello, World!", 2, 1);
}
