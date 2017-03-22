;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Sun Feb 26 20:28:55 2017
;--------------------------------------------------------
$name tetrisF38x
$optc51 --model-small
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _rscr_PARM_2
	public _wscr_PARM_3
	public _wscr_PARM_2
	public _collapse_bonus_1_68
	public _Shapes
	public _main
	public _exit
	public _wastetime
	public _getKey
	public _collapse
	public _screenInit
	public _shapeHit
	public _shapeErase
	public _shapeDraw
	public _blockHit
	public _blockDraw
	public _refresh
	public __c51_external_startup
	public _rscr
	public _wscr
	public _Timer1_ISR
	public _Screen
	public _shapeHit_PARM_3
	public _shapeHit_PARM_2
	public _shapeErase_PARM_3
	public _shapeErase_PARM_2
	public _shapeDraw_PARM_3
	public _shapeDraw_PARM_2
	public _blockHit_PARM_2
	public _blockDraw_PARM_3
	public _blockDraw_PARM_2
	public _Score
	public _Level
	public _delay
	public _putchar
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_P0             DATA 0x80
_SP             DATA 0x81
_DPL            DATA 0x82
_DPH            DATA 0x83
_EMI0TC         DATA 0x84
_EMI0CF         DATA 0x85
_OSCLCN         DATA 0x86
_PCON           DATA 0x87
_TCON           DATA 0x88
_TMOD           DATA 0x89
_TL0            DATA 0x8a
_TL1            DATA 0x8b
_TH0            DATA 0x8c
_TH1            DATA 0x8d
_CKCON          DATA 0x8e
_PSCTL          DATA 0x8f
_P1             DATA 0x90
_TMR3CN         DATA 0x91
_TMR4CN         DATA 0x91
_TMR3RLL        DATA 0x92
_TMR4RLL        DATA 0x92
_TMR3RLH        DATA 0x93
_TMR4RLH        DATA 0x93
_TMR3L          DATA 0x94
_TMR4L          DATA 0x94
_TMR3H          DATA 0x95
_TMR4H          DATA 0x95
_USB0ADR        DATA 0x96
_USB0DAT        DATA 0x97
_SCON           DATA 0x98
_SCON0          DATA 0x98
_SBUF           DATA 0x99
_SBUF0          DATA 0x99
_CPT1CN         DATA 0x9a
_CPT0CN         DATA 0x9b
_CPT1MD         DATA 0x9c
_CPT0MD         DATA 0x9d
_CPT1MX         DATA 0x9e
_CPT0MX         DATA 0x9f
_P2             DATA 0xa0
_SPI0CFG        DATA 0xa1
_SPI0CKR        DATA 0xa2
_SPI0DAT        DATA 0xa3
_P0MDOUT        DATA 0xa4
_P1MDOUT        DATA 0xa5
_P2MDOUT        DATA 0xa6
_P3MDOUT        DATA 0xa7
_IE             DATA 0xa8
_CLKSEL         DATA 0xa9
_EMI0CN         DATA 0xaa
__XPAGE         DATA 0xaa
_SBCON1         DATA 0xac
_P4MDOUT        DATA 0xae
_PFE0CN         DATA 0xaf
_P3             DATA 0xb0
_OSCXCN         DATA 0xb1
_OSCICN         DATA 0xb2
_OSCICL         DATA 0xb3
_SBRLL1         DATA 0xb4
_SBRLH1         DATA 0xb5
_FLSCL          DATA 0xb6
_FLKEY          DATA 0xb7
_IP             DATA 0xb8
_CLKMUL         DATA 0xb9
_SMBTC          DATA 0xb9
_AMX0N          DATA 0xba
_AMX0P          DATA 0xbb
_ADC0CF         DATA 0xbc
_ADC0L          DATA 0xbd
_ADC0H          DATA 0xbe
_SFRPAGE        DATA 0xbf
_SMB0CN         DATA 0xc0
_SMB1CN         DATA 0xc0
_SMB0CF         DATA 0xc1
_SMB1CF         DATA 0xc1
_SMB0DAT        DATA 0xc2
_SMB1DAT        DATA 0xc2
_ADC0GTL        DATA 0xc3
_ADC0GTH        DATA 0xc4
_ADC0LTL        DATA 0xc5
_ADC0LTH        DATA 0xc6
_P4             DATA 0xc7
_TMR2CN         DATA 0xc8
_TMR5CN         DATA 0xc8
_REG01CN        DATA 0xc9
_TMR2RLL        DATA 0xca
_TMR5RLL        DATA 0xca
_TMR2RLH        DATA 0xcb
_TMR5RLH        DATA 0xcb
_TMR2L          DATA 0xcc
_TMR5L          DATA 0xcc
_TMR2H          DATA 0xcd
_TMR5H          DATA 0xcd
_SMB0ADM        DATA 0xce
_SMB1ADM        DATA 0xce
_SMB0ADR        DATA 0xcf
_SMB1ADR        DATA 0xcf
_PSW            DATA 0xd0
_REF0CN         DATA 0xd1
_SCON1          DATA 0xd2
_SBUF1          DATA 0xd3
_P0SKIP         DATA 0xd4
_P1SKIP         DATA 0xd5
_P2SKIP         DATA 0xd6
_USB0XCN        DATA 0xd7
_PCA0CN         DATA 0xd8
_PCA0MD         DATA 0xd9
_PCA0CPM0       DATA 0xda
_PCA0CPM1       DATA 0xdb
_PCA0CPM2       DATA 0xdc
_PCA0CPM3       DATA 0xdd
_PCA0CPM4       DATA 0xde
_P3SKIP         DATA 0xdf
_ACC            DATA 0xe0
_XBR0           DATA 0xe1
_XBR1           DATA 0xe2
_XBR2           DATA 0xe3
_IT01CF         DATA 0xe4
_CKCON1         DATA 0xe4
_SMOD1          DATA 0xe5
_EIE1           DATA 0xe6
_EIE2           DATA 0xe7
_ADC0CN         DATA 0xe8
_PCA0CPL1       DATA 0xe9
_PCA0CPH1       DATA 0xea
_PCA0CPL2       DATA 0xeb
_PCA0CPH2       DATA 0xec
_PCA0CPL3       DATA 0xed
_PCA0CPH3       DATA 0xee
_RSTSRC         DATA 0xef
_B              DATA 0xf0
_P0MDIN         DATA 0xf1
_P1MDIN         DATA 0xf2
_P2MDIN         DATA 0xf3
_P3MDIN         DATA 0xf4
_P4MDIN         DATA 0xf5
_EIP1           DATA 0xf6
_EIP2           DATA 0xf7
_SPI0CN         DATA 0xf8
_PCA0L          DATA 0xf9
_PCA0H          DATA 0xfa
_PCA0CPL0       DATA 0xfb
_PCA0CPH0       DATA 0xfc
_PCA0CPL4       DATA 0xfd
_PCA0CPH4       DATA 0xfe
_VDM0CN         DATA 0xff
_DPTR           DATA 0x8382
_TMR2RL         DATA 0xcbca
_TMR3RL         DATA 0x9392
_TMR4RL         DATA 0x9392
_TMR5RL         DATA 0xcbca
_TMR2           DATA 0xcdcc
_TMR3           DATA 0x9594
_TMR4           DATA 0x9594
_TMR5           DATA 0xcdcc
_SBRL1          DATA 0xb5b4
_ADC0           DATA 0xbebd
_ADC0GT         DATA 0xc4c3
_ADC0LT         DATA 0xc6c5
_PCA0           DATA 0xfaf9
_PCA0CP1        DATA 0xeae9
_PCA0CP2        DATA 0xeceb
_PCA0CP3        DATA 0xeeed
_PCA0CP0        DATA 0xfcfb
_PCA0CP4        DATA 0xfefd
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_P0_0           BIT 0x80
_P0_1           BIT 0x81
_P0_2           BIT 0x82
_P0_3           BIT 0x83
_P0_4           BIT 0x84
_P0_5           BIT 0x85
_P0_6           BIT 0x86
_P0_7           BIT 0x87
_TF1            BIT 0x8f
_TR1            BIT 0x8e
_TF0            BIT 0x8d
_TR0            BIT 0x8c
_IE1            BIT 0x8b
_IT1            BIT 0x8a
_IE0            BIT 0x89
_IT0            BIT 0x88
_P1_0           BIT 0x90
_P1_1           BIT 0x91
_P1_2           BIT 0x92
_P1_3           BIT 0x93
_P1_4           BIT 0x94
_P1_5           BIT 0x95
_P1_6           BIT 0x96
_P1_7           BIT 0x97
_S0MODE         BIT 0x9f
_SCON0_6        BIT 0x9e
_MCE0           BIT 0x9d
_REN0           BIT 0x9c
_TB80           BIT 0x9b
_RB80           BIT 0x9a
_TI0            BIT 0x99
_RI0            BIT 0x98
_SCON_6         BIT 0x9e
_MCE            BIT 0x9d
_REN            BIT 0x9c
_TB8            BIT 0x9b
_RB8            BIT 0x9a
_TI             BIT 0x99
_RI             BIT 0x98
_P2_0           BIT 0xa0
_P2_1           BIT 0xa1
_P2_2           BIT 0xa2
_P2_3           BIT 0xa3
_P2_4           BIT 0xa4
_P2_5           BIT 0xa5
_P2_6           BIT 0xa6
_P2_7           BIT 0xa7
_EA             BIT 0xaf
_ESPI0          BIT 0xae
_ET2            BIT 0xad
_ES0            BIT 0xac
_ET1            BIT 0xab
_EX1            BIT 0xaa
_ET0            BIT 0xa9
_EX0            BIT 0xa8
_P3_0           BIT 0xb0
_P3_1           BIT 0xb1
_P3_2           BIT 0xb2
_P3_3           BIT 0xb3
_P3_4           BIT 0xb4
_P3_5           BIT 0xb5
_P3_6           BIT 0xb6
_P3_7           BIT 0xb7
_IP_7           BIT 0xbf
_PSPI0          BIT 0xbe
_PT2            BIT 0xbd
_PS0            BIT 0xbc
_PT1            BIT 0xbb
_PX1            BIT 0xba
_PT0            BIT 0xb9
_PX0            BIT 0xb8
_MASTER0        BIT 0xc7
_TXMODE0        BIT 0xc6
_STA0           BIT 0xc5
_STO0           BIT 0xc4
_ACKRQ0         BIT 0xc3
_ARBLOST0       BIT 0xc2
_ACK0           BIT 0xc1
_SI0            BIT 0xc0
_MASTER1        BIT 0xc7
_TXMODE1        BIT 0xc6
_STA1           BIT 0xc5
_STO1           BIT 0xc4
_ACKRQ1         BIT 0xc3
_ARBLOST1       BIT 0xc2
_ACK1           BIT 0xc1
_SI1            BIT 0xc0
_TF2            BIT 0xcf
_TF2H           BIT 0xcf
_TF2L           BIT 0xce
_TF2LEN         BIT 0xcd
_TF2CEN         BIT 0xcc
_T2SPLIT        BIT 0xcb
_TR2            BIT 0xca
_T2CSS          BIT 0xc9
_T2XCLK         BIT 0xc8
_TF5H           BIT 0xcf
_TF5L           BIT 0xce
_TF5LEN         BIT 0xcd
_TMR5CN_4       BIT 0xcc
_T5SPLIT        BIT 0xcb
_TR5            BIT 0xca
_TMR5CN_1       BIT 0xc9
_T5XCLK         BIT 0xc8
_CY             BIT 0xd7
_AC             BIT 0xd6
_F0             BIT 0xd5
_RS1            BIT 0xd4
_RS0            BIT 0xd3
_OV             BIT 0xd2
_F1             BIT 0xd1
_PARITY         BIT 0xd0
_CF             BIT 0xdf
_CR             BIT 0xde
_PCA0CN_5       BIT 0xde
_CCF4           BIT 0xdc
_CCF3           BIT 0xdb
_CCF2           BIT 0xda
_CCF1           BIT 0xd9
_CCF0           BIT 0xd8
_ACC_7          BIT 0xe7
_ACC_6          BIT 0xe6
_ACC_5          BIT 0xe5
_ACC_4          BIT 0xe4
_ACC_3          BIT 0xe3
_ACC_2          BIT 0xe2
_ACC_1          BIT 0xe1
_ACC_0          BIT 0xe0
_AD0EN          BIT 0xef
_AD0TM          BIT 0xee
_AD0INT         BIT 0xed
_AD0BUSY        BIT 0xec
_AD0WINT        BIT 0xeb
_AD0CM2         BIT 0xea
_AD0CM1         BIT 0xe9
_AD0CM0         BIT 0xe8
_B_7            BIT 0xf7
_B_6            BIT 0xf6
_B_5            BIT 0xf5
_B_4            BIT 0xf4
_B_3            BIT 0xf3
_B_2            BIT 0xf2
_B_1            BIT 0xf1
_B_0            BIT 0xf0
_SPIF           BIT 0xff
_WCOL           BIT 0xfe
_MODF           BIT 0xfd
_RXOVRN         BIT 0xfc
_NSSMD1         BIT 0xfb
_NSSMD0         BIT 0xfa
_TXBMT          BIT 0xf9
_SPIEN          BIT 0xf8
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_delay:
	ds 1
_Level:
	ds 2
_Score:
	ds 2
_blockDraw_PARM_2:
	ds 1
_blockDraw_PARM_3:
	ds 1
_blockHit_PARM_2:
	ds 1
_shapeDraw_PARM_2:
	ds 1
_shapeDraw_PARM_3:
	ds 1
_shapeErase_PARM_2:
	ds 1
_shapeErase_PARM_3:
	ds 1
_shapeHit_PARM_2:
	ds 1
_shapeHit_PARM_3:
	ds 1
_main_Shape_1_83:
	ds 1
_main_X_1_83:
	ds 1
_main_Y_1_83:
	ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
_wscr_PARM_2:
	ds 1
_wscr_PARM_3:
	ds 1
	rseg	R_OSEG
_rscr_PARM_2:
	ds 1
	rseg	R_OSEG
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
_Screen:
	ds 192
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
	CSEG at 0x001b
	ljmp	_Timer1_ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
;	tetrisF38x.c:23: unsigned char delay=40;
	mov	_delay,#0x28
;	tetrisF38x.c:132: unsigned int Level=0;
	clr	a
	mov	_Level,a
	mov	(_Level + 1),a
;	tetrisF38x.c:133: unsigned int Score=0;
	clr	a
	mov	_Score,a
	mov	(_Score + 1),a
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer1_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	tetrisF38x.c:77: void Timer1_ISR (void) interrupt INTERRUPT_TIMER1{} 
;	-----------------------------------------
;	 function Timer1_ISR
;	-----------------------------------------
_Timer1_ISR:
	using	0
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
;------------------------------------------------------------
;Allocation info for local variables in function 'wscr'
;------------------------------------------------------------
;y                         Allocated with name '_wscr_PARM_2'
;val                       Allocated with name '_wscr_PARM_3'
;x                         Allocated to registers r2 
;j                         Allocated to registers r4 
;------------------------------------------------------------
;	tetrisF38x.c:135: void wscr (unsigned char x, unsigned char y, unsigned char val)
;	-----------------------------------------
;	 function wscr
;	-----------------------------------------
_wscr:
;	tetrisF38x.c:138: j=Screen[x/2][y];
	mov	a,dpl
	mov	r2,a
	clr	c
	rrc	a
	mov	b,#0x18
	mul	ab
	mov	r3,a
	add	a,#_Screen
	mov	r4,a
	mov	r5,_wscr_PARM_2
	mov	a,r5
	add	a,r4
	mov	r0,a
	mov	ar4,@r0
;	tetrisF38x.c:139: if((x&1)==0)
	mov	a,r2
	jb	acc.0,L003002?
;	tetrisF38x.c:141: j&=0xf0;
	anl	ar4,#0xF0
;	tetrisF38x.c:142: Screen[x/2][y]=(j|(val&0x7)|(val&0x80?8:0));
	mov	a,r3
	add	a,#_Screen
	mov	r2,a
	mov	a,r5
	add	a,r2
	mov	r0,a
	mov	a,#0x07
	anl	a,_wscr_PARM_3
	orl	a,r4
	mov	r2,a
	mov	a,_wscr_PARM_3
	jnb	acc.7,L003006?
	mov	r6,#0x08
	sjmp	L003007?
L003006?:
	mov	r6,#0x00
L003007?:
	mov	a,r6
	orl	a,r2
	mov	@r0,a
	ret
L003002?:
;	tetrisF38x.c:146: j&=0xf;
	anl	ar4,#0x0F
;	tetrisF38x.c:147: Screen[x/2][y]=j|((val*0x10)&0x70)|(val&0x80);
	mov	a,r3
	add	a,#_Screen
	mov	r3,a
	mov	a,r5
	add	a,r3
	mov	r0,a
	mov	a,_wscr_PARM_3
	swap	a
	anl	a,#0xf0
	mov	r2,a
	mov	a,#0x70
	anl	a,r2
	orl	ar4,a
	mov	a,#0x80
	anl	a,_wscr_PARM_3
	orl	a,r4
	mov	@r0,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'rscr'
;------------------------------------------------------------
;y                         Allocated with name '_rscr_PARM_2'
;x                         Allocated to registers r2 
;j                         Allocated to registers r3 
;------------------------------------------------------------
;	tetrisF38x.c:151: unsigned char rscr (unsigned char x, unsigned char y)
;	-----------------------------------------
;	 function rscr
;	-----------------------------------------
_rscr:
;	tetrisF38x.c:154: j=Screen[x/2][y];
	mov	a,dpl
	mov	r2,a
	clr	c
	rrc	a
	mov	b,#0x18
	mul	ab
	add	a,#_Screen
	mov	r3,a
	mov	a,_rscr_PARM_2
	add	a,r3
	mov	r0,a
	mov	ar3,@r0
;	tetrisF38x.c:155: if(x&1) j/=0x10;
	mov	a,r2
	jnb	acc.0,L004002?
	mov	a,r3
	swap	a
	anl	a,#0x0f
	mov	r3,a
L004002?:
;	tetrisF38x.c:156: return ((j&0x7)|(j&0x8?0x80:0));
	mov	a,#0x07
	anl	a,r3
	mov	r2,a
	mov	a,r3
	jnb	acc.3,L004005?
	mov	r3,#0x80
	sjmp	L004006?
L004005?:
	mov	r3,#0x00
L004006?:
	mov	a,r3
	orl	a,r2
	mov	dpl,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	tetrisF38x.c:159: unsigned char _c51_external_startup(void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
;	tetrisF38x.c:162: PCA0MD&=0xbf; //clear Watchdog Enable bit
	anl	_PCA0MD,#0xBF
;	tetrisF38x.c:164: VDM0CN = 0x80; // enable VDD monitor
	mov	_VDM0CN,#0x80
;	tetrisF38x.c:165: RSTSRC = 0x02|0x04; // Enable reset on missing clock detector VDD
	mov	_RSTSRC,#0x06
;	tetrisF38x.c:167: P0MDOUT |= 0x10; // Enable UTX as push-pull output
	orl	_P0MDOUT,#0x10
;	tetrisF38x.c:168: XBR0     = 0x01; // Enable UART on P0.4(TX) and P0.5(RX)                     
	mov	_XBR0,#0x01
;	tetrisF38x.c:169: XBR1     = 0x40; // Enable crossbar and weak pull-ups
	mov	_XBR1,#0x40
;	tetrisF38x.c:175: CLKSEL|=0b_0000_0010; // SYSCLK derived from the Internal High-Frequency Oscillator / 2.
	orl	_CLKSEL,#0x02
;	tetrisF38x.c:181: OSCICN |= 0x03;   // Configure internal oscillator for its maximum frequency
	orl	_OSCICN,#0x03
;	tetrisF38x.c:184: TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	mov	_TH1,#0x98
;	tetrisF38x.c:185: CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	anl	_CKCON,#0xF4
;	tetrisF38x.c:186: CKCON |=  0x08;
	orl	_CKCON,#0x08
;	tetrisF38x.c:199: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	tetrisF38x.c:200: TMOD &= 0x0f;  // TMOD: timer 1 in 8-bit autoreload
	anl	_TMOD,#0x0F
;	tetrisF38x.c:201: TMOD |= 0x20;                       
	orl	_TMOD,#0x20
;	tetrisF38x.c:202: TR1 = 1; // START Timer1
	setb	_TR1
;	tetrisF38x.c:203: SCON = 0x52;
	mov	_SCON,#0x52
;	tetrisF38x.c:207: TR0=0;
	clr	_TR0
;	tetrisF38x.c:208: TMOD &= 0xf0;  // TMOD: timer 0 in 8-bit autoreload
	anl	_TMOD,#0xF0
;	tetrisF38x.c:209: TMOD |= 0x02;                       
	orl	_TMOD,#0x02
;	tetrisF38x.c:210: TH0=TL0=0-91; //Use a prime number to generate 'ramdom' numbers
	mov	_TL0,#0xA5
	mov	_TH0,#0xA5
;	tetrisF38x.c:211: TR0=1;
	setb	_TR0
;	tetrisF38x.c:213: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'putchar'
;------------------------------------------------------------
;c                         Allocated to registers r2 
;------------------------------------------------------------
;	tetrisF38x.c:216: void putchar(char c)
;	-----------------------------------------
;	 function putchar
;	-----------------------------------------
_putchar:
	mov	r2,dpl
;	tetrisF38x.c:218: if (c=='\n')
	cjne	r2,#0x0A,L006006?
;	tetrisF38x.c:220: while (!TI);
L006001?:
;	tetrisF38x.c:221: TI=0;
	jbc	_TI,L006017?
	sjmp	L006001?
L006017?:
;	tetrisF38x.c:222: SBUF='\r';
	mov	_SBUF,#0x0D
;	tetrisF38x.c:224: while (!TI);
L006006?:
;	tetrisF38x.c:225: TI=0;
	jbc	_TI,L006018?
	sjmp	L006006?
L006018?:
;	tetrisF38x.c:226: SBUF=c;
	mov	_SBUF,r2
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'refresh'
;------------------------------------------------------------
;XPos                      Allocated to registers r3 
;YPos                      Allocated to registers r2 
;------------------------------------------------------------
;	tetrisF38x.c:239: void refresh(void)
;	-----------------------------------------
;	 function refresh
;	-----------------------------------------
_refresh:
;	tetrisF38x.c:243: for(YPos=0; YPos < SCN_HT; YPos++)
	mov	r2,#0x00
L007007?:
	clr	c
	mov	a,r2
	xrl	a,#0x80
	subb	a,#0x98
	jc	L007020?
	ljmp	L007010?
L007020?:
;	tetrisF38x.c:245: for(XPos=0; XPos < SCN_WID; XPos++)
	mov	r3,#0x00
L007003?:
	clr	c
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x8f
	jc	L007021?
	ljmp	L007009?
L007021?:
;	tetrisF38x.c:247: if((rscr(XPos, YPos)&0x80)==0x80)
	mov	_rscr_PARM_2,r2
	mov	dpl,r3
	push	ar2
	push	ar3
	lcall	_rscr
	mov	a,dpl
	pop	ar3
	pop	ar2
	anl	a,#0x80
	mov	r4,a
	cjne	r4,#0x80,L007022?
	sjmp	L007023?
L007022?:
	ljmp	L007005?
L007023?:
;	tetrisF38x.c:249: wscr(XPos, YPos, rscr(XPos, YPos)&0x7f);
	mov	_rscr_PARM_2,r2
	mov	dpl,r3
	push	ar2
	push	ar3
	lcall	_rscr
	mov	a,dpl
	pop	ar3
	pop	ar2
	anl	a,#0x7F
	mov	_wscr_PARM_3,a
	mov	_wscr_PARM_2,r2
	mov	dpl,r3
	push	ar2
	push	ar3
	lcall	_wscr
	pop	ar3
	pop	ar2
;	tetrisF38x.c:251: printf(GOTO_YX, YPos + 1, (XPos*2)+1);/* gotoxy(XPos, YPos) */
	clr	F0
	mov	b,#0x02
	mov	a,r3
	jnb	acc.7,L007024?
	cpl	F0
	cpl	a
	inc	a
L007024?:
	mul	ab
	jnb	F0,L007025?
	cpl	a
	add	a,#0x01
	xch	a,b
	cpl	a
	addc	a,#0x00
	xch	a,b
L007025?:
	add	a,#0x01
	mov	r4,a
	clr	a
	addc	a,b
	mov	r5,a
	mov	a,r2
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
	inc	r6
	cjne	r6,#0x00,L007026?
	inc	r7
L007026?:
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	lcall	_printf_tiny
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
	pop	ar3
	pop	ar2
;	tetrisF38x.c:253: printf("\x1B[3%dm\xDB\xDB", rscr(XPos, YPos));
	mov	_rscr_PARM_2,r2
	mov	dpl,r3
	push	ar2
	push	ar3
	lcall	_rscr
	mov	r4,dpl
	mov	r5,#0x00
	push	ar4
	push	ar5
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	lcall	_printf_tiny
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
L007005?:
;	tetrisF38x.c:245: for(XPos=0; XPos < SCN_WID; XPos++)
	inc	r3
	ljmp	L007003?
L007009?:
;	tetrisF38x.c:243: for(YPos=0; YPos < SCN_HT; YPos++)
	inc	r2
	ljmp	L007007?
L007010?:
;	tetrisF38x.c:258: printf(BKF_WTB);
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	lcall	_printf_tiny
	dec	sp
	dec	sp
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'blockDraw'
;------------------------------------------------------------
;YPos                      Allocated with name '_blockDraw_PARM_2'
;Color                     Allocated with name '_blockDraw_PARM_3'
;XPos                      Allocated to registers r2 
;------------------------------------------------------------
;	tetrisF38x.c:270: void blockDraw(char XPos, char YPos, unsigned char Color)
;	-----------------------------------------
;	 function blockDraw
;	-----------------------------------------
_blockDraw:
	mov	r2,dpl
;	tetrisF38x.c:272: if(XPos >= SCN_WID) XPos=SCN_WID - 1;
	clr	c
	mov	a,r2
	xrl	a,#0x80
	subb	a,#0x8f
	jc	L008002?
	mov	r2,#0x0E
L008002?:
;	tetrisF38x.c:273: if(YPos >= SCN_HT) YPos=SCN_HT - 1;
	clr	c
	mov	a,_blockDraw_PARM_2
	xrl	a,#0x80
	subb	a,#0x98
	jc	L008004?
	mov	_blockDraw_PARM_2,#0x17
L008004?:
;	tetrisF38x.c:275: wscr(XPos, YPos, Color|0x80);
	mov	_wscr_PARM_2,_blockDraw_PARM_2
	mov	a,#0x80
	orl	a,_blockDraw_PARM_3
	mov	_wscr_PARM_3,a
	mov	dpl,r2
	ljmp	_wscr
;------------------------------------------------------------
;Allocation info for local variables in function 'blockHit'
;------------------------------------------------------------
;YPos                      Allocated with name '_blockHit_PARM_2'
;XPos                      Allocated to registers r2 
;------------------------------------------------------------
;	tetrisF38x.c:285: char blockHit(char XPos, char YPos)
;	-----------------------------------------
;	 function blockHit
;	-----------------------------------------
_blockHit:
;	tetrisF38x.c:287: return(rscr(XPos, YPos)&0x7f);
	mov	_rscr_PARM_2,_blockHit_PARM_2
	lcall	_rscr
	mov	a,dpl
	anl	a,#0x7F
	mov	dpl,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'shapeDraw'
;------------------------------------------------------------
;YPos                      Allocated with name '_shapeDraw_PARM_2'
;WhichShape                Allocated with name '_shapeDraw_PARM_3'
;XPos                      Allocated to registers r2 
;Index                     Allocated to registers r6 
;------------------------------------------------------------
;	tetrisF38x.c:299: void shapeDraw(char XPos, char YPos, char WhichShape)
;	-----------------------------------------
;	 function shapeDraw
;	-----------------------------------------
_shapeDraw:
	mov	r2,dpl
;	tetrisF38x.c:303: for(Index=0; Index < 4; Index++)
	mov	a,_shapeDraw_PARM_3
	mov	b,#0x0B
	mul	ab
	mov	r3,a
	add	a,#_Shapes
	mov	r4,a
	clr	a
	addc	a,#(_Shapes >> 8)
	mov	r5,a
	mov	a,#0x03
	add	a,r4
	mov	r4,a
	clr	a
	addc	a,r5
	mov	r5,a
	mov	r6,#0x00
L010001?:
	clr	c
	mov	a,r6
	xrl	a,#0x80
	subb	a,#0x84
	jnc	L010004?
;	tetrisF38x.c:305: blockDraw(XPos, YPos, Shapes[WhichShape].Color);
	mov	a,r3
	add	a,#_Shapes
	mov	r7,a
	clr	a
	addc	a,#(_Shapes >> 8)
	mov	r0,a
	mov	dpl,r7
	mov	dph,r0
	inc	dptr
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	_blockDraw_PARM_3,a
	mov	_blockDraw_PARM_2,_shapeDraw_PARM_2
	mov	dpl,r2
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_blockDraw
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	tetrisF38x.c:306: XPos += Shapes[WhichShape].Dir[Index].DeltaX;
	mov	a,r6
	add	a,r6
	mov	r7,a
	add	a,r4
	mov	dpl,a
	clr	a
	addc	a,r5
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	add	a,r2
	mov	r2,a
;	tetrisF38x.c:307: YPos += Shapes[WhichShape].Dir[Index].DeltaY;
	mov	a,r7
	add	a,r4
	mov	r7,a
	clr	a
	addc	a,r5
	mov	r0,a
	mov	dpl,r7
	mov	dph,r0
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	r7,a
	add	a,_shapeDraw_PARM_2
	mov	_shapeDraw_PARM_2,a
;	tetrisF38x.c:303: for(Index=0; Index < 4; Index++)
	inc	r6
	sjmp	L010001?
L010004?:
;	tetrisF38x.c:309: blockDraw(XPos, YPos, Shapes[WhichShape].Color);
	mov	a,r3
	add	a,#_Shapes
	mov	r3,a
	clr	a
	addc	a,#(_Shapes >> 8)
	mov	r4,a
	mov	dpl,r3
	mov	dph,r4
	inc	dptr
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	_blockDraw_PARM_3,a
	mov	_blockDraw_PARM_2,_shapeDraw_PARM_2
	mov	dpl,r2
	ljmp	_blockDraw
;------------------------------------------------------------
;Allocation info for local variables in function 'shapeErase'
;------------------------------------------------------------
;YPos                      Allocated with name '_shapeErase_PARM_2'
;WhichShape                Allocated with name '_shapeErase_PARM_3'
;XPos                      Allocated to registers r2 
;Index                     Allocated to registers r5 
;------------------------------------------------------------
;	tetrisF38x.c:317: void shapeErase(char XPos, char YPos, char WhichShape)
;	-----------------------------------------
;	 function shapeErase
;	-----------------------------------------
_shapeErase:
	mov	r2,dpl
;	tetrisF38x.c:321: for(Index=0; Index < 4; Index++)
	mov	a,_shapeErase_PARM_3
	mov	b,#0x0B
	mul	ab
	add	a,#_Shapes
	mov	r3,a
	clr	a
	addc	a,#(_Shapes >> 8)
	mov	r4,a
	mov	a,#0x03
	add	a,r3
	mov	r3,a
	clr	a
	addc	a,r4
	mov	r4,a
	mov	r5,#0x00
L011001?:
	clr	c
	mov	a,r5
	xrl	a,#0x80
	subb	a,#0x84
	jnc	L011004?
;	tetrisF38x.c:323: blockDraw(XPos, YPos, COLOR_BLACK);
	mov	_blockDraw_PARM_2,_shapeErase_PARM_2
	mov	_blockDraw_PARM_3,#0x00
	mov	dpl,r2
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_blockDraw
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	tetrisF38x.c:324: XPos += Shapes[WhichShape].Dir[Index].DeltaX;
	mov	a,r5
	add	a,r5
	mov	r6,a
	add	a,r3
	mov	dpl,a
	clr	a
	addc	a,r4
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	add	a,r2
	mov	r2,a
;	tetrisF38x.c:325: YPos += Shapes[WhichShape].Dir[Index].DeltaY;
	mov	a,r6
	add	a,r3
	mov	r6,a
	clr	a
	addc	a,r4
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	r6,a
	add	a,_shapeErase_PARM_2
	mov	_shapeErase_PARM_2,a
;	tetrisF38x.c:321: for(Index=0; Index < 4; Index++)
	inc	r5
	sjmp	L011001?
L011004?:
;	tetrisF38x.c:327: blockDraw(XPos, YPos, COLOR_BLACK);
	mov	_blockDraw_PARM_2,_shapeErase_PARM_2
	mov	_blockDraw_PARM_3,#0x00
	mov	dpl,r2
	ljmp	_blockDraw
;------------------------------------------------------------
;Allocation info for local variables in function 'shapeHit'
;------------------------------------------------------------
;YPos                      Allocated with name '_shapeHit_PARM_2'
;WhichShape                Allocated with name '_shapeHit_PARM_3'
;XPos                      Allocated to registers r2 
;Index                     Allocated to registers r5 
;------------------------------------------------------------
;	tetrisF38x.c:337: char shapeHit(char XPos, char YPos, char WhichShape)
;	-----------------------------------------
;	 function shapeHit
;	-----------------------------------------
_shapeHit:
	mov	r2,dpl
;	tetrisF38x.c:341: for(Index=0; Index < 4; Index++)
	mov	a,_shapeHit_PARM_3
	mov	b,#0x0B
	mul	ab
	add	a,#_Shapes
	mov	r3,a
	clr	a
	addc	a,#(_Shapes >> 8)
	mov	r4,a
	mov	a,#0x03
	add	a,r3
	mov	r3,a
	clr	a
	addc	a,r4
	mov	r4,a
	mov	r5,#0x00
L012005?:
	clr	c
	mov	a,r5
	xrl	a,#0x80
	subb	a,#0x84
	jnc	L012008?
;	tetrisF38x.c:343: if(blockHit(XPos, YPos)) return(1);
	mov	_blockHit_PARM_2,_shapeHit_PARM_2
	mov	dpl,r2
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_blockHit
	mov	a,dpl
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	jz	L012002?
	mov	dpl,#0x01
	ret
L012002?:
;	tetrisF38x.c:344: XPos += Shapes[WhichShape].Dir[Index].DeltaX;
	mov	a,r5
	add	a,r5
	mov	r6,a
	add	a,r3
	mov	dpl,a
	clr	a
	addc	a,r4
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	add	a,r2
	mov	r2,a
;	tetrisF38x.c:345: YPos += Shapes[WhichShape].Dir[Index].DeltaY;
	mov	a,r6
	add	a,r3
	mov	r6,a
	clr	a
	addc	a,r4
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	r6,a
	add	a,_shapeHit_PARM_2
	mov	_shapeHit_PARM_2,a
;	tetrisF38x.c:341: for(Index=0; Index < 4; Index++)
	inc	r5
	sjmp	L012005?
L012008?:
;	tetrisF38x.c:347: if(blockHit(XPos, YPos)) return(1);
	mov	_blockHit_PARM_2,_shapeHit_PARM_2
	mov	dpl,r2
	lcall	_blockHit
	mov	a,dpl
	jz	L012004?
	mov	dpl,#0x01
;	tetrisF38x.c:348: return(0);
	ret
L012004?:
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'screenInit'
;------------------------------------------------------------
;XPos                      Allocated to registers r3 
;YPos                      Allocated to registers r2 
;------------------------------------------------------------
;	tetrisF38x.c:360: void screenInit(void)
;	-----------------------------------------
;	 function screenInit
;	-----------------------------------------
_screenInit:
;	tetrisF38x.c:364: for(YPos=0; YPos < SCN_HT; YPos++)
	mov	r2,#0x00
L013005?:
	cjne	r2,#0x18,L013024?
L013024?:
	jnc	L013008?
;	tetrisF38x.c:366: for(XPos=1; XPos < (SCN_WID - 1); XPos++) wscr(XPos,YPos,0x80);
	mov	r3,#0x01
L013001?:
	cjne	r3,#0x0E,L013026?
L013026?:
	jnc	L013004?
	mov	_wscr_PARM_2,r2
	mov	_wscr_PARM_3,#0x80
	mov	dpl,r3
	push	ar2
	push	ar3
	lcall	_wscr
	pop	ar3
	pop	ar2
	inc	r3
	sjmp	L013001?
L013004?:
;	tetrisF38x.c:368: wscr(0, YPos, COLOR_BLUE|0x80);
	mov	_wscr_PARM_2,r2
	mov	_wscr_PARM_3,#0x84
	mov	dpl,#0x00
	push	ar2
	lcall	_wscr
	pop	ar2
;	tetrisF38x.c:369: wscr(SCN_WID - 1, YPos, COLOR_BLUE|0x80);
	mov	_wscr_PARM_2,r2
	mov	_wscr_PARM_3,#0x84
	mov	dpl,#0x0E
	push	ar2
	lcall	_wscr
	pop	ar2
;	tetrisF38x.c:364: for(YPos=0; YPos < SCN_HT; YPos++)
	inc	r2
	sjmp	L013005?
L013008?:
;	tetrisF38x.c:371: for(XPos=0; XPos < SCN_WID; XPos++)
	mov	r2,#0x00
L013009?:
	cjne	r2,#0x0F,L013028?
L013028?:
	jnc	L013013?
;	tetrisF38x.c:374: wscr(XPos, 0, COLOR_BLUE|0x80);
	mov	_wscr_PARM_2,#0x00
	mov	_wscr_PARM_3,#0x84
	mov	dpl,r2
	push	ar2
	lcall	_wscr
	pop	ar2
;	tetrisF38x.c:375: wscr(XPos, SCN_HT-1, COLOR_BLUE|0x80);
	mov	_wscr_PARM_2,#0x17
	mov	_wscr_PARM_3,#0x84
	mov	dpl,r2
	push	ar2
	lcall	_wscr
	pop	ar2
;	tetrisF38x.c:371: for(XPos=0; XPos < SCN_WID; XPos++)
	inc	r2
	sjmp	L013009?
L013013?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'collapse'
;------------------------------------------------------------
;SolidRows                 Allocated to registers r2 
;Row                       Allocated to registers r3 
;Col                       Allocated to registers r5 
;Temp                      Allocated to registers r2 
;------------------------------------------------------------
;	tetrisF38x.c:379: void collapse(void)
;	-----------------------------------------
;	 function collapse
;	-----------------------------------------
_collapse:
;	tetrisF38x.c:387: for(Row=1; Row < SCN_HT - 1; Row++)
	mov	r2,#0x00
	mov	r3,#0x01
L014017?:
	clr	c
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x97
	jnc	L014020?
;	tetrisF38x.c:390: for(Col=1; Col < SCN_WID - 1; Col++)
	mov	r4,#0x00
	mov	r5,#0x01
L014013?:
	clr	c
	mov	a,r5
	xrl	a,#0x80
	subb	a,#0x8e
	jnc	L014016?
;	tetrisF38x.c:391: if(rscr(Col, Row)&0x7f) Temp++;
	mov	_rscr_PARM_2,r3
	mov	dpl,r5
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_rscr
	mov	a,dpl
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	anl	a,#0x7F
	jz	L014015?
	inc	r4
L014015?:
;	tetrisF38x.c:390: for(Col=1; Col < SCN_WID - 1; Col++)
	inc	r5
	sjmp	L014013?
L014016?:
;	tetrisF38x.c:392: if(Temp == SCN_WID - 2)
	cjne	r4,#0x0D,L014019?
;	tetrisF38x.c:395: wscr(0, Row, COLOR_BLUE|0x80);
	mov	_wscr_PARM_2,r3
	mov	_wscr_PARM_3,#0x84
	mov	dpl,#0x00
	push	ar2
	push	ar3
	lcall	_wscr
	pop	ar3
	pop	ar2
;	tetrisF38x.c:396: SolidRows++;
	inc	r2
;	tetrisF38x.c:397: Level++;
	inc	_Level
	clr	a
	cjne	a,_Level,L014061?
	inc	(_Level + 1)
L014061?:
L014019?:
;	tetrisF38x.c:387: for(Row=1; Row < SCN_HT - 1; Row++)
	inc	r3
	sjmp	L014017?
L014020?:
;	tetrisF38x.c:400: if(SolidRows == 0) return;
	mov	a,r2
	jnz	L014006?
	ret
L014006?:
;	tetrisF38x.c:402: Score+=bonus[SolidRows]; /* Bonus! */
	mov	a,r2
	add	a,r2
	mov	r2,a
	mov	dptr,#_collapse_bonus_1_68
	movc	a,@a+dptr
	xch	a,r2
	inc	dptr
	movc	a,@a+dptr
	mov	r3,a
	mov	a,r2
	add	a,_Score
	mov	_Score,a
	mov	a,r3
	addc	a,(_Score + 1)
	mov	(_Score + 1),a
;	tetrisF38x.c:405: for(Temp=Row=SCN_HT - 2; Row > 0; Row--, Temp--)
	mov	r2,#0x16
	mov	r3,#0x16
L014029?:
	clr	c
	clr	a
	xrl	a,#0x80
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	jc	L014063?
	ljmp	L014032?
L014063?:
;	tetrisF38x.c:407: while(rscr(0, Temp)&0x80) Temp--;
	mov	ar4,r2
L014007?:
	mov	_rscr_PARM_2,r4
	mov	dpl,#0x00
	push	ar3
	push	ar4
	lcall	_rscr
	mov	a,dpl
	pop	ar4
	pop	ar3
	jnb	acc.7,L014051?
	dec	r4
	mov	ar2,r4
	sjmp	L014007?
L014051?:
	mov	ar2,r4
;	tetrisF38x.c:408: if(Temp < 1)
	clr	c
	mov	a,r4
	xrl	a,#0x80
	subb	a,#0x81
	jnc	L014048?
;	tetrisF38x.c:410: for(Col=1; Col < SCN_WID - 1; Col++)
	mov	r4,#0x01
L014021?:
	clr	c
	mov	a,r4
	xrl	a,#0x80
	subb	a,#0x8e
	jnc	L014031?
;	tetrisF38x.c:411: wscr(Col, Row, COLOR_BLACK|0x80);
	mov	_wscr_PARM_2,r3
	mov	_wscr_PARM_3,#0x80
	mov	dpl,r4
	push	ar2
	push	ar3
	push	ar4
	lcall	_wscr
	pop	ar4
	pop	ar3
	pop	ar2
;	tetrisF38x.c:410: for(Col=1; Col < SCN_WID - 1; Col++)
	inc	r4
;	tetrisF38x.c:415: for(Col=1; Col < SCN_WID - 1; Col++)
	sjmp	L014021?
L014048?:
	mov	r4,#0x01
L014025?:
	clr	c
	mov	a,r4
	xrl	a,#0x80
	subb	a,#0x8e
	jnc	L014031?
;	tetrisF38x.c:416: wscr(Col, Row, rscr(Col,Temp)|0x80);
	mov	_rscr_PARM_2,r2
	mov	dpl,r4
	push	ar2
	push	ar3
	push	ar4
	lcall	_rscr
	mov	a,dpl
	pop	ar4
	pop	ar3
	orl	a,#0x80
	mov	_wscr_PARM_3,a
	mov	_wscr_PARM_2,r3
	mov	dpl,r4
	push	ar3
	push	ar4
	lcall	_wscr
	pop	ar4
	pop	ar3
	pop	ar2
;	tetrisF38x.c:415: for(Col=1; Col < SCN_WID - 1; Col++)
	inc	r4
	sjmp	L014025?
L014031?:
;	tetrisF38x.c:405: for(Temp=Row=SCN_HT - 2; Row > 0; Row--, Temp--)
	dec	r3
	dec	r2
	ljmp	L014029?
L014032?:
;	tetrisF38x.c:419: refresh();
	ljmp	_refresh
;------------------------------------------------------------
;Allocation info for local variables in function 'getKey'
;------------------------------------------------------------
;------------------------------------------------------------
;	tetrisF38x.c:422: char getKey(void)
;	-----------------------------------------
;	 function getKey
;	-----------------------------------------
_getKey:
;	tetrisF38x.c:424: if(!RI) return 0;
	jb	_RI,L015002?
	mov	dpl,#0x00
	ret
L015002?:
;	tetrisF38x.c:426: RI=0;
	clr	_RI
;	tetrisF38x.c:427: switch(toupper(SBUF))
	mov	dpl,_SBUF
	lcall	_islower
	mov	a,dpl
	jz	L015020?
	mov	r2,_SBUF
	anl	ar2,#0xDF
	sjmp	L015021?
L015020?:
	mov	r2,_SBUF
L015021?:
	cjne	r2,#0x2C,L015038?
	sjmp	L015010?
L015038?:
	cjne	r2,#0x42,L015039?
	sjmp	L015011?
L015039?:
	cjne	r2,#0x49,L015040?
	sjmp	L015008?
L015040?:
	cjne	r2,#0x4A,L015041?
	sjmp	L015006?
L015041?:
	cjne	r2,#0x4B,L015042?
	sjmp	L015004?
L015042?:
	cjne	r2,#0x4C,L015043?
	sjmp	L015007?
L015043?:
	cjne	r2,#0x4D,L015044?
	sjmp	L015010?
L015044?:
	cjne	r2,#0x50,L015045?
	sjmp	L015013?
L015045?:
	cjne	r2,#0x51,L015046?
	sjmp	L015003?
L015046?:
;	tetrisF38x.c:429: case 'Q': return KEY_QUIT;
	cjne	r2,#0x55,L015017?
	sjmp	L015005?
L015003?:
	mov	dpl,#0x01
;	tetrisF38x.c:430: case 'K': return KEY_CCW;
	ret
L015004?:
	mov	dpl,#0x03
;	tetrisF38x.c:431: case 'U': return KEY_CW;
	ret
L015005?:
	mov	dpl,#0x02
;	tetrisF38x.c:432: case 'J': return KEY_LEFT;
	ret
L015006?:
	mov	dpl,#0x05
;	tetrisF38x.c:433: case 'L': return KEY_RIGHT;
	ret
L015007?:
	mov	dpl,#0x04
;	tetrisF38x.c:434: case 'I': return KEY_UP;
	ret
L015008?:
	mov	dpl,#0x06
;	tetrisF38x.c:436: case 'M': return KEY_DOWN;
	ret
L015010?:
	mov	dpl,#0x07
;	tetrisF38x.c:437: case 'B': return KEY_BEGIN;
	ret
L015011?:
	mov	dpl,#0x08
;	tetrisF38x.c:439: while(!RI);
	ret
L015013?:
;	tetrisF38x.c:440: RI=0;
	jbc	_RI,L015048?
	sjmp	L015013?
L015048?:
;	tetrisF38x.c:443: }
L015017?:
;	tetrisF38x.c:444: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'wastetime'
;------------------------------------------------------------
;j                         Allocated to registers r2 r3 
;k                         Allocated to registers r4 
;------------------------------------------------------------
;	tetrisF38x.c:447: void wastetime(int j)
;	-----------------------------------------
;	 function wastetime
;	-----------------------------------------
_wastetime:
	mov	r2,dpl
	mov	r3,dph
;	tetrisF38x.c:450: while((j--)&&(RI==0))
L016008?:
	mov	ar4,r2
	mov	ar5,r3
	dec	r2
	cjne	r2,#0xff,L016020?
	dec	r3
L016020?:
	mov	a,r4
	orl	a,r5
	jz	L016011?
	jb	_RI,L016011?
;	tetrisF38x.c:452: for(k=0; k<delay; k++) if (RI) break;
	mov	r4,#0x00
L016003?:
	clr	c
	mov	a,r4
	subb	a,_delay
	jnc	L016008?
	jb	_RI,L016008?
	inc	r4
	sjmp	L016003?
L016011?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'exit'
;------------------------------------------------------------
;------------------------------------------------------------
;	tetrisF38x.c:456: void exit (void)
;	-----------------------------------------
;	 function exit
;	-----------------------------------------
_exit:
;	tetrisF38x.c:458: printf(CLEAR_SCREEN CURSOR_ON BKF_WTB);
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	lcall	_printf_tiny
	dec	sp
	dec	sp
;	tetrisF38x.c:461: _endasm;
	
	       lcall 1bh
	    
;	tetrisF38x.c:462: while(1);
L017002?:
	sjmp	L017002?
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;Fell                      Allocated to registers r3 
;NewShape                  Allocated to registers r4 
;NewX                      Allocated to registers r5 
;NewY                      Allocated to registers r6 
;Shape                     Allocated with name '_main_Shape_1_83'
;X                         Allocated with name '_main_X_1_83'
;Y                         Allocated with name '_main_Y_1_83'
;Key                       Allocated to registers r2 
;------------------------------------------------------------
;	tetrisF38x.c:465: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	tetrisF38x.c:474: printf(CLEAR_SCREEN CURSOR_OFF);
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	lcall	_printf_tiny
	dec	sp
	dec	sp
;	tetrisF38x.c:475: printf(GOTO_YX "TETRIS by Alexei Pazhitnov", 1, TEXT_POS);
	mov	a,#0x20
	push	acc
	clr	a
	push	acc
	mov	a,#0x01
	push	acc
	clr	a
	push	acc
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	lcall	_printf_tiny
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	tetrisF38x.c:476: printf(GOTO_YX "Originally by Chris Giese", 2, TEXT_POS);
	mov	a,#0x20
	push	acc
	clr	a
	push	acc
	mov	a,#0x02
	push	acc
	clr	a
	push	acc
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	lcall	_printf_tiny
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	tetrisF38x.c:477: printf(GOTO_YX "8052/C51 port by Jesus Calvino-Fraga", 3, TEXT_POS);
	mov	a,#0x20
	push	acc
	clr	a
	push	acc
	mov	a,#0x03
	push	acc
	clr	a
	push	acc
	mov	a,#__str_7
	push	acc
	mov	a,#(__str_7 >> 8)
	push	acc
	lcall	_printf_tiny
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	tetrisF38x.c:478: printf(GOTO_YX "'K':Rotate, 'P':Pause, 'Q':Quit", 5, TEXT_POS);
	mov	a,#0x20
	push	acc
	clr	a
	push	acc
	mov	a,#0x05
	push	acc
	clr	a
	push	acc
	mov	a,#__str_8
	push	acc
	mov	a,#(__str_8 >> 8)
	push	acc
	lcall	_printf_tiny
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	tetrisF38x.c:479: printf(GOTO_YX "'J':Left, 'L':Right, 'M':Down", 6, TEXT_POS);
	mov	a,#0x20
	push	acc
	clr	a
	push	acc
	mov	a,#0x06
	push	acc
	clr	a
	push	acc
	mov	a,#__str_9
	push	acc
	mov	a,#(__str_9 >> 8)
	push	acc
	lcall	_printf_tiny
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	tetrisF38x.c:480: screenInit();
	lcall	_screenInit
;	tetrisF38x.c:481: refresh();
	lcall	_refresh
;	tetrisF38x.c:482: NEW_GAME:
L018001?:
;	tetrisF38x.c:483: printf(BKF_WTB GOTO_YX "Press 'B' to begin", 8, TEXT_POS);
	mov	a,#0x20
	push	acc
	clr	a
	push	acc
	mov	a,#0x08
	push	acc
	clr	a
	push	acc
	mov	a,#__str_10
	push	acc
	mov	a,#(__str_10 >> 8)
	push	acc
	lcall	_printf_tiny
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	tetrisF38x.c:484: do
L018004?:
;	tetrisF38x.c:486: Key=getKey();
	lcall	_getKey
	mov	r2,dpl
;	tetrisF38x.c:487: if(Key==KEY_QUIT) exit();
	cjne	r2,#0x01,L018005?
	push	ar2
	lcall	_exit
	pop	ar2
L018005?:
;	tetrisF38x.c:488: } while (Key!=KEY_BEGIN);
	cjne	r2,#0x08,L018004?
;	tetrisF38x.c:489: screenInit();
	lcall	_screenInit
;	tetrisF38x.c:491: Level=1;
	mov	_Level,#0x01
	clr	a
	mov	(_Level + 1),a
;	tetrisF38x.c:492: Score=0;
	clr	a
	mov	_Score,a
	mov	(_Score + 1),a
;	tetrisF38x.c:493: printf(BKF_WTB GOTO_YX CLR_TO_END_LINE, 8, TEXT_POS);
	mov	a,#0x20
	push	acc
	clr	a
	push	acc
	mov	a,#0x08
	push	acc
	clr	a
	push	acc
	mov	a,#__str_11
	push	acc
	mov	a,#(__str_11 >> 8)
	push	acc
	lcall	_printf_tiny
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	tetrisF38x.c:494: goto NEW_SHAPE;
	ljmp	L018039?
;	tetrisF38x.c:496: while(1)
L018048?:
;	tetrisF38x.c:498: Fell=0;
	mov	r3,#0x00
;	tetrisF38x.c:499: NewShape=Shape;
	mov	r4,_main_Shape_1_83
;	tetrisF38x.c:500: NewX=X;
	mov	r5,_main_X_1_83
;	tetrisF38x.c:501: NewY=Y;
	mov	r6,_main_Y_1_83
;	tetrisF38x.c:502: Key=getKey();
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_getKey
	mov	r2,dpl
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
;	tetrisF38x.c:503: if(Key == 0)
	mov	a,r2
	jnz	L018008?
;	tetrisF38x.c:505: NewY++;
	mov	a,_main_Y_1_83
	inc	a
	mov	r6,a
;	tetrisF38x.c:506: Fell=1;
	mov	r3,#0x01
;	tetrisF38x.c:508: wastetime(15000-((Level<42?Level:42)*300));
	clr	c
	mov	a,_Level
	subb	a,#0x2A
	mov	a,(_Level + 1)
	subb	a,#0x00
	jnc	L018052?
	mov	r7,_Level
	mov	r0,(_Level + 1)
	sjmp	L018053?
L018052?:
	mov	r7,#0x2A
	mov	r0,#0x00
L018053?:
	mov	__mulint_PARM_2,r7
	mov	(__mulint_PARM_2 + 1),r0
	mov	dptr,#0x012C
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	__mulint
	mov	r7,dpl
	mov	r0,dph
	mov	a,#0x98
	clr	c
	subb	a,r7
	mov	dpl,a
	mov	a,#0x3A
	subb	a,r0
	mov	dph,a
	lcall	_wastetime
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
L018008?:
;	tetrisF38x.c:511: if(RI) Key=getKey();
	jnb	_RI,L018010?
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_getKey
	mov	r2,dpl
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
L018010?:
;	tetrisF38x.c:513: if(Key != 0)
	mov	a,r2
	jz	L018034?
;	tetrisF38x.c:515: NewY=Y;
	mov	r6,_main_Y_1_83
;	tetrisF38x.c:516: if(Key == KEY_QUIT) break;
	cjne	r2,#0x01,L018084?
	ljmp	L018049?
L018084?:
;	tetrisF38x.c:517: if(Key == KEY_CCW)
	cjne	r2,#0x03,L018031?
;	tetrisF38x.c:518: NewShape=Shapes[Shape].Plus90;
	mov	a,_main_Shape_1_83
	mov	b,#0x0B
	mul	ab
	mov	dptr,#_Shapes
	movc	a,@a+dptr
	mov	r4,a
	sjmp	L018032?
L018031?:
;	tetrisF38x.c:519: else if(Key == KEY_CW)
	cjne	r2,#0x02,L018028?
;	tetrisF38x.c:520: NewShape=Shapes[Shape].Minus90;
	mov	a,_main_Shape_1_83
	mov	b,#0x0B
	mul	ab
	add	a,#_Shapes
	mov	r7,a
	clr	a
	addc	a,#(_Shapes >> 8)
	mov	r0,a
	mov	dpl,r7
	mov	dph,r0
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	r4,a
	sjmp	L018032?
L018028?:
;	tetrisF38x.c:521: else if(Key == KEY_LEFT)
	cjne	r2,#0x05,L018025?
;	tetrisF38x.c:522: {	if(X) NewX=X - 1; }
	mov	a,_main_X_1_83
	jz	L018032?
	mov	a,_main_X_1_83
	dec	a
	mov	r5,a
	sjmp	L018032?
L018025?:
;	tetrisF38x.c:523: else if(Key == KEY_RIGHT)
	cjne	r2,#0x04,L018022?
;	tetrisF38x.c:524: {	if(X < SCN_WID - 1) NewX=X + 1; }
	clr	c
	mov	a,_main_X_1_83
	xrl	a,#0x80
	subb	a,#0x8e
	jnc	L018032?
	mov	a,_main_X_1_83
	inc	a
	mov	r5,a
	sjmp	L018032?
L018022?:
;	tetrisF38x.c:527: else if(Key == KEY_DOWN)
	cjne	r2,#0x07,L018032?
;	tetrisF38x.c:528: {	if(Y < SCN_HT - 1) NewY=Y + 1; }
	clr	c
	mov	a,_main_Y_1_83
	xrl	a,#0x80
	subb	a,#0x97
	jnc	L018032?
	mov	a,_main_Y_1_83
	inc	a
	mov	r6,a
L018032?:
;	tetrisF38x.c:529: Fell=0;
	mov	r3,#0x00
L018034?:
;	tetrisF38x.c:532: if((NewX == X) && (NewY == Y) && (NewShape == Shape))
	mov	a,r5
	cjne	a,_main_X_1_83,L018036?
	mov	a,r6
	cjne	a,_main_Y_1_83,L018036?
	mov	a,r4
	cjne	a,_main_Shape_1_83,L018102?
	ljmp	L018048?
L018102?:
;	tetrisF38x.c:533: continue;
L018036?:
;	tetrisF38x.c:535: shapeErase(X, Y, Shape);
	mov	_shapeErase_PARM_2,_main_Y_1_83
	mov	_shapeErase_PARM_3,_main_Shape_1_83
	mov	dpl,_main_X_1_83
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_shapeErase
	pop	ar6
	pop	ar5
	pop	ar4
;	tetrisF38x.c:537: if(shapeHit(NewX, NewY, NewShape) == 0) /* no, update pos'n */
	mov	_shapeHit_PARM_2,r6
	mov	_shapeHit_PARM_3,r4
	mov	dpl,r5
	push	ar4
	push	ar5
	push	ar6
	lcall	_shapeHit
	mov	a,dpl
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	jnz	L018045?
;	tetrisF38x.c:539: X=NewX;
	mov	_main_X_1_83,r5
;	tetrisF38x.c:540: Y=NewY;
	mov	_main_Y_1_83,r6
;	tetrisF38x.c:541: Shape=NewShape;
	mov	_main_Shape_1_83,r4
	ljmp	L018046?
L018045?:
;	tetrisF38x.c:543: else if(Fell) /* Yes -- did the piece hit something while falling on its own? */
	mov	a,r3
	jnz	L018104?
	ljmp	L018046?
L018104?:
;	tetrisF38x.c:545: shapeDraw(X, Y, Shape); /* Yes, draw it at the old pos'n... */
	mov	_shapeDraw_PARM_2,_main_Y_1_83
	mov	_shapeDraw_PARM_3,_main_Shape_1_83
	mov	dpl,_main_X_1_83
	lcall	_shapeDraw
;	tetrisF38x.c:547: NEW_SHAPE:
L018039?:
;	tetrisF38x.c:548: Y=3;
	mov	_main_Y_1_83,#0x03
;	tetrisF38x.c:549: X=SCN_WID / 2;
	mov	_main_X_1_83,#0x07
;	tetrisF38x.c:550: Shape=TL0 % 19; //rand() was here, use timer 0 register instead...
	mov	b,#0x13
	mov	a,_TL0
	div	ab
	mov	_main_Shape_1_83,b
;	tetrisF38x.c:551: collapse();
	lcall	_collapse
;	tetrisF38x.c:553: if(shapeHit(X, Y, Shape))
	mov	_shapeHit_PARM_2,#0x03
	mov	_shapeHit_PARM_3,_main_Shape_1_83
	mov	dpl,#0x07
	lcall	_shapeHit
	mov	a,dpl
	jz	L018041?
;	tetrisF38x.c:555: printf(BKF_WTB GOTO_YX " GAME OVER ", SCN_HT/2, (SCN_WID-5));
	mov	a,#0x0A
	push	acc
	clr	a
	push	acc
	mov	a,#0x0C
	push	acc
	clr	a
	push	acc
	mov	a,#__str_12
	push	acc
	mov	a,#(__str_12 >> 8)
	push	acc
	lcall	_printf_tiny
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	tetrisF38x.c:556: goto NEW_GAME;
	ljmp	L018001?
L018041?:
;	tetrisF38x.c:558: Score+=Level;
	mov	a,_Level
	add	a,_Score
	mov	_Score,a
	mov	a,(_Level + 1)
	addc	a,(_Score + 1)
	mov	(_Score + 1),a
;	tetrisF38x.c:559: printf(GOTO_YX CLR_TO_END_LINE "Level: %u", 15, TEXT_POS, Level);
	push	_Level
	push	(_Level + 1)
	mov	a,#0x20
	push	acc
	clr	a
	push	acc
	mov	a,#0x0F
	push	acc
	clr	a
	push	acc
	mov	a,#__str_13
	push	acc
	mov	a,#(__str_13 >> 8)
	push	acc
	lcall	_printf_tiny
	mov	a,sp
	add	a,#0xf8
	mov	sp,a
;	tetrisF38x.c:560: printf(GOTO_YX CLR_TO_END_LINE "Score: %u", 16, TEXT_POS, Score);
	push	_Score
	push	(_Score + 1)
	mov	a,#0x20
	push	acc
	clr	a
	push	acc
	mov	a,#0x10
	push	acc
	clr	a
	push	acc
	mov	a,#__str_14
	push	acc
	mov	a,#(__str_14 >> 8)
	push	acc
	lcall	_printf_tiny
	mov	a,sp
	add	a,#0xf8
	mov	sp,a
L018046?:
;	tetrisF38x.c:563: shapeDraw(X, Y, Shape);
	mov	_shapeDraw_PARM_2,_main_Y_1_83
	mov	_shapeDraw_PARM_3,_main_Shape_1_83
	mov	dpl,_main_X_1_83
	lcall	_shapeDraw
;	tetrisF38x.c:564: refresh();
	lcall	_refresh
	ljmp	L018048?
L018049?:
;	tetrisF38x.c:566: exit();
	ljmp	_exit
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
_Shapes:
	db 0x00	;  0 
	db 0x00	;  0 
	db 0x04	;  4 
	db 0x00	;  0 
	db 0xff	; -1 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0x02	;  2 
	db 0x02	;  2 
	db 0x02	;  2 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x01	;  1 
	db 0x02	;  2 
	db 0x00	;  0 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x04	;  4 
	db 0x04	;  4 
	db 0x06	;  6 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0x03	;  3 
	db 0x03	;  3 
	db 0x06	;  6 
	db 0x00	;  0 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x06	;  6 
	db 0x06	;  6 
	db 0x01	;  1 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0x05	;  5 
	db 0x05	;  5 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x08	;  8 
	db 0x0a	;  10 
	db 0x05	;  5 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0x00	;  0 
	db 0xff	; -1 
	db 0x09	;  9 
	db 0x07	;  7 
	db 0x05	;  5 
	db 0x00	;  0 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0x0a	;  10 
	db 0x08	;  8 
	db 0x05	;  5 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x07	;  7 
	db 0x09	;  9 
	db 0x05	;  5 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0xff	; -1 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0x0c	;  12 
	db 0x0e	;  14 
	db 0x03	;  3 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x0d	;  13 
	db 0x0b	;  11 
	db 0x03	;  3 
	db 0x00	;  0 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0x0e	;  14 
	db 0x0c	;  12 
	db 0x03	;  3 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0x00	;  0 
	db 0xff	; -1 
	db 0x0b	;  11 
	db 0x0d	;  13 
	db 0x03	;  3 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0xff	; -1 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0x10	;  16 
	db 0x12	;  18 
	db 0x07	;  7 
	db 0x00	;  0 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0x02	;  2 
	db 0x00	;  0 
	db 0x11	;  17 
	db 0x0f	;  15 
	db 0x07	;  7 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0x00	;  0 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0x02	;  2 
	db 0x12	;  18 
	db 0x10	;  16 
	db 0x07	;  7 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0xff	; -1 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0xfe	; -2 	þ
	db 0x00	;  0 
	db 0x0f	;  15 
	db 0x11	;  17 
	db 0x07	;  7 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0xff	; -1 
	db 0x00	;  0 
	db 0x00	;  0 
	db 0x01	;  1 
	db 0x00	;  0 
	db 0xfe	; -2 	þ
__str_0:
	db 0x1B
	db '[%d;%dH'
	db 0x00
__str_1:
	db 0x1B
	db '[3%dm'
	db 0xDB
	db 0xDB
	db 0x00
__str_2:
	db 0x1B
	db '[0;30;47m'
	db 0x00
_collapse_bonus_1_68:
	db 0x00,0x00	; 0
	db 0x32,0x00	; 50
	db 0x64,0x00	; 100
	db 0xC8,0x00	; 200
	db 0x90,0x01	; 400
__str_3:
	db 0x1B
	db '[2J'
	db 0x1B
	db '[?25h'
	db 0x1B
	db '[0;30;47m'
	db 0x00
__str_4:
	db 0x1B
	db '[2J'
	db 0x1B
	db '[?25l'
	db 0x00
__str_5:
	db 0x1B
	db '[%d;%dHTETRIS by Alexei Pazhitnov'
	db 0x00
__str_6:
	db 0x1B
	db '[%d;%dHOriginally by Chris Giese'
	db 0x00
__str_7:
	db 0x1B
	db '[%d;%dH8052/C51 port by Jesus Calvino-Fraga'
	db 0x00
__str_8:
	db 0x1B
	db '[%d;%dH'
	db 0x27
	db 'K'
	db 0x27
	db ':Rotate, '
	db 0x27
	db 'P'
	db 0x27
	db ':Pause, '
	db 0x27
	db 'Q'
	db 0x27
	db ':Quit'
	db 0x00
__str_9:
	db 0x1B
	db '[%d;%dH'
	db 0x27
	db 'J'
	db 0x27
	db ':Left, '
	db 0x27
	db 'L'
	db 0x27
	db ':Right, '
	db 0x27
	db 'M'
	db 0x27
	db ':Down'
	db 0x00
__str_10:
	db 0x1B
	db '[0;30;47m'
	db 0x1B
	db '[%d;%dHPress '
	db 0x27
	db 'B'
	db 0x27
	db ' to begin'
	db 0x00
__str_11:
	db 0x1B
	db '[0;30;47m'
	db 0x1B
	db '[%d;%dH'
	db 0x1B
	db '[K'
	db 0x00
__str_12:
	db 0x1B
	db '[0;30;47m'
	db 0x1B
	db '[%d;%dH GAME OVER '
	db 0x00
__str_13:
	db 0x1B
	db '[%d;%dH'
	db 0x1B
	db '[KLevel: %u'
	db 0x00
__str_14:
	db 0x1B
	db '[%d;%dH'
	db 0x1B
	db '[KScore: %u'
	db 0x00

	CSEG

end
