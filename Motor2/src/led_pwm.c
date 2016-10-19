#include "stm8s.h"
#include "millis.h"
#include "motor2.h"
#include "led_pwm.h"
#include "gpio_config.h"


uint16_t CCR3_Val =0;


void Led_Pwm_init(void)
{
	TIM2_DeInit();

  TIM2_TimeBaseInit(TIM2_PRESCALER_1, 79);

  TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,CCR3_Val, TIM2_OCPOLARITY_LOW);
  TIM2_OC3PreloadConfig(ENABLE);

  TIM2_ARRPreloadConfig(ENABLE);

  TIM2_Cmd(ENABLE);
}


void Set_Led_Pwm(uint16_t val)
{
    /* Set the Capture Compare3 Register value */
    TIM2->CCR3H = (uint8_t)(val >> 8);
    TIM2->CCR3L = (uint8_t)(val);
}