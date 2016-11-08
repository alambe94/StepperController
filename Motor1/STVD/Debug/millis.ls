   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  16                     	bsct
  17  0000               _current_millis:
  18  0000 00000000      	dc.l	0
  54                     ; 11 void Millis_Init(void)
  54                     ; 12 {
  56                     	switch	.text
  57  0000               _Millis_Init:
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
 180                     ; 36 void delay_ms(uint32_t time)
 180                     ; 37 {
 181                     	switch	.text
 182  0026               _delay_ms:
 184  0026 5204          	subw	sp,#4
 185       00000004      OFST:	set	4
 188                     ; 39 	temp =millis();
 190  0028 adf5          	call	_millis
 192  002a 96            	ldw	x,sp
 193  002b 1c0001        	addw	x,#OFST-3
 194  002e cd0000        	call	c_rtol
 197  0031               L75:
 198                     ; 40 	while(millis()-temp<time);
 200  0031 adec          	call	_millis
 202  0033 96            	ldw	x,sp
 203  0034 1c0001        	addw	x,#OFST-3
 204  0037 cd0000        	call	c_lsub
 206  003a 96            	ldw	x,sp
 207  003b 1c0007        	addw	x,#OFST+3
 208  003e cd0000        	call	c_lcmp
 210  0041 25ee          	jrult	L75
 211                     ; 42 }
 214  0043 5b04          	addw	sp,#4
 215  0045 81            	ret
 241                     ; 48 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23) 
 241                     ; 49 
 241                     ; 50 {   
 243                     	switch	.text
 244  0046               f_TIM4_UPD_OVF_IRQHandler:
 246  0046 8a            	push	cc
 247  0047 84            	pop	a
 248  0048 a4bf          	and	a,#191
 249  004a 88            	push	a
 250  004b 86            	pop	cc
 251  004c 3b0002        	push	c_x+2
 252  004f be00          	ldw	x,c_x
 253  0051 89            	pushw	x
 254  0052 3b0002        	push	c_y+2
 255  0055 be00          	ldw	x,c_y
 256  0057 89            	pushw	x
 259                     ; 52 	current_millis ++;
 261  0058 ae0000        	ldw	x,#_current_millis
 262  005b a601          	ld	a,#1
 263  005d cd0000        	call	c_lgadc
 265                     ; 53 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 267  0060 a601          	ld	a,#1
 268  0062 cd0000        	call	_TIM4_ClearITPendingBit
 270                     ; 54 }
 273  0065 85            	popw	x
 274  0066 bf00          	ldw	c_y,x
 275  0068 320002        	pop	c_y+2
 276  006b 85            	popw	x
 277  006c bf00          	ldw	c_x,x
 278  006e 320002        	pop	c_x+2
 279  0071 80            	iret
 302                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 303                     	xdef	_current_millis
 304                     	xdef	_millis
 305                     	xdef	_delay_ms
 306                     	xdef	_Millis_Init
 307                     	xref	_TIM4_ClearITPendingBit
 308                     	xref	_TIM4_ClearFlag
 309                     	xref	_TIM4_ITConfig
 310                     	xref	_TIM4_Cmd
 311                     	xref	_TIM4_TimeBaseInit
 312                     	xref	_TIM4_DeInit
 313                     	xref	_CLK_HSIPrescalerConfig
 314                     	xref.b	c_x
 315                     	xref.b	c_y
 334                     	xref	c_lgadc
 335                     	xref	c_lcmp
 336                     	xref	c_lsub
 337                     	xref	c_rtol
 338                     	xref	c_ltor
 339                     	end
