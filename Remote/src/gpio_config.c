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

void Nrf_Gpio_Init(void)
{
		GPIO_Init(NRF_PORT,  (SCK_PIN ), GPIO_MODE_OUT_PP_HIGH_FAST);//sck
    GPIO_Init(NRF_PORT,  (MOSI_PIN), GPIO_MODE_OUT_PP_HIGH_FAST);//MOSI
    GPIO_Init(NRF_PORT,  (MISO_PIN), GPIO_MODE_IN_FL_NO_IT);//MISO

    GPIO_Init(CE_GPIO_PORT,   (CE_PIN ), GPIO_MODE_OUT_PP_HIGH_FAST);//ce 
    GPIO_Init(CSN_GPIO_PORT,  (CSN_PIN ), GPIO_MODE_OUT_PP_HIGH_FAST);//cs
    GPIO_Init(IRQ_GPIO_PORT,  (IRQ_PIN ), GPIO_MODE_IN_FL_NO_IT); //IRQ
	}

