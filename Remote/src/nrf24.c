/*
 * nrf24.c
 *
 *  Created on: Sep 20, 2016
 *      Author: medprime4
 */
#include "stm8s.h"
#include "nrf24l01p.h"
#include "gpio_config.h"
#include "nrf24.h"

void Nrf_Csn_Low(void) {
	GPIO_WriteLow(CSN_GPIO_PORT, CSN_PIN);
}

void Nrf_Csn_High(void) {
	GPIO_WriteHigh(CSN_GPIO_PORT, CSN_PIN);
}

void Nrf_Ce_Low(void) {
	GPIO_WriteLow(CE_GPIO_PORT, CE_PIN);
}

void Nrf_Ce_High(void) {
	GPIO_WriteHigh(CE_GPIO_PORT, CE_PIN);
}

void Nrf_Init(void)
{
	Nrf_Gpio_Init();
	SPI_DeInit();
	SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_2, SPI_MODE_MASTER,\
            SPI_CLOCKPOLARITY_HIGH, SPI_CLOCKPHASE_2EDGE, \
            SPI_DATADIRECTION_2LINES_FULLDUPLEX, SPI_NSS_SOFT, 0x07);
   SPI_Cmd(ENABLE);
}


uint8_t Spi_TxRx(uint8_t pTxData) {
  while (SPI_GetFlagStatus( SPI_FLAG_TXE) == RESET);
	SPI_SendData(pTxData);
	while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
	return SPI_ReceiveData();	 
}

/* Read from a register */
uint8_t Nrf_Read_Reg(uint8_t reg) {
	uint8_t value = 0;
	if (reg <= 0x1D) {
		Nrf_Csn_Low();
		Spi_TxRx(reg); /* Transmit register to read */
		value = Spi_TxRx(0x00); /* Then get the register value */
		Nrf_Csn_High();
	} else {
#ifdef  Debug_Enable
		//Error_Function(1);
#endif
	}
	return value;
}

/* Writes to a register */
void Nrf_Write_Reg(uint8_t reg, uint8_t val) {

	if (reg <= 0x1D) {
		Nrf_Csn_Low();
		Spi_TxRx(WRITE_REG_NRF | reg);
		Spi_TxRx(val);
		Nrf_Csn_High();
	}

	else {
#ifdef  Debug_Enable
		//Error_Function(2);
#endif
	}
}

void Nrf_Read_Buf(uint8_t reg, uint8_t *buff_pointer, uint8_t bytes) {
	uint8_t byte_ctr;
	if (bytes <= 32) {
#ifdef  Debug_Enable
		Print_Debug_Buffer(4, reg, bytes , buff_pointer);
#endif
		Nrf_Csn_Low();                       // Set CSN low, init SPI tranaction
		Spi_TxRx(reg);  // Select register to write to and read status byte
		for (byte_ctr = 0; byte_ctr < bytes; byte_ctr++) {
			*buff_pointer++ = Spi_TxRx(0x00);
		} // Perform SPI_RW to read byte from nRF24L01
		Nrf_Csn_High();    // Set CSN high again

	} else {
#ifdef  Debug_Enable
		//Error_Function(4);
#endif
	}

}

void Nrf_Write_Buf(uint8_t reg, uint8_t *addr_pointer, uint8_t bytes) {
	uint8_t byte_ctr;
	if (bytes <= 32) {
#ifdef  Debug_Enable
		Print_Debug_Buffer(3, reg, bytes,addr_pointer);
#endif
		Nrf_Csn_Low();                       // Set CSN low, init SPI tranaction
		Spi_TxRx(WRITE_REG_NRF | reg);
		for (byte_ctr = 0; byte_ctr < bytes; byte_ctr++) { // then write all byte in buffer(*pBuf)
			Spi_TxRx(*addr_pointer++);
		}
		Nrf_Csn_High();                                    // Set CSN high again

	} else {
#ifdef  Debug_Enable
		//Error_Function(3);
#endif
	}

}

void Nrf_Set_Tx_Addr(uint8_t *addr_pointer, uint8_t bytes) {
	switch (bytes) {
	case 3:
		Nrf_Write_Reg(WRITE_REG_NRF | SETUP_AW, 0x01);
		Nrf_Write_Buf(TX_ADDR, addr_pointer, bytes);
		break;
	case 4:
		Nrf_Write_Reg(WRITE_REG_NRF | SETUP_AW, 0x02);
		Nrf_Write_Buf(TX_ADDR, addr_pointer, bytes);
		break;
	case 5:
		Nrf_Write_Reg(WRITE_REG_NRF | SETUP_AW, 0x03);
		Nrf_Write_Buf(TX_ADDR, addr_pointer, bytes);
		break;
	default:
#ifdef  Debug_Enable
		Print_Debug_Buffer(5, TX_ADDR, bytes , addr_pointer);
#endif
		break;
	}
}

uint8_t Nrf_Read_Addr_Width(void) {
	uint8_t bytes = 0; //illegal address width
	bytes = Nrf_Read_Reg(SETUP_AW);
	switch (bytes) {
	case 1:
		bytes = 3;
		break;
	case 2:
		bytes = 4;
		break;
	case 3:
		bytes = 5;
		break;
	default:
#ifdef  Debug_Enable
		Print_Debug_Buffer(6, TX_ADDR, bytes , buff_pointer);
#endif
		break;
	}
	return bytes;
}

void Nrf_Read_Tx_Addr(uint8_t *buff_pointer) {
	uint8_t bytes;
	bytes = Nrf_Read_Addr_Width();
	switch (bytes) {
	case 1:
		Nrf_Read_Buf(TX_ADDR, buff_pointer, 3);
		break;
	case 2:
		Nrf_Read_Buf(TX_ADDR, buff_pointer, 4);
		break;
	case 3:
		Nrf_Read_Buf(TX_ADDR, buff_pointer, 5);
		break;
	default:
#ifdef  Debug_Enable
		Print_Debug_Buffer(6, TX_ADDR, bytes , buff_pointer);
#endif
		break;
	}
}



void Nrf_Set_Pipe_Addr(Pipe_No pipe, uint8_t *addr_pointer, uint8_t bytes) {

	switch (bytes) {
	case 3:
		Nrf_Write_Reg(WRITE_REG_NRF | SETUP_AW, 0x01);
		break;
	case 4:
		Nrf_Write_Reg(WRITE_REG_NRF | SETUP_AW, 0x02);
		break;
	case 5:
		Nrf_Write_Reg(WRITE_REG_NRF | SETUP_AW, 0x03);
		break;
	default:
#ifdef  Debug_Enable
		Print_Debug_Buffer(5, TX_ADDR, bytes , addr_pointer);
#endif
		break;
	}

	switch (pipe) {
	case Pipe0:
	case Pipe1:
		Nrf_Write_Buf((RX_ADDR_P0 + pipe), addr_pointer, bytes);
		break;

	case Pipe2:
	case Pipe3:
	case Pipe4:
	case Pipe5:
		Nrf_Write_Buf((RX_ADDR_P0 + pipe), addr_pointer, 1);
		break;

	default:
#ifdef  Debug_Enable
		Print_Debug_Buffer(5, TX_ADDR, bytes , addr_pointer);
#endif
		break;
	}
}

void Nrf_Read_Pipe_Addr(Pipe_No pipe, uint8_t *buff_pointer) {
	uint8_t bytes;
	bytes = Nrf_Read_Addr_Width();   //

	switch (pipe) {
	case Pipe0:
	case Pipe1:
		Nrf_Read_Buf((RX_ADDR_P0 + pipe), buff_pointer, bytes);
		break;

	case Pipe2:
	case Pipe3:
	case Pipe4:
	case Pipe5:
		Nrf_Read_Buf((RX_ADDR_P0 + pipe), buff_pointer, 1);
		break;

	default:
#ifdef  Debug_Enable
		Print_Debug_Buffer(5, TX_ADDR, bytes , addr_pointer);
#endif
		break;
	}

}

void Nrf_Write_Tx_Payload(uint8_t *addr_pointer, uint8_t bytes) {
	if (bytes <= 32) {
		Nrf_Write_Buf(WR_TX_PLOAD, addr_pointer, bytes);
	} else {
#ifdef  Debug_Enable
		Print_Debug_Buffer(9, WR_TX_PLOAD, bytes , addr_pointer);
#endif
	}
}

void Nrf_Read_Rx_Payload(uint8_t *buff_pointer, uint8_t bytes) {
	if (bytes <= 32) {
		Nrf_Read_Buf(WR_TX_PLOAD, buff_pointer, bytes);
	} else {
#ifdef  Debug_Enable
		Print_Debug_Buffer(10, RD_RX_PLOAD, bytes , buff_pointer);
#endif
	}
}

void Nrf_Enable_Pipe(Pipe_No pipe) {
	uint8_t pipes;
	if (pipe <= 5) {
		pipes = Nrf_Read_Reg(EN_RXADDR);
		pipes |= pipe;
		Nrf_Write_Reg(EN_RXADDR, pipes);
	} else {
#ifdef  Debug_Enable
		Print_Debug_Register(11, EN_RXADDR, pipes);
#endif
	}
}

void Nrf_Disble_Pipe(Pipe_No pipe) {
	uint8_t pipes;
	if (pipe <= 5) {
		pipes = Nrf_Read_Reg(EN_RXADDR);
		pipes &= ~pipe;
		Nrf_Write_Reg(EN_RXADDR, pipes);
	} else {
#ifdef  Debug_Enable
		Print_Debug_Register(11, EN_RXADDR, pipes);
#endif
	}
}

void Nrf_Enable_AutoAck(Pipe_No pipe) {
	uint8_t pipes;
	if (pipe <= 5) {
		pipes = Nrf_Read_Reg(EN_AA);
		pipes |= pipe;
		Nrf_Write_Reg(EN_AA, pipes);

	} else {
#ifdef  Debug_Enable
		Print_Debug_Register(12, EN_AA, pipes);
#endif
	}
}

void Nrf_Disble_AutoAck(Pipe_No pipe) {
	uint8_t pipes;
	if (pipe <= 5) {
		pipes = Nrf_Read_Reg(EN_AA);
		pipes &= ~pipe;
		Nrf_Write_Reg(EN_AA, pipes);

	} else {
#ifdef  Debug_Enable
		Print_Debug_Register(12, EN_AA, pipes);
#endif
	}
}

void Nrf_Set_RF_Ch(uint8_t channel) {
	if (channel < 126) {
		Nrf_Write_Reg(RF_CH, channel);
	} else {
#ifdef  Debug_Enable
		Print_Debug_Register(13, RF_CH, channel);
#endif
	}
}

uint8_t Nrf_Read_RF_Ch(void) {
	uint8_t channel;
	channel = Nrf_Read_Reg(RF_CH);
#ifdef  Debug_Enable
	Print_Debug_Register(14, RF_CH, channel);
#endif
	return channel;
}

void Nrf_Set_Pipe_Data_Width(Pipe_No pipe, uint8_t width) {
	if (width <= 32) {
		Nrf_Write_Reg((RX_PW_P0 + pipe), width);

	} else {
#ifdef  Debug_Enable
		Print_Debug_Register(15, (RX_PW_P0 + pipe), width);
#endif
	}
}

uint8_t Nrf_Read_Pipe_Data_Width(Pipe_No pipe) {
	uint8_t width;
	width = Nrf_Read_Reg((RX_PW_P0 + pipe));

#ifdef  Debug_Enable
	Print_Debug_Register(15, (RX_PW_P0 + pipe), width);
#endif
	return width;
}

void Nrf_Flush_Tx(void) {
	Nrf_Csn_Low();
	Spi_TxRx(FLUSH_TX);
	Nrf_Csn_High();
#ifdef  Debug_Enable
	Tx_String("Nrf_Flush_Tx\n");
#endif
}

void Nrf_Flush_Rx(void) {
	Nrf_Csn_Low();
	Spi_TxRx(FLUSH_RX);
	Nrf_Csn_High();
#ifdef  Debug_Enable
	Tx_String("Nrf_Flush_Rx\n");
#endif

}

void Nrf_Power_Up(void) {
	uint8_t temp;
	temp = Nrf_Read_Reg(CONFIG);
	Nrf_Write_Reg(CONFIG, (uint8_t) (CONFIG_PWR_UP | temp));
#ifdef  Debug_Enable
	Print_Debug_Register(18, CONFIG, (CONFIG_PWR_UP | temp));
#endif
}

void Nrf_Power_Down(void) {
	uint8_t temp;
	temp = Nrf_Read_Reg(CONFIG);
	Nrf_Write_Reg(CONFIG, (uint8_t) ((~CONFIG_PWR_UP ) & temp));
#ifdef  Debug_Enable
	Print_Debug_Register(19, CONFIG, (uint8_t)((~CONFIG_PWR_UP ) & temp));
#endif
}

uint8_t Nrf_Read_RPD(void) {
	return (Nrf_Read_Reg(RPD) & (0x01));
#ifdef  Debug_Enable
	Tx_String("Nrf_Read_RPD\n");
#endif
}

void Nrf_Set_Power_Level(Nrf_Power level) {
	uint8_t temp;
	temp = (Nrf_Read_Reg(RF_SETUP) & (0xF8));
	switch (level) {
	case Pwr_18dB:
		temp |= (0x00);
		Nrf_Write_Reg( RF_SETUP, temp);	// Write it to the chip
		break;

	case Pwr_12dB:
		temp |= (0x02);
		Nrf_Write_Reg( RF_SETUP, temp);	// Write it to the chip
		break;

	case Pwr_6dB:
		temp |= (0x04);
		Nrf_Write_Reg( RF_SETUP, temp);	// Write it to the chip
		break;

	case Pwr_0dB:
		temp |= (0x06);
		Nrf_Write_Reg( RF_SETUP, temp);	// Write it to the chip
		break;

	default:
		//Error_Function(21);
		break;
	}

}

Nrf_Power Nrf_Read_Power_Level(void) {
	uint8_t temp;
	temp = Nrf_Read_Reg(RF_SETUP);
	temp &= (RF_PWR1 | RF_PWR0 );
	temp = temp >> 1;
#ifdef  Debug_Enable
	Print_Debug_Register(22, RF_SETUP, temp);
#endif
	return ((Nrf_Power) temp);
}

void Nrf_Set_Data_Rate(Nrf_Data_Rate speed) {
	uint8_t setup;

	setup = Nrf_Read_Reg(RF_SETUP);
	switch (speed) {
	case Data_Rate_256Kbs:
		setup &= (~RF_DR_HIGH );
		setup |= RF_DR_LOW;
		Nrf_Write_Reg(RF_SETUP, setup);
		break;

	case Data_Rate_1Mbs:
		setup &= ~(RF_DR_LOW | RF_DR_HIGH );
		Nrf_Write_Reg(RF_SETUP, setup);
		break;

	case Data_Rate_2Mbs:
		setup &= (~(RF_DR_LOW ));
		setup |= (RF_DR_HIGH );
		Nrf_Write_Reg(RF_SETUP, setup);
		break;

	default:
		//Error_Function(23);
		break;
	}

#ifdef  Debug_Enable
	Print_Debug_Register(23, RF_SETUP, setup);
#endif

}

Nrf_Data_Rate Nrf_Read_Data_Rate(void) {
	uint8_t setup, temp = 0;
	setup = Nrf_Read_Reg(RF_SETUP);
	setup = (setup & (RF_DR_LOW | RF_DR_HIGH ));
	if ((setup) == 0x20) {
		temp = Data_Rate_256Kbs;
	} else if ((setup) == 0x00) {
		temp = Data_Rate_1Mbs;
	} else if ((setup) == 0x08) {
		temp = Data_Rate_2Mbs;
	}
#ifdef  Debug_Enable
	Print_Debug_Register(24, RF_SETUP, temp);
#endif
	return ((Nrf_Data_Rate) temp);
}

void Nrf_Set_Crc_Length(Nrf_Crc length) {
	uint8_t config;
	if (length <= Two_Byte_Crc) {
		config = Nrf_Read_Reg(CONFIG);

		if (length == Disable_Crc) {
			config &= ~( CONFIG_CRCO | CONFIG_EN_CRC );
			Nrf_Write_Reg( CONFIG, config);
		}

		else if (length == One_Byte_Crc) {
			config |= CONFIG_EN_CRC;
			config &= ~(CONFIG_CRCO );
			Nrf_Write_Reg( CONFIG, config);
		} else if (length == Two_Byte_Crc) {
			config |= CONFIG_EN_CRC;
			config |= CONFIG_CRCO;
			Nrf_Write_Reg( CONFIG, config);
		}
#ifdef  Debug_Enable
		Print_Debug_Register(25, CONFIG, config);
#endif
	} else {
		//Error_Function(25);
	}
}

Nrf_Crc Nrf_Read_Crc_Length(void) {

	uint8_t config, result,AA;
	config = Nrf_Read_Reg(CONFIG) & ( CONFIG_CRCO | CONFIG_EN_CRC );
	AA = Nrf_Read_Reg(EN_AA);


	if ((config & CONFIG_EN_CRC ) || AA) {
		if (config & CONFIG_CRCO) {
			result = Two_Byte_Crc;
		} else {
			result = One_Byte_Crc;
		}
	} else {
		result = Disable_Crc;
	}
#ifdef  Debug_Enable
	Print_Debug_Register(26, CONFIG, result);
#endif
	return (Nrf_Crc)result;
}

void Nrf_Set_Retries(Ard_Delay delay, uint8_t count) {
	if (delay > 15 || count > 15) {
		//Error_Function(27);
	}

	else {
		Nrf_Write_Reg(SETUP_RETR, ((delay & 0xf) << 4) | ((count & 0xf) << 0));
#ifdef  Debug_Enable
		Print_Debug_Register(27, SETUP_RETR, Nrf_Read_Reg(SETUP_RETR));
#endif

	}
}

void Nrf_Set_Mode(Nrf_Mode mode) {
	uint8_t config;
	config = Nrf_Read_Reg(CONFIG);
	switch (mode) {
	case Ptx_Mode:
		Nrf_Write_Reg(CONFIG, (uint8_t) (config & ~CONFIG_PRIM_RX ));
		break;

	case Prx_Mode:
		Nrf_Write_Reg(CONFIG, (uint8_t) (config | CONFIG_PRIM_RX ));
		break;

	default:
		//Error_Function(28);
		break;
	}
#ifdef  Debug_Enable
	Print_Debug_Register(28, CONFIG, Nrf_Read_Reg(CONFIG));
#endif
}

void Nrf_Disable_Irq(Irq_Mask mask) {
	int8_t config;
	config = Nrf_Read_Reg(CONFIG);
	if (mask == Max_Rt) {
		Nrf_Write_Reg(CONFIG, (config | CONFIG_MAX_RT ));

	} else if (mask == Tx_Ds) {
		Nrf_Write_Reg(CONFIG, (config | CONFIG_TX_DS ));

	} else if (mask == Rx_Dr) {
		Nrf_Write_Reg(CONFIG, (config | CONFIG_RX_DR ));

	}
#ifdef  Debug_Enable
	Print_Debug_Register(29, CONFIG, Nrf_Read_Reg(CONFIG));
#endif
}

void Nrf_Clear_Irq(Irq_Mask mask) {
	uint8_t status;
	status = Nrf_Read_Reg(STATUS);
	if (mask == Max_Rt) {
		Nrf_Write_Reg(STATUS, (status | STAT_MAX_RT ));

	} else if (mask == Tx_Ds) {
		Nrf_Write_Reg(STATUS, (status | STAT_TX_DS ));

	} else if (mask == Rx_Dr) {
		Nrf_Write_Reg(STATUS, (status | STAT_RX_DR ));

	}
#ifdef  Debug_Enable
	Print_Debug_Register(30, STATUS, Nrf_Read_Reg(STATUS));
#endif

}

void Transmit_Payoad(void) {
	Nrf_Ce_High();
// HAL_Delay(50); //50usec
	Nrf_Ce_Low();
#ifdef  Debug_Enable
	Tx_String("Transmit_Payoad\n");
#endif

}

void Nrf_Enable_Dynamic_Payload(Pipe_No pipe) {
	if (pipe < Pipe5) {
		uint8_t temp;
		temp = Nrf_Read_Reg(FEATURE);
		Nrf_Write_Reg(FEATURE, (temp | EN_DPL ));
		temp = Nrf_Read_Reg(DYNPD);
		Nrf_Write_Reg(DYNPD, (temp) | (1 << pipe));
	}

}

void Nrf_Enable_Ack_Payload(void) {
	uint8_t temp;
	temp = Nrf_Read_Reg(FEATURE);
	Nrf_Write_Reg(FEATURE, temp | (EN_ACK_PAY ) | (EN_DPL ));
}

void Nrf_Write_Ack_Payload(uint8_t pipe, uint8_t *buf, uint8_t bytes) {

	if (bytes <= 32 && pipe < Pipe5) {
		Nrf_Write_Buf((WR_ACK_PLOAD + pipe), buf, bytes);
	} else {
#ifdef  Debug_Enable
		//Print_Debug_Buffer(Nrf_Write_Ack_Payload);
#endif
	}
}

//error Funtions

