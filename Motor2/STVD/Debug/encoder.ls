   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  16                     	bsct
  17  0000               _Last_State_E4:
  18  0000 00            	dc.b	0
  19  0001               _Last_State_E2:
  20  0001 00            	dc.b	0
  21  0002               _Dir_Flag:
  22  0002 00            	dc.b	0
  23  0003               _Pwm_Count:
  24  0003 0000          	dc.w	0
 114                     ; 19 void ScanEncoder2(void)
 114                     ; 20 {
 116                     	switch	.text
 117  0000               _ScanEncoder2:
 119  0000 89            	pushw	x
 120       00000002      OFST:	set	2
 123                     ; 21 	encoder_t Current_State =state00;
 125                     ; 22 	uint8_t temp=(GPIO_ReadInputData(ENCODER2_PORT));
 127  0001 ae500f        	ldw	x,#20495
 128  0004 cd0000        	call	_GPIO_ReadInputData
 130  0007 6b01          	ld	(OFST-1,sp),a
 131                     ; 23 	Current_State=((temp>>2)&0x01);
 133  0009 7b01          	ld	a,(OFST-1,sp)
 134  000b 44            	srl	a
 135  000c 44            	srl	a
 136  000d a401          	and	a,#1
 137  000f 6b02          	ld	(OFST+0,sp),a
 138                     ; 24 	Current_State|=((temp>>3)&0x02);
 140  0011 7b01          	ld	a,(OFST-1,sp)
 141  0013 44            	srl	a
 142  0014 44            	srl	a
 143  0015 44            	srl	a
 144  0016 a402          	and	a,#2
 145  0018 1a02          	or	a,(OFST+0,sp)
 146  001a 6b02          	ld	(OFST+0,sp),a
 147                     ; 27 	if(Current_State!=Last_State_E2)
 149  001c 7b02          	ld	a,(OFST+0,sp)
 150  001e b101          	cp	a,_Last_State_E2
 151  0020 2603          	jrne	L6
 152  0022 cc00b2        	jp	L16
 153  0025               L6:
 154                     ; 29 		switch(Current_State)
 156  0025 7b02          	ld	a,(OFST+0,sp)
 158                     ; 77 		 break;
 159  0027 4d            	tnz	a
 160  0028 270e          	jreq	L3
 161  002a 4a            	dec	a
 162  002b 272b          	jreq	L5
 163  002d 4a            	dec	a
 164  002e 2746          	jreq	L7
 165  0030 4a            	dec	a
 166  0031 2761          	jreq	L11
 167  0033               L31:
 168                     ; 75 		 default:
 168                     ; 76 		 Motor2Stop();
 170  0033 cd0000        	call	_Motor2Stop
 172                     ; 77 		 break;
 174  0036 207a          	jra	L16
 175  0038               L3:
 176                     ; 31 		case state00:
 176                     ; 32 		if(Last_State_E2==state10){
 178  0038 b601          	ld	a,_Last_State_E2
 179  003a a102          	cp	a,#2
 180  003c 2609          	jrne	L76
 181                     ; 33 		Dir_Flag =0;
 183  003e 3f02          	clr	_Dir_Flag
 184                     ; 34 			Motor2MoveCCW(40);}
 186  0040 a628          	ld	a,#40
 187  0042 cd0000        	call	_Motor2MoveCCW
 190  0045 206b          	jra	L16
 191  0047               L76:
 192                     ; 36 		  else if(Last_State_E2==state01){
 194  0047 b601          	ld	a,_Last_State_E2
 195  0049 a101          	cp	a,#1
 196  004b 2665          	jrne	L16
 197                     ; 37 				Dir_Flag =1;
 199  004d 35010002      	mov	_Dir_Flag,#1
 200                     ; 38 							Motor2MoveCW(40);}
 202  0051 a628          	ld	a,#40
 203  0053 cd0000        	call	_Motor2MoveCW
 205  0056 205a          	jra	L16
 206  0058               L5:
 207                     ; 42 	  case state01:
 207                     ; 43 		if(Last_State_E2==state00){
 209  0058 3d01          	tnz	_Last_State_E2
 210  005a 2609          	jrne	L57
 211                     ; 44 		Dir_Flag =0;
 213  005c 3f02          	clr	_Dir_Flag
 214                     ; 45 			Motor2MoveCCW(40);}
 216  005e a628          	ld	a,#40
 217  0060 cd0000        	call	_Motor2MoveCCW
 220  0063 204d          	jra	L16
 221  0065               L57:
 222                     ; 47 		  else if(Last_State_E2==state11){
 224  0065 b601          	ld	a,_Last_State_E2
 225  0067 a103          	cp	a,#3
 226  0069 2647          	jrne	L16
 227                     ; 48 				Dir_Flag =1;
 229  006b 35010002      	mov	_Dir_Flag,#1
 230                     ; 49 							Motor2MoveCW(40);}
 232  006f a628          	ld	a,#40
 233  0071 cd0000        	call	_Motor2MoveCW
 235  0074 203c          	jra	L16
 236  0076               L7:
 237                     ; 53 			case state10:
 237                     ; 54 		if(Last_State_E2==state11){
 239  0076 b601          	ld	a,_Last_State_E2
 240  0078 a103          	cp	a,#3
 241  007a 2609          	jrne	L301
 242                     ; 55 		Dir_Flag =0;
 244  007c 3f02          	clr	_Dir_Flag
 245                     ; 56 			Motor2MoveCCW(40);}
 247  007e a628          	ld	a,#40
 248  0080 cd0000        	call	_Motor2MoveCCW
 251  0083 202d          	jra	L16
 252  0085               L301:
 253                     ; 58 		  else if(Last_State_E2==state00){
 255  0085 3d01          	tnz	_Last_State_E2
 256  0087 2629          	jrne	L16
 257                     ; 59 				Dir_Flag =1;
 259  0089 35010002      	mov	_Dir_Flag,#1
 260                     ; 60 							Motor2MoveCW(40);}
 262  008d a628          	ld	a,#40
 263  008f cd0000        	call	_Motor2MoveCW
 265  0092 201e          	jra	L16
 266  0094               L11:
 267                     ; 64 			case state11:
 267                     ; 65 		if(Last_State_E2==state01){
 269  0094 b601          	ld	a,_Last_State_E2
 270  0096 a101          	cp	a,#1
 271  0098 2609          	jrne	L111
 272                     ; 66 		Dir_Flag =0;
 274  009a 3f02          	clr	_Dir_Flag
 275                     ; 67 			Motor2MoveCCW(40);}
 277  009c a628          	ld	a,#40
 278  009e cd0000        	call	_Motor2MoveCCW
 281  00a1 200f          	jra	L16
 282  00a3               L111:
 283                     ; 69 		  else if(Last_State_E2==state10){
 285  00a3 b601          	ld	a,_Last_State_E2
 286  00a5 a102          	cp	a,#2
 287  00a7 2609          	jrne	L16
 288                     ; 70 				Dir_Flag =1;
 290  00a9 35010002      	mov	_Dir_Flag,#1
 291                     ; 71 							Motor2MoveCW(40);}
 293  00ad a628          	ld	a,#40
 294  00af cd0000        	call	_Motor2MoveCW
 296  00b2               L56:
 297  00b2               L16:
 298                     ; 82 		Last_State_E2=Current_State;
 300  00b2 7b02          	ld	a,(OFST+0,sp)
 301  00b4 b701          	ld	_Last_State_E2,a
 302                     ; 84 }
 305  00b6 85            	popw	x
 306  00b7 81            	ret
 363                     ; 86 	void ScanEncoder4(void)
 363                     ; 87 {
 364                     	switch	.text
 365  00b8               _ScanEncoder4:
 367  00b8 89            	pushw	x
 368       00000002      OFST:	set	2
 371                     ; 88 	encoder_t Current_State =state00;
 373                     ; 89 	uint8_t temp1=(GPIO_ReadInputData(GPIOC));
 375  00b9 ae500a        	ldw	x,#20490
 376  00bc cd0000        	call	_GPIO_ReadInputData
 378  00bf 6b02          	ld	(OFST+0,sp),a
 379                     ; 90 	uint8_t temp2=(GPIO_ReadInputData(GPIOD));
 381  00c1 ae500f        	ldw	x,#20495
 382  00c4 cd0000        	call	_GPIO_ReadInputData
 384  00c7 6b01          	ld	(OFST-1,sp),a
 385                     ; 92 	Current_State=((temp1>>7)&0x01);
 387  00c9 7b02          	ld	a,(OFST+0,sp)
 388  00cb 49            	rlc	a
 389  00cc 4f            	clr	a
 390  00cd 49            	rlc	a
 391  00ce 6b02          	ld	(OFST+0,sp),a
 392                     ; 93 	Current_State|=((temp2>>2)&0x02);
 394  00d0 7b01          	ld	a,(OFST-1,sp)
 395  00d2 44            	srl	a
 396  00d3 44            	srl	a
 397  00d4 a402          	and	a,#2
 398  00d6 1a02          	or	a,(OFST+0,sp)
 399  00d8 6b02          	ld	(OFST+0,sp),a
 400                     ; 96 	if(Current_State!=Last_State_E4)
 402  00da 7b02          	ld	a,(OFST+0,sp)
 403  00dc b100          	cp	a,_Last_State_E4
 404  00de 2603cc0165    	jreq	L751
 405                     ; 98 		switch(Current_State)
 407  00e3 7b02          	ld	a,(OFST+0,sp)
 409                     ; 136 		 default:
 409                     ; 137 		 break;
 410  00e5 4d            	tnz	a
 411  00e6 270b          	jreq	L711
 412  00e8 4a            	dec	a
 413  00e9 2726          	jreq	L121
 414  00eb 4a            	dec	a
 415  00ec 273f          	jreq	L321
 416  00ee 4a            	dec	a
 417  00ef 2758          	jreq	L521
 418  00f1 2072          	jra	L751
 419  00f3               L711:
 420                     ; 100 		case state00:
 420                     ; 101 		if(Last_State_E4==state10){
 422  00f3 b600          	ld	a,_Last_State_E4
 423  00f5 a102          	cp	a,#2
 424  00f7 2609          	jrne	L561
 425                     ; 102 			Pwm_Count++;}
 427  00f9 be03          	ldw	x,_Pwm_Count
 428  00fb 1c0001        	addw	x,#1
 429  00fe bf03          	ldw	_Pwm_Count,x
 431  0100 2063          	jra	L751
 432  0102               L561:
 433                     ; 104 		  else if(Last_State_E4==state01){
 435  0102 b600          	ld	a,_Last_State_E4
 436  0104 a101          	cp	a,#1
 437  0106 265d          	jrne	L751
 438                     ; 105 			Pwm_Count--;}
 440  0108 be03          	ldw	x,_Pwm_Count
 441  010a 1d0001        	subw	x,#1
 442  010d bf03          	ldw	_Pwm_Count,x
 443  010f 2054          	jra	L751
 444  0111               L121:
 445                     ; 109 	  case state01:
 445                     ; 110 		if(Last_State_E4==state00){
 447  0111 3d00          	tnz	_Last_State_E4
 448  0113 2609          	jrne	L371
 449                     ; 111 			Pwm_Count++;}
 451  0115 be03          	ldw	x,_Pwm_Count
 452  0117 1c0001        	addw	x,#1
 453  011a bf03          	ldw	_Pwm_Count,x
 455  011c 2047          	jra	L751
 456  011e               L371:
 457                     ; 113 		  else if(Last_State_E4==state11){
 459  011e b600          	ld	a,_Last_State_E4
 460  0120 a103          	cp	a,#3
 461  0122 2641          	jrne	L751
 462                     ; 114 			Pwm_Count--;}
 464  0124 be03          	ldw	x,_Pwm_Count
 465  0126 1d0001        	subw	x,#1
 466  0129 bf03          	ldw	_Pwm_Count,x
 467  012b 2038          	jra	L751
 468  012d               L321:
 469                     ; 118 			case state10:
 469                     ; 119 		if(Last_State_E4==state11){
 471  012d b600          	ld	a,_Last_State_E4
 472  012f a103          	cp	a,#3
 473  0131 2609          	jrne	L102
 474                     ; 120 			Pwm_Count++;}
 476  0133 be03          	ldw	x,_Pwm_Count
 477  0135 1c0001        	addw	x,#1
 478  0138 bf03          	ldw	_Pwm_Count,x
 480  013a 2029          	jra	L751
 481  013c               L102:
 482                     ; 122 		  else if(Last_State_E4==state00){
 484  013c 3d00          	tnz	_Last_State_E4
 485  013e 2625          	jrne	L751
 486                     ; 123 			Pwm_Count--;}
 488  0140 be03          	ldw	x,_Pwm_Count
 489  0142 1d0001        	subw	x,#1
 490  0145 bf03          	ldw	_Pwm_Count,x
 491  0147 201c          	jra	L751
 492  0149               L521:
 493                     ; 127 			case state11:
 493                     ; 128 		if(Last_State_E4==state01){
 495  0149 b600          	ld	a,_Last_State_E4
 496  014b a101          	cp	a,#1
 497  014d 2609          	jrne	L702
 498                     ; 129 			Pwm_Count++;}
 500  014f be03          	ldw	x,_Pwm_Count
 501  0151 1c0001        	addw	x,#1
 502  0154 bf03          	ldw	_Pwm_Count,x
 504  0156 200d          	jra	L751
 505  0158               L702:
 506                     ; 131 		  else if(Last_State_E4==state10){
 508  0158 b600          	ld	a,_Last_State_E4
 509  015a a102          	cp	a,#2
 510  015c 2607          	jrne	L751
 511                     ; 132 			Pwm_Count--;}
 513  015e be03          	ldw	x,_Pwm_Count
 514  0160 1d0001        	subw	x,#1
 515  0163 bf03          	ldw	_Pwm_Count,x
 516  0165               L721:
 517                     ; 136 		 default:
 517                     ; 137 		 break;
 519  0165               L361:
 520  0165               L751:
 521                     ; 142 		Last_State_E4=Current_State;
 523  0165 7b02          	ld	a,(OFST+0,sp)
 524  0167 b700          	ld	_Last_State_E4,a
 525                     ; 143 		if(Pwm_Count>26)
 527  0169 9c            	rvf
 528  016a be03          	ldw	x,_Pwm_Count
 529  016c a3001b        	cpw	x,#27
 530  016f 2f05          	jrslt	L512
 531                     ; 145 			Pwm_Count=26;
 533  0171 ae001a        	ldw	x,#26
 534  0174 bf03          	ldw	_Pwm_Count,x
 535  0176               L512:
 536                     ; 147 			if(Pwm_Count<0)
 538  0176 9c            	rvf
 539  0177 be03          	ldw	x,_Pwm_Count
 540  0179 2e03          	jrsge	L712
 541                     ; 149 			Pwm_Count=0;
 543  017b 5f            	clrw	x
 544  017c bf03          	ldw	_Pwm_Count,x
 545  017e               L712:
 546                     ; 151 		Set_Led_Pwm(Pwm_Count);
 548  017e be03          	ldw	x,_Pwm_Count
 549  0180 cd0000        	call	_Set_Led_Pwm
 551                     ; 153 }
 554  0183 85            	popw	x
 555  0184 81            	ret
 608                     	xdef	_Pwm_Count
 609                     	xdef	_Dir_Flag
 610                     	xdef	_Last_State_E2
 611                     	xdef	_Last_State_E4
 612                     	xref	_Set_Led_Pwm
 613                     	xref	_Motor2Stop
 614                     	xref	_Motor2MoveCW
 615                     	xref	_Motor2MoveCCW
 616                     	xdef	_ScanEncoder4
 617                     	xdef	_ScanEncoder2
 618                     	xref	_GPIO_ReadInputData
 637                     	end
