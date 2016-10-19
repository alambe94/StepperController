/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __GPIO_CONFIG_H
#define __GPIO_CONFIG_H


/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"

/* Private defines -----------------------------------------------------------*/
#define MOTOR3_PORT GPIOC
#define MOTOR3_EN     GPIO_PIN_3
#define MOTOR3_MS1    GPIO_PIN_4
#define MOTOR3_MS2    GPIO_PIN_5
#define MOTOR3_MS3    GPIO_PIN_6
#define MOTOR3_STP    GPIO_PIN_7
#define MOTOR3_DIR    GPIO_PIN_2 //PD2



#define ENCODER3_PORT   GPIOD
#define ENCODER3_A      GPIO_PIN_3    
#define ENCODER3_B      GPIO_PIN_4
#define ENCODER3_SWITCH GPIO_PIN_5



#define LIMIT_SWITCH_PORT   GPIOA
#define LIMIT_SWITCH_A      GPIO_PIN_3  //PA3    
#define LIMIT_SWITCH_B      GPIO_PIN_6  //PD6



void Port_DeInit_All(void);
void Motot3_Port_Init(void);
void Encoder3_Port_Init(void);
void Limit_Switch_Port_Init(void);






























#endif /* __GPIO_CONFIG_H */
