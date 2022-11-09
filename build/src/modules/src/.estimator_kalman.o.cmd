cmd_src/modules/src/estimator_kalman.o := arm-none-eabi-gcc -Wp,-MD,src/modules/src/.estimator_kalman.o.d    -I/home/mathilda/crazyflie-firmware/src/modules/src -Isrc/modules/src -D__firmware__ -fno-exceptions -Wall -Wmissing-braces -fno-strict-aliasing -ffunction-sections -fdata-sections -Wdouble-promotion -std=gnu11 -DCRAZYFLIE_FW   -I/home/mathilda/crazyflie-firmware/vendor/CMSIS/CMSIS/Core/Include   -I/home/mathilda/crazyflie-firmware/vendor/CMSIS/CMSIS/DSP/Include   -I/home/mathilda/crazyflie-firmware/vendor/libdw1000/inc   -I/home/mathilda/crazyflie-firmware/vendor/FreeRTOS/include   -I/home/mathilda/crazyflie-firmware/vendor/FreeRTOS/portable/GCC/ARM_CM4F   -I/home/mathilda/crazyflie-firmware/src/config   -I/home/mathilda/crazyflie-firmware/src/platform/interface   -I/home/mathilda/crazyflie-firmware/src/deck/interface   -I/home/mathilda/crazyflie-firmware/src/deck/drivers/interface   -I/home/mathilda/crazyflie-firmware/src/drivers/interface   -I/home/mathilda/crazyflie-firmware/src/drivers/bosch/interface   -I/home/mathilda/crazyflie-firmware/src/drivers/esp32/interface   -I/home/mathilda/crazyflie-firmware/src/hal/interface   -I/home/mathilda/crazyflie-firmware/src/modules/interface   -I/home/mathilda/crazyflie-firmware/src/modules/interface/kalman_core   -I/home/mathilda/crazyflie-firmware/src/modules/interface/lighthouse   -I/home/mathilda/crazyflie-firmware/src/utils/interface   -I/home/mathilda/crazyflie-firmware/src/utils/interface/kve   -I/home/mathilda/crazyflie-firmware/src/utils/interface/lighthouse   -I/home/mathilda/crazyflie-firmware/src/utils/interface/tdoa   -I/home/mathilda/crazyflie-firmware/src/lib/FatFS   -I/home/mathilda/crazyflie-firmware/src/lib/CMSIS/STM32F4xx/Include   -I/home/mathilda/crazyflie-firmware/src/lib/STM32_USB_Device_Library/Core/inc   -I/home/mathilda/crazyflie-firmware/src/lib/STM32_USB_OTG_Driver/inc   -I/home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc   -I/home/mathilda/crazyflie-firmware/src/lib/vl53l1   -I/home/mathilda/crazyflie-firmware/src/lib/vl53l1/core/inc   -I/home/mathilda/bitcraze-aideck-fly/build/include/generated -fno-delete-null-pointer-checks --param=allow-store-data-races=0 -Wno-unused-but-set-variable -Wno-unused-const-variable -fomit-frame-pointer -fno-var-tracking-assignments -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -Werror=implicit-int -Werror=date-time -DCC_HAVE_ASM_GOTO -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -g3 -fno-math-errno -DARM_MATH_CM4 -D__FPU_PRESENT=1 -mfp16-format=ieee -Wno-array-bounds -Wno-stringop-overread -Wno-stringop-overflow -DSTM32F4XX -DSTM32F40_41xxx -DHSE_VALUE=8000000 -DUSE_STDPERIPH_DRIVER   -I/home/mathilda/bitcraze-aideck-fly/src/control_task   -I/home/mathilda/bitcraze-aideck-fly/src/uart_task   -c -o src/modules/src/estimator_kalman.o /home/mathilda/crazyflie-firmware/src/modules/src/estimator_kalman.c

source_src/modules/src/estimator_kalman.o := /home/mathilda/crazyflie-firmware/src/modules/src/estimator_kalman.c

deps_src/modules/src/estimator_kalman.o := \
  /home/mathilda/crazyflie-firmware/src/modules/interface/kalman_core/kalman_core.h \
  /home/mathilda/crazyflie-firmware/src/utils/interface/cf_math.h \
  /home/mathilda/crazyflie-firmware/vendor/CMSIS/CMSIS/DSP/Include/arm_math.h \
  /home/mathilda/crazyflie-firmware/vendor/CMSIS/CMSIS/Core/Include/cmsis_compiler.h \
  /usr/lib/gcc/arm-none-eabi/9.2.1/include/stdint.h \
  /home/mathilda/crazyflie-firmware/vendor/CMSIS/CMSIS/Core/Include/cmsis_gcc.h \
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
  /usr/include/newlib/math.h \
  /usr/lib/gcc/arm-none-eabi/9.2.1/include/float.h \
  /usr/lib/gcc/arm-none-eabi/9.2.1/include-fixed/limits.h \
  /home/mathilda/crazyflie-firmware/src/utils/interface/cfassert.h \
  /home/mathilda/crazyflie-firmware/src/config/stm32fxxx.h \
  /home/mathilda/crazyflie-firmware/src/lib/CMSIS/STM32F4xx/Include/stm32f4xx.h \
  /home/mathilda/crazyflie-firmware/vendor/CMSIS/CMSIS/Core/Include/core_cm4.h \
  /home/mathilda/crazyflie-firmware/vendor/CMSIS/CMSIS/Core/Include/cmsis_version.h \
  /home/mathilda/crazyflie-firmware/vendor/CMSIS/CMSIS/Core/Include/cmsis_compiler.h \
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
  /home/mathilda/crazyflie-firmware/src/modules/interface/console.h \
  /usr/lib/gcc/arm-none-eabi/9.2.1/include/stdbool.h \
  /home/mathilda/crazyflie-firmware/src/utils/interface/eprintf.h \
  /usr/lib/gcc/arm-none-eabi/9.2.1/include/stdarg.h \
  /home/mathilda/crazyflie-firmware/src/modules/interface/stabilizer_types.h \
  /home/mathilda/crazyflie-firmware/src/hal/interface/imu_types.h \
  /home/mathilda/crazyflie-firmware/src/utils/interface/lighthouse/lighthouse_types.h \
  /home/mathilda/crazyflie-firmware/src/modules/interface/kalman_supervisor.h \
  /home/mathilda/crazyflie-firmware/vendor/FreeRTOS/include/FreeRTOS.h \
  /home/mathilda/crazyflie-firmware/src/config/FreeRTOSConfig.h \
    $(wildcard include/config/h.h) \
    $(wildcard include/config/debug/queue/monitor.h) \
  /home/mathilda/crazyflie-firmware/src/config/config.h \
    $(wildcard include/config/h/.h) \
    $(wildcard include/config/block/address.h) \
  /home/mathilda/crazyflie-firmware/src/drivers/interface/nrf24l01.h \
  /home/mathilda/crazyflie-firmware/src/drivers/interface/nRF24L01reg.h \
  /home/mathilda/crazyflie-firmware/src/config/trace.h \
  /home/mathilda/crazyflie-firmware/src/hal/interface/usec_time.h \
  /home/mathilda/crazyflie-firmware/src/utils/interface/cfassert.h \
  /home/mathilda/crazyflie-firmware/vendor/FreeRTOS/include/projdefs.h \
  /home/mathilda/crazyflie-firmware/vendor/FreeRTOS/include/portable.h \
  /home/mathilda/crazyflie-firmware/vendor/FreeRTOS/include/deprecated_definitions.h \
  /home/mathilda/crazyflie-firmware/vendor/FreeRTOS/portable/GCC/ARM_CM4F/portmacro.h \
  /home/mathilda/crazyflie-firmware/vendor/FreeRTOS/include/mpu_wrappers.h \
  /home/mathilda/crazyflie-firmware/vendor/FreeRTOS/include/queue.h \
  /home/mathilda/crazyflie-firmware/vendor/FreeRTOS/include/task.h \
  /home/mathilda/crazyflie-firmware/vendor/FreeRTOS/include/list.h \
  /home/mathilda/crazyflie-firmware/vendor/FreeRTOS/include/task.h \
  /home/mathilda/crazyflie-firmware/vendor/FreeRTOS/include/semphr.h \
  /home/mathilda/crazyflie-firmware/vendor/FreeRTOS/include/queue.h \
  /home/mathilda/crazyflie-firmware/src/hal/interface/sensors.h \
  /home/mathilda/crazyflie-firmware/src/modules/interface/static_mem.h \
  /home/mathilda/crazyflie-firmware/src/modules/interface/estimator.h \
    $(wildcard include/config/estimator/kalman/enable.h) \
    $(wildcard include/config/estimator/oot.h) \
  /home/mathilda/crazyflie-firmware/src/modules/interface/stabilizer_types.h \
  /home/mathilda/crazyflie-firmware/src/modules/interface/estimator_kalman.h \
  /home/mathilda/crazyflie-firmware/src/modules/interface/system.h \
  /home/mathilda/crazyflie-firmware/src/modules/interface/log.h \
  /home/mathilda/crazyflie-firmware/src/modules/interface/param.h \
  /home/mathilda/crazyflie-firmware/src/modules/interface/param_logic.h \
  /home/mathilda/crazyflie-firmware/src/modules/interface/crtp.h \
  /home/mathilda/crazyflie-firmware/src/utils/interface/physicalConstants.h \
  /home/mathilda/crazyflie-firmware/src/modules/interface/supervisor.h \
  /home/mathilda/crazyflie-firmware/src/utils/interface/statsCnt.h \
  /home/mathilda/crazyflie-firmware/src/utils/interface/rateSupervisor.h \
  /home/mathilda/crazyflie-firmware/src/modules/interface/kalman_core/mm_distance.h \
  /home/mathilda/crazyflie-firmware/src/modules/interface/kalman_core/mm_absolute_height.h \
  /home/mathilda/crazyflie-firmware/src/modules/interface/kalman_core/mm_position.h \
  /home/mathilda/crazyflie-firmware/src/modules/interface/kalman_core/mm_pose.h \
  /home/mathilda/crazyflie-firmware/src/modules/interface/kalman_core/mm_tdoa.h \
  /home/mathilda/crazyflie-firmware/src/modules/interface/kalman_core/mm_flow.h \
  /home/mathilda/crazyflie-firmware/src/modules/interface/kalman_core/mm_tof.h \
  /home/mathilda/crazyflie-firmware/src/modules/interface/kalman_core/mm_yaw_error.h \
  /home/mathilda/crazyflie-firmware/src/modules/interface/kalman_core/mm_sweep_angles.h \
  /home/mathilda/crazyflie-firmware/src/modules/interface/outlierFilter.h \
  /home/mathilda/crazyflie-firmware/src/modules/interface/kalman_core/mm_tdoa_robust.h \
  /home/mathilda/crazyflie-firmware/src/modules/interface/kalman_core/mm_distance_robust.h \
  /home/mathilda/crazyflie-firmware/src/utils/interface/debug.h \
    $(wildcard include/config/debug/print/on/uart1.h) \
  /home/mathilda/crazyflie-firmware/src/config/config.h \

src/modules/src/estimator_kalman.o: $(deps_src/modules/src/estimator_kalman.o)

$(deps_src/modules/src/estimator_kalman.o):