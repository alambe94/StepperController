/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __GPIO_CONFIG_H
#define __GPIO_CONFIG_H


/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"

/* Private defines -----------------------------------------------------------*/
#define NRF_PORT GPIOC
#define CSN_GPIO_PORT GPIOC
#define CE_GPIO_PORT  GPIOB
#define IRQ_GPIO_PORT  GPIOB



#define MOSI_PIN GPIO_PIN_6 //GPIOC
#define MISO_PIN GPIO_PIN_7 //GPIOC
#define SCK_PIN  GPIO_PIN_5 //GPIOC

#define CSN_PIN GPIO_PIN_2 //GPIOC
#define CE_PIN  GPIO_PIN_5 //GPIOB
#define IRQ_PIN GPIO_PIN_4 //GPIOB


void Port_DeInit_All(void);
void Nrf_Gpio_Init(void);






























#endif /* __GPIO_CONFIG_H */
