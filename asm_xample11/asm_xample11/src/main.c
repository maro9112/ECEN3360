#include "driver_config.h"
#include <stdio.h>
#include <stdlib.h>


#include "timer32.h"
#include "gpio.h"


extern int fibonacci(int n);


//delay code from https://www.lpcware.com/content/forum/what-do-you-use-to-delay
void _delay_ms (uint16_t ms)
{
 uint16_t delay;
 volatile uint32_t i;
 for (delay = ms; delay >0 ; delay--)
//1ms loop with -Os optimisation
  {
  for (i=3500; i >0;i--){};
  }
}

int translateFib(int fibNum) {
	char morse[16][6] = {"11111", "01111", "00111", "00011", "00001", "00000", "10000", "11000", "11100", "11110", "00001", "01000", "01010", "00100", "00000", "00010"};
	int i=0;
	char* digitArray[10];
	while(fibNum >0)
	{
		int digit = fibNum % 16;
		digitArray[i] = morse[digit];
		i++;
		fibNum /= 16;
	}
	int j=i-1;
	for(j=i-1; j>=0; j--){
		int blinkNum = 0;
		while(blinkNum<6){
			int current = digitArray[j][blinkNum];
			current -=48;
			if(current==0){
				//blink short
				GPIOSetValue( 0, 7, 1 );
				_delay_ms (150);
				GPIOSetValue( 0, 7, 0 );
				_delay_ms (50);
			}else if(current==1){
				//blink long
				GPIOSetValue( 0, 7, 1 );
				_delay_ms (500);
				GPIOSetValue( 0, 7, 0 );
				_delay_ms (50);
			}
			blinkNum++;
		}
		_delay_ms (1000);
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
