/**************************************************************************//**
 * @file     startup_ARMCM3.s
 * @brief    CMSIS Core Device Startup File for
 *           ARMCM3 Device Series
 * @version  V1.07
 * @date     30. January 2012
 *
 * @note     Version CodeSourcery Sourcery G++ Lite (with CS3)
 * Copyright (C) 2012 ARM Limited. All rights reserved.
 *
 * @par
 * ARM Limited (ARM) is supplying this software for use with Cortex-M 
 * processor based microcontrollers.  This file can be freely distributed 
 * within development tools that are supporting such ARM based processors. 
 *
 * @par
 * THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
 * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
 * ARM SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR
 * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
 *
 ******************************************************************************/
/*
//-------- <<< Use Configuration Wizard in Context Menu >>> ------------------
*/


/*
// <h> Stack Configuration
//   <o> Stack Size (in Bytes) <0x0-0xFFFFFFFF:8>
// </h>
*/

    .equ    Stack_Size, 0x00000400

    .section ".stack", "w"
    .align  3
    .globl  __cs3_stack_mem
    .globl  __cs3_stack_size
__cs3_stack_mem:
    .if     Stack_Size
    .space  Stack_Size
    .endif
    .size   __cs3_stack_mem,  . - __cs3_stack_mem
    .set    __cs3_stack_size, . - __cs3_stack_mem


/*
// <h> Heap Configuration
//   <o>  Heap Size (in Bytes) <0x0-0xFFFFFFFF:8>
// </h>
*/

    .equ    Heap_Size,  0x00000C00
    
    .section ".heap", "w"
    .align  3
    .globl  __cs3_heap_start
    .globl  __cs3_heap_end
__cs3_heap_start:
    .if     Heap_Size
    .space  Heap_Size
    .endif
__cs3_heap_end:


/* Vector Table */

    .section ".cs3.interrupt_vector"
    .globl  __cs3_interrupt_vector_cortex_m
    .type   __cs3_interrupt_vector_cortex_m, %object

__cs3_interrupt_vector_cortex_m:
    .long   __cs3_stack                 /* Top of Stack                 */
    .long   __cs3_reset                 /* Reset Handler                */
    .long   NMI_Handler                 /* NMI Handler                  */
    .long   HardFault_Handler           /* Hard Fault Handler           */
    .long   MemManage_Handler           /* MPU Fault Handler            */
    .long   BusFault_Handler            /* Bus Fault Handler            */
    .long   UsageFault_Handler          /* Usage Fault Handler          */
    .long   0                           /* Reserved                     */
    .long   0                           /* Reserved                     */
    .long   0                           /* Reserved                     */
    .long   0                           /* Reserved                     */
    .long   SVC_Handler                 /* SVCall Handler               */
    .long   DebugMon_Handler            /* Debug Monitor Handler        */
    .long   0                           /* Reserved                     */
    .long   PendSV_Handler              /* PendSV Handler               */
    .long   SysTick_Handler             /* SysTick Handler              */

    /* External Interrupts */
    .long   WWDG_IRQHandler                   /* Window WatchDog Interrupt */
	.long   PVD_IRQHandler                    /* PVD through EXTI Line detection Interrupt */
	.long   TAMPER_IRQHandler                 /* Tamper Interrupt */
	.long   RTC_IRQHandler                    /* RTC global Interrupt */
	.long   FLASH_IRQHandler                  /* FLASH global Interrupt */
	.long   RCC_IRQHandler                    /* RCC global Interrupt */
	.long   EXTI0_IRQHandler                  /* EXTI Line0 Interrupt */
	.long   EXTI1_IRQHandler                  /* EXTI Line1 Interrupt */
	.long   EXTI2_IRQHandler                  /* EXTI Line2 Interrupt */
	.long   EXTI3_IRQHandler                  /* EXTI Line3 Interrupt */
	.long   EXTI4_IRQHandler                  /* EXTI Line4 Interrupt */
	.long   DMA1_Channel1_IRQHandler          /* DMA1 Channel 1 global Interrupt */
	.long   DMA1_Channel2_IRQHandler          /* DMA1 Channel 2 global Interrupt */
	.long   DMA1_Channel3_IRQHandler          /* DMA1 Channel 3 global Interrupt */
	.long   DMA1_Channel4_IRQHandler          /* DMA1 Channel 4 global Interrupt */
	.long   DMA1_Channel5_IRQHandler          /* DMA1 Channel 5 global Interrupt */
	.long   DMA1_Channel6_IRQHandler          /* DMA1 Channel 6 global Interrupt */
	.long   DMA1_Channel7_IRQHandler			/* DMA1 Channel 7 global Interrupt */

    .long   ADC1_IRQHandler                   /* ADC1 global Interrupt */
	.long   0                           /* Reserved */
	.long   0                           /* Reserved */
	.long   0                           /* Reserved */
	.long   0                           /* Reserved */
	.long   EXTI9_5_IRQHandler                /* External Line[9:5] Interrupts */
	.long   TIM1_BRK_TIM15_IRQHandler         /* TIM1 Break and TIM15 Interrupts */
	.long   TIM1_UP_TIM16_IRQHandler          /* TIM1 Update and TIM16 Interrupts */
	.long   TIM1_TRG_COM_TIM17_IRQHandler     /* TIM1 Trigger and Commutation and TIM17 Interrupt */
	.long   TIM1_CC_IRQHandler                /* TIM1 Capture Compare Interrupt */
	.long   TIM2_IRQHandler                   /* TIM2 global Interrupt */
	.long   TIM3_IRQHandler                   /* TIM3 global Interrupt */
	.long   TIM4_IRQHandler                   /* TIM4 global Interrupt */
	.long   I2C1_EV_IRQHandler                /* I2C1 Event Interrupt */
	.long   I2C1_ER_IRQHandler                /* I2C1 Error Interrupt */
	.long   I2C2_EV_IRQHandler                /* I2C2 Event Interrupt */
	.long   I2C2_ER_IRQHandler                /* I2C2 Error Interrupt */
	.long   SPI1_IRQHandler                   /* SPI1 global Interrupt */
	.long   SPI2_IRQHandler                   /* SPI2 global Interrupt */
	.long   USART1_IRQHandler                 /* USART1 global Interrupt */
	.long   USART2_IRQHandler                 /* USART2 global Interrupt */
	.long   USART3_IRQHandler                 /* USART3 global Interrupt */
	.long   EXTI15_10_IRQHandler              /* External Line[15:10] Interrupts */
	.long   RTCAlarm_IRQHandler               /* RTC Alarm through EXTI Line Interrupt */
	.long   CEC_IRQHandler                    /* HDMI-CEC Interrupt */
	.long   0                           /* Reserved */
	.long   0                           /* Reserved */
	.long   0                           /* Reserved */
	.long   0                           /* Reserved */
	.long   0                           /* Reserved */
	.long   0                           /* Reserved */
	.long   0                           /* Reserved */
	.long   0                           /* Reserved */
	.long   0                           /* Reserved */
	.long   0                           /* Reserved */
	.long   0                           /* Reserved */
	.long   TIM6_DAC_IRQHandler               /* TIM6 and DAC underrun Interrupt */
	.long   TIM7_IRQHandler                   /* TIM7 Interrupt */

    .size   __cs3_interrupt_vector_cortex_m, . - __cs3_interrupt_vector_cortex_m


    .thumb


/* Reset Handler */

    .section .cs3.reset,"x",%progbits
    .thumb_func
    .globl  __cs3_reset_cortex_m
    .type   __cs3_reset_cortex_m, %function
__cs3_reset_cortex_m:
    .fnstart
    LDR     R0, =SystemInit
    BLX     R0
    LDR     R0,=_start
    BX      R0
    .pool
    .cantunwind
    .fnend
    .size   __cs3_reset_cortex_m,.-__cs3_reset_cortex_m

    .section ".text"

/* Exception Handlers */

    .weak   NMI_Handler
    .type   NMI_Handler, %function
NMI_Handler:
    B       .
    .size   NMI_Handler, . - NMI_Handler

    .weak   HardFault_Handler
    .type   HardFault_Handler, %function
HardFault_Handler:
    B       .
    .size   HardFault_Handler, . - HardFault_Handler

    .weak   MemManage_Handler
    .type   MemManage_Handler, %function
MemManage_Handler:
    B       .
    .size   MemManage_Handler, . - MemManage_Handler

    .weak   BusFault_Handler
    .type   BusFault_Handler, %function
BusFault_Handler:
    B       .
    .size   BusFault_Handler, . - BusFault_Handler

    .weak   UsageFault_Handler
    .type   UsageFault_Handler, %function
UsageFault_Handler:
    B       .
    .size   UsageFault_Handler, . - UsageFault_Handler

    .weak   SVC_Handler
    .type   SVC_Handler, %function
SVC_Handler:
    B       .
    .size   SVC_Handler, . - SVC_Handler

    .weak   DebugMon_Handler
    .type   DebugMon_Handler, %function
DebugMon_Handler:
    B       .
    .size   DebugMon_Handler, . - DebugMon_Handler

    .weak   PendSV_Handler
    .type   PendSV_Handler, %function
PendSV_Handler:
    B       .
    .size   PendSV_Handler, . - PendSV_Handler

    .weak   SysTick_Handler
    .type   SysTick_Handler, %function
SysTick_Handler:
    B       .
    .size   SysTick_Handler, . - SysTick_Handler


/* IRQ Handlers */

    .globl  Default_Handler
    .type   Default_Handler, %function
Default_Handler:
    B       .
    .size   Default_Handler, . - Default_Handler

    .macro  def_irq_handler handler
    .weak   \handler
    .set    \handler, Default_Handler
    .endm

    /* External Interrupts */
    def_irq_handler    WWDG_IRQHandler                   /* Window WatchDog Interrupt */
	def_irq_handler    PVD_IRQHandler                    /* PVD through EXTI Line detection Interrupt */
	def_irq_handler    TAMPER_IRQHandler                 /* Tamper Interrupt */
	def_irq_handler    RTC_IRQHandler                    /* RTC global Interrupt */
	def_irq_handler    FLASH_IRQHandler                  /* FLASH global Interrupt */
	def_irq_handler    RCC_IRQHandler                    /* RCC global Interrupt */
	def_irq_handler    EXTI0_IRQHandler                  /* EXTI Line0 Interrupt */
	def_irq_handler    EXTI1_IRQHandler                  /* EXTI Line1 Interrupt */
	def_irq_handler    EXTI2_IRQHandler                  /* EXTI Line2 Interrupt */
	def_irq_handler    EXTI3_IRQHandler                  /* EXTI Line3 Interrupt */
	def_irq_handler    EXTI4_IRQHandler                  /* EXTI Line4 Interrupt */
	def_irq_handler    DMA1_Channel1_IRQHandler          /* DMA1 Channel 1 global Interrupt */
	def_irq_handler    DMA1_Channel2_IRQHandler          /* DMA1 Channel 2 global Interrupt */
	def_irq_handler    DMA1_Channel3_IRQHandler          /* DMA1 Channel 3 global Interrupt */
	def_irq_handler    DMA1_Channel4_IRQHandler          /* DMA1 Channel 4 global Interrupt */
	def_irq_handler    DMA1_Channel5_IRQHandler          /* DMA1 Channel 5 global Interrupt */
	def_irq_handler    DMA1_Channel6_IRQHandler          /* DMA1 Channel 6 global Interrupt */
	def_irq_handler    DMA1_Channel7_IRQHandler			/* DMA1 Channel 7 global Interrupt */

    def_irq_handler    ADC1_IRQHandler                   /* ADC1 global Interrupt */
	def_irq_handler    EXTI9_5_IRQHandler                /* External Line[9:5] Interrupts */
	def_irq_handler    TIM1_BRK_TIM15_IRQHandler         /* TIM1 Break and TIM15 Interrupts */
	def_irq_handler    TIM1_UP_TIM16_IRQHandler          /* TIM1 Update and TIM16 Interrupts */
	def_irq_handler    TIM1_TRG_COM_TIM17_IRQHandler     /* TIM1 Trigger and Commutation and TIM17 Interrupt */
	def_irq_handler    TIM1_CC_IRQHandler                /* TIM1 Capture Compare Interrupt */
	def_irq_handler    TIM2_IRQHandler                   /* TIM2 global Interrupt */
	def_irq_handler    TIM3_IRQHandler                   /* TIM3 global Interrupt */
	def_irq_handler    TIM4_IRQHandler                   /* TIM4 global Interrupt */
	def_irq_handler    I2C1_EV_IRQHandler                /* I2C1 Event Interrupt */
	def_irq_handler    I2C1_ER_IRQHandler                /* I2C1 Error Interrupt */
	def_irq_handler    I2C2_EV_IRQHandler                /* I2C2 Event Interrupt */
	def_irq_handler    I2C2_ER_IRQHandler                /* I2C2 Error Interrupt */
	def_irq_handler    SPI1_IRQHandler                   /* SPI1 global Interrupt */
	def_irq_handler    SPI2_IRQHandler                   /* SPI2 global Interrupt */
	def_irq_handler    USART1_IRQHandler                 /* USART1 global Interrupt */
	def_irq_handler    USART2_IRQHandler                 /* USART2 global Interrupt */
	def_irq_handler    USART3_IRQHandler                 /* USART3 global Interrupt */
	def_irq_handler    EXTI15_10_IRQHandler              /* External Line[15:10] Interrupts */
	def_irq_handler    RTCAlarm_IRQHandler               /* RTC Alarm through EXTI Line Interrupt */
	def_irq_handler    CEC_IRQHandler                    /* HDMI-CEC Interrupt */
	def_irq_handler    TIM6_DAC_IRQHandler               /* TIM6 and DAC underrun Interrupt */
	def_irq_handler    TIM7_IRQHandler                   /* TIM7 Interrupt */

    .end
