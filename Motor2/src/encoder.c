#include "stm8s.h"
#include "millis.h"
#include "encoder.h"
#include "motor2.h"
#include "led_pwm.h"
#include "gpio_config.h"



encoder_t Last_State_E4=0;
encoder_t Last_State_E2=0;

uint8_t   Dir_Flag =0;
int16_t   Pwm_Count =0;




void ScanEncoder2(void)
{
	encoder_t Current_State =state00;
	uint8_t temp=(GPIO_ReadInputData(ENCODER2_PORT));
	Current_State=((temp>>2)&0x01);
	Current_State|=((temp>>3)&0x02);


	if(Current_State!=Last_State_E2)
	{
		switch(Current_State)
	  {
		case state00:
		if(Last_State_E2==state10){
		Dir_Flag =0;
			Motor2MoveCCW(40);}

		  else if(Last_State_E2==state01){
				Dir_Flag =1;
							Motor2MoveCW(40);}

		break;		

	  case state01:
		if(Last_State_E2==state00){
		Dir_Flag =0;
			Motor2MoveCCW(40);}

		  else if(Last_State_E2==state11){
				Dir_Flag =1;
							Motor2MoveCW(40);}

		break;
		
			case state10:
		if(Last_State_E2==state11){
		Dir_Flag =0;
			Motor2MoveCCW(40);}

		  else if(Last_State_E2==state00){
				Dir_Flag =1;
							Motor2MoveCW(40);}

		break;
		
			case state11:
		if(Last_State_E2==state01){
		Dir_Flag =0;
			Motor2MoveCCW(40);}

		  else if(Last_State_E2==state10){
				Dir_Flag =1;
							Motor2MoveCW(40);}

		break;
		
		 default:
		 Motor2Stop();
		 break;
	  }
  
	}
			
		Last_State_E2=Current_State;

}
	
	void ScanEncoder4(void)
{
	encoder_t Current_State =state00;
	uint8_t temp1=(GPIO_ReadInputData(GPIOC));
	uint8_t temp2=(GPIO_ReadInputData(GPIOD));

	Current_State=((temp1>>7)&0x01);
	Current_State|=((temp2>>2)&0x02);


	if(Current_State!=Last_State_E4)
	{
		switch(Current_State)
	  {
		case state00:
		if(Last_State_E4==state10){
			Pwm_Count++;}

		  else if(Last_State_E4==state01){
			Pwm_Count--;}

		break;		

	  case state01:
		if(Last_State_E4==state00){
			Pwm_Count++;}

		  else if(Last_State_E4==state11){
			Pwm_Count--;}

		break;
		
			case state10:
		if(Last_State_E4==state11){
			Pwm_Count++;}

		  else if(Last_State_E4==state00){
			Pwm_Count--;}

		break;
		
			case state11:
		if(Last_State_E4==state01){
			Pwm_Count++;}

		  else if(Last_State_E4==state10){
			Pwm_Count--;}

		break;
		
		 default:
		 break;
	  }
  
	}
			
		Last_State_E4=Current_State;
		if(Pwm_Count>26)
		{
			Pwm_Count=26;
		}
			if(Pwm_Count<0)
		{
			Pwm_Count=0;
		}
		Set_Led_Pwm(Pwm_Count);

}

