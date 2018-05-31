################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/arm_fft_bin_data.c \
../src/main.c \
../src/stm32f4xx_it.c \
../src/syscalls.c \
../src/system_stm32f4xx.c 

OBJS += \
./src/arm_fft_bin_data.o \
./src/main.o \
./src/stm32f4xx_it.o \
./src/syscalls.o \
./src/system_stm32f4xx.o 

C_DEPS += \
./src/arm_fft_bin_data.d \
./src/main.d \
./src/stm32f4xx_it.d \
./src/syscalls.d \
./src/system_stm32f4xx.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32 -DSTM32F4 -DSTM32F401RETx -DNUCLEO_F401RE -DDEBUG -DSTM32F401xE -DUSE_HAL_DRIVER -I"/Users/atz/Documents/workspace/fft/HAL_Driver/Inc/Legacy" -I"/Users/atz/Documents/workspace/fft/CMSIS/Core/Include" -I"/Users/atz/Documents/workspace/fft/CMSIS/DSP/Include" -I"/Users/atz/Documents/workspace/fft/CMSIS/Lib/GCC" -I"/Users/atz/Documents/workspace/fft/CMSIS/device" -I"/Users/atz/Documents/workspace/fft/Utilities/STM32F4xx-Nucleo" -I"/Users/atz/Documents/workspace/fft/inc" -I"/Users/atz/Documents/workspace/fft/CMSIS/device" -I"/Users/atz/Documents/workspace/fft/CMSIS/core" -I"/Users/atz/Documents/workspace/fft/HAL_Driver/Inc" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


