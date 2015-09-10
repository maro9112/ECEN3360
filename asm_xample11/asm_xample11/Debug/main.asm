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
  13:../src/main.c **** //delay code from https://www.lpcware.com/content/forum/what-do-you-use-to-delay
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
 100              		.section	.rodata
 101              		.align	2
 102              	.LC0:
 103 0010 31313131 		.ascii	"11111\000"
 103      3100
 104 0016 30313131 		.ascii	"01111\000"
 104      3100
 105 001c 30303131 		.ascii	"00111\000"
 105      3100
 106 0022 30303031 		.ascii	"00011\000"
 106      3100
 107 0028 30303030 		.ascii	"00001\000"
 107      3100
 108 002e 30303030 		.ascii	"00000\000"
 108      3000
 109 0034 31303030 		.ascii	"10000\000"
 109      3000
 110 003a 31313030 		.ascii	"11000\000"
 110      3000
 111 0040 31313130 		.ascii	"11100\000"
 111      3000
 112 0046 31313131 		.ascii	"11110\000"
 112      3000
 113 004c 30303030 		.ascii	"00001\000"
 113      3100
 114 0052 30313030 		.ascii	"01000\000"
 114      3000
 115 0058 30313031 		.ascii	"01010\000"
 115      3000
 116 005e 30303130 		.ascii	"00100\000"
 116      3000
 117 0064 30303030 		.ascii	"00000\000"
 117      3000
 118 006a 30303031 		.ascii	"00010\000"
 118      3000
 119              		.section	.text.translateFib,"ax",%progbits
 120              		.align	2
 121              		.global	translateFib
 122              		.code	16
 123              		.thumb_func
 125              	translateFib:
 126              	.LFB21:
  24:../src/main.c **** 
  25:../src/main.c **** int translateFib(int fibNum) {
 127              		.loc 1 25 0
 128              		.cfi_startproc
 129 0000 80B5     		push	{r7, lr}
 130              	.LCFI3:
 131              		.cfi_def_cfa_offset 8
 132              		.cfi_offset 7, -8
 133              		.cfi_offset 14, -4
 134 0002 AAB0     		sub	sp, sp, #168
 135              	.LCFI4:
 136              		.cfi_def_cfa_offset 176
 137 0004 00AF     		add	r7, sp, #0
 138              	.LCFI5:
 139              		.cfi_def_cfa_register 7
 140 0006 7860     		str	r0, [r7, #4]
  26:../src/main.c **** 	char morse[16][6] = {"11111", "01111", "00111", "00011", "00001", "00000", "10000", "11000", "1110
 141              		.loc 1 26 0
 142 0008 3A1C     		mov	r2, r7
 143 000a 3432     		add	r2, r2, #52
 144 000c 594B     		ldr	r3, .L19
 145 000e 111C     		mov	r1, r2
 146 0010 1A1C     		mov	r2, r3
 147 0012 6023     		mov	r3, #96
 148 0014 081C     		mov	r0, r1
 149 0016 111C     		mov	r1, r2
 150 0018 1A1C     		mov	r2, r3
 151 001a FFF7FEFF 		bl	memcpy
  27:../src/main.c **** 	int i=0;
 152              		.loc 1 27 0
 153 001e 0023     		mov	r3, #0
 154 0020 A420     		mov	r0, #164
 155 0022 C019     		add	r0, r0, r7
 156 0024 0360     		str	r3, [r0]
  28:../src/main.c **** 	char* digitArray[10];
  29:../src/main.c **** 	while(fibNum >0)
 157              		.loc 1 29 0
 158 0026 29E0     		b	.L9
 159              	.L12:
 160              	.LBB2:
  30:../src/main.c **** 	{
  31:../src/main.c **** 		int digit = fibNum % 16;
 161              		.loc 1 31 0
 162 0028 7A68     		ldr	r2, [r7, #4]
 163 002a 534B     		ldr	r3, .L19+4
 164 002c 1340     		and	r3, r2
 165 002e 04D5     		bpl	.L10
 166 0030 013B     		sub	r3, r3, #1
 167 0032 1022     		mov	r2, #16
 168 0034 5242     		neg	r2, r2
 169 0036 1343     		orr	r3, r2
 170 0038 0133     		add	r3, r3, #1
 171              	.L10:
 172 003a 9821     		mov	r1, #152
 173 003c C919     		add	r1, r1, r7
 174 003e 0B60     		str	r3, [r1]
  32:../src/main.c **** 		digitArray[i] = morse[digit];
 175              		.loc 1 32 0
 176 0040 9823     		mov	r3, #152
 177 0042 DB19     		add	r3, r3, r7
 178 0044 1A68     		ldr	r2, [r3]
 179 0046 131C     		mov	r3, r2
 180 0048 5B00     		lsl	r3, r3, #1
 181 004a 9B18     		add	r3, r3, r2
 182 004c 5B00     		lsl	r3, r3, #1
 183 004e 3A1C     		mov	r2, r7
 184 0050 3432     		add	r2, r2, #52
 185 0052 D118     		add	r1, r2, r3
 186 0054 3B1C     		mov	r3, r7
 187 0056 0C33     		add	r3, r3, #12
 188 0058 A420     		mov	r0, #164
 189 005a C019     		add	r0, r0, r7
 190 005c 0268     		ldr	r2, [r0]
 191 005e 9200     		lsl	r2, r2, #2
 192 0060 D150     		str	r1, [r2, r3]
  33:../src/main.c **** 		i++;
 193              		.loc 1 33 0
 194 0062 A421     		mov	r1, #164
 195 0064 C919     		add	r1, r1, r7
 196 0066 0B68     		ldr	r3, [r1]
 197 0068 0133     		add	r3, r3, #1
 198 006a A422     		mov	r2, #164
 199 006c D219     		add	r2, r2, r7
 200 006e 1360     		str	r3, [r2]
  34:../src/main.c **** 		fibNum /= 16;
 201              		.loc 1 34 0
 202 0070 7B68     		ldr	r3, [r7, #4]
 203 0072 002B     		cmp	r3, #0
 204 0074 00DA     		bge	.L11
 205 0076 0F33     		add	r3, r3, #15
 206              	.L11:
 207 0078 1B11     		asr	r3, r3, #4
 208 007a 7B60     		str	r3, [r7, #4]
 209              	.L9:
 210              	.LBE2:
  29:../src/main.c **** 	while(fibNum >0)
 211              		.loc 1 29 0 discriminator 1
 212 007c 7B68     		ldr	r3, [r7, #4]
 213 007e 002B     		cmp	r3, #0
 214 0080 D2DC     		bgt	.L12
  35:../src/main.c **** 	}
  36:../src/main.c **** 	int j=i-1;
 215              		.loc 1 36 0
 216 0082 A420     		mov	r0, #164
 217 0084 C019     		add	r0, r0, r7
 218 0086 0368     		ldr	r3, [r0]
 219 0088 013B     		sub	r3, r3, #1
 220 008a A021     		mov	r1, #160
 221 008c C919     		add	r1, r1, r7
 222 008e 0B60     		str	r3, [r1]
  37:../src/main.c **** 	for(j=i-1; j>=0; j--){
 223              		.loc 1 37 0
 224 0090 A422     		mov	r2, #164
 225 0092 D219     		add	r2, r2, r7
 226 0094 1368     		ldr	r3, [r2]
 227 0096 013B     		sub	r3, r3, #1
 228 0098 A020     		mov	r0, #160
 229 009a C019     		add	r0, r0, r7
 230 009c 0360     		str	r3, [r0]
 231 009e 5FE0     		b	.L13
 232              	.L18:
 233              	.LBB3:
  38:../src/main.c **** 		int blinkNum = 0;
 234              		.loc 1 38 0
 235 00a0 0023     		mov	r3, #0
 236 00a2 9C21     		mov	r1, #156
 237 00a4 C919     		add	r1, r1, r7
 238 00a6 0B60     		str	r3, [r1]
  39:../src/main.c **** 		while(blinkNum<6){
 239              		.loc 1 39 0
 240 00a8 49E0     		b	.L14
 241              	.L17:
 242              	.LBB4:
  40:../src/main.c **** 			int current = digitArray[j][blinkNum];
 243              		.loc 1 40 0
 244 00aa 3B1C     		mov	r3, r7
 245 00ac 0C33     		add	r3, r3, #12
 246 00ae A020     		mov	r0, #160
 247 00b0 C019     		add	r0, r0, r7
 248 00b2 0268     		ldr	r2, [r0]
 249 00b4 9200     		lsl	r2, r2, #2
 250 00b6 D258     		ldr	r2, [r2, r3]
 251 00b8 9C21     		mov	r1, #156
 252 00ba C919     		add	r1, r1, r7
 253 00bc 0B68     		ldr	r3, [r1]
 254 00be D318     		add	r3, r2, r3
 255 00c0 1B78     		ldrb	r3, [r3]
 256 00c2 9422     		mov	r2, #148
 257 00c4 D219     		add	r2, r2, r7
 258 00c6 1360     		str	r3, [r2]
  41:../src/main.c **** 			current -=48;
 259              		.loc 1 41 0
 260 00c8 9420     		mov	r0, #148
 261 00ca C019     		add	r0, r0, r7
 262 00cc 0368     		ldr	r3, [r0]
 263 00ce 303B     		sub	r3, r3, #48
 264 00d0 9421     		mov	r1, #148
 265 00d2 C919     		add	r1, r1, r7
 266 00d4 0B60     		str	r3, [r1]
  42:../src/main.c **** 			if(current==0){
 267              		.loc 1 42 0
 268 00d6 9422     		mov	r2, #148
 269 00d8 D219     		add	r2, r2, r7
 270 00da 1368     		ldr	r3, [r2]
 271 00dc 002B     		cmp	r3, #0
 272 00de 10D1     		bne	.L15
  43:../src/main.c **** 				//blink short
  44:../src/main.c **** 				GPIOSetValue( 0, 7, 1 );
 273              		.loc 1 44 0
 274 00e0 0020     		mov	r0, #0
 275 00e2 0721     		mov	r1, #7
 276 00e4 0122     		mov	r2, #1
 277 00e6 FFF7FEFF 		bl	GPIOSetValue
  45:../src/main.c **** 				_delay_ms (150);
 278              		.loc 1 45 0
 279 00ea 9620     		mov	r0, #150
 280 00ec FFF7FEFF 		bl	_delay_ms
  46:../src/main.c **** 				GPIOSetValue( 0, 7, 0 );
 281              		.loc 1 46 0
 282 00f0 0020     		mov	r0, #0
 283 00f2 0721     		mov	r1, #7
 284 00f4 0022     		mov	r2, #0
 285 00f6 FFF7FEFF 		bl	GPIOSetValue
  47:../src/main.c **** 				_delay_ms (50);
 286              		.loc 1 47 0
 287 00fa 3220     		mov	r0, #50
 288 00fc FFF7FEFF 		bl	_delay_ms
 289 0100 16E0     		b	.L16
 290              	.L15:
  48:../src/main.c **** 			}else if(current==1){
 291              		.loc 1 48 0
 292 0102 9420     		mov	r0, #148
 293 0104 C019     		add	r0, r0, r7
 294 0106 0368     		ldr	r3, [r0]
 295 0108 012B     		cmp	r3, #1
 296 010a 11D1     		bne	.L16
  49:../src/main.c **** 				//blink long
  50:../src/main.c **** 				GPIOSetValue( 0, 7, 1 );
 297              		.loc 1 50 0
 298 010c 0020     		mov	r0, #0
 299 010e 0721     		mov	r1, #7
 300 0110 0122     		mov	r2, #1
 301 0112 FFF7FEFF 		bl	GPIOSetValue
  51:../src/main.c **** 				_delay_ms (500);
 302              		.loc 1 51 0
 303 0116 FA23     		mov	r3, #250
 304 0118 5B00     		lsl	r3, r3, #1
 305 011a 181C     		mov	r0, r3
 306 011c FFF7FEFF 		bl	_delay_ms
  52:../src/main.c **** 				GPIOSetValue( 0, 7, 0 );
 307              		.loc 1 52 0
 308 0120 0020     		mov	r0, #0
 309 0122 0721     		mov	r1, #7
 310 0124 0022     		mov	r2, #0
 311 0126 FFF7FEFF 		bl	GPIOSetValue
  53:../src/main.c **** 				_delay_ms (50);
 312              		.loc 1 53 0
 313 012a 3220     		mov	r0, #50
 314 012c FFF7FEFF 		bl	_delay_ms
 315              	.L16:
  54:../src/main.c **** 			}
  55:../src/main.c **** 			blinkNum++;
 316              		.loc 1 55 0
 317 0130 9C21     		mov	r1, #156
 318 0132 C919     		add	r1, r1, r7
 319 0134 0B68     		ldr	r3, [r1]
 320 0136 0133     		add	r3, r3, #1
 321 0138 9C22     		mov	r2, #156
 322 013a D219     		add	r2, r2, r7
 323 013c 1360     		str	r3, [r2]
 324              	.L14:
 325              	.LBE4:
  39:../src/main.c **** 		while(blinkNum<6){
 326              		.loc 1 39 0 discriminator 1
 327 013e 9C20     		mov	r0, #156
 328 0140 C019     		add	r0, r0, r7
 329 0142 0368     		ldr	r3, [r0]
 330 0144 052B     		cmp	r3, #5
 331 0146 B0DD     		ble	.L17
  56:../src/main.c **** 		}
  57:../src/main.c **** 		_delay_ms (1000);
 332              		.loc 1 57 0
 333 0148 FA23     		mov	r3, #250
 334 014a 9B00     		lsl	r3, r3, #2
 335 014c 181C     		mov	r0, r3
 336 014e FFF7FEFF 		bl	_delay_ms
 337              	.LBE3:
  37:../src/main.c **** 	for(j=i-1; j>=0; j--){
 338              		.loc 1 37 0
 339 0152 A021     		mov	r1, #160
 340 0154 C919     		add	r1, r1, r7
 341 0156 0B68     		ldr	r3, [r1]
 342 0158 013B     		sub	r3, r3, #1
 343 015a A022     		mov	r2, #160
 344 015c D219     		add	r2, r2, r7
 345 015e 1360     		str	r3, [r2]
 346              	.L13:
  37:../src/main.c **** 	for(j=i-1; j>=0; j--){
 347              		.loc 1 37 0 is_stmt 0 discriminator 1
 348 0160 A020     		mov	r0, #160
 349 0162 C019     		add	r0, r0, r7
 350 0164 0368     		ldr	r3, [r0]
 351 0166 002B     		cmp	r3, #0
 352 0168 9ADA     		bge	.L18
  58:../src/main.c **** 	}
  59:../src/main.c **** 	return 1;
 353              		.loc 1 59 0 is_stmt 1
 354 016a 0123     		mov	r3, #1
  60:../src/main.c **** }
 355              		.loc 1 60 0
 356 016c 181C     		mov	r0, r3
 357 016e BD46     		mov	sp, r7
 358 0170 2AB0     		add	sp, sp, #168
 359              		@ sp needed for prologue
 360 0172 80BD     		pop	{r7, pc}
 361              	.L20:
 362              		.align	2
 363              	.L19:
 364 0174 10000000 		.word	.LC0
 365 0178 0F000080 		.word	-2147483633
 366              		.cfi_endproc
 367              	.LFE21:
 369              		.section	.text.main,"ax",%progbits
 370              		.align	2
 371              		.global	main
 372              		.code	16
 373              		.thumb_func
 375              	main:
 376              	.LFB22:
  61:../src/main.c **** 
  62:../src/main.c **** int main(void) {
 377              		.loc 1 62 0
 378              		.cfi_startproc
 379 0000 80B5     		push	{r7, lr}
 380              	.LCFI6:
 381              		.cfi_def_cfa_offset 8
 382              		.cfi_offset 7, -8
 383              		.cfi_offset 14, -4
 384 0002 82B0     		sub	sp, sp, #8
 385              	.LCFI7:
 386              		.cfi_def_cfa_offset 16
 387 0004 00AF     		add	r7, sp, #0
 388              	.LCFI8:
 389              		.cfi_def_cfa_register 7
  63:../src/main.c **** 	  GPIOInit();
 390              		.loc 1 63 0
 391 0006 FFF7FEFF 		bl	GPIOInit
  64:../src/main.c **** 	  /* Set LED port pin to output */
  65:../src/main.c **** 	  GPIOSetDir( 0, 7, 1 );
 392              		.loc 1 65 0
 393 000a 0020     		mov	r0, #0
 394 000c 0721     		mov	r1, #7
 395 000e 0122     		mov	r2, #1
 396 0010 FFF7FEFF 		bl	GPIOSetDir
  66:../src/main.c **** 
  67:../src/main.c **** 	int i=1;
 397              		.loc 1 67 0
 398 0014 0123     		mov	r3, #1
 399 0016 7B60     		str	r3, [r7, #4]
  68:../src/main.c **** 	int fibNum;
  69:../src/main.c **** 	for(i=1; i <=20; i++){
 400              		.loc 1 69 0
 401 0018 0123     		mov	r3, #1
 402 001a 7B60     		str	r3, [r7, #4]
 403 001c 0CE0     		b	.L22
 404              	.L23:
  70:../src/main.c **** 		fibNum = fibonacci(i);
 405              		.loc 1 70 0 discriminator 2
 406 001e 7B68     		ldr	r3, [r7, #4]
 407 0020 181C     		mov	r0, r3
 408 0022 FFF7FEFF 		bl	fibonacci
 409 0026 031C     		mov	r3, r0
 410 0028 3B60     		str	r3, [r7]
  71:../src/main.c **** 		translateFib(fibNum);
 411              		.loc 1 71 0 discriminator 2
 412 002a 3B68     		ldr	r3, [r7]
 413 002c 181C     		mov	r0, r3
 414 002e FFF7FEFF 		bl	translateFib
  69:../src/main.c **** 	for(i=1; i <=20; i++){
 415              		.loc 1 69 0 discriminator 2
 416 0032 7B68     		ldr	r3, [r7, #4]
 417 0034 0133     		add	r3, r3, #1
 418 0036 7B60     		str	r3, [r7, #4]
 419              	.L22:
  69:../src/main.c **** 	for(i=1; i <=20; i++){
 420              		.loc 1 69 0 is_stmt 0 discriminator 1
 421 0038 7B68     		ldr	r3, [r7, #4]
 422 003a 142B     		cmp	r3, #20
 423 003c EFDD     		ble	.L23
  72:../src/main.c **** 	}
  73:../src/main.c **** }
 424              		.loc 1 73 0 is_stmt 1
 425 003e 181C     		mov	r0, r3
 426 0040 BD46     		mov	sp, r7
 427 0042 02B0     		add	sp, sp, #8
 428              		@ sp needed for prologue
 429 0044 80BD     		pop	{r7, pc}
 430              		.cfi_endproc
 431              	.LFE22:
 433 0046 C046     		.text
 434              	.Letext0:
 435              		.file 2 "/Applications/lpcxpresso_6.1.2_177/lpcxpresso/tools/bin/../lib/gcc/arm-none-eabi/4.6.2/..
 436              		.file 3 "/Users/madisonrockwell/Documents/LPCXpresso_6.1.2/workspace/asm_xample11/asm_xample11/cms
 437              		.file 4 "/Users/madisonrockwell/Documents/LPCXpresso_6.1.2/workspace/asm_xample11/asm_xample11/dri
DEFINED SYMBOLS
                            *ABS*:0000000000000000 main.c
/var/folders/8z/dt12xkd563bf9zk7z_2wjk9m0000gn/T//ccfItwhS.s:18     .rodata:0000000000000000 $d
/var/folders/8z/dt12xkd563bf9zk7z_2wjk9m0000gn/T//ccfItwhS.s:21     .rodata:0000000000000000 LPC_GPIO
/var/folders/8z/dt12xkd563bf9zk7z_2wjk9m0000gn/T//ccfItwhS.s:27     .text._delay_ms:0000000000000000 $t
/var/folders/8z/dt12xkd563bf9zk7z_2wjk9m0000gn/T//ccfItwhS.s:32     .text._delay_ms:0000000000000000 _delay_ms
/var/folders/8z/dt12xkd563bf9zk7z_2wjk9m0000gn/T//ccfItwhS.s:96     .text._delay_ms:0000000000000048 $d
/var/folders/8z/dt12xkd563bf9zk7z_2wjk9m0000gn/T//ccfItwhS.s:120    .text.translateFib:0000000000000000 $t
/var/folders/8z/dt12xkd563bf9zk7z_2wjk9m0000gn/T//ccfItwhS.s:125    .text.translateFib:0000000000000000 translateFib
/var/folders/8z/dt12xkd563bf9zk7z_2wjk9m0000gn/T//ccfItwhS.s:364    .text.translateFib:0000000000000174 $d
/var/folders/8z/dt12xkd563bf9zk7z_2wjk9m0000gn/T//ccfItwhS.s:370    .text.main:0000000000000000 $t
/var/folders/8z/dt12xkd563bf9zk7z_2wjk9m0000gn/T//ccfItwhS.s:375    .text.main:0000000000000000 main
                     .debug_frame:0000000000000010 $d

UNDEFINED SYMBOLS
memcpy
GPIOSetValue
GPIOInit
GPIOSetDir
fibonacci
