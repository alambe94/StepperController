   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  16                     	bsct
  17  0000               _lastBlink:
  18  0000 00            	dc.b	0
  19  0001               _wait:
  20  0001 00000000      	dc.l	0
  21  0005               _i:
  22  0005 00            	dc.b	0
  58                     ; 55 int main(void)
  58                     ; 56 {
  60                     	switch	.text
  61  0000               _main:
  65                     ; 57  CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); //f_master = HSI = 16Mhz
  67  0000 4f            	clr	a
  68  0001 cd0000        	call	_CLK_HSIPrescalerConfig
  70                     ; 58  Millis_Init();
  72  0004 cd0000        	call	_Millis_Init
  74                     ; 59  Port_DeInit_All();
  76  0007 cd0000        	call	_Port_DeInit_All
  78                     ; 60  Motot3_Port_Init();
  80  000a cd0000        	call	_Motot3_Port_Init
  82                     ; 61  Encoder3_Port_Init();
  84  000d cd0000        	call	_Encoder3_Port_Init
  86                     ; 64  enableInterrupts(); //InterruptInit
  89  0010 9a            rim
  91  0011               L12:
  92                     ; 67 		ScanEncoder3();
  94  0011 cd0000        	call	_ScanEncoder3
  97  0014 20fb          	jra	L12
 132                     ; 86 void assert_failed(u8* file, u32 line)
 132                     ; 87 { 
 133                     	switch	.text
 134  0016               _assert_failed:
 138  0016               L34:
 139  0016 20fe          	jra	L34
 181                     	xdef	_main
 182                     	xdef	_i
 183                     	xdef	_wait
 184                     	xdef	_lastBlink
 185                     	xref	_ScanEncoder3
 186                     	xref	_Millis_Init
 187                     	xref	_Encoder3_Port_Init
 188                     	xref	_Motot3_Port_Init
 189                     	xref	_Port_DeInit_All
 190                     	xdef	_assert_failed
 191                     	xref	_CLK_HSIPrescalerConfig
 210                     	end
