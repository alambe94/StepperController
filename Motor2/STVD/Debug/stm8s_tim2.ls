   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  44                     ; 46 void TIM2_DeInit(void)
  44                     ; 47 {
  46                     	switch	.text
  47  0000               _TIM2_DeInit:
  51                     ; 49     TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  53  0000 725f5300      	clr	21248
  54                     ; 50     TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  56  0004 725f5303      	clr	21251
  57                     ; 51     TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  59  0008 725f5305      	clr	21253
  60                     ; 54     TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  62  000c 725f530a      	clr	21258
  63                     ; 55     TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  65  0010 725f530b      	clr	21259
  66                     ; 59     TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  68  0014 725f530a      	clr	21258
  69                     ; 60     TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  71  0018 725f530b      	clr	21259
  72                     ; 61     TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  74  001c 725f5307      	clr	21255
  75                     ; 62     TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  77  0020 725f5308      	clr	21256
  78                     ; 63     TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  80  0024 725f5309      	clr	21257
  81                     ; 64     TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  83  0028 725f530c      	clr	21260
  84                     ; 65     TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  86  002c 725f530d      	clr	21261
  87                     ; 66     TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  89  0030 725f530e      	clr	21262
  90                     ; 67     TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  92  0034 35ff530f      	mov	21263,#255
  93                     ; 68     TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  95  0038 35ff5310      	mov	21264,#255
  96                     ; 69     TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
  98  003c 725f5311      	clr	21265
  99                     ; 70     TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 101  0040 725f5312      	clr	21266
 102                     ; 71     TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 104  0044 725f5313      	clr	21267
 105                     ; 72     TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 107  0048 725f5314      	clr	21268
 108                     ; 73     TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 110  004c 725f5315      	clr	21269
 111                     ; 74     TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 113  0050 725f5316      	clr	21270
 114                     ; 75     TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 116  0054 725f5304      	clr	21252
 117                     ; 76 }
 120  0058 81            	ret
 288                     ; 85 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 288                     ; 86                         uint16_t TIM2_Period)
 288                     ; 87 {
 289                     	switch	.text
 290  0059               _TIM2_TimeBaseInit:
 292  0059 88            	push	a
 293       00000000      OFST:	set	0
 296                     ; 89     TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 298  005a c7530e        	ld	21262,a
 299                     ; 91     TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 301  005d 7b04          	ld	a,(OFST+4,sp)
 302  005f c7530f        	ld	21263,a
 303                     ; 92     TIM2->ARRL = (uint8_t)(TIM2_Period);
 305  0062 7b05          	ld	a,(OFST+5,sp)
 306  0064 c75310        	ld	21264,a
 307                     ; 93 }
 310  0067 84            	pop	a
 311  0068 81            	ret
 469                     ; 104 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 469                     ; 105                   TIM2_OutputState_TypeDef TIM2_OutputState,
 469                     ; 106                   uint16_t TIM2_Pulse,
 469                     ; 107                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 469                     ; 108 {
 470                     	switch	.text
 471  0069               _TIM2_OC1Init:
 473  0069 89            	pushw	x
 474  006a 88            	push	a
 475       00000001      OFST:	set	1
 478                     ; 110     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 480  006b 9e            	ld	a,xh
 481  006c 4d            	tnz	a
 482  006d 2719          	jreq	L41
 483  006f 9e            	ld	a,xh
 484  0070 a110          	cp	a,#16
 485  0072 2714          	jreq	L41
 486  0074 9e            	ld	a,xh
 487  0075 a120          	cp	a,#32
 488  0077 270f          	jreq	L41
 489  0079 9e            	ld	a,xh
 490  007a a130          	cp	a,#48
 491  007c 270a          	jreq	L41
 492  007e 9e            	ld	a,xh
 493  007f a160          	cp	a,#96
 494  0081 2705          	jreq	L41
 495  0083 9e            	ld	a,xh
 496  0084 a170          	cp	a,#112
 497  0086 2603          	jrne	L21
 498  0088               L41:
 499  0088 4f            	clr	a
 500  0089 2010          	jra	L61
 501  008b               L21:
 502  008b ae006e        	ldw	x,#110
 503  008e 89            	pushw	x
 504  008f ae0000        	ldw	x,#0
 505  0092 89            	pushw	x
 506  0093 ae0000        	ldw	x,#L702
 507  0096 cd0000        	call	_assert_failed
 509  0099 5b04          	addw	sp,#4
 510  009b               L61:
 511                     ; 111     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 513  009b 0d03          	tnz	(OFST+2,sp)
 514  009d 2706          	jreq	L22
 515  009f 7b03          	ld	a,(OFST+2,sp)
 516  00a1 a111          	cp	a,#17
 517  00a3 2603          	jrne	L02
 518  00a5               L22:
 519  00a5 4f            	clr	a
 520  00a6 2010          	jra	L42
 521  00a8               L02:
 522  00a8 ae006f        	ldw	x,#111
 523  00ab 89            	pushw	x
 524  00ac ae0000        	ldw	x,#0
 525  00af 89            	pushw	x
 526  00b0 ae0000        	ldw	x,#L702
 527  00b3 cd0000        	call	_assert_failed
 529  00b6 5b04          	addw	sp,#4
 530  00b8               L42:
 531                     ; 112     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 533  00b8 0d08          	tnz	(OFST+7,sp)
 534  00ba 2706          	jreq	L03
 535  00bc 7b08          	ld	a,(OFST+7,sp)
 536  00be a122          	cp	a,#34
 537  00c0 2603          	jrne	L62
 538  00c2               L03:
 539  00c2 4f            	clr	a
 540  00c3 2010          	jra	L23
 541  00c5               L62:
 542  00c5 ae0070        	ldw	x,#112
 543  00c8 89            	pushw	x
 544  00c9 ae0000        	ldw	x,#0
 545  00cc 89            	pushw	x
 546  00cd ae0000        	ldw	x,#L702
 547  00d0 cd0000        	call	_assert_failed
 549  00d3 5b04          	addw	sp,#4
 550  00d5               L23:
 551                     ; 115     TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 553  00d5 c6530a        	ld	a,21258
 554  00d8 a4fc          	and	a,#252
 555  00da c7530a        	ld	21258,a
 556                     ; 117     TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 556                     ; 118                              (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 558  00dd 7b08          	ld	a,(OFST+7,sp)
 559  00df a402          	and	a,#2
 560  00e1 6b01          	ld	(OFST+0,sp),a
 561  00e3 7b03          	ld	a,(OFST+2,sp)
 562  00e5 a401          	and	a,#1
 563  00e7 1a01          	or	a,(OFST+0,sp)
 564  00e9 ca530a        	or	a,21258
 565  00ec c7530a        	ld	21258,a
 566                     ; 121     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 566                     ; 122                             (uint8_t)TIM2_OCMode);
 568  00ef c65307        	ld	a,21255
 569  00f2 a48f          	and	a,#143
 570  00f4 1a02          	or	a,(OFST+1,sp)
 571  00f6 c75307        	ld	21255,a
 572                     ; 125     TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 574  00f9 7b06          	ld	a,(OFST+5,sp)
 575  00fb c75311        	ld	21265,a
 576                     ; 126     TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 578  00fe 7b07          	ld	a,(OFST+6,sp)
 579  0100 c75312        	ld	21266,a
 580                     ; 127 }
 583  0103 5b03          	addw	sp,#3
 584  0105 81            	ret
 649                     ; 138 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 649                     ; 139                   TIM2_OutputState_TypeDef TIM2_OutputState,
 649                     ; 140                   uint16_t TIM2_Pulse,
 649                     ; 141                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 649                     ; 142 {
 650                     	switch	.text
 651  0106               _TIM2_OC2Init:
 653  0106 89            	pushw	x
 654  0107 88            	push	a
 655       00000001      OFST:	set	1
 658                     ; 144     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 660  0108 9e            	ld	a,xh
 661  0109 4d            	tnz	a
 662  010a 2719          	jreq	L04
 663  010c 9e            	ld	a,xh
 664  010d a110          	cp	a,#16
 665  010f 2714          	jreq	L04
 666  0111 9e            	ld	a,xh
 667  0112 a120          	cp	a,#32
 668  0114 270f          	jreq	L04
 669  0116 9e            	ld	a,xh
 670  0117 a130          	cp	a,#48
 671  0119 270a          	jreq	L04
 672  011b 9e            	ld	a,xh
 673  011c a160          	cp	a,#96
 674  011e 2705          	jreq	L04
 675  0120 9e            	ld	a,xh
 676  0121 a170          	cp	a,#112
 677  0123 2603          	jrne	L63
 678  0125               L04:
 679  0125 4f            	clr	a
 680  0126 2010          	jra	L24
 681  0128               L63:
 682  0128 ae0090        	ldw	x,#144
 683  012b 89            	pushw	x
 684  012c ae0000        	ldw	x,#0
 685  012f 89            	pushw	x
 686  0130 ae0000        	ldw	x,#L702
 687  0133 cd0000        	call	_assert_failed
 689  0136 5b04          	addw	sp,#4
 690  0138               L24:
 691                     ; 145     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 693  0138 0d03          	tnz	(OFST+2,sp)
 694  013a 2706          	jreq	L64
 695  013c 7b03          	ld	a,(OFST+2,sp)
 696  013e a111          	cp	a,#17
 697  0140 2603          	jrne	L44
 698  0142               L64:
 699  0142 4f            	clr	a
 700  0143 2010          	jra	L05
 701  0145               L44:
 702  0145 ae0091        	ldw	x,#145
 703  0148 89            	pushw	x
 704  0149 ae0000        	ldw	x,#0
 705  014c 89            	pushw	x
 706  014d ae0000        	ldw	x,#L702
 707  0150 cd0000        	call	_assert_failed
 709  0153 5b04          	addw	sp,#4
 710  0155               L05:
 711                     ; 146     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 713  0155 0d08          	tnz	(OFST+7,sp)
 714  0157 2706          	jreq	L45
 715  0159 7b08          	ld	a,(OFST+7,sp)
 716  015b a122          	cp	a,#34
 717  015d 2603          	jrne	L25
 718  015f               L45:
 719  015f 4f            	clr	a
 720  0160 2010          	jra	L65
 721  0162               L25:
 722  0162 ae0092        	ldw	x,#146
 723  0165 89            	pushw	x
 724  0166 ae0000        	ldw	x,#0
 725  0169 89            	pushw	x
 726  016a ae0000        	ldw	x,#L702
 727  016d cd0000        	call	_assert_failed
 729  0170 5b04          	addw	sp,#4
 730  0172               L65:
 731                     ; 150     TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 733  0172 c6530a        	ld	a,21258
 734  0175 a4cf          	and	a,#207
 735  0177 c7530a        	ld	21258,a
 736                     ; 152     TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 736                     ; 153                         (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 738  017a 7b08          	ld	a,(OFST+7,sp)
 739  017c a420          	and	a,#32
 740  017e 6b01          	ld	(OFST+0,sp),a
 741  0180 7b03          	ld	a,(OFST+2,sp)
 742  0182 a410          	and	a,#16
 743  0184 1a01          	or	a,(OFST+0,sp)
 744  0186 ca530a        	or	a,21258
 745  0189 c7530a        	ld	21258,a
 746                     ; 157     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 746                     ; 158                             (uint8_t)TIM2_OCMode);
 748  018c c65308        	ld	a,21256
 749  018f a48f          	and	a,#143
 750  0191 1a02          	or	a,(OFST+1,sp)
 751  0193 c75308        	ld	21256,a
 752                     ; 162     TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 754  0196 7b06          	ld	a,(OFST+5,sp)
 755  0198 c75313        	ld	21267,a
 756                     ; 163     TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 758  019b 7b07          	ld	a,(OFST+6,sp)
 759  019d c75314        	ld	21268,a
 760                     ; 164 }
 763  01a0 5b03          	addw	sp,#3
 764  01a2 81            	ret
 829                     ; 175 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 829                     ; 176                   TIM2_OutputState_TypeDef TIM2_OutputState,
 829                     ; 177                   uint16_t TIM2_Pulse,
 829                     ; 178                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 829                     ; 179 {
 830                     	switch	.text
 831  01a3               _TIM2_OC3Init:
 833  01a3 89            	pushw	x
 834  01a4 88            	push	a
 835       00000001      OFST:	set	1
 838                     ; 181     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 840  01a5 9e            	ld	a,xh
 841  01a6 4d            	tnz	a
 842  01a7 2719          	jreq	L46
 843  01a9 9e            	ld	a,xh
 844  01aa a110          	cp	a,#16
 845  01ac 2714          	jreq	L46
 846  01ae 9e            	ld	a,xh
 847  01af a120          	cp	a,#32
 848  01b1 270f          	jreq	L46
 849  01b3 9e            	ld	a,xh
 850  01b4 a130          	cp	a,#48
 851  01b6 270a          	jreq	L46
 852  01b8 9e            	ld	a,xh
 853  01b9 a160          	cp	a,#96
 854  01bb 2705          	jreq	L46
 855  01bd 9e            	ld	a,xh
 856  01be a170          	cp	a,#112
 857  01c0 2603          	jrne	L26
 858  01c2               L46:
 859  01c2 4f            	clr	a
 860  01c3 2010          	jra	L66
 861  01c5               L26:
 862  01c5 ae00b5        	ldw	x,#181
 863  01c8 89            	pushw	x
 864  01c9 ae0000        	ldw	x,#0
 865  01cc 89            	pushw	x
 866  01cd ae0000        	ldw	x,#L702
 867  01d0 cd0000        	call	_assert_failed
 869  01d3 5b04          	addw	sp,#4
 870  01d5               L66:
 871                     ; 182     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 873  01d5 0d03          	tnz	(OFST+2,sp)
 874  01d7 2706          	jreq	L27
 875  01d9 7b03          	ld	a,(OFST+2,sp)
 876  01db a111          	cp	a,#17
 877  01dd 2603          	jrne	L07
 878  01df               L27:
 879  01df 4f            	clr	a
 880  01e0 2010          	jra	L47
 881  01e2               L07:
 882  01e2 ae00b6        	ldw	x,#182
 883  01e5 89            	pushw	x
 884  01e6 ae0000        	ldw	x,#0
 885  01e9 89            	pushw	x
 886  01ea ae0000        	ldw	x,#L702
 887  01ed cd0000        	call	_assert_failed
 889  01f0 5b04          	addw	sp,#4
 890  01f2               L47:
 891                     ; 183     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 893  01f2 0d08          	tnz	(OFST+7,sp)
 894  01f4 2706          	jreq	L001
 895  01f6 7b08          	ld	a,(OFST+7,sp)
 896  01f8 a122          	cp	a,#34
 897  01fa 2603          	jrne	L67
 898  01fc               L001:
 899  01fc 4f            	clr	a
 900  01fd 2010          	jra	L201
 901  01ff               L67:
 902  01ff ae00b7        	ldw	x,#183
 903  0202 89            	pushw	x
 904  0203 ae0000        	ldw	x,#0
 905  0206 89            	pushw	x
 906  0207 ae0000        	ldw	x,#L702
 907  020a cd0000        	call	_assert_failed
 909  020d 5b04          	addw	sp,#4
 910  020f               L201:
 911                     ; 185     TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 913  020f c6530b        	ld	a,21259
 914  0212 a4fc          	and	a,#252
 915  0214 c7530b        	ld	21259,a
 916                     ; 187     TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 918  0217 7b08          	ld	a,(OFST+7,sp)
 919  0219 a402          	and	a,#2
 920  021b 6b01          	ld	(OFST+0,sp),a
 921  021d 7b03          	ld	a,(OFST+2,sp)
 922  021f a401          	and	a,#1
 923  0221 1a01          	or	a,(OFST+0,sp)
 924  0223 ca530b        	or	a,21259
 925  0226 c7530b        	ld	21259,a
 926                     ; 190     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 926                     ; 191                             (uint8_t)TIM2_OCMode);
 928  0229 c65309        	ld	a,21257
 929  022c a48f          	and	a,#143
 930  022e 1a02          	or	a,(OFST+1,sp)
 931  0230 c75309        	ld	21257,a
 932                     ; 194     TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 934  0233 7b06          	ld	a,(OFST+5,sp)
 935  0235 c75315        	ld	21269,a
 936                     ; 195     TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 938  0238 7b07          	ld	a,(OFST+6,sp)
 939  023a c75316        	ld	21270,a
 940                     ; 197 }
 943  023d 5b03          	addw	sp,#3
 944  023f 81            	ret
1138                     ; 209 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
1138                     ; 210                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1138                     ; 211                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
1138                     ; 212                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1138                     ; 213                  uint8_t TIM2_ICFilter)
1138                     ; 214 {
1139                     	switch	.text
1140  0240               _TIM2_ICInit:
1142  0240 89            	pushw	x
1143       00000000      OFST:	set	0
1146                     ; 216     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
1148  0241 9e            	ld	a,xh
1149  0242 4d            	tnz	a
1150  0243 270a          	jreq	L011
1151  0245 9e            	ld	a,xh
1152  0246 a101          	cp	a,#1
1153  0248 2705          	jreq	L011
1154  024a 9e            	ld	a,xh
1155  024b a102          	cp	a,#2
1156  024d 2603          	jrne	L601
1157  024f               L011:
1158  024f 4f            	clr	a
1159  0250 2010          	jra	L211
1160  0252               L601:
1161  0252 ae00d8        	ldw	x,#216
1162  0255 89            	pushw	x
1163  0256 ae0000        	ldw	x,#0
1164  0259 89            	pushw	x
1165  025a ae0000        	ldw	x,#L702
1166  025d cd0000        	call	_assert_failed
1168  0260 5b04          	addw	sp,#4
1169  0262               L211:
1170                     ; 217     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1172  0262 0d02          	tnz	(OFST+2,sp)
1173  0264 2706          	jreq	L611
1174  0266 7b02          	ld	a,(OFST+2,sp)
1175  0268 a144          	cp	a,#68
1176  026a 2603          	jrne	L411
1177  026c               L611:
1178  026c 4f            	clr	a
1179  026d 2010          	jra	L021
1180  026f               L411:
1181  026f ae00d9        	ldw	x,#217
1182  0272 89            	pushw	x
1183  0273 ae0000        	ldw	x,#0
1184  0276 89            	pushw	x
1185  0277 ae0000        	ldw	x,#L702
1186  027a cd0000        	call	_assert_failed
1188  027d 5b04          	addw	sp,#4
1189  027f               L021:
1190                     ; 218     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1192  027f 7b05          	ld	a,(OFST+5,sp)
1193  0281 a101          	cp	a,#1
1194  0283 270c          	jreq	L421
1195  0285 7b05          	ld	a,(OFST+5,sp)
1196  0287 a102          	cp	a,#2
1197  0289 2706          	jreq	L421
1198  028b 7b05          	ld	a,(OFST+5,sp)
1199  028d a103          	cp	a,#3
1200  028f 2603          	jrne	L221
1201  0291               L421:
1202  0291 4f            	clr	a
1203  0292 2010          	jra	L621
1204  0294               L221:
1205  0294 ae00da        	ldw	x,#218
1206  0297 89            	pushw	x
1207  0298 ae0000        	ldw	x,#0
1208  029b 89            	pushw	x
1209  029c ae0000        	ldw	x,#L702
1210  029f cd0000        	call	_assert_failed
1212  02a2 5b04          	addw	sp,#4
1213  02a4               L621:
1214                     ; 219     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1216  02a4 0d06          	tnz	(OFST+6,sp)
1217  02a6 2712          	jreq	L231
1218  02a8 7b06          	ld	a,(OFST+6,sp)
1219  02aa a104          	cp	a,#4
1220  02ac 270c          	jreq	L231
1221  02ae 7b06          	ld	a,(OFST+6,sp)
1222  02b0 a108          	cp	a,#8
1223  02b2 2706          	jreq	L231
1224  02b4 7b06          	ld	a,(OFST+6,sp)
1225  02b6 a10c          	cp	a,#12
1226  02b8 2603          	jrne	L031
1227  02ba               L231:
1228  02ba 4f            	clr	a
1229  02bb 2010          	jra	L431
1230  02bd               L031:
1231  02bd ae00db        	ldw	x,#219
1232  02c0 89            	pushw	x
1233  02c1 ae0000        	ldw	x,#0
1234  02c4 89            	pushw	x
1235  02c5 ae0000        	ldw	x,#L702
1236  02c8 cd0000        	call	_assert_failed
1238  02cb 5b04          	addw	sp,#4
1239  02cd               L431:
1240                     ; 220     assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
1242  02cd 7b07          	ld	a,(OFST+7,sp)
1243  02cf a110          	cp	a,#16
1244  02d1 2403          	jruge	L631
1245  02d3 4f            	clr	a
1246  02d4 2010          	jra	L041
1247  02d6               L631:
1248  02d6 ae00dc        	ldw	x,#220
1249  02d9 89            	pushw	x
1250  02da ae0000        	ldw	x,#0
1251  02dd 89            	pushw	x
1252  02de ae0000        	ldw	x,#L702
1253  02e1 cd0000        	call	_assert_failed
1255  02e4 5b04          	addw	sp,#4
1256  02e6               L041:
1257                     ; 222     if (TIM2_Channel == TIM2_CHANNEL_1)
1259  02e6 0d01          	tnz	(OFST+1,sp)
1260  02e8 2614          	jrne	L304
1261                     ; 225         TI1_Config((uint8_t)TIM2_ICPolarity,
1261                     ; 226                    (uint8_t)TIM2_ICSelection,
1261                     ; 227                    (uint8_t)TIM2_ICFilter);
1263  02ea 7b07          	ld	a,(OFST+7,sp)
1264  02ec 88            	push	a
1265  02ed 7b06          	ld	a,(OFST+6,sp)
1266  02ef 97            	ld	xl,a
1267  02f0 7b03          	ld	a,(OFST+3,sp)
1268  02f2 95            	ld	xh,a
1269  02f3 cd0ad3        	call	L3_TI1_Config
1271  02f6 84            	pop	a
1272                     ; 230         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1274  02f7 7b06          	ld	a,(OFST+6,sp)
1275  02f9 cd08c3        	call	_TIM2_SetIC1Prescaler
1278  02fc 202c          	jra	L504
1279  02fe               L304:
1280                     ; 232     else if (TIM2_Channel == TIM2_CHANNEL_2)
1282  02fe 7b01          	ld	a,(OFST+1,sp)
1283  0300 a101          	cp	a,#1
1284  0302 2614          	jrne	L704
1285                     ; 235         TI2_Config((uint8_t)TIM2_ICPolarity,
1285                     ; 236                    (uint8_t)TIM2_ICSelection,
1285                     ; 237                    (uint8_t)TIM2_ICFilter);
1287  0304 7b07          	ld	a,(OFST+7,sp)
1288  0306 88            	push	a
1289  0307 7b06          	ld	a,(OFST+6,sp)
1290  0309 97            	ld	xl,a
1291  030a 7b03          	ld	a,(OFST+3,sp)
1292  030c 95            	ld	xh,a
1293  030d cd0b03        	call	L5_TI2_Config
1295  0310 84            	pop	a
1296                     ; 240         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1298  0311 7b06          	ld	a,(OFST+6,sp)
1299  0313 cd08f2        	call	_TIM2_SetIC2Prescaler
1302  0316 2012          	jra	L504
1303  0318               L704:
1304                     ; 245         TI3_Config((uint8_t)TIM2_ICPolarity,
1304                     ; 246                    (uint8_t)TIM2_ICSelection,
1304                     ; 247                    (uint8_t)TIM2_ICFilter);
1306  0318 7b07          	ld	a,(OFST+7,sp)
1307  031a 88            	push	a
1308  031b 7b06          	ld	a,(OFST+6,sp)
1309  031d 97            	ld	xl,a
1310  031e 7b03          	ld	a,(OFST+3,sp)
1311  0320 95            	ld	xh,a
1312  0321 cd0b33        	call	L7_TI3_Config
1314  0324 84            	pop	a
1315                     ; 250         TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1317  0325 7b06          	ld	a,(OFST+6,sp)
1318  0327 cd0921        	call	_TIM2_SetIC3Prescaler
1320  032a               L504:
1321                     ; 252 }
1324  032a 85            	popw	x
1325  032b 81            	ret
1422                     ; 264 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1422                     ; 265                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1422                     ; 266                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1422                     ; 267                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1422                     ; 268                      uint8_t TIM2_ICFilter)
1422                     ; 269 {
1423                     	switch	.text
1424  032c               _TIM2_PWMIConfig:
1426  032c 89            	pushw	x
1427  032d 89            	pushw	x
1428       00000002      OFST:	set	2
1431                     ; 270     uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1433                     ; 271     uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1435                     ; 274     assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1437  032e 9e            	ld	a,xh
1438  032f 4d            	tnz	a
1439  0330 2705          	jreq	L641
1440  0332 9e            	ld	a,xh
1441  0333 a101          	cp	a,#1
1442  0335 2603          	jrne	L441
1443  0337               L641:
1444  0337 4f            	clr	a
1445  0338 2010          	jra	L051
1446  033a               L441:
1447  033a ae0112        	ldw	x,#274
1448  033d 89            	pushw	x
1449  033e ae0000        	ldw	x,#0
1450  0341 89            	pushw	x
1451  0342 ae0000        	ldw	x,#L702
1452  0345 cd0000        	call	_assert_failed
1454  0348 5b04          	addw	sp,#4
1455  034a               L051:
1456                     ; 275     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1458  034a 0d04          	tnz	(OFST+2,sp)
1459  034c 2706          	jreq	L451
1460  034e 7b04          	ld	a,(OFST+2,sp)
1461  0350 a144          	cp	a,#68
1462  0352 2603          	jrne	L251
1463  0354               L451:
1464  0354 4f            	clr	a
1465  0355 2010          	jra	L651
1466  0357               L251:
1467  0357 ae0113        	ldw	x,#275
1468  035a 89            	pushw	x
1469  035b ae0000        	ldw	x,#0
1470  035e 89            	pushw	x
1471  035f ae0000        	ldw	x,#L702
1472  0362 cd0000        	call	_assert_failed
1474  0365 5b04          	addw	sp,#4
1475  0367               L651:
1476                     ; 276     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1478  0367 7b07          	ld	a,(OFST+5,sp)
1479  0369 a101          	cp	a,#1
1480  036b 270c          	jreq	L261
1481  036d 7b07          	ld	a,(OFST+5,sp)
1482  036f a102          	cp	a,#2
1483  0371 2706          	jreq	L261
1484  0373 7b07          	ld	a,(OFST+5,sp)
1485  0375 a103          	cp	a,#3
1486  0377 2603          	jrne	L061
1487  0379               L261:
1488  0379 4f            	clr	a
1489  037a 2010          	jra	L461
1490  037c               L061:
1491  037c ae0114        	ldw	x,#276
1492  037f 89            	pushw	x
1493  0380 ae0000        	ldw	x,#0
1494  0383 89            	pushw	x
1495  0384 ae0000        	ldw	x,#L702
1496  0387 cd0000        	call	_assert_failed
1498  038a 5b04          	addw	sp,#4
1499  038c               L461:
1500                     ; 277     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1502  038c 0d08          	tnz	(OFST+6,sp)
1503  038e 2712          	jreq	L071
1504  0390 7b08          	ld	a,(OFST+6,sp)
1505  0392 a104          	cp	a,#4
1506  0394 270c          	jreq	L071
1507  0396 7b08          	ld	a,(OFST+6,sp)
1508  0398 a108          	cp	a,#8
1509  039a 2706          	jreq	L071
1510  039c 7b08          	ld	a,(OFST+6,sp)
1511  039e a10c          	cp	a,#12
1512  03a0 2603          	jrne	L661
1513  03a2               L071:
1514  03a2 4f            	clr	a
1515  03a3 2010          	jra	L271
1516  03a5               L661:
1517  03a5 ae0115        	ldw	x,#277
1518  03a8 89            	pushw	x
1519  03a9 ae0000        	ldw	x,#0
1520  03ac 89            	pushw	x
1521  03ad ae0000        	ldw	x,#L702
1522  03b0 cd0000        	call	_assert_failed
1524  03b3 5b04          	addw	sp,#4
1525  03b5               L271:
1526                     ; 280     if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1528  03b5 7b04          	ld	a,(OFST+2,sp)
1529  03b7 a144          	cp	a,#68
1530  03b9 2706          	jreq	L164
1531                     ; 282         icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1533  03bb a644          	ld	a,#68
1534  03bd 6b01          	ld	(OFST-1,sp),a
1536  03bf 2002          	jra	L364
1537  03c1               L164:
1538                     ; 286         icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1540  03c1 0f01          	clr	(OFST-1,sp)
1541  03c3               L364:
1542                     ; 290     if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1544  03c3 7b07          	ld	a,(OFST+5,sp)
1545  03c5 a101          	cp	a,#1
1546  03c7 2606          	jrne	L564
1547                     ; 292         icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1549  03c9 a602          	ld	a,#2
1550  03cb 6b02          	ld	(OFST+0,sp),a
1552  03cd 2004          	jra	L764
1553  03cf               L564:
1554                     ; 296         icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1556  03cf a601          	ld	a,#1
1557  03d1 6b02          	ld	(OFST+0,sp),a
1558  03d3               L764:
1559                     ; 299     if (TIM2_Channel == TIM2_CHANNEL_1)
1561  03d3 0d03          	tnz	(OFST+1,sp)
1562  03d5 2626          	jrne	L174
1563                     ; 302         TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1563                     ; 303                    (uint8_t)TIM2_ICFilter);
1565  03d7 7b09          	ld	a,(OFST+7,sp)
1566  03d9 88            	push	a
1567  03da 7b08          	ld	a,(OFST+6,sp)
1568  03dc 97            	ld	xl,a
1569  03dd 7b05          	ld	a,(OFST+3,sp)
1570  03df 95            	ld	xh,a
1571  03e0 cd0ad3        	call	L3_TI1_Config
1573  03e3 84            	pop	a
1574                     ; 306         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1576  03e4 7b08          	ld	a,(OFST+6,sp)
1577  03e6 cd08c3        	call	_TIM2_SetIC1Prescaler
1579                     ; 309         TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1581  03e9 7b09          	ld	a,(OFST+7,sp)
1582  03eb 88            	push	a
1583  03ec 7b03          	ld	a,(OFST+1,sp)
1584  03ee 97            	ld	xl,a
1585  03ef 7b02          	ld	a,(OFST+0,sp)
1586  03f1 95            	ld	xh,a
1587  03f2 cd0b03        	call	L5_TI2_Config
1589  03f5 84            	pop	a
1590                     ; 312         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1592  03f6 7b08          	ld	a,(OFST+6,sp)
1593  03f8 cd08f2        	call	_TIM2_SetIC2Prescaler
1596  03fb 2024          	jra	L374
1597  03fd               L174:
1598                     ; 317         TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1598                     ; 318                    (uint8_t)TIM2_ICFilter);
1600  03fd 7b09          	ld	a,(OFST+7,sp)
1601  03ff 88            	push	a
1602  0400 7b08          	ld	a,(OFST+6,sp)
1603  0402 97            	ld	xl,a
1604  0403 7b05          	ld	a,(OFST+3,sp)
1605  0405 95            	ld	xh,a
1606  0406 cd0b03        	call	L5_TI2_Config
1608  0409 84            	pop	a
1609                     ; 321         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1611  040a 7b08          	ld	a,(OFST+6,sp)
1612  040c cd08f2        	call	_TIM2_SetIC2Prescaler
1614                     ; 324         TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1616  040f 7b09          	ld	a,(OFST+7,sp)
1617  0411 88            	push	a
1618  0412 7b03          	ld	a,(OFST+1,sp)
1619  0414 97            	ld	xl,a
1620  0415 7b02          	ld	a,(OFST+0,sp)
1621  0417 95            	ld	xh,a
1622  0418 cd0ad3        	call	L3_TI1_Config
1624  041b 84            	pop	a
1625                     ; 327         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1627  041c 7b08          	ld	a,(OFST+6,sp)
1628  041e cd08c3        	call	_TIM2_SetIC1Prescaler
1630  0421               L374:
1631                     ; 329 }
1634  0421 5b04          	addw	sp,#4
1635  0423 81            	ret
1691                     ; 338 void TIM2_Cmd(FunctionalState NewState)
1691                     ; 339 {
1692                     	switch	.text
1693  0424               _TIM2_Cmd:
1695  0424 88            	push	a
1696       00000000      OFST:	set	0
1699                     ; 341     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1701  0425 4d            	tnz	a
1702  0426 2704          	jreq	L002
1703  0428 a101          	cp	a,#1
1704  042a 2603          	jrne	L671
1705  042c               L002:
1706  042c 4f            	clr	a
1707  042d 2010          	jra	L202
1708  042f               L671:
1709  042f ae0155        	ldw	x,#341
1710  0432 89            	pushw	x
1711  0433 ae0000        	ldw	x,#0
1712  0436 89            	pushw	x
1713  0437 ae0000        	ldw	x,#L702
1714  043a cd0000        	call	_assert_failed
1716  043d 5b04          	addw	sp,#4
1717  043f               L202:
1718                     ; 344     if (NewState != DISABLE)
1720  043f 0d01          	tnz	(OFST+1,sp)
1721  0441 2706          	jreq	L325
1722                     ; 346         TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1724  0443 72105300      	bset	21248,#0
1726  0447 2004          	jra	L525
1727  0449               L325:
1728                     ; 350         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1730  0449 72115300      	bres	21248,#0
1731  044d               L525:
1732                     ; 352 }
1735  044d 84            	pop	a
1736  044e 81            	ret
1816                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1816                     ; 369 {
1817                     	switch	.text
1818  044f               _TIM2_ITConfig:
1820  044f 89            	pushw	x
1821       00000000      OFST:	set	0
1824                     ; 371     assert_param(IS_TIM2_IT_OK(TIM2_IT));
1826  0450 9e            	ld	a,xh
1827  0451 4d            	tnz	a
1828  0452 2708          	jreq	L602
1829  0454 9e            	ld	a,xh
1830  0455 a110          	cp	a,#16
1831  0457 2403          	jruge	L602
1832  0459 4f            	clr	a
1833  045a 2010          	jra	L012
1834  045c               L602:
1835  045c ae0173        	ldw	x,#371
1836  045f 89            	pushw	x
1837  0460 ae0000        	ldw	x,#0
1838  0463 89            	pushw	x
1839  0464 ae0000        	ldw	x,#L702
1840  0467 cd0000        	call	_assert_failed
1842  046a 5b04          	addw	sp,#4
1843  046c               L012:
1844                     ; 372     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1846  046c 0d02          	tnz	(OFST+2,sp)
1847  046e 2706          	jreq	L412
1848  0470 7b02          	ld	a,(OFST+2,sp)
1849  0472 a101          	cp	a,#1
1850  0474 2603          	jrne	L212
1851  0476               L412:
1852  0476 4f            	clr	a
1853  0477 2010          	jra	L612
1854  0479               L212:
1855  0479 ae0174        	ldw	x,#372
1856  047c 89            	pushw	x
1857  047d ae0000        	ldw	x,#0
1858  0480 89            	pushw	x
1859  0481 ae0000        	ldw	x,#L702
1860  0484 cd0000        	call	_assert_failed
1862  0487 5b04          	addw	sp,#4
1863  0489               L612:
1864                     ; 374     if (NewState != DISABLE)
1866  0489 0d02          	tnz	(OFST+2,sp)
1867  048b 270a          	jreq	L565
1868                     ; 377         TIM2->IER |= (uint8_t)TIM2_IT;
1870  048d c65303        	ld	a,21251
1871  0490 1a01          	or	a,(OFST+1,sp)
1872  0492 c75303        	ld	21251,a
1874  0495 2009          	jra	L765
1875  0497               L565:
1876                     ; 382         TIM2->IER &= (uint8_t)(~TIM2_IT);
1878  0497 7b01          	ld	a,(OFST+1,sp)
1879  0499 43            	cpl	a
1880  049a c45303        	and	a,21251
1881  049d c75303        	ld	21251,a
1882  04a0               L765:
1883                     ; 384 }
1886  04a0 85            	popw	x
1887  04a1 81            	ret
1924                     ; 393 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1924                     ; 394 {
1925                     	switch	.text
1926  04a2               _TIM2_UpdateDisableConfig:
1928  04a2 88            	push	a
1929       00000000      OFST:	set	0
1932                     ; 396     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1934  04a3 4d            	tnz	a
1935  04a4 2704          	jreq	L422
1936  04a6 a101          	cp	a,#1
1937  04a8 2603          	jrne	L222
1938  04aa               L422:
1939  04aa 4f            	clr	a
1940  04ab 2010          	jra	L622
1941  04ad               L222:
1942  04ad ae018c        	ldw	x,#396
1943  04b0 89            	pushw	x
1944  04b1 ae0000        	ldw	x,#0
1945  04b4 89            	pushw	x
1946  04b5 ae0000        	ldw	x,#L702
1947  04b8 cd0000        	call	_assert_failed
1949  04bb 5b04          	addw	sp,#4
1950  04bd               L622:
1951                     ; 399     if (NewState != DISABLE)
1953  04bd 0d01          	tnz	(OFST+1,sp)
1954  04bf 2706          	jreq	L706
1955                     ; 401         TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1957  04c1 72125300      	bset	21248,#1
1959  04c5 2004          	jra	L116
1960  04c7               L706:
1961                     ; 405         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1963  04c7 72135300      	bres	21248,#1
1964  04cb               L116:
1965                     ; 407 }
1968  04cb 84            	pop	a
1969  04cc 81            	ret
2028                     ; 417 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
2028                     ; 418 {
2029                     	switch	.text
2030  04cd               _TIM2_UpdateRequestConfig:
2032  04cd 88            	push	a
2033       00000000      OFST:	set	0
2036                     ; 420     assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
2038  04ce 4d            	tnz	a
2039  04cf 2704          	jreq	L432
2040  04d1 a101          	cp	a,#1
2041  04d3 2603          	jrne	L232
2042  04d5               L432:
2043  04d5 4f            	clr	a
2044  04d6 2010          	jra	L632
2045  04d8               L232:
2046  04d8 ae01a4        	ldw	x,#420
2047  04db 89            	pushw	x
2048  04dc ae0000        	ldw	x,#0
2049  04df 89            	pushw	x
2050  04e0 ae0000        	ldw	x,#L702
2051  04e3 cd0000        	call	_assert_failed
2053  04e6 5b04          	addw	sp,#4
2054  04e8               L632:
2055                     ; 423     if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
2057  04e8 0d01          	tnz	(OFST+1,sp)
2058  04ea 2706          	jreq	L146
2059                     ; 425         TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
2061  04ec 72145300      	bset	21248,#2
2063  04f0 2004          	jra	L346
2064  04f2               L146:
2065                     ; 429         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
2067  04f2 72155300      	bres	21248,#2
2068  04f6               L346:
2069                     ; 431 }
2072  04f6 84            	pop	a
2073  04f7 81            	ret
2131                     ; 442 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
2131                     ; 443 {
2132                     	switch	.text
2133  04f8               _TIM2_SelectOnePulseMode:
2135  04f8 88            	push	a
2136       00000000      OFST:	set	0
2139                     ; 445     assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
2141  04f9 a101          	cp	a,#1
2142  04fb 2703          	jreq	L442
2143  04fd 4d            	tnz	a
2144  04fe 2603          	jrne	L242
2145  0500               L442:
2146  0500 4f            	clr	a
2147  0501 2010          	jra	L642
2148  0503               L242:
2149  0503 ae01bd        	ldw	x,#445
2150  0506 89            	pushw	x
2151  0507 ae0000        	ldw	x,#0
2152  050a 89            	pushw	x
2153  050b ae0000        	ldw	x,#L702
2154  050e cd0000        	call	_assert_failed
2156  0511 5b04          	addw	sp,#4
2157  0513               L642:
2158                     ; 448     if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
2160  0513 0d01          	tnz	(OFST+1,sp)
2161  0515 2706          	jreq	L376
2162                     ; 450         TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
2164  0517 72165300      	bset	21248,#3
2166  051b 2004          	jra	L576
2167  051d               L376:
2168                     ; 454         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
2170  051d 72175300      	bres	21248,#3
2171  0521               L576:
2172                     ; 457 }
2175  0521 84            	pop	a
2176  0522 81            	ret
2245                     ; 488 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
2245                     ; 489                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
2245                     ; 490 {
2246                     	switch	.text
2247  0523               _TIM2_PrescalerConfig:
2249  0523 89            	pushw	x
2250       00000000      OFST:	set	0
2253                     ; 492     assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
2255  0524 9f            	ld	a,xl
2256  0525 4d            	tnz	a
2257  0526 2705          	jreq	L452
2258  0528 9f            	ld	a,xl
2259  0529 a101          	cp	a,#1
2260  052b 2603          	jrne	L252
2261  052d               L452:
2262  052d 4f            	clr	a
2263  052e 2010          	jra	L652
2264  0530               L252:
2265  0530 ae01ec        	ldw	x,#492
2266  0533 89            	pushw	x
2267  0534 ae0000        	ldw	x,#0
2268  0537 89            	pushw	x
2269  0538 ae0000        	ldw	x,#L702
2270  053b cd0000        	call	_assert_failed
2272  053e 5b04          	addw	sp,#4
2273  0540               L652:
2274                     ; 493     assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
2276  0540 0d01          	tnz	(OFST+1,sp)
2277  0542 275a          	jreq	L262
2278  0544 7b01          	ld	a,(OFST+1,sp)
2279  0546 a101          	cp	a,#1
2280  0548 2754          	jreq	L262
2281  054a 7b01          	ld	a,(OFST+1,sp)
2282  054c a102          	cp	a,#2
2283  054e 274e          	jreq	L262
2284  0550 7b01          	ld	a,(OFST+1,sp)
2285  0552 a103          	cp	a,#3
2286  0554 2748          	jreq	L262
2287  0556 7b01          	ld	a,(OFST+1,sp)
2288  0558 a104          	cp	a,#4
2289  055a 2742          	jreq	L262
2290  055c 7b01          	ld	a,(OFST+1,sp)
2291  055e a105          	cp	a,#5
2292  0560 273c          	jreq	L262
2293  0562 7b01          	ld	a,(OFST+1,sp)
2294  0564 a106          	cp	a,#6
2295  0566 2736          	jreq	L262
2296  0568 7b01          	ld	a,(OFST+1,sp)
2297  056a a107          	cp	a,#7
2298  056c 2730          	jreq	L262
2299  056e 7b01          	ld	a,(OFST+1,sp)
2300  0570 a108          	cp	a,#8
2301  0572 272a          	jreq	L262
2302  0574 7b01          	ld	a,(OFST+1,sp)
2303  0576 a109          	cp	a,#9
2304  0578 2724          	jreq	L262
2305  057a 7b01          	ld	a,(OFST+1,sp)
2306  057c a10a          	cp	a,#10
2307  057e 271e          	jreq	L262
2308  0580 7b01          	ld	a,(OFST+1,sp)
2309  0582 a10b          	cp	a,#11
2310  0584 2718          	jreq	L262
2311  0586 7b01          	ld	a,(OFST+1,sp)
2312  0588 a10c          	cp	a,#12
2313  058a 2712          	jreq	L262
2314  058c 7b01          	ld	a,(OFST+1,sp)
2315  058e a10d          	cp	a,#13
2316  0590 270c          	jreq	L262
2317  0592 7b01          	ld	a,(OFST+1,sp)
2318  0594 a10e          	cp	a,#14
2319  0596 2706          	jreq	L262
2320  0598 7b01          	ld	a,(OFST+1,sp)
2321  059a a10f          	cp	a,#15
2322  059c 2603          	jrne	L062
2323  059e               L262:
2324  059e 4f            	clr	a
2325  059f 2010          	jra	L462
2326  05a1               L062:
2327  05a1 ae01ed        	ldw	x,#493
2328  05a4 89            	pushw	x
2329  05a5 ae0000        	ldw	x,#0
2330  05a8 89            	pushw	x
2331  05a9 ae0000        	ldw	x,#L702
2332  05ac cd0000        	call	_assert_failed
2334  05af 5b04          	addw	sp,#4
2335  05b1               L462:
2336                     ; 496     TIM2->PSCR = (uint8_t)Prescaler;
2338  05b1 7b01          	ld	a,(OFST+1,sp)
2339  05b3 c7530e        	ld	21262,a
2340                     ; 499     TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
2342  05b6 7b02          	ld	a,(OFST+2,sp)
2343  05b8 c75306        	ld	21254,a
2344                     ; 500 }
2347  05bb 85            	popw	x
2348  05bc 81            	ret
2407                     ; 511 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2407                     ; 512 {
2408                     	switch	.text
2409  05bd               _TIM2_ForcedOC1Config:
2411  05bd 88            	push	a
2412       00000000      OFST:	set	0
2415                     ; 514     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2417  05be a150          	cp	a,#80
2418  05c0 2704          	jreq	L272
2419  05c2 a140          	cp	a,#64
2420  05c4 2603          	jrne	L072
2421  05c6               L272:
2422  05c6 4f            	clr	a
2423  05c7 2010          	jra	L472
2424  05c9               L072:
2425  05c9 ae0202        	ldw	x,#514
2426  05cc 89            	pushw	x
2427  05cd ae0000        	ldw	x,#0
2428  05d0 89            	pushw	x
2429  05d1 ae0000        	ldw	x,#L702
2430  05d4 cd0000        	call	_assert_failed
2432  05d7 5b04          	addw	sp,#4
2433  05d9               L472:
2434                     ; 517     TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
2434                     ; 518                               | (uint8_t)TIM2_ForcedAction);
2436  05d9 c65307        	ld	a,21255
2437  05dc a48f          	and	a,#143
2438  05de 1a01          	or	a,(OFST+1,sp)
2439  05e0 c75307        	ld	21255,a
2440                     ; 519 }
2443  05e3 84            	pop	a
2444  05e4 81            	ret
2481                     ; 530 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2481                     ; 531 {
2482                     	switch	.text
2483  05e5               _TIM2_ForcedOC2Config:
2485  05e5 88            	push	a
2486       00000000      OFST:	set	0
2489                     ; 533     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2491  05e6 a150          	cp	a,#80
2492  05e8 2704          	jreq	L203
2493  05ea a140          	cp	a,#64
2494  05ec 2603          	jrne	L003
2495  05ee               L203:
2496  05ee 4f            	clr	a
2497  05ef 2010          	jra	L403
2498  05f1               L003:
2499  05f1 ae0215        	ldw	x,#533
2500  05f4 89            	pushw	x
2501  05f5 ae0000        	ldw	x,#0
2502  05f8 89            	pushw	x
2503  05f9 ae0000        	ldw	x,#L702
2504  05fc cd0000        	call	_assert_failed
2506  05ff 5b04          	addw	sp,#4
2507  0601               L403:
2508                     ; 536     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
2508                     ; 537                             | (uint8_t)TIM2_ForcedAction);
2510  0601 c65308        	ld	a,21256
2511  0604 a48f          	and	a,#143
2512  0606 1a01          	or	a,(OFST+1,sp)
2513  0608 c75308        	ld	21256,a
2514                     ; 538 }
2517  060b 84            	pop	a
2518  060c 81            	ret
2555                     ; 549 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2555                     ; 550 {
2556                     	switch	.text
2557  060d               _TIM2_ForcedOC3Config:
2559  060d 88            	push	a
2560       00000000      OFST:	set	0
2563                     ; 552     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2565  060e a150          	cp	a,#80
2566  0610 2704          	jreq	L213
2567  0612 a140          	cp	a,#64
2568  0614 2603          	jrne	L013
2569  0616               L213:
2570  0616 4f            	clr	a
2571  0617 2010          	jra	L413
2572  0619               L013:
2573  0619 ae0228        	ldw	x,#552
2574  061c 89            	pushw	x
2575  061d ae0000        	ldw	x,#0
2576  0620 89            	pushw	x
2577  0621 ae0000        	ldw	x,#L702
2578  0624 cd0000        	call	_assert_failed
2580  0627 5b04          	addw	sp,#4
2581  0629               L413:
2582                     ; 555     TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2582                     ; 556                               | (uint8_t)TIM2_ForcedAction);
2584  0629 c65309        	ld	a,21257
2585  062c a48f          	and	a,#143
2586  062e 1a01          	or	a,(OFST+1,sp)
2587  0630 c75309        	ld	21257,a
2588                     ; 557 }
2591  0633 84            	pop	a
2592  0634 81            	ret
2629                     ; 566 void TIM2_ARRPreloadConfig(FunctionalState NewState)
2629                     ; 567 {
2630                     	switch	.text
2631  0635               _TIM2_ARRPreloadConfig:
2633  0635 88            	push	a
2634       00000000      OFST:	set	0
2637                     ; 569     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2639  0636 4d            	tnz	a
2640  0637 2704          	jreq	L223
2641  0639 a101          	cp	a,#1
2642  063b 2603          	jrne	L023
2643  063d               L223:
2644  063d 4f            	clr	a
2645  063e 2010          	jra	L423
2646  0640               L023:
2647  0640 ae0239        	ldw	x,#569
2648  0643 89            	pushw	x
2649  0644 ae0000        	ldw	x,#0
2650  0647 89            	pushw	x
2651  0648 ae0000        	ldw	x,#L702
2652  064b cd0000        	call	_assert_failed
2654  064e 5b04          	addw	sp,#4
2655  0650               L423:
2656                     ; 572     if (NewState != DISABLE)
2658  0650 0d01          	tnz	(OFST+1,sp)
2659  0652 2706          	jreq	L1301
2660                     ; 574         TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
2662  0654 721e5300      	bset	21248,#7
2664  0658 2004          	jra	L3301
2665  065a               L1301:
2666                     ; 578         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2668  065a 721f5300      	bres	21248,#7
2669  065e               L3301:
2670                     ; 580 }
2673  065e 84            	pop	a
2674  065f 81            	ret
2711                     ; 589 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2711                     ; 590 {
2712                     	switch	.text
2713  0660               _TIM2_OC1PreloadConfig:
2715  0660 88            	push	a
2716       00000000      OFST:	set	0
2719                     ; 592     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2721  0661 4d            	tnz	a
2722  0662 2704          	jreq	L233
2723  0664 a101          	cp	a,#1
2724  0666 2603          	jrne	L033
2725  0668               L233:
2726  0668 4f            	clr	a
2727  0669 2010          	jra	L433
2728  066b               L033:
2729  066b ae0250        	ldw	x,#592
2730  066e 89            	pushw	x
2731  066f ae0000        	ldw	x,#0
2732  0672 89            	pushw	x
2733  0673 ae0000        	ldw	x,#L702
2734  0676 cd0000        	call	_assert_failed
2736  0679 5b04          	addw	sp,#4
2737  067b               L433:
2738                     ; 595     if (NewState != DISABLE)
2740  067b 0d01          	tnz	(OFST+1,sp)
2741  067d 2706          	jreq	L3501
2742                     ; 597         TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2744  067f 72165307      	bset	21255,#3
2746  0683 2004          	jra	L5501
2747  0685               L3501:
2748                     ; 601         TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2750  0685 72175307      	bres	21255,#3
2751  0689               L5501:
2752                     ; 603 }
2755  0689 84            	pop	a
2756  068a 81            	ret
2793                     ; 612 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2793                     ; 613 {
2794                     	switch	.text
2795  068b               _TIM2_OC2PreloadConfig:
2797  068b 88            	push	a
2798       00000000      OFST:	set	0
2801                     ; 615     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2803  068c 4d            	tnz	a
2804  068d 2704          	jreq	L243
2805  068f a101          	cp	a,#1
2806  0691 2603          	jrne	L043
2807  0693               L243:
2808  0693 4f            	clr	a
2809  0694 2010          	jra	L443
2810  0696               L043:
2811  0696 ae0267        	ldw	x,#615
2812  0699 89            	pushw	x
2813  069a ae0000        	ldw	x,#0
2814  069d 89            	pushw	x
2815  069e ae0000        	ldw	x,#L702
2816  06a1 cd0000        	call	_assert_failed
2818  06a4 5b04          	addw	sp,#4
2819  06a6               L443:
2820                     ; 618     if (NewState != DISABLE)
2822  06a6 0d01          	tnz	(OFST+1,sp)
2823  06a8 2706          	jreq	L5701
2824                     ; 620         TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2826  06aa 72165308      	bset	21256,#3
2828  06ae 2004          	jra	L7701
2829  06b0               L5701:
2830                     ; 624         TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2832  06b0 72175308      	bres	21256,#3
2833  06b4               L7701:
2834                     ; 626 }
2837  06b4 84            	pop	a
2838  06b5 81            	ret
2875                     ; 635 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2875                     ; 636 {
2876                     	switch	.text
2877  06b6               _TIM2_OC3PreloadConfig:
2879  06b6 88            	push	a
2880       00000000      OFST:	set	0
2883                     ; 638     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2885  06b7 4d            	tnz	a
2886  06b8 2704          	jreq	L253
2887  06ba a101          	cp	a,#1
2888  06bc 2603          	jrne	L053
2889  06be               L253:
2890  06be 4f            	clr	a
2891  06bf 2010          	jra	L453
2892  06c1               L053:
2893  06c1 ae027e        	ldw	x,#638
2894  06c4 89            	pushw	x
2895  06c5 ae0000        	ldw	x,#0
2896  06c8 89            	pushw	x
2897  06c9 ae0000        	ldw	x,#L702
2898  06cc cd0000        	call	_assert_failed
2900  06cf 5b04          	addw	sp,#4
2901  06d1               L453:
2902                     ; 641     if (NewState != DISABLE)
2904  06d1 0d01          	tnz	(OFST+1,sp)
2905  06d3 2706          	jreq	L7111
2906                     ; 643         TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2908  06d5 72165309      	bset	21257,#3
2910  06d9 2004          	jra	L1211
2911  06db               L7111:
2912                     ; 647         TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2914  06db 72175309      	bres	21257,#3
2915  06df               L1211:
2916                     ; 649 }
2919  06df 84            	pop	a
2920  06e0 81            	ret
2994                     ; 662 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2994                     ; 663 {
2995                     	switch	.text
2996  06e1               _TIM2_GenerateEvent:
2998  06e1 88            	push	a
2999       00000000      OFST:	set	0
3002                     ; 665     assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
3004  06e2 4d            	tnz	a
3005  06e3 2703          	jreq	L063
3006  06e5 4f            	clr	a
3007  06e6 2010          	jra	L263
3008  06e8               L063:
3009  06e8 ae0299        	ldw	x,#665
3010  06eb 89            	pushw	x
3011  06ec ae0000        	ldw	x,#0
3012  06ef 89            	pushw	x
3013  06f0 ae0000        	ldw	x,#L702
3014  06f3 cd0000        	call	_assert_failed
3016  06f6 5b04          	addw	sp,#4
3017  06f8               L263:
3018                     ; 668     TIM2->EGR = (uint8_t)TIM2_EventSource;
3020  06f8 7b01          	ld	a,(OFST+1,sp)
3021  06fa c75306        	ld	21254,a
3022                     ; 669 }
3025  06fd 84            	pop	a
3026  06fe 81            	ret
3063                     ; 680 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3063                     ; 681 {
3064                     	switch	.text
3065  06ff               _TIM2_OC1PolarityConfig:
3067  06ff 88            	push	a
3068       00000000      OFST:	set	0
3071                     ; 683     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3073  0700 4d            	tnz	a
3074  0701 2704          	jreq	L073
3075  0703 a122          	cp	a,#34
3076  0705 2603          	jrne	L663
3077  0707               L073:
3078  0707 4f            	clr	a
3079  0708 2010          	jra	L273
3080  070a               L663:
3081  070a ae02ab        	ldw	x,#683
3082  070d 89            	pushw	x
3083  070e ae0000        	ldw	x,#0
3084  0711 89            	pushw	x
3085  0712 ae0000        	ldw	x,#L702
3086  0715 cd0000        	call	_assert_failed
3088  0718 5b04          	addw	sp,#4
3089  071a               L273:
3090                     ; 686     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3092  071a 0d01          	tnz	(OFST+1,sp)
3093  071c 2706          	jreq	L3711
3094                     ; 688         TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
3096  071e 7212530a      	bset	21258,#1
3098  0722 2004          	jra	L5711
3099  0724               L3711:
3100                     ; 692         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3102  0724 7213530a      	bres	21258,#1
3103  0728               L5711:
3104                     ; 694 }
3107  0728 84            	pop	a
3108  0729 81            	ret
3145                     ; 705 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3145                     ; 706 {
3146                     	switch	.text
3147  072a               _TIM2_OC2PolarityConfig:
3149  072a 88            	push	a
3150       00000000      OFST:	set	0
3153                     ; 708     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3155  072b 4d            	tnz	a
3156  072c 2704          	jreq	L004
3157  072e a122          	cp	a,#34
3158  0730 2603          	jrne	L673
3159  0732               L004:
3160  0732 4f            	clr	a
3161  0733 2010          	jra	L204
3162  0735               L673:
3163  0735 ae02c4        	ldw	x,#708
3164  0738 89            	pushw	x
3165  0739 ae0000        	ldw	x,#0
3166  073c 89            	pushw	x
3167  073d ae0000        	ldw	x,#L702
3168  0740 cd0000        	call	_assert_failed
3170  0743 5b04          	addw	sp,#4
3171  0745               L204:
3172                     ; 711     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3174  0745 0d01          	tnz	(OFST+1,sp)
3175  0747 2706          	jreq	L5121
3176                     ; 713         TIM2->CCER1 |= TIM2_CCER1_CC2P;
3178  0749 721a530a      	bset	21258,#5
3180  074d 2004          	jra	L7121
3181  074f               L5121:
3182                     ; 717         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
3184  074f 721b530a      	bres	21258,#5
3185  0753               L7121:
3186                     ; 719 }
3189  0753 84            	pop	a
3190  0754 81            	ret
3227                     ; 730 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3227                     ; 731 {
3228                     	switch	.text
3229  0755               _TIM2_OC3PolarityConfig:
3231  0755 88            	push	a
3232       00000000      OFST:	set	0
3235                     ; 733     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3237  0756 4d            	tnz	a
3238  0757 2704          	jreq	L014
3239  0759 a122          	cp	a,#34
3240  075b 2603          	jrne	L604
3241  075d               L014:
3242  075d 4f            	clr	a
3243  075e 2010          	jra	L214
3244  0760               L604:
3245  0760 ae02dd        	ldw	x,#733
3246  0763 89            	pushw	x
3247  0764 ae0000        	ldw	x,#0
3248  0767 89            	pushw	x
3249  0768 ae0000        	ldw	x,#L702
3250  076b cd0000        	call	_assert_failed
3252  076e 5b04          	addw	sp,#4
3253  0770               L214:
3254                     ; 736     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3256  0770 0d01          	tnz	(OFST+1,sp)
3257  0772 2706          	jreq	L7321
3258                     ; 738         TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
3260  0774 7212530b      	bset	21259,#1
3262  0778 2004          	jra	L1421
3263  077a               L7321:
3264                     ; 742         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
3266  077a 7213530b      	bres	21259,#1
3267  077e               L1421:
3268                     ; 744 }
3271  077e 84            	pop	a
3272  077f 81            	ret
3318                     ; 758 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
3318                     ; 759 {
3319                     	switch	.text
3320  0780               _TIM2_CCxCmd:
3322  0780 89            	pushw	x
3323       00000000      OFST:	set	0
3326                     ; 761     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3328  0781 9e            	ld	a,xh
3329  0782 4d            	tnz	a
3330  0783 270a          	jreq	L024
3331  0785 9e            	ld	a,xh
3332  0786 a101          	cp	a,#1
3333  0788 2705          	jreq	L024
3334  078a 9e            	ld	a,xh
3335  078b a102          	cp	a,#2
3336  078d 2603          	jrne	L614
3337  078f               L024:
3338  078f 4f            	clr	a
3339  0790 2010          	jra	L224
3340  0792               L614:
3341  0792 ae02f9        	ldw	x,#761
3342  0795 89            	pushw	x
3343  0796 ae0000        	ldw	x,#0
3344  0799 89            	pushw	x
3345  079a ae0000        	ldw	x,#L702
3346  079d cd0000        	call	_assert_failed
3348  07a0 5b04          	addw	sp,#4
3349  07a2               L224:
3350                     ; 762     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3352  07a2 0d02          	tnz	(OFST+2,sp)
3353  07a4 2706          	jreq	L624
3354  07a6 7b02          	ld	a,(OFST+2,sp)
3355  07a8 a101          	cp	a,#1
3356  07aa 2603          	jrne	L424
3357  07ac               L624:
3358  07ac 4f            	clr	a
3359  07ad 2010          	jra	L034
3360  07af               L424:
3361  07af ae02fa        	ldw	x,#762
3362  07b2 89            	pushw	x
3363  07b3 ae0000        	ldw	x,#0
3364  07b6 89            	pushw	x
3365  07b7 ae0000        	ldw	x,#L702
3366  07ba cd0000        	call	_assert_failed
3368  07bd 5b04          	addw	sp,#4
3369  07bf               L034:
3370                     ; 764     if (TIM2_Channel == TIM2_CHANNEL_1)
3372  07bf 0d01          	tnz	(OFST+1,sp)
3373  07c1 2610          	jrne	L5621
3374                     ; 767         if (NewState != DISABLE)
3376  07c3 0d02          	tnz	(OFST+2,sp)
3377  07c5 2706          	jreq	L7621
3378                     ; 769             TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
3380  07c7 7210530a      	bset	21258,#0
3382  07cb 202a          	jra	L3721
3383  07cd               L7621:
3384                     ; 773             TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3386  07cd 7211530a      	bres	21258,#0
3387  07d1 2024          	jra	L3721
3388  07d3               L5621:
3389                     ; 777     else if (TIM2_Channel == TIM2_CHANNEL_2)
3391  07d3 7b01          	ld	a,(OFST+1,sp)
3392  07d5 a101          	cp	a,#1
3393  07d7 2610          	jrne	L5721
3394                     ; 780         if (NewState != DISABLE)
3396  07d9 0d02          	tnz	(OFST+2,sp)
3397  07db 2706          	jreq	L7721
3398                     ; 782             TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
3400  07dd 7218530a      	bset	21258,#4
3402  07e1 2014          	jra	L3721
3403  07e3               L7721:
3404                     ; 786             TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3406  07e3 7219530a      	bres	21258,#4
3407  07e7 200e          	jra	L3721
3408  07e9               L5721:
3409                     ; 792         if (NewState != DISABLE)
3411  07e9 0d02          	tnz	(OFST+2,sp)
3412  07eb 2706          	jreq	L5031
3413                     ; 794             TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
3415  07ed 7210530b      	bset	21259,#0
3417  07f1 2004          	jra	L3721
3418  07f3               L5031:
3419                     ; 798             TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3421  07f3 7211530b      	bres	21259,#0
3422  07f7               L3721:
3423                     ; 801 }
3426  07f7 85            	popw	x
3427  07f8 81            	ret
3473                     ; 823 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
3473                     ; 824 {
3474                     	switch	.text
3475  07f9               _TIM2_SelectOCxM:
3477  07f9 89            	pushw	x
3478       00000000      OFST:	set	0
3481                     ; 826     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3483  07fa 9e            	ld	a,xh
3484  07fb 4d            	tnz	a
3485  07fc 270a          	jreq	L634
3486  07fe 9e            	ld	a,xh
3487  07ff a101          	cp	a,#1
3488  0801 2705          	jreq	L634
3489  0803 9e            	ld	a,xh
3490  0804 a102          	cp	a,#2
3491  0806 2603          	jrne	L434
3492  0808               L634:
3493  0808 4f            	clr	a
3494  0809 2010          	jra	L044
3495  080b               L434:
3496  080b ae033a        	ldw	x,#826
3497  080e 89            	pushw	x
3498  080f ae0000        	ldw	x,#0
3499  0812 89            	pushw	x
3500  0813 ae0000        	ldw	x,#L702
3501  0816 cd0000        	call	_assert_failed
3503  0819 5b04          	addw	sp,#4
3504  081b               L044:
3505                     ; 827     assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
3507  081b 0d02          	tnz	(OFST+2,sp)
3508  081d 272a          	jreq	L444
3509  081f 7b02          	ld	a,(OFST+2,sp)
3510  0821 a110          	cp	a,#16
3511  0823 2724          	jreq	L444
3512  0825 7b02          	ld	a,(OFST+2,sp)
3513  0827 a120          	cp	a,#32
3514  0829 271e          	jreq	L444
3515  082b 7b02          	ld	a,(OFST+2,sp)
3516  082d a130          	cp	a,#48
3517  082f 2718          	jreq	L444
3518  0831 7b02          	ld	a,(OFST+2,sp)
3519  0833 a160          	cp	a,#96
3520  0835 2712          	jreq	L444
3521  0837 7b02          	ld	a,(OFST+2,sp)
3522  0839 a170          	cp	a,#112
3523  083b 270c          	jreq	L444
3524  083d 7b02          	ld	a,(OFST+2,sp)
3525  083f a150          	cp	a,#80
3526  0841 2706          	jreq	L444
3527  0843 7b02          	ld	a,(OFST+2,sp)
3528  0845 a140          	cp	a,#64
3529  0847 2603          	jrne	L244
3530  0849               L444:
3531  0849 4f            	clr	a
3532  084a 2010          	jra	L644
3533  084c               L244:
3534  084c ae033b        	ldw	x,#827
3535  084f 89            	pushw	x
3536  0850 ae0000        	ldw	x,#0
3537  0853 89            	pushw	x
3538  0854 ae0000        	ldw	x,#L702
3539  0857 cd0000        	call	_assert_failed
3541  085a 5b04          	addw	sp,#4
3542  085c               L644:
3543                     ; 829     if (TIM2_Channel == TIM2_CHANNEL_1)
3545  085c 0d01          	tnz	(OFST+1,sp)
3546  085e 2610          	jrne	L3331
3547                     ; 832         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3549  0860 7211530a      	bres	21258,#0
3550                     ; 835         TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
3550                     ; 836                                | (uint8_t)TIM2_OCMode);
3552  0864 c65307        	ld	a,21255
3553  0867 a48f          	and	a,#143
3554  0869 1a02          	or	a,(OFST+2,sp)
3555  086b c75307        	ld	21255,a
3557  086e 2024          	jra	L5331
3558  0870               L3331:
3559                     ; 838     else if (TIM2_Channel == TIM2_CHANNEL_2)
3561  0870 7b01          	ld	a,(OFST+1,sp)
3562  0872 a101          	cp	a,#1
3563  0874 2610          	jrne	L7331
3564                     ; 841         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3566  0876 7219530a      	bres	21258,#4
3567                     ; 844         TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
3567                     ; 845                                 | (uint8_t)TIM2_OCMode);
3569  087a c65308        	ld	a,21256
3570  087d a48f          	and	a,#143
3571  087f 1a02          	or	a,(OFST+2,sp)
3572  0881 c75308        	ld	21256,a
3574  0884 200e          	jra	L5331
3575  0886               L7331:
3576                     ; 850         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3578  0886 7211530b      	bres	21259,#0
3579                     ; 853         TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
3579                     ; 854                                 | (uint8_t)TIM2_OCMode);
3581  088a c65309        	ld	a,21257
3582  088d a48f          	and	a,#143
3583  088f 1a02          	or	a,(OFST+2,sp)
3584  0891 c75309        	ld	21257,a
3585  0894               L5331:
3586                     ; 856 }
3589  0894 85            	popw	x
3590  0895 81            	ret
3624                     ; 865 void TIM2_SetCounter(uint16_t Counter)
3624                     ; 866 {
3625                     	switch	.text
3626  0896               _TIM2_SetCounter:
3630                     ; 868     TIM2->CNTRH = (uint8_t)(Counter >> 8);
3632  0896 9e            	ld	a,xh
3633  0897 c7530c        	ld	21260,a
3634                     ; 869     TIM2->CNTRL = (uint8_t)(Counter);
3636  089a 9f            	ld	a,xl
3637  089b c7530d        	ld	21261,a
3638                     ; 871 }
3641  089e 81            	ret
3675                     ; 880 void TIM2_SetAutoreload(uint16_t Autoreload)
3675                     ; 881 {
3676                     	switch	.text
3677  089f               _TIM2_SetAutoreload:
3681                     ; 884     TIM2->ARRH = (uint8_t)(Autoreload >> 8);
3683  089f 9e            	ld	a,xh
3684  08a0 c7530f        	ld	21263,a
3685                     ; 885     TIM2->ARRL = (uint8_t)(Autoreload);
3687  08a3 9f            	ld	a,xl
3688  08a4 c75310        	ld	21264,a
3689                     ; 887 }
3692  08a7 81            	ret
3726                     ; 896 void TIM2_SetCompare1(uint16_t Compare1)
3726                     ; 897 {
3727                     	switch	.text
3728  08a8               _TIM2_SetCompare1:
3732                     ; 899     TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
3734  08a8 9e            	ld	a,xh
3735  08a9 c75311        	ld	21265,a
3736                     ; 900     TIM2->CCR1L = (uint8_t)(Compare1);
3738  08ac 9f            	ld	a,xl
3739  08ad c75312        	ld	21266,a
3740                     ; 902 }
3743  08b0 81            	ret
3777                     ; 911 void TIM2_SetCompare2(uint16_t Compare2)
3777                     ; 912 {
3778                     	switch	.text
3779  08b1               _TIM2_SetCompare2:
3783                     ; 914     TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
3785  08b1 9e            	ld	a,xh
3786  08b2 c75313        	ld	21267,a
3787                     ; 915     TIM2->CCR2L = (uint8_t)(Compare2);
3789  08b5 9f            	ld	a,xl
3790  08b6 c75314        	ld	21268,a
3791                     ; 917 }
3794  08b9 81            	ret
3828                     ; 926 void TIM2_SetCompare3(uint16_t Compare3)
3828                     ; 927 {
3829                     	switch	.text
3830  08ba               _TIM2_SetCompare3:
3834                     ; 929     TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
3836  08ba 9e            	ld	a,xh
3837  08bb c75315        	ld	21269,a
3838                     ; 930     TIM2->CCR3L = (uint8_t)(Compare3);
3840  08be 9f            	ld	a,xl
3841  08bf c75316        	ld	21270,a
3842                     ; 932 }
3845  08c2 81            	ret
3882                     ; 945 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
3882                     ; 946 {
3883                     	switch	.text
3884  08c3               _TIM2_SetIC1Prescaler:
3886  08c3 88            	push	a
3887       00000000      OFST:	set	0
3890                     ; 948     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
3892  08c4 4d            	tnz	a
3893  08c5 270c          	jreq	L664
3894  08c7 a104          	cp	a,#4
3895  08c9 2708          	jreq	L664
3896  08cb a108          	cp	a,#8
3897  08cd 2704          	jreq	L664
3898  08cf a10c          	cp	a,#12
3899  08d1 2603          	jrne	L464
3900  08d3               L664:
3901  08d3 4f            	clr	a
3902  08d4 2010          	jra	L074
3903  08d6               L464:
3904  08d6 ae03b4        	ldw	x,#948
3905  08d9 89            	pushw	x
3906  08da ae0000        	ldw	x,#0
3907  08dd 89            	pushw	x
3908  08de ae0000        	ldw	x,#L702
3909  08e1 cd0000        	call	_assert_failed
3911  08e4 5b04          	addw	sp,#4
3912  08e6               L074:
3913                     ; 951     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3913                     ; 952                             | (uint8_t)TIM2_IC1Prescaler);
3915  08e6 c65307        	ld	a,21255
3916  08e9 a4f3          	and	a,#243
3917  08eb 1a01          	or	a,(OFST+1,sp)
3918  08ed c75307        	ld	21255,a
3919                     ; 953 }
3922  08f0 84            	pop	a
3923  08f1 81            	ret
3960                     ; 965 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3960                     ; 966 {
3961                     	switch	.text
3962  08f2               _TIM2_SetIC2Prescaler:
3964  08f2 88            	push	a
3965       00000000      OFST:	set	0
3968                     ; 968     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3970  08f3 4d            	tnz	a
3971  08f4 270c          	jreq	L674
3972  08f6 a104          	cp	a,#4
3973  08f8 2708          	jreq	L674
3974  08fa a108          	cp	a,#8
3975  08fc 2704          	jreq	L674
3976  08fe a10c          	cp	a,#12
3977  0900 2603          	jrne	L474
3978  0902               L674:
3979  0902 4f            	clr	a
3980  0903 2010          	jra	L005
3981  0905               L474:
3982  0905 ae03c8        	ldw	x,#968
3983  0908 89            	pushw	x
3984  0909 ae0000        	ldw	x,#0
3985  090c 89            	pushw	x
3986  090d ae0000        	ldw	x,#L702
3987  0910 cd0000        	call	_assert_failed
3989  0913 5b04          	addw	sp,#4
3990  0915               L005:
3991                     ; 971     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3991                     ; 972                             | (uint8_t)TIM2_IC2Prescaler);
3993  0915 c65308        	ld	a,21256
3994  0918 a4f3          	and	a,#243
3995  091a 1a01          	or	a,(OFST+1,sp)
3996  091c c75308        	ld	21256,a
3997                     ; 973 }
4000  091f 84            	pop	a
4001  0920 81            	ret
4038                     ; 985 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
4038                     ; 986 {
4039                     	switch	.text
4040  0921               _TIM2_SetIC3Prescaler:
4042  0921 88            	push	a
4043       00000000      OFST:	set	0
4046                     ; 989     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
4048  0922 4d            	tnz	a
4049  0923 270c          	jreq	L605
4050  0925 a104          	cp	a,#4
4051  0927 2708          	jreq	L605
4052  0929 a108          	cp	a,#8
4053  092b 2704          	jreq	L605
4054  092d a10c          	cp	a,#12
4055  092f 2603          	jrne	L405
4056  0931               L605:
4057  0931 4f            	clr	a
4058  0932 2010          	jra	L015
4059  0934               L405:
4060  0934 ae03dd        	ldw	x,#989
4061  0937 89            	pushw	x
4062  0938 ae0000        	ldw	x,#0
4063  093b 89            	pushw	x
4064  093c ae0000        	ldw	x,#L702
4065  093f cd0000        	call	_assert_failed
4067  0942 5b04          	addw	sp,#4
4068  0944               L015:
4069                     ; 991     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
4069                     ; 992                             | (uint8_t)TIM2_IC3Prescaler);
4071  0944 c65309        	ld	a,21257
4072  0947 a4f3          	and	a,#243
4073  0949 1a01          	or	a,(OFST+1,sp)
4074  094b c75309        	ld	21257,a
4075                     ; 993 }
4078  094e 84            	pop	a
4079  094f 81            	ret
4131                     ; 1000 uint16_t TIM2_GetCapture1(void)
4131                     ; 1001 {
4132                     	switch	.text
4133  0950               _TIM2_GetCapture1:
4135  0950 5204          	subw	sp,#4
4136       00000004      OFST:	set	4
4139                     ; 1003     uint16_t tmpccr1 = 0;
4141                     ; 1004     uint8_t tmpccr1l=0, tmpccr1h=0;
4145                     ; 1006     tmpccr1h = TIM2->CCR1H;
4147  0952 c65311        	ld	a,21265
4148  0955 6b02          	ld	(OFST-2,sp),a
4149                     ; 1007     tmpccr1l = TIM2->CCR1L;
4151  0957 c65312        	ld	a,21266
4152  095a 6b01          	ld	(OFST-3,sp),a
4153                     ; 1009     tmpccr1 = (uint16_t)(tmpccr1l);
4155  095c 7b01          	ld	a,(OFST-3,sp)
4156  095e 5f            	clrw	x
4157  095f 97            	ld	xl,a
4158  0960 1f03          	ldw	(OFST-1,sp),x
4159                     ; 1010     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4161  0962 7b02          	ld	a,(OFST-2,sp)
4162  0964 5f            	clrw	x
4163  0965 97            	ld	xl,a
4164  0966 4f            	clr	a
4165  0967 02            	rlwa	x,a
4166  0968 01            	rrwa	x,a
4167  0969 1a04          	or	a,(OFST+0,sp)
4168  096b 01            	rrwa	x,a
4169  096c 1a03          	or	a,(OFST-1,sp)
4170  096e 01            	rrwa	x,a
4171  096f 1f03          	ldw	(OFST-1,sp),x
4172                     ; 1012     return (uint16_t)tmpccr1;
4174  0971 1e03          	ldw	x,(OFST-1,sp)
4177  0973 5b04          	addw	sp,#4
4178  0975 81            	ret
4230                     ; 1020 uint16_t TIM2_GetCapture2(void)
4230                     ; 1021 {
4231                     	switch	.text
4232  0976               _TIM2_GetCapture2:
4234  0976 5204          	subw	sp,#4
4235       00000004      OFST:	set	4
4238                     ; 1023     uint16_t tmpccr2 = 0;
4240                     ; 1024     uint8_t tmpccr2l=0, tmpccr2h=0;
4244                     ; 1026     tmpccr2h = TIM2->CCR2H;
4246  0978 c65313        	ld	a,21267
4247  097b 6b02          	ld	(OFST-2,sp),a
4248                     ; 1027     tmpccr2l = TIM2->CCR2L;
4250  097d c65314        	ld	a,21268
4251  0980 6b01          	ld	(OFST-3,sp),a
4252                     ; 1029     tmpccr2 = (uint16_t)(tmpccr2l);
4254  0982 7b01          	ld	a,(OFST-3,sp)
4255  0984 5f            	clrw	x
4256  0985 97            	ld	xl,a
4257  0986 1f03          	ldw	(OFST-1,sp),x
4258                     ; 1030     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4260  0988 7b02          	ld	a,(OFST-2,sp)
4261  098a 5f            	clrw	x
4262  098b 97            	ld	xl,a
4263  098c 4f            	clr	a
4264  098d 02            	rlwa	x,a
4265  098e 01            	rrwa	x,a
4266  098f 1a04          	or	a,(OFST+0,sp)
4267  0991 01            	rrwa	x,a
4268  0992 1a03          	or	a,(OFST-1,sp)
4269  0994 01            	rrwa	x,a
4270  0995 1f03          	ldw	(OFST-1,sp),x
4271                     ; 1032     return (uint16_t)tmpccr2;
4273  0997 1e03          	ldw	x,(OFST-1,sp)
4276  0999 5b04          	addw	sp,#4
4277  099b 81            	ret
4329                     ; 1040 uint16_t TIM2_GetCapture3(void)
4329                     ; 1041 {
4330                     	switch	.text
4331  099c               _TIM2_GetCapture3:
4333  099c 5204          	subw	sp,#4
4334       00000004      OFST:	set	4
4337                     ; 1043     uint16_t tmpccr3 = 0;
4339                     ; 1044     uint8_t tmpccr3l=0, tmpccr3h=0;
4343                     ; 1046     tmpccr3h = TIM2->CCR3H;
4345  099e c65315        	ld	a,21269
4346  09a1 6b02          	ld	(OFST-2,sp),a
4347                     ; 1047     tmpccr3l = TIM2->CCR3L;
4349  09a3 c65316        	ld	a,21270
4350  09a6 6b01          	ld	(OFST-3,sp),a
4351                     ; 1049     tmpccr3 = (uint16_t)(tmpccr3l);
4353  09a8 7b01          	ld	a,(OFST-3,sp)
4354  09aa 5f            	clrw	x
4355  09ab 97            	ld	xl,a
4356  09ac 1f03          	ldw	(OFST-1,sp),x
4357                     ; 1050     tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4359  09ae 7b02          	ld	a,(OFST-2,sp)
4360  09b0 5f            	clrw	x
4361  09b1 97            	ld	xl,a
4362  09b2 4f            	clr	a
4363  09b3 02            	rlwa	x,a
4364  09b4 01            	rrwa	x,a
4365  09b5 1a04          	or	a,(OFST+0,sp)
4366  09b7 01            	rrwa	x,a
4367  09b8 1a03          	or	a,(OFST-1,sp)
4368  09ba 01            	rrwa	x,a
4369  09bb 1f03          	ldw	(OFST-1,sp),x
4370                     ; 1052     return (uint16_t)tmpccr3;
4372  09bd 1e03          	ldw	x,(OFST-1,sp)
4375  09bf 5b04          	addw	sp,#4
4376  09c1 81            	ret
4410                     ; 1060 uint16_t TIM2_GetCounter(void)
4410                     ; 1061 {
4411                     	switch	.text
4412  09c2               _TIM2_GetCounter:
4414  09c2 89            	pushw	x
4415       00000002      OFST:	set	2
4418                     ; 1062      uint16_t tmpcntr = 0;
4420                     ; 1064     tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
4422  09c3 c6530c        	ld	a,21260
4423  09c6 5f            	clrw	x
4424  09c7 97            	ld	xl,a
4425  09c8 4f            	clr	a
4426  09c9 02            	rlwa	x,a
4427  09ca 1f01          	ldw	(OFST-1,sp),x
4428                     ; 1066     return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
4430  09cc c6530d        	ld	a,21261
4431  09cf 5f            	clrw	x
4432  09d0 97            	ld	xl,a
4433  09d1 01            	rrwa	x,a
4434  09d2 1a02          	or	a,(OFST+0,sp)
4435  09d4 01            	rrwa	x,a
4436  09d5 1a01          	or	a,(OFST-1,sp)
4437  09d7 01            	rrwa	x,a
4440  09d8 5b02          	addw	sp,#2
4441  09da 81            	ret
4465                     ; 1075 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
4465                     ; 1076 {
4466                     	switch	.text
4467  09db               _TIM2_GetPrescaler:
4471                     ; 1078     return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
4473  09db c6530e        	ld	a,21262
4476  09de 81            	ret
4616                     ; 1095 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
4616                     ; 1096 {
4617                     	switch	.text
4618  09df               _TIM2_GetFlagStatus:
4620  09df 89            	pushw	x
4621  09e0 89            	pushw	x
4622       00000002      OFST:	set	2
4625                     ; 1097     FlagStatus bitstatus = RESET;
4627                     ; 1098     uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
4631                     ; 1101     assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
4633  09e1 a30001        	cpw	x,#1
4634  09e4 271e          	jreq	L035
4635  09e6 a30002        	cpw	x,#2
4636  09e9 2719          	jreq	L035
4637  09eb a30004        	cpw	x,#4
4638  09ee 2714          	jreq	L035
4639  09f0 a30008        	cpw	x,#8
4640  09f3 270f          	jreq	L035
4641  09f5 a30200        	cpw	x,#512
4642  09f8 270a          	jreq	L035
4643  09fa a30400        	cpw	x,#1024
4644  09fd 2705          	jreq	L035
4645  09ff a30800        	cpw	x,#2048
4646  0a02 2603          	jrne	L625
4647  0a04               L035:
4648  0a04 4f            	clr	a
4649  0a05 2010          	jra	L235
4650  0a07               L625:
4651  0a07 ae044d        	ldw	x,#1101
4652  0a0a 89            	pushw	x
4653  0a0b ae0000        	ldw	x,#0
4654  0a0e 89            	pushw	x
4655  0a0f ae0000        	ldw	x,#L702
4656  0a12 cd0000        	call	_assert_failed
4658  0a15 5b04          	addw	sp,#4
4659  0a17               L235:
4660                     ; 1103     tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
4662  0a17 c65304        	ld	a,21252
4663  0a1a 1404          	and	a,(OFST+2,sp)
4664  0a1c 6b01          	ld	(OFST-1,sp),a
4665                     ; 1104     tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
4667  0a1e 7b03          	ld	a,(OFST+1,sp)
4668  0a20 6b02          	ld	(OFST+0,sp),a
4669                     ; 1106     if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
4671  0a22 c65305        	ld	a,21253
4672  0a25 1402          	and	a,(OFST+0,sp)
4673  0a27 1a01          	or	a,(OFST-1,sp)
4674  0a29 2706          	jreq	L7371
4675                     ; 1108         bitstatus = SET;
4677  0a2b a601          	ld	a,#1
4678  0a2d 6b02          	ld	(OFST+0,sp),a
4680  0a2f 2002          	jra	L1471
4681  0a31               L7371:
4682                     ; 1112         bitstatus = RESET;
4684  0a31 0f02          	clr	(OFST+0,sp)
4685  0a33               L1471:
4686                     ; 1114     return (FlagStatus)bitstatus;
4688  0a33 7b02          	ld	a,(OFST+0,sp)
4691  0a35 5b04          	addw	sp,#4
4692  0a37 81            	ret
4728                     ; 1131 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
4728                     ; 1132 {
4729                     	switch	.text
4730  0a38               _TIM2_ClearFlag:
4732  0a38 89            	pushw	x
4733       00000000      OFST:	set	0
4736                     ; 1134     assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
4738  0a39 01            	rrwa	x,a
4739  0a3a a4f0          	and	a,#240
4740  0a3c 01            	rrwa	x,a
4741  0a3d a4f1          	and	a,#241
4742  0a3f 01            	rrwa	x,a
4743  0a40 a30000        	cpw	x,#0
4744  0a43 2607          	jrne	L635
4745  0a45 1e01          	ldw	x,(OFST+1,sp)
4746  0a47 2703          	jreq	L635
4747  0a49 4f            	clr	a
4748  0a4a 2010          	jra	L045
4749  0a4c               L635:
4750  0a4c ae046e        	ldw	x,#1134
4751  0a4f 89            	pushw	x
4752  0a50 ae0000        	ldw	x,#0
4753  0a53 89            	pushw	x
4754  0a54 ae0000        	ldw	x,#L702
4755  0a57 cd0000        	call	_assert_failed
4757  0a5a 5b04          	addw	sp,#4
4758  0a5c               L045:
4759                     ; 1137     TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
4761  0a5c 7b02          	ld	a,(OFST+2,sp)
4762  0a5e 43            	cpl	a
4763  0a5f c75304        	ld	21252,a
4764                     ; 1138     TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
4766  0a62 35ff5305      	mov	21253,#255
4767                     ; 1139 }
4770  0a66 85            	popw	x
4771  0a67 81            	ret
4836                     ; 1153 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
4836                     ; 1154 {
4837                     	switch	.text
4838  0a68               _TIM2_GetITStatus:
4840  0a68 88            	push	a
4841  0a69 89            	pushw	x
4842       00000002      OFST:	set	2
4845                     ; 1155     ITStatus bitstatus = RESET;
4847                     ; 1156     uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
4851                     ; 1159     assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
4853  0a6a a101          	cp	a,#1
4854  0a6c 270c          	jreq	L645
4855  0a6e a102          	cp	a,#2
4856  0a70 2708          	jreq	L645
4857  0a72 a104          	cp	a,#4
4858  0a74 2704          	jreq	L645
4859  0a76 a108          	cp	a,#8
4860  0a78 2603          	jrne	L445
4861  0a7a               L645:
4862  0a7a 4f            	clr	a
4863  0a7b 2010          	jra	L055
4864  0a7d               L445:
4865  0a7d ae0487        	ldw	x,#1159
4866  0a80 89            	pushw	x
4867  0a81 ae0000        	ldw	x,#0
4868  0a84 89            	pushw	x
4869  0a85 ae0000        	ldw	x,#L702
4870  0a88 cd0000        	call	_assert_failed
4872  0a8b 5b04          	addw	sp,#4
4873  0a8d               L055:
4874                     ; 1161     TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
4876  0a8d c65304        	ld	a,21252
4877  0a90 1403          	and	a,(OFST+1,sp)
4878  0a92 6b01          	ld	(OFST-1,sp),a
4879                     ; 1163     TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
4881  0a94 c65303        	ld	a,21251
4882  0a97 1403          	and	a,(OFST+1,sp)
4883  0a99 6b02          	ld	(OFST+0,sp),a
4884                     ; 1165     if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
4886  0a9b 0d01          	tnz	(OFST-1,sp)
4887  0a9d 270a          	jreq	L3102
4889  0a9f 0d02          	tnz	(OFST+0,sp)
4890  0aa1 2706          	jreq	L3102
4891                     ; 1167         bitstatus = SET;
4893  0aa3 a601          	ld	a,#1
4894  0aa5 6b02          	ld	(OFST+0,sp),a
4896  0aa7 2002          	jra	L5102
4897  0aa9               L3102:
4898                     ; 1171         bitstatus = RESET;
4900  0aa9 0f02          	clr	(OFST+0,sp)
4901  0aab               L5102:
4902                     ; 1173     return (ITStatus)(bitstatus);
4904  0aab 7b02          	ld	a,(OFST+0,sp)
4907  0aad 5b03          	addw	sp,#3
4908  0aaf 81            	ret
4945                     ; 1187 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
4945                     ; 1188 {
4946                     	switch	.text
4947  0ab0               _TIM2_ClearITPendingBit:
4949  0ab0 88            	push	a
4950       00000000      OFST:	set	0
4953                     ; 1190     assert_param(IS_TIM2_IT_OK(TIM2_IT));
4955  0ab1 4d            	tnz	a
4956  0ab2 2707          	jreq	L455
4957  0ab4 a110          	cp	a,#16
4958  0ab6 2403          	jruge	L455
4959  0ab8 4f            	clr	a
4960  0ab9 2010          	jra	L655
4961  0abb               L455:
4962  0abb ae04a6        	ldw	x,#1190
4963  0abe 89            	pushw	x
4964  0abf ae0000        	ldw	x,#0
4965  0ac2 89            	pushw	x
4966  0ac3 ae0000        	ldw	x,#L702
4967  0ac6 cd0000        	call	_assert_failed
4969  0ac9 5b04          	addw	sp,#4
4970  0acb               L655:
4971                     ; 1193     TIM2->SR1 = (uint8_t)(~TIM2_IT);
4973  0acb 7b01          	ld	a,(OFST+1,sp)
4974  0acd 43            	cpl	a
4975  0ace c75304        	ld	21252,a
4976                     ; 1194 }
4979  0ad1 84            	pop	a
4980  0ad2 81            	ret
5032                     ; 1213 static void TI1_Config(uint8_t TIM2_ICPolarity,
5032                     ; 1214                        uint8_t TIM2_ICSelection,
5032                     ; 1215                        uint8_t TIM2_ICFilter)
5032                     ; 1216 {
5033                     	switch	.text
5034  0ad3               L3_TI1_Config:
5036  0ad3 89            	pushw	x
5037  0ad4 88            	push	a
5038       00000001      OFST:	set	1
5041                     ; 1218     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
5043  0ad5 7211530a      	bres	21258,#0
5044                     ; 1221     TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
5044                     ; 1222                              | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5046  0ad9 7b06          	ld	a,(OFST+5,sp)
5047  0adb 97            	ld	xl,a
5048  0adc a610          	ld	a,#16
5049  0ade 42            	mul	x,a
5050  0adf 9f            	ld	a,xl
5051  0ae0 1a03          	or	a,(OFST+2,sp)
5052  0ae2 6b01          	ld	(OFST+0,sp),a
5053  0ae4 c65307        	ld	a,21255
5054  0ae7 a40c          	and	a,#12
5055  0ae9 1a01          	or	a,(OFST+0,sp)
5056  0aeb c75307        	ld	21255,a
5057                     ; 1225     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5059  0aee 0d02          	tnz	(OFST+1,sp)
5060  0af0 2706          	jreq	L3602
5061                     ; 1227         TIM2->CCER1 |= TIM2_CCER1_CC1P;
5063  0af2 7212530a      	bset	21258,#1
5065  0af6 2004          	jra	L5602
5066  0af8               L3602:
5067                     ; 1231         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
5069  0af8 7213530a      	bres	21258,#1
5070  0afc               L5602:
5071                     ; 1234     TIM2->CCER1 |= TIM2_CCER1_CC1E;
5073  0afc 7210530a      	bset	21258,#0
5074                     ; 1235 }
5077  0b00 5b03          	addw	sp,#3
5078  0b02 81            	ret
5130                     ; 1254 static void TI2_Config(uint8_t TIM2_ICPolarity,
5130                     ; 1255                        uint8_t TIM2_ICSelection,
5130                     ; 1256                        uint8_t TIM2_ICFilter)
5130                     ; 1257 {
5131                     	switch	.text
5132  0b03               L5_TI2_Config:
5134  0b03 89            	pushw	x
5135  0b04 88            	push	a
5136       00000001      OFST:	set	1
5139                     ; 1259     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
5141  0b05 7219530a      	bres	21258,#4
5142                     ; 1262     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
5142                     ; 1263                             | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5144  0b09 7b06          	ld	a,(OFST+5,sp)
5145  0b0b 97            	ld	xl,a
5146  0b0c a610          	ld	a,#16
5147  0b0e 42            	mul	x,a
5148  0b0f 9f            	ld	a,xl
5149  0b10 1a03          	or	a,(OFST+2,sp)
5150  0b12 6b01          	ld	(OFST+0,sp),a
5151  0b14 c65308        	ld	a,21256
5152  0b17 a40c          	and	a,#12
5153  0b19 1a01          	or	a,(OFST+0,sp)
5154  0b1b c75308        	ld	21256,a
5155                     ; 1267     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5157  0b1e 0d02          	tnz	(OFST+1,sp)
5158  0b20 2706          	jreq	L5112
5159                     ; 1269         TIM2->CCER1 |= TIM2_CCER1_CC2P;
5161  0b22 721a530a      	bset	21258,#5
5163  0b26 2004          	jra	L7112
5164  0b28               L5112:
5165                     ; 1273         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
5167  0b28 721b530a      	bres	21258,#5
5168  0b2c               L7112:
5169                     ; 1277     TIM2->CCER1 |= TIM2_CCER1_CC2E;
5171  0b2c 7218530a      	bset	21258,#4
5172                     ; 1279 }
5175  0b30 5b03          	addw	sp,#3
5176  0b32 81            	ret
5228                     ; 1295 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
5228                     ; 1296                        uint8_t TIM2_ICFilter)
5228                     ; 1297 {
5229                     	switch	.text
5230  0b33               L7_TI3_Config:
5232  0b33 89            	pushw	x
5233  0b34 88            	push	a
5234       00000001      OFST:	set	1
5237                     ; 1299     TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
5239  0b35 7211530b      	bres	21259,#0
5240                     ; 1302     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
5240                     ; 1303                             | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5242  0b39 7b06          	ld	a,(OFST+5,sp)
5243  0b3b 97            	ld	xl,a
5244  0b3c a610          	ld	a,#16
5245  0b3e 42            	mul	x,a
5246  0b3f 9f            	ld	a,xl
5247  0b40 1a03          	or	a,(OFST+2,sp)
5248  0b42 6b01          	ld	(OFST+0,sp),a
5249  0b44 c65309        	ld	a,21257
5250  0b47 a40c          	and	a,#12
5251  0b49 1a01          	or	a,(OFST+0,sp)
5252  0b4b c75309        	ld	21257,a
5253                     ; 1307     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5255  0b4e 0d02          	tnz	(OFST+1,sp)
5256  0b50 2706          	jreq	L7412
5257                     ; 1309         TIM2->CCER2 |= TIM2_CCER2_CC3P;
5259  0b52 7212530b      	bset	21259,#1
5261  0b56 2004          	jra	L1512
5262  0b58               L7412:
5263                     ; 1313         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
5265  0b58 7213530b      	bres	21259,#1
5266  0b5c               L1512:
5267                     ; 1316     TIM2->CCER2 |= TIM2_CCER2_CC3E;
5269  0b5c 7210530b      	bset	21259,#0
5270                     ; 1317 }
5273  0b60 5b03          	addw	sp,#3
5274  0b62 81            	ret
5287                     	xdef	_TIM2_ClearITPendingBit
5288                     	xdef	_TIM2_GetITStatus
5289                     	xdef	_TIM2_ClearFlag
5290                     	xdef	_TIM2_GetFlagStatus
5291                     	xdef	_TIM2_GetPrescaler
5292                     	xdef	_TIM2_GetCounter
5293                     	xdef	_TIM2_GetCapture3
5294                     	xdef	_TIM2_GetCapture2
5295                     	xdef	_TIM2_GetCapture1
5296                     	xdef	_TIM2_SetIC3Prescaler
5297                     	xdef	_TIM2_SetIC2Prescaler
5298                     	xdef	_TIM2_SetIC1Prescaler
5299                     	xdef	_TIM2_SetCompare3
5300                     	xdef	_TIM2_SetCompare2
5301                     	xdef	_TIM2_SetCompare1
5302                     	xdef	_TIM2_SetAutoreload
5303                     	xdef	_TIM2_SetCounter
5304                     	xdef	_TIM2_SelectOCxM
5305                     	xdef	_TIM2_CCxCmd
5306                     	xdef	_TIM2_OC3PolarityConfig
5307                     	xdef	_TIM2_OC2PolarityConfig
5308                     	xdef	_TIM2_OC1PolarityConfig
5309                     	xdef	_TIM2_GenerateEvent
5310                     	xdef	_TIM2_OC3PreloadConfig
5311                     	xdef	_TIM2_OC2PreloadConfig
5312                     	xdef	_TIM2_OC1PreloadConfig
5313                     	xdef	_TIM2_ARRPreloadConfig
5314                     	xdef	_TIM2_ForcedOC3Config
5315                     	xdef	_TIM2_ForcedOC2Config
5316                     	xdef	_TIM2_ForcedOC1Config
5317                     	xdef	_TIM2_PrescalerConfig
5318                     	xdef	_TIM2_SelectOnePulseMode
5319                     	xdef	_TIM2_UpdateRequestConfig
5320                     	xdef	_TIM2_UpdateDisableConfig
5321                     	xdef	_TIM2_ITConfig
5322                     	xdef	_TIM2_Cmd
5323                     	xdef	_TIM2_PWMIConfig
5324                     	xdef	_TIM2_ICInit
5325                     	xdef	_TIM2_OC3Init
5326                     	xdef	_TIM2_OC2Init
5327                     	xdef	_TIM2_OC1Init
5328                     	xdef	_TIM2_TimeBaseInit
5329                     	xdef	_TIM2_DeInit
5330                     	xref	_assert_failed
5331                     .const:	section	.text
5332  0000               L702:
5333  0000 2e2e5c73746d  	dc.b	"..\stm8s_stdperiph"
5334  0012 5f6472697665  	dc.b	"_driver\src\stm8s_"
5335  0024 74696d322e63  	dc.b	"tim2.c",0
5355                     	end
