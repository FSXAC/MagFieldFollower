CC=c51
COMPORT = $(shell type COMPORT.inc)
OBJS=f38x_autotest.obj

f38x_autotest.hex: $(OBJS)
	$(CC) $(OBJS)
	@echo Done!
	
f38x_autotest.obj: f38x_autotest.c
	$(CC) -c f38x_autotest.c

clean:
	@del $(OBJS) *.asm *.lkr *.lst *.map *.hex *.map 2> nul

LoadFlash:
	@Taskkill /IM putty.exe /F 2>NUL | wait 500
	F38X_prog f38x_autotest.hex

putty:
	@Taskkill /IM putty.exe /F 2>NUL | wait 500
	putty -serial $(COMPORT) -sercfg 115200,8,n,1,N -v

Dummy: f38x_autotest.hex f38x_autotest.Map
	@echo Please don't click me!
	
explorer:
	explorer .
		