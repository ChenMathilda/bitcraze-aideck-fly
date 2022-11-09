cmd_src/platform/src/platform_stm32f4.o := arm-none-eabi-gcc -Wp,-MD,src/platform/src/.platform_stm32f4.o.d    -I/home/mathilda/crazyflie-firmware/src/platform/src -Isrc/platform/src -D__firmware__ -fno-exceptions -Wall -Wmissing-braces -fno-strict-aliasing -ffunction-sections -fdata-sections -Wdouble-promotion -std=gnu11 -DCRAZYFLIE_FW   -I/home/mathilda/crazyflie-firmware/vendor/CMSIS/CMSIS/Core/Include   -I/home/mathilda/crazyflie-firmware/vendor/CMSIS/CMSIS/DSP/Include   -I/home/mathilda/crazyflie-firmware/vendor/libdw1000/inc   -I/home/mathilda/crazyflie-firmware/vendor/FreeRTOS/include   -I/home/mathilda/crazyflie-firmware/vendor/FreeRTOS/portable/GCC/ARM_CM4F   -I/home/mathilda/crazyflie-firmware/src/config   -I/home/mathilda/crazyflie-firmware/src/platform/interface   -I/home/mathilda/crazyflie-firmware/src/deck/interface   -I/home/mathilda/crazyflie-firmware/src/deck/drivers/interface   -I/home/mathilda/crazyflie-firmware/src/drivers/interface   -I/home/mathilda/crazyflie-firmware/src/drivers/bosch/interface   -I/home/mathilda/crazyflie-firmware/src/drivers/esp32/interface   -I/home/mathilda/crazyflie-firmware/src/hal/interface   -I/home/mathilda/crazyflie-firmware/src/modules/interface   -I/home/mathilda/crazyflie-firmware/src/modules/interface/kalman_core   -I/home/mathilda/crazyflie-firmware/src/modules/interface/lighthouse   -I/home/mathilda/crazyflie-firmware/src/utils/interface   -I/home/mathilda/crazyflie-firmware/src/utils/interface/kve   -I/home/mathilda/crazyflie-firmware/src/utils/interface/lighthouse   -I/home/mathilda/crazyflie-firmware/src/utils/interface/tdoa   -I/home/mathilda/crazyflie-firmware/src/lib/FatFS   -I/home/mathilda/crazyflie-firmware/src/lib/CMSIS/STM32F4xx/Include   -I/home/mathilda/crazyflie-firmware/src/lib/STM32_USB_Device_Library/Core/inc   -I/home/mathilda/crazyflie-firmware/src/lib/STM32_USB_OTG_Driver/inc   -I/home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc   -I/home/mathilda/crazyflie-firmware/src/lib/vl53l1   -I/home/mathilda/crazyflie-firmware/src/lib/vl53l1/core/inc   -I/home/mathilda/bitcraze-aideck-fly/build/include/generated -fno-delete-null-pointer-checks --param=allow-store-data-races=0 -Wno-unused-but-set-variable -Wno-unused-const-variable -fomit-frame-pointer -fno-var-tracking-assignments -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -Werror=implicit-int -Werror=date-time -DCC_HAVE_ASM_GOTO -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -g3 -fno-math-errno -DARM_MATH_CM4 -D__FPU_PRESENT=1 -mfp16-format=ieee -Wno-array-bounds -Wno-stringop-overread -Wno-stringop-overflow -DSTM32F4XX -DSTM32F40_41xxx -DHSE_VALUE=8000000 -DUSE_STDPERIPH_DRIVER   -I/home/mathilda/bitcraze-aideck-fly/src/control_task   -I/home/mathilda/bitcraze-aideck-fly/src/uart_task   -c -o src/platform/src/platform_stm32f4.o /home/mathilda/crazyflie-firmware/src/platform/src/platform_stm32f4.c

source_src/platform/src/platform_stm32f4.o := /home/mathilda/crazyflie-firmware/src/platform/src/platform_stm32f4.c

deps_src/platform/src/platform_stm32f4.o := \
  /usr/include/newlib/string.h \
  /usr/include/newlib/_ansi.h \
  /usr/include/newlib/newlib.h \
  /usr/include/newlib/_newlib_version.h \
  /usr/include/newlib/sys/config.h \
    $(wildcard include/config/h//.h) \
  /usr/include/newlib/machine/ieeefp.h \
  /usr/include/newlib/sys/features.h \
  /usr/include/newlib/sys/reent.h \
  /usr/include/newlib/_ansi.h \
  /usr/lib/gcc/arm-none-eabi/9.2.1/include/stddef.h \
  /usr/include/newlib/sys/_types.h \
  /usr/include/newlib/machine/_types.h \
  /usr/include/newlib/machine/_default_types.h \
  /usr/include/newlib/sys/lock.h \
  /usr/include/newlib/sys/cdefs.h \
  /usr/include/newlib/sys/_locale.h \
  /usr/include/newlib/strings.h \
  /usr/include/newlib/sys/string.h \
  /home/mathilda/crazyflie-firmware/src/platform/interface/platform.h \
    $(wildcard include/config/sensors/bmi088/bmp388.h) \
    $(wildcard include/config/sensors/bmi088/spi.h) \
    $(wildcard include/config/sensors/mpu9250/lps25h.h) \
    $(wildcard include/config/sensors/bosch.h) \
  /usr/lib/gcc/arm-none-eabi/9.2.1/include/stdbool.h \
  /home/mathilda/crazyflie-firmware/src/drivers/interface/motors.h \
    $(wildcard include/config/motors/esc/protocol/oneshot125.h) \
    $(wildcard include/config/motors/esc/protocol/oneshot42.h) \
  /usr/lib/gcc/arm-none-eabi/9.2.1/include/stdint.h \
  /home/mathilda/crazyflie-firmware/src/config/config.h \
    $(wildcard include/config/h/.h) \
    $(wildcard include/config/block/address.h) \
  /home/mathilda/crazyflie-firmware/src/drivers/interface/nrf24l01.h \
  /home/mathilda/crazyflie-firmware/src/drivers/interface/nRF24L01reg.h \
  /home/mathilda/crazyflie-firmware/src/config/trace.h \
  /home/mathilda/crazyflie-firmware/src/hal/interface/usec_time.h \
  /home/mathilda/crazyflie-firmware/src/config/stm32fxxx.h \
  /home/mathilda/crazyflie-firmware/src/lib/CMSIS/STM32F4xx/Include/stm32f4xx.h \
  /home/mathilda/crazyflie-firmware/vendor/CMSIS/CMSIS/Core/Include/core_cm4.h \
  /home/mathilda/crazyflie-firmware/vendor/CMSIS/CMSIS/Core/Include/cmsis_version.h \
  /home/mathilda/crazyflie-firmware/vendor/CMSIS/CMSIS/Core/Include/cmsis_compiler.h \
  /home/mathilda/crazyflie-firmware/vendor/CMSIS/CMSIS/Core/Include/cmsis_gcc.h \
  /home/mathilda/crazyflie-firmware/vendor/CMSIS/CMSIS/Core/Include/mpu_armv7.h \
  /home/mathilda/crazyflie-firmware/src/lib/CMSIS/STM32F4xx/Include/system_stm32f4xx.h \
  /home/mathilda/crazyflie-firmware/src/config/stm32f4xx_conf.h \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_adc.h \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_crc.h \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_dbgmcu.h \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_dma.h \
    $(wildcard include/config/it.h) \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_exti.h \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_flash.h \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_gpio.h \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_i2c.h \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_iwdg.h \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_pwr.h \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_rcc.h \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_rtc.h \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_sdio.h \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_spi.h \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_syscfg.h \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_tim.h \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_usart.h \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_wwdg.h \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_misc.h \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_cryp.h \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_hash.h \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_rng.h \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_can.h \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_dac.h \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_dcmi.h \
  /home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_fsmc.h \

src/platform/src/platform_stm32f4.o: $(deps_src/platform/src/platform_stm32f4.o)

$(deps_src/platform/src/platform_stm32f4.o):