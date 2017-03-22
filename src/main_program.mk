# test makefile
# author: Muchen He
# last edited: 2017-03-21

# specify compiler
CC=avr-gcc

# Specify microcontroller
CPU=-mmcu=atmega328p

# C compiler options
COPT=-g -Os -Wall $(CPU) -c

# Object files to link
OBJS=main_program.o usart.o

# specify port
PORTN=$(shell type COMPORT.inc)

# default target (output) is specified below and depends on the object files listed in 'OBJS' assignment
# Object files are linked together to create .elf
# Linked file is then converted to .hex using aver-objcopy
# avr-gcc $(CPU) -Wl,-Map,main_program.map $(OBJS) -o main_program.elf
main_program.elf: $(OBJS)
	avr-gcc $(CPU) $(OBJS) -o main_program.elf
	avr-objcopy -j .text -j .data -O ihex main_program.elf main_program.hex
	@echo Compilation and Linking Complete! :D

# The object file .o depends on .c files (.c -[compiles]-> to .o)
main_program.o: main_program.c main_header.h
	avr-gcc $(COPT) main_program.c

# Other function / functions (create one for each .c / .o files)
usart.o: usart.c main_header.h
	avr-gcc $(COPT) usart.c

# Clean the working directory: remove unncessary iles
CLEAN: 
	@del *.hex *.elf *.o 2>nul
	@echo Squeaky clean! :3

# Flash the .hex file to the microcontroller (restart putty too)
FLASH:
	@Taskkill /IM putty.exe /F 2>nul | wait 500
	spi_atmega328 -CRYSTAL -p -v main_program.hex
	@echo Flashing complete! Memory wiped clean and reset :O (How dare you?)
	putty.exe -serial $(PORTN) -sercfg 19200,8,n,1,N -v

# testing target
TEST:
	@echo Testing works! :)

# opens the directory the makefile is contained in
EXPLORER:
	explorer .