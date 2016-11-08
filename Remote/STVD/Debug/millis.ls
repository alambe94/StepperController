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
 250                     ; 45 void delay_us(unsigned char n) 
 250                     ; 46 {
 251                     	switch	.text
 252  0046               _delay_us:
 254  0046 88            	push	a
 255       00000000      OFST:	set	0
 258  0047 2004          	jra	L301
 259  0049               L101:
 260                     ; 49 	    _asm("nop");  
 263  0049 9d            nop
 265                     ; 50       _asm("nop");  
 268  004a 9d            nop
 270                     ; 51       _asm("nop");  
 273  004b 9d            nop
 275                     ; 52       _asm("nop");  
 278  004c 9d            nop
 280  004d               L301:
 281                     ; 47 while(n--) 
 283  004d 7b01          	ld	a,(OFST+1,sp)
 284  004f 0a01          	dec	(OFST+1,sp)
 285  0051 4d            	tnz	a
 286  0052 26f5          	jrne	L101
 287                     ; 54 }
 290  0054 84            	pop	a
 291  0055 81            	ret
 317                     ; 60 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23) 
 317                     ; 61 
 317                     ; 62 {   
 319                     	switch	.text
 320  0056               f_TIM4_UPD_OVF_IRQHandler:
 322  0056 8a            	push	cc
 323  0057 84            	pop	a
 324  0058 a4bf          	and	a,#191
 325  005a 88            	push	a
 326  005b 86            	pop	cc
 327  005c 3b0002        	push	c_x+2
 328  005f be00          	ldw	x,c_x
 329  0061 89            	pushw	x
 330  0062 3b0002        	push	c_y+2
 331  0065 be00          	ldw	x,c_y
 332  0067 89            	pushw	x
 335                     ; 64 	current_millis ++;
 337  0068 ae0000        	ldw	x,#_current_millis
 338  006b a601          	ld	a,#1
 339  006d cd0000        	call	c_lgadc
 341                     ; 65 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 343  0070 a601          	ld	a,#1
 344  0072 cd0000        	call	_TIM4_ClearITPendingBit
 346                     ; 66 }
 349  0075 85            	popw	x
 350  0076 bf00          	ldw	c_y,x
 351  0078 320002        	pop	c_y+2
 352  007b 85            	popw	x
 353  007c bf00          	ldw	c_x,x
 354  007e 320002        	pop	c_x+2
 355  0081 80            	iret
 378                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 379                     	xdef	_current_millis
 380                     	xdef	_millis
 381                     	xdef	_delay_us
 382                     	xdef	_delay_ms
 383                     	xdef	_Millis_Init
 384                     	xref	_TIM4_ClearITPendingBit
 385                     	xref	_TIM4_ClearFlag
 386                     	xref	_TIM4_ITConfig
 387                     	xref	_TIM4_Cmd
 388                     	xref	_TIM4_TimeBaseInit
 389                     	xref	_TIM4_DeInit
 390                     	xref	_CLK_HSIPrescalerConfig
 391                     	xref.b	c_x
 392                     	xref.b	c_y
 411                     	xref	c_lgadc
 412                     	xref	c_lcmp
 413                     	xref	c_lsub
 414                     	xref	c_rtol
 415                     	xref	c_ltor
 416                     	end
