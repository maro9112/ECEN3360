################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../driver/adc.c \
../driver/crp.c \
../driver/debug_printf.c \
../driver/gpio.c \
../driver/timer16.c \
../driver/timer32.c 

OBJS += \
./driver/adc.o \
./driver/crp.o \
./driver/debug_printf.o \
./driver/gpio.o \
./driver/timer16.o \
./driver/timer32.o 

C_DEPS += \
./driver/adc.d \
./driver/crp.d \
./driver/debug_printf.d \
./driver/gpio.d \
./driver/timer16.d \
./driver/timer32.d 


# Each subdirectory must supply rules for building sources it contributes
driver/%.o: ../driver/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -D__USE_CMSIS -DDEBUG -D__CODE_RED -I../cmsis -I"/Users/madisonrockwell/Documents/LPCXpresso_6.1.2/workspace/lib_small_printf_m0/inc" -I../config -I../driver -I"/Users/madisonrockwell/Documents/LPCXpresso_6.1.2/workspace/adc/driver" -O0 -g3 -Wall -c -fmessage-length=0 -fno-builtin -ffunction-sections -fdata-sections -mcpu=cortex-m0 -mthumb -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


