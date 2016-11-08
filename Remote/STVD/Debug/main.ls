   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  49                     ; 43 int main(void)
  49                     ; 44 {
  51                     	switch	.text
  52  0000               _main:
  56                     ; 45  CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); //f_master = HSI = 16Mhz
  58  0000 4f            	clr	a
  59  0001 cd0000        	call	_CLK_HSIPrescalerConfig
  61                     ; 46  Millis_Init();
  63  0004 cd0000        	call	_Millis_Init
  65                     ; 47  Port_DeInit_All();
  67  0007 cd0000        	call	_Port_DeInit_All
  69                     ; 50  enableInterrupts(); //InterruptInit
  72  000a 9a            rim
  74                     ; 52  delay_us(100);
  77  000b a664          	ld	a,#100
  78  000d cd0000        	call	_delay_us
  80  0010               L12:
  82  0010 20fe          	jra	L12
 117                     ; 74 void assert_failed(u8* file, u32 line)
 117                     ; 75 { 
 118                     	switch	.text
 119  0012               _assert_failed:
 123  0012               L34:
 124  0012 20fe          	jra	L34
 137                     	xdef	_main
 138                     	xref	_delay_us
 139                     	xref	_Millis_Init
 140                     	xref	_Port_DeInit_All
 141                     	xdef	_assert_failed
 142                     	xref	_CLK_HSIPrescalerConfig
 161                     	end
