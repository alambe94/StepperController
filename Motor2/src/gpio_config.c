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

/*------------------MOTOR2 GPIO SET--------------------*/
void Motot2_Port_Init(void)
{
  GPIO_Init(GPIOC, MOTOR2_A, GPIO_MODE_OUT_PP_LOW_SLOW);
	GPIO_Init(GPIOC, MOTOR2_B, GPIO_MODE_OUT_PP_LOW_SLOW);
  GPIO_Init(GPIOC, MOTOR2_C, GPIO_MODE_OUT_PP_LOW_SLOW);
  GPIO_Init(GPIOC, MOTOR2_D, GPIO_MODE_OUT_PP_LOW_SLOW);
}

/*------------------Encoder2 GPIO SET--------------------*/
void Encoder2_Port_Init(void)
{
  GPIO_Init(GPIOD, ENCODER2_A,      GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(GPIOD, ENCODER2_B,      GPIO_MODE_IN_PU_NO_IT);
  GPIO_Init(GPIOD, ENCODER2_SWITCH, GPIO_MODE_IN_PU_NO_IT);
}

/*------------------ENCODER4 GPIO SET--------------------*/
void Encoder4_Port_Init(void)
{
  GPIO_Init(GPIOD, ENCODER4_A,      GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(GPIOC, ENCODER4_B,      GPIO_MODE_IN_PU_NO_IT);
  GPIO_Init(GPIOD, ENCODER4_SWITCH, GPIO_MODE_IN_PU_NO_IT);
}

/*------------------LED_PWM GPIO SET--------------------*/
void Led_Pwm_Port_Init(void)
{
  GPIO_Init(GPIOA, LED_PWM,      GPIO_MODE_OUT_PP_HIGH_SLOW);
}

/*------------------LIMIT_SWITCH GPIO SET--------------------*/
void Limit_Switch_Port_Init(void)
{
  GPIO_Init(GPIOA, LIMIT_SWITCH_A,      GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(GPIOA, LIMIT_SWITCH_B,      GPIO_MODE_IN_PU_NO_IT);
}