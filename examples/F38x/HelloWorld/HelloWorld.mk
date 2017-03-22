CC=c51
COMPORT = $(shell type COMPORT.inc)
OBJS=HelloWorld.obj

HelloWorld.hex: $(OBJS)
	$(CC) $(OBJS)
	@echo Done!
	
HelloWorld.obj: HelloWorld.c
	$(CC) -c HelloWorld.c

clean:
	@del $(OBJS) *.asm *.lkr *.lst *.map *.hex *.map 2> nul

LoadFlash:
	@Taskkill /IM putty.exe /F 2>NUL | wait 500
	F38X_prog HelloWorld.hex

putty:
	@Taskkill /IM putty.exe /F 2>NUL | wait 500
	putty -serial $(COMPORT) -sercfg 115200,8,n,1,N -v

Dummy: HelloWorld.hex HelloWorld.Map
	@echo Nothing to see here!
	
explorer:
	explorer .
		