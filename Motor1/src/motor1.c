#include "stm8s.h"
#include "millis.h"
#include "motor1.h"
#include "gpio_config.h"

#define ClockWise 1
#define CounterClockWise 0

int8_t Sequence = 0;
uint8_t SpeedDelay = 2;
uint32_t SpeedTimeKeep = 0;
uint8_t MotorDirection = ClockWise;

void Motor1MoveCCW(uint8_t val)
{	
	uint8_t i=0;
  MotorDirection = CounterClockWise;
	for(i=0;i<val;i++)
	{
	Motor1Move();
  }
	Motor1Stop();
}

void Motor1MoveCW(uint8_t val)
{	
  uint8_t i=0;
  MotorDirection = ClockWise;
	for(i=0;i<val;i++)
	{
	Motor1Move();
  }
	Motor1Stop();

}

void Motor1Stop(void)
{
		GPIO_WriteLow(Motor1_PORT, Motor1_A);
		GPIO_WriteLow(Motor1_PORT, Motor1_B);
		GPIO_WriteLow(Motor1_PORT, Motor1_C);
		GPIO_WriteLow(Motor1_PORT, Motor1_D);

}

void Motor1Move(void) {
	switch (Sequence) {
	case 0:
	
		GPIO_WriteHigh(Motor1_PORT, Motor1_A);
		GPIO_WriteLow(Motor1_PORT, Motor1_B);
		GPIO_WriteLow(Motor1_PORT, Motor1_C);
		GPIO_WriteLow(Motor1_PORT, Motor1_D);

		break;
	case 1:
		GPIO_WriteHigh(Motor1_PORT, Motor1_A);
		GPIO_WriteHigh(Motor1_PORT, Motor1_B);
		GPIO_WriteLow(Motor1_PORT, Motor1_C);
		GPIO_WriteLow(Motor1_PORT, Motor1_D);

		break;
	case 2:
		GPIO_WriteLow(Motor1_PORT, Motor1_A);
		GPIO_WriteHigh(Motor1_PORT, Motor1_B);
		GPIO_WriteLow(Motor1_PORT, Motor1_C);
		GPIO_WriteLow(Motor1_PORT, Motor1_D);

		break;
	case 3:
		GPIO_WriteLow(Motor1_PORT, Motor1_A);
		GPIO_WriteHigh(Motor1_PORT, Motor1_B);
		GPIO_WriteHigh(Motor1_PORT, Motor1_C);
		GPIO_WriteLow(Motor1_PORT, Motor1_D);

		break;
	case 4:
		GPIO_WriteLow(Motor1_PORT, Motor1_A);
		GPIO_WriteLow(Motor1_PORT, Motor1_B);
		GPIO_WriteHigh(Motor1_PORT, Motor1_C);
		GPIO_WriteLow(Motor1_PORT, Motor1_D);

		break;
	case 5:
		GPIO_WriteLow(Motor1_PORT, Motor1_A);
		GPIO_WriteLow(Motor1_PORT, Motor1_B);
		GPIO_WriteHigh(Motor1_PORT, Motor1_C);
		GPIO_WriteHigh(Motor1_PORT, Motor1_D);

		break;
	case 6:

		GPIO_WriteLow(Motor1_PORT, Motor1_A);
		GPIO_WriteLow(Motor1_PORT, Motor1_B);
		GPIO_WriteLow(Motor1_PORT, Motor1_C);
		GPIO_WriteHigh(Motor1_PORT, Motor1_D);

		break;
	case 7:

		GPIO_WriteHigh(Motor1_PORT, Motor1_A);
		GPIO_WriteLow(Motor1_PORT, Motor1_B);
		GPIO_WriteLow(Motor1_PORT, Motor1_C);
		GPIO_WriteHigh(Motor1_PORT, Motor1_D);


		break;
	default:

		GPIO_WriteLow(Motor1_PORT, Motor1_A);
		GPIO_WriteLow(Motor1_PORT, Motor1_B);
		GPIO_WriteLow(Motor1_PORT, Motor1_C);
		GPIO_WriteLow(Motor1_PORT, Motor1_D);

		break;
	}
	if (MotorDirection == ClockWise) {
		Sequence++;
	} else {
		Sequence--;
	}
	if (Sequence > 7) {
		Sequence = 0;
	}
	if (Sequence < 0) {
		Sequence = 7;
	}
	SpeedTimeKeep = millis();
	while (millis() - SpeedTimeKeep < (1));

}