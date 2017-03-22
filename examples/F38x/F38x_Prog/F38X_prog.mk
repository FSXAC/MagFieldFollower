F38X_prog.exe: F38X_prog.c
	@docl F38X_prog.c
	
clean:
	del F38X_prog.obj F38X_prog.exe

dummy: docl.bat COMPORT.inc
	@echo hello from dummy!
	
tx: tx.hex
	F38X_prog tx.hex

lcd: LCD_8bit_F381.hex
	F38X_prog LCD_8bit_F381.hex

port: LCD_8bit_F381.hex
	F38X_prog -com134 -t100 LCD_8bit_F381.hex
