#include <string.h>
#include <stdint.h>
#include <stdbool.h>

#include "app.h"

#include "commander.h"

#include "FreeRTOS.h"
#include "task.h"

#include "debug.h"

#include "log.h"
#include "param.h"

#include "crtp.h"
#include "crtp_commander_high_level.h"

#include "control_task.h"
#include "uart_task.h"

#define DEBUG_MODULE "CTRL_TASK"
#include "debug.h"

#define LOOP 1000
#define FLAG false

/// @brief /////////////////////////param///////////////////////////
const float velMax = 0.2f;
const float alpha = 0.7;
const float beta = 0.5;
const float PI = 180.0;
const float flyHeight = 0.4f; //fixed fly height

/// @brief ////////////////////////control///////////////////////////
extern float steer;
extern float coll;
volatile float velUsual;
volatile float angleTheta;


typedef enum
{
    idle,
    lowUnlock,
    unlocked,
    stopping
} State;

static State state = idle;

static void setHoverSetpoint(setpoint_t *setpoint, float vx, float vy, float z, float yawrate)
{
    setpoint->mode.z = modeAbs;
    setpoint->position.z = z;
    setpoint->mode.yaw = modeVelocity;
    setpoint->attitudeRate.yaw = yawrate;
    setpoint->mode.x = modeVelocity;
    setpoint->mode.y = modeVelocity;
    setpoint->velocity.x = vx;
    setpoint->velocity.y = vy;
    setpoint->velocity_body = true;
    commanderSetSetpoint(setpoint, 3);
}

void controlTask(void *param)
{
    static uint16_t i = 0;
    static setpoint_t setpoint;
    DEBUG_PRINT("CRTL_TASK:control task started!\n");
    while (1)
    {
        vTaskDelay(M2T(10));
        // DEBUG_PRINT("%d\t", i++);
        // if (i > LOOP)
        // {
        //     state = stopping;
        // }
        if (state == unlocked)
        {
            velUsual = (1 - alpha) * velUsual + alpha * (1 - coll) * velMax;
            angleTheta = (1 - beta) * angleTheta + beta * (PI / 2) * steer;
            double curtime = (double)xTaskGetTickCount() / 1000;
            DEBUG_PRINT("%d \t %lf \t velUsual:%.2f \t angleTheta:%.2f\n", i++, curtime, velUsual, angleTheta);
            if (FLAG)
                setHoverSetpoint(&setpoint, velUsual, 0, flyHeight, angleTheta);
            else
                crtpCommanderHighLevelTakeoff(flyHeight, 2.0f);
        }
        else
        {
            if (state == idle)
            {
                DEBUG_PRINT("State:idle!\n");
                state = lowUnlock;
            }

            if (state == lowUnlock)
            {
                DEBUG_PRINT("State:lowUnlock!\n");
                state = unlocked;
                DEBUG_PRINT("State:unlocked!\n");
            }

            if (state == stopping)
            {
                if(FLAG)
                {
                    memset(&setpoint, 0, sizeof(setpoint_t));
                    commanderSetSetpoint(&setpoint, 3);
                }
                else
                    crtpCommanderHighLevelStop();
                return;
            }
        }
    }
}