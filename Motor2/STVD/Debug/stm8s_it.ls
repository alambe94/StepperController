   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  45                     ; 47 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  45                     ; 48 {
  46                     	switch	.text
  47  0000               f_NonHandledInterrupt:
  51                     ; 52 }
  54  0000 80            	iret
  76                     ; 60 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  76                     ; 61 {
  77                     	switch	.text
  78  0001               f_TRAP_IRQHandler:
  82                     ; 65 }
  85  0001 80            	iret
 107                     ; 72 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 107                     ; 73 
 107                     ; 74 {
 108                     	switch	.text
 109  0002               f_TLI_IRQHandler:
 113                     ; 78 }
 116  0002 80            	iret
 138                     ; 85 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 138                     ; 86 {
 139                     	switch	.text
 140  0003               f_AWU_IRQHandler:
 144                     ; 90 }
 147  0003 80            	iret
 169                     ; 97 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 169                     ; 98 {
 170                     	switch	.text
 171  0004               f_CLK_IRQHandler:
 175                     ; 102 }
 178  0004 80            	iret
 201                     ; 109 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 201                     ; 110 {
 202                     	switch	.text
 203  0005               f_EXTI_PORTA_IRQHandler:
 207                     ; 114 }
 210  0005 80            	iret
 233                     ; 121 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 233                     ; 122 {
 234                     	switch	.text
 235  0006               f_EXTI_PORTB_IRQHandler:
 239                     ; 126 }
 242  0006 80            	iret
 265                     ; 133 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 265                     ; 134 {
 266                     	switch	.text
 267  0007               f_EXTI_PORTC_IRQHandler:
 271                     ; 138 }
 274  0007 80            	iret
 297                     ; 145 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 297                     ; 146 {
 298                     	switch	.text
 299  0008               f_EXTI_PORTD_IRQHandler:
 303                     ; 150 }
 306  0008 80            	iret
 329                     ; 157 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 329                     ; 158 {
 330                     	switch	.text
 331  0009               f_EXTI_PORTE_IRQHandler:
 335                     ; 162 }
 338  0009 80            	iret
 360                     ; 209 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 360                     ; 210 {
 361                     	switch	.text
 362  000a               f_SPI_IRQHandler:
 366                     ; 214 }
 369  000a 80            	iret
 392                     ; 221 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 392                     ; 222 {
 393                     	switch	.text
 394  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 398                     ; 226 }
 401  000b 80            	iret
 424                     ; 233 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 424                     ; 234 {
 425                     	switch	.text
 426  000c               f_TIM1_CAP_COM_IRQHandler:
 430                     ; 238 }
 433  000c 80            	iret
 456                     ; 271  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 456                     ; 272  {
 457                     	switch	.text
 458  000d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 462                     ; 276  }
 465  000d 80            	iret
 488                     ; 283  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 488                     ; 284  {
 489                     	switch	.text
 490  000e               f_TIM2_CAP_COM_IRQHandler:
 494                     ; 288  }
 497  000e 80            	iret
 520                     ; 325  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 520                     ; 326  {
 521                     	switch	.text
 522  000f               f_UART1_TX_IRQHandler:
 526                     ; 330  }
 529  000f 80            	iret
 552                     ; 337  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 552                     ; 338  {
 553                     	switch	.text
 554  0010               f_UART1_RX_IRQHandler:
 558                     ; 342  }
 561  0010 80            	iret
 583                     ; 350 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 583                     ; 351 {
 584                     	switch	.text
 585  0011               f_I2C_IRQHandler:
 589                     ; 355 }
 592  0011 80            	iret
 614                     ; 429  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 614                     ; 430  {
 615                     	switch	.text
 616  0012               f_ADC1_IRQHandler:
 620                     ; 434  }
 623  0012 80            	iret
 646                     ; 468 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 646                     ; 469 {
 647                     	switch	.text
 648  0013               f_EEPROM_EEC_IRQHandler:
 652                     ; 473 }
 655  0013 80            	iret
 667                     	xdef	f_EEPROM_EEC_IRQHandler
 668                     	xdef	f_ADC1_IRQHandler
 669                     	xdef	f_I2C_IRQHandler
 670                     	xdef	f_UART1_RX_IRQHandler
 671                     	xdef	f_UART1_TX_IRQHandler
 672                     	xdef	f_TIM2_CAP_COM_IRQHandler
 673                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 674                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 675                     	xdef	f_TIM1_CAP_COM_IRQHandler
 676                     	xdef	f_SPI_IRQHandler
 677                     	xdef	f_EXTI_PORTE_IRQHandler
 678                     	xdef	f_EXTI_PORTD_IRQHandler
 679                     	xdef	f_EXTI_PORTC_IRQHandler
 680                     	xdef	f_EXTI_PORTB_IRQHandler
 681                     	xdef	f_EXTI_PORTA_IRQHandler
 682                     	xdef	f_CLK_IRQHandler
 683                     	xdef	f_AWU_IRQHandler
 684                     	xdef	f_TLI_IRQHandler
 685                     	xdef	f_TRAP_IRQHandler
 686                     	xdef	f_NonHandledInterrupt
 705                     	end
