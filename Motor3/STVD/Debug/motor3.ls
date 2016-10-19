   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  16                     	bsct
  17  0000               _Sequence:
  18  0000 00            	dc.b	0
  19  0001               _SpeedDelay:
  20  0001 02            	dc.b	2
  21  0002               _SpeedTimeKeep:
  22  0002 00000000      	dc.l	0
  23  0006               _MotorDirection:
  24  0006 01            	dc.b	1
  77                     ; 14 void Motor3MoveCCW(uint8_t val)
  77                     ; 15 {	
  79                     	switch	.text
  80  0000               _Motor3MoveCCW:
  82  0000 88            	push	a
  83  0001 88            	push	a
  84       00000001      OFST:	set	1
  87                     ; 16 	uint8_t i=0;
  89                     ; 17   MotorDirection = CounterClockWise;
  91  0002 3f06          	clr	_MotorDirection
  92                     ; 18 	GPIO_WriteLow(GPIOD, MOTOR3_DIR);
  94  0004 4b04          	push	#4
  95  0006 ae500f        	ldw	x,#20495
  96  0009 cd0000        	call	_GPIO_WriteLow
  98  000c 84            	pop	a
  99                     ; 19 	for(i=0;i<val;i++)
 101  000d 0f01          	clr	(OFST+0,sp)
 103  000f 2004          	jra	L73
 104  0011               L33:
 105                     ; 21 	Motor3Move();
 107  0011 ad40          	call	_Motor3Move
 109                     ; 19 	for(i=0;i<val;i++)
 111  0013 0c01          	inc	(OFST+0,sp)
 112  0015               L73:
 115  0015 7b01          	ld	a,(OFST+0,sp)
 116  0017 1102          	cp	a,(OFST+1,sp)
 117  0019 25f6          	jrult	L33
 118                     ; 23 	Motor3Stop();
 120  001b ad23          	call	_Motor3Stop
 122                     ; 24 }
 125  001d 85            	popw	x
 126  001e 81            	ret
 173                     ; 26 void Motor3MoveCW(uint8_t val)
 173                     ; 27 {	
 174                     	switch	.text
 175  001f               _Motor3MoveCW:
 177  001f 88            	push	a
 178  0020 88            	push	a
 179       00000001      OFST:	set	1
 182                     ; 28   uint8_t i=0;
 184                     ; 29   MotorDirection = ClockWise;
 186  0021 35010006      	mov	_MotorDirection,#1
 187                     ; 30 	GPIO_WriteHigh(GPIOD, MOTOR3_DIR);
 189  0025 4b04          	push	#4
 190  0027 ae500f        	ldw	x,#20495
 191  002a cd0000        	call	_GPIO_WriteHigh
 193  002d 84            	pop	a
 194                     ; 31 	for(i=0;i<val;i++)
 196  002e 0f01          	clr	(OFST+0,sp)
 198  0030 2004          	jra	L17
 199  0032               L56:
 200                     ; 33 	Motor3Move();
 202  0032 ad1f          	call	_Motor3Move
 204                     ; 31 	for(i=0;i<val;i++)
 206  0034 0c01          	inc	(OFST+0,sp)
 207  0036               L17:
 210  0036 7b01          	ld	a,(OFST+0,sp)
 211  0038 1102          	cp	a,(OFST+1,sp)
 212  003a 25f6          	jrult	L56
 213                     ; 35 	Motor3Stop();
 215  003c ad02          	call	_Motor3Stop
 217                     ; 36 }
 220  003e 85            	popw	x
 221  003f 81            	ret
 246                     ; 38 void Motor3Stop(void)
 246                     ; 39 {
 247                     	switch	.text
 248  0040               _Motor3Stop:
 252                     ; 40 		GPIO_WriteLow(MOTOR3_PORT, MOTOR3_STP);
 254  0040 4b80          	push	#128
 255  0042 ae500a        	ldw	x,#20490
 256  0045 cd0000        	call	_GPIO_WriteLow
 258  0048 84            	pop	a
 259                     ; 41 		GPIO_WriteHigh(MOTOR3_PORT, MOTOR3_EN);
 261  0049 4b08          	push	#8
 262  004b ae500a        	ldw	x,#20490
 263  004e cd0000        	call	_GPIO_WriteHigh
 265  0051 84            	pop	a
 266                     ; 42 }
 269  0052 81            	ret
 296                     ; 44 void Motor3Move(void) {
 297                     	switch	.text
 298  0053               _Motor3Move:
 302                     ; 46 	GPIO_WriteLow(MOTOR3_PORT, MOTOR3_EN);
 304  0053 4b08          	push	#8
 305  0055 ae500a        	ldw	x,#20490
 306  0058 cd0000        	call	_GPIO_WriteLow
 308  005b 84            	pop	a
 309                     ; 47 	GPIO_WriteHigh(MOTOR3_PORT, MOTOR3_STP);
 311  005c 4b80          	push	#128
 312  005e ae500a        	ldw	x,#20490
 313  0061 cd0000        	call	_GPIO_WriteHigh
 315  0064 84            	pop	a
 316                     ; 48 	SpeedTimeKeep = millis();
 318  0065 cd0000        	call	_millis
 320  0068 ae0002        	ldw	x,#_SpeedTimeKeep
 321  006b cd0000        	call	c_rtol
 324  006e               L121:
 325                     ; 49 	while (millis() - SpeedTimeKeep < (1));
 327  006e cd0000        	call	_millis
 329  0071 ae0002        	ldw	x,#_SpeedTimeKeep
 330  0074 cd0000        	call	c_lsub
 332  0077 cd0000        	call	c_lrzmp
 334  007a 27f2          	jreq	L121
 335                     ; 50 	GPIO_WriteLow(MOTOR3_PORT, MOTOR3_STP);
 337  007c 4b80          	push	#128
 338  007e ae500a        	ldw	x,#20490
 339  0081 cd0000        	call	_GPIO_WriteLow
 341  0084 84            	pop	a
 342                     ; 51 	SpeedTimeKeep = millis();
 344  0085 cd0000        	call	_millis
 346  0088 ae0002        	ldw	x,#_SpeedTimeKeep
 347  008b cd0000        	call	c_rtol
 350  008e               L131:
 351                     ; 52 	while (millis() - SpeedTimeKeep < (1));
 353  008e cd0000        	call	_millis
 355  0091 ae0002        	ldw	x,#_SpeedTimeKeep
 356  0094 cd0000        	call	c_lsub
 358  0097 cd0000        	call	c_lrzmp
 360  009a 27f2          	jreq	L131
 361                     ; 53 	GPIO_WriteHigh(MOTOR3_PORT, MOTOR3_EN);
 363  009c 4b08          	push	#8
 364  009e ae500a        	ldw	x,#20490
 365  00a1 cd0000        	call	_GPIO_WriteHigh
 367  00a4 84            	pop	a
 368                     ; 56 }
 371  00a5 81            	ret
 422                     	xdef	_MotorDirection
 423                     	xdef	_SpeedTimeKeep
 424                     	xdef	_SpeedDelay
 425                     	xdef	_Sequence
 426                     	xdef	_Motor3Stop
 427                     	xdef	_Motor3MoveCW
 428                     	xdef	_Motor3MoveCCW
 429                     	xdef	_Motor3Move
 430                     	xref	_millis
 431                     	xref	_GPIO_WriteLow
 432                     	xref	_GPIO_WriteHigh
 451                     	xref	c_lrzmp
 452                     	xref	c_lsub
 453                     	xref	c_rtol
 454                     	end
