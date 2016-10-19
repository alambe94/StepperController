#include "stm8s.h"
#include "millis.h"
#include "motor3.h"
#include "gpio_config.h"

#define ClockWise 1
#define CounterClockWise 0

int8_t Sequence = 0;
uint8_t SpeedDelay = 2;
uint32_t SpeedTimeKeep = 0;
uint8_t MotorDirection = ClockWise;

void Motor3MoveCCW(uint8_t val)
{	
	uint8_t i=0;
  MotorDirection = CounterClockWise;
	GPIO_WriteLow(GPIOD, MOTOR3_DIR);
	for(i=0;i<val;i++)
	{
	Motor3Move();
  }
	Motor3Stop();
}

void Motor3MoveCW(uint8_t val)
{	
  uint8_t i=0;
  MotorDirection = ClockWise;
	GPIO_WriteHigh(GPIOD, MOTOR3_DIR);
	for(i=0;i<val;i++)
	{
	Motor3Move();
  }
	Motor3Stop();
}

void Motor3Stop(void)
{
		GPIO_WriteLow(MOTOR3_PORT, MOTOR3_STP);
		GPIO_WriteHigh(MOTOR3_PORT, MOTOR3_EN);
}

void Motor3Move(void) {
		
	GPIO_WriteLow(MOTOR3_PORT, MOTOR3_EN);
	GPIO_WriteHigh(MOTOR3_PORT, MOTOR3_STP);
	SpeedTimeKeep = millis();
	while (millis() - SpeedTimeKeep < (1));
	GPIO_WriteLow(MOTOR3_PORT, MOTOR3_STP);
	SpeedTimeKeep = millis();
	while (millis() - SpeedTimeKeep < (1));
	GPIO_WriteHigh(MOTOR3_PORT, MOTOR3_EN);


}