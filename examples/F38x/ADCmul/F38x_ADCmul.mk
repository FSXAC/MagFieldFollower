CC=c51
COMPORT = $(shell type COMPORT.inc)
OBJS=F38x_ADCmul.obj

F38x_ADCmul.hex: $(OBJS)
	$(CC) $(OBJS)
	@echo Done!
	
F38x_ADCmul.obj: F38x_ADCmul.c
	$(CC) -c F38x_ADCmul.c

clean:
	@del $(OBJS) *.asm *.lkr *.lst *.map *.hex *.map 2> nul

LoadFlash:
	@Taskkill /IM putty.exe /F 2>NUL | wait 500
	F38X_prog F38x_ADCmul.hex

putty:
	@Taskkill /IM putty.exe /F 2>NUL | wait 500
	putty -serial $(COMPORT) -sercfg 115200,8,n,1,N -v

Dummy: F38x_ADCmul.hex F38x_ADCmul.Map
	@echo Nothing to see here!
	
explorer:
	explorer .
		