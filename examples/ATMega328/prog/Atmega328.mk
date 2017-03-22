PORTN=$(shell type COMPORT.inc)

# Compile using Microsoft Visual C.  Check docl.bat.
spi_atmega328.exe: spi_atmega328.c
	@docl spi_atmega328.c
	
clean:
	del spi_atmega328.obj spi_atmega328.exe

dummy: docl.bat
	@echo hello from dummy target!
	
load1_XTAL:
	spi_atmega328 -p -v -crystal ..\blinky\blinky.hex

load1_RC:
	spi_atmega328 -p -v -RC ..\blinky\blinky.hex
	
load2:
	@Taskkill /IM putty.exe /F 2>nul | wait 500
	spi_atmega328 -p -v -CRYSTAL ..\usart\usart.hex
	c:\putty\putty.exe -serial $(PORTN) -sercfg 19200,8,n,1,N -v
