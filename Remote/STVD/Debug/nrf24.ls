   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  45                     ; 12 void Nrf_Csn_Low(void) {
  47                     	switch	.text
  48  0000               _Nrf_Csn_Low:
  52                     ; 13 	GPIO_WriteLow(CSN_GPIO_PORT, CSN_PIN);
  54  0000 4b04          	push	#4
  55  0002 ae500a        	ldw	x,#20490
  56  0005 cd0000        	call	_GPIO_WriteLow
  58  0008 84            	pop	a
  59                     ; 14 }
  62  0009 81            	ret
  86                     ; 16 void Nrf_Csn_High(void) {
  87                     	switch	.text
  88  000a               _Nrf_Csn_High:
  92                     ; 17 	GPIO_WriteHigh(CSN_GPIO_PORT, CSN_PIN);
  94  000a 4b04          	push	#4
  95  000c ae500a        	ldw	x,#20490
  96  000f cd0000        	call	_GPIO_WriteHigh
  98  0012 84            	pop	a
  99                     ; 18 }
 102  0013 81            	ret
 126                     ; 20 void Nrf_Ce_Low(void) {
 127                     	switch	.text
 128  0014               _Nrf_Ce_Low:
 132                     ; 21 	GPIO_WriteLow(CE_GPIO_PORT, CE_PIN);
 134  0014 4b20          	push	#32
 135  0016 ae5005        	ldw	x,#20485
 136  0019 cd0000        	call	_GPIO_WriteLow
 138  001c 84            	pop	a
 139                     ; 22 }
 142  001d 81            	ret
 166                     ; 24 void Nrf_Ce_High(void) {
 167                     	switch	.text
 168  001e               _Nrf_Ce_High:
 172                     ; 25 	GPIO_WriteHigh(CE_GPIO_PORT, CE_PIN);
 174  001e 4b20          	push	#32
 175  0020 ae5005        	ldw	x,#20485
 176  0023 cd0000        	call	_GPIO_WriteHigh
 178  0026 84            	pop	a
 179                     ; 26 }
 182  0027 81            	ret
 209                     ; 28 void Nrf_Init(void)
 209                     ; 29 {
 210                     	switch	.text
 211  0028               _Nrf_Init:
 215                     ; 30 	Nrf_Gpio_Init();
 217  0028 cd0000        	call	_Nrf_Gpio_Init
 219                     ; 31 	SPI_DeInit();
 221  002b cd0000        	call	_SPI_DeInit
 223                     ; 32 	SPI_Init(SPI_FIRSTBIT_MSB, SPI_BAUDRATEPRESCALER_2, SPI_MODE_MASTER,\
 223                     ; 33             SPI_CLOCKPOLARITY_HIGH, SPI_CLOCKPHASE_2EDGE, \
 223                     ; 34             SPI_DATADIRECTION_2LINES_FULLDUPLEX, SPI_NSS_SOFT, 0x07);
 225  002e 4b07          	push	#7
 226  0030 4b02          	push	#2
 227  0032 4b00          	push	#0
 228  0034 4b01          	push	#1
 229  0036 4b02          	push	#2
 230  0038 4b04          	push	#4
 231  003a 5f            	clrw	x
 232  003b cd0000        	call	_SPI_Init
 234  003e 5b06          	addw	sp,#6
 235                     ; 35    SPI_Cmd(ENABLE);
 237  0040 a601          	ld	a,#1
 238  0042 cd0000        	call	_SPI_Cmd
 240                     ; 36 }
 243  0045 81            	ret
 280                     ; 39 uint8_t Spi_TxRx(uint8_t pTxData) {
 281                     	switch	.text
 282  0046               _Spi_TxRx:
 284  0046 88            	push	a
 285       00000000      OFST:	set	0
 288  0047               L101:
 289                     ; 40   while (SPI_GetFlagStatus( SPI_FLAG_TXE) == RESET);
 291  0047 a602          	ld	a,#2
 292  0049 cd0000        	call	_SPI_GetFlagStatus
 294  004c 4d            	tnz	a
 295  004d 27f8          	jreq	L101
 296                     ; 41 	SPI_SendData(pTxData);
 298  004f 7b01          	ld	a,(OFST+1,sp)
 299  0051 cd0000        	call	_SPI_SendData
 302  0054               L701:
 303                     ; 42 	while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
 305  0054 a601          	ld	a,#1
 306  0056 cd0000        	call	_SPI_GetFlagStatus
 308  0059 4d            	tnz	a
 309  005a 27f8          	jreq	L701
 310                     ; 43 	return SPI_ReceiveData();	 
 312  005c cd0000        	call	_SPI_ReceiveData
 316  005f 5b01          	addw	sp,#1
 317  0061 81            	ret
 363                     ; 47 uint8_t Nrf_Read_Reg(uint8_t reg) {
 364                     	switch	.text
 365  0062               _Nrf_Read_Reg:
 367  0062 88            	push	a
 368  0063 88            	push	a
 369       00000001      OFST:	set	1
 372                     ; 48 	uint8_t value = 0;
 374  0064 0f01          	clr	(OFST+0,sp)
 375                     ; 49 	if (reg <= 0x1D) {
 377  0066 a11e          	cp	a,#30
 378  0068 240d          	jruge	L731
 379                     ; 50 		Nrf_Csn_Low();
 381  006a ad94          	call	_Nrf_Csn_Low
 383                     ; 51 		Spi_TxRx(reg); /* Transmit register to read */
 385  006c 7b02          	ld	a,(OFST+1,sp)
 386  006e add6          	call	_Spi_TxRx
 388                     ; 52 		value = Spi_TxRx(0x00); /* Then get the register value */
 390  0070 4f            	clr	a
 391  0071 add3          	call	_Spi_TxRx
 393  0073 6b01          	ld	(OFST+0,sp),a
 394                     ; 53 		Nrf_Csn_High();
 396  0075 ad93          	call	_Nrf_Csn_High
 399  0077               L731:
 400                     ; 59 	return value;
 402  0077 7b01          	ld	a,(OFST+0,sp)
 405  0079 85            	popw	x
 406  007a 81            	ret
 452                     ; 63 void Nrf_Write_Reg(uint8_t reg, uint8_t val) {
 453                     	switch	.text
 454  007b               _Nrf_Write_Reg:
 456  007b 89            	pushw	x
 457       00000000      OFST:	set	0
 460                     ; 65 	if (reg <= 0x1D) {
 462  007c 9e            	ld	a,xh
 463  007d a11e          	cp	a,#30
 464  007f 2410          	jruge	L561
 465                     ; 66 		Nrf_Csn_Low();
 467  0081 cd0000        	call	_Nrf_Csn_Low
 469                     ; 67 		Spi_TxRx(WRITE_REG_NRF | reg);
 471  0084 7b01          	ld	a,(OFST+1,sp)
 472  0086 aa20          	or	a,#32
 473  0088 adbc          	call	_Spi_TxRx
 475                     ; 68 		Spi_TxRx(val);
 477  008a 7b02          	ld	a,(OFST+2,sp)
 478  008c adb8          	call	_Spi_TxRx
 480                     ; 69 		Nrf_Csn_High();
 482  008e cd000a        	call	_Nrf_Csn_High
 485  0091               L561:
 486                     ; 77 }
 489  0091 85            	popw	x
 490  0092 81            	ret
 555                     ; 79 void Nrf_Read_Buf(uint8_t reg, uint8_t *buff_pointer, uint8_t bytes) {
 556                     	switch	.text
 557  0093               _Nrf_Read_Buf:
 559  0093 88            	push	a
 560  0094 88            	push	a
 561       00000001      OFST:	set	1
 564                     ; 81 	if (bytes <= 32) {
 566  0095 7b07          	ld	a,(OFST+6,sp)
 567  0097 a121          	cp	a,#33
 568  0099 2424          	jruge	L332
 569                     ; 85 		Nrf_Csn_Low();                       // Set CSN low, init SPI tranaction
 571  009b cd0000        	call	_Nrf_Csn_Low
 573                     ; 86 		Spi_TxRx(reg);  // Select register to write to and read status byte
 575  009e 7b02          	ld	a,(OFST+1,sp)
 576  00a0 ada4          	call	_Spi_TxRx
 578                     ; 87 		for (byte_ctr = 0; byte_ctr < bytes; byte_ctr++) {
 580  00a2 0f01          	clr	(OFST+0,sp)
 582  00a4 2010          	jra	L722
 583  00a6               L322:
 584                     ; 88 			*buff_pointer++ = Spi_TxRx(0x00);
 586  00a6 4f            	clr	a
 587  00a7 ad9d          	call	_Spi_TxRx
 589  00a9 1e05          	ldw	x,(OFST+4,sp)
 590  00ab 1c0001        	addw	x,#1
 591  00ae 1f05          	ldw	(OFST+4,sp),x
 592  00b0 1d0001        	subw	x,#1
 593  00b3 f7            	ld	(x),a
 594                     ; 87 		for (byte_ctr = 0; byte_ctr < bytes; byte_ctr++) {
 596  00b4 0c01          	inc	(OFST+0,sp)
 597  00b6               L722:
 600  00b6 7b01          	ld	a,(OFST+0,sp)
 601  00b8 1107          	cp	a,(OFST+6,sp)
 602  00ba 25ea          	jrult	L322
 603                     ; 90 		Nrf_Csn_High();    // Set CSN high again
 605  00bc cd000a        	call	_Nrf_Csn_High
 608  00bf               L332:
 609                     ; 98 }
 612  00bf 85            	popw	x
 613  00c0 81            	ret
 678                     ; 100 void Nrf_Write_Buf(uint8_t reg, uint8_t *addr_pointer, uint8_t bytes) {
 679                     	switch	.text
 680  00c1               _Nrf_Write_Buf:
 682  00c1 88            	push	a
 683  00c2 88            	push	a
 684       00000001      OFST:	set	1
 687                     ; 102 	if (bytes <= 32) {
 689  00c3 7b07          	ld	a,(OFST+6,sp)
 690  00c5 a121          	cp	a,#33
 691  00c7 2427          	jruge	L103
 692                     ; 106 		Nrf_Csn_Low();                       // Set CSN low, init SPI tranaction
 694  00c9 cd0000        	call	_Nrf_Csn_Low
 696                     ; 107 		Spi_TxRx(WRITE_REG_NRF | reg);
 698  00cc 7b02          	ld	a,(OFST+1,sp)
 699  00ce aa20          	or	a,#32
 700  00d0 cd0046        	call	_Spi_TxRx
 702                     ; 108 		for (byte_ctr = 0; byte_ctr < bytes; byte_ctr++) { // then write all byte in buffer(*pBuf)
 704  00d3 0f01          	clr	(OFST+0,sp)
 706  00d5 2010          	jra	L572
 707  00d7               L172:
 708                     ; 109 			Spi_TxRx(*addr_pointer++);
 710  00d7 1e05          	ldw	x,(OFST+4,sp)
 711  00d9 1c0001        	addw	x,#1
 712  00dc 1f05          	ldw	(OFST+4,sp),x
 713  00de 1d0001        	subw	x,#1
 714  00e1 f6            	ld	a,(x)
 715  00e2 cd0046        	call	_Spi_TxRx
 717                     ; 108 		for (byte_ctr = 0; byte_ctr < bytes; byte_ctr++) { // then write all byte in buffer(*pBuf)
 719  00e5 0c01          	inc	(OFST+0,sp)
 720  00e7               L572:
 723  00e7 7b01          	ld	a,(OFST+0,sp)
 724  00e9 1107          	cp	a,(OFST+6,sp)
 725  00eb 25ea          	jrult	L172
 726                     ; 111 		Nrf_Csn_High();                                    // Set CSN high again
 728  00ed cd000a        	call	_Nrf_Csn_High
 731  00f0               L103:
 732                     ; 119 }
 735  00f0 85            	popw	x
 736  00f1 81            	ret
 782                     ; 121 void Nrf_Set_Tx_Addr(uint8_t *addr_pointer, uint8_t bytes) {
 783                     	switch	.text
 784  00f2               _Nrf_Set_Tx_Addr:
 786  00f2 89            	pushw	x
 787       00000000      OFST:	set	0
 790                     ; 122 	switch (bytes) {
 792  00f3 7b05          	ld	a,(OFST+5,sp)
 794                     ; 135 	default:
 794                     ; 136 #ifdef  Debug_Enable
 794                     ; 137 		Print_Debug_Buffer(5, TX_ADDR, bytes , addr_pointer);
 794                     ; 138 #endif
 794                     ; 139 		break;
 795  00f5 a003          	sub	a,#3
 796  00f7 2708          	jreq	L303
 797  00f9 4a            	dec	a
 798  00fa 2719          	jreq	L503
 799  00fc 4a            	dec	a
 800  00fd 272a          	jreq	L703
 801  00ff 203a          	jra	L733
 802  0101               L303:
 803                     ; 123 	case 3:
 803                     ; 124 		Nrf_Write_Reg(WRITE_REG_NRF | SETUP_AW, 0x01);
 805  0101 ae2301        	ldw	x,#8961
 806  0104 cd007b        	call	_Nrf_Write_Reg
 808                     ; 125 		Nrf_Write_Buf(TX_ADDR, addr_pointer, bytes);
 810  0107 7b05          	ld	a,(OFST+5,sp)
 811  0109 88            	push	a
 812  010a 1e02          	ldw	x,(OFST+2,sp)
 813  010c 89            	pushw	x
 814  010d a610          	ld	a,#16
 815  010f adb0          	call	_Nrf_Write_Buf
 817  0111 5b03          	addw	sp,#3
 818                     ; 126 		break;
 820  0113 2026          	jra	L733
 821  0115               L503:
 822                     ; 127 	case 4:
 822                     ; 128 		Nrf_Write_Reg(WRITE_REG_NRF | SETUP_AW, 0x02);
 824  0115 ae2302        	ldw	x,#8962
 825  0118 cd007b        	call	_Nrf_Write_Reg
 827                     ; 129 		Nrf_Write_Buf(TX_ADDR, addr_pointer, bytes);
 829  011b 7b05          	ld	a,(OFST+5,sp)
 830  011d 88            	push	a
 831  011e 1e02          	ldw	x,(OFST+2,sp)
 832  0120 89            	pushw	x
 833  0121 a610          	ld	a,#16
 834  0123 ad9c          	call	_Nrf_Write_Buf
 836  0125 5b03          	addw	sp,#3
 837                     ; 130 		break;
 839  0127 2012          	jra	L733
 840  0129               L703:
 841                     ; 131 	case 5:
 841                     ; 132 		Nrf_Write_Reg(WRITE_REG_NRF | SETUP_AW, 0x03);
 843  0129 ae2303        	ldw	x,#8963
 844  012c cd007b        	call	_Nrf_Write_Reg
 846                     ; 133 		Nrf_Write_Buf(TX_ADDR, addr_pointer, bytes);
 848  012f 7b05          	ld	a,(OFST+5,sp)
 849  0131 88            	push	a
 850  0132 1e02          	ldw	x,(OFST+2,sp)
 851  0134 89            	pushw	x
 852  0135 a610          	ld	a,#16
 853  0137 ad88          	call	_Nrf_Write_Buf
 855  0139 5b03          	addw	sp,#3
 856                     ; 134 		break;
 858  013b               L113:
 859                     ; 135 	default:
 859                     ; 136 #ifdef  Debug_Enable
 859                     ; 137 		Print_Debug_Buffer(5, TX_ADDR, bytes , addr_pointer);
 859                     ; 138 #endif
 859                     ; 139 		break;
 861  013b               L733:
 862                     ; 141 }
 865  013b 85            	popw	x
 866  013c 81            	ret
 902                     ; 143 uint8_t Nrf_Read_Addr_Width(void) {
 903                     	switch	.text
 904  013d               _Nrf_Read_Addr_Width:
 906  013d 88            	push	a
 907       00000001      OFST:	set	1
 910                     ; 144 	uint8_t bytes = 0; //illegal address width
 912                     ; 145 	bytes = Nrf_Read_Reg(SETUP_AW);
 914  013e a603          	ld	a,#3
 915  0140 cd0062        	call	_Nrf_Read_Reg
 917  0143 6b01          	ld	(OFST+0,sp),a
 918                     ; 146 	switch (bytes) {
 920  0145 7b01          	ld	a,(OFST+0,sp)
 922                     ; 156 	default:
 922                     ; 157 #ifdef  Debug_Enable
 922                     ; 158 		Print_Debug_Buffer(6, TX_ADDR, bytes , buff_pointer);
 922                     ; 159 #endif
 922                     ; 160 		break;
 923  0147 4a            	dec	a
 924  0148 2708          	jreq	L143
 925  014a 4a            	dec	a
 926  014b 270b          	jreq	L343
 927  014d 4a            	dec	a
 928  014e 270e          	jreq	L543
 929  0150 2010          	jra	L173
 930  0152               L143:
 931                     ; 147 	case 1:
 931                     ; 148 		bytes = 3;
 933  0152 a603          	ld	a,#3
 934  0154 6b01          	ld	(OFST+0,sp),a
 935                     ; 149 		break;
 937  0156 200a          	jra	L173
 938  0158               L343:
 939                     ; 150 	case 2:
 939                     ; 151 		bytes = 4;
 941  0158 a604          	ld	a,#4
 942  015a 6b01          	ld	(OFST+0,sp),a
 943                     ; 152 		break;
 945  015c 2004          	jra	L173
 946  015e               L543:
 947                     ; 153 	case 3:
 947                     ; 154 		bytes = 5;
 949  015e a605          	ld	a,#5
 950  0160 6b01          	ld	(OFST+0,sp),a
 951                     ; 155 		break;
 953  0162               L743:
 954                     ; 156 	default:
 954                     ; 157 #ifdef  Debug_Enable
 954                     ; 158 		Print_Debug_Buffer(6, TX_ADDR, bytes , buff_pointer);
 954                     ; 159 #endif
 954                     ; 160 		break;
 956  0162               L173:
 957                     ; 162 	return bytes;
 959  0162 7b01          	ld	a,(OFST+0,sp)
 962  0164 5b01          	addw	sp,#1
 963  0166 81            	ret
1009                     ; 165 void Nrf_Read_Tx_Addr(uint8_t *buff_pointer) {
1010                     	switch	.text
1011  0167               _Nrf_Read_Tx_Addr:
1013  0167 89            	pushw	x
1014  0168 88            	push	a
1015       00000001      OFST:	set	1
1018                     ; 167 	bytes = Nrf_Read_Addr_Width();
1020  0169 add2          	call	_Nrf_Read_Addr_Width
1022  016b 6b01          	ld	(OFST+0,sp),a
1023                     ; 168 	switch (bytes) {
1025  016d 7b01          	ld	a,(OFST+0,sp)
1027                     ; 178 	default:
1027                     ; 179 #ifdef  Debug_Enable
1027                     ; 180 		Print_Debug_Buffer(6, TX_ADDR, bytes , buff_pointer);
1027                     ; 181 #endif
1027                     ; 182 		break;
1028  016f 4a            	dec	a
1029  0170 2708          	jreq	L373
1030  0172 4a            	dec	a
1031  0173 2713          	jreq	L573
1032  0175 4a            	dec	a
1033  0176 271e          	jreq	L773
1034  0178 2028          	jra	L724
1035  017a               L373:
1036                     ; 169 	case 1:
1036                     ; 170 		Nrf_Read_Buf(TX_ADDR, buff_pointer, 3);
1038  017a 4b03          	push	#3
1039  017c 1e03          	ldw	x,(OFST+2,sp)
1040  017e 89            	pushw	x
1041  017f a610          	ld	a,#16
1042  0181 cd0093        	call	_Nrf_Read_Buf
1044  0184 5b03          	addw	sp,#3
1045                     ; 171 		break;
1047  0186 201a          	jra	L724
1048  0188               L573:
1049                     ; 172 	case 2:
1049                     ; 173 		Nrf_Read_Buf(TX_ADDR, buff_pointer, 4);
1051  0188 4b04          	push	#4
1052  018a 1e03          	ldw	x,(OFST+2,sp)
1053  018c 89            	pushw	x
1054  018d a610          	ld	a,#16
1055  018f cd0093        	call	_Nrf_Read_Buf
1057  0192 5b03          	addw	sp,#3
1058                     ; 174 		break;
1060  0194 200c          	jra	L724
1061  0196               L773:
1062                     ; 175 	case 3:
1062                     ; 176 		Nrf_Read_Buf(TX_ADDR, buff_pointer, 5);
1064  0196 4b05          	push	#5
1065  0198 1e03          	ldw	x,(OFST+2,sp)
1066  019a 89            	pushw	x
1067  019b a610          	ld	a,#16
1068  019d cd0093        	call	_Nrf_Read_Buf
1070  01a0 5b03          	addw	sp,#3
1071                     ; 177 		break;
1073  01a2               L104:
1074                     ; 178 	default:
1074                     ; 179 #ifdef  Debug_Enable
1074                     ; 180 		Print_Debug_Buffer(6, TX_ADDR, bytes , buff_pointer);
1074                     ; 181 #endif
1074                     ; 182 		break;
1076  01a2               L724:
1077                     ; 184 }
1080  01a2 5b03          	addw	sp,#3
1081  01a4 81            	ret
1185                     ; 188 void Nrf_Set_Pipe_Addr(Pipe_No pipe, uint8_t *addr_pointer, uint8_t bytes) {
1186                     	switch	.text
1187  01a5               _Nrf_Set_Pipe_Addr:
1189  01a5 88            	push	a
1190       00000000      OFST:	set	0
1193                     ; 190 	switch (bytes) {
1195  01a6 7b06          	ld	a,(OFST+6,sp)
1197                     ; 200 	default:
1197                     ; 201 #ifdef  Debug_Enable
1197                     ; 202 		Print_Debug_Buffer(5, TX_ADDR, bytes , addr_pointer);
1197                     ; 203 #endif
1197                     ; 204 		break;
1198  01a8 a003          	sub	a,#3
1199  01aa 2708          	jreq	L134
1200  01ac 4a            	dec	a
1201  01ad 270d          	jreq	L334
1202  01af 4a            	dec	a
1203  01b0 2712          	jreq	L534
1204  01b2 2016          	jra	L715
1205  01b4               L134:
1206                     ; 191 	case 3:
1206                     ; 192 		Nrf_Write_Reg(WRITE_REG_NRF | SETUP_AW, 0x01);
1208  01b4 ae2301        	ldw	x,#8961
1209  01b7 cd007b        	call	_Nrf_Write_Reg
1211                     ; 193 		break;
1213  01ba 200e          	jra	L715
1214  01bc               L334:
1215                     ; 194 	case 4:
1215                     ; 195 		Nrf_Write_Reg(WRITE_REG_NRF | SETUP_AW, 0x02);
1217  01bc ae2302        	ldw	x,#8962
1218  01bf cd007b        	call	_Nrf_Write_Reg
1220                     ; 196 		break;
1222  01c2 2006          	jra	L715
1223  01c4               L534:
1224                     ; 197 	case 5:
1224                     ; 198 		Nrf_Write_Reg(WRITE_REG_NRF | SETUP_AW, 0x03);
1226  01c4 ae2303        	ldw	x,#8963
1227  01c7 cd007b        	call	_Nrf_Write_Reg
1229                     ; 199 		break;
1231  01ca               L734:
1232                     ; 200 	default:
1232                     ; 201 #ifdef  Debug_Enable
1232                     ; 202 		Print_Debug_Buffer(5, TX_ADDR, bytes , addr_pointer);
1232                     ; 203 #endif
1232                     ; 204 		break;
1234  01ca               L715:
1235                     ; 207 	switch (pipe) {
1237  01ca 7b01          	ld	a,(OFST+1,sp)
1239                     ; 220 	default:
1239                     ; 221 #ifdef  Debug_Enable
1239                     ; 222 		Print_Debug_Buffer(5, TX_ADDR, bytes , addr_pointer);
1239                     ; 223 #endif
1239                     ; 224 		break;
1240  01cc 4d            	tnz	a
1241  01cd 2711          	jreq	L144
1242  01cf 4a            	dec	a
1243  01d0 270e          	jreq	L144
1244  01d2 4a            	dec	a
1245  01d3 271c          	jreq	L344
1246  01d5 4a            	dec	a
1247  01d6 2719          	jreq	L344
1248  01d8 4a            	dec	a
1249  01d9 2716          	jreq	L344
1250  01db 4a            	dec	a
1251  01dc 2713          	jreq	L344
1252  01de 201f          	jra	L325
1253  01e0               L144:
1254                     ; 208 	case Pipe0:
1254                     ; 209 	case Pipe1:
1254                     ; 210 		Nrf_Write_Buf((RX_ADDR_P0 + pipe), addr_pointer, bytes);
1256  01e0 7b06          	ld	a,(OFST+6,sp)
1257  01e2 88            	push	a
1258  01e3 1e05          	ldw	x,(OFST+5,sp)
1259  01e5 89            	pushw	x
1260  01e6 7b04          	ld	a,(OFST+4,sp)
1261  01e8 ab0a          	add	a,#10
1262  01ea cd00c1        	call	_Nrf_Write_Buf
1264  01ed 5b03          	addw	sp,#3
1265                     ; 211 		break;
1267  01ef 200e          	jra	L325
1268  01f1               L344:
1269                     ; 213 	case Pipe2:
1269                     ; 214 	case Pipe3:
1269                     ; 215 	case Pipe4:
1269                     ; 216 	case Pipe5:
1269                     ; 217 		Nrf_Write_Buf((RX_ADDR_P0 + pipe), addr_pointer, 1);
1271  01f1 4b01          	push	#1
1272  01f3 1e05          	ldw	x,(OFST+5,sp)
1273  01f5 89            	pushw	x
1274  01f6 7b04          	ld	a,(OFST+4,sp)
1275  01f8 ab0a          	add	a,#10
1276  01fa cd00c1        	call	_Nrf_Write_Buf
1278  01fd 5b03          	addw	sp,#3
1279                     ; 218 		break;
1281  01ff               L544:
1282                     ; 220 	default:
1282                     ; 221 #ifdef  Debug_Enable
1282                     ; 222 		Print_Debug_Buffer(5, TX_ADDR, bytes , addr_pointer);
1282                     ; 223 #endif
1282                     ; 224 		break;
1284  01ff               L325:
1285                     ; 226 }
1288  01ff 84            	pop	a
1289  0200 81            	ret
1345                     ; 228 void Nrf_Read_Pipe_Addr(Pipe_No pipe, uint8_t *buff_pointer) {
1346                     	switch	.text
1347  0201               _Nrf_Read_Pipe_Addr:
1349  0201 88            	push	a
1350  0202 88            	push	a
1351       00000001      OFST:	set	1
1354                     ; 230 	bytes = Nrf_Read_Addr_Width();   //
1356  0203 cd013d        	call	_Nrf_Read_Addr_Width
1358  0206 6b01          	ld	(OFST+0,sp),a
1359                     ; 232 	switch (pipe) {
1361  0208 7b02          	ld	a,(OFST+1,sp)
1363                     ; 245 	default:
1363                     ; 246 #ifdef  Debug_Enable
1363                     ; 247 		Print_Debug_Buffer(5, TX_ADDR, bytes , addr_pointer);
1363                     ; 248 #endif
1363                     ; 249 		break;
1364  020a 4d            	tnz	a
1365  020b 2711          	jreq	L525
1366  020d 4a            	dec	a
1367  020e 270e          	jreq	L525
1368  0210 4a            	dec	a
1369  0211 271c          	jreq	L725
1370  0213 4a            	dec	a
1371  0214 2719          	jreq	L725
1372  0216 4a            	dec	a
1373  0217 2716          	jreq	L725
1374  0219 4a            	dec	a
1375  021a 2713          	jreq	L725
1376  021c 201f          	jra	L365
1377  021e               L525:
1378                     ; 233 	case Pipe0:
1378                     ; 234 	case Pipe1:
1378                     ; 235 		Nrf_Read_Buf((RX_ADDR_P0 + pipe), buff_pointer, bytes);
1380  021e 7b01          	ld	a,(OFST+0,sp)
1381  0220 88            	push	a
1382  0221 1e06          	ldw	x,(OFST+5,sp)
1383  0223 89            	pushw	x
1384  0224 7b05          	ld	a,(OFST+4,sp)
1385  0226 ab0a          	add	a,#10
1386  0228 cd0093        	call	_Nrf_Read_Buf
1388  022b 5b03          	addw	sp,#3
1389                     ; 236 		break;
1391  022d 200e          	jra	L365
1392  022f               L725:
1393                     ; 238 	case Pipe2:
1393                     ; 239 	case Pipe3:
1393                     ; 240 	case Pipe4:
1393                     ; 241 	case Pipe5:
1393                     ; 242 		Nrf_Read_Buf((RX_ADDR_P0 + pipe), buff_pointer, 1);
1395  022f 4b01          	push	#1
1396  0231 1e06          	ldw	x,(OFST+5,sp)
1397  0233 89            	pushw	x
1398  0234 7b05          	ld	a,(OFST+4,sp)
1399  0236 ab0a          	add	a,#10
1400  0238 cd0093        	call	_Nrf_Read_Buf
1402  023b 5b03          	addw	sp,#3
1403                     ; 243 		break;
1405  023d               L135:
1406                     ; 245 	default:
1406                     ; 246 #ifdef  Debug_Enable
1406                     ; 247 		Print_Debug_Buffer(5, TX_ADDR, bytes , addr_pointer);
1406                     ; 248 #endif
1406                     ; 249 		break;
1408  023d               L365:
1409                     ; 252 }
1412  023d 85            	popw	x
1413  023e 81            	ret
1459                     ; 254 void Nrf_Write_Tx_Payload(uint8_t *addr_pointer, uint8_t bytes) {
1460                     	switch	.text
1461  023f               _Nrf_Write_Tx_Payload:
1463  023f 89            	pushw	x
1464       00000000      OFST:	set	0
1467                     ; 255 	if (bytes <= 32) {
1469  0240 7b05          	ld	a,(OFST+5,sp)
1470  0242 a121          	cp	a,#33
1471  0244 240b          	jruge	L116
1472                     ; 256 		Nrf_Write_Buf(WR_TX_PLOAD, addr_pointer, bytes);
1474  0246 7b05          	ld	a,(OFST+5,sp)
1475  0248 88            	push	a
1476  0249 89            	pushw	x
1477  024a a6a0          	ld	a,#160
1478  024c cd00c1        	call	_Nrf_Write_Buf
1480  024f 5b03          	addw	sp,#3
1482  0251               L116:
1483                     ; 262 }
1486  0251 85            	popw	x
1487  0252 81            	ret
1533                     ; 264 void Nrf_Read_Rx_Payload(uint8_t *buff_pointer, uint8_t bytes) {
1534                     	switch	.text
1535  0253               _Nrf_Read_Rx_Payload:
1537  0253 89            	pushw	x
1538       00000000      OFST:	set	0
1541                     ; 265 	if (bytes <= 32) {
1543  0254 7b05          	ld	a,(OFST+5,sp)
1544  0256 a121          	cp	a,#33
1545  0258 240b          	jruge	L736
1546                     ; 266 		Nrf_Read_Buf(WR_TX_PLOAD, buff_pointer, bytes);
1548  025a 7b05          	ld	a,(OFST+5,sp)
1549  025c 88            	push	a
1550  025d 89            	pushw	x
1551  025e a6a0          	ld	a,#160
1552  0260 cd0093        	call	_Nrf_Read_Buf
1554  0263 5b03          	addw	sp,#3
1556  0265               L736:
1557                     ; 272 }
1560  0265 85            	popw	x
1561  0266 81            	ret
1607                     ; 274 void Nrf_Enable_Pipe(Pipe_No pipe) {
1608                     	switch	.text
1609  0267               _Nrf_Enable_Pipe:
1611  0267 88            	push	a
1612  0268 88            	push	a
1613       00000001      OFST:	set	1
1616                     ; 276 	if (pipe <= 5) {
1618  0269 a106          	cp	a,#6
1619  026b 2416          	jruge	L566
1620                     ; 277 		pipes = Nrf_Read_Reg(EN_RXADDR);
1622  026d a602          	ld	a,#2
1623  026f cd0062        	call	_Nrf_Read_Reg
1625  0272 6b01          	ld	(OFST+0,sp),a
1626                     ; 278 		pipes |= pipe;
1628  0274 7b01          	ld	a,(OFST+0,sp)
1629  0276 1a02          	or	a,(OFST+1,sp)
1630  0278 6b01          	ld	(OFST+0,sp),a
1631                     ; 279 		Nrf_Write_Reg(EN_RXADDR, pipes);
1633  027a 7b01          	ld	a,(OFST+0,sp)
1634  027c 97            	ld	xl,a
1635  027d a602          	ld	a,#2
1636  027f 95            	ld	xh,a
1637  0280 cd007b        	call	_Nrf_Write_Reg
1640  0283               L566:
1641                     ; 285 }
1644  0283 85            	popw	x
1645  0284 81            	ret
1691                     ; 287 void Nrf_Disble_Pipe(Pipe_No pipe) {
1692                     	switch	.text
1693  0285               _Nrf_Disble_Pipe:
1695  0285 88            	push	a
1696  0286 88            	push	a
1697       00000001      OFST:	set	1
1700                     ; 289 	if (pipe <= 5) {
1702  0287 a106          	cp	a,#6
1703  0289 2417          	jruge	L317
1704                     ; 290 		pipes = Nrf_Read_Reg(EN_RXADDR);
1706  028b a602          	ld	a,#2
1707  028d cd0062        	call	_Nrf_Read_Reg
1709  0290 6b01          	ld	(OFST+0,sp),a
1710                     ; 291 		pipes &= ~pipe;
1712  0292 7b02          	ld	a,(OFST+1,sp)
1713  0294 43            	cpl	a
1714  0295 1401          	and	a,(OFST+0,sp)
1715  0297 6b01          	ld	(OFST+0,sp),a
1716                     ; 292 		Nrf_Write_Reg(EN_RXADDR, pipes);
1718  0299 7b01          	ld	a,(OFST+0,sp)
1719  029b 97            	ld	xl,a
1720  029c a602          	ld	a,#2
1721  029e 95            	ld	xh,a
1722  029f cd007b        	call	_Nrf_Write_Reg
1725  02a2               L317:
1726                     ; 298 }
1729  02a2 85            	popw	x
1730  02a3 81            	ret
1776                     ; 300 void Nrf_Enable_AutoAck(Pipe_No pipe) {
1777                     	switch	.text
1778  02a4               _Nrf_Enable_AutoAck:
1780  02a4 88            	push	a
1781  02a5 88            	push	a
1782       00000001      OFST:	set	1
1785                     ; 302 	if (pipe <= 5) {
1787  02a6 a106          	cp	a,#6
1788  02a8 2416          	jruge	L147
1789                     ; 303 		pipes = Nrf_Read_Reg(EN_AA);
1791  02aa a601          	ld	a,#1
1792  02ac cd0062        	call	_Nrf_Read_Reg
1794  02af 6b01          	ld	(OFST+0,sp),a
1795                     ; 304 		pipes |= pipe;
1797  02b1 7b01          	ld	a,(OFST+0,sp)
1798  02b3 1a02          	or	a,(OFST+1,sp)
1799  02b5 6b01          	ld	(OFST+0,sp),a
1800                     ; 305 		Nrf_Write_Reg(EN_AA, pipes);
1802  02b7 7b01          	ld	a,(OFST+0,sp)
1803  02b9 97            	ld	xl,a
1804  02ba a601          	ld	a,#1
1805  02bc 95            	ld	xh,a
1806  02bd cd007b        	call	_Nrf_Write_Reg
1809  02c0               L147:
1810                     ; 312 }
1813  02c0 85            	popw	x
1814  02c1 81            	ret
1860                     ; 314 void Nrf_Disble_AutoAck(Pipe_No pipe) {
1861                     	switch	.text
1862  02c2               _Nrf_Disble_AutoAck:
1864  02c2 88            	push	a
1865  02c3 88            	push	a
1866       00000001      OFST:	set	1
1869                     ; 316 	if (pipe <= 5) {
1871  02c4 a106          	cp	a,#6
1872  02c6 2417          	jruge	L767
1873                     ; 317 		pipes = Nrf_Read_Reg(EN_AA);
1875  02c8 a601          	ld	a,#1
1876  02ca cd0062        	call	_Nrf_Read_Reg
1878  02cd 6b01          	ld	(OFST+0,sp),a
1879                     ; 318 		pipes &= ~pipe;
1881  02cf 7b02          	ld	a,(OFST+1,sp)
1882  02d1 43            	cpl	a
1883  02d2 1401          	and	a,(OFST+0,sp)
1884  02d4 6b01          	ld	(OFST+0,sp),a
1885                     ; 319 		Nrf_Write_Reg(EN_AA, pipes);
1887  02d6 7b01          	ld	a,(OFST+0,sp)
1888  02d8 97            	ld	xl,a
1889  02d9 a601          	ld	a,#1
1890  02db 95            	ld	xh,a
1891  02dc cd007b        	call	_Nrf_Write_Reg
1894  02df               L767:
1895                     ; 326 }
1898  02df 85            	popw	x
1899  02e0 81            	ret
1934                     ; 328 void Nrf_Set_RF_Ch(uint8_t channel) {
1935                     	switch	.text
1936  02e1               _Nrf_Set_RF_Ch:
1940                     ; 329 	if (channel < 126) {
1942  02e1 a17e          	cp	a,#126
1943  02e3 2407          	jruge	L1101
1944                     ; 330 		Nrf_Write_Reg(RF_CH, channel);
1946  02e5 97            	ld	xl,a
1947  02e6 a605          	ld	a,#5
1948  02e8 95            	ld	xh,a
1949  02e9 cd007b        	call	_Nrf_Write_Reg
1952  02ec               L1101:
1953                     ; 336 }
1956  02ec 81            	ret
1991                     ; 338 uint8_t Nrf_Read_RF_Ch(void) {
1992                     	switch	.text
1993  02ed               _Nrf_Read_RF_Ch:
1995  02ed 88            	push	a
1996       00000001      OFST:	set	1
1999                     ; 340 	channel = Nrf_Read_Reg(RF_CH);
2001  02ee a605          	ld	a,#5
2002  02f0 cd0062        	call	_Nrf_Read_Reg
2004  02f3 6b01          	ld	(OFST+0,sp),a
2005                     ; 344 	return channel;
2007  02f5 7b01          	ld	a,(OFST+0,sp)
2010  02f7 5b01          	addw	sp,#1
2011  02f9 81            	ret
2057                     ; 347 void Nrf_Set_Pipe_Data_Width(Pipe_No pipe, uint8_t width) {
2058                     	switch	.text
2059  02fa               _Nrf_Set_Pipe_Data_Width:
2061  02fa 89            	pushw	x
2062       00000000      OFST:	set	0
2065                     ; 348 	if (width <= 32) {
2067  02fb 9f            	ld	a,xl
2068  02fc a121          	cp	a,#33
2069  02fe 240a          	jruge	L5501
2070                     ; 349 		Nrf_Write_Reg((RX_PW_P0 + pipe), width);
2072  0300 9f            	ld	a,xl
2073  0301 97            	ld	xl,a
2074  0302 7b01          	ld	a,(OFST+1,sp)
2075  0304 ab11          	add	a,#17
2076  0306 95            	ld	xh,a
2077  0307 cd007b        	call	_Nrf_Write_Reg
2080  030a               L5501:
2081                     ; 356 }
2084  030a 85            	popw	x
2085  030b 81            	ret
2131                     ; 358 uint8_t Nrf_Read_Pipe_Data_Width(Pipe_No pipe) {
2132                     	switch	.text
2133  030c               _Nrf_Read_Pipe_Data_Width:
2135  030c 88            	push	a
2136       00000001      OFST:	set	1
2139                     ; 360 	width = Nrf_Read_Reg((RX_PW_P0 + pipe));
2141  030d ab11          	add	a,#17
2142  030f cd0062        	call	_Nrf_Read_Reg
2144  0312 6b01          	ld	(OFST+0,sp),a
2145                     ; 365 	return width;
2147  0314 7b01          	ld	a,(OFST+0,sp)
2150  0316 5b01          	addw	sp,#1
2151  0318 81            	ret
2177                     ; 368 void Nrf_Flush_Tx(void) {
2178                     	switch	.text
2179  0319               _Nrf_Flush_Tx:
2183                     ; 369 	Nrf_Csn_Low();
2185  0319 cd0000        	call	_Nrf_Csn_Low
2187                     ; 370 	Spi_TxRx(FLUSH_TX);
2189  031c a6e1          	ld	a,#225
2190  031e cd0046        	call	_Spi_TxRx
2192                     ; 371 	Nrf_Csn_High();
2194  0321 cd000a        	call	_Nrf_Csn_High
2196                     ; 375 }
2199  0324 81            	ret
2225                     ; 377 void Nrf_Flush_Rx(void) {
2226                     	switch	.text
2227  0325               _Nrf_Flush_Rx:
2231                     ; 378 	Nrf_Csn_Low();
2233  0325 cd0000        	call	_Nrf_Csn_Low
2235                     ; 379 	Spi_TxRx(FLUSH_RX);
2237  0328 a6e2          	ld	a,#226
2238  032a cd0046        	call	_Spi_TxRx
2240                     ; 380 	Nrf_Csn_High();
2242  032d cd000a        	call	_Nrf_Csn_High
2244                     ; 385 }
2247  0330 81            	ret
2283                     ; 387 void Nrf_Power_Up(void) {
2284                     	switch	.text
2285  0331               _Nrf_Power_Up:
2287  0331 88            	push	a
2288       00000001      OFST:	set	1
2291                     ; 389 	temp = Nrf_Read_Reg(CONFIG);
2293  0332 4f            	clr	a
2294  0333 cd0062        	call	_Nrf_Read_Reg
2296  0336 6b01          	ld	(OFST+0,sp),a
2297                     ; 390 	Nrf_Write_Reg(CONFIG, (uint8_t) (CONFIG_PWR_UP | temp));
2299  0338 7b01          	ld	a,(OFST+0,sp)
2300  033a aa02          	or	a,#2
2301  033c 97            	ld	xl,a
2302  033d 4f            	clr	a
2303  033e 95            	ld	xh,a
2304  033f cd007b        	call	_Nrf_Write_Reg
2306                     ; 394 }
2309  0342 84            	pop	a
2310  0343 81            	ret
2346                     ; 396 void Nrf_Power_Down(void) {
2347                     	switch	.text
2348  0344               _Nrf_Power_Down:
2350  0344 88            	push	a
2351       00000001      OFST:	set	1
2354                     ; 398 	temp = Nrf_Read_Reg(CONFIG);
2356  0345 4f            	clr	a
2357  0346 cd0062        	call	_Nrf_Read_Reg
2359  0349 6b01          	ld	(OFST+0,sp),a
2360                     ; 399 	Nrf_Write_Reg(CONFIG, (uint8_t) ((~CONFIG_PWR_UP ) & temp));
2362  034b 7b01          	ld	a,(OFST+0,sp)
2363  034d a4fd          	and	a,#253
2364  034f 97            	ld	xl,a
2365  0350 4f            	clr	a
2366  0351 95            	ld	xh,a
2367  0352 cd007b        	call	_Nrf_Write_Reg
2369                     ; 403 }
2372  0355 84            	pop	a
2373  0356 81            	ret
2397                     ; 405 uint8_t Nrf_Read_RPD(void) {
2398                     	switch	.text
2399  0357               _Nrf_Read_RPD:
2403                     ; 406 	return (Nrf_Read_Reg(RPD) & (0x01));
2405  0357 a609          	ld	a,#9
2406  0359 cd0062        	call	_Nrf_Read_Reg
2408  035c a401          	and	a,#1
2411  035e 81            	ret
2492                     ; 412 void Nrf_Set_Power_Level(Nrf_Power level) {
2493                     	switch	.text
2494  035f               _Nrf_Set_Power_Level:
2496  035f 88            	push	a
2497  0360 88            	push	a
2498       00000001      OFST:	set	1
2501                     ; 414 	temp = (Nrf_Read_Reg(RF_SETUP) & (0xF8));
2503  0361 a606          	ld	a,#6
2504  0363 cd0062        	call	_Nrf_Read_Reg
2506  0366 a4f8          	and	a,#248
2507  0368 6b01          	ld	(OFST+0,sp),a
2508                     ; 415 	switch (level) {
2510  036a 7b02          	ld	a,(OFST+1,sp)
2512                     ; 436 	default:
2512                     ; 437 		//Error_Function(21);
2512                     ; 438 		break;
2513  036c 4d            	tnz	a
2514  036d 270b          	jreq	L5611
2515  036f 4a            	dec	a
2516  0370 2713          	jreq	L7611
2517  0372 4a            	dec	a
2518  0373 2721          	jreq	L1711
2519  0375 4a            	dec	a
2520  0376 272f          	jreq	L3711
2521  0378 203c          	jra	L7321
2522  037a               L5611:
2523                     ; 416 	case Pwr_18dB:
2523                     ; 417 		temp |= (0x00);
2525                     ; 418 		Nrf_Write_Reg( RF_SETUP, temp);	// Write it to the chip
2527  037a 7b01          	ld	a,(OFST+0,sp)
2528  037c 97            	ld	xl,a
2529  037d a606          	ld	a,#6
2530  037f 95            	ld	xh,a
2531  0380 cd007b        	call	_Nrf_Write_Reg
2533                     ; 419 		break;
2535  0383 2031          	jra	L7321
2536  0385               L7611:
2537                     ; 421 	case Pwr_12dB:
2537                     ; 422 		temp |= (0x02);
2539  0385 7b01          	ld	a,(OFST+0,sp)
2540  0387 aa02          	or	a,#2
2541  0389 6b01          	ld	(OFST+0,sp),a
2542                     ; 423 		Nrf_Write_Reg( RF_SETUP, temp);	// Write it to the chip
2544  038b 7b01          	ld	a,(OFST+0,sp)
2545  038d 97            	ld	xl,a
2546  038e a606          	ld	a,#6
2547  0390 95            	ld	xh,a
2548  0391 cd007b        	call	_Nrf_Write_Reg
2550                     ; 424 		break;
2552  0394 2020          	jra	L7321
2553  0396               L1711:
2554                     ; 426 	case Pwr_6dB:
2554                     ; 427 		temp |= (0x04);
2556  0396 7b01          	ld	a,(OFST+0,sp)
2557  0398 aa04          	or	a,#4
2558  039a 6b01          	ld	(OFST+0,sp),a
2559                     ; 428 		Nrf_Write_Reg( RF_SETUP, temp);	// Write it to the chip
2561  039c 7b01          	ld	a,(OFST+0,sp)
2562  039e 97            	ld	xl,a
2563  039f a606          	ld	a,#6
2564  03a1 95            	ld	xh,a
2565  03a2 cd007b        	call	_Nrf_Write_Reg
2567                     ; 429 		break;
2569  03a5 200f          	jra	L7321
2570  03a7               L3711:
2571                     ; 431 	case Pwr_0dB:
2571                     ; 432 		temp |= (0x06);
2573  03a7 7b01          	ld	a,(OFST+0,sp)
2574  03a9 aa06          	or	a,#6
2575  03ab 6b01          	ld	(OFST+0,sp),a
2576                     ; 433 		Nrf_Write_Reg( RF_SETUP, temp);	// Write it to the chip
2578  03ad 7b01          	ld	a,(OFST+0,sp)
2579  03af 97            	ld	xl,a
2580  03b0 a606          	ld	a,#6
2581  03b2 95            	ld	xh,a
2582  03b3 cd007b        	call	_Nrf_Write_Reg
2584                     ; 434 		break;
2586  03b6               L5711:
2587                     ; 436 	default:
2587                     ; 437 		//Error_Function(21);
2587                     ; 438 		break;
2589  03b6               L7321:
2590                     ; 441 }
2593  03b6 85            	popw	x
2594  03b7 81            	ret
2631                     ; 443 Nrf_Power Nrf_Read_Power_Level(void) {
2632                     	switch	.text
2633  03b8               _Nrf_Read_Power_Level:
2635  03b8 88            	push	a
2636       00000001      OFST:	set	1
2639                     ; 445 	temp = Nrf_Read_Reg(RF_SETUP);
2641  03b9 a606          	ld	a,#6
2642  03bb cd0062        	call	_Nrf_Read_Reg
2644  03be 6b01          	ld	(OFST+0,sp),a
2645                     ; 446 	temp &= (RF_PWR1 | RF_PWR0 );
2647  03c0 7b01          	ld	a,(OFST+0,sp)
2648  03c2 a406          	and	a,#6
2649  03c4 6b01          	ld	(OFST+0,sp),a
2650                     ; 447 	temp = temp >> 1;
2652  03c6 0401          	srl	(OFST+0,sp)
2653                     ; 451 	return ((Nrf_Power) temp);
2655  03c8 7b01          	ld	a,(OFST+0,sp)
2658  03ca 5b01          	addw	sp,#1
2659  03cc 81            	ret
2732                     ; 454 void Nrf_Set_Data_Rate(Nrf_Data_Rate speed) {
2733                     	switch	.text
2734  03cd               _Nrf_Set_Data_Rate:
2736  03cd 88            	push	a
2737  03ce 88            	push	a
2738       00000001      OFST:	set	1
2741                     ; 457 	setup = Nrf_Read_Reg(RF_SETUP);
2743  03cf a606          	ld	a,#6
2744  03d1 cd0062        	call	_Nrf_Read_Reg
2746  03d4 6b01          	ld	(OFST+0,sp),a
2747                     ; 458 	switch (speed) {
2749  03d6 7b02          	ld	a,(OFST+1,sp)
2751                     ; 476 	default:
2751                     ; 477 		//Error_Function(23);
2751                     ; 478 		break;
2752  03d8 4d            	tnz	a
2753  03d9 2708          	jreq	L7521
2754  03db 4a            	dec	a
2755  03dc 271c          	jreq	L1621
2756  03de 4a            	dec	a
2757  03df 272a          	jreq	L3621
2758  03e1 203d          	jra	L5231
2759  03e3               L7521:
2760                     ; 459 	case Data_Rate_256Kbs:
2760                     ; 460 		setup &= (~RF_DR_HIGH );
2762  03e3 7b01          	ld	a,(OFST+0,sp)
2763  03e5 a4f7          	and	a,#247
2764  03e7 6b01          	ld	(OFST+0,sp),a
2765                     ; 461 		setup |= RF_DR_LOW;
2767  03e9 7b01          	ld	a,(OFST+0,sp)
2768  03eb aa20          	or	a,#32
2769  03ed 6b01          	ld	(OFST+0,sp),a
2770                     ; 462 		Nrf_Write_Reg(RF_SETUP, setup);
2772  03ef 7b01          	ld	a,(OFST+0,sp)
2773  03f1 97            	ld	xl,a
2774  03f2 a606          	ld	a,#6
2775  03f4 95            	ld	xh,a
2776  03f5 cd007b        	call	_Nrf_Write_Reg
2778                     ; 463 		break;
2780  03f8 2026          	jra	L5231
2781  03fa               L1621:
2782                     ; 465 	case Data_Rate_1Mbs:
2782                     ; 466 		setup &= ~(RF_DR_LOW | RF_DR_HIGH );
2784  03fa 7b01          	ld	a,(OFST+0,sp)
2785  03fc a4d7          	and	a,#215
2786  03fe 6b01          	ld	(OFST+0,sp),a
2787                     ; 467 		Nrf_Write_Reg(RF_SETUP, setup);
2789  0400 7b01          	ld	a,(OFST+0,sp)
2790  0402 97            	ld	xl,a
2791  0403 a606          	ld	a,#6
2792  0405 95            	ld	xh,a
2793  0406 cd007b        	call	_Nrf_Write_Reg
2795                     ; 468 		break;
2797  0409 2015          	jra	L5231
2798  040b               L3621:
2799                     ; 470 	case Data_Rate_2Mbs:
2799                     ; 471 		setup &= (~(RF_DR_LOW ));
2801  040b 7b01          	ld	a,(OFST+0,sp)
2802  040d a4df          	and	a,#223
2803  040f 6b01          	ld	(OFST+0,sp),a
2804                     ; 472 		setup |= (RF_DR_HIGH );
2806  0411 7b01          	ld	a,(OFST+0,sp)
2807  0413 aa08          	or	a,#8
2808  0415 6b01          	ld	(OFST+0,sp),a
2809                     ; 473 		Nrf_Write_Reg(RF_SETUP, setup);
2811  0417 7b01          	ld	a,(OFST+0,sp)
2812  0419 97            	ld	xl,a
2813  041a a606          	ld	a,#6
2814  041c 95            	ld	xh,a
2815  041d cd007b        	call	_Nrf_Write_Reg
2817                     ; 474 		break;
2819  0420               L5621:
2820                     ; 476 	default:
2820                     ; 477 		//Error_Function(23);
2820                     ; 478 		break;
2822  0420               L5231:
2823                     ; 485 }
2826  0420 85            	popw	x
2827  0421 81            	ret
2872                     ; 487 Nrf_Data_Rate Nrf_Read_Data_Rate(void) {
2873                     	switch	.text
2874  0422               _Nrf_Read_Data_Rate:
2876  0422 89            	pushw	x
2877       00000002      OFST:	set	2
2880                     ; 488 	uint8_t setup, temp = 0;
2882  0423 0f01          	clr	(OFST-1,sp)
2883                     ; 489 	setup = Nrf_Read_Reg(RF_SETUP);
2885  0425 a606          	ld	a,#6
2886  0427 cd0062        	call	_Nrf_Read_Reg
2888  042a 6b02          	ld	(OFST+0,sp),a
2889                     ; 490 	setup = (setup & (RF_DR_LOW | RF_DR_HIGH ));
2891  042c 7b02          	ld	a,(OFST+0,sp)
2892  042e a428          	and	a,#40
2893  0430 6b02          	ld	(OFST+0,sp),a
2894                     ; 491 	if ((setup) == 0x20) {
2896  0432 7b02          	ld	a,(OFST+0,sp)
2897  0434 a120          	cp	a,#32
2898  0436 2604          	jrne	L1531
2899                     ; 492 		temp = Data_Rate_256Kbs;
2901  0438 0f01          	clr	(OFST-1,sp)
2903  043a 2014          	jra	L3531
2904  043c               L1531:
2905                     ; 493 	} else if ((setup) == 0x00) {
2907  043c 0d02          	tnz	(OFST+0,sp)
2908  043e 2606          	jrne	L5531
2909                     ; 494 		temp = Data_Rate_1Mbs;
2911  0440 a601          	ld	a,#1
2912  0442 6b01          	ld	(OFST-1,sp),a
2914  0444 200a          	jra	L3531
2915  0446               L5531:
2916                     ; 495 	} else if ((setup) == 0x08) {
2918  0446 7b02          	ld	a,(OFST+0,sp)
2919  0448 a108          	cp	a,#8
2920  044a 2604          	jrne	L3531
2921                     ; 496 		temp = Data_Rate_2Mbs;
2923  044c a602          	ld	a,#2
2924  044e 6b01          	ld	(OFST-1,sp),a
2925  0450               L3531:
2926                     ; 501 	return ((Nrf_Data_Rate) temp);
2928  0450 7b01          	ld	a,(OFST-1,sp)
2931  0452 85            	popw	x
2932  0453 81            	ret
3005                     ; 504 void Nrf_Set_Crc_Length(Nrf_Crc length) {
3006                     	switch	.text
3007  0454               _Nrf_Set_Crc_Length:
3009  0454 88            	push	a
3010  0455 88            	push	a
3011       00000001      OFST:	set	1
3014                     ; 506 	if (length <= Two_Byte_Crc) {
3016  0456 a103          	cp	a,#3
3017  0458 2450          	jruge	L3341
3018                     ; 507 		config = Nrf_Read_Reg(CONFIG);
3020  045a 4f            	clr	a
3021  045b cd0062        	call	_Nrf_Read_Reg
3023  045e 6b01          	ld	(OFST+0,sp),a
3024                     ; 509 		if (length == Disable_Crc) {
3026  0460 0d02          	tnz	(OFST+1,sp)
3027  0462 2610          	jrne	L1241
3028                     ; 510 			config &= ~( CONFIG_CRCO | CONFIG_EN_CRC );
3030  0464 7b01          	ld	a,(OFST+0,sp)
3031  0466 a4f3          	and	a,#243
3032  0468 6b01          	ld	(OFST+0,sp),a
3033                     ; 511 			Nrf_Write_Reg( CONFIG, config);
3035  046a 7b01          	ld	a,(OFST+0,sp)
3036  046c 97            	ld	xl,a
3037  046d 4f            	clr	a
3038  046e 95            	ld	xh,a
3039  046f cd007b        	call	_Nrf_Write_Reg
3042  0472 2036          	jra	L3341
3043  0474               L1241:
3044                     ; 514 		else if (length == One_Byte_Crc) {
3046  0474 7b02          	ld	a,(OFST+1,sp)
3047  0476 a101          	cp	a,#1
3048  0478 2616          	jrne	L5241
3049                     ; 515 			config |= CONFIG_EN_CRC;
3051  047a 7b01          	ld	a,(OFST+0,sp)
3052  047c aa08          	or	a,#8
3053  047e 6b01          	ld	(OFST+0,sp),a
3054                     ; 516 			config &= ~(CONFIG_CRCO );
3056  0480 7b01          	ld	a,(OFST+0,sp)
3057  0482 a4fb          	and	a,#251
3058  0484 6b01          	ld	(OFST+0,sp),a
3059                     ; 517 			Nrf_Write_Reg( CONFIG, config);
3061  0486 7b01          	ld	a,(OFST+0,sp)
3062  0488 97            	ld	xl,a
3063  0489 4f            	clr	a
3064  048a 95            	ld	xh,a
3065  048b cd007b        	call	_Nrf_Write_Reg
3068  048e 201a          	jra	L3341
3069  0490               L5241:
3070                     ; 518 		} else if (length == Two_Byte_Crc) {
3072  0490 7b02          	ld	a,(OFST+1,sp)
3073  0492 a102          	cp	a,#2
3074  0494 2614          	jrne	L3341
3075                     ; 519 			config |= CONFIG_EN_CRC;
3077  0496 7b01          	ld	a,(OFST+0,sp)
3078  0498 aa08          	or	a,#8
3079  049a 6b01          	ld	(OFST+0,sp),a
3080                     ; 520 			config |= CONFIG_CRCO;
3082  049c 7b01          	ld	a,(OFST+0,sp)
3083  049e aa04          	or	a,#4
3084  04a0 6b01          	ld	(OFST+0,sp),a
3085                     ; 521 			Nrf_Write_Reg( CONFIG, config);
3087  04a2 7b01          	ld	a,(OFST+0,sp)
3088  04a4 97            	ld	xl,a
3089  04a5 4f            	clr	a
3090  04a6 95            	ld	xh,a
3091  04a7 cd007b        	call	_Nrf_Write_Reg
3093  04aa               L3341:
3094                     ; 529 }
3097  04aa 85            	popw	x
3098  04ab 81            	ret
3153                     ; 531 Nrf_Crc Nrf_Read_Crc_Length(void) {
3154                     	switch	.text
3155  04ac               _Nrf_Read_Crc_Length:
3157  04ac 89            	pushw	x
3158       00000002      OFST:	set	2
3161                     ; 534 	config = Nrf_Read_Reg(CONFIG) & ( CONFIG_CRCO | CONFIG_EN_CRC );
3163  04ad 4f            	clr	a
3164  04ae cd0062        	call	_Nrf_Read_Reg
3166  04b1 a40c          	and	a,#12
3167  04b3 6b02          	ld	(OFST+0,sp),a
3168                     ; 535 	AA = Nrf_Read_Reg(EN_AA);
3170  04b5 a601          	ld	a,#1
3171  04b7 cd0062        	call	_Nrf_Read_Reg
3173  04ba 6b01          	ld	(OFST-1,sp),a
3174                     ; 538 	if ((config & CONFIG_EN_CRC ) || AA) {
3176  04bc 7b02          	ld	a,(OFST+0,sp)
3177  04be a508          	bcp	a,#8
3178  04c0 2604          	jrne	L5641
3180  04c2 0d01          	tnz	(OFST-1,sp)
3181  04c4 2714          	jreq	L3641
3182  04c6               L5641:
3183                     ; 539 		if (config & CONFIG_CRCO) {
3185  04c6 7b02          	ld	a,(OFST+0,sp)
3186  04c8 a504          	bcp	a,#4
3187  04ca 2706          	jreq	L7641
3188                     ; 540 			result = Two_Byte_Crc;
3190  04cc a602          	ld	a,#2
3191  04ce 6b02          	ld	(OFST+0,sp),a
3193  04d0 2004          	jra	L3741
3194  04d2               L7641:
3195                     ; 542 			result = One_Byte_Crc;
3197  04d2 a601          	ld	a,#1
3198  04d4 6b02          	ld	(OFST+0,sp),a
3199  04d6               L3741:
3200                     ; 550 	return (Nrf_Crc)result;
3202  04d6 7b02          	ld	a,(OFST+0,sp)
3205  04d8 85            	popw	x
3206  04d9 81            	ret
3207  04da               L3641:
3208                     ; 545 		result = Disable_Crc;
3210  04da 0f02          	clr	(OFST+0,sp)
3211  04dc 20f8          	jra	L3741
3374                     ; 553 void Nrf_Set_Retries(Ard_Delay delay, uint8_t count) {
3375                     	switch	.text
3376  04de               _Nrf_Set_Retries:
3378  04de 89            	pushw	x
3379  04df 88            	push	a
3380       00000001      OFST:	set	1
3383                     ; 554 	if (delay > 15 || count > 15) {
3385  04e0 9e            	ld	a,xh
3386  04e1 a110          	cp	a,#16
3387  04e3 241d          	jruge	L7651
3389  04e5 9f            	ld	a,xl
3390  04e6 a110          	cp	a,#16
3391  04e8 2418          	jruge	L7651
3392                     ; 559 		Nrf_Write_Reg(SETUP_RETR, ((delay & 0xf) << 4) | ((count & 0xf) << 0));
3394  04ea 7b03          	ld	a,(OFST+2,sp)
3395  04ec a40f          	and	a,#15
3396  04ee 6b01          	ld	(OFST+0,sp),a
3397  04f0 7b02          	ld	a,(OFST+1,sp)
3398  04f2 a40f          	and	a,#15
3399  04f4 97            	ld	xl,a
3400  04f5 a610          	ld	a,#16
3401  04f7 42            	mul	x,a
3402  04f8 9f            	ld	a,xl
3403  04f9 1a01          	or	a,(OFST+0,sp)
3404  04fb 97            	ld	xl,a
3405  04fc a604          	ld	a,#4
3406  04fe 95            	ld	xh,a
3407  04ff cd007b        	call	_Nrf_Write_Reg
3409  0502               L7651:
3410                     ; 565 }
3413  0502 5b03          	addw	sp,#3
3414  0504 81            	ret
3480                     ; 567 void Nrf_Set_Mode(Nrf_Mode mode) {
3481                     	switch	.text
3482  0505               _Nrf_Set_Mode:
3484  0505 88            	push	a
3485  0506 88            	push	a
3486       00000001      OFST:	set	1
3489                     ; 569 	config = Nrf_Read_Reg(CONFIG);
3491  0507 4f            	clr	a
3492  0508 cd0062        	call	_Nrf_Read_Reg
3494  050b 6b01          	ld	(OFST+0,sp),a
3495                     ; 570 	switch (mode) {
3497  050d 7b02          	ld	a,(OFST+1,sp)
3499                     ; 579 	default:
3499                     ; 580 		//Error_Function(28);
3499                     ; 581 		break;
3500  050f 4d            	tnz	a
3501  0510 2705          	jreq	L1751
3502  0512 4a            	dec	a
3503  0513 270e          	jreq	L3751
3504  0515 2016          	jra	L3361
3505  0517               L1751:
3506                     ; 571 	case Ptx_Mode:
3506                     ; 572 		Nrf_Write_Reg(CONFIG, (uint8_t) (config & ~CONFIG_PRIM_RX ));
3508  0517 7b01          	ld	a,(OFST+0,sp)
3509  0519 a4fe          	and	a,#254
3510  051b 97            	ld	xl,a
3511  051c 4f            	clr	a
3512  051d 95            	ld	xh,a
3513  051e cd007b        	call	_Nrf_Write_Reg
3515                     ; 573 		break;
3517  0521 200a          	jra	L3361
3518  0523               L3751:
3519                     ; 575 	case Prx_Mode:
3519                     ; 576 		Nrf_Write_Reg(CONFIG, (uint8_t) (config | CONFIG_PRIM_RX ));
3521  0523 7b01          	ld	a,(OFST+0,sp)
3522  0525 aa01          	or	a,#1
3523  0527 97            	ld	xl,a
3524  0528 4f            	clr	a
3525  0529 95            	ld	xh,a
3526  052a cd007b        	call	_Nrf_Write_Reg
3528                     ; 577 		break;
3530  052d               L5751:
3531                     ; 579 	default:
3531                     ; 580 		//Error_Function(28);
3531                     ; 581 		break;
3533  052d               L3361:
3534                     ; 586 }
3537  052d 85            	popw	x
3538  052e 81            	ret
3611                     ; 588 void Nrf_Disable_Irq(Irq_Mask mask) {
3612                     	switch	.text
3613  052f               _Nrf_Disable_Irq:
3615  052f 88            	push	a
3616  0530 88            	push	a
3617       00000001      OFST:	set	1
3620                     ; 590 	config = Nrf_Read_Reg(CONFIG);
3622  0531 4f            	clr	a
3623  0532 cd0062        	call	_Nrf_Read_Reg
3625  0535 6b01          	ld	(OFST+0,sp),a
3626                     ; 591 	if (mask == Max_Rt) {
3628  0537 0d02          	tnz	(OFST+1,sp)
3629  0539 260c          	jrne	L1761
3630                     ; 592 		Nrf_Write_Reg(CONFIG, (config | CONFIG_MAX_RT ));
3632  053b 7b01          	ld	a,(OFST+0,sp)
3633  053d aa10          	or	a,#16
3634  053f 97            	ld	xl,a
3635  0540 4f            	clr	a
3636  0541 95            	ld	xh,a
3637  0542 cd007b        	call	_Nrf_Write_Reg
3640  0545 2022          	jra	L3761
3641  0547               L1761:
3642                     ; 594 	} else if (mask == Tx_Ds) {
3644  0547 7b02          	ld	a,(OFST+1,sp)
3645  0549 a101          	cp	a,#1
3646  054b 260c          	jrne	L5761
3647                     ; 595 		Nrf_Write_Reg(CONFIG, (config | CONFIG_TX_DS ));
3649  054d 7b01          	ld	a,(OFST+0,sp)
3650  054f aa20          	or	a,#32
3651  0551 97            	ld	xl,a
3652  0552 4f            	clr	a
3653  0553 95            	ld	xh,a
3654  0554 cd007b        	call	_Nrf_Write_Reg
3657  0557 2010          	jra	L3761
3658  0559               L5761:
3659                     ; 597 	} else if (mask == Rx_Dr) {
3661  0559 7b02          	ld	a,(OFST+1,sp)
3662  055b a102          	cp	a,#2
3663  055d 260a          	jrne	L3761
3664                     ; 598 		Nrf_Write_Reg(CONFIG, (config | CONFIG_RX_DR ));
3666  055f 7b01          	ld	a,(OFST+0,sp)
3667  0561 aa40          	or	a,#64
3668  0563 97            	ld	xl,a
3669  0564 4f            	clr	a
3670  0565 95            	ld	xh,a
3671  0566 cd007b        	call	_Nrf_Write_Reg
3673  0569               L3761:
3674                     ; 604 }
3677  0569 85            	popw	x
3678  056a 81            	ret
3724                     ; 606 void Nrf_Clear_Irq(Irq_Mask mask) {
3725                     	switch	.text
3726  056b               _Nrf_Clear_Irq:
3728  056b 88            	push	a
3729  056c 88            	push	a
3730       00000001      OFST:	set	1
3733                     ; 608 	status = Nrf_Read_Reg(STATUS);
3735  056d a607          	ld	a,#7
3736  056f cd0062        	call	_Nrf_Read_Reg
3738  0572 6b01          	ld	(OFST+0,sp),a
3739                     ; 609 	if (mask == Max_Rt) {
3741  0574 0d02          	tnz	(OFST+1,sp)
3742  0576 260d          	jrne	L5271
3743                     ; 610 		Nrf_Write_Reg(STATUS, (status | STAT_MAX_RT ));
3745  0578 7b01          	ld	a,(OFST+0,sp)
3746  057a aa10          	or	a,#16
3747  057c 97            	ld	xl,a
3748  057d a607          	ld	a,#7
3749  057f 95            	ld	xh,a
3750  0580 cd007b        	call	_Nrf_Write_Reg
3753  0583 2024          	jra	L7271
3754  0585               L5271:
3755                     ; 612 	} else if (mask == Tx_Ds) {
3757  0585 7b02          	ld	a,(OFST+1,sp)
3758  0587 a101          	cp	a,#1
3759  0589 260d          	jrne	L1371
3760                     ; 613 		Nrf_Write_Reg(STATUS, (status | STAT_TX_DS ));
3762  058b 7b01          	ld	a,(OFST+0,sp)
3763  058d aa20          	or	a,#32
3764  058f 97            	ld	xl,a
3765  0590 a607          	ld	a,#7
3766  0592 95            	ld	xh,a
3767  0593 cd007b        	call	_Nrf_Write_Reg
3770  0596 2011          	jra	L7271
3771  0598               L1371:
3772                     ; 615 	} else if (mask == Rx_Dr) {
3774  0598 7b02          	ld	a,(OFST+1,sp)
3775  059a a102          	cp	a,#2
3776  059c 260b          	jrne	L7271
3777                     ; 616 		Nrf_Write_Reg(STATUS, (status | STAT_RX_DR ));
3779  059e 7b01          	ld	a,(OFST+0,sp)
3780  05a0 aa40          	or	a,#64
3781  05a2 97            	ld	xl,a
3782  05a3 a607          	ld	a,#7
3783  05a5 95            	ld	xh,a
3784  05a6 cd007b        	call	_Nrf_Write_Reg
3786  05a9               L7271:
3787                     ; 623 }
3790  05a9 85            	popw	x
3791  05aa 81            	ret
3816                     ; 625 void Transmit_Payoad(void) {
3817                     	switch	.text
3818  05ab               _Transmit_Payoad:
3822                     ; 626 	Nrf_Ce_High();
3824  05ab cd001e        	call	_Nrf_Ce_High
3826                     ; 628 	Nrf_Ce_Low();
3828  05ae cd0014        	call	_Nrf_Ce_Low
3830                     ; 633 }
3833  05b1 81            	ret
3880                     ; 635 void Nrf_Enable_Dynamic_Payload(Pipe_No pipe) {
3881                     	switch	.text
3882  05b2               _Nrf_Enable_Dynamic_Payload:
3884  05b2 88            	push	a
3885  05b3 88            	push	a
3886       00000001      OFST:	set	1
3889                     ; 636 	if (pipe < Pipe5) {
3891  05b4 a105          	cp	a,#5
3892  05b6 242f          	jruge	L1771
3893                     ; 638 		temp = Nrf_Read_Reg(FEATURE);
3895  05b8 a61d          	ld	a,#29
3896  05ba cd0062        	call	_Nrf_Read_Reg
3898  05bd 6b01          	ld	(OFST+0,sp),a
3899                     ; 639 		Nrf_Write_Reg(FEATURE, (temp | EN_DPL ));
3901  05bf 7b01          	ld	a,(OFST+0,sp)
3902  05c1 aa04          	or	a,#4
3903  05c3 97            	ld	xl,a
3904  05c4 a61d          	ld	a,#29
3905  05c6 95            	ld	xh,a
3906  05c7 cd007b        	call	_Nrf_Write_Reg
3908                     ; 640 		temp = Nrf_Read_Reg(DYNPD);
3910  05ca a61c          	ld	a,#28
3911  05cc cd0062        	call	_Nrf_Read_Reg
3913  05cf 6b01          	ld	(OFST+0,sp),a
3914                     ; 641 		Nrf_Write_Reg(DYNPD, (temp) | (1 << pipe));
3916  05d1 7b02          	ld	a,(OFST+1,sp)
3917  05d3 5f            	clrw	x
3918  05d4 97            	ld	xl,a
3919  05d5 a601          	ld	a,#1
3920  05d7 5d            	tnzw	x
3921  05d8 2704          	jreq	L031
3922  05da               L231:
3923  05da 48            	sll	a
3924  05db 5a            	decw	x
3925  05dc 26fc          	jrne	L231
3926  05de               L031:
3927  05de 1a01          	or	a,(OFST+0,sp)
3928  05e0 97            	ld	xl,a
3929  05e1 a61c          	ld	a,#28
3930  05e3 95            	ld	xh,a
3931  05e4 cd007b        	call	_Nrf_Write_Reg
3933  05e7               L1771:
3934                     ; 644 }
3937  05e7 85            	popw	x
3938  05e8 81            	ret
3975                     ; 646 void Nrf_Enable_Ack_Payload(void) {
3976                     	switch	.text
3977  05e9               _Nrf_Enable_Ack_Payload:
3979  05e9 88            	push	a
3980       00000001      OFST:	set	1
3983                     ; 648 	temp = Nrf_Read_Reg(FEATURE);
3985  05ea a61d          	ld	a,#29
3986  05ec cd0062        	call	_Nrf_Read_Reg
3988  05ef 6b01          	ld	(OFST+0,sp),a
3989                     ; 649 	Nrf_Write_Reg(FEATURE, temp | (EN_ACK_PAY ) | (EN_DPL ));
3991  05f1 7b01          	ld	a,(OFST+0,sp)
3992  05f3 aa02          	or	a,#2
3993  05f5 aa04          	or	a,#4
3994  05f7 97            	ld	xl,a
3995  05f8 a61d          	ld	a,#29
3996  05fa 95            	ld	xh,a
3997  05fb cd007b        	call	_Nrf_Write_Reg
3999                     ; 650 }
4002  05fe 84            	pop	a
4003  05ff 81            	ret
4058                     ; 652 void Nrf_Write_Ack_Payload(uint8_t pipe, uint8_t *buf, uint8_t bytes) {
4059                     	switch	.text
4060  0600               _Nrf_Write_Ack_Payload:
4062  0600 88            	push	a
4063       00000000      OFST:	set	0
4066                     ; 654 	if (bytes <= 32 && pipe < Pipe5) {
4068  0601 7b06          	ld	a,(OFST+6,sp)
4069  0603 a121          	cp	a,#33
4070  0605 2415          	jruge	L1402
4072  0607 7b01          	ld	a,(OFST+1,sp)
4073  0609 a105          	cp	a,#5
4074  060b 240f          	jruge	L1402
4075                     ; 655 		Nrf_Write_Buf((WR_ACK_PLOAD + pipe), buf, bytes);
4077  060d 7b06          	ld	a,(OFST+6,sp)
4078  060f 88            	push	a
4079  0610 1e05          	ldw	x,(OFST+5,sp)
4080  0612 89            	pushw	x
4081  0613 7b04          	ld	a,(OFST+4,sp)
4082  0615 aba8          	add	a,#168
4083  0617 cd00c1        	call	_Nrf_Write_Buf
4085  061a 5b03          	addw	sp,#3
4087  061c               L1402:
4088                     ; 661 }
4091  061c 84            	pop	a
4092  061d 81            	ret
4105                     	xdef	_Nrf_Write_Ack_Payload
4106                     	xdef	_Nrf_Read_RPD
4107                     	xdef	_Nrf_Enable_Ack_Payload
4108                     	xdef	_Nrf_Enable_Dynamic_Payload
4109                     	xdef	_Transmit_Payoad
4110                     	xdef	_Nrf_Clear_Irq
4111                     	xdef	_Nrf_Disable_Irq
4112                     	xdef	_Nrf_Set_Mode
4113                     	xdef	_Nrf_Set_Retries
4114                     	xdef	_Nrf_Read_Crc_Length
4115                     	xdef	_Nrf_Set_Crc_Length
4116                     	xdef	_Nrf_Read_Data_Rate
4117                     	xdef	_Nrf_Set_Data_Rate
4118                     	xdef	_Nrf_Read_Power_Level
4119                     	xdef	_Nrf_Set_Power_Level
4120                     	xdef	_Nrf_Power_Down
4121                     	xdef	_Nrf_Power_Up
4122                     	xdef	_Nrf_Flush_Rx
4123                     	xdef	_Nrf_Flush_Tx
4124                     	xdef	_Nrf_Read_Pipe_Data_Width
4125                     	xdef	_Nrf_Set_Pipe_Data_Width
4126                     	xdef	_Nrf_Read_RF_Ch
4127                     	xdef	_Nrf_Set_RF_Ch
4128                     	xdef	_Nrf_Disble_AutoAck
4129                     	xdef	_Nrf_Enable_AutoAck
4130                     	xdef	_Nrf_Disble_Pipe
4131                     	xdef	_Nrf_Enable_Pipe
4132                     	xdef	_Nrf_Read_Rx_Payload
4133                     	xdef	_Nrf_Write_Tx_Payload
4134                     	xdef	_Nrf_Read_Pipe_Addr
4135                     	xdef	_Nrf_Set_Pipe_Addr
4136                     	xdef	_Nrf_Read_Tx_Addr
4137                     	xdef	_Nrf_Read_Addr_Width
4138                     	xdef	_Nrf_Set_Tx_Addr
4139                     	xdef	_Nrf_Write_Buf
4140                     	xdef	_Nrf_Read_Buf
4141                     	xdef	_Nrf_Write_Reg
4142                     	xdef	_Nrf_Read_Reg
4143                     	xdef	_Spi_TxRx
4144                     	xdef	_Nrf_Ce_High
4145                     	xdef	_Nrf_Ce_Low
4146                     	xdef	_Nrf_Csn_High
4147                     	xdef	_Nrf_Csn_Low
4148                     	xdef	_Nrf_Init
4149                     	xref	_Nrf_Gpio_Init
4150                     	xref	_SPI_GetFlagStatus
4151                     	xref	_SPI_ReceiveData
4152                     	xref	_SPI_SendData
4153                     	xref	_SPI_Cmd
4154                     	xref	_SPI_Init
4155                     	xref	_SPI_DeInit
4156                     	xref	_GPIO_WriteLow
4157                     	xref	_GPIO_WriteHigh
4176                     	end
