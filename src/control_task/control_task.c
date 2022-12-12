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

static const float velMax = 0.2f;

const float alpha = 0.7;
const float beta = 0.5;
const float PI = 180.0;
const float flyHeight = 0.5; //fixed fly height

static float velUsual;
static float angleTheta;
extern float steer;
extern float coll;
extern uint8_t signal;

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
    static setpoint_t setpoint;
    vTaskDelay(M2T(300));
    DEBUG_PRINT("Fly contol, waiting for steer and collsion!\n");
    int i = 0;
    while (1)
    {
        vTaskDelay(M2T(10));
        DEBUG_PRINT("%d\t", i++);
        if (i > LOOP)
        {
            state = stopping;
        }
        if (state == unlocked && i <= LOOP)
        {
            velUsual = (float)((1 - alpha) * velUsual + alpha * (1 - coll) * velMax);
            angleTheta = (float)((1 - beta) * angleTheta + beta * (PI / 2) * steer);
            double curtime = (double)xTaskGetTickCount() / 1000;
            DEBUG_PRINT("%lf \t velUsual:%.2f \t angleTheta:%.2f\n", curtime, velUsual, angleTheta);
            if (FLAG)
                setHoverSetpoint(&setpoint, test_vx, test_vy, test_height, 0);
            else
                crtpCommanderHighLevelTakeoff(test_height, 2.0f);
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
            }

            if (state == stopping)
            {
                DEBUG_PRINT("State:stopping!\n");
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