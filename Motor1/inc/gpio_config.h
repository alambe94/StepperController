/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __GPIO_CONFIG_H
#define __GPIO_CONFIG_H


/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"

/* Private defines -----------------------------------------------------------*/
#define Motor1_PORT GPIOC
#define Motor1_A    GPIO_PIN_3
#define Motor1_B    GPIO_PIN_4
#define Motor1_C    GPIO_PIN_5
#define Motor1_D    GPIO_PIN_6

#define ENCODER2_PORT   GPIOD
#define ENCODER2_A      GPIO_PIN_3    
#define ENCODER2_B      GPIO_PIN_4
#define ENCODER2_SWITCH GPIO_PIN_2


#define LIMIT_SWITCH_PORT   GPIOA  PC7
#define LIMIT_SWITCH_A      GPIO_PIN_3    
#define LIMIT_SWITCH_B      GPIO_PIN_7  //PC7  


void Port_DeInit_All(void);
void Motot1_Port_Init(void);
void Encoder1_Port_Init(void);
void Limit_Switch_Port_Init(void);






























#endif /* __GPIO_CONFIG_H */
