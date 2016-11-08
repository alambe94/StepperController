/*
 * nrf24.h
 *
 *  Created on: 09-May-2016
 *      Author: medprime4
 */

#ifndef NRF24_H_
#define NRF24_H_

/* Nrf definations  */

#define MAX_RT          0x10  // Max #of TX retransmission interrupt
#define TX_DS           0x20  // TX data sent interrupt
#define RX_DR           0x40  // RX data received
#define True            0x01
#define False           0x00



/* pipe numbers */
typedef enum {
	Pipe0 = 0,
	Pipe1 ,
	Pipe2,
	Pipe3,
	Pipe4,
	Pipe5

} Pipe_No;

/* Operation mode */
typedef enum {
	Ptx_Mode = 0,
	Prx_Mode
} Nrf_Mode;

/* Output power modes */
typedef enum {
	Pwr_18dB = 0,
	Pwr_12dB,
	Pwr_6dB,
	Pwr_0dB
} Nrf_Power;

/* data rate */
typedef enum {
	Data_Rate_256Kbs = 0,
	Data_Rate_1Mbs,
	Data_Rate_2Mbs
} Nrf_Data_Rate;

typedef enum {
	Disable_Crc= 0,
	One_Byte_Crc ,
	Two_Byte_Crc
} Nrf_Crc;

typedef enum {
	D250us = 0,
	D500us ,
	D750us,
	D1000us,
	D1250us,
	D1500us,
	D1750us,
	D2000us,
	D2250us,
	D2500us,
	D2750us,
	D3000us,
	D3250us,
	D3500us,
	D3750us,
	D4000us

} Ard_Delay;


typedef enum {
		Max_Rt,
		Tx_Ds,
		Rx_Dr
} Irq_Mask;


void Nrf_Init(void);

void Nrf_Csn_Low(void);

void Nrf_Csn_High(void);

void Nrf_Ce_Low(void);

void Nrf_Ce_High(void);

uint8_t Spi_TxRx(uint8_t reg);

uint8_t Nrf_Read_Reg(uint8_t reg);

void Nrf_Write_Reg(uint8_t reg, uint8_t val);

void Nrf_Read_Buf(uint8_t reg, uint8_t *buff_pointer, uint8_t bytes);

void Nrf_Write_Buf(uint8_t reg, uint8_t *addr_pointer, uint8_t bytes);

void Nrf_Set_Tx_Addr(uint8_t *addr_pointer, uint8_t bytes);

uint8_t Nrf_Read_Addr_Width(void);

void Nrf_Read_Tx_Addr(uint8_t *buff_pointer);


void Nrf_Set_Pipe_Addr(Pipe_No pipe, uint8_t *addr_pointer, uint8_t bytes);

void Nrf_Read_Pipe_Addr(Pipe_No pipe, uint8_t *buff_pointer);

void Nrf_Write_Tx_Payload(uint8_t *addr_pointer, uint8_t bytes);

void Nrf_Read_Rx_Payload(uint8_t *buff_pointer, uint8_t bytes);

void Nrf_Enable_Pipe(Pipe_No pipe);

void Nrf_Disble_Pipe(Pipe_No pipe);

void Nrf_Enable_AutoAck(Pipe_No pipe);

void Nrf_Disble_AutoAck(Pipe_No pipe);

void Nrf_Set_RF_Ch(uint8_t channel);

uint8_t Nrf_Read_RF_Ch(void);

void Nrf_Set_Pipe_Data_Width(Pipe_No pipe, uint8_t width);

uint8_t Nrf_Read_Pipe_Data_Width(Pipe_No pipe);

void Nrf_Flush_Tx(void);

void Nrf_Flush_Rx(void);

void Nrf_Power_Up(void);

void Nrf_Power_Down(void);

void Nrf_Set_Power_Level(Nrf_Power level);

Nrf_Power Nrf_Read_Power_Level(void);

void Nrf_Set_Data_Rate(Nrf_Data_Rate speed);

Nrf_Data_Rate Nrf_Read_Data_Rate(void);

void Nrf_Set_Crc_Length(Nrf_Crc length);

Nrf_Crc Nrf_Read_Crc_Length(void);

void Nrf_Set_Retries(Ard_Delay delay, uint8_t count);

void Nrf_Set_Mode(Nrf_Mode mode);

void Nrf_Disable_Irq(Irq_Mask mask);

void Nrf_Clear_Irq(Irq_Mask mask);

void Transmit_Payoad(void);

void Nrf_Enable_Dynamic_Payload(Pipe_No pipe);

void Nrf_Enable_Ack_Payload(void);




#endif /* NRF24_H_ */
