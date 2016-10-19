   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  45                     ; 6 void Port_DeInit_All(void)
  45                     ; 7 {
  47                     	switch	.text
  48  0000               _Port_DeInit_All:
  52                     ; 8 	GPIO_DeInit(GPIOA);
  54  0000 ae5000        	ldw	x,#20480
  55  0003 cd0000        	call	_GPIO_DeInit
  57                     ; 9 	GPIO_DeInit(GPIOB);
  59  0006 ae5005        	ldw	x,#20485
  60  0009 cd0000        	call	_GPIO_DeInit
  62                     ; 10 	GPIO_DeInit(GPIOC);
  64  000c ae500a        	ldw	x,#20490
  65  000f cd0000        	call	_GPIO_DeInit
  67                     ; 11 	GPIO_DeInit(GPIOD);
  69  0012 ae500f        	ldw	x,#20495
  70  0015 cd0000        	call	_GPIO_DeInit
  72                     ; 12 }
  75  0018 81            	ret
  99                     ; 15 void Motot3_Port_Init(void)
  99                     ; 16 {
 100                     	switch	.text
 101  0019               _Motot3_Port_Init:
 105                     ; 17   GPIO_Init(GPIOC, MOTOR3_EN,  GPIO_MODE_OUT_PP_HIGH_SLOW);
 107  0019 4bd0          	push	#208
 108  001b 4b08          	push	#8
 109  001d ae500a        	ldw	x,#20490
 110  0020 cd0000        	call	_GPIO_Init
 112  0023 85            	popw	x
 113                     ; 18 	GPIO_Init(GPIOC, MOTOR3_MS1, GPIO_MODE_OUT_PP_LOW_SLOW);
 115  0024 4bc0          	push	#192
 116  0026 4b10          	push	#16
 117  0028 ae500a        	ldw	x,#20490
 118  002b cd0000        	call	_GPIO_Init
 120  002e 85            	popw	x
 121                     ; 19   GPIO_Init(GPIOC, MOTOR3_MS2, GPIO_MODE_OUT_PP_LOW_SLOW);
 123  002f 4bc0          	push	#192
 124  0031 4b20          	push	#32
 125  0033 ae500a        	ldw	x,#20490
 126  0036 cd0000        	call	_GPIO_Init
 128  0039 85            	popw	x
 129                     ; 20   GPIO_Init(GPIOC, MOTOR3_MS3, GPIO_MODE_OUT_PP_LOW_SLOW);
 131  003a 4bc0          	push	#192
 132  003c 4b40          	push	#64
 133  003e ae500a        	ldw	x,#20490
 134  0041 cd0000        	call	_GPIO_Init
 136  0044 85            	popw	x
 137                     ; 21 	GPIO_Init(GPIOC, MOTOR3_STP, GPIO_MODE_OUT_PP_LOW_SLOW);
 139  0045 4bc0          	push	#192
 140  0047 4b80          	push	#128
 141  0049 ae500a        	ldw	x,#20490
 142  004c cd0000        	call	_GPIO_Init
 144  004f 85            	popw	x
 145                     ; 23 	GPIO_Init(GPIOD, MOTOR3_DIR, GPIO_MODE_OUT_PP_LOW_SLOW); //PD2
 147  0050 4bc0          	push	#192
 148  0052 4b04          	push	#4
 149  0054 ae500f        	ldw	x,#20495
 150  0057 cd0000        	call	_GPIO_Init
 152  005a 85            	popw	x
 153                     ; 25 }
 156  005b 81            	ret
 180                     ; 28 void Encoder3_Port_Init(void)
 180                     ; 29 {
 181                     	switch	.text
 182  005c               _Encoder3_Port_Init:
 186                     ; 30   GPIO_Init(GPIOD, ENCODER3_A,      GPIO_MODE_IN_PU_NO_IT);
 188  005c 4b40          	push	#64
 189  005e 4b08          	push	#8
 190  0060 ae500f        	ldw	x,#20495
 191  0063 cd0000        	call	_GPIO_Init
 193  0066 85            	popw	x
 194                     ; 31 	GPIO_Init(GPIOD, ENCODER3_B,      GPIO_MODE_IN_PU_NO_IT);
 196  0067 4b40          	push	#64
 197  0069 4b10          	push	#16
 198  006b ae500f        	ldw	x,#20495
 199  006e cd0000        	call	_GPIO_Init
 201  0071 85            	popw	x
 202                     ; 32   GPIO_Init(GPIOD, ENCODER3_SWITCH, GPIO_MODE_IN_PU_NO_IT);
 204  0072 4b40          	push	#64
 205  0074 4b20          	push	#32
 206  0076 ae500f        	ldw	x,#20495
 207  0079 cd0000        	call	_GPIO_Init
 209  007c 85            	popw	x
 210                     ; 33 }
 213  007d 81            	ret
 238                     ; 37 void Limit_Switch_Port_Init(void)
 238                     ; 38 {
 239                     	switch	.text
 240  007e               _Limit_Switch_Port_Init:
 244                     ; 39   GPIO_Init(GPIOA, LIMIT_SWITCH_A,      GPIO_MODE_IN_PU_NO_IT);
 246  007e 4b40          	push	#64
 247  0080 4b08          	push	#8
 248  0082 ae5000        	ldw	x,#20480
 249  0085 cd0000        	call	_GPIO_Init
 251  0088 85            	popw	x
 252                     ; 40 	GPIO_Init(GPIOD, LIMIT_SWITCH_B,      GPIO_MODE_IN_PU_NO_IT);
 254  0089 4b40          	push	#64
 255  008b 4b40          	push	#64
 256  008d ae500f        	ldw	x,#20495
 257  0090 cd0000        	call	_GPIO_Init
 259  0093 85            	popw	x
 260                     ; 41 }
 263  0094 81            	ret
 276                     	xdef	_Limit_Switch_Port_Init
 277                     	xdef	_Encoder3_Port_Init
 278                     	xdef	_Motot3_Port_Init
 279                     	xdef	_Port_DeInit_All
 280                     	xref	_GPIO_Init
 281                     	xref	_GPIO_DeInit
 300                     	end
