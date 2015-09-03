#include "driver_config.h"
#include <stdio.h>
#include <stdlib.h>


#include "timer32.h"
#include "gpio.h"


extern int fibonacci(int n);

int translateFib(int fibNum) {
	char morse[10][6] = {"11111", "01111", "00111", "00011", "00001", "00000", "10000", "11000", "11100", "11110"};
	int i=0;
	char* digitArray[10];
	while(fibNum >0)
	{
		int digit = fibNum % 16;
		if (digit >= 10)
		{
			int digit1 = digit % 10;
			int digit2 = (digit/10)%10;
			digitArray[i] = morse[digit2];
			i++;
			digitArray[i] = morse[digit1];
			i++;
		}else{
			digitArray[i] = morse[digit];
			i++;
		}

		fibNum /= 16;
	}
	int j=i-1;
	for(j=i-1; j<10; j--){
		int blinkNum = 0;
		while(blinkNum<5){
			if(digitArray[j][blinkNum]==0){
				//blink short
				GPIOSetValue( 0, 7, 1 );
				sleep(500);
				GPIOSetValue( 0, 7, 0 );
				sleep(500);
			}else if(digitArray[j][blinkNum]==1){
				//blink long
				GPIOSetValue( 0, 7, 1 );
				sleep(1000);
				GPIOSetValue( 0, 7, 0 );
				sleep(500);
			}
		}
	}
	return 1;
}

int main(void) {
	  GPIOInit();
	  /* Set LED port pin to output */
	  GPIOSetDir( 0, 7, 1 );
	int i=1;
	int fibNum;
	for(i=1; i <=20; i++){
		fibNum = fibonacci(i);
		translateFib(fibNum);
	}
}