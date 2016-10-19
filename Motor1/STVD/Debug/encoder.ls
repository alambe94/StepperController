   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  16                     	bsct
  17  0000               _Last_State_E1:
  18  0000 00            	dc.b	0
  19  0001               _Dir_Flag:
  20  0001 00            	dc.b	0
 110                     ; 14 void ScanEncoder1(void)
 110                     ; 15 {
 112                     	switch	.text
 113  0000               _ScanEncoder1:
 115  0000 89            	pushw	x
 116       00000002      OFST:	set	2
 119                     ; 16 	encoder_t Current_State =state00;
 121                     ; 17 	uint8_t temp=(GPIO_ReadInputData(ENCODER2_PORT));
 123  0001 ae500f        	ldw	x,#20495
 124  0004 cd0000        	call	_GPIO_ReadInputData
 126  0007 6b01          	ld	(OFST-1,sp),a
 127                     ; 18 	Current_State=((temp>>3)&0x01);
 129  0009 7b01          	ld	a,(OFST-1,sp)
 130  000b 44            	srl	a
 131  000c 44            	srl	a
 132  000d 44            	srl	a
 133  000e a401          	and	a,#1
 134  0010 6b02          	ld	(OFST+0,sp),a
 135                     ; 19 	Current_State|=((temp>>3)&0x02);
 137  0012 7b01          	ld	a,(OFST-1,sp)
 138  0014 44            	srl	a
 139  0015 44            	srl	a
 140  0016 44            	srl	a
 141  0017 a402          	and	a,#2
 142  0019 1a02          	or	a,(OFST+0,sp)
 143  001b 6b02          	ld	(OFST+0,sp),a
 144                     ; 22 	if(Current_State!=Last_State_E1)
 146  001d 7b02          	ld	a,(OFST+0,sp)
 147  001f b100          	cp	a,_Last_State_E1
 148  0021 2603          	jrne	L6
 149  0023 cc00b3        	jp	L16
 150  0026               L6:
 151                     ; 24 		switch(Current_State)
 153  0026 7b02          	ld	a,(OFST+0,sp)
 155                     ; 72 		 break;
 156  0028 4d            	tnz	a
 157  0029 270e          	jreq	L3
 158  002b 4a            	dec	a
 159  002c 272b          	jreq	L5
 160  002e 4a            	dec	a
 161  002f 2746          	jreq	L7
 162  0031 4a            	dec	a
 163  0032 2761          	jreq	L11
 164  0034               L31:
 165                     ; 70 		 default:
 165                     ; 71 		 Motor1Stop();
 167  0034 cd0000        	call	_Motor1Stop
 169                     ; 72 		 break;
 171  0037 207a          	jra	L16
 172  0039               L3:
 173                     ; 26 		case state00:
 173                     ; 27 		if(Last_State_E1==state10){
 175  0039 b600          	ld	a,_Last_State_E1
 176  003b a102          	cp	a,#2
 177  003d 2609          	jrne	L76
 178                     ; 28 		Dir_Flag =0;
 180  003f 3f01          	clr	_Dir_Flag
 181                     ; 29 			Motor1MoveCCW(40);}
 183  0041 a628          	ld	a,#40
 184  0043 cd0000        	call	_Motor1MoveCCW
 187  0046 206b          	jra	L16
 188  0048               L76:
 189                     ; 31 		  else if(Last_State_E1==state01){
 191  0048 b600          	ld	a,_Last_State_E1
 192  004a a101          	cp	a,#1
 193  004c 2665          	jrne	L16
 194                     ; 32 				Dir_Flag =1;
 196  004e 35010001      	mov	_Dir_Flag,#1
 197                     ; 33 							Motor1MoveCW(40);}
 199  0052 a628          	ld	a,#40
 200  0054 cd0000        	call	_Motor1MoveCW
 202  0057 205a          	jra	L16
 203  0059               L5:
 204                     ; 37 	  case state01:
 204                     ; 38 		if(Last_State_E1==state00){
 206  0059 3d00          	tnz	_Last_State_E1
 207  005b 2609          	jrne	L57
 208                     ; 39 		Dir_Flag =0;
 210  005d 3f01          	clr	_Dir_Flag
 211                     ; 40 			Motor1MoveCCW(40);}
 213  005f a628          	ld	a,#40
 214  0061 cd0000        	call	_Motor1MoveCCW
 217  0064 204d          	jra	L16
 218  0066               L57:
 219                     ; 42 		  else if(Last_State_E1==state11){
 221  0066 b600          	ld	a,_Last_State_E1
 222  0068 a103          	cp	a,#3
 223  006a 2647          	jrne	L16
 224                     ; 43 				Dir_Flag =1;
 226  006c 35010001      	mov	_Dir_Flag,#1
 227                     ; 44 							Motor1MoveCW(40);}
 229  0070 a628          	ld	a,#40
 230  0072 cd0000        	call	_Motor1MoveCW
 232  0075 203c          	jra	L16
 233  0077               L7:
 234                     ; 48 			case state10:
 234                     ; 49 		if(Last_State_E1==state11){
 236  0077 b600          	ld	a,_Last_State_E1
 237  0079 a103          	cp	a,#3
 238  007b 2609          	jrne	L301
 239                     ; 50 		Dir_Flag =0;
 241  007d 3f01          	clr	_Dir_Flag
 242                     ; 51 			Motor1MoveCCW(40);}
 244  007f a628          	ld	a,#40
 245  0081 cd0000        	call	_Motor1MoveCCW
 248  0084 202d          	jra	L16
 249  0086               L301:
 250                     ; 53 		  else if(Last_State_E1==state00){
 252  0086 3d00          	tnz	_Last_State_E1
 253  0088 2629          	jrne	L16
 254                     ; 54 				Dir_Flag =1;
 256  008a 35010001      	mov	_Dir_Flag,#1
 257                     ; 55 							Motor1MoveCW(40);}
 259  008e a628          	ld	a,#40
 260  0090 cd0000        	call	_Motor1MoveCW
 262  0093 201e          	jra	L16
 263  0095               L11:
 264                     ; 59 			case state11:
 264                     ; 60 		if(Last_State_E1==state01){
 266  0095 b600          	ld	a,_Last_State_E1
 267  0097 a101          	cp	a,#1
 268  0099 2609          	jrne	L111
 269                     ; 61 		Dir_Flag =0;
 271  009b 3f01          	clr	_Dir_Flag
 272                     ; 62 			Motor1MoveCCW(40);}
 274  009d a628          	ld	a,#40
 275  009f cd0000        	call	_Motor1MoveCCW
 278  00a2 200f          	jra	L16
 279  00a4               L111:
 280                     ; 64 		  else if(Last_State_E1==state10){
 282  00a4 b600          	ld	a,_Last_State_E1
 283  00a6 a102          	cp	a,#2
 284  00a8 2609          	jrne	L16
 285                     ; 65 				Dir_Flag =1;
 287  00aa 35010001      	mov	_Dir_Flag,#1
 288                     ; 66 							Motor1MoveCW(40);}
 290  00ae a628          	ld	a,#40
 291  00b0 cd0000        	call	_Motor1MoveCW
 293  00b3               L56:
 294  00b3               L16:
 295                     ; 77 		Last_State_E1=Current_State;
 297  00b3 7b02          	ld	a,(OFST+0,sp)
 298  00b5 b700          	ld	_Last_State_E1,a
 299                     ; 78 }
 302  00b7 85            	popw	x
 303  00b8 81            	ret
 337                     	xdef	_Dir_Flag
 338                     	xdef	_Last_State_E1
 339                     	xref	_Motor1Stop
 340                     	xref	_Motor1MoveCW
 341                     	xref	_Motor1MoveCCW
 342                     	xdef	_ScanEncoder1
 343                     	xref	_GPIO_ReadInputData
 362                     	end
