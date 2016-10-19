   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  16                     	bsct
  17  0000               _CCR3_Val:
  18  0000 0000          	dc.w	0
  53                     ; 11 void Led_Pwm_init(void)
  53                     ; 12 {
  55                     	switch	.text
  56  0000               _Led_Pwm_init:
  60                     ; 13   TIM2_TimeBaseInit(TIM2_PRESCALER_1, 79);
  62  0000 ae004f        	ldw	x,#79
  63  0003 89            	pushw	x
  64  0004 4f            	clr	a
  65  0005 cd0000        	call	_TIM2_TimeBaseInit
  67  0008 85            	popw	x
  68                     ; 15   TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,CCR3_Val, TIM2_OCPOLARITY_LOW);
  70  0009 4b22          	push	#34
  71  000b be00          	ldw	x,_CCR3_Val
  72  000d 89            	pushw	x
  73  000e ae6011        	ldw	x,#24593
  74  0011 cd0000        	call	_TIM2_OC3Init
  76  0014 5b03          	addw	sp,#3
  77                     ; 16   TIM2_OC3PreloadConfig(ENABLE);
  79  0016 a601          	ld	a,#1
  80  0018 cd0000        	call	_TIM2_OC3PreloadConfig
  82                     ; 18   TIM2_ARRPreloadConfig(ENABLE);
  84  001b a601          	ld	a,#1
  85  001d cd0000        	call	_TIM2_ARRPreloadConfig
  87                     ; 20   TIM2_Cmd(ENABLE);
  89  0020 a601          	ld	a,#1
  90  0022 cd0000        	call	_TIM2_Cmd
  92                     ; 21 }
  95  0025 81            	ret
 129                     ; 25 void Set_Led_Pwm(uint16_t val)
 129                     ; 26 {
 130                     	switch	.text
 131  0026               _Set_Led_Pwm:
 135                     ; 28     TIM2->CCR3H = (uint8_t)(val >> 8);
 137  0026 9e            	ld	a,xh
 138  0027 c75315        	ld	21269,a
 139                     ; 29     TIM2->CCR3L = (uint8_t)(val);
 141  002a 9f            	ld	a,xl
 142  002b c75316        	ld	21270,a
 143                     ; 30 }
 146  002e 81            	ret
 170                     	xdef	_CCR3_Val
 171                     	xdef	_Set_Led_Pwm
 172                     	xdef	_Led_Pwm_init
 173                     	xref	_TIM2_OC3PreloadConfig
 174                     	xref	_TIM2_ARRPreloadConfig
 175                     	xref	_TIM2_Cmd
 176                     	xref	_TIM2_OC3Init
 177                     	xref	_TIM2_TimeBaseInit
 196                     	end
