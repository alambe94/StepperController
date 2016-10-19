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
  99                     ; 15 void Motot1_Port_Init(void)
  99                     ; 16 {
 100                     	switch	.text
 101  0019               _Motot1_Port_Init:
 105                     ; 17   GPIO_Init(GPIOC, Motor1_A, GPIO_MODE_OUT_PP_LOW_SLOW);
 107  0019 4bc0          	push	#192
 108  001b 4b08          	push	#8
 109  001d ae500a        	ldw	x,#20490
 110  0020 cd0000        	call	_GPIO_Init
 112  0023 85            	popw	x
 113                     ; 18 	GPIO_Init(GPIOC, Motor1_B, GPIO_MODE_OUT_PP_LOW_SLOW);
 115  0024 4bc0          	push	#192
 116  0026 4b10          	push	#16
 117  0028 ae500a        	ldw	x,#20490
 118  002b cd0000        	call	_GPIO_Init
 120  002e 85            	popw	x
 121                     ; 19   GPIO_Init(GPIOC, Motor1_C, GPIO_MODE_OUT_PP_LOW_SLOW);
 123  002f 4bc0          	push	#192
 124  0031 4b20          	push	#32
 125  0033 ae500a        	ldw	x,#20490
 126  0036 cd0000        	call	_GPIO_Init
 128  0039 85            	popw	x
 129                     ; 20   GPIO_Init(GPIOC, Motor1_D, GPIO_MODE_OUT_PP_LOW_SLOW);
 131  003a 4bc0          	push	#192
 132  003c 4b40          	push	#64
 133  003e ae500a        	ldw	x,#20490
 134  0041 cd0000        	call	_GPIO_Init
 136  0044 85            	popw	x
 137                     ; 21 }
 140  0045 81            	ret
 164                     ; 24 void Encoder1_Port_Init(void)
 164                     ; 25 {
 165                     	switch	.text
 166  0046               _Encoder1_Port_Init:
 170                     ; 26   GPIO_Init(GPIOD, ENCODER2_A,      GPIO_MODE_IN_PU_NO_IT);
 172  0046 4b40          	push	#64
 173  0048 4b08          	push	#8
 174  004a ae500f        	ldw	x,#20495
 175  004d cd0000        	call	_GPIO_Init
 177  0050 85            	popw	x
 178                     ; 27 	GPIO_Init(GPIOD, ENCODER2_B,      GPIO_MODE_IN_PU_NO_IT);
 180  0051 4b40          	push	#64
 181  0053 4b10          	push	#16
 182  0055 ae500f        	ldw	x,#20495
 183  0058 cd0000        	call	_GPIO_Init
 185  005b 85            	popw	x
 186                     ; 28   GPIO_Init(GPIOD, ENCODER2_SWITCH, GPIO_MODE_IN_PU_NO_IT);
 188  005c 4b40          	push	#64
 189  005e 4b04          	push	#4
 190  0060 ae500f        	ldw	x,#20495
 191  0063 cd0000        	call	_GPIO_Init
 193  0066 85            	popw	x
 194                     ; 29 }
 197  0067 81            	ret
 222                     ; 33 void Limit_Switch_Port_Init(void)
 222                     ; 34 {
 223                     	switch	.text
 224  0068               _Limit_Switch_Port_Init:
 228                     ; 35   GPIO_Init(GPIOA, LIMIT_SWITCH_A,      GPIO_MODE_IN_PU_NO_IT);
 230  0068 4b40          	push	#64
 231  006a 4b08          	push	#8
 232  006c ae5000        	ldw	x,#20480
 233  006f cd0000        	call	_GPIO_Init
 235  0072 85            	popw	x
 236                     ; 36 	GPIO_Init(GPIOC, LIMIT_SWITCH_B,      GPIO_MODE_IN_PU_NO_IT);
 238  0073 4b40          	push	#64
 239  0075 4b80          	push	#128
 240  0077 ae500a        	ldw	x,#20490
 241  007a cd0000        	call	_GPIO_Init
 243  007d 85            	popw	x
 244                     ; 37 }
 247  007e 81            	ret
 260                     	xdef	_Limit_Switch_Port_Init
 261                     	xdef	_Encoder1_Port_Init
 262                     	xdef	_Motot1_Port_Init
 263                     	xdef	_Port_DeInit_All
 264                     	xref	_GPIO_Init
 265                     	xref	_GPIO_DeInit
 284                     	end
