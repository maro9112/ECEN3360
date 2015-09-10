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
  26              		.section	.text._delay_ms,"ax",%progbits
  27              		.align	2
  28              		.global	_delay_ms
  29              		.code	16
  30              		.thumb_func
  32              	_delay_ms:
  33              	.LFB20:
  34              		.file 1 "../src/main.c"
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
  12:../src/main.c **** 
  13:../src/main.c **** //code from https://www.lpcware.com/content/forum/what-do-you-use-to-delay
  14:../src/main.c **** void _delay_ms (uint16_t ms)
  15:../src/main.c **** {
  35              		.loc 1 15 0
  36              		.cfi_startproc
  37 0000 80B5     		push	{r7, lr}
  38              	.LCFI0:
  39              		.cfi_def_cfa_offset 8
  40              		.cfi_offset 7, -8
  41              		.cfi_offset 14, -4
  42 0002 84B0     		sub	sp, sp, #16
  43              	.LCFI1:
  44              		.cfi_def_cfa_offset 24
  45 0004 00AF     		add	r7, sp, #0
  46              	.LCFI2:
  47              		.cfi_def_cfa_register 7
  48 0006 021C     		mov	r2, r0
  49 0008 BB1D     		add	r3, r7, #6
  50 000a 1A80     		strh	r2, [r3]
  16:../src/main.c ****  uint16_t delay;
  17:../src/main.c ****  volatile uint32_t i;
  18:../src/main.c ****  for (delay = ms; delay >0 ; delay--)
  51              		.loc 1 18 0
  52 000c 3B1C     		mov	r3, r7
  53 000e 0E33     		add	r3, r3, #14
  54 0010 BA1D     		add	r2, r7, #6
  55 0012 1288     		ldrh	r2, [r2]
  56 0014 1A80     		strh	r2, [r3]
  57 0016 0FE0     		b	.L2
  58              	.L5:
  19:../src/main.c **** //1ms loop with -Os optimisation
  20:../src/main.c ****   {
  21:../src/main.c ****   for (i=3500; i >0;i--){};
  59              		.loc 1 21 0
  60 0018 0B4B     		ldr	r3, .L6
  61 001a BB60     		str	r3, [r7, #8]
  62 001c 02E0     		b	.L3
  63              	.L4:
  64              		.loc 1 21 0 is_stmt 0 discriminator 2
  65 001e BB68     		ldr	r3, [r7, #8]
  66 0020 013B     		sub	r3, r3, #1
  67 0022 BB60     		str	r3, [r7, #8]
  68              	.L3:
  69              		.loc 1 21 0 discriminator 1
  70 0024 BB68     		ldr	r3, [r7, #8]
  71 0026 002B     		cmp	r3, #0
  72 0028 F9D1     		bne	.L4
  18:../src/main.c ****  for (delay = ms; delay >0 ; delay--)
  73              		.loc 1 18 0 is_stmt 1
  74 002a 3B1C     		mov	r3, r7
  75 002c 0E33     		add	r3, r3, #14
  76 002e 3A1C     		mov	r2, r7
  77 0030 0E32     		add	r2, r2, #14
  78 0032 1288     		ldrh	r2, [r2]
  79 0034 013A     		sub	r2, r2, #1
  80 0036 1A80     		strh	r2, [r3]
  81              	.L2:
  18:../src/main.c ****  for (delay = ms; delay >0 ; delay--)
  82              		.loc 1 18 0 is_stmt 0 discriminator 1
  83 0038 3B1C     		mov	r3, r7
  84 003a 0E33     		add	r3, r3, #14
  85 003c 1B88     		ldrh	r3, [r3]
  86 003e 002B     		cmp	r3, #0
  87 0040 EAD1     		bne	.L5
  22:../src/main.c ****   }
  23:../src/main.c **** }
  88              		.loc 1 23 0 is_stmt 1
  89 0042 BD46     		mov	sp, r7
  90 0044 04B0     		add	sp, sp, #16
  91              		@ sp needed for prologue
  92 0046 80BD     		pop	{r7, pc}
  93              	.L7:
  94              		.align	2
  95              	.L6:
  96 0048 AC0D0000 		.word	3500
  97              		.cfi_endproc
  98              	.LFE20:
 100              		.global	__aeabi_idivmod
 101              		.global	__aeabi_idiv
 102              		.section	.rodata
 103              		.align	2
 104              	.LC0:
 105 0010 31313131 		.ascii	"11111\000"
 105      3100
 106 0016 30313131 		.ascii	"01111\000"
 106      3100
 107 001c 30303131 		.ascii	"00111\000"
 107      3100
 108 0022 30303031 		.ascii	"00011\000"
 108      3100
 109 0028 30303030 		.ascii	"00001\000"
 109      3100
 110 002e 30303030 		.ascii	"00000\000"
 110      3000
 111 0034 31303030 		.ascii	"10000\000"
 111      3000
 112 003a 31313030 		.ascii	"11000\000"
 112      3000
 113 0040 31313130 		.ascii	"11100\000"
 113      3000
 114 0046 31313131 		.ascii	"11110\000"
 114      3000
 115              		.section	.text.translateFib,"ax",%progbits
 116              		.align	2
 117              		.global	translateFib
 118              		.code	16
 119              		.thumb_func
 121              	translateFib:
 122              	.LFB21:
  24:../src/main.c **** 
  25:../src/main.c **** int translateFib(int fibNum) {
 123              		.loc 1 25 0
 124              		.cfi_startproc
 125 0000 80B5     		push	{r7, lr}
 126              	.LCFI3:
 127              		.cfi_def_cfa_offset 8
 128              		.cfi_offset 7, -8
 129              		.cfi_offset 14, -4
 130 0002 A2B0     		sub	sp, sp, #136
 131              	.LCFI4:
 132              		.cfi_def_cfa_offset 144
 133 0004 00AF     		add	r7, sp, #0
 134              	.LCFI5:
 135              		.cfi_def_cfa_register 7
 136 0006 7860     		str	r0, [r7, #4]
  26:../src/main.c **** 	char morse[10][6] = {"11111", "01111", "00111", "00011", "00001", "00000", "10000", "11000", "1110
 137              		.loc 1 26 0
 138 0008 3A1C     		mov	r2, r7
 139 000a 3432     		add	r2, r2, #52
 140 000c 704B     		ldr	r3, .L20
 141 000e 111C     		mov	r1, r2
 142 0010 1A1C     		mov	r2, r3
 143 0012 3C23     		mov	r3, #60
 144 0014 081C     		mov	r0, r1
 145 0016 111C     		mov	r1, r2
 146 0018 1A1C     		mov	r2, r3
 147 001a FFF7FEFF 		bl	memcpy
  27:../src/main.c **** 	int i=0;
 148              		.loc 1 27 0
 149 001e 0023     		mov	r3, #0
 150 0020 8420     		mov	r0, #132
 151 0022 C019     		add	r0, r0, r7
 152 0024 0360     		str	r3, [r0]
  28:../src/main.c **** 	char* digitArray[10];
  29:../src/main.c **** 	while(fibNum >0)
 153              		.loc 1 29 0
 154 0026 68E0     		b	.L9
 155              	.L14:
 156              	.LBB2:
  30:../src/main.c **** 	{
  31:../src/main.c **** 		int digit = fibNum % 16;
 157              		.loc 1 31 0
 158 0028 7A68     		ldr	r2, [r7, #4]
 159 002a 6A4B     		ldr	r3, .L20+4
 160 002c 1340     		and	r3, r2
 161 002e 04D5     		bpl	.L10
 162 0030 013B     		sub	r3, r3, #1
 163 0032 1022     		mov	r2, #16
 164 0034 5242     		neg	r2, r2
 165 0036 1343     		orr	r3, r2
 166 0038 0133     		add	r3, r3, #1
 167              	.L10:
 168 003a FB67     		str	r3, [r7, #124]
  32:../src/main.c **** 		if (digit >= 10)
 169              		.loc 1 32 0
 170 003c FB6F     		ldr	r3, [r7, #124]
 171 003e 092B     		cmp	r3, #9
 172 0040 3FDD     		ble	.L11
 173              	.LBB3:
  33:../src/main.c **** 		{
  34:../src/main.c **** 			int digit1 = digit % 10;
 174              		.loc 1 34 0
 175 0042 FB6F     		ldr	r3, [r7, #124]
 176 0044 181C     		mov	r0, r3
 177 0046 0A21     		mov	r1, #10
 178 0048 FFF7FEFF 		bl	__aeabi_idivmod
 179 004c 0B1C     		mov	r3, r1
 180 004e BB67     		str	r3, [r7, #120]
  35:../src/main.c **** 			int digit2 = (digit/10)%10;
 181              		.loc 1 35 0
 182 0050 FB6F     		ldr	r3, [r7, #124]
 183 0052 181C     		mov	r0, r3
 184 0054 0A21     		mov	r1, #10
 185 0056 FFF7FEFF 		bl	__aeabi_idiv
 186 005a 031C     		mov	r3, r0
 187 005c 181C     		mov	r0, r3
 188 005e 0A21     		mov	r1, #10
 189 0060 FFF7FEFF 		bl	__aeabi_idivmod
 190 0064 0B1C     		mov	r3, r1
 191 0066 7B67     		str	r3, [r7, #116]
  36:../src/main.c **** 			digitArray[i] = morse[digit2];
 192              		.loc 1 36 0
 193 0068 7A6F     		ldr	r2, [r7, #116]
 194 006a 131C     		mov	r3, r2
 195 006c 5B00     		lsl	r3, r3, #1
 196 006e 9B18     		add	r3, r3, r2
 197 0070 5B00     		lsl	r3, r3, #1
 198 0072 3A1C     		mov	r2, r7
 199 0074 3432     		add	r2, r2, #52
 200 0076 D118     		add	r1, r2, r3
 201 0078 3B1C     		mov	r3, r7
 202 007a 0C33     		add	r3, r3, #12
 203 007c 8420     		mov	r0, #132
 204 007e C019     		add	r0, r0, r7
 205 0080 0268     		ldr	r2, [r0]
 206 0082 9200     		lsl	r2, r2, #2
 207 0084 D150     		str	r1, [r2, r3]
  37:../src/main.c **** 			i++;
 208              		.loc 1 37 0
 209 0086 8421     		mov	r1, #132
 210 0088 C919     		add	r1, r1, r7
 211 008a 0B68     		ldr	r3, [r1]
 212 008c 0133     		add	r3, r3, #1
 213 008e 8422     		mov	r2, #132
 214 0090 D219     		add	r2, r2, r7
 215 0092 1360     		str	r3, [r2]
  38:../src/main.c **** 			digitArray[i] = morse[digit1];
 216              		.loc 1 38 0
 217 0094 BA6F     		ldr	r2, [r7, #120]
 218 0096 131C     		mov	r3, r2
 219 0098 5B00     		lsl	r3, r3, #1
 220 009a 9B18     		add	r3, r3, r2
 221 009c 5B00     		lsl	r3, r3, #1
 222 009e 3A1C     		mov	r2, r7
 223 00a0 3432     		add	r2, r2, #52
 224 00a2 D118     		add	r1, r2, r3
 225 00a4 3B1C     		mov	r3, r7
 226 00a6 0C33     		add	r3, r3, #12
 227 00a8 8420     		mov	r0, #132
 228 00aa C019     		add	r0, r0, r7
 229 00ac 0268     		ldr	r2, [r0]
 230 00ae 9200     		lsl	r2, r2, #2
 231 00b0 D150     		str	r1, [r2, r3]
  39:../src/main.c **** 			i++;
 232              		.loc 1 39 0
 233 00b2 8421     		mov	r1, #132
 234 00b4 C919     		add	r1, r1, r7
 235 00b6 0B68     		ldr	r3, [r1]
 236 00b8 0133     		add	r3, r3, #1
 237 00ba 8422     		mov	r2, #132
 238 00bc D219     		add	r2, r2, r7
 239 00be 1360     		str	r3, [r2]
 240 00c0 15E0     		b	.L12
 241              	.L11:
 242              	.LBE3:
  40:../src/main.c **** 		}else{
  41:../src/main.c **** 			digitArray[i] = morse[digit];
 243              		.loc 1 41 0
 244 00c2 FA6F     		ldr	r2, [r7, #124]
 245 00c4 131C     		mov	r3, r2
 246 00c6 5B00     		lsl	r3, r3, #1
 247 00c8 9B18     		add	r3, r3, r2
 248 00ca 5B00     		lsl	r3, r3, #1
 249 00cc 3A1C     		mov	r2, r7
 250 00ce 3432     		add	r2, r2, #52
 251 00d0 D118     		add	r1, r2, r3
 252 00d2 3B1C     		mov	r3, r7
 253 00d4 0C33     		add	r3, r3, #12
 254 00d6 8420     		mov	r0, #132
 255 00d8 C019     		add	r0, r0, r7
 256 00da 0268     		ldr	r2, [r0]
 257 00dc 9200     		lsl	r2, r2, #2
 258 00de D150     		str	r1, [r2, r3]
  42:../src/main.c **** 			i++;
 259              		.loc 1 42 0
 260 00e0 8421     		mov	r1, #132
 261 00e2 C919     		add	r1, r1, r7
 262 00e4 0B68     		ldr	r3, [r1]
 263 00e6 0133     		add	r3, r3, #1
 264 00e8 8422     		mov	r2, #132
 265 00ea D219     		add	r2, r2, r7
 266 00ec 1360     		str	r3, [r2]
 267              	.L12:
  43:../src/main.c **** 		}
  44:../src/main.c **** 
  45:../src/main.c **** 		fibNum /= 16;
 268              		.loc 1 45 0
 269 00ee 7B68     		ldr	r3, [r7, #4]
 270 00f0 002B     		cmp	r3, #0
 271 00f2 00DA     		bge	.L13
 272 00f4 0F33     		add	r3, r3, #15
 273              	.L13:
 274 00f6 1B11     		asr	r3, r3, #4
 275 00f8 7B60     		str	r3, [r7, #4]
 276              	.L9:
 277              	.LBE2:
  29:../src/main.c **** 	while(fibNum >0)
 278              		.loc 1 29 0 discriminator 1
 279 00fa 7B68     		ldr	r3, [r7, #4]
 280 00fc 002B     		cmp	r3, #0
 281 00fe 93DC     		bgt	.L14
  46:../src/main.c **** 	}
  47:../src/main.c **** 	int j=i-1;
 282              		.loc 1 47 0
 283 0100 8420     		mov	r0, #132
 284 0102 C019     		add	r0, r0, r7
 285 0104 0368     		ldr	r3, [r0]
 286 0106 013B     		sub	r3, r3, #1
 287 0108 8021     		mov	r1, #128
 288 010a C919     		add	r1, r1, r7
 289 010c 0B60     		str	r3, [r1]
  48:../src/main.c **** 	for(j=i-1; j<10; j--){
 290              		.loc 1 48 0
 291 010e 8422     		mov	r2, #132
 292 0110 D219     		add	r2, r2, r7
 293 0112 1368     		ldr	r3, [r2]
 294 0114 013B     		sub	r3, r3, #1
 295 0116 8020     		mov	r0, #128
 296 0118 C019     		add	r0, r0, r7
 297 011a 0360     		str	r3, [r0]
 298 011c 4DE0     		b	.L15
 299              	.L19:
 300              	.LBB4:
  49:../src/main.c **** 		int blinkNum = 0;
 301              		.loc 1 49 0
 302 011e 0023     		mov	r3, #0
 303 0120 3B67     		str	r3, [r7, #112]
  50:../src/main.c **** 		while(blinkNum<5){
 304              		.loc 1 50 0
 305 0122 40E0     		b	.L16
 306              	.L18:
  51:../src/main.c **** 			if(digitArray[j][blinkNum]==0){
 307              		.loc 1 51 0
 308 0124 3B1C     		mov	r3, r7
 309 0126 0C33     		add	r3, r3, #12
 310 0128 8021     		mov	r1, #128
 311 012a C919     		add	r1, r1, r7
 312 012c 0A68     		ldr	r2, [r1]
 313 012e 9200     		lsl	r2, r2, #2
 314 0130 D258     		ldr	r2, [r2, r3]
 315 0132 3B6F     		ldr	r3, [r7, #112]
 316 0134 D318     		add	r3, r2, r3
 317 0136 1B78     		ldrb	r3, [r3]
 318 0138 002B     		cmp	r3, #0
 319 013a 14D1     		bne	.L17
  52:../src/main.c **** 				//blink short
  53:../src/main.c **** 				GPIOSetValue( 0, 7, 1 );
 320              		.loc 1 53 0
 321 013c 0020     		mov	r0, #0
 322 013e 0721     		mov	r1, #7
 323 0140 0122     		mov	r2, #1
 324 0142 FFF7FEFF 		bl	GPIOSetValue
  54:../src/main.c **** 				_delay_ms (500);
 325              		.loc 1 54 0
 326 0146 FA23     		mov	r3, #250
 327 0148 5B00     		lsl	r3, r3, #1
 328 014a 181C     		mov	r0, r3
 329 014c FFF7FEFF 		bl	_delay_ms
  55:../src/main.c **** 				GPIOSetValue( 0, 7, 0 );
 330              		.loc 1 55 0
 331 0150 0020     		mov	r0, #0
 332 0152 0721     		mov	r1, #7
 333 0154 0022     		mov	r2, #0
 334 0156 FFF7FEFF 		bl	GPIOSetValue
  56:../src/main.c **** 				_delay_ms (500);
 335              		.loc 1 56 0
 336 015a FA23     		mov	r3, #250
 337 015c 5B00     		lsl	r3, r3, #1
 338 015e 181C     		mov	r0, r3
 339 0160 FFF7FEFF 		bl	_delay_ms
 340 0164 1FE0     		b	.L16
 341              	.L17:
  57:../src/main.c **** 			}else if(digitArray[j][blinkNum]==1){
 342              		.loc 1 57 0
 343 0166 3B1C     		mov	r3, r7
 344 0168 0C33     		add	r3, r3, #12
 345 016a 8020     		mov	r0, #128
 346 016c C019     		add	r0, r0, r7
 347 016e 0268     		ldr	r2, [r0]
 348 0170 9200     		lsl	r2, r2, #2
 349 0172 D258     		ldr	r2, [r2, r3]
 350 0174 3B6F     		ldr	r3, [r7, #112]
 351 0176 D318     		add	r3, r2, r3
 352 0178 1B78     		ldrb	r3, [r3]
 353 017a 012B     		cmp	r3, #1
 354 017c 13D1     		bne	.L16
  58:../src/main.c **** 				//blink long
  59:../src/main.c **** 				GPIOSetValue( 0, 7, 1 );
 355              		.loc 1 59 0
 356 017e 0020     		mov	r0, #0
 357 0180 0721     		mov	r1, #7
 358 0182 0122     		mov	r2, #1
 359 0184 FFF7FEFF 		bl	GPIOSetValue
  60:../src/main.c **** 				_delay_ms (1000);
 360              		.loc 1 60 0
 361 0188 FA23     		mov	r3, #250
 362 018a 9B00     		lsl	r3, r3, #2
 363 018c 181C     		mov	r0, r3
 364 018e FFF7FEFF 		bl	_delay_ms
  61:../src/main.c **** 				GPIOSetValue( 0, 7, 0 );
 365              		.loc 1 61 0
 366 0192 0020     		mov	r0, #0
 367 0194 0721     		mov	r1, #7
 368 0196 0022     		mov	r2, #0
 369 0198 FFF7FEFF 		bl	GPIOSetValue
  62:../src/main.c **** 				_delay_ms (500);
 370              		.loc 1 62 0
 371 019c FA23     		mov	r3, #250
 372 019e 5B00     		lsl	r3, r3, #1
 373 01a0 181C     		mov	r0, r3
 374 01a2 FFF7FEFF 		bl	_delay_ms
 375              	.L16:
  50:../src/main.c **** 		while(blinkNum<5){
 376              		.loc 1 50 0 discriminator 1
 377 01a6 3B6F     		ldr	r3, [r7, #112]
 378 01a8 042B     		cmp	r3, #4
 379 01aa BBDD     		ble	.L18
 380              	.LBE4:
  48:../src/main.c **** 	for(j=i-1; j<10; j--){
 381              		.loc 1 48 0
 382 01ac 8021     		mov	r1, #128
 383 01ae C919     		add	r1, r1, r7
 384 01b0 0B68     		ldr	r3, [r1]
 385 01b2 013B     		sub	r3, r3, #1
 386 01b4 8022     		mov	r2, #128
 387 01b6 D219     		add	r2, r2, r7
 388 01b8 1360     		str	r3, [r2]
 389              	.L15:
  48:../src/main.c **** 	for(j=i-1; j<10; j--){
 390              		.loc 1 48 0 is_stmt 0 discriminator 1
 391 01ba 8020     		mov	r0, #128
 392 01bc C019     		add	r0, r0, r7
 393 01be 0368     		ldr	r3, [r0]
 394 01c0 092B     		cmp	r3, #9
 395 01c2 ACDD     		ble	.L19
  63:../src/main.c **** 			}
  64:../src/main.c **** 		}
  65:../src/main.c **** 	}
  66:../src/main.c **** 	return 1;
 396              		.loc 1 66 0 is_stmt 1
 397 01c4 0123     		mov	r3, #1
  67:../src/main.c **** }
 398              		.loc 1 67 0
 399 01c6 181C     		mov	r0, r3
 400 01c8 BD46     		mov	sp, r7
 401 01ca 22B0     		add	sp, sp, #136
 402              		@ sp needed for prologue
 403 01cc 80BD     		pop	{r7, pc}
 404              	.L21:
 405 01ce C046     		.align	2
 406              	.L20:
 407 01d0 10000000 		.word	.LC0
 408 01d4 0F000080 		.word	-2147483633
 409              		.cfi_endproc
 410              	.LFE21:
 412              		.section	.text.main,"ax",%progbits
 413              		.align	2
 414              		.global	main
 415              		.code	16
 416              		.thumb_func
 418              	main:
 419              	.LFB22:
  68:../src/main.c **** 
  69:../src/main.c **** int main(void) {
 420              		.loc 1 69 0
 421              		.cfi_startproc
 422 0000 80B5     		push	{r7, lr}
 423              	.LCFI6:
 424              		.cfi_def_cfa_offset 8
 425              		.cfi_offset 7, -8
 426              		.cfi_offset 14, -4
 427 0002 82B0     		sub	sp, sp, #8
 428              	.LCFI7:
 429              		.cfi_def_cfa_offset 16
 430 0004 00AF     		add	r7, sp, #0
 431              	.LCFI8:
 432              		.cfi_def_cfa_register 7
  70:../src/main.c **** 	  GPIOInit();
 433              		.loc 1 70 0
 434 0006 FFF7FEFF 		bl	GPIOInit
  71:../src/main.c **** 	  /* Set LED port pin to output */
  72:../src/main.c **** 	  GPIOSetDir( 0, 7, 1 );
 435              		.loc 1 72 0
 436 000a 0020     		mov	r0, #0
 437 000c 0721     		mov	r1, #7
 438 000e 0122     		mov	r2, #1
 439 0010 FFF7FEFF 		bl	GPIOSetDir
  73:../src/main.c **** 
  74:../src/main.c **** 	int i=1;
 440              		.loc 1 74 0
 441 0014 0123     		mov	r3, #1
 442 0016 7B60     		str	r3, [r7, #4]
  75:../src/main.c **** 	int fibNum;
  76:../src/main.c **** 	for(i=1; i <=20; i++){
 443              		.loc 1 76 0
 444 0018 0123     		mov	r3, #1
 445 001a 7B60     		str	r3, [r7, #4]
 446 001c 0CE0     		b	.L23
 447              	.L24:
  77:../src/main.c **** 		fibNum = fibonacci(i);
 448              		.loc 1 77 0 discriminator 2
 449 001e 7B68     		ldr	r3, [r7, #4]
 450 0020 181C     		mov	r0, r3
 451 0022 FFF7FEFF 		bl	fibonacci
 452 0026 031C     		mov	r3, r0
 453 0028 3B60     		str	r3, [r7]
  78:../src/main.c **** 		translateFib(fibNum);
 454              		.loc 1 78 0 discriminator 2
 455 002a 3B68     		ldr	r3, [r7]
 456 002c 181C     		mov	r0, r3
 457 002e FFF7FEFF 		bl	translateFib
  76:../src/main.c **** 	for(i=1; i <=20; i++){
 458              		.loc 1 76 0 discriminator 2
 459 0032 7B68     		ldr	r3, [r7, #4]
 460 0034 0133     		add	r3, r3, #1
 461 0036 7B60     		str	r3, [r7, #4]
 462              	.L23:
  76:../src/main.c **** 	for(i=1; i <=20; i++){
 463              		.loc 1 76 0 is_stmt 0 discriminator 1
 464 0038 7B68     		ldr	r3, [r7, #4]
 465 003a 142B     		cmp	r3, #20
 466 003c EFDD     		ble	.L24
  79:../src/main.c **** 	}
  80:../src/main.c **** }
 467              		.loc 1 80 0 is_stmt 1
 468 003e 181C     		mov	r0, r3
 469 0040 BD46     		mov	sp, r7
 470 0042 02B0     		add	sp, sp, #8
 471              		@ sp needed for prologue
 472 0044 80BD     		pop	{r7, pc}
 473              		.cfi_endproc
 474              	.LFE22:
 476 0046 C046     		.text
 477              	.Letext0:
 478              		.file 2 "/Applications/lpcxpresso_6.1.2_177/lpcxpresso/tools/bin/../lib/gcc/arm-none-eabi/4.6.2/..
 479              		.file 3 "/Users/emilyleach314/Documents/JUNYA/DDL/asm_xample11/asm_xample11/cmsis/LPC11xx.h"
 480              		.file 4 "/Users/emilyleach314/Documents/JUNYA/DDL/asm_xample11/asm_xample11/driver/gpio.h"
DEFINED SYMBOLS
                            *ABS*:0000000000000000 main.c
/var/folders/s2/l83cm2y52xd5x_bdz4nkc8tm0000gn/T//ccyd23sV.s:18     .rodata:0000000000000000 $d
/var/folders/s2/l83cm2y52xd5x_bdz4nkc8tm0000gn/T//ccyd23sV.s:21     .rodata:0000000000000000 LPC_GPIO
/var/folders/s2/l83cm2y52xd5x_bdz4nkc8tm0000gn/T//ccyd23sV.s:27     .text._delay_ms:0000000000000000 $t
/var/folders/s2/l83cm2y52xd5x_bdz4nkc8tm0000gn/T//ccyd23sV.s:32     .text._delay_ms:0000000000000000 _delay_ms
/var/folders/s2/l83cm2y52xd5x_bdz4nkc8tm0000gn/T//ccyd23sV.s:96     .text._delay_ms:0000000000000048 $d
/var/folders/s2/l83cm2y52xd5x_bdz4nkc8tm0000gn/T//ccyd23sV.s:116    .text.translateFib:0000000000000000 $t
/var/folders/s2/l83cm2y52xd5x_bdz4nkc8tm0000gn/T//ccyd23sV.s:121    .text.translateFib:0000000000000000 translateFib
/var/folders/s2/l83cm2y52xd5x_bdz4nkc8tm0000gn/T//ccyd23sV.s:407    .text.translateFib:00000000000001d0 $d
/var/folders/s2/l83cm2y52xd5x_bdz4nkc8tm0000gn/T//ccyd23sV.s:413    .text.main:0000000000000000 $t
/var/folders/s2/l83cm2y52xd5x_bdz4nkc8tm0000gn/T//ccyd23sV.s:418    .text.main:0000000000000000 main
                     .debug_frame:0000000000000010 $d

UNDEFINED SYMBOLS
__aeabi_idivmod
__aeabi_idiv
memcpy
GPIOSetValue
GPIOInit
GPIOSetDir
fibonacci
