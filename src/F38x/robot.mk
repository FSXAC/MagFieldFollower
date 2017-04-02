# makefile for the robot
# author: mansur he
# last edited: 2017-04-02

# specift compiler
CC=c51

# specify microcontroller

# objects
OBJS=robot.obj

# default target
robot.hex: $(OBJS)
	$(CC) $(OBJS)
	@echo Link Complete!

# target object files depend on c files
robot.obj: robot.c robot_header.h
	$(CC) -c robot.c
	@echo Compilation Complete!

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
