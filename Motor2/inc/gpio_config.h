/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __GPIO_CONFIG_H
#define __GPIO_CONFIG_H


/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"

/* Private defines -----------------------------------------------------------*/
#define MOTOR2_PORT GPIOC
#define MOTOR2_A    GPIO_PIN_3
#define MOTOR2_B    GPIO_PIN_4
#define MOTOR2_C    GPIO_PIN_5
#define MOTOR2_D    GPIO_PIN_6

#define ENCODER2_PORT   GPIOD
#define ENCODER2_A      GPIO_PIN_2    
#define ENCODER2_B      GPIO_PIN_4
#define ENCODER2_SWITCH GPIO_PIN_6

#define ENCODER4_PORT   GPIOD
#define ENCODER4_A      GPIO_PIN_3    
#define ENCODER4_B      GPIO_PIN_7  //PC7
#define ENCODER4_SWITCH GPIO_PIN_5


#define LIMIT_SWITCH_PORT   GPIOA
#define LIMIT_SWITCH_A      GPIO_PIN_1    
#define LIMIT_SWITCH_B      GPIO_PIN_2  


#define LED_PWM_PORT GPIOA
#define LED_PWM      GPIO_PIN_3

void Port_DeInit_All(void);
void Motot2_Port_Init(void);
void Encoder2_Port_Init(void);
void Encoder4_Port_Init(void);
void Led_Pwm_Port_Init(void);
void Limit_Switch_Port_Init(void);






























#endif /* __GPIO_CONFIG_H */
