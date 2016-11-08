   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  44                     ; 44 void SPI_DeInit(void)
  44                     ; 45 {
  46                     	switch	.text
  47  0000               _SPI_DeInit:
  51                     ; 46     SPI->CR1    = SPI_CR1_RESET_VALUE;
  53  0000 725f5200      	clr	20992
  54                     ; 47     SPI->CR2    = SPI_CR2_RESET_VALUE;
  56  0004 725f5201      	clr	20993
  57                     ; 48     SPI->ICR    = SPI_ICR_RESET_VALUE;
  59  0008 725f5202      	clr	20994
  60                     ; 49     SPI->SR     = SPI_SR_RESET_VALUE;
  62  000c 35025203      	mov	20995,#2
  63                     ; 50     SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  65  0010 35075205      	mov	20997,#7
  66                     ; 51 }
  69  0014 81            	ret
 386                     ; 72 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 386                     ; 73 {
 387                     	switch	.text
 388  0015               _SPI_Init:
 390  0015 89            	pushw	x
 391  0016 88            	push	a
 392       00000001      OFST:	set	1
 395                     ; 75     assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 397  0017 9e            	ld	a,xh
 398  0018 4d            	tnz	a
 399  0019 2705          	jreq	L21
 400  001b 9e            	ld	a,xh
 401  001c a180          	cp	a,#128
 402  001e 2603          	jrne	L01
 403  0020               L21:
 404  0020 4f            	clr	a
 405  0021 2010          	jra	L41
 406  0023               L01:
 407  0023 ae004b        	ldw	x,#75
 408  0026 89            	pushw	x
 409  0027 ae0000        	ldw	x,#0
 410  002a 89            	pushw	x
 411  002b ae0000        	ldw	x,#L302
 412  002e cd0000        	call	_assert_failed
 414  0031 5b04          	addw	sp,#4
 415  0033               L41:
 416                     ; 76     assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 418  0033 0d03          	tnz	(OFST+2,sp)
 419  0035 272a          	jreq	L02
 420  0037 7b03          	ld	a,(OFST+2,sp)
 421  0039 a108          	cp	a,#8
 422  003b 2724          	jreq	L02
 423  003d 7b03          	ld	a,(OFST+2,sp)
 424  003f a110          	cp	a,#16
 425  0041 271e          	jreq	L02
 426  0043 7b03          	ld	a,(OFST+2,sp)
 427  0045 a118          	cp	a,#24
 428  0047 2718          	jreq	L02
 429  0049 7b03          	ld	a,(OFST+2,sp)
 430  004b a120          	cp	a,#32
 431  004d 2712          	jreq	L02
 432  004f 7b03          	ld	a,(OFST+2,sp)
 433  0051 a128          	cp	a,#40
 434  0053 270c          	jreq	L02
 435  0055 7b03          	ld	a,(OFST+2,sp)
 436  0057 a130          	cp	a,#48
 437  0059 2706          	jreq	L02
 438  005b 7b03          	ld	a,(OFST+2,sp)
 439  005d a138          	cp	a,#56
 440  005f 2603          	jrne	L61
 441  0061               L02:
 442  0061 4f            	clr	a
 443  0062 2010          	jra	L22
 444  0064               L61:
 445  0064 ae004c        	ldw	x,#76
 446  0067 89            	pushw	x
 447  0068 ae0000        	ldw	x,#0
 448  006b 89            	pushw	x
 449  006c ae0000        	ldw	x,#L302
 450  006f cd0000        	call	_assert_failed
 452  0072 5b04          	addw	sp,#4
 453  0074               L22:
 454                     ; 77     assert_param(IS_SPI_MODE_OK(Mode));
 456  0074 7b06          	ld	a,(OFST+5,sp)
 457  0076 a104          	cp	a,#4
 458  0078 2704          	jreq	L62
 459  007a 0d06          	tnz	(OFST+5,sp)
 460  007c 2603          	jrne	L42
 461  007e               L62:
 462  007e 4f            	clr	a
 463  007f 2010          	jra	L03
 464  0081               L42:
 465  0081 ae004d        	ldw	x,#77
 466  0084 89            	pushw	x
 467  0085 ae0000        	ldw	x,#0
 468  0088 89            	pushw	x
 469  0089 ae0000        	ldw	x,#L302
 470  008c cd0000        	call	_assert_failed
 472  008f 5b04          	addw	sp,#4
 473  0091               L03:
 474                     ; 78     assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 476  0091 0d07          	tnz	(OFST+6,sp)
 477  0093 2706          	jreq	L43
 478  0095 7b07          	ld	a,(OFST+6,sp)
 479  0097 a102          	cp	a,#2
 480  0099 2603          	jrne	L23
 481  009b               L43:
 482  009b 4f            	clr	a
 483  009c 2010          	jra	L63
 484  009e               L23:
 485  009e ae004e        	ldw	x,#78
 486  00a1 89            	pushw	x
 487  00a2 ae0000        	ldw	x,#0
 488  00a5 89            	pushw	x
 489  00a6 ae0000        	ldw	x,#L302
 490  00a9 cd0000        	call	_assert_failed
 492  00ac 5b04          	addw	sp,#4
 493  00ae               L63:
 494                     ; 79     assert_param(IS_SPI_PHASE_OK(ClockPhase));
 496  00ae 0d08          	tnz	(OFST+7,sp)
 497  00b0 2706          	jreq	L24
 498  00b2 7b08          	ld	a,(OFST+7,sp)
 499  00b4 a101          	cp	a,#1
 500  00b6 2603          	jrne	L04
 501  00b8               L24:
 502  00b8 4f            	clr	a
 503  00b9 2010          	jra	L44
 504  00bb               L04:
 505  00bb ae004f        	ldw	x,#79
 506  00be 89            	pushw	x
 507  00bf ae0000        	ldw	x,#0
 508  00c2 89            	pushw	x
 509  00c3 ae0000        	ldw	x,#L302
 510  00c6 cd0000        	call	_assert_failed
 512  00c9 5b04          	addw	sp,#4
 513  00cb               L44:
 514                     ; 80     assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 516  00cb 0d09          	tnz	(OFST+8,sp)
 517  00cd 2712          	jreq	L05
 518  00cf 7b09          	ld	a,(OFST+8,sp)
 519  00d1 a104          	cp	a,#4
 520  00d3 270c          	jreq	L05
 521  00d5 7b09          	ld	a,(OFST+8,sp)
 522  00d7 a180          	cp	a,#128
 523  00d9 2706          	jreq	L05
 524  00db 7b09          	ld	a,(OFST+8,sp)
 525  00dd a1c0          	cp	a,#192
 526  00df 2603          	jrne	L64
 527  00e1               L05:
 528  00e1 4f            	clr	a
 529  00e2 2010          	jra	L25
 530  00e4               L64:
 531  00e4 ae0050        	ldw	x,#80
 532  00e7 89            	pushw	x
 533  00e8 ae0000        	ldw	x,#0
 534  00eb 89            	pushw	x
 535  00ec ae0000        	ldw	x,#L302
 536  00ef cd0000        	call	_assert_failed
 538  00f2 5b04          	addw	sp,#4
 539  00f4               L25:
 540                     ; 81     assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 542  00f4 7b0a          	ld	a,(OFST+9,sp)
 543  00f6 a102          	cp	a,#2
 544  00f8 2704          	jreq	L65
 545  00fa 0d0a          	tnz	(OFST+9,sp)
 546  00fc 2603          	jrne	L45
 547  00fe               L65:
 548  00fe 4f            	clr	a
 549  00ff 2010          	jra	L06
 550  0101               L45:
 551  0101 ae0051        	ldw	x,#81
 552  0104 89            	pushw	x
 553  0105 ae0000        	ldw	x,#0
 554  0108 89            	pushw	x
 555  0109 ae0000        	ldw	x,#L302
 556  010c cd0000        	call	_assert_failed
 558  010f 5b04          	addw	sp,#4
 559  0111               L06:
 560                     ; 82     assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 562  0111 0d0b          	tnz	(OFST+10,sp)
 563  0113 2703          	jreq	L26
 564  0115 4f            	clr	a
 565  0116 2010          	jra	L46
 566  0118               L26:
 567  0118 ae0052        	ldw	x,#82
 568  011b 89            	pushw	x
 569  011c ae0000        	ldw	x,#0
 570  011f 89            	pushw	x
 571  0120 ae0000        	ldw	x,#L302
 572  0123 cd0000        	call	_assert_failed
 574  0126 5b04          	addw	sp,#4
 575  0128               L46:
 576                     ; 85     SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 576                     ; 86                     (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 578  0128 7b07          	ld	a,(OFST+6,sp)
 579  012a 1a08          	or	a,(OFST+7,sp)
 580  012c 6b01          	ld	(OFST+0,sp),a
 581  012e 7b02          	ld	a,(OFST+1,sp)
 582  0130 1a03          	or	a,(OFST+2,sp)
 583  0132 1a01          	or	a,(OFST+0,sp)
 584  0134 c75200        	ld	20992,a
 585                     ; 89     SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 587  0137 7b09          	ld	a,(OFST+8,sp)
 588  0139 1a0a          	or	a,(OFST+9,sp)
 589  013b c75201        	ld	20993,a
 590                     ; 91     if (Mode == SPI_MODE_MASTER)
 592  013e 7b06          	ld	a,(OFST+5,sp)
 593  0140 a104          	cp	a,#4
 594  0142 2606          	jrne	L502
 595                     ; 93         SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 597  0144 72105201      	bset	20993,#0
 599  0148 2004          	jra	L702
 600  014a               L502:
 601                     ; 97         SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 603  014a 72115201      	bres	20993,#0
 604  014e               L702:
 605                     ; 101     SPI->CR1 |= (uint8_t)(Mode);
 607  014e c65200        	ld	a,20992
 608  0151 1a06          	or	a,(OFST+5,sp)
 609  0153 c75200        	ld	20992,a
 610                     ; 104     SPI->CRCPR = (uint8_t)CRCPolynomial;
 612  0156 7b0b          	ld	a,(OFST+10,sp)
 613  0158 c75205        	ld	20997,a
 614                     ; 105 }
 617  015b 5b03          	addw	sp,#3
 618  015d 81            	ret
 674                     ; 113 void SPI_Cmd(FunctionalState NewState)
 674                     ; 114 {
 675                     	switch	.text
 676  015e               _SPI_Cmd:
 678  015e 88            	push	a
 679       00000000      OFST:	set	0
 682                     ; 116     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 684  015f 4d            	tnz	a
 685  0160 2704          	jreq	L27
 686  0162 a101          	cp	a,#1
 687  0164 2603          	jrne	L07
 688  0166               L27:
 689  0166 4f            	clr	a
 690  0167 2010          	jra	L47
 691  0169               L07:
 692  0169 ae0074        	ldw	x,#116
 693  016c 89            	pushw	x
 694  016d ae0000        	ldw	x,#0
 695  0170 89            	pushw	x
 696  0171 ae0000        	ldw	x,#L302
 697  0174 cd0000        	call	_assert_failed
 699  0177 5b04          	addw	sp,#4
 700  0179               L47:
 701                     ; 118     if (NewState != DISABLE)
 703  0179 0d01          	tnz	(OFST+1,sp)
 704  017b 2706          	jreq	L732
 705                     ; 120         SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 707  017d 721c5200      	bset	20992,#6
 709  0181 2004          	jra	L142
 710  0183               L732:
 711                     ; 124         SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 713  0183 721d5200      	bres	20992,#6
 714  0187               L142:
 715                     ; 126 }
 718  0187 84            	pop	a
 719  0188 81            	ret
 829                     ; 135 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 829                     ; 136 {
 830                     	switch	.text
 831  0189               _SPI_ITConfig:
 833  0189 89            	pushw	x
 834  018a 88            	push	a
 835       00000001      OFST:	set	1
 838                     ; 137     uint8_t itpos = 0;
 840                     ; 139     assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 842  018b 9e            	ld	a,xh
 843  018c a117          	cp	a,#23
 844  018e 270f          	jreq	L201
 845  0190 9e            	ld	a,xh
 846  0191 a106          	cp	a,#6
 847  0193 270a          	jreq	L201
 848  0195 9e            	ld	a,xh
 849  0196 a105          	cp	a,#5
 850  0198 2705          	jreq	L201
 851  019a 9e            	ld	a,xh
 852  019b a134          	cp	a,#52
 853  019d 2603          	jrne	L001
 854  019f               L201:
 855  019f 4f            	clr	a
 856  01a0 2010          	jra	L401
 857  01a2               L001:
 858  01a2 ae008b        	ldw	x,#139
 859  01a5 89            	pushw	x
 860  01a6 ae0000        	ldw	x,#0
 861  01a9 89            	pushw	x
 862  01aa ae0000        	ldw	x,#L302
 863  01ad cd0000        	call	_assert_failed
 865  01b0 5b04          	addw	sp,#4
 866  01b2               L401:
 867                     ; 140     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 869  01b2 0d03          	tnz	(OFST+2,sp)
 870  01b4 2706          	jreq	L011
 871  01b6 7b03          	ld	a,(OFST+2,sp)
 872  01b8 a101          	cp	a,#1
 873  01ba 2603          	jrne	L601
 874  01bc               L011:
 875  01bc 4f            	clr	a
 876  01bd 2010          	jra	L211
 877  01bf               L601:
 878  01bf ae008c        	ldw	x,#140
 879  01c2 89            	pushw	x
 880  01c3 ae0000        	ldw	x,#0
 881  01c6 89            	pushw	x
 882  01c7 ae0000        	ldw	x,#L302
 883  01ca cd0000        	call	_assert_failed
 885  01cd 5b04          	addw	sp,#4
 886  01cf               L211:
 887                     ; 143     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 889  01cf 7b02          	ld	a,(OFST+1,sp)
 890  01d1 a40f          	and	a,#15
 891  01d3 5f            	clrw	x
 892  01d4 97            	ld	xl,a
 893  01d5 a601          	ld	a,#1
 894  01d7 5d            	tnzw	x
 895  01d8 2704          	jreq	L411
 896  01da               L611:
 897  01da 48            	sll	a
 898  01db 5a            	decw	x
 899  01dc 26fc          	jrne	L611
 900  01de               L411:
 901  01de 6b01          	ld	(OFST+0,sp),a
 902                     ; 145     if (NewState != DISABLE)
 904  01e0 0d03          	tnz	(OFST+2,sp)
 905  01e2 270a          	jreq	L313
 906                     ; 147         SPI->ICR |= itpos; /* Enable interrupt*/
 908  01e4 c65202        	ld	a,20994
 909  01e7 1a01          	or	a,(OFST+0,sp)
 910  01e9 c75202        	ld	20994,a
 912  01ec 2009          	jra	L513
 913  01ee               L313:
 914                     ; 151         SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 916  01ee 7b01          	ld	a,(OFST+0,sp)
 917  01f0 43            	cpl	a
 918  01f1 c45202        	and	a,20994
 919  01f4 c75202        	ld	20994,a
 920  01f7               L513:
 921                     ; 153 }
 924  01f7 5b03          	addw	sp,#3
 925  01f9 81            	ret
 959                     ; 159 void SPI_SendData(uint8_t Data)
 959                     ; 160 {
 960                     	switch	.text
 961  01fa               _SPI_SendData:
 965                     ; 161     SPI->DR = Data; /* Write in the DR register the data to be sent*/
 967  01fa c75204        	ld	20996,a
 968                     ; 162 }
 971  01fd 81            	ret
 994                     ; 169 uint8_t SPI_ReceiveData(void)
 994                     ; 170 {
 995                     	switch	.text
 996  01fe               _SPI_ReceiveData:
1000                     ; 171     return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
1002  01fe c65204        	ld	a,20996
1005  0201 81            	ret
1042                     ; 180 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
1042                     ; 181 {
1043                     	switch	.text
1044  0202               _SPI_NSSInternalSoftwareCmd:
1046  0202 88            	push	a
1047       00000000      OFST:	set	0
1050                     ; 183     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1052  0203 4d            	tnz	a
1053  0204 2704          	jreq	L031
1054  0206 a101          	cp	a,#1
1055  0208 2603          	jrne	L621
1056  020a               L031:
1057  020a 4f            	clr	a
1058  020b 2010          	jra	L231
1059  020d               L621:
1060  020d ae00b7        	ldw	x,#183
1061  0210 89            	pushw	x
1062  0211 ae0000        	ldw	x,#0
1063  0214 89            	pushw	x
1064  0215 ae0000        	ldw	x,#L302
1065  0218 cd0000        	call	_assert_failed
1067  021b 5b04          	addw	sp,#4
1068  021d               L231:
1069                     ; 185     if (NewState != DISABLE)
1071  021d 0d01          	tnz	(OFST+1,sp)
1072  021f 2706          	jreq	L363
1073                     ; 187         SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
1075  0221 72105201      	bset	20993,#0
1077  0225 2004          	jra	L563
1078  0227               L363:
1079                     ; 191         SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
1081  0227 72115201      	bres	20993,#0
1082  022b               L563:
1083                     ; 193 }
1086  022b 84            	pop	a
1087  022c 81            	ret
1110                     ; 200 void SPI_TransmitCRC(void)
1110                     ; 201 {
1111                     	switch	.text
1112  022d               _SPI_TransmitCRC:
1116                     ; 202     SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
1118  022d 72185201      	bset	20993,#4
1119                     ; 203 }
1122  0231 81            	ret
1159                     ; 211 void SPI_CalculateCRCCmd(FunctionalState NewState)
1159                     ; 212 {
1160                     	switch	.text
1161  0232               _SPI_CalculateCRCCmd:
1163  0232 88            	push	a
1164       00000000      OFST:	set	0
1167                     ; 214     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1169  0233 4d            	tnz	a
1170  0234 2704          	jreq	L241
1171  0236 a101          	cp	a,#1
1172  0238 2603          	jrne	L041
1173  023a               L241:
1174  023a 4f            	clr	a
1175  023b 2010          	jra	L441
1176  023d               L041:
1177  023d ae00d6        	ldw	x,#214
1178  0240 89            	pushw	x
1179  0241 ae0000        	ldw	x,#0
1180  0244 89            	pushw	x
1181  0245 ae0000        	ldw	x,#L302
1182  0248 cd0000        	call	_assert_failed
1184  024b 5b04          	addw	sp,#4
1185  024d               L441:
1186                     ; 216     if (NewState != DISABLE)
1188  024d 0d01          	tnz	(OFST+1,sp)
1189  024f 2706          	jreq	L514
1190                     ; 218         SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1192  0251 721a5201      	bset	20993,#5
1194  0255 2004          	jra	L714
1195  0257               L514:
1196                     ; 222         SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1198  0257 721b5201      	bres	20993,#5
1199  025b               L714:
1200                     ; 224 }
1203  025b 84            	pop	a
1204  025c 81            	ret
1269                     ; 231 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
1269                     ; 232 {
1270                     	switch	.text
1271  025d               _SPI_GetCRC:
1273  025d 88            	push	a
1274  025e 88            	push	a
1275       00000001      OFST:	set	1
1278                     ; 233     uint8_t crcreg = 0;
1280                     ; 236     assert_param(IS_SPI_CRC_OK(SPI_CRC));
1282  025f a101          	cp	a,#1
1283  0261 2703          	jreq	L251
1284  0263 4d            	tnz	a
1285  0264 2603          	jrne	L051
1286  0266               L251:
1287  0266 4f            	clr	a
1288  0267 2010          	jra	L451
1289  0269               L051:
1290  0269 ae00ec        	ldw	x,#236
1291  026c 89            	pushw	x
1292  026d ae0000        	ldw	x,#0
1293  0270 89            	pushw	x
1294  0271 ae0000        	ldw	x,#L302
1295  0274 cd0000        	call	_assert_failed
1297  0277 5b04          	addw	sp,#4
1298  0279               L451:
1299                     ; 238     if (SPI_CRC != SPI_CRC_RX)
1301  0279 0d02          	tnz	(OFST+1,sp)
1302  027b 2707          	jreq	L354
1303                     ; 240         crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1305  027d c65207        	ld	a,20999
1306  0280 6b01          	ld	(OFST+0,sp),a
1308  0282 2005          	jra	L554
1309  0284               L354:
1310                     ; 244         crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1312  0284 c65206        	ld	a,20998
1313  0287 6b01          	ld	(OFST+0,sp),a
1314  0289               L554:
1315                     ; 248     return crcreg;
1317  0289 7b01          	ld	a,(OFST+0,sp)
1320  028b 85            	popw	x
1321  028c 81            	ret
1346                     ; 256 void SPI_ResetCRC(void)
1346                     ; 257 {
1347                     	switch	.text
1348  028d               _SPI_ResetCRC:
1352                     ; 260     SPI_CalculateCRCCmd(ENABLE);
1354  028d a601          	ld	a,#1
1355  028f ada1          	call	_SPI_CalculateCRCCmd
1357                     ; 263     SPI_Cmd(ENABLE);
1359  0291 a601          	ld	a,#1
1360  0293 cd015e        	call	_SPI_Cmd
1362                     ; 264 }
1365  0296 81            	ret
1389                     ; 271 uint8_t SPI_GetCRCPolynomial(void)
1389                     ; 272 {
1390                     	switch	.text
1391  0297               _SPI_GetCRCPolynomial:
1395                     ; 273     return SPI->CRCPR; /* Return the CRC polynomial register */
1397  0297 c65205        	ld	a,20997
1400  029a 81            	ret
1457                     ; 281 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1457                     ; 282 {
1458                     	switch	.text
1459  029b               _SPI_BiDirectionalLineConfig:
1461  029b 88            	push	a
1462       00000000      OFST:	set	0
1465                     ; 284     assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1467  029c 4d            	tnz	a
1468  029d 2704          	jreq	L661
1469  029f a101          	cp	a,#1
1470  02a1 2603          	jrne	L461
1471  02a3               L661:
1472  02a3 4f            	clr	a
1473  02a4 2010          	jra	L071
1474  02a6               L461:
1475  02a6 ae011c        	ldw	x,#284
1476  02a9 89            	pushw	x
1477  02aa ae0000        	ldw	x,#0
1478  02ad 89            	pushw	x
1479  02ae ae0000        	ldw	x,#L302
1480  02b1 cd0000        	call	_assert_failed
1482  02b4 5b04          	addw	sp,#4
1483  02b6               L071:
1484                     ; 286     if (SPI_Direction != SPI_DIRECTION_RX)
1486  02b6 0d01          	tnz	(OFST+1,sp)
1487  02b8 2706          	jreq	L525
1488                     ; 288         SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1490  02ba 721c5201      	bset	20993,#6
1492  02be 2004          	jra	L725
1493  02c0               L525:
1494                     ; 292         SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1496  02c0 721d5201      	bres	20993,#6
1497  02c4               L725:
1498                     ; 294 }
1501  02c4 84            	pop	a
1502  02c5 81            	ret
1624                     ; 304 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1624                     ; 305 {
1625                     	switch	.text
1626  02c6               _SPI_GetFlagStatus:
1628  02c6 88            	push	a
1629  02c7 88            	push	a
1630       00000001      OFST:	set	1
1633                     ; 306     FlagStatus status = RESET;
1635                     ; 308     assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1637  02c8 a140          	cp	a,#64
1638  02ca 2718          	jreq	L671
1639  02cc a120          	cp	a,#32
1640  02ce 2714          	jreq	L671
1641  02d0 a110          	cp	a,#16
1642  02d2 2710          	jreq	L671
1643  02d4 a108          	cp	a,#8
1644  02d6 270c          	jreq	L671
1645  02d8 a102          	cp	a,#2
1646  02da 2708          	jreq	L671
1647  02dc a101          	cp	a,#1
1648  02de 2704          	jreq	L671
1649  02e0 a180          	cp	a,#128
1650  02e2 2603          	jrne	L471
1651  02e4               L671:
1652  02e4 4f            	clr	a
1653  02e5 2010          	jra	L002
1654  02e7               L471:
1655  02e7 ae0134        	ldw	x,#308
1656  02ea 89            	pushw	x
1657  02eb ae0000        	ldw	x,#0
1658  02ee 89            	pushw	x
1659  02ef ae0000        	ldw	x,#L302
1660  02f2 cd0000        	call	_assert_failed
1662  02f5 5b04          	addw	sp,#4
1663  02f7               L002:
1664                     ; 311     if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1666  02f7 c65203        	ld	a,20995
1667  02fa 1502          	bcp	a,(OFST+1,sp)
1668  02fc 2706          	jreq	L506
1669                     ; 313         status = SET; /* SPI_FLAG is set */
1671  02fe a601          	ld	a,#1
1672  0300 6b01          	ld	(OFST+0,sp),a
1674  0302 2002          	jra	L706
1675  0304               L506:
1676                     ; 317         status = RESET; /* SPI_FLAG is reset*/
1678  0304 0f01          	clr	(OFST+0,sp)
1679  0306               L706:
1680                     ; 321     return status;
1682  0306 7b01          	ld	a,(OFST+0,sp)
1685  0308 85            	popw	x
1686  0309 81            	ret
1722                     ; 339 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1722                     ; 340 {
1723                     	switch	.text
1724  030a               _SPI_ClearFlag:
1726  030a 88            	push	a
1727       00000000      OFST:	set	0
1730                     ; 341     assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1732  030b a110          	cp	a,#16
1733  030d 2704          	jreq	L602
1734  030f a108          	cp	a,#8
1735  0311 2603          	jrne	L402
1736  0313               L602:
1737  0313 4f            	clr	a
1738  0314 2010          	jra	L012
1739  0316               L402:
1740  0316 ae0155        	ldw	x,#341
1741  0319 89            	pushw	x
1742  031a ae0000        	ldw	x,#0
1743  031d 89            	pushw	x
1744  031e ae0000        	ldw	x,#L302
1745  0321 cd0000        	call	_assert_failed
1747  0324 5b04          	addw	sp,#4
1748  0326               L012:
1749                     ; 343     SPI->SR = (uint8_t)(~SPI_FLAG);
1751  0326 7b01          	ld	a,(OFST+1,sp)
1752  0328 43            	cpl	a
1753  0329 c75203        	ld	20995,a
1754                     ; 344 }
1757  032c 84            	pop	a
1758  032d 81            	ret
1841                     ; 359 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1841                     ; 360 {
1842                     	switch	.text
1843  032e               _SPI_GetITStatus:
1845  032e 88            	push	a
1846  032f 89            	pushw	x
1847       00000002      OFST:	set	2
1850                     ; 361     ITStatus pendingbitstatus = RESET;
1852                     ; 362     uint8_t itpos = 0;
1854                     ; 363     uint8_t itmask1 = 0;
1856                     ; 364     uint8_t itmask2 = 0;
1858                     ; 365     uint8_t enablestatus = 0;
1860                     ; 366     assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1862  0330 a165          	cp	a,#101
1863  0332 2714          	jreq	L612
1864  0334 a155          	cp	a,#85
1865  0336 2710          	jreq	L612
1866  0338 a145          	cp	a,#69
1867  033a 270c          	jreq	L612
1868  033c a134          	cp	a,#52
1869  033e 2708          	jreq	L612
1870  0340 a117          	cp	a,#23
1871  0342 2704          	jreq	L612
1872  0344 a106          	cp	a,#6
1873  0346 2603          	jrne	L412
1874  0348               L612:
1875  0348 4f            	clr	a
1876  0349 2010          	jra	L022
1877  034b               L412:
1878  034b ae016e        	ldw	x,#366
1879  034e 89            	pushw	x
1880  034f ae0000        	ldw	x,#0
1881  0352 89            	pushw	x
1882  0353 ae0000        	ldw	x,#L302
1883  0356 cd0000        	call	_assert_failed
1885  0359 5b04          	addw	sp,#4
1886  035b               L022:
1887                     ; 368     itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1889  035b 7b03          	ld	a,(OFST+1,sp)
1890  035d a40f          	and	a,#15
1891  035f 5f            	clrw	x
1892  0360 97            	ld	xl,a
1893  0361 a601          	ld	a,#1
1894  0363 5d            	tnzw	x
1895  0364 2704          	jreq	L222
1896  0366               L422:
1897  0366 48            	sll	a
1898  0367 5a            	decw	x
1899  0368 26fc          	jrne	L422
1900  036a               L222:
1901  036a 6b01          	ld	(OFST-1,sp),a
1902                     ; 371     itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1904  036c 7b03          	ld	a,(OFST+1,sp)
1905  036e 4e            	swap	a
1906  036f a40f          	and	a,#15
1907  0371 6b02          	ld	(OFST+0,sp),a
1908                     ; 373     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1910  0373 7b02          	ld	a,(OFST+0,sp)
1911  0375 5f            	clrw	x
1912  0376 97            	ld	xl,a
1913  0377 a601          	ld	a,#1
1914  0379 5d            	tnzw	x
1915  037a 2704          	jreq	L622
1916  037c               L032:
1917  037c 48            	sll	a
1918  037d 5a            	decw	x
1919  037e 26fc          	jrne	L032
1920  0380               L622:
1921  0380 6b02          	ld	(OFST+0,sp),a
1922                     ; 375     enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1924  0382 c65203        	ld	a,20995
1925  0385 1402          	and	a,(OFST+0,sp)
1926  0387 6b02          	ld	(OFST+0,sp),a
1927                     ; 377     if (((SPI->ICR & itpos) != RESET) && enablestatus)
1929  0389 c65202        	ld	a,20994
1930  038c 1501          	bcp	a,(OFST-1,sp)
1931  038e 270a          	jreq	L176
1933  0390 0d02          	tnz	(OFST+0,sp)
1934  0392 2706          	jreq	L176
1935                     ; 380         pendingbitstatus = SET;
1937  0394 a601          	ld	a,#1
1938  0396 6b02          	ld	(OFST+0,sp),a
1940  0398 2002          	jra	L376
1941  039a               L176:
1942                     ; 385         pendingbitstatus = RESET;
1944  039a 0f02          	clr	(OFST+0,sp)
1945  039c               L376:
1946                     ; 388     return  pendingbitstatus;
1948  039c 7b02          	ld	a,(OFST+0,sp)
1951  039e 5b03          	addw	sp,#3
1952  03a0 81            	ret
1998                     ; 404 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1998                     ; 405 {
1999                     	switch	.text
2000  03a1               _SPI_ClearITPendingBit:
2002  03a1 88            	push	a
2003  03a2 88            	push	a
2004       00000001      OFST:	set	1
2007                     ; 406     uint8_t itpos = 0;
2009                     ; 407     assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
2011  03a3 a145          	cp	a,#69
2012  03a5 2704          	jreq	L632
2013  03a7 a134          	cp	a,#52
2014  03a9 2603          	jrne	L432
2015  03ab               L632:
2016  03ab 4f            	clr	a
2017  03ac 2010          	jra	L042
2018  03ae               L432:
2019  03ae ae0197        	ldw	x,#407
2020  03b1 89            	pushw	x
2021  03b2 ae0000        	ldw	x,#0
2022  03b5 89            	pushw	x
2023  03b6 ae0000        	ldw	x,#L302
2024  03b9 cd0000        	call	_assert_failed
2026  03bc 5b04          	addw	sp,#4
2027  03be               L042:
2028                     ; 412     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2030  03be 7b02          	ld	a,(OFST+1,sp)
2031  03c0 a4f0          	and	a,#240
2032  03c2 4e            	swap	a
2033  03c3 a40f          	and	a,#15
2034  03c5 5f            	clrw	x
2035  03c6 97            	ld	xl,a
2036  03c7 a601          	ld	a,#1
2037  03c9 5d            	tnzw	x
2038  03ca 2704          	jreq	L242
2039  03cc               L442:
2040  03cc 48            	sll	a
2041  03cd 5a            	decw	x
2042  03ce 26fc          	jrne	L442
2043  03d0               L242:
2044  03d0 6b01          	ld	(OFST+0,sp),a
2045                     ; 414     SPI->SR = (uint8_t)(~itpos);
2047  03d2 7b01          	ld	a,(OFST+0,sp)
2048  03d4 43            	cpl	a
2049  03d5 c75203        	ld	20995,a
2050                     ; 416 }
2053  03d8 85            	popw	x
2054  03d9 81            	ret
2067                     	xdef	_SPI_ClearITPendingBit
2068                     	xdef	_SPI_GetITStatus
2069                     	xdef	_SPI_ClearFlag
2070                     	xdef	_SPI_GetFlagStatus
2071                     	xdef	_SPI_BiDirectionalLineConfig
2072                     	xdef	_SPI_GetCRCPolynomial
2073                     	xdef	_SPI_ResetCRC
2074                     	xdef	_SPI_GetCRC
2075                     	xdef	_SPI_CalculateCRCCmd
2076                     	xdef	_SPI_TransmitCRC
2077                     	xdef	_SPI_NSSInternalSoftwareCmd
2078                     	xdef	_SPI_ReceiveData
2079                     	xdef	_SPI_SendData
2080                     	xdef	_SPI_ITConfig
2081                     	xdef	_SPI_Cmd
2082                     	xdef	_SPI_Init
2083                     	xdef	_SPI_DeInit
2084                     	xref	_assert_failed
2085                     .const:	section	.text
2086  0000               L302:
2087  0000 2e2e5c73746d  	dc.b	"..\stm8s_stdperiph"
2088  0012 5f6472697665  	dc.b	"_driver\src\stm8s_"
2089  0024 7370692e6300  	dc.b	"spi.c",0
2109                     	end
