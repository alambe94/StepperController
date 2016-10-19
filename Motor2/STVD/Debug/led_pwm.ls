   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  16                     	bsct
  17  0000               _CCR3_Val:
  18  0000 0000          	dc.w	0
  54                     ; 11 void Led_Pwm_init(void)
  54                     ; 12 {
  56                     	switch	.text
  57  0000               _Led_Pwm_init:
  61                     ; 13 	TIM2_DeInit();
  63  0000 cd0000        	call	_TIM2_DeInit
  65                     ; 15   TIM2_TimeBaseInit(TIM2_PRESCALER_1, 79);
  67  0003 ae004f        	ldw	x,#79
  68  0006 89            	pushw	x
  69  0007 4f            	clr	a
  70  0008 cd0000        	call	_TIM2_TimeBaseInit
  72  000b 85            	popw	x
  73                     ; 17   TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,CCR3_Val, TIM2_OCPOLARITY_LOW);
  75  000c 4b22          	push	#34
  76  000e be00          	ldw	x,_CCR3_Val
  77  0010 89            	pushw	x
  78  0011 ae6011        	ldw	x,#24593
  79  0014 cd0000        	call	_TIM2_OC3Init
  81  0017 5b03          	addw	sp,#3
  82                     ; 18   TIM2_OC3PreloadConfig(ENABLE);
  84  0019 a601          	ld	a,#1
  85  001b cd0000        	call	_TIM2_OC3PreloadConfig
  87                     ; 20   TIM2_ARRPreloadConfig(ENABLE);
  89  001e a601          	ld	a,#1
  90  0020 cd0000        	call	_TIM2_ARRPreloadConfig
  92                     ; 22   TIM2_Cmd(ENABLE);
  94  0023 a601          	ld	a,#1
  95  0025 cd0000        	call	_TIM2_Cmd
  97                     ; 23 }
 100  0028 81            	ret
 134                     ; 26 void Set_Led_Pwm(uint16_t val)
 134                     ; 27 {
 135                     	switch	.text
 136  0029               _Set_Led_Pwm:
 140                     ; 29     TIM2->CCR3H = (uint8_t)(val >> 8);
 142  0029 9e            	ld	a,xh
 143  002a c75315        	ld	21269,a
 144                     ; 30     TIM2->CCR3L = (uint8_t)(val);
 146  002d 9f            	ld	a,xl
 147  002e c75316        	ld	21270,a
 148                     ; 31 }
 151  0031 81            	ret
 175                     	xdef	_CCR3_Val
 176                     	xdef	_Set_Led_Pwm
 177                     	xdef	_Led_Pwm_init
 178                     	xref	_TIM2_OC3PreloadConfig
 179                     	xref	_TIM2_ARRPreloadConfig
 180                     	xref	_TIM2_Cmd
 181                     	xref	_TIM2_OC3Init
 182                     	xref	_TIM2_TimeBaseInit
 183                     	xref	_TIM2_DeInit
 202                     	end
