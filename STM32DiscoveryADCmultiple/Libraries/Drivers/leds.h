/*
 * leds.h
 *
 */

#ifndef LEDS_H_
#define LEDS_H_
#include "stm32f10x.h"
#define LEDG 				GPIO_Pin_9
#define LEDB 				GPIO_Pin_8
#define LEDPORT				GPIOC
#define LEDPORTCLK			RCC_APB2Periph_GPIOC

void LEDsInit(void);
void LEDToggle(uint32_t LED_n);
#endif /* LEDS_H_ */
