/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "gpio_config.h"

/*------------------RESET ALL PORTS--------------------*/
void Port_DeInit_All(void)
{
	GPIO_DeInit(GPIOA);
	GPIO_DeInit(GPIOB);
	GPIO_DeInit(GPIOC);
	GPIO_DeInit(GPIOD);
}

/*------------------MOTOR3 GPIO SET--------------------*/
void Motot3_Port_Init(void)
{
  GPIO_Init(GPIOC, MOTOR3_EN,  GPIO_MODE_OUT_PP_HIGH_SLOW);
	GPIO_Init(GPIOC, MOTOR3_MS1, GPIO_MODE_OUT_PP_LOW_SLOW);
  GPIO_Init(GPIOC, MOTOR3_MS2, GPIO_MODE_OUT_PP_LOW_SLOW);
  GPIO_Init(GPIOC, MOTOR3_MS3, GPIO_MODE_OUT_PP_LOW_SLOW);
	GPIO_Init(GPIOC, MOTOR3_STP, GPIO_MODE_OUT_PP_LOW_SLOW);
  
	GPIO_Init(GPIOD, MOTOR3_DIR, GPIO_MODE_OUT_PP_LOW_SLOW); //PD2

}

/*------------------Encoder2 GPIO SET--------------------*/
void Encoder3_Port_Init(void)
{
  GPIO_Init(GPIOD, ENCODER3_A,      GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(GPIOD, ENCODER3_B,      GPIO_MODE_IN_PU_NO_IT);
  GPIO_Init(GPIOD, ENCODER3_SWITCH, GPIO_MODE_IN_PU_NO_IT);
}


/*------------------LIMIT_SWITCH GPIO SET--------------------*/
void Limit_Switch_Port_Init(void)
{
  GPIO_Init(GPIOA, LIMIT_SWITCH_A,      GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(GPIOD, LIMIT_SWITCH_B,      GPIO_MODE_IN_PU_NO_IT);
}