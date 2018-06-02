/**
  ******************************************************************************
  * @file    main.c
  * @author  Natthawut Sibunnan
  * @version V1.0
  * @date    01-December-2013
  * @brief   Default main function.
  ******************************************************************************
*/

//Configuration ADC to channel 11 pin A4

#include "stm32f4xx_nucleo.h"
#include "stm32f4xx_hal.h"
#include "stm32_hal_legacy.h"

#include "stdio.h"
#include "stm32f4xx.h"

static void SystemClock_Config(void);
void ConfigureADC(void);
void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* AdcHandle);
void ADC_IRQHandler(void);
void ConfigureUART(void);
void ConfigureADC(void);
void ConfigureDMA(void);
void Error_Handler(void);

ADC_HandleTypeDef g_AdcHandle;
UART_HandleTypeDef s_UARTHandle;
DMA_HandleTypeDef  g_DmaHandle;


char buffer[5];
uint16_t adc_value[3];
uint16_t g_ADCValue;
int g_MeasurementNumber;


int main(void)
{
	//setting up init hal driver
	HAL_Init();
	ConfigureADC();
	SystemClock_Config();
	ConfigureDMA();
	ConfigureUART();

	//adc start
	/* - When you call HAL_ADC_Start_IT() it calls __HAL_ADC_ENABLE_IT() to enable the overrun and end-of-conversion interrupts
	 * - call HAL_NVIC_EnableIRQ(), it enables the ADC IRQ in the interrupt controller*/

	HAL_ADC_Start_IT(&g_AdcHandle);


	for (;;)
	{
		sprintf(buffer, "%d\n",g_ADCValue);
	    HAL_UART_Transmit(&s_UARTHandle,buffer, sizeof(buffer), HAL_MAX_DELAY);
	}
}
//clock configuration
static void SystemClock_Config(void)
{
    RCC_ClkInitTypeDef RCC_ClkInitStruct;
    RCC_OscInitTypeDef RCC_OscInitStruct;

    __HAL_RCC_PWR_CLK_ENABLE();
    __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE2);

    RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
    RCC_OscInitStruct.HSEState = RCC_HSE_ON;
    RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
    RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
    RCC_OscInitStruct.PLL.PLLM = 8;
    RCC_OscInitStruct.PLL.PLLN = 288;
    RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
    RCC_OscInitStruct.PLL.PLLQ = 6;
    HAL_RCC_OscConfig(&RCC_OscInitStruct);

    RCC_ClkInitStruct.ClockType = (RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2);
    RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
    RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
    RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
    RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;
    HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_4);
    SystemCoreClockUpdate();

    if (HAL_GetREVID() == 0x1001)
        __HAL_FLASH_PREFETCH_BUFFER_ENABLE();
}


void ConfigureADC()
{
    GPIO_InitTypeDef gpioInit;

    __GPIOC_CLK_ENABLE();
    __ADC1_CLK_ENABLE();

    gpioInit.Pin = GPIO_PIN_1;
    gpioInit.Mode = GPIO_MODE_ANALOG;
    gpioInit.Pull = GPIO_NOPULL;
    HAL_GPIO_Init(GPIOC, &gpioInit);

    HAL_NVIC_SetPriority(ADC_IRQn, 0, 0);
    HAL_NVIC_EnableIRQ(ADC_IRQn);

    ADC_ChannelConfTypeDef adcChannel;

    g_AdcHandle.Instance = ADC1;

    g_AdcHandle.Init.ClockPrescaler = ADC_CLOCKPRESCALER_PCLK_DIV2;
    g_AdcHandle.Init.Resolution = ADC_RESOLUTION_12B;
    g_AdcHandle.Init.ScanConvMode = ENABLE;
    g_AdcHandle.Init.ContinuousConvMode = ENABLE;
    g_AdcHandle.Init.DiscontinuousConvMode = DISABLE;
    g_AdcHandle.Init.NbrOfDiscConversion = 0;
    g_AdcHandle.Init.ExternalTrigConvEdge = ADC_EXTERNALTRIGCONVEDGE_NONE;
    g_AdcHandle.Init.ExternalTrigConv = ADC_EXTERNALTRIGCONV_T1_CC1;
    g_AdcHandle.Init.DataAlign = ADC_DATAALIGN_RIGHT;
    g_AdcHandle.Init.NbrOfConversion = 1;
    g_AdcHandle.Init.DMAContinuousRequests = ENABLE;
    g_AdcHandle.Init.EOCSelection = DISABLE;


    HAL_ADC_Init(&g_AdcHandle);

    adcChannel.Channel = ADC_CHANNEL_11;
    adcChannel.Rank = 1;
    adcChannel.SamplingTime = ADC_SAMPLETIME_480CYCLES;
    adcChannel.Offset = 0;

    if (HAL_ADC_ConfigChannel(&g_AdcHandle, &adcChannel) != HAL_OK)
    {
    	Error_Handler();
    }
}


void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* AdcHandle)
{
    g_ADCValue = HAL_ADC_GetValue(AdcHandle);
//    g_ADCValue = (g_ADCValue*5)/4096; //convert digital data from adc to voltage
}

void ADC_IRQHandler()
{
    HAL_ADC_IRQHandler(&g_AdcHandle);
}



void ConfigureUART(){

	__USART2_CLK_ENABLE();
	__GPIOA_CLK_ENABLE();

	GPIO_InitTypeDef GPIO_InitStructure;

	GPIO_InitStructure.Pin = GPIO_PIN_2;
	GPIO_InitStructure.Mode = GPIO_MODE_AF_PP;
	GPIO_InitStructure.Alternate = GPIO_AF7_USART2;
	GPIO_InitStructure.Speed = GPIO_SPEED_HIGH;
	GPIO_InitStructure.Pull = GPIO_NOPULL;
	HAL_GPIO_Init(GPIOA, &GPIO_InitStructure);

	GPIO_InitStructure.Pin = GPIO_PIN_3;
	GPIO_InitStructure.Mode = GPIO_MODE_AF_OD;
	HAL_GPIO_Init(GPIOA, &GPIO_InitStructure);

	s_UARTHandle.Instance        = USART2;
	s_UARTHandle.Init.BaudRate   = 115200;
	s_UARTHandle.Init.WordLength = UART_WORDLENGTH_8B;
	s_UARTHandle.Init.StopBits   = UART_STOPBITS_1;
	s_UARTHandle.Init.Parity     = UART_PARITY_NONE;
	s_UARTHandle.Init.HwFlowCtl  = UART_HWCONTROL_NONE;
	s_UARTHandle.Init.Mode       = UART_MODE_TX_RX;

	if (HAL_UART_Init(&s_UARTHandle) != HAL_OK)
		Error_Handler();
}




void ConfigureDMA(){
	__DMA2_CLK_ENABLE();
	g_DmaHandle.Instance = DMA2_Stream4;

	g_DmaHandle.Init.Channel  = DMA_CHANNEL_0;
	g_DmaHandle.Init.Direction = DMA_PERIPH_TO_MEMORY;
	g_DmaHandle.Init.PeriphInc = DMA_PINC_DISABLE;
	g_DmaHandle.Init.MemInc = DMA_MINC_ENABLE;
	g_DmaHandle.Init.PeriphDataAlignment = DMA_PDATAALIGN_WORD;
	g_DmaHandle.Init.MemDataAlignment = DMA_MDATAALIGN_WORD;
	g_DmaHandle.Init.Mode = DMA_CIRCULAR;
	g_DmaHandle.Init.Priority = DMA_PRIORITY_HIGH;
	g_DmaHandle.Init.FIFOMode = DMA_FIFOMODE_DISABLE;
	g_DmaHandle.Init.FIFOThreshold = DMA_FIFO_THRESHOLD_HALFFULL;
	g_DmaHandle.Init.MemBurst = DMA_MBURST_SINGLE;
	g_DmaHandle.Init.PeriphBurst = DMA_PBURST_SINGLE;

	HAL_DMA_Init(&g_DmaHandle);

	__HAL_LINKDMA(&g_AdcHandle, DMA_Handle, g_DmaHandle);
	__HAL_LINKDMA(&s_UARTHandle, hdmatx, g_DmaHandle);

}
/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @param  None
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler */
  /* User can add his own implementation to report the HAL error return state */
  while(1)
  {
  }
  /* USER CODE END Error_Handler */
}

#ifdef USE_FULL_ASSERT

/**
   * @brief Reports the name of the source file and the source line number
   * where the assert_param error has occurred.
   * @param file: pointer to the source file name
   * @param line: assert_param error line source number
   * @retval None
   */
void assert_failed(uint8_t* file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
    ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */

}

#endif

/**
  * @}
  */

/**
  * @}
*/
