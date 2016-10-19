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
  61                     ; 56 int main(void)
  61                     ; 57 {
  63                     	switch	.text
  64  0000               _main:
  68                     ; 58  CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); //f_master = HSI = 16Mhz
  70  0000 4f            	clr	a
  71  0001 cd0000        	call	_CLK_HSIPrescalerConfig
  73                     ; 59  Millis_init();
  75  0004 cd0000        	call	_Millis_init
  77                     ; 60  Port_DeInit_All();
  79  0007 cd0000        	call	_Port_DeInit_All
  81                     ; 61  Motot2_Port_Init();
  83  000a cd0000        	call	_Motot2_Port_Init
  85                     ; 62  Encoder2_Port_Init();
  87  000d cd0000        	call	_Encoder2_Port_Init
  89                     ; 63  Encoder4_Port_Init();
  91  0010 cd0000        	call	_Encoder4_Port_Init
  93                     ; 64  Led_Pwm_init();
  95  0013 cd0000        	call	_Led_Pwm_init
  97                     ; 67  enableInterrupts(); //InterruptInit
 100  0016 9a            rim
 102  0017               L12:
 103                     ; 70 		ScanEncoder2();
 105  0017 cd0000        	call	_ScanEncoder2
 107                     ; 71     ScanEncoder4();	
 109  001a cd0000        	call	_ScanEncoder4
 112  001d 20f8          	jra	L12
 147                     ; 90 void assert_failed(u8* file, u32 line)
 147                     ; 91 { 
 148                     	switch	.text
 149  001f               _assert_failed:
 153  001f               L34:
 154  001f 20fe          	jra	L34
 196                     	xdef	_main
 197                     	xdef	_i
 198                     	xdef	_wait
 199                     	xdef	_lastBlink
 200                     	xref	_Led_Pwm_init
 201                     	xref	_ScanEncoder4
 202                     	xref	_ScanEncoder2
 203                     	xref	_Millis_init
 204                     	xref	_Encoder4_Port_Init
 205                     	xref	_Encoder2_Port_Init
 206                     	xref	_Motot2_Port_Init
 207                     	xref	_Port_DeInit_All
 208                     	xdef	_assert_failed
 209                     	xref	_CLK_HSIPrescalerConfig
 228                     	end
