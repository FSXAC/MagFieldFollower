CC=c51
COMPORT = $(shell type COMPORT.inc)
OBJS=F38x_ADC.obj

F38x_ADC.hex: $(OBJS)
	$(CC) $(OBJS)
	@echo Done!
	
F38x_ADC.obj: F38x_ADC.c
	$(CC) -c F38x_ADC.c

clean:
	@del $(OBJS) *.asm *.lkr *.lst *.map *.hex *.map 2> nul

LoadFlash:
	@Taskkill /IM putty.exe /F 2>NUL | wait 500
	F38X_prog F38x_ADC.hex

putty:
	@Taskkill /IM putty.exe /F 2>NUL | wait 500
	putty -serial $(COMPORT) -sercfg 115200,8,n,1,N -v

Dummy: F38x_ADC.hex F38x_ADC.Map
	@echo Nothing to see here!
	
explorer:
	explorer .
		