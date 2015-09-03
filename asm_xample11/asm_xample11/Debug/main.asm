   1              		.cpu cortex-m0
   2              		.fpu softvfp
   3              		.eabi_attribute 20, 1
   4              		.eabi_attribute 21, 1
   5              		.eabi_attribute 23, 3
   6              		.eabi_attribute 24, 1
   7              		.eabi_attribute 25, 1
   8              		.eabi_attribute 26, 1
   9              		.eabi_attribute 30, 6
  10              		.eabi_attribute 34, 0
  11              		.eabi_attribute 18, 4
  12              		.code	16
  13              		.file	"main.c"
  14              		.text
  15              	.Ltext0:
  16              		.cfi_sections	.debug_frame
  17              		.section	.rodata
  18              		.align	2
  21              	LPC_GPIO:
  22 0000 00000050 		.word	1342177280
  23 0004 00000150 		.word	1342242816
  24 0008 00000250 		.word	1342308352
  25 000c 00000350 		.word	1342373888
  26              		.global	__aeabi_idivmod
  27              		.global	__aeabi_idiv
  28              		.align	2
  29              	.LC0:
  30 0010 31313131 		.ascii	"11111\000"
  30      3100
  31 0016 30313131 		.ascii	"01111\000"
  31      3100
  32 001c 30303131 		.ascii	"00111\000"
  32      3100
  33 0022 30303031 		.ascii	"00011\000"
  33      3100
  34 0028 30303030 		.ascii	"00001\000"
  34      3100
  35 002e 30303030 		.ascii	"00000\000"
  35      3000
  36 0034 31303030 		.ascii	"10000\000"
  36      3000
  37 003a 31313030 		.ascii	"11000\000"
  37      3000
  38 0040 31313130 		.ascii	"11100\000"
  38      3000
  39 0046 31313131 		.ascii	"11110\000"
  39      3000
  40              		.section	.text.translateFib,"ax",%progbits
  41              		.align	2
  42              		.global	translateFib
  43              		.code	16
  44              		.thumb_func
  46              	translateFib:
  47              	.LFB20:
  48              		.file 1 "../src/main.c"
   1:../src/main.c **** #include "driver_config.h"
   2:../src/main.c **** #include <stdio.h>
   3:../src/main.c **** #include <stdlib.h>
   4:../src/main.c **** 
   5:../src/main.c **** 
   6:../src/main.c **** #include "timer32.h"
   7:../src/main.c **** #include "gpio.h"
   8:../src/main.c **** 
   9:../src/main.c **** 
  10:../src/main.c **** extern int fibonacci(int n);
  11:../src/main.c **** 
  12:../src/main.c **** int translateFib(int fibNum) {
  49              		.loc 1 12 0
  50              		.cfi_startproc
  51 0000 80B5     		push	{r7, lr}
  52              	.LCFI0:
  53              		.cfi_def_cfa_offset 8
  54              		.cfi_offset 7, -8
  55              		.cfi_offset 14, -4
  56 0002 A2B0     		sub	sp, sp, #136
  57              	.LCFI1:
  58              		.cfi_def_cfa_offset 144
  59 0004 00AF     		add	r7, sp, #0
  60              	.LCFI2:
  61              		.cfi_def_cfa_register 7
  62 0006 7860     		str	r0, [r7, #4]
  13:../src/main.c **** 	char morse[10][6] = {"11111", "01111", "00111", "00011", "00001", "00000", "10000", "11000", "1110
  63              		.loc 1 13 0
  64 0008 3A1C     		mov	r2, r7
  65 000a 3432     		add	r2, r2, #52
  66 000c 704B     		ldr	r3, .L13
  67 000e 111C     		mov	r1, r2
  68 0010 1A1C     		mov	r2, r3
  69 0012 3C23     		mov	r3, #60
  70 0014 081C     		mov	r0, r1
  71 0016 111C     		mov	r1, r2
  72 0018 1A1C     		mov	r2, r3
  73 001a FFF7FEFF 		bl	memcpy
  14:../src/main.c **** 	int i=0;
  74              		.loc 1 14 0
  75 001e 0023     		mov	r3, #0
  76 0020 8420     		mov	r0, #132
  77 0022 C019     		add	r0, r0, r7
  78 0024 0360     		str	r3, [r0]
  15:../src/main.c **** 	char* digitArray[10];
  16:../src/main.c **** 	while(fibNum >0)
  79              		.loc 1 16 0
  80 0026 68E0     		b	.L2
  81              	.L7:
  82              	.LBB2:
  17:../src/main.c **** 	{
  18:../src/main.c **** 		int digit = fibNum % 16;
  83              		.loc 1 18 0
  84 0028 7A68     		ldr	r2, [r7, #4]
  85 002a 6A4B     		ldr	r3, .L13+4
  86 002c 1340     		and	r3, r2
  87 002e 04D5     		bpl	.L3
  88 0030 013B     		sub	r3, r3, #1
  89 0032 1022     		mov	r2, #16
  90 0034 5242     		neg	r2, r2
  91 0036 1343     		orr	r3, r2
  92 0038 0133     		add	r3, r3, #1
  93              	.L3:
  94 003a FB67     		str	r3, [r7, #124]
  19:../src/main.c **** 		if (digit >= 10)
  95              		.loc 1 19 0
  96 003c FB6F     		ldr	r3, [r7, #124]
  97 003e 092B     		cmp	r3, #9
  98 0040 3FDD     		ble	.L4
  99              	.LBB3:
  20:../src/main.c **** 		{
  21:../src/main.c **** 			int digit1 = digit % 10;
 100              		.loc 1 21 0
 101 0042 FB6F     		ldr	r3, [r7, #124]
 102 0044 181C     		mov	r0, r3
 103 0046 0A21     		mov	r1, #10
 104 0048 FFF7FEFF 		bl	__aeabi_idivmod
 105 004c 0B1C     		mov	r3, r1
 106 004e BB67     		str	r3, [r7, #120]
  22:../src/main.c **** 			int digit2 = (digit/10)%10;
 107              		.loc 1 22 0
 108 0050 FB6F     		ldr	r3, [r7, #124]
 109 0052 181C     		mov	r0, r3
 110 0054 0A21     		mov	r1, #10
 111 0056 FFF7FEFF 		bl	__aeabi_idiv
 112 005a 031C     		mov	r3, r0
 113 005c 181C     		mov	r0, r3
 114 005e 0A21     		mov	r1, #10
 115 0060 FFF7FEFF 		bl	__aeabi_idivmod
 116 0064 0B1C     		mov	r3, r1
 117 0066 7B67     		str	r3, [r7, #116]
  23:../src/main.c **** 			digitArray[i] = morse[digit2];
 118              		.loc 1 23 0
 119 0068 7A6F     		ldr	r2, [r7, #116]
 120 006a 131C     		mov	r3, r2
 121 006c 5B00     		lsl	r3, r3, #1
 122 006e 9B18     		add	r3, r3, r2
 123 0070 5B00     		lsl	r3, r3, #1
 124 0072 3A1C     		mov	r2, r7
 125 0074 3432     		add	r2, r2, #52
 126 0076 D118     		add	r1, r2, r3
 127 0078 3B1C     		mov	r3, r7
 128 007a 0C33     		add	r3, r3, #12
 129 007c 8420     		mov	r0, #132
 130 007e C019     		add	r0, r0, r7
 131 0080 0268     		ldr	r2, [r0]
 132 0082 9200     		lsl	r2, r2, #2
 133 0084 D150     		str	r1, [r2, r3]
  24:../src/main.c **** 			i++;
 134              		.loc 1 24 0
 135 0086 8421     		mov	r1, #132
 136 0088 C919     		add	r1, r1, r7
 137 008a 0B68     		ldr	r3, [r1]
 138 008c 0133     		add	r3, r3, #1
 139 008e 8422     		mov	r2, #132
 140 0090 D219     		add	r2, r2, r7
 141 0092 1360     		str	r3, [r2]
  25:../src/main.c **** 			digitArray[i] = morse[digit1];
 142              		.loc 1 25 0
 143 0094 BA6F     		ldr	r2, [r7, #120]
 144 0096 131C     		mov	r3, r2
 145 0098 5B00     		lsl	r3, r3, #1
 146 009a 9B18     		add	r3, r3, r2
 147 009c 5B00     		lsl	r3, r3, #1
 148 009e 3A1C     		mov	r2, r7
 149 00a0 3432     		add	r2, r2, #52
 150 00a2 D118     		add	r1, r2, r3
 151 00a4 3B1C     		mov	r3, r7
 152 00a6 0C33     		add	r3, r3, #12
 153 00a8 8420     		mov	r0, #132
 154 00aa C019     		add	r0, r0, r7
 155 00ac 0268     		ldr	r2, [r0]
 156 00ae 9200     		lsl	r2, r2, #2
 157 00b0 D150     		str	r1, [r2, r3]
  26:../src/main.c **** 			i++;
 158              		.loc 1 26 0
 159 00b2 8421     		mov	r1, #132
 160 00b4 C919     		add	r1, r1, r7
 161 00b6 0B68     		ldr	r3, [r1]
 162 00b8 0133     		add	r3, r3, #1
 163 00ba 8422     		mov	r2, #132
 164 00bc D219     		add	r2, r2, r7
 165 00be 1360     		str	r3, [r2]
 166 00c0 15E0     		b	.L5
 167              	.L4:
 168              	.LBE3:
  27:../src/main.c **** 		}else{
  28:../src/main.c **** 			digitArray[i] = morse[digit];
 169              		.loc 1 28 0
 170 00c2 FA6F     		ldr	r2, [r7, #124]
 171 00c4 131C     		mov	r3, r2
 172 00c6 5B00     		lsl	r3, r3, #1
 173 00c8 9B18     		add	r3, r3, r2
 174 00ca 5B00     		lsl	r3, r3, #1
 175 00cc 3A1C     		mov	r2, r7
 176 00ce 3432     		add	r2, r2, #52
 177 00d0 D118     		add	r1, r2, r3
 178 00d2 3B1C     		mov	r3, r7
 179 00d4 0C33     		add	r3, r3, #12
 180 00d6 8420     		mov	r0, #132
 181 00d8 C019     		add	r0, r0, r7
 182 00da 0268     		ldr	r2, [r0]
 183 00dc 9200     		lsl	r2, r2, #2
 184 00de D150     		str	r1, [r2, r3]
  29:../src/main.c **** 			i++;
 185              		.loc 1 29 0
 186 00e0 8421     		mov	r1, #132
 187 00e2 C919     		add	r1, r1, r7
 188 00e4 0B68     		ldr	r3, [r1]
 189 00e6 0133     		add	r3, r3, #1
 190 00e8 8422     		mov	r2, #132
 191 00ea D219     		add	r2, r2, r7
 192 00ec 1360     		str	r3, [r2]
 193              	.L5:
  30:../src/main.c **** 		}
  31:../src/main.c **** 
  32:../src/main.c **** 		fibNum /= 16;
 194              		.loc 1 32 0
 195 00ee 7B68     		ldr	r3, [r7, #4]
 196 00f0 002B     		cmp	r3, #0
 197 00f2 00DA     		bge	.L6
 198 00f4 0F33     		add	r3, r3, #15
 199              	.L6:
 200 00f6 1B11     		asr	r3, r3, #4
 201 00f8 7B60     		str	r3, [r7, #4]
 202              	.L2:
 203              	.LBE2:
  16:../src/main.c **** 	while(fibNum >0)
 204              		.loc 1 16 0 discriminator 1
 205 00fa 7B68     		ldr	r3, [r7, #4]
 206 00fc 002B     		cmp	r3, #0
 207 00fe 93DC     		bgt	.L7
  33:../src/main.c **** 	}
  34:../src/main.c **** 	int j=i-1;
 208              		.loc 1 34 0
 209 0100 8420     		mov	r0, #132
 210 0102 C019     		add	r0, r0, r7
 211 0104 0368     		ldr	r3, [r0]
 212 0106 013B     		sub	r3, r3, #1
 213 0108 8021     		mov	r1, #128
 214 010a C919     		add	r1, r1, r7
 215 010c 0B60     		str	r3, [r1]
  35:../src/main.c **** 	for(j=i-1; j<10; j--){
 216              		.loc 1 35 0
 217 010e 8422     		mov	r2, #132
 218 0110 D219     		add	r2, r2, r7
 219 0112 1368     		ldr	r3, [r2]
 220 0114 013B     		sub	r3, r3, #1
 221 0116 8020     		mov	r0, #128
 222 0118 C019     		add	r0, r0, r7
 223 011a 0360     		str	r3, [r0]
 224 011c 4DE0     		b	.L8
 225              	.L12:
 226              	.LBB4:
  36:../src/main.c **** 		int blinkNum = 0;
 227              		.loc 1 36 0
 228 011e 0023     		mov	r3, #0
 229 0120 3B67     		str	r3, [r7, #112]
  37:../src/main.c **** 		while(blinkNum<5){
 230              		.loc 1 37 0
 231 0122 40E0     		b	.L9
 232              	.L11:
  38:../src/main.c **** 			if(digitArray[j][blinkNum]==0){
 233              		.loc 1 38 0
 234 0124 3B1C     		mov	r3, r7
 235 0126 0C33     		add	r3, r3, #12
 236 0128 8021     		mov	r1, #128
 237 012a C919     		add	r1, r1, r7
 238 012c 0A68     		ldr	r2, [r1]
 239 012e 9200     		lsl	r2, r2, #2
 240 0130 D258     		ldr	r2, [r2, r3]
 241 0132 3B6F     		ldr	r3, [r7, #112]
 242 0134 D318     		add	r3, r2, r3
 243 0136 1B78     		ldrb	r3, [r3]
 244 0138 002B     		cmp	r3, #0
 245 013a 14D1     		bne	.L10
 246              	.LBB5:
  39:../src/main.c **** 				//blink short
  40:../src/main.c **** 				GPIOSetValue( 0, 7, 1 );
 247              		.loc 1 40 0
 248 013c 0020     		mov	r0, #0
 249 013e 0721     		mov	r1, #7
 250 0140 0122     		mov	r2, #1
 251 0142 FFF7FEFF 		bl	GPIOSetValue
  41:../src/main.c **** 				sleep(500);
 252              		.loc 1 41 0
 253 0146 FA23     		mov	r3, #250
 254 0148 5B00     		lsl	r3, r3, #1
 255 014a 181C     		mov	r0, r3
 256 014c FFF7FEFF 		bl	sleep
  42:../src/main.c **** 				GPIOSetValue( 0, 7, 0 );
 257              		.loc 1 42 0
 258 0150 0020     		mov	r0, #0
 259 0152 0721     		mov	r1, #7
 260 0154 0022     		mov	r2, #0
 261 0156 FFF7FEFF 		bl	GPIOSetValue
  43:../src/main.c **** 				sleep(500);
 262              		.loc 1 43 0
 263 015a FA23     		mov	r3, #250
 264 015c 5B00     		lsl	r3, r3, #1
 265 015e 181C     		mov	r0, r3
 266 0160 FFF7FEFF 		bl	sleep
 267 0164 1FE0     		b	.L9
 268              	.L10:
 269              	.LBE5:
  44:../src/main.c **** 			}else if(digitArray[j][blinkNum]==1){
 270              		.loc 1 44 0
 271 0166 3B1C     		mov	r3, r7
 272 0168 0C33     		add	r3, r3, #12
 273 016a 8020     		mov	r0, #128
 274 016c C019     		add	r0, r0, r7
 275 016e 0268     		ldr	r2, [r0]
 276 0170 9200     		lsl	r2, r2, #2
 277 0172 D258     		ldr	r2, [r2, r3]
 278 0174 3B6F     		ldr	r3, [r7, #112]
 279 0176 D318     		add	r3, r2, r3
 280 0178 1B78     		ldrb	r3, [r3]
 281 017a 012B     		cmp	r3, #1
 282 017c 13D1     		bne	.L9
 283              	.LBB6:
  45:../src/main.c **** 				//blink long
  46:../src/main.c **** 				GPIOSetValue( 0, 7, 1 );
 284              		.loc 1 46 0
 285 017e 0020     		mov	r0, #0
 286 0180 0721     		mov	r1, #7
 287 0182 0122     		mov	r2, #1
 288 0184 FFF7FEFF 		bl	GPIOSetValue
  47:../src/main.c **** 				sleep(1000);
 289              		.loc 1 47 0
 290 0188 FA23     		mov	r3, #250
 291 018a 9B00     		lsl	r3, r3, #2
 292 018c 181C     		mov	r0, r3
 293 018e FFF7FEFF 		bl	sleep
  48:../src/main.c **** 				GPIOSetValue( 0, 7, 0 );
 294              		.loc 1 48 0
 295 0192 0020     		mov	r0, #0
 296 0194 0721     		mov	r1, #7
 297 0196 0022     		mov	r2, #0
 298 0198 FFF7FEFF 		bl	GPIOSetValue
  49:../src/main.c **** 				sleep(500);
 299              		.loc 1 49 0
 300 019c FA23     		mov	r3, #250
 301 019e 5B00     		lsl	r3, r3, #1
 302 01a0 181C     		mov	r0, r3
 303 01a2 FFF7FEFF 		bl	sleep
 304              	.L9:
 305              	.LBE6:
  37:../src/main.c **** 		while(blinkNum<5){
 306              		.loc 1 37 0 discriminator 1
 307 01a6 3B6F     		ldr	r3, [r7, #112]
 308 01a8 042B     		cmp	r3, #4
 309 01aa BBDD     		ble	.L11
 310              	.LBE4:
  35:../src/main.c **** 	for(j=i-1; j<10; j--){
 311              		.loc 1 35 0
 312 01ac 8021     		mov	r1, #128
 313 01ae C919     		add	r1, r1, r7
 314 01b0 0B68     		ldr	r3, [r1]
 315 01b2 013B     		sub	r3, r3, #1
 316 01b4 8022     		mov	r2, #128
 317 01b6 D219     		add	r2, r2, r7
 318 01b8 1360     		str	r3, [r2]
 319              	.L8:
  35:../src/main.c **** 	for(j=i-1; j<10; j--){
 320              		.loc 1 35 0 is_stmt 0 discriminator 1
 321 01ba 8020     		mov	r0, #128
 322 01bc C019     		add	r0, r0, r7
 323 01be 0368     		ldr	r3, [r0]
 324 01c0 092B     		cmp	r3, #9
 325 01c2 ACDD     		ble	.L12
  50:../src/main.c **** 			}
  51:../src/main.c **** 		}
  52:../src/main.c **** 	}
  53:../src/main.c **** 	return 1;
 326              		.loc 1 53 0 is_stmt 1
 327 01c4 0123     		mov	r3, #1
  54:../src/main.c **** }
 328              		.loc 1 54 0
 329 01c6 181C     		mov	r0, r3
 330 01c8 BD46     		mov	sp, r7
 331 01ca 22B0     		add	sp, sp, #136
 332              		@ sp needed for prologue
 333 01cc 80BD     		pop	{r7, pc}
 334              	.L14:
 335 01ce C046     		.align	2
 336              	.L13:
 337 01d0 10000000 		.word	.LC0
 338 01d4 0F000080 		.word	-2147483633
 339              		.cfi_endproc
 340              	.LFE20:
 342              		.section	.text.main,"ax",%progbits
 343              		.align	2
 344              		.global	main
 345              		.code	16
 346              		.thumb_func
 348              	main:
 349              	.LFB21:
  55:../src/main.c **** 
  56:../src/main.c **** int main(void) {
 350              		.loc 1 56 0
 351              		.cfi_startproc
 352 0000 80B5     		push	{r7, lr}
 353              	.LCFI3:
 354              		.cfi_def_cfa_offset 8
 355              		.cfi_offset 7, -8
 356              		.cfi_offset 14, -4
 357 0002 82B0     		sub	sp, sp, #8
 358              	.LCFI4:
 359              		.cfi_def_cfa_offset 16
 360 0004 00AF     		add	r7, sp, #0
 361              	.LCFI5:
 362              		.cfi_def_cfa_register 7
  57:../src/main.c **** 	  GPIOInit();
 363              		.loc 1 57 0
 364 0006 FFF7FEFF 		bl	GPIOInit
  58:../src/main.c **** 	  /* Set LED port pin to output */
  59:../src/main.c **** 	  GPIOSetDir( 0, 7, 1 );
 365              		.loc 1 59 0
 366 000a 0020     		mov	r0, #0
 367 000c 0721     		mov	r1, #7
 368 000e 0122     		mov	r2, #1
 369 0010 FFF7FEFF 		bl	GPIOSetDir
  60:../src/main.c **** 	int i=1;
 370              		.loc 1 60 0
 371 0014 0123     		mov	r3, #1
 372 0016 7B60     		str	r3, [r7, #4]
  61:../src/main.c **** 	int fibNum;
  62:../src/main.c **** 	for(i=1; i <=20; i++){
 373              		.loc 1 62 0
 374 0018 0123     		mov	r3, #1
 375 001a 7B60     		str	r3, [r7, #4]
 376 001c 0CE0     		b	.L16
 377              	.L17:
  63:../src/main.c **** 		fibNum = fibonacci(i);
 378              		.loc 1 63 0 discriminator 2
 379 001e 7B68     		ldr	r3, [r7, #4]
 380 0020 181C     		mov	r0, r3
 381 0022 FFF7FEFF 		bl	fibonacci
 382 0026 031C     		mov	r3, r0
 383 0028 3B60     		str	r3, [r7]
  64:../src/main.c **** 		translateFib(fibNum);
 384              		.loc 1 64 0 discriminator 2
 385 002a 3B68     		ldr	r3, [r7]
 386 002c 181C     		mov	r0, r3
 387 002e FFF7FEFF 		bl	translateFib
  62:../src/main.c **** 	for(i=1; i <=20; i++){
 388              		.loc 1 62 0 discriminator 2
 389 0032 7B68     		ldr	r3, [r7, #4]
 390 0034 0133     		add	r3, r3, #1
 391 0036 7B60     		str	r3, [r7, #4]
 392              	.L16:
  62:../src/main.c **** 	for(i=1; i <=20; i++){
 393              		.loc 1 62 0 is_stmt 0 discriminator 1
 394 0038 7B68     		ldr	r3, [r7, #4]
 395 003a 142B     		cmp	r3, #20
 396 003c EFDD     		ble	.L17
  65:../src/main.c **** 	}
  66:../src/main.c **** }
 397              		.loc 1 66 0 is_stmt 1
 398 003e 181C     		mov	r0, r3
 399 0040 BD46     		mov	sp, r7
 400 0042 02B0     		add	sp, sp, #8
 401              		@ sp needed for prologue
 402 0044 80BD     		pop	{r7, pc}
 403              		.cfi_endproc
 404              	.LFE21:
 406 0046 C046     		.text
 407              	.Letext0:
 408              		.file 2 "/Users/madisonrockwell/Downloads/asm_xample11/asm_xample11/cmsis/LPC11xx.h"
 409              		.file 3 "/Applications/lpcxpresso_6.1.2_177/lpcxpresso/tools/bin/../lib/gcc/arm-none-eabi/4.6.2/..
 410              		.file 4 "/Users/madisonrockwell/Downloads/asm_xample11/asm_xample11/driver/gpio.h"
DEFINED SYMBOLS
                            *ABS*:0000000000000000 main.c
/var/folders/8z/dt12xkd563bf9zk7z_2wjk9m0000gn/T//ccEpP2ve.s:18     .rodata:0000000000000000 $d
/var/folders/8z/dt12xkd563bf9zk7z_2wjk9m0000gn/T//ccEpP2ve.s:21     .rodata:0000000000000000 LPC_GPIO
/var/folders/8z/dt12xkd563bf9zk7z_2wjk9m0000gn/T//ccEpP2ve.s:41     .text.translateFib:0000000000000000 $t
/var/folders/8z/dt12xkd563bf9zk7z_2wjk9m0000gn/T//ccEpP2ve.s:46     .text.translateFib:0000000000000000 translateFib
/var/folders/8z/dt12xkd563bf9zk7z_2wjk9m0000gn/T//ccEpP2ve.s:337    .text.translateFib:00000000000001d0 $d
/var/folders/8z/dt12xkd563bf9zk7z_2wjk9m0000gn/T//ccEpP2ve.s:343    .text.main:0000000000000000 $t
/var/folders/8z/dt12xkd563bf9zk7z_2wjk9m0000gn/T//ccEpP2ve.s:348    .text.main:0000000000000000 main
                     .debug_frame:0000000000000010 $d

UNDEFINED SYMBOLS
__aeabi_idivmod
__aeabi_idiv
memcpy
GPIOSetValue
sleep
GPIOInit
GPIOSetDir
fibonacci
