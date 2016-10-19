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
  99                     ; 15 void Motot2_Port_Init(void)
  99                     ; 16 {
 100                     	switch	.text
 101  0019               _Motot2_Port_Init:
 105                     ; 17   GPIO_Init(GPIOC, MOTOR2_A, GPIO_MODE_OUT_PP_LOW_SLOW);
 107  0019 4bc0          	push	#192
 108  001b 4b08          	push	#8
 109  001d ae500a        	ldw	x,#20490
 110  0020 cd0000        	call	_GPIO_Init
 112  0023 85            	popw	x
 113                     ; 18 	GPIO_Init(GPIOC, MOTOR2_B, GPIO_MODE_OUT_PP_LOW_SLOW);
 115  0024 4bc0          	push	#192
 116  0026 4b10          	push	#16
 117  0028 ae500a        	ldw	x,#20490
 118  002b cd0000        	call	_GPIO_Init
 120  002e 85            	popw	x
 121                     ; 19   GPIO_Init(GPIOC, MOTOR2_C, GPIO_MODE_OUT_PP_LOW_SLOW);
 123  002f 4bc0          	push	#192
 124  0031 4b20          	push	#32
 125  0033 ae500a        	ldw	x,#20490
 126  0036 cd0000        	call	_GPIO_Init
 128  0039 85            	popw	x
 129                     ; 20   GPIO_Init(GPIOC, MOTOR2_D, GPIO_MODE_OUT_PP_LOW_SLOW);
 131  003a 4bc0          	push	#192
 132  003c 4b40          	push	#64
 133  003e ae500a        	ldw	x,#20490
 134  0041 cd0000        	call	_GPIO_Init
 136  0044 85            	popw	x
 137                     ; 21 }
 140  0045 81            	ret
 164                     ; 24 void Encoder2_Port_Init(void)
 164                     ; 25 {
 165                     	switch	.text
 166  0046               _Encoder2_Port_Init:
 170                     ; 26   GPIO_Init(GPIOD, ENCODER2_A,      GPIO_MODE_IN_PU_NO_IT);
 172  0046 4b40          	push	#64
 173  0048 4b04          	push	#4
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
 189  005e 4b40          	push	#64
 190  0060 ae500f        	ldw	x,#20495
 191  0063 cd0000        	call	_GPIO_Init
 193  0066 85            	popw	x
 194                     ; 29 }
 197  0067 81            	ret
 221                     ; 32 void Encoder4_Port_Init(void)
 221                     ; 33 {
 222                     	switch	.text
 223  0068               _Encoder4_Port_Init:
 227                     ; 34   GPIO_Init(GPIOD, ENCODER4_A,      GPIO_MODE_IN_PU_NO_IT);
 229  0068 4b40          	push	#64
 230  006a 4b08          	push	#8
 231  006c ae500f        	ldw	x,#20495
 232  006f cd0000        	call	_GPIO_Init
 234  0072 85            	popw	x
 235                     ; 35 	GPIO_Init(GPIOC, ENCODER4_B,      GPIO_MODE_IN_PU_NO_IT);
 237  0073 4b40          	push	#64
 238  0075 4b80          	push	#128
 239  0077 ae500a        	ldw	x,#20490
 240  007a cd0000        	call	_GPIO_Init
 242  007d 85            	popw	x
 243                     ; 36   GPIO_Init(GPIOD, ENCODER4_SWITCH, GPIO_MODE_IN_PU_NO_IT);
 245  007e 4b40          	push	#64
 246  0080 4b20          	push	#32
 247  0082 ae500f        	ldw	x,#20495
 248  0085 cd0000        	call	_GPIO_Init
 250  0088 85            	popw	x
 251                     ; 37 }
 254  0089 81            	ret
 278                     ; 40 void Led_Pwm_Port_Init(void)
 278                     ; 41 {
 279                     	switch	.text
 280  008a               _Led_Pwm_Port_Init:
 284                     ; 42   GPIO_Init(GPIOA, LED_PWM,      GPIO_MODE_OUT_PP_HIGH_SLOW);
 286  008a 4bd0          	push	#208
 287  008c 4b08          	push	#8
 288  008e ae5000        	ldw	x,#20480
 289  0091 cd0000        	call	_GPIO_Init
 291  0094 85            	popw	x
 292                     ; 43 }
 295  0095 81            	ret
 320                     ; 46 void Limit_Switch_Port_Init(void)
 320                     ; 47 {
 321                     	switch	.text
 322  0096               _Limit_Switch_Port_Init:
 326                     ; 48   GPIO_Init(GPIOA, LIMIT_SWITCH_A,      GPIO_MODE_IN_PU_NO_IT);
 328  0096 4b40          	push	#64
 329  0098 4b02          	push	#2
 330  009a ae5000        	ldw	x,#20480
 331  009d cd0000        	call	_GPIO_Init
 333  00a0 85            	popw	x
 334                     ; 49 	GPIO_Init(GPIOA, LIMIT_SWITCH_B,      GPIO_MODE_IN_PU_NO_IT);
 336  00a1 4b40          	push	#64
 337  00a3 4b04          	push	#4
 338  00a5 ae5000        	ldw	x,#20480
 339  00a8 cd0000        	call	_GPIO_Init
 341  00ab 85            	popw	x
 342                     ; 50 }
 345  00ac 81            	ret
 358                     	xdef	_Limit_Switch_Port_Init
 359                     	xdef	_Led_Pwm_Port_Init
 360                     	xdef	_Encoder4_Port_Init
 361                     	xdef	_Encoder2_Port_Init
 362                     	xdef	_Motot2_Port_Init
 363                     	xdef	_Port_DeInit_All
 364                     	xref	_GPIO_Init
 365                     	xref	_GPIO_DeInit
 384                     	end
