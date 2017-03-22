CC=c51
COMPORT = $(shell type COMPORT.inc)
OBJS=tetrisF38x.obj

tetrisF38x.hex: $(OBJS)
	$(CC) $(OBJS)
	@echo Done!
	
tetrisF38x.obj: tetrisF38x.c
	$(CC) -c tetrisF38x.c

clean:
	@del $(OBJS) *.asm *.lkr *.lst *.map *.hex *.map 2> nul

LoadFlash:
	@Taskkill /IM putty.exe /F 2>NUL | wait 500
	F38X_prog tetrisF38x.hex

putty:
	@Taskkill /IM putty.exe /F 2>NUL | wait 500
	putty -serial $(COMPORT) -sercfg 115200,8,n,1,N -v

Dummy: tetrisF38x.hex tetrisF38x.Map
	@echo Nothing to see here!
	
explorer:
	explorer .
		