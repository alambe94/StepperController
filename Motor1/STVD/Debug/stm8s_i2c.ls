   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  44                     ; 61 void I2C_DeInit(void)
  44                     ; 62 {
  46                     	switch	.text
  47  0000               _I2C_DeInit:
  51                     ; 63   I2C->CR1 = I2C_CR1_RESET_VALUE;
  53  0000 725f5210      	clr	21008
  54                     ; 64   I2C->CR2 = I2C_CR2_RESET_VALUE;
  56  0004 725f5211      	clr	21009
  57                     ; 65   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  59  0008 725f5212      	clr	21010
  60                     ; 66   I2C->OARL = I2C_OARL_RESET_VALUE;
  62  000c 725f5213      	clr	21011
  63                     ; 67   I2C->OARH = I2C_OARH_RESET_VALUE;
  65  0010 725f5214      	clr	21012
  66                     ; 68   I2C->ITR = I2C_ITR_RESET_VALUE;
  68  0014 725f521a      	clr	21018
  69                     ; 69   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  71  0018 725f521b      	clr	21019
  72                     ; 70   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  74  001c 725f521c      	clr	21020
  75                     ; 71   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  77  0020 3502521d      	mov	21021,#2
  78                     ; 72 }
  81  0024 81            	ret
 261                     .const:	section	.text
 262  0000               L44:
 263  0000 00061a81      	dc.l	400001
 264  0004               L05:
 265  0004 000186a1      	dc.l	100001
 266  0008               L25:
 267  0008 000f4240      	dc.l	1000000
 268                     ; 90 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 268                     ; 91               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 268                     ; 92               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 268                     ; 93 {
 269                     	switch	.text
 270  0025               _I2C_Init:
 272  0025 5209          	subw	sp,#9
 273       00000009      OFST:	set	9
 276                     ; 94   uint16_t result = 0x0004;
 278                     ; 95   uint16_t tmpval = 0;
 280                     ; 96   uint8_t tmpccrh = 0;
 282  0027 0f07          	clr	(OFST-2,sp)
 283                     ; 99   assert_param(IS_I2C_ACK_OK(Ack));
 285  0029 0d13          	tnz	(OFST+10,sp)
 286  002b 270c          	jreq	L21
 287  002d 7b13          	ld	a,(OFST+10,sp)
 288  002f a101          	cp	a,#1
 289  0031 2706          	jreq	L21
 290  0033 7b13          	ld	a,(OFST+10,sp)
 291  0035 a102          	cp	a,#2
 292  0037 2603          	jrne	L01
 293  0039               L21:
 294  0039 4f            	clr	a
 295  003a 2010          	jra	L41
 296  003c               L01:
 297  003c ae0063        	ldw	x,#99
 298  003f 89            	pushw	x
 299  0040 ae0000        	ldw	x,#0
 300  0043 89            	pushw	x
 301  0044 ae000c        	ldw	x,#L131
 302  0047 cd0000        	call	_assert_failed
 304  004a 5b04          	addw	sp,#4
 305  004c               L41:
 306                     ; 100   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 308  004c 0d14          	tnz	(OFST+11,sp)
 309  004e 2706          	jreq	L02
 310  0050 7b14          	ld	a,(OFST+11,sp)
 311  0052 a180          	cp	a,#128
 312  0054 2603          	jrne	L61
 313  0056               L02:
 314  0056 4f            	clr	a
 315  0057 2010          	jra	L22
 316  0059               L61:
 317  0059 ae0064        	ldw	x,#100
 318  005c 89            	pushw	x
 319  005d ae0000        	ldw	x,#0
 320  0060 89            	pushw	x
 321  0061 ae000c        	ldw	x,#L131
 322  0064 cd0000        	call	_assert_failed
 324  0067 5b04          	addw	sp,#4
 325  0069               L22:
 326                     ; 101   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 328  0069 1e10          	ldw	x,(OFST+7,sp)
 329  006b a30400        	cpw	x,#1024
 330  006e 2403          	jruge	L42
 331  0070 4f            	clr	a
 332  0071 2010          	jra	L62
 333  0073               L42:
 334  0073 ae0065        	ldw	x,#101
 335  0076 89            	pushw	x
 336  0077 ae0000        	ldw	x,#0
 337  007a 89            	pushw	x
 338  007b ae000c        	ldw	x,#L131
 339  007e cd0000        	call	_assert_failed
 341  0081 5b04          	addw	sp,#4
 342  0083               L62:
 343                     ; 102   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 345  0083 0d12          	tnz	(OFST+9,sp)
 346  0085 2706          	jreq	L23
 347  0087 7b12          	ld	a,(OFST+9,sp)
 348  0089 a140          	cp	a,#64
 349  008b 2603          	jrne	L03
 350  008d               L23:
 351  008d 4f            	clr	a
 352  008e 2010          	jra	L43
 353  0090               L03:
 354  0090 ae0066        	ldw	x,#102
 355  0093 89            	pushw	x
 356  0094 ae0000        	ldw	x,#0
 357  0097 89            	pushw	x
 358  0098 ae000c        	ldw	x,#L131
 359  009b cd0000        	call	_assert_failed
 361  009e 5b04          	addw	sp,#4
 362  00a0               L43:
 363                     ; 103   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 365  00a0 0d15          	tnz	(OFST+12,sp)
 366  00a2 2709          	jreq	L63
 367  00a4 7b15          	ld	a,(OFST+12,sp)
 368  00a6 a111          	cp	a,#17
 369  00a8 2403          	jruge	L63
 370  00aa 4f            	clr	a
 371  00ab 2010          	jra	L04
 372  00ad               L63:
 373  00ad ae0067        	ldw	x,#103
 374  00b0 89            	pushw	x
 375  00b1 ae0000        	ldw	x,#0
 376  00b4 89            	pushw	x
 377  00b5 ae000c        	ldw	x,#L131
 378  00b8 cd0000        	call	_assert_failed
 380  00bb 5b04          	addw	sp,#4
 381  00bd               L04:
 382                     ; 104   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 384  00bd 96            	ldw	x,sp
 385  00be 1c000c        	addw	x,#OFST+3
 386  00c1 cd0000        	call	c_lzmp
 388  00c4 2712          	jreq	L24
 389  00c6 96            	ldw	x,sp
 390  00c7 1c000c        	addw	x,#OFST+3
 391  00ca cd0000        	call	c_ltor
 393  00cd ae0000        	ldw	x,#L44
 394  00d0 cd0000        	call	c_lcmp
 396  00d3 2403          	jruge	L24
 397  00d5 4f            	clr	a
 398  00d6 2010          	jra	L64
 399  00d8               L24:
 400  00d8 ae0068        	ldw	x,#104
 401  00db 89            	pushw	x
 402  00dc ae0000        	ldw	x,#0
 403  00df 89            	pushw	x
 404  00e0 ae000c        	ldw	x,#L131
 405  00e3 cd0000        	call	_assert_failed
 407  00e6 5b04          	addw	sp,#4
 408  00e8               L64:
 409                     ; 109   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 411  00e8 c65212        	ld	a,21010
 412  00eb a4c0          	and	a,#192
 413  00ed c75212        	ld	21010,a
 414                     ; 111   I2C->FREQR |= InputClockFrequencyMHz;
 416  00f0 c65212        	ld	a,21010
 417  00f3 1a15          	or	a,(OFST+12,sp)
 418  00f5 c75212        	ld	21010,a
 419                     ; 115   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 421  00f8 72115210      	bres	21008,#0
 422                     ; 118   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 424  00fc c6521c        	ld	a,21020
 425  00ff a430          	and	a,#48
 426  0101 c7521c        	ld	21020,a
 427                     ; 119   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 429  0104 725f521b      	clr	21019
 430                     ; 122   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 432  0108 96            	ldw	x,sp
 433  0109 1c000c        	addw	x,#OFST+3
 434  010c cd0000        	call	c_ltor
 436  010f ae0004        	ldw	x,#L05
 437  0112 cd0000        	call	c_lcmp
 439  0115 2403          	jruge	L45
 440  0117 cc01a4        	jp	L331
 441  011a               L45:
 442                     ; 125     tmpccrh = I2C_CCRH_FS;
 444  011a a680          	ld	a,#128
 445  011c 6b07          	ld	(OFST-2,sp),a
 446                     ; 127     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 448  011e 0d12          	tnz	(OFST+9,sp)
 449  0120 2630          	jrne	L531
 450                     ; 130       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 452  0122 96            	ldw	x,sp
 453  0123 1c000c        	addw	x,#OFST+3
 454  0126 cd0000        	call	c_ltor
 456  0129 a603          	ld	a,#3
 457  012b cd0000        	call	c_smul
 459  012e 96            	ldw	x,sp
 460  012f 1c0001        	addw	x,#OFST-8
 461  0132 cd0000        	call	c_rtol
 463  0135 7b15          	ld	a,(OFST+12,sp)
 464  0137 b703          	ld	c_lreg+3,a
 465  0139 3f02          	clr	c_lreg+2
 466  013b 3f01          	clr	c_lreg+1
 467  013d 3f00          	clr	c_lreg
 468  013f ae0008        	ldw	x,#L25
 469  0142 cd0000        	call	c_lmul
 471  0145 96            	ldw	x,sp
 472  0146 1c0001        	addw	x,#OFST-8
 473  0149 cd0000        	call	c_ludv
 475  014c be02          	ldw	x,c_lreg+2
 476  014e 1f08          	ldw	(OFST-1,sp),x
 478  0150 2034          	jra	L731
 479  0152               L531:
 480                     ; 135       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 482  0152 96            	ldw	x,sp
 483  0153 1c000c        	addw	x,#OFST+3
 484  0156 cd0000        	call	c_ltor
 486  0159 a619          	ld	a,#25
 487  015b cd0000        	call	c_smul
 489  015e 96            	ldw	x,sp
 490  015f 1c0001        	addw	x,#OFST-8
 491  0162 cd0000        	call	c_rtol
 493  0165 7b15          	ld	a,(OFST+12,sp)
 494  0167 b703          	ld	c_lreg+3,a
 495  0169 3f02          	clr	c_lreg+2
 496  016b 3f01          	clr	c_lreg+1
 497  016d 3f00          	clr	c_lreg
 498  016f ae0008        	ldw	x,#L25
 499  0172 cd0000        	call	c_lmul
 501  0175 96            	ldw	x,sp
 502  0176 1c0001        	addw	x,#OFST-8
 503  0179 cd0000        	call	c_ludv
 505  017c be02          	ldw	x,c_lreg+2
 506  017e 1f08          	ldw	(OFST-1,sp),x
 507                     ; 137       tmpccrh |= I2C_CCRH_DUTY;
 509  0180 7b07          	ld	a,(OFST-2,sp)
 510  0182 aa40          	or	a,#64
 511  0184 6b07          	ld	(OFST-2,sp),a
 512  0186               L731:
 513                     ; 141     if (result < (uint16_t)0x01)
 515  0186 1e08          	ldw	x,(OFST-1,sp)
 516  0188 2605          	jrne	L141
 517                     ; 144       result = (uint16_t)0x0001;
 519  018a ae0001        	ldw	x,#1
 520  018d 1f08          	ldw	(OFST-1,sp),x
 521  018f               L141:
 522                     ; 150     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 524  018f 7b15          	ld	a,(OFST+12,sp)
 525  0191 97            	ld	xl,a
 526  0192 a603          	ld	a,#3
 527  0194 42            	mul	x,a
 528  0195 a60a          	ld	a,#10
 529  0197 cd0000        	call	c_sdivx
 531  019a 5c            	incw	x
 532  019b 1f05          	ldw	(OFST-4,sp),x
 533                     ; 151     I2C->TRISER = (uint8_t)tmpval;
 535  019d 7b06          	ld	a,(OFST-3,sp)
 536  019f c7521d        	ld	21021,a
 538  01a2 2043          	jra	L341
 539  01a4               L331:
 540                     ; 158     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 542  01a4 96            	ldw	x,sp
 543  01a5 1c000c        	addw	x,#OFST+3
 544  01a8 cd0000        	call	c_ltor
 546  01ab 3803          	sll	c_lreg+3
 547  01ad 3902          	rlc	c_lreg+2
 548  01af 3901          	rlc	c_lreg+1
 549  01b1 3900          	rlc	c_lreg
 550  01b3 96            	ldw	x,sp
 551  01b4 1c0001        	addw	x,#OFST-8
 552  01b7 cd0000        	call	c_rtol
 554  01ba 7b15          	ld	a,(OFST+12,sp)
 555  01bc b703          	ld	c_lreg+3,a
 556  01be 3f02          	clr	c_lreg+2
 557  01c0 3f01          	clr	c_lreg+1
 558  01c2 3f00          	clr	c_lreg
 559  01c4 ae0008        	ldw	x,#L25
 560  01c7 cd0000        	call	c_lmul
 562  01ca 96            	ldw	x,sp
 563  01cb 1c0001        	addw	x,#OFST-8
 564  01ce cd0000        	call	c_ludv
 566  01d1 be02          	ldw	x,c_lreg+2
 567  01d3 1f08          	ldw	(OFST-1,sp),x
 568                     ; 161     if (result < (uint16_t)0x0004)
 570  01d5 1e08          	ldw	x,(OFST-1,sp)
 571  01d7 a30004        	cpw	x,#4
 572  01da 2405          	jruge	L541
 573                     ; 164       result = (uint16_t)0x0004;
 575  01dc ae0004        	ldw	x,#4
 576  01df 1f08          	ldw	(OFST-1,sp),x
 577  01e1               L541:
 578                     ; 170     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 580  01e1 7b15          	ld	a,(OFST+12,sp)
 581  01e3 4c            	inc	a
 582  01e4 c7521d        	ld	21021,a
 583  01e7               L341:
 584                     ; 175   I2C->CCRL = (uint8_t)result;
 586  01e7 7b09          	ld	a,(OFST+0,sp)
 587  01e9 c7521b        	ld	21019,a
 588                     ; 176   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 590  01ec 7b08          	ld	a,(OFST-1,sp)
 591  01ee a40f          	and	a,#15
 592  01f0 1a07          	or	a,(OFST-2,sp)
 593  01f2 c7521c        	ld	21020,a
 594                     ; 179   I2C->CR1 |= I2C_CR1_PE;
 596  01f5 72105210      	bset	21008,#0
 597                     ; 182   I2C_AcknowledgeConfig(Ack);
 599  01f9 7b13          	ld	a,(OFST+10,sp)
 600  01fb cd0323        	call	_I2C_AcknowledgeConfig
 602                     ; 185   I2C->OARL = (uint8_t)(OwnAddress);
 604  01fe 7b11          	ld	a,(OFST+8,sp)
 605  0200 c75213        	ld	21011,a
 606                     ; 186   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 606                     ; 187                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 608  0203 7b10          	ld	a,(OFST+7,sp)
 609  0205 97            	ld	xl,a
 610  0206 7b11          	ld	a,(OFST+8,sp)
 611  0208 9f            	ld	a,xl
 612  0209 a403          	and	a,#3
 613  020b 97            	ld	xl,a
 614  020c 4f            	clr	a
 615  020d 02            	rlwa	x,a
 616  020e 4f            	clr	a
 617  020f 01            	rrwa	x,a
 618  0210 48            	sll	a
 619  0211 59            	rlcw	x
 620  0212 9f            	ld	a,xl
 621  0213 6b04          	ld	(OFST-5,sp),a
 622  0215 7b14          	ld	a,(OFST+11,sp)
 623  0217 aa40          	or	a,#64
 624  0219 1a04          	or	a,(OFST-5,sp)
 625  021b c75214        	ld	21012,a
 626                     ; 188 }
 629  021e 5b09          	addw	sp,#9
 630  0220 81            	ret
 686                     ; 196 void I2C_Cmd(FunctionalState NewState)
 686                     ; 197 {
 687                     	switch	.text
 688  0221               _I2C_Cmd:
 690  0221 88            	push	a
 691       00000000      OFST:	set	0
 694                     ; 200   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 696  0222 4d            	tnz	a
 697  0223 2704          	jreq	L26
 698  0225 a101          	cp	a,#1
 699  0227 2603          	jrne	L06
 700  0229               L26:
 701  0229 4f            	clr	a
 702  022a 2010          	jra	L46
 703  022c               L06:
 704  022c ae00c8        	ldw	x,#200
 705  022f 89            	pushw	x
 706  0230 ae0000        	ldw	x,#0
 707  0233 89            	pushw	x
 708  0234 ae000c        	ldw	x,#L131
 709  0237 cd0000        	call	_assert_failed
 711  023a 5b04          	addw	sp,#4
 712  023c               L46:
 713                     ; 202   if (NewState != DISABLE)
 715  023c 0d01          	tnz	(OFST+1,sp)
 716  023e 2706          	jreq	L571
 717                     ; 205     I2C->CR1 |= I2C_CR1_PE;
 719  0240 72105210      	bset	21008,#0
 721  0244 2004          	jra	L771
 722  0246               L571:
 723                     ; 210     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 725  0246 72115210      	bres	21008,#0
 726  024a               L771:
 727                     ; 212 }
 730  024a 84            	pop	a
 731  024b 81            	ret
 767                     ; 220 void I2C_GeneralCallCmd(FunctionalState NewState)
 767                     ; 221 {
 768                     	switch	.text
 769  024c               _I2C_GeneralCallCmd:
 771  024c 88            	push	a
 772       00000000      OFST:	set	0
 775                     ; 224   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 777  024d 4d            	tnz	a
 778  024e 2704          	jreq	L27
 779  0250 a101          	cp	a,#1
 780  0252 2603          	jrne	L07
 781  0254               L27:
 782  0254 4f            	clr	a
 783  0255 2010          	jra	L47
 784  0257               L07:
 785  0257 ae00e0        	ldw	x,#224
 786  025a 89            	pushw	x
 787  025b ae0000        	ldw	x,#0
 788  025e 89            	pushw	x
 789  025f ae000c        	ldw	x,#L131
 790  0262 cd0000        	call	_assert_failed
 792  0265 5b04          	addw	sp,#4
 793  0267               L47:
 794                     ; 226   if (NewState != DISABLE)
 796  0267 0d01          	tnz	(OFST+1,sp)
 797  0269 2706          	jreq	L712
 798                     ; 229     I2C->CR1 |= I2C_CR1_ENGC;
 800  026b 721c5210      	bset	21008,#6
 802  026f 2004          	jra	L122
 803  0271               L712:
 804                     ; 234     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 806  0271 721d5210      	bres	21008,#6
 807  0275               L122:
 808                     ; 236 }
 811  0275 84            	pop	a
 812  0276 81            	ret
 848                     ; 246 void I2C_GenerateSTART(FunctionalState NewState)
 848                     ; 247 {
 849                     	switch	.text
 850  0277               _I2C_GenerateSTART:
 852  0277 88            	push	a
 853       00000000      OFST:	set	0
 856                     ; 250   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 858  0278 4d            	tnz	a
 859  0279 2704          	jreq	L201
 860  027b a101          	cp	a,#1
 861  027d 2603          	jrne	L001
 862  027f               L201:
 863  027f 4f            	clr	a
 864  0280 2010          	jra	L401
 865  0282               L001:
 866  0282 ae00fa        	ldw	x,#250
 867  0285 89            	pushw	x
 868  0286 ae0000        	ldw	x,#0
 869  0289 89            	pushw	x
 870  028a ae000c        	ldw	x,#L131
 871  028d cd0000        	call	_assert_failed
 873  0290 5b04          	addw	sp,#4
 874  0292               L401:
 875                     ; 252   if (NewState != DISABLE)
 877  0292 0d01          	tnz	(OFST+1,sp)
 878  0294 2706          	jreq	L142
 879                     ; 255     I2C->CR2 |= I2C_CR2_START;
 881  0296 72105211      	bset	21009,#0
 883  029a 2004          	jra	L342
 884  029c               L142:
 885                     ; 260     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 887  029c 72115211      	bres	21009,#0
 888  02a0               L342:
 889                     ; 262 }
 892  02a0 84            	pop	a
 893  02a1 81            	ret
 929                     ; 270 void I2C_GenerateSTOP(FunctionalState NewState)
 929                     ; 271 {
 930                     	switch	.text
 931  02a2               _I2C_GenerateSTOP:
 933  02a2 88            	push	a
 934       00000000      OFST:	set	0
 937                     ; 274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 939  02a3 4d            	tnz	a
 940  02a4 2704          	jreq	L211
 941  02a6 a101          	cp	a,#1
 942  02a8 2603          	jrne	L011
 943  02aa               L211:
 944  02aa 4f            	clr	a
 945  02ab 2010          	jra	L411
 946  02ad               L011:
 947  02ad ae0112        	ldw	x,#274
 948  02b0 89            	pushw	x
 949  02b1 ae0000        	ldw	x,#0
 950  02b4 89            	pushw	x
 951  02b5 ae000c        	ldw	x,#L131
 952  02b8 cd0000        	call	_assert_failed
 954  02bb 5b04          	addw	sp,#4
 955  02bd               L411:
 956                     ; 276   if (NewState != DISABLE)
 958  02bd 0d01          	tnz	(OFST+1,sp)
 959  02bf 2706          	jreq	L362
 960                     ; 279     I2C->CR2 |= I2C_CR2_STOP;
 962  02c1 72125211      	bset	21009,#1
 964  02c5 2004          	jra	L562
 965  02c7               L362:
 966                     ; 284     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 968  02c7 72135211      	bres	21009,#1
 969  02cb               L562:
 970                     ; 286 }
 973  02cb 84            	pop	a
 974  02cc 81            	ret
1011                     ; 294 void I2C_SoftwareResetCmd(FunctionalState NewState)
1011                     ; 295 {
1012                     	switch	.text
1013  02cd               _I2C_SoftwareResetCmd:
1015  02cd 88            	push	a
1016       00000000      OFST:	set	0
1019                     ; 297   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1021  02ce 4d            	tnz	a
1022  02cf 2704          	jreq	L221
1023  02d1 a101          	cp	a,#1
1024  02d3 2603          	jrne	L021
1025  02d5               L221:
1026  02d5 4f            	clr	a
1027  02d6 2010          	jra	L421
1028  02d8               L021:
1029  02d8 ae0129        	ldw	x,#297
1030  02db 89            	pushw	x
1031  02dc ae0000        	ldw	x,#0
1032  02df 89            	pushw	x
1033  02e0 ae000c        	ldw	x,#L131
1034  02e3 cd0000        	call	_assert_failed
1036  02e6 5b04          	addw	sp,#4
1037  02e8               L421:
1038                     ; 299   if (NewState != DISABLE)
1040  02e8 0d01          	tnz	(OFST+1,sp)
1041  02ea 2706          	jreq	L503
1042                     ; 302     I2C->CR2 |= I2C_CR2_SWRST;
1044  02ec 721e5211      	bset	21009,#7
1046  02f0 2004          	jra	L703
1047  02f2               L503:
1048                     ; 307     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1050  02f2 721f5211      	bres	21009,#7
1051  02f6               L703:
1052                     ; 309 }
1055  02f6 84            	pop	a
1056  02f7 81            	ret
1093                     ; 318 void I2C_StretchClockCmd(FunctionalState NewState)
1093                     ; 319 {
1094                     	switch	.text
1095  02f8               _I2C_StretchClockCmd:
1097  02f8 88            	push	a
1098       00000000      OFST:	set	0
1101                     ; 321   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1103  02f9 4d            	tnz	a
1104  02fa 2704          	jreq	L231
1105  02fc a101          	cp	a,#1
1106  02fe 2603          	jrne	L031
1107  0300               L231:
1108  0300 4f            	clr	a
1109  0301 2010          	jra	L431
1110  0303               L031:
1111  0303 ae0141        	ldw	x,#321
1112  0306 89            	pushw	x
1113  0307 ae0000        	ldw	x,#0
1114  030a 89            	pushw	x
1115  030b ae000c        	ldw	x,#L131
1116  030e cd0000        	call	_assert_failed
1118  0311 5b04          	addw	sp,#4
1119  0313               L431:
1120                     ; 323   if (NewState != DISABLE)
1122  0313 0d01          	tnz	(OFST+1,sp)
1123  0315 2706          	jreq	L723
1124                     ; 326     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1126  0317 721f5210      	bres	21008,#7
1128  031b 2004          	jra	L133
1129  031d               L723:
1130                     ; 332     I2C->CR1 |= I2C_CR1_NOSTRETCH;
1132  031d 721e5210      	bset	21008,#7
1133  0321               L133:
1134                     ; 334 }
1137  0321 84            	pop	a
1138  0322 81            	ret
1175                     ; 343 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
1175                     ; 344 {
1176                     	switch	.text
1177  0323               _I2C_AcknowledgeConfig:
1179  0323 88            	push	a
1180       00000000      OFST:	set	0
1183                     ; 347   assert_param(IS_I2C_ACK_OK(Ack));
1185  0324 4d            	tnz	a
1186  0325 2708          	jreq	L241
1187  0327 a101          	cp	a,#1
1188  0329 2704          	jreq	L241
1189  032b a102          	cp	a,#2
1190  032d 2603          	jrne	L041
1191  032f               L241:
1192  032f 4f            	clr	a
1193  0330 2010          	jra	L441
1194  0332               L041:
1195  0332 ae015b        	ldw	x,#347
1196  0335 89            	pushw	x
1197  0336 ae0000        	ldw	x,#0
1198  0339 89            	pushw	x
1199  033a ae000c        	ldw	x,#L131
1200  033d cd0000        	call	_assert_failed
1202  0340 5b04          	addw	sp,#4
1203  0342               L441:
1204                     ; 349   if (Ack == I2C_ACK_NONE)
1206  0342 0d01          	tnz	(OFST+1,sp)
1207  0344 2606          	jrne	L153
1208                     ; 352     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1210  0346 72155211      	bres	21009,#2
1212  034a 2014          	jra	L353
1213  034c               L153:
1214                     ; 357     I2C->CR2 |= I2C_CR2_ACK;
1216  034c 72145211      	bset	21009,#2
1217                     ; 359     if (Ack == I2C_ACK_CURR)
1219  0350 7b01          	ld	a,(OFST+1,sp)
1220  0352 a101          	cp	a,#1
1221  0354 2606          	jrne	L553
1222                     ; 362       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
1224  0356 72175211      	bres	21009,#3
1226  035a 2004          	jra	L353
1227  035c               L553:
1228                     ; 367       I2C->CR2 |= I2C_CR2_POS;
1230  035c 72165211      	bset	21009,#3
1231  0360               L353:
1232                     ; 370 }
1235  0360 84            	pop	a
1236  0361 81            	ret
1309                     ; 380 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1309                     ; 381 {
1310                     	switch	.text
1311  0362               _I2C_ITConfig:
1313  0362 89            	pushw	x
1314       00000000      OFST:	set	0
1317                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1319  0363 9e            	ld	a,xh
1320  0364 a101          	cp	a,#1
1321  0366 271e          	jreq	L251
1322  0368 9e            	ld	a,xh
1323  0369 a102          	cp	a,#2
1324  036b 2719          	jreq	L251
1325  036d 9e            	ld	a,xh
1326  036e a104          	cp	a,#4
1327  0370 2714          	jreq	L251
1328  0372 9e            	ld	a,xh
1329  0373 a103          	cp	a,#3
1330  0375 270f          	jreq	L251
1331  0377 9e            	ld	a,xh
1332  0378 a105          	cp	a,#5
1333  037a 270a          	jreq	L251
1334  037c 9e            	ld	a,xh
1335  037d a106          	cp	a,#6
1336  037f 2705          	jreq	L251
1337  0381 9e            	ld	a,xh
1338  0382 a107          	cp	a,#7
1339  0384 2603          	jrne	L051
1340  0386               L251:
1341  0386 4f            	clr	a
1342  0387 2010          	jra	L451
1343  0389               L051:
1344  0389 ae0180        	ldw	x,#384
1345  038c 89            	pushw	x
1346  038d ae0000        	ldw	x,#0
1347  0390 89            	pushw	x
1348  0391 ae000c        	ldw	x,#L131
1349  0394 cd0000        	call	_assert_failed
1351  0397 5b04          	addw	sp,#4
1352  0399               L451:
1353                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1355  0399 0d02          	tnz	(OFST+2,sp)
1356  039b 2706          	jreq	L061
1357  039d 7b02          	ld	a,(OFST+2,sp)
1358  039f a101          	cp	a,#1
1359  03a1 2603          	jrne	L651
1360  03a3               L061:
1361  03a3 4f            	clr	a
1362  03a4 2010          	jra	L261
1363  03a6               L651:
1364  03a6 ae0181        	ldw	x,#385
1365  03a9 89            	pushw	x
1366  03aa ae0000        	ldw	x,#0
1367  03ad 89            	pushw	x
1368  03ae ae000c        	ldw	x,#L131
1369  03b1 cd0000        	call	_assert_failed
1371  03b4 5b04          	addw	sp,#4
1372  03b6               L261:
1373                     ; 387   if (NewState != DISABLE)
1375  03b6 0d02          	tnz	(OFST+2,sp)
1376  03b8 270a          	jreq	L514
1377                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1379  03ba c6521a        	ld	a,21018
1380  03bd 1a01          	or	a,(OFST+1,sp)
1381  03bf c7521a        	ld	21018,a
1383  03c2 2009          	jra	L714
1384  03c4               L514:
1385                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1387  03c4 7b01          	ld	a,(OFST+1,sp)
1388  03c6 43            	cpl	a
1389  03c7 c4521a        	and	a,21018
1390  03ca c7521a        	ld	21018,a
1391  03cd               L714:
1392                     ; 397 }
1395  03cd 85            	popw	x
1396  03ce 81            	ret
1433                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1433                     ; 406 {
1434                     	switch	.text
1435  03cf               _I2C_FastModeDutyCycleConfig:
1437  03cf 88            	push	a
1438       00000000      OFST:	set	0
1441                     ; 409   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1443  03d0 4d            	tnz	a
1444  03d1 2704          	jreq	L071
1445  03d3 a140          	cp	a,#64
1446  03d5 2603          	jrne	L661
1447  03d7               L071:
1448  03d7 4f            	clr	a
1449  03d8 2010          	jra	L271
1450  03da               L661:
1451  03da ae0199        	ldw	x,#409
1452  03dd 89            	pushw	x
1453  03de ae0000        	ldw	x,#0
1454  03e1 89            	pushw	x
1455  03e2 ae000c        	ldw	x,#L131
1456  03e5 cd0000        	call	_assert_failed
1458  03e8 5b04          	addw	sp,#4
1459  03ea               L271:
1460                     ; 411   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1462  03ea 7b01          	ld	a,(OFST+1,sp)
1463  03ec a140          	cp	a,#64
1464  03ee 2606          	jrne	L734
1465                     ; 414     I2C->CCRH |= I2C_CCRH_DUTY;
1467  03f0 721c521c      	bset	21020,#6
1469  03f4 2004          	jra	L144
1470  03f6               L734:
1471                     ; 419     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1473  03f6 721d521c      	bres	21020,#6
1474  03fa               L144:
1475                     ; 421 }
1478  03fa 84            	pop	a
1479  03fb 81            	ret
1502                     ; 428 uint8_t I2C_ReceiveData(void)
1502                     ; 429 {
1503                     	switch	.text
1504  03fc               _I2C_ReceiveData:
1508                     ; 431   return ((uint8_t)I2C->DR);
1510  03fc c65216        	ld	a,21014
1513  03ff 81            	ret
1579                     ; 441 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1579                     ; 442 {
1580                     	switch	.text
1581  0400               _I2C_Send7bitAddress:
1583  0400 89            	pushw	x
1584       00000000      OFST:	set	0
1587                     ; 444   assert_param(IS_I2C_ADDRESS_OK(Address));
1589  0401 9e            	ld	a,xh
1590  0402 a501          	bcp	a,#1
1591  0404 2603          	jrne	L002
1592  0406 4f            	clr	a
1593  0407 2010          	jra	L202
1594  0409               L002:
1595  0409 ae01bc        	ldw	x,#444
1596  040c 89            	pushw	x
1597  040d ae0000        	ldw	x,#0
1598  0410 89            	pushw	x
1599  0411 ae000c        	ldw	x,#L131
1600  0414 cd0000        	call	_assert_failed
1602  0417 5b04          	addw	sp,#4
1603  0419               L202:
1604                     ; 445   assert_param(IS_I2C_DIRECTION_OK(Direction));
1606  0419 0d02          	tnz	(OFST+2,sp)
1607  041b 2706          	jreq	L602
1608  041d 7b02          	ld	a,(OFST+2,sp)
1609  041f a101          	cp	a,#1
1610  0421 2603          	jrne	L402
1611  0423               L602:
1612  0423 4f            	clr	a
1613  0424 2010          	jra	L012
1614  0426               L402:
1615  0426 ae01bd        	ldw	x,#445
1616  0429 89            	pushw	x
1617  042a ae0000        	ldw	x,#0
1618  042d 89            	pushw	x
1619  042e ae000c        	ldw	x,#L131
1620  0431 cd0000        	call	_assert_failed
1622  0434 5b04          	addw	sp,#4
1623  0436               L012:
1624                     ; 448   Address &= (uint8_t)0xFE;
1626  0436 7b01          	ld	a,(OFST+1,sp)
1627  0438 a4fe          	and	a,#254
1628  043a 6b01          	ld	(OFST+1,sp),a
1629                     ; 451   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1631  043c 7b01          	ld	a,(OFST+1,sp)
1632  043e 1a02          	or	a,(OFST+2,sp)
1633  0440 c75216        	ld	21014,a
1634                     ; 452 }
1637  0443 85            	popw	x
1638  0444 81            	ret
1672                     ; 459 void I2C_SendData(uint8_t Data)
1672                     ; 460 {
1673                     	switch	.text
1674  0445               _I2C_SendData:
1678                     ; 462   I2C->DR = Data;
1680  0445 c75216        	ld	21014,a
1681                     ; 463 }
1684  0448 81            	ret
1909                     ; 579 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1909                     ; 580 {
1910                     	switch	.text
1911  0449               _I2C_CheckEvent:
1913  0449 89            	pushw	x
1914  044a 5206          	subw	sp,#6
1915       00000006      OFST:	set	6
1918                     ; 581   __IO uint16_t lastevent = 0x00;
1920  044c 5f            	clrw	x
1921  044d 1f04          	ldw	(OFST-2,sp),x
1922                     ; 582   uint8_t flag1 = 0x00 ;
1924                     ; 583   uint8_t flag2 = 0x00;
1926                     ; 584   ErrorStatus status = ERROR;
1928                     ; 587   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1930  044f 1e07          	ldw	x,(OFST+1,sp)
1931  0451 a30682        	cpw	x,#1666
1932  0454 2769          	jreq	L022
1933  0456 1e07          	ldw	x,(OFST+1,sp)
1934  0458 a30202        	cpw	x,#514
1935  045b 2762          	jreq	L022
1936  045d 1e07          	ldw	x,(OFST+1,sp)
1937  045f a31200        	cpw	x,#4608
1938  0462 275b          	jreq	L022
1939  0464 1e07          	ldw	x,(OFST+1,sp)
1940  0466 a30240        	cpw	x,#576
1941  0469 2754          	jreq	L022
1942  046b 1e07          	ldw	x,(OFST+1,sp)
1943  046d a30350        	cpw	x,#848
1944  0470 274d          	jreq	L022
1945  0472 1e07          	ldw	x,(OFST+1,sp)
1946  0474 a30684        	cpw	x,#1668
1947  0477 2746          	jreq	L022
1948  0479 1e07          	ldw	x,(OFST+1,sp)
1949  047b a30794        	cpw	x,#1940
1950  047e 273f          	jreq	L022
1951  0480 1e07          	ldw	x,(OFST+1,sp)
1952  0482 a30004        	cpw	x,#4
1953  0485 2738          	jreq	L022
1954  0487 1e07          	ldw	x,(OFST+1,sp)
1955  0489 a30010        	cpw	x,#16
1956  048c 2731          	jreq	L022
1957  048e 1e07          	ldw	x,(OFST+1,sp)
1958  0490 a30301        	cpw	x,#769
1959  0493 272a          	jreq	L022
1960  0495 1e07          	ldw	x,(OFST+1,sp)
1961  0497 a30782        	cpw	x,#1922
1962  049a 2723          	jreq	L022
1963  049c 1e07          	ldw	x,(OFST+1,sp)
1964  049e a30302        	cpw	x,#770
1965  04a1 271c          	jreq	L022
1966  04a3 1e07          	ldw	x,(OFST+1,sp)
1967  04a5 a30340        	cpw	x,#832
1968  04a8 2715          	jreq	L022
1969  04aa 1e07          	ldw	x,(OFST+1,sp)
1970  04ac a30784        	cpw	x,#1924
1971  04af 270e          	jreq	L022
1972  04b1 1e07          	ldw	x,(OFST+1,sp)
1973  04b3 a30780        	cpw	x,#1920
1974  04b6 2707          	jreq	L022
1975  04b8 1e07          	ldw	x,(OFST+1,sp)
1976  04ba a30308        	cpw	x,#776
1977  04bd 2603          	jrne	L612
1978  04bf               L022:
1979  04bf 4f            	clr	a
1980  04c0 2010          	jra	L222
1981  04c2               L612:
1982  04c2 ae024b        	ldw	x,#587
1983  04c5 89            	pushw	x
1984  04c6 ae0000        	ldw	x,#0
1985  04c9 89            	pushw	x
1986  04ca ae000c        	ldw	x,#L131
1987  04cd cd0000        	call	_assert_failed
1989  04d0 5b04          	addw	sp,#4
1990  04d2               L222:
1991                     ; 589   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1993  04d2 1e07          	ldw	x,(OFST+1,sp)
1994  04d4 a30004        	cpw	x,#4
1995  04d7 260b          	jrne	L336
1996                     ; 591     lastevent = I2C->SR2 & I2C_SR2_AF;
1998  04d9 c65218        	ld	a,21016
1999  04dc a404          	and	a,#4
2000  04de 5f            	clrw	x
2001  04df 97            	ld	xl,a
2002  04e0 1f04          	ldw	(OFST-2,sp),x
2004  04e2 201f          	jra	L536
2005  04e4               L336:
2006                     ; 595     flag1 = I2C->SR1;
2008  04e4 c65217        	ld	a,21015
2009  04e7 6b03          	ld	(OFST-3,sp),a
2010                     ; 596     flag2 = I2C->SR3;
2012  04e9 c65219        	ld	a,21017
2013  04ec 6b06          	ld	(OFST+0,sp),a
2014                     ; 597     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
2016  04ee 7b03          	ld	a,(OFST-3,sp)
2017  04f0 5f            	clrw	x
2018  04f1 97            	ld	xl,a
2019  04f2 1f01          	ldw	(OFST-5,sp),x
2020  04f4 7b06          	ld	a,(OFST+0,sp)
2021  04f6 5f            	clrw	x
2022  04f7 97            	ld	xl,a
2023  04f8 4f            	clr	a
2024  04f9 02            	rlwa	x,a
2025  04fa 01            	rrwa	x,a
2026  04fb 1a02          	or	a,(OFST-4,sp)
2027  04fd 01            	rrwa	x,a
2028  04fe 1a01          	or	a,(OFST-5,sp)
2029  0500 01            	rrwa	x,a
2030  0501 1f04          	ldw	(OFST-2,sp),x
2031  0503               L536:
2032                     ; 600   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
2034  0503 1e04          	ldw	x,(OFST-2,sp)
2035  0505 01            	rrwa	x,a
2036  0506 1408          	and	a,(OFST+2,sp)
2037  0508 01            	rrwa	x,a
2038  0509 1407          	and	a,(OFST+1,sp)
2039  050b 01            	rrwa	x,a
2040  050c 1307          	cpw	x,(OFST+1,sp)
2041  050e 2606          	jrne	L736
2042                     ; 603     status = SUCCESS;
2044  0510 a601          	ld	a,#1
2045  0512 6b06          	ld	(OFST+0,sp),a
2047  0514 2002          	jra	L146
2048  0516               L736:
2049                     ; 608     status = ERROR;
2051  0516 0f06          	clr	(OFST+0,sp)
2052  0518               L146:
2053                     ; 612   return status;
2055  0518 7b06          	ld	a,(OFST+0,sp)
2058  051a 5b08          	addw	sp,#8
2059  051c 81            	ret
2112                     ; 629 I2C_Event_TypeDef I2C_GetLastEvent(void)
2112                     ; 630 {
2113                     	switch	.text
2114  051d               _I2C_GetLastEvent:
2116  051d 5206          	subw	sp,#6
2117       00000006      OFST:	set	6
2120                     ; 631   __IO uint16_t lastevent = 0;
2122  051f 5f            	clrw	x
2123  0520 1f05          	ldw	(OFST-1,sp),x
2124                     ; 632   uint16_t flag1 = 0;
2126                     ; 633   uint16_t flag2 = 0;
2128                     ; 635   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
2130  0522 c65218        	ld	a,21016
2131  0525 a504          	bcp	a,#4
2132  0527 2707          	jreq	L176
2133                     ; 637     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
2135  0529 ae0004        	ldw	x,#4
2136  052c 1f05          	ldw	(OFST-1,sp),x
2138  052e 201b          	jra	L376
2139  0530               L176:
2140                     ; 642     flag1 = I2C->SR1;
2142  0530 c65217        	ld	a,21015
2143  0533 5f            	clrw	x
2144  0534 97            	ld	xl,a
2145  0535 1f01          	ldw	(OFST-5,sp),x
2146                     ; 643     flag2 = I2C->SR3;
2148  0537 c65219        	ld	a,21017
2149  053a 5f            	clrw	x
2150  053b 97            	ld	xl,a
2151  053c 1f03          	ldw	(OFST-3,sp),x
2152                     ; 646     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
2154  053e 1e03          	ldw	x,(OFST-3,sp)
2155  0540 4f            	clr	a
2156  0541 02            	rlwa	x,a
2157  0542 01            	rrwa	x,a
2158  0543 1a02          	or	a,(OFST-4,sp)
2159  0545 01            	rrwa	x,a
2160  0546 1a01          	or	a,(OFST-5,sp)
2161  0548 01            	rrwa	x,a
2162  0549 1f05          	ldw	(OFST-1,sp),x
2163  054b               L376:
2164                     ; 649   return (I2C_Event_TypeDef)lastevent;
2166  054b 1e05          	ldw	x,(OFST-1,sp)
2169  054d 5b06          	addw	sp,#6
2170  054f 81            	ret
2386                     ; 680 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
2386                     ; 681 {
2387                     	switch	.text
2388  0550               _I2C_GetFlagStatus:
2390  0550 89            	pushw	x
2391  0551 89            	pushw	x
2392       00000002      OFST:	set	2
2395                     ; 682   uint8_t tempreg = 0;
2397  0552 0f02          	clr	(OFST+0,sp)
2398                     ; 683   uint8_t regindex = 0;
2400                     ; 684   FlagStatus bitstatus = RESET;
2402                     ; 687   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
2404  0554 a30180        	cpw	x,#384
2405  0557 274b          	jreq	L232
2406  0559 a30140        	cpw	x,#320
2407  055c 2746          	jreq	L232
2408  055e a30110        	cpw	x,#272
2409  0561 2741          	jreq	L232
2410  0563 a30108        	cpw	x,#264
2411  0566 273c          	jreq	L232
2412  0568 a30104        	cpw	x,#260
2413  056b 2737          	jreq	L232
2414  056d a30102        	cpw	x,#258
2415  0570 2732          	jreq	L232
2416  0572 a30101        	cpw	x,#257
2417  0575 272d          	jreq	L232
2418  0577 a30220        	cpw	x,#544
2419  057a 2728          	jreq	L232
2420  057c a30208        	cpw	x,#520
2421  057f 2723          	jreq	L232
2422  0581 a30204        	cpw	x,#516
2423  0584 271e          	jreq	L232
2424  0586 a30202        	cpw	x,#514
2425  0589 2719          	jreq	L232
2426  058b a30201        	cpw	x,#513
2427  058e 2714          	jreq	L232
2428  0590 a30310        	cpw	x,#784
2429  0593 270f          	jreq	L232
2430  0595 a30304        	cpw	x,#772
2431  0598 270a          	jreq	L232
2432  059a a30302        	cpw	x,#770
2433  059d 2705          	jreq	L232
2434  059f a30301        	cpw	x,#769
2435  05a2 2603          	jrne	L032
2436  05a4               L232:
2437  05a4 4f            	clr	a
2438  05a5 2010          	jra	L432
2439  05a7               L032:
2440  05a7 ae02af        	ldw	x,#687
2441  05aa 89            	pushw	x
2442  05ab ae0000        	ldw	x,#0
2443  05ae 89            	pushw	x
2444  05af ae000c        	ldw	x,#L131
2445  05b2 cd0000        	call	_assert_failed
2447  05b5 5b04          	addw	sp,#4
2448  05b7               L432:
2449                     ; 690   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
2451  05b7 7b03          	ld	a,(OFST+1,sp)
2452  05b9 6b01          	ld	(OFST-1,sp),a
2453                     ; 692   switch (regindex)
2455  05bb 7b01          	ld	a,(OFST-1,sp)
2457                     ; 709     default:
2457                     ; 710       break;
2458  05bd 4a            	dec	a
2459  05be 2708          	jreq	L576
2460  05c0 4a            	dec	a
2461  05c1 270c          	jreq	L776
2462  05c3 4a            	dec	a
2463  05c4 2710          	jreq	L107
2464  05c6 2013          	jra	L5101
2465  05c8               L576:
2466                     ; 695     case 0x01:
2466                     ; 696       tempreg = (uint8_t)I2C->SR1;
2468  05c8 c65217        	ld	a,21015
2469  05cb 6b02          	ld	(OFST+0,sp),a
2470                     ; 697       break;
2472  05cd 200c          	jra	L5101
2473  05cf               L776:
2474                     ; 700     case 0x02:
2474                     ; 701       tempreg = (uint8_t)I2C->SR2;
2476  05cf c65218        	ld	a,21016
2477  05d2 6b02          	ld	(OFST+0,sp),a
2478                     ; 702       break;
2480  05d4 2005          	jra	L5101
2481  05d6               L107:
2482                     ; 705     case 0x03:
2482                     ; 706       tempreg = (uint8_t)I2C->SR3;
2484  05d6 c65219        	ld	a,21017
2485  05d9 6b02          	ld	(OFST+0,sp),a
2486                     ; 707       break;
2488  05db               L307:
2489                     ; 709     default:
2489                     ; 710       break;
2491  05db               L5101:
2492                     ; 714   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2494  05db 7b04          	ld	a,(OFST+2,sp)
2495  05dd 1502          	bcp	a,(OFST+0,sp)
2496  05df 2706          	jreq	L7101
2497                     ; 717     bitstatus = SET;
2499  05e1 a601          	ld	a,#1
2500  05e3 6b02          	ld	(OFST+0,sp),a
2502  05e5 2002          	jra	L1201
2503  05e7               L7101:
2504                     ; 722     bitstatus = RESET;
2506  05e7 0f02          	clr	(OFST+0,sp)
2507  05e9               L1201:
2508                     ; 725   return bitstatus;
2510  05e9 7b02          	ld	a,(OFST+0,sp)
2513  05eb 5b04          	addw	sp,#4
2514  05ed 81            	ret
2559                     ; 760 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2559                     ; 761 {
2560                     	switch	.text
2561  05ee               _I2C_ClearFlag:
2563  05ee 89            	pushw	x
2564  05ef 89            	pushw	x
2565       00000002      OFST:	set	2
2568                     ; 762   uint16_t flagpos = 0;
2570                     ; 764   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2572  05f0 01            	rrwa	x,a
2573  05f1 9f            	ld	a,xl
2574  05f2 a4fd          	and	a,#253
2575  05f4 97            	ld	xl,a
2576  05f5 4f            	clr	a
2577  05f6 02            	rlwa	x,a
2578  05f7 5d            	tnzw	x
2579  05f8 2607          	jrne	L042
2580  05fa 1e03          	ldw	x,(OFST+1,sp)
2581  05fc 2703          	jreq	L042
2582  05fe 4f            	clr	a
2583  05ff 2010          	jra	L242
2584  0601               L042:
2585  0601 ae02fc        	ldw	x,#764
2586  0604 89            	pushw	x
2587  0605 ae0000        	ldw	x,#0
2588  0608 89            	pushw	x
2589  0609 ae000c        	ldw	x,#L131
2590  060c cd0000        	call	_assert_failed
2592  060f 5b04          	addw	sp,#4
2593  0611               L242:
2594                     ; 767   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2596  0611 7b03          	ld	a,(OFST+1,sp)
2597  0613 97            	ld	xl,a
2598  0614 7b04          	ld	a,(OFST+2,sp)
2599  0616 a4ff          	and	a,#255
2600  0618 5f            	clrw	x
2601  0619 02            	rlwa	x,a
2602  061a 1f01          	ldw	(OFST-1,sp),x
2603  061c 01            	rrwa	x,a
2604                     ; 769   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2606  061d 7b02          	ld	a,(OFST+0,sp)
2607  061f 43            	cpl	a
2608  0620 c75218        	ld	21016,a
2609                     ; 770 }
2612  0623 5b04          	addw	sp,#4
2613  0625 81            	ret
2780                     ; 792 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2780                     ; 793 {
2781                     	switch	.text
2782  0626               _I2C_GetITStatus:
2784  0626 89            	pushw	x
2785  0627 5204          	subw	sp,#4
2786       00000004      OFST:	set	4
2789                     ; 794   ITStatus bitstatus = RESET;
2791                     ; 795   __IO uint8_t enablestatus = 0;
2793  0629 0f03          	clr	(OFST-1,sp)
2794                     ; 796   uint16_t tempregister = 0;
2796                     ; 799     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2798  062b a31680        	cpw	x,#5760
2799  062e 2737          	jreq	L052
2800  0630 a31640        	cpw	x,#5696
2801  0633 2732          	jreq	L052
2802  0635 a31210        	cpw	x,#4624
2803  0638 272d          	jreq	L052
2804  063a a31208        	cpw	x,#4616
2805  063d 2728          	jreq	L052
2806  063f a31204        	cpw	x,#4612
2807  0642 2723          	jreq	L052
2808  0644 a31202        	cpw	x,#4610
2809  0647 271e          	jreq	L052
2810  0649 a31201        	cpw	x,#4609
2811  064c 2719          	jreq	L052
2812  064e a32220        	cpw	x,#8736
2813  0651 2714          	jreq	L052
2814  0653 a32108        	cpw	x,#8456
2815  0656 270f          	jreq	L052
2816  0658 a32104        	cpw	x,#8452
2817  065b 270a          	jreq	L052
2818  065d a32102        	cpw	x,#8450
2819  0660 2705          	jreq	L052
2820  0662 a32101        	cpw	x,#8449
2821  0665 2603          	jrne	L642
2822  0667               L052:
2823  0667 4f            	clr	a
2824  0668 2010          	jra	L252
2825  066a               L642:
2826  066a ae031f        	ldw	x,#799
2827  066d 89            	pushw	x
2828  066e ae0000        	ldw	x,#0
2829  0671 89            	pushw	x
2830  0672 ae000c        	ldw	x,#L131
2831  0675 cd0000        	call	_assert_failed
2833  0678 5b04          	addw	sp,#4
2834  067a               L252:
2835                     ; 801   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2837  067a 7b05          	ld	a,(OFST+1,sp)
2838  067c 97            	ld	xl,a
2839  067d 7b06          	ld	a,(OFST+2,sp)
2840  067f 9f            	ld	a,xl
2841  0680 a407          	and	a,#7
2842  0682 97            	ld	xl,a
2843  0683 4f            	clr	a
2844  0684 02            	rlwa	x,a
2845  0685 4f            	clr	a
2846  0686 01            	rrwa	x,a
2847  0687 9f            	ld	a,xl
2848  0688 5f            	clrw	x
2849  0689 97            	ld	xl,a
2850  068a 1f01          	ldw	(OFST-3,sp),x
2851                     ; 804   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2853  068c c6521a        	ld	a,21018
2854  068f 1402          	and	a,(OFST-2,sp)
2855  0691 6b03          	ld	(OFST-1,sp),a
2856                     ; 806   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2858  0693 7b05          	ld	a,(OFST+1,sp)
2859  0695 97            	ld	xl,a
2860  0696 7b06          	ld	a,(OFST+2,sp)
2861  0698 9f            	ld	a,xl
2862  0699 a430          	and	a,#48
2863  069b 97            	ld	xl,a
2864  069c 4f            	clr	a
2865  069d 02            	rlwa	x,a
2866  069e a30100        	cpw	x,#256
2867  06a1 2615          	jrne	L3311
2868                     ; 809     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2870  06a3 c65217        	ld	a,21015
2871  06a6 1506          	bcp	a,(OFST+2,sp)
2872  06a8 270a          	jreq	L5311
2874  06aa 0d03          	tnz	(OFST-1,sp)
2875  06ac 2706          	jreq	L5311
2876                     ; 812       bitstatus = SET;
2878  06ae a601          	ld	a,#1
2879  06b0 6b04          	ld	(OFST+0,sp),a
2881  06b2 2017          	jra	L1411
2882  06b4               L5311:
2883                     ; 817       bitstatus = RESET;
2885  06b4 0f04          	clr	(OFST+0,sp)
2886  06b6 2013          	jra	L1411
2887  06b8               L3311:
2888                     ; 823     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2890  06b8 c65218        	ld	a,21016
2891  06bb 1506          	bcp	a,(OFST+2,sp)
2892  06bd 270a          	jreq	L3411
2894  06bf 0d03          	tnz	(OFST-1,sp)
2895  06c1 2706          	jreq	L3411
2896                     ; 826       bitstatus = SET;
2898  06c3 a601          	ld	a,#1
2899  06c5 6b04          	ld	(OFST+0,sp),a
2901  06c7 2002          	jra	L1411
2902  06c9               L3411:
2903                     ; 831       bitstatus = RESET;
2905  06c9 0f04          	clr	(OFST+0,sp)
2906  06cb               L1411:
2907                     ; 835   return  bitstatus;
2909  06cb 7b04          	ld	a,(OFST+0,sp)
2912  06cd 5b06          	addw	sp,#6
2913  06cf 81            	ret
2959                     ; 873 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2959                     ; 874 {
2960                     	switch	.text
2961  06d0               _I2C_ClearITPendingBit:
2963  06d0 89            	pushw	x
2964  06d1 89            	pushw	x
2965       00000002      OFST:	set	2
2968                     ; 875   uint16_t flagpos = 0;
2970                     ; 878   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2972  06d2 a32220        	cpw	x,#8736
2973  06d5 2714          	jreq	L062
2974  06d7 a32108        	cpw	x,#8456
2975  06da 270f          	jreq	L062
2976  06dc a32104        	cpw	x,#8452
2977  06df 270a          	jreq	L062
2978  06e1 a32102        	cpw	x,#8450
2979  06e4 2705          	jreq	L062
2980  06e6 a32101        	cpw	x,#8449
2981  06e9 2603          	jrne	L652
2982  06eb               L062:
2983  06eb 4f            	clr	a
2984  06ec 2010          	jra	L262
2985  06ee               L652:
2986  06ee ae036e        	ldw	x,#878
2987  06f1 89            	pushw	x
2988  06f2 ae0000        	ldw	x,#0
2989  06f5 89            	pushw	x
2990  06f6 ae000c        	ldw	x,#L131
2991  06f9 cd0000        	call	_assert_failed
2993  06fc 5b04          	addw	sp,#4
2994  06fe               L262:
2995                     ; 881   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2997  06fe 7b03          	ld	a,(OFST+1,sp)
2998  0700 97            	ld	xl,a
2999  0701 7b04          	ld	a,(OFST+2,sp)
3000  0703 a4ff          	and	a,#255
3001  0705 5f            	clrw	x
3002  0706 02            	rlwa	x,a
3003  0707 1f01          	ldw	(OFST-1,sp),x
3004  0709 01            	rrwa	x,a
3005                     ; 884   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
3007  070a 7b02          	ld	a,(OFST+0,sp)
3008  070c 43            	cpl	a
3009  070d c75218        	ld	21016,a
3010                     ; 885 }
3013  0710 5b04          	addw	sp,#4
3014  0712 81            	ret
3027                     	xdef	_I2C_ClearITPendingBit
3028                     	xdef	_I2C_GetITStatus
3029                     	xdef	_I2C_ClearFlag
3030                     	xdef	_I2C_GetFlagStatus
3031                     	xdef	_I2C_GetLastEvent
3032                     	xdef	_I2C_CheckEvent
3033                     	xdef	_I2C_SendData
3034                     	xdef	_I2C_Send7bitAddress
3035                     	xdef	_I2C_ReceiveData
3036                     	xdef	_I2C_ITConfig
3037                     	xdef	_I2C_FastModeDutyCycleConfig
3038                     	xdef	_I2C_AcknowledgeConfig
3039                     	xdef	_I2C_StretchClockCmd
3040                     	xdef	_I2C_SoftwareResetCmd
3041                     	xdef	_I2C_GenerateSTOP
3042                     	xdef	_I2C_GenerateSTART
3043                     	xdef	_I2C_GeneralCallCmd
3044                     	xdef	_I2C_Cmd
3045                     	xdef	_I2C_Init
3046                     	xdef	_I2C_DeInit
3047                     	xref	_assert_failed
3048                     	switch	.const
3049  000c               L131:
3050  000c 2e2e5c73746d  	dc.b	"..\stm8s_stdperiph"
3051  001e 5f6472697665  	dc.b	"_driver\src\stm8s_"
3052  0030 6932632e6300  	dc.b	"i2c.c",0
3053                     	xref.b	c_lreg
3054                     	xref.b	c_x
3074                     	xref	c_sdivx
3075                     	xref	c_ludv
3076                     	xref	c_rtol
3077                     	xref	c_smul
3078                     	xref	c_lmul
3079                     	xref	c_lcmp
3080                     	xref	c_ltor
3081                     	xref	c_lzmp
3082                     	end
