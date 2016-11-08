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
  99                     ; 14 void Nrf_Gpio_Init(void)
  99                     ; 15 {
 100                     	switch	.text
 101  0019               _Nrf_Gpio_Init:
 105                     ; 16 		GPIO_Init(NRF_PORT,  (SCK_PIN ), GPIO_MODE_OUT_PP_HIGH_FAST);//sck
 107  0019 4bf0          	push	#240
 108  001b 4b20          	push	#32
 109  001d ae500a        	ldw	x,#20490
 110  0020 cd0000        	call	_GPIO_Init
 112  0023 85            	popw	x
 113                     ; 17     GPIO_Init(NRF_PORT,  (MOSI_PIN), GPIO_MODE_OUT_PP_HIGH_FAST);//MOSI
 115  0024 4bf0          	push	#240
 116  0026 4b40          	push	#64
 117  0028 ae500a        	ldw	x,#20490
 118  002b cd0000        	call	_GPIO_Init
 120  002e 85            	popw	x
 121                     ; 18     GPIO_Init(NRF_PORT,  (MISO_PIN), GPIO_MODE_IN_FL_NO_IT);//MISO
 123  002f 4b00          	push	#0
 124  0031 4b80          	push	#128
 125  0033 ae500a        	ldw	x,#20490
 126  0036 cd0000        	call	_GPIO_Init
 128  0039 85            	popw	x
 129                     ; 20     GPIO_Init(CE_GPIO_PORT,   (CE_PIN ), GPIO_MODE_OUT_PP_HIGH_FAST);//ce 
 131  003a 4bf0          	push	#240
 132  003c 4b20          	push	#32
 133  003e ae5005        	ldw	x,#20485
 134  0041 cd0000        	call	_GPIO_Init
 136  0044 85            	popw	x
 137                     ; 21     GPIO_Init(CSN_GPIO_PORT,  (CSN_PIN ), GPIO_MODE_OUT_PP_HIGH_FAST);//cs
 139  0045 4bf0          	push	#240
 140  0047 4b04          	push	#4
 141  0049 ae500a        	ldw	x,#20490
 142  004c cd0000        	call	_GPIO_Init
 144  004f 85            	popw	x
 145                     ; 22     GPIO_Init(IRQ_GPIO_PORT,  (IRQ_PIN ), GPIO_MODE_IN_FL_NO_IT); //IRQ
 147  0050 4b00          	push	#0
 148  0052 4b10          	push	#16
 149  0054 ae5005        	ldw	x,#20485
 150  0057 cd0000        	call	_GPIO_Init
 152  005a 85            	popw	x
 153                     ; 23 	}
 156  005b 81            	ret
 169                     	xdef	_Nrf_Gpio_Init
 170                     	xdef	_Port_DeInit_All
 171                     	xref	_GPIO_Init
 172                     	xref	_GPIO_DeInit
 191                     	end
