CC=c51
COMPORT = $(shell type COMPORT.inc)
OBJS=All_timers.obj

All_timers.hex: $(OBJS)
	$(CC) $(OBJS)
	@echo Done!
	
All_timers.obj: All_timers.c
	$(CC) -c All_timers.c

clean:
	@del $(OBJS) *.asm *.lkr *.lst *.map *.hex *.map 2> nul

LoadFlash:
	F38X_prog All_timers.hex
	@echo Done!  Use the oscilloscope to check the output pin's frequency

Dummy: All_timers.hex All_timers.Map
	@echo Nothing to see here!
	
explorer:
	explorer .
		