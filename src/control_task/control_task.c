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

#define DEBUG_MODULE "CRTL_TASK"
#include "debug.h"

#define LOOP 1000
#define FLAG true

static const float velMax = 0.5f;
static const uint16_t radius = 300;

const float alpha = 0.7;
const float beta = 0.5;
const float PI = 180.0;
const float flyHeight = 0.8; //fixed fly height

static float velUsual;
static float angleTheta;

extern float steer;
extern float coll;
extern float test_vx;
extern float test_vy;
extern float test_height;

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
}

void controlTask(void *param)
{
    static setpoint_t setpoint;

    vTaskDelay(M2T(3000));

    DEBUG_PRINT("Fly contol, waiting for steer and collsion!\n");
    int i = 0;
    while (1)
    {
        vTaskDelay(M2T(10));
        DEBUG_PRINT("%d\n", i++);
        if (i > LOOP)
        {
            state = stopping;
        }
        if (state == unlocked && i <= LOOP)
        {
            velUsual = (1 - alpha) * velUsual + alpha * (1 - coll) * velMax;
            angleTheta = (1 - beta) * angleTheta + beta * (PI / 2) * steer;
            // DEBUG_PRINT("steer:%.2f \t coll:%.2f \t vx:%.2f \t vy:%.2f \t h:%.2f\n", steer, coll, test_vx,test_vy,test_height);
            DEBUG_PRINT("%d \t velUsual:%.2f \t angleTheta:%.2f\n", i, velUsual, angleTheta);
            if (FLAG)
            {
                setHoverSetpoint(&setpoint, 0, 0, 0.3f, 0);
                commanderSetSetpoint(&setpoint, 3);
            }
            else
            {
                crtpCommanderHighLevelTakeoff(0.3f, 2.0f);
            }
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
                DEBUG_PRINT("%d\tState:stopping!\n",i);
                if (FLAG)
                {
                    memset(&setpoint, 0, sizeof(setpoint_t));
                    commanderSetSetpoint(&setpoint, 3);
                }
                else
                {
                    crtpCommanderHighLevelStop();
                }
                // return;
            }
        }
    }
}