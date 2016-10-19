#include "stm8s.h"
#include "millis.h"
#include "encoder.h"
#include "motor1.h"
#include "gpio_config.h"



encoder_t Last_State_E1=0;

uint8_t   Dir_Flag =0;


void ScanEncoder1(void)
{
	encoder_t Current_State =state00;
	uint8_t temp=(GPIO_ReadInputData(ENCODER2_PORT));
	Current_State=((temp>>3)&0x01);
	Current_State|=((temp>>3)&0x02);


	if(Current_State!=Last_State_E1)
	{
		switch(Current_State)
	  {
		case state00:
		if(Last_State_E1==state10){
		Dir_Flag =0;
			Motor1MoveCCW(40);}

		  else if(Last_State_E1==state01){
				Dir_Flag =1;
							Motor1MoveCW(40);}

		break;		

	  case state01:
		if(Last_State_E1==state00){
		Dir_Flag =0;
			Motor1MoveCCW(40);}

		  else if(Last_State_E1==state11){
				Dir_Flag =1;
							Motor1MoveCW(40);}

		break;
		
			case state10:
		if(Last_State_E1==state11){
		Dir_Flag =0;
			Motor1MoveCCW(40);}

		  else if(Last_State_E1==state00){
				Dir_Flag =1;
							Motor1MoveCW(40);}

		break;
		
			case state11:
		if(Last_State_E1==state01){
		Dir_Flag =0;
			Motor1MoveCCW(40);}

		  else if(Last_State_E1==state10){
				Dir_Flag =1;
							Motor1MoveCW(40);}

		break;
		
		 default:
		 Motor1Stop();
		 break;
	  }
  
	}
			
		Last_State_E1=Current_State;
}
	

