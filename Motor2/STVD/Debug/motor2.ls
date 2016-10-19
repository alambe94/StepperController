   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  16                     	bsct
  17  0000               _Sequence:
  18  0000 00            	dc.b	0
  19  0001               _SpeedDelay:
  20  0001 02            	dc.b	2
  21  0002               _SpeedTimeKeep:
  22  0002 00000000      	dc.l	0
  23  0006               _MotorDirection:
  24  0006 01            	dc.b	1
  76                     ; 14 void Motor2MoveCCW(uint8_t val)
  76                     ; 15 {	
  78                     	switch	.text
  79  0000               _Motor2MoveCCW:
  81  0000 88            	push	a
  82  0001 88            	push	a
  83       00000001      OFST:	set	1
  86                     ; 16 	uint8_t i=0;
  88                     ; 17   MotorDirection = CounterClockWise;
  90  0002 3f06          	clr	_MotorDirection
  91                     ; 18 	for(i=0;i<val;i++)
  93  0004 0f01          	clr	(OFST+0,sp)
  95  0006 2004          	jra	L73
  96  0008               L33:
  97                     ; 20 	Motor2Move();
  99  0008 ad49          	call	_Motor2Move
 101                     ; 18 	for(i=0;i<val;i++)
 103  000a 0c01          	inc	(OFST+0,sp)
 104  000c               L73:
 107  000c 7b01          	ld	a,(OFST+0,sp)
 108  000e 1102          	cp	a,(OFST+1,sp)
 109  0010 25f6          	jrult	L33
 110                     ; 22 	Motor2Stop();
 112  0012 ad1a          	call	_Motor2Stop
 114                     ; 23 }
 117  0014 85            	popw	x
 118  0015 81            	ret
 164                     ; 25 void Motor2MoveCW(uint8_t val)
 164                     ; 26 {	
 165                     	switch	.text
 166  0016               _Motor2MoveCW:
 168  0016 88            	push	a
 169  0017 88            	push	a
 170       00000001      OFST:	set	1
 173                     ; 27   uint8_t i=0;
 175                     ; 28   MotorDirection = ClockWise;
 177  0018 35010006      	mov	_MotorDirection,#1
 178                     ; 29 	for(i=0;i<val;i++)
 180  001c 0f01          	clr	(OFST+0,sp)
 182  001e 2004          	jra	L17
 183  0020               L56:
 184                     ; 31 	Motor2Move();
 186  0020 ad31          	call	_Motor2Move
 188                     ; 29 	for(i=0;i<val;i++)
 190  0022 0c01          	inc	(OFST+0,sp)
 191  0024               L17:
 194  0024 7b01          	ld	a,(OFST+0,sp)
 195  0026 1102          	cp	a,(OFST+1,sp)
 196  0028 25f6          	jrult	L56
 197                     ; 33 	Motor2Stop();
 199  002a ad02          	call	_Motor2Stop
 201                     ; 35 }
 204  002c 85            	popw	x
 205  002d 81            	ret
 229                     ; 37 void Motor2Stop(void)
 229                     ; 38 {
 230                     	switch	.text
 231  002e               _Motor2Stop:
 235                     ; 39 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_A);
 237  002e 4b08          	push	#8
 238  0030 ae500a        	ldw	x,#20490
 239  0033 cd0000        	call	_GPIO_WriteLow
 241  0036 84            	pop	a
 242                     ; 40 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_B);
 244  0037 4b10          	push	#16
 245  0039 ae500a        	ldw	x,#20490
 246  003c cd0000        	call	_GPIO_WriteLow
 248  003f 84            	pop	a
 249                     ; 41 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_C);
 251  0040 4b20          	push	#32
 252  0042 ae500a        	ldw	x,#20490
 253  0045 cd0000        	call	_GPIO_WriteLow
 255  0048 84            	pop	a
 256                     ; 42 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_D);
 258  0049 4b40          	push	#64
 259  004b ae500a        	ldw	x,#20490
 260  004e cd0000        	call	_GPIO_WriteLow
 262  0051 84            	pop	a
 263                     ; 44 }
 266  0052 81            	ret
 295                     ; 46 void Motor2Move(void) {
 296                     	switch	.text
 297  0053               _Motor2Move:
 301                     ; 47 	switch (Sequence) {
 303  0053 b600          	ld	a,_Sequence
 305                     ; 115 		break;
 306  0055 4d            	tnz	a
 307  0056 274f          	jreq	L501
 308  0058 4a            	dec	a
 309  0059 2774          	jreq	L701
 310  005b 4a            	dec	a
 311  005c 2603          	jrne	L41
 312  005e cc00f7        	jp	L111
 313  0061               L41:
 314  0061 4a            	dec	a
 315  0062 2603          	jrne	L61
 316  0064 cc011f        	jp	L311
 317  0067               L61:
 318  0067 4a            	dec	a
 319  0068 2603          	jrne	L02
 320  006a cc0147        	jp	L511
 321  006d               L02:
 322  006d 4a            	dec	a
 323  006e 2603          	jrne	L22
 324  0070 cc016d        	jp	L711
 325  0073               L22:
 326  0073 4a            	dec	a
 327  0074 2603          	jrne	L42
 328  0076 cc0193        	jp	L121
 329  0079               L42:
 330  0079 4a            	dec	a
 331  007a 2603          	jrne	L62
 332  007c cc01b9        	jp	L321
 333  007f               L62:
 334  007f               L521:
 335                     ; 108 	default:
 335                     ; 109 
 335                     ; 110 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_A);
 337  007f 4b08          	push	#8
 338  0081 ae500a        	ldw	x,#20490
 339  0084 cd0000        	call	_GPIO_WriteLow
 341  0087 84            	pop	a
 342                     ; 111 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_B);
 344  0088 4b10          	push	#16
 345  008a ae500a        	ldw	x,#20490
 346  008d cd0000        	call	_GPIO_WriteLow
 348  0090 84            	pop	a
 349                     ; 112 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_C);
 351  0091 4b20          	push	#32
 352  0093 ae500a        	ldw	x,#20490
 353  0096 cd0000        	call	_GPIO_WriteLow
 355  0099 84            	pop	a
 356                     ; 113 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_D);
 358  009a 4b40          	push	#64
 359  009c ae500a        	ldw	x,#20490
 360  009f cd0000        	call	_GPIO_WriteLow
 362  00a2 84            	pop	a
 363                     ; 115 		break;
 365  00a3 acdd01dd      	jpf	L141
 366  00a7               L501:
 367                     ; 48 	case 0:
 367                     ; 49 	
 367                     ; 50 		GPIO_WriteHigh(MOTOR2_PORT, MOTOR2_A);
 369  00a7 4b08          	push	#8
 370  00a9 ae500a        	ldw	x,#20490
 371  00ac cd0000        	call	_GPIO_WriteHigh
 373  00af 84            	pop	a
 374                     ; 51 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_B);
 376  00b0 4b10          	push	#16
 377  00b2 ae500a        	ldw	x,#20490
 378  00b5 cd0000        	call	_GPIO_WriteLow
 380  00b8 84            	pop	a
 381                     ; 52 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_C);
 383  00b9 4b20          	push	#32
 384  00bb ae500a        	ldw	x,#20490
 385  00be cd0000        	call	_GPIO_WriteLow
 387  00c1 84            	pop	a
 388                     ; 53 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_D);
 390  00c2 4b40          	push	#64
 391  00c4 ae500a        	ldw	x,#20490
 392  00c7 cd0000        	call	_GPIO_WriteLow
 394  00ca 84            	pop	a
 395                     ; 55 		break;
 397  00cb acdd01dd      	jpf	L141
 398  00cf               L701:
 399                     ; 56 	case 1:
 399                     ; 57 		GPIO_WriteHigh(MOTOR2_PORT, MOTOR2_A);
 401  00cf 4b08          	push	#8
 402  00d1 ae500a        	ldw	x,#20490
 403  00d4 cd0000        	call	_GPIO_WriteHigh
 405  00d7 84            	pop	a
 406                     ; 58 		GPIO_WriteHigh(MOTOR2_PORT, MOTOR2_B);
 408  00d8 4b10          	push	#16
 409  00da ae500a        	ldw	x,#20490
 410  00dd cd0000        	call	_GPIO_WriteHigh
 412  00e0 84            	pop	a
 413                     ; 59 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_C);
 415  00e1 4b20          	push	#32
 416  00e3 ae500a        	ldw	x,#20490
 417  00e6 cd0000        	call	_GPIO_WriteLow
 419  00e9 84            	pop	a
 420                     ; 60 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_D);
 422  00ea 4b40          	push	#64
 423  00ec ae500a        	ldw	x,#20490
 424  00ef cd0000        	call	_GPIO_WriteLow
 426  00f2 84            	pop	a
 427                     ; 62 		break;
 429  00f3 acdd01dd      	jpf	L141
 430  00f7               L111:
 431                     ; 63 	case 2:
 431                     ; 64 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_A);
 433  00f7 4b08          	push	#8
 434  00f9 ae500a        	ldw	x,#20490
 435  00fc cd0000        	call	_GPIO_WriteLow
 437  00ff 84            	pop	a
 438                     ; 65 		GPIO_WriteHigh(MOTOR2_PORT, MOTOR2_B);
 440  0100 4b10          	push	#16
 441  0102 ae500a        	ldw	x,#20490
 442  0105 cd0000        	call	_GPIO_WriteHigh
 444  0108 84            	pop	a
 445                     ; 66 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_C);
 447  0109 4b20          	push	#32
 448  010b ae500a        	ldw	x,#20490
 449  010e cd0000        	call	_GPIO_WriteLow
 451  0111 84            	pop	a
 452                     ; 67 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_D);
 454  0112 4b40          	push	#64
 455  0114 ae500a        	ldw	x,#20490
 456  0117 cd0000        	call	_GPIO_WriteLow
 458  011a 84            	pop	a
 459                     ; 69 		break;
 461  011b acdd01dd      	jpf	L141
 462  011f               L311:
 463                     ; 70 	case 3:
 463                     ; 71 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_A);
 465  011f 4b08          	push	#8
 466  0121 ae500a        	ldw	x,#20490
 467  0124 cd0000        	call	_GPIO_WriteLow
 469  0127 84            	pop	a
 470                     ; 72 		GPIO_WriteHigh(MOTOR2_PORT, MOTOR2_B);
 472  0128 4b10          	push	#16
 473  012a ae500a        	ldw	x,#20490
 474  012d cd0000        	call	_GPIO_WriteHigh
 476  0130 84            	pop	a
 477                     ; 73 		GPIO_WriteHigh(MOTOR2_PORT, MOTOR2_C);
 479  0131 4b20          	push	#32
 480  0133 ae500a        	ldw	x,#20490
 481  0136 cd0000        	call	_GPIO_WriteHigh
 483  0139 84            	pop	a
 484                     ; 74 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_D);
 486  013a 4b40          	push	#64
 487  013c ae500a        	ldw	x,#20490
 488  013f cd0000        	call	_GPIO_WriteLow
 490  0142 84            	pop	a
 491                     ; 76 		break;
 493  0143 acdd01dd      	jpf	L141
 494  0147               L511:
 495                     ; 77 	case 4:
 495                     ; 78 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_A);
 497  0147 4b08          	push	#8
 498  0149 ae500a        	ldw	x,#20490
 499  014c cd0000        	call	_GPIO_WriteLow
 501  014f 84            	pop	a
 502                     ; 79 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_B);
 504  0150 4b10          	push	#16
 505  0152 ae500a        	ldw	x,#20490
 506  0155 cd0000        	call	_GPIO_WriteLow
 508  0158 84            	pop	a
 509                     ; 80 		GPIO_WriteHigh(MOTOR2_PORT, MOTOR2_C);
 511  0159 4b20          	push	#32
 512  015b ae500a        	ldw	x,#20490
 513  015e cd0000        	call	_GPIO_WriteHigh
 515  0161 84            	pop	a
 516                     ; 81 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_D);
 518  0162 4b40          	push	#64
 519  0164 ae500a        	ldw	x,#20490
 520  0167 cd0000        	call	_GPIO_WriteLow
 522  016a 84            	pop	a
 523                     ; 83 		break;
 525  016b 2070          	jra	L141
 526  016d               L711:
 527                     ; 84 	case 5:
 527                     ; 85 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_A);
 529  016d 4b08          	push	#8
 530  016f ae500a        	ldw	x,#20490
 531  0172 cd0000        	call	_GPIO_WriteLow
 533  0175 84            	pop	a
 534                     ; 86 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_B);
 536  0176 4b10          	push	#16
 537  0178 ae500a        	ldw	x,#20490
 538  017b cd0000        	call	_GPIO_WriteLow
 540  017e 84            	pop	a
 541                     ; 87 		GPIO_WriteHigh(MOTOR2_PORT, MOTOR2_C);
 543  017f 4b20          	push	#32
 544  0181 ae500a        	ldw	x,#20490
 545  0184 cd0000        	call	_GPIO_WriteHigh
 547  0187 84            	pop	a
 548                     ; 88 		GPIO_WriteHigh(MOTOR2_PORT, MOTOR2_D);
 550  0188 4b40          	push	#64
 551  018a ae500a        	ldw	x,#20490
 552  018d cd0000        	call	_GPIO_WriteHigh
 554  0190 84            	pop	a
 555                     ; 90 		break;
 557  0191 204a          	jra	L141
 558  0193               L121:
 559                     ; 91 	case 6:
 559                     ; 92 
 559                     ; 93 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_A);
 561  0193 4b08          	push	#8
 562  0195 ae500a        	ldw	x,#20490
 563  0198 cd0000        	call	_GPIO_WriteLow
 565  019b 84            	pop	a
 566                     ; 94 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_B);
 568  019c 4b10          	push	#16
 569  019e ae500a        	ldw	x,#20490
 570  01a1 cd0000        	call	_GPIO_WriteLow
 572  01a4 84            	pop	a
 573                     ; 95 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_C);
 575  01a5 4b20          	push	#32
 576  01a7 ae500a        	ldw	x,#20490
 577  01aa cd0000        	call	_GPIO_WriteLow
 579  01ad 84            	pop	a
 580                     ; 96 		GPIO_WriteHigh(MOTOR2_PORT, MOTOR2_D);
 582  01ae 4b40          	push	#64
 583  01b0 ae500a        	ldw	x,#20490
 584  01b3 cd0000        	call	_GPIO_WriteHigh
 586  01b6 84            	pop	a
 587                     ; 98 		break;
 589  01b7 2024          	jra	L141
 590  01b9               L321:
 591                     ; 99 	case 7:
 591                     ; 100 
 591                     ; 101 		GPIO_WriteHigh(MOTOR2_PORT, MOTOR2_A);
 593  01b9 4b08          	push	#8
 594  01bb ae500a        	ldw	x,#20490
 595  01be cd0000        	call	_GPIO_WriteHigh
 597  01c1 84            	pop	a
 598                     ; 102 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_B);
 600  01c2 4b10          	push	#16
 601  01c4 ae500a        	ldw	x,#20490
 602  01c7 cd0000        	call	_GPIO_WriteLow
 604  01ca 84            	pop	a
 605                     ; 103 		GPIO_WriteLow(MOTOR2_PORT, MOTOR2_C);
 607  01cb 4b20          	push	#32
 608  01cd ae500a        	ldw	x,#20490
 609  01d0 cd0000        	call	_GPIO_WriteLow
 611  01d3 84            	pop	a
 612                     ; 104 		GPIO_WriteHigh(MOTOR2_PORT, MOTOR2_D);
 614  01d4 4b40          	push	#64
 615  01d6 ae500a        	ldw	x,#20490
 616  01d9 cd0000        	call	_GPIO_WriteHigh
 618  01dc 84            	pop	a
 619                     ; 107 		break;
 621  01dd               L141:
 622                     ; 117 	if (MotorDirection == ClockWise) {
 624  01dd b606          	ld	a,_MotorDirection
 625  01df a101          	cp	a,#1
 626  01e1 2604          	jrne	L341
 627                     ; 118 		Sequence++;
 629  01e3 3c00          	inc	_Sequence
 631  01e5 2002          	jra	L541
 632  01e7               L341:
 633                     ; 120 		Sequence--;
 635  01e7 3a00          	dec	_Sequence
 636  01e9               L541:
 637                     ; 122 	if (Sequence > 7) {
 639  01e9 9c            	rvf
 640  01ea b600          	ld	a,_Sequence
 641  01ec a108          	cp	a,#8
 642  01ee 2f02          	jrslt	L741
 643                     ; 123 		Sequence = 0;
 645  01f0 3f00          	clr	_Sequence
 646  01f2               L741:
 647                     ; 125 	if (Sequence < 0) {
 649  01f2 9c            	rvf
 650  01f3 b600          	ld	a,_Sequence
 651  01f5 a100          	cp	a,#0
 652  01f7 2e04          	jrsge	L151
 653                     ; 126 		Sequence = 7;
 655  01f9 35070000      	mov	_Sequence,#7
 656  01fd               L151:
 657                     ; 128 	SpeedTimeKeep = millis();
 659  01fd cd0000        	call	_millis
 661  0200 ae0002        	ldw	x,#_SpeedTimeKeep
 662  0203 cd0000        	call	c_rtol
 665  0206               L751:
 666                     ; 129 	while (millis() - SpeedTimeKeep < (1));
 668  0206 cd0000        	call	_millis
 670  0209 ae0002        	ldw	x,#_SpeedTimeKeep
 671  020c cd0000        	call	c_lsub
 673  020f cd0000        	call	c_lrzmp
 675  0212 27f2          	jreq	L751
 676                     ; 131 }
 679  0214 81            	ret
 730                     	xdef	_MotorDirection
 731                     	xdef	_SpeedTimeKeep
 732                     	xdef	_SpeedDelay
 733                     	xdef	_Sequence
 734                     	xdef	_Motor2Stop
 735                     	xdef	_Motor2MoveCW
 736                     	xdef	_Motor2MoveCCW
 737                     	xdef	_Motor2Move
 738                     	xref	_millis
 739                     	xref	_GPIO_WriteLow
 740                     	xref	_GPIO_WriteHigh
 759                     	xref	c_lrzmp
 760                     	xref	c_lsub
 761                     	xref	c_rtol
 762                     	end
