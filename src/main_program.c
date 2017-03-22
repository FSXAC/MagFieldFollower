// include libararies
#include <avr/io.h>
#include <stdio.h>

// program starts here
int main(void) {setup(); while (1) loop();}

// runs once
void setup(void) {
    int j;

    // initialize usart
    usart_init();
    printf("Hello World!\n");

    // print some numbers
    for (j = 0; j<10; j++) printf("square(j)=%d\n", j*j);
}

// runs forever
void loop(void) {
    // do nothing
}