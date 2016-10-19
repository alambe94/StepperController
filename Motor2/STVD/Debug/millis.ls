   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  16                     	bsct
  17  0000               _current_millis:
  18  0000 00000000      	dc.l	0
  54                     ; 11 void Millis_init(void)
  54                     ; 12 {
  56                     	switch	.text
  57  0000               _Millis_init:
  61                     ; 13 	TIM4_DeInit();
  63  0000 cd0000        	call	_TIM4_DeInit
  65                     ; 15   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); //f_master = HSI = 16Mhz
  67  0003 4f            	clr	a
  68  0004 cd0000        	call	_CLK_HSIPrescalerConfig
  70                     ; 17 	TIM4_TimeBaseInit(TIM4_PRESCALER_128, TIM4_PERIOD);
  72  0007 ae077c        	ldw	x,#1916
  73  000a cd0000        	call	_TIM4_TimeBaseInit
  75                     ; 19 	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
  77  000d a601          	ld	a,#1
  78  000f cd0000        	call	_TIM4_ClearFlag
  80                     ; 21   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
  82  0012 ae0101        	ldw	x,#257
  83  0015 cd0000        	call	_TIM4_ITConfig
  85                     ; 23 	enableInterrupts();
  88  0018 9a            rim
  90                     ; 25 	TIM4_Cmd(ENABLE);
  93  0019 a601          	ld	a,#1
  94  001b cd0000        	call	_TIM4_Cmd
  96                     ; 26 }
  99  001e 81            	ret
 123                     ; 30 uint32_t millis(void)
 123                     ; 31 
 123                     ; 32 {
 124                     	switch	.text
 125  001f               _millis:
 129                     ; 33 	return current_millis;
 131  001f ae0000        	ldw	x,#_current_millis
 132  0022 cd0000        	call	c_ltor
 136  0025 81            	ret
 162                     ; 39 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23) 
 162                     ; 40 
 162                     ; 41 {   
 164                     	switch	.text
 165  0026               f_TIM4_UPD_OVF_IRQHandler:
 167  0026 8a            	push	cc
 168  0027 84            	pop	a
 169  0028 a4bf          	and	a,#191
 170  002a 88            	push	a
 171  002b 86            	pop	cc
 172  002c 3b0002        	push	c_x+2
 173  002f be00          	ldw	x,c_x
 174  0031 89            	pushw	x
 175  0032 3b0002        	push	c_y+2
 176  0035 be00          	ldw	x,c_y
 177  0037 89            	pushw	x
 180                     ; 43 	current_millis ++;
 182  0038 ae0000        	ldw	x,#_current_millis
 183  003b a601          	ld	a,#1
 184  003d cd0000        	call	c_lgadc
 186                     ; 44 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 188  0040 a601          	ld	a,#1
 189  0042 cd0000        	call	_TIM4_ClearITPendingBit
 191                     ; 45 }
 194  0045 85            	popw	x
 195  0046 bf00          	ldw	c_y,x
 196  0048 320002        	pop	c_y+2
 197  004b 85            	popw	x
 198  004c bf00          	ldw	c_x,x
 199  004e 320002        	pop	c_x+2
 200  0051 80            	iret
 223                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 224                     	xdef	_current_millis
 225                     	xdef	_millis
 226                     	xdef	_Millis_init
 227                     	xref	_TIM4_ClearITPendingBit
 228                     	xref	_TIM4_ClearFlag
 229                     	xref	_TIM4_ITConfig
 230                     	xref	_TIM4_Cmd
 231                     	xref	_TIM4_TimeBaseInit
 232                     	xref	_TIM4_DeInit
 233                     	xref	_CLK_HSIPrescalerConfig
 234                     	xref.b	c_x
 235                     	xref.b	c_y
 254                     	xref	c_lgadc
 255                     	xref	c_ltor
 256                     	end
