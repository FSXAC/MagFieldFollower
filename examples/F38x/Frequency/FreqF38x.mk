CC=c51
COMPORT = $(shell type COMPORT.inc)
OBJS=FreqF38x.obj Startup.obj Delay.obj

FreqF38x.hex: $(OBJS)
	$(CC) $(OBJS)
	@del *.lkr *.asm *.lst 2>nul
	@echo Done!
	
FreqF38x.obj: FreqF38x.c global.h
	$(CC) -c FreqF38x.c

Startup.obj: Startup.c  global.h
	$(CC) -c Startup.c

Delay.obj: Delay.c  global.h
	$(CC) -c Delay.c

clean:
	@del $(OBJS) *.asm *.lkr *.lst *.map *.hex *.map 2>nul

LoadFlash:
	@Taskkill /IM putty.exe /F 2>nul | wait 500
	F38X_prog FreqF38x.hex

putty:
	@Taskkill /IM putty.exe /F 2>nul | wait 500
	putty -serial $(COMPORT) -sercfg 115200,8,n,1,N -v

Dummy: FreqF38x.hex FreqF38x.map
	@echo Careful when connecting to pin T0 (P0.0)!
	
explorer:
	explorer .
		