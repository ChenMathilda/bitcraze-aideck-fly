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

#include "control_task.h"
#include "uart_task.h"

#define DEBUG_MODULE "CONTROL_TASK"

static const float velMax = 1.0f;
static const uint16_t radius = 300;

const float alpha = 0.7;
const float beta = 0.5;
const float PI = 180.0;
const float flyHeight = 0.8; //fixed fly height

static float velUsual;
static float angleTheta;

extern float steer;
extern float coll;

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
        
        if (state == unlocked)
        {
            DEBUG_PRINT("State:unlocked!\n");
            velUsual = (1 - alpha) * velUsual + alpha * (1 - coll) * velMax;
            angleTheta = (1 - beta) * angleTheta + angleTheta * (PI / 2) * steer;
            DEBUG_PRINT("Velocity:%.2f,Steering:%.2f", velUsual, angleTheta);
            if (1)
            {
                setHoverSetpoint(&setpoint, velUsual, velUsual, flyHeight, angleTheta);
                commanderSetSetpoint(&setpoint, 3);
            }

        }
        else
        {
            if(state == idle)
            {
                DEBUG_PRINT("State:idle!\n");
                state = lowUnlock;
                vTaskDelay(M2T(5000));
            }

            if(state == lowUnlock)
            {
                DEBUG_PRINT("State:lowUnlock!\n");
                state = unlocked;
            }

            if(state == stopping)
            {
                DEBUG_PRINT("State:stopping!\n");
                memser(&setpoint, 0, sizeof(setpoint_t));
                commanderSetSetpoint(&setpoint, 3);
            }

        }
    }
}