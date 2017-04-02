# makefile for the robot
# author: mansur he
# last edited: 2017-04-02

# specift compiler
CC=c51

# specify microcontroller

# objects
OBJS=robot.obj adc.obj

# default target
robot.hex: $(OBJS)
	$(CC) $(OBJS)
	@echo Compile and Link Complete!

# target object files depend on c files
robot.obj: robot.c robot_header.h
	$(CC) -c robot.c
adc.obj: adc.c robot_header.h
	$(CC) -c adc.c


# clean directory
CLEAN:
	@del $(OBJS) *.asm *.lkr *.lst *.map *.hex *.map 2>nul
	@echo Directory Cleaned!

# flash the program to F38x
FLASH:
	F38x_prog robot.hex
	@echo Flash Complete!

# Dummy
DUMMY: robot.hex
	@echo Test 1 2 3

# open containing folder
EXPLORE:
	explorer .
