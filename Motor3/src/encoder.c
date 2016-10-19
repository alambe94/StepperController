#include "stm8s.h"
#include "millis.h"
#include "encoder.h"
#include "motor3.h"
#include "gpio_config.h"



encoder_t Last_State_E3=0;

uint8_t   Dir_Flag =0;




void ScanEncoder3(void)
{
	encoder_t Current_State =state00;
	uint8_t temp=(GPIO_ReadInputData(ENCODER3_PORT));
	Current_State=((temp>>3)&0x01);
	Current_State|=((temp>>3)&0x02);


	if(Current_State!=Last_State_E3)
	{
		switch(Current_State)
	  {
		case state00:
		if(Last_State_E3==state10){
		Dir_Flag =0;
			Motor3MoveCCW(10);}

		  else if(Last_State_E3==state01){
				Dir_Flag =1;
							Motor3MoveCW(10);}

		break;		

	  case state01:
		if(Last_State_E3==state00){
		Dir_Flag =0;
			Motor3MoveCCW(10);}

		  else if(Last_State_E3==state11){
				Dir_Flag =1;
							Motor3MoveCW(10);}

		break;
		
			case state10:
		if(Last_State_E3==state11){
		Dir_Flag =0;
			Motor3MoveCCW(10);}

		  else if(Last_State_E3==state00){
				Dir_Flag =1;
							Motor3MoveCW(10);}

		break;
		
			case state11:
		if(Last_State_E3==state01){
		Dir_Flag =0;
			Motor3MoveCCW(10);}

		  else if(Last_State_E3==state10){
				Dir_Flag =1;
							Motor3MoveCW(10);}

		break;
		
		 default:
		 Motor3Stop();
		 break;
	  }
  
	}
			
		Last_State_E3=Current_State;

}
	

