################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../cmsis/core_cm0.c \
../cmsis/system_LPC11xx.c 

OBJS += \
./cmsis/core_cm0.o \
./cmsis/system_LPC11xx.o 

C_DEPS += \
./cmsis/core_cm0.d \
./cmsis/system_LPC11xx.d 


# Each subdirectory must supply rules for building sources it contributes
cmsis/%.o: ../cmsis/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -DDEBUG -D__CODE_RED -D__REDLIB__ -I"/Users/madisonrockwell/Documents/LPCXpresso_6.1.2/workspace/asm_xample11/asm_xample11/driver" -I"/Users/madisonrockwell/Documents/LPCXpresso_6.1.2/workspace/asm_xample11/asm_xample11/cmsis" -I"/Users/madisonrockwell/Documents/LPCXpresso_6.1.2/workspace/asm_xample11/asm_xample11/config" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -Wa,-ahlnds=$(basename $(notdir $@)).asm -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


