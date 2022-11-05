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

#include "app.h"
#include "FreeRTOS.h"
#include "task.h"
#include "debug.h"
#include "uart_dma_pulp.h"
#include "log.h"
#include "uart_task.h"

#define DEBUG_MODULE "UART_TASK"

#define BUFFERSIZE 1
#define BUFFERDATA 2

uint8_t aideckRxBuffer[BUFFERSIZE];//single 8bit data
uint8_t aideckRxData[BUFFERDATA];// 2 8bit data; steering/coll

volatile uint8_t dma_flag = 0;
uint8_t log_counter=0;
uint8_t flag=0;

float steer;
float coll;

uint32_t *u32_trans(uint8_t b[BUFFERDATA])
{
	static uint32_t u[2];
  	u[0] = b[0];
  	u[0] = (u[0] << 8) + b[1];
  	u[0] = (u[0] << 8) + b[2];
  	u[0] = (u[0] << 8) + b[3];

  	u[1] = b[4];
	u[1] = (u[1] << 8) + b[1];
  	u[1] = (u[1] << 8) + b[2];
  	u[1] = (u[1] << 8) + b[3];
	return u;
}

uint64_t u64_trans(uint8_t b[BUFFERDATA])
{
	static uint64_t u;
  	u = b[0];
  	u = (u << 8) + b[1];
  	u = (u << 8) + b[2];
  	u = (u << 8) + b[3];
	u = (u << 8) + b[4];
  	u = (u << 8) + b[5];
	u = (u << 8) + b[6];
  	u = (u << 8) + b[7];
	return u;
}


void uartTask(void *param)
{
	DEBUG_PRINT("Application started! \n");
	USART_DMA_Start(115200, aideckRxBuffer, BUFFERSIZE);
	while(1) 
	{
		vTaskDelay(M2T(400));
		if(log_counter < 5 )
		{
			// DEBUG_PRINT("log_counter: %d | %d\n", log_counter, aideckRxBuffer[0]);
			// memset(aideckRxBuffer, 0, sizeof(uint8_t)*BUFFERSIZE);  // clear the dma buffer
			// memset(aideckRxData, 0, sizeof(uint8_t)*BUFFERDATA); 
			continue;
		}	
		if (dma_flag == 1)
		{
			// DEBUG_PRINT("log_counter: %d | %d\n", log_counter, aideckRxBuffer[0]);
			aideckRxData[flag++]=aideckRxBuffer[0];
			dma_flag = 0;  // clear the flag
			memset(aideckRxBuffer, 0, sizeof(uint8_t)*BUFFERSIZE); 
			if(flag==BUFFERDATA)
			{
				// DEBUG_PRINT("\tsteer: %d;coll: %d\n", aideckRxData[0],aideckRxData[1]);
				steer =(float)aideckRxData[0]/10-2;
				coll = (float)aideckRxData[1]/100;
				DEBUG_PRINT("\tsteer: %.2f;coll: %.2f\n",steer,coll);
				memset(aideckRxData, 0, sizeof(uint8_t)*BUFFERDATA);  // clear the dma buffer
				flag=0;
			}	
		}		
	}
}


void __attribute__((used)) DMA1_Stream1_IRQHandler(void)
{
	DMA_ClearFlag(DMA1_Stream1, UART3_RX_DMA_ALL_FLAGS);
 	dma_flag = 1;
	log_counter++;
}

LOG_GROUP_START(log_test)
LOG_ADD(LOG_UINT32, test_variable_x, &log_counter)
LOG_GROUP_STOP(log_test)
