cmd_src/drivers/bosch/src/bmp280.o := arm-none-eabi-gcc -Wp,-MD,src/drivers/bosch/src/.bmp280.o.d    -I/home/mathilda/crazyflie-firmware/src/drivers/bosch/src -Isrc/drivers/bosch/src -D__firmware__ -fno-exceptions -Wall -Wmissing-braces -fno-strict-aliasing -ffunction-sections -fdata-sections -Wdouble-promotion -std=gnu11 -DCRAZYFLIE_FW   -I/home/mathilda/crazyflie-firmware/vendor/CMSIS/CMSIS/Core/Include   -I/home/mathilda/crazyflie-firmware/vendor/CMSIS/CMSIS/DSP/Include   -I/home/mathilda/crazyflie-firmware/vendor/libdw1000/inc   -I/home/mathilda/crazyflie-firmware/vendor/FreeRTOS/include   -I/home/mathilda/crazyflie-firmware/vendor/FreeRTOS/portable/GCC/ARM_CM4F   -I/home/mathilda/crazyflie-firmware/src/config   -I/home/mathilda/crazyflie-firmware/src/platform/interface   -I/home/mathilda/crazyflie-firmware/src/deck/interface   -I/home/mathilda/crazyflie-firmware/src/deck/drivers/interface   -I/home/mathilda/crazyflie-firmware/src/drivers/interface   -I/home/mathilda/crazyflie-firmware/src/drivers/bosch/interface   -I/home/mathilda/crazyflie-firmware/src/drivers/esp32/interface   -I/home/mathilda/crazyflie-firmware/src/hal/interface   -I/home/mathilda/crazyflie-firmware/src/modules/interface   -I/home/mathilda/crazyflie-firmware/src/modules/interface/kalman_core   -I/home/mathilda/crazyflie-firmware/src/modules/interface/lighthouse   -I/home/mathilda/crazyflie-firmware/src/utils/interface   -I/home/mathilda/crazyflie-firmware/src/utils/interface/kve   -I/home/mathilda/crazyflie-firmware/src/utils/interface/lighthouse   -I/home/mathilda/crazyflie-firmware/src/utils/interface/tdoa   -I/home/mathilda/crazyflie-firmware/src/lib/FatFS   -I/home/mathilda/crazyflie-firmware/src/lib/CMSIS/STM32F4xx/Include   -I/home/mathilda/crazyflie-firmware/src/lib/STM32_USB_Device_Library/Core/inc   -I/home/mathilda/crazyflie-firmware/src/lib/STM32_USB_OTG_Driver/inc   -I/home/mathilda/crazyflie-firmware/src/lib/STM32F4xx_StdPeriph_Driver/inc   -I/home/mathilda/crazyflie-firmware/src/lib/vl53l1   -I/home/mathilda/crazyflie-firmware/src/lib/vl53l1/core/inc   -I/home/mathilda/bitcraze-aideck-fly/build/include/generated -fno-delete-null-pointer-checks --param=allow-store-data-races=0 -Wno-unused-but-set-variable -Wno-unused-const-variable -fomit-frame-pointer -fno-var-tracking-assignments -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -Werror=implicit-int -Werror=date-time -DCC_HAVE_ASM_GOTO -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -g3 -fno-math-errno -DARM_MATH_CM4 -D__FPU_PRESENT=1 -mfp16-format=ieee -Wno-array-bounds -Wno-stringop-overread -Wno-stringop-overflow -DSTM32F4XX -DSTM32F40_41xxx -DHSE_VALUE=8000000 -DUSE_STDPERIPH_DRIVER   -I/home/mathilda/bitcraze-aideck-fly/src/control_task   -I/home/mathilda/bitcraze-aideck-fly/src/uart_task   -c -o src/drivers/bosch/src/bmp280.o /home/mathilda/crazyflie-firmware/src/drivers/bosch/src/bmp280.c

source_src/drivers/bosch/src/bmp280.o := /home/mathilda/crazyflie-firmware/src/drivers/bosch/src/bmp280.c

deps_src/drivers/bosch/src/bmp280.o := \
    $(wildcard include/config/reg/spi3/enable//reg.h) \
    $(wildcard include/config/reg/spi3/enable.h) \
    $(wildcard include/config/reg/filter//reg.h) \
    $(wildcard include/config/reg/filter.h) \
    $(wildcard include/config/reg/standby/durn//reg.h) \
    $(wildcard include/config/reg/standby/durn.h) \
  /home/mathilda/crazyflie-firmware/src/drivers/bosch/src/../interface/bmp280.h \
    $(wildcard include/config/reg.h) \
    $(wildcard include/config/reg/standby/durn//pos.h) \
    $(wildcard include/config/reg/standby/durn//msk.h) \
    $(wildcard include/config/reg/standby/durn//len.h) \
    $(wildcard include/config/reg/filter//pos.h) \
    $(wildcard include/config/reg/filter//msk.h) \
    $(wildcard include/config/reg/filter//len.h) \
    $(wildcard include/config/reg/spi3/enable//pos.h) \
    $(wildcard include/config/reg/spi3/enable//msk.h) \
    $(wildcard include/config/reg/spi3/enable//len.h) \
  /home/mathilda/crazyflie-firmware/src/drivers/bosch/src/../interface/bstdr_comm_support.h \
  /home/mathilda/crazyflie-firmware/src/drivers/bosch/src/../interface/bstdr_types.h \
  /usr/lib/gcc/arm-none-eabi/9.2.1/include/stdint.h \
  /usr/lib/gcc/arm-none-eabi/9.2.1/include/stdbool.h \

src/drivers/bosch/src/bmp280.o: $(deps_src/drivers/bosch/src/bmp280.o)

$(deps_src/drivers/bosch/src/bmp280.o):