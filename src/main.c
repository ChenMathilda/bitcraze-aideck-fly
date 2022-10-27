#include <string.h>
#include <stdint.h>
#include <stdbool.h>

#include "app.h"
#include "FreeRTOS.h"
#include "task.h"
#include "debug.h"
#include "log.h"

#include "control_task.h"
#include "uart_task.h"

#define DEBUG_MODULE "THEAPP"
#include "debug.h"

void  appMain()
{
    while(1)
    {
        //function point;task name;stack capcity;param;priority;taskhandle

        xTaskCreate(uartTask,"uart task", 1000, NULL, 1, NULL);
        xTaskCreate(controlTask,"fly control task",1000, NULL, 1, NULL);

        DEBUG_PRINT("Start Task Scheduler");
        vTaskStartScheduler();

    }
}