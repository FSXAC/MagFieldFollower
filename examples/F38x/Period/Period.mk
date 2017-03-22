CC=c51
COMPORT = $(shell type COMPORT.inc)
OBJS=Period.obj Startup.obj Delay.obj

Period.hex: $(OBJS)
	$(CC) $(OBJS)
	@del *.lkr *.asm *.lst 2>nul
	@echo Done!
	
Period.obj: Period.c global.h
	$(CC) -c Period.c

Startup.obj: Startup.c  global.h
	$(CC) -c Startup.c

Delay.obj: Delay.c  global.h
	$(CC) -c Delay.c

clean:
	@del $(OBJS) *.asm *.lkr *.lst *.map *.hex *.map 2>nul

LoadFlash:
	@Taskkill /IM putty.exe /F 2>nul | wait 500
	F38X_prog Period.hex

putty:
	@Taskkill /IM putty.exe /F 2>nul | wait 500
	putty -serial $(COMPORT) -sercfg 115200,8,n,1,N -v

Dummy: Period.hex Period.map
	@echo Careful when connecting to pin P0.1!
	
explorer:
	explorer .
		