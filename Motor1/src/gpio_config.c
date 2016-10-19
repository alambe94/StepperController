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

/*------------------Motor1 GPIO SET--------------------*/
void Motot1_Port_Init(void)
{
  GPIO_Init(GPIOC, Motor1_A, GPIO_MODE_OUT_PP_LOW_SLOW);
	GPIO_Init(GPIOC, Motor1_B, GPIO_MODE_OUT_PP_LOW_SLOW);
  GPIO_Init(GPIOC, Motor1_C, GPIO_MODE_OUT_PP_LOW_SLOW);
  GPIO_Init(GPIOC, Motor1_D, GPIO_MODE_OUT_PP_LOW_SLOW);
}

/*------------------Encoder2 GPIO SET--------------------*/
void Encoder1_Port_Init(void)
{
  GPIO_Init(GPIOD, ENCODER2_A,      GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(GPIOD, ENCODER2_B,      GPIO_MODE_IN_PU_NO_IT);
  GPIO_Init(GPIOD, ENCODER2_SWITCH, GPIO_MODE_IN_PU_NO_IT);
}


/*------------------LIMIT_SWITCH GPIO SET--------------------*/
void Limit_Switch_Port_Init(void)
{
  GPIO_Init(GPIOA, LIMIT_SWITCH_A,      GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(GPIOC, LIMIT_SWITCH_B,      GPIO_MODE_IN_PU_NO_IT);
}