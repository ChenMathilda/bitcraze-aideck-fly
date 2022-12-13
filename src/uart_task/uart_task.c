/*-----------------------------------------------------------------------------
 Copyright (C) 2020-2021 ETH Zurich, Switzerland, University of Bologna, Italy.
 All rights reserved.

 File:    main.c
 Author:  Vlad Niculescu      <vladn@iis.ee.ethz.ch>
 Date:    15.03.2021
-------------------------------------------------------------------------------*/

#include <string.h>
#include <stdint.h>
#include <stdbool.h>
#include <time.h>

#include "app.h"
#include "FreeRTOS.h"
#include "task.h"
#include "debug.h"
#include "uart_dma_pulp.h"
#include "log.h"

#define DEBUG_MODULE "UART_TASK"
#include "debug.h"

/// @brief /////////////// SMOOTH ///////////////////////
const char start = 's';
const char end = 'e';
typedef struct
{
	uint8_t steer[3];
	uint8_t coll[3];
	// uint8_t signal[3];
	uint8_t index_insert;
} smoothData_t;
static smoothData_t smoothData;

/// @brief /////////////// UART ///////////////////////
#define BUFFERSIZE 1
#define BUFFERDATA 4
static uint8_t aideckRxBuffer[BUFFERSIZE];
static uint8_t aideckRxDataStruct[BUFFERDATA];
// static uint8_t log_counter;
static uint8_t buff_index;
volatile uint8_t dma_flag = 0;

/// @brief /////////////// CONTROL ///////////////////////
float steer;
float coll;
// uint8_t signal;

void smooth_Data(uint8_t *data)
{
	smoothData.steer[smoothData.index_insert] = data[1];
	smoothData.coll[smoothData.index_insert] = data[2];
	// smoothData.signal[smoothData.index_insert] = data[3];
	smoothData.index_insert = (smoothData.index_insert + 1) % 3;

	// average smooth
	steer = (smoothData.steer[0] + smoothData.steer[1] + smoothData.steer[2]) / 3.0f;
	coll = (smoothData.coll[0] + smoothData.coll[1] + smoothData.coll[2]) / 3.0f;
	// signal;

	steer = (double)steer / 10 - 2;
	coll = (double)coll / 100;
	// signal;

	DEBUG_PRINT("steer: %.2lf\t coll: %.2lf\n",steer,coll);

}

void receiveDataFromUart(uint8_t *data) // put 4 bits data into buffer
{

	if(buff_index == 0)
	{
		if (data[0] != start)
		{
			return;
		}
		else
		{
			aideckRxDataStruct[buff_index++] = data[0];
		}
	}
	else if (buff_index == BUFFERDATA - 1)
	{
		if (data[0] != end)
		{
			memset(aideckRxDataStruct, 0, sizeof(uint8_t) * BUFFERDATA); // clear the data buffer
			buff_index = 0;
			return;
		}
		else
		{
			aideckRxDataStruct[buff_index++] = data[0];
			smooth_Data(aideckRxDataStruct);
			memset(aideckRxDataStruct, 0, sizeof(uint8_t) * BUFFERDATA); // clear the data buffer
			buff_index = buff_index % BUFFERDATA;
		}
	}
	else if (buff_index > 0 && buff_index < BUFFERDATA - 1)
	{
		aideckRxDataStruct[buff_index++] = data[0];
	}
	else
	{
		return;
	}
}

void uartTask(void *param)
{
	DEBUG_PRINT("uart task started! \n");
	USART_DMA_Start(115200, aideckRxBuffer, BUFFERSIZE);
	double curtime;
	while (1)
	{
		vTaskDelay(M2T(10));
		curtime = (double)xTaskGetTickCount() / 1000;
		receiveDataFromUart(aideckRxBuffer);
		memset(aideckRxBuffer, 0, sizeof(uint8_t) * BUFFERSIZE); // clear the dma buffer
		dma_flag = 0;
	}
}

void __attribute__((used)) DMA1_Stream1_IRQHandler(void)
{
	DMA_ClearFlag(DMA1_Stream1, UART3_RX_DMA_ALL_FLAGS);
	dma_flag = 1;
	// log_counter++;
}

// LOG_GROUP_START(log_test)
// LOG_ADD(LOG_UINT32, test_variable_x, &log_counter)
// LOG_GROUP_STOP(log_test)

