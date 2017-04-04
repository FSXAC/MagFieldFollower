;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Mon Apr 03 19:29:46 2017
;--------------------------------------------------------
$name matrix
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
	public _mxIntensity
	public _mxSPIR
	public _mxWrite_PARM_2
	public _mxDisplay_PARM_2
	public _MX_UTURN
	public _MX_STOP
	public _MX_GO
	public _MX_TURN
	public _reverse
	public _mxDirection
	public _mxGo
	public _mxDisplay
	public _mxWrite
	public _mxSPI
	public _mxPulse
	public _mxClear
	public _mxInit
	public _mxTest
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
_MX_TURN:
	ds 8
_MX_GO:
	ds 4
_MX_STOP:
	ds 2
_MX_UTURN:
	ds 8
_mxDisplay_PARM_2:
	ds 1
_mxDisplay_grid_1_54:
	ds 3
_mxWrite_PARM_2:
	ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
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
; Interrupt vectors
;--------------------------------------------------------
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
;	matrix.c:14: unsigned char MX_TURN[8] = {0x10, 0x30, 0x70, 0xFC, 0x76, 0x32, 0x12, 0x02};
	mov	_MX_TURN,#0x10
	mov	(_MX_TURN + 0x0001),#0x30
	mov	(_MX_TURN + 0x0002),#0x70
	mov	(_MX_TURN + 0x0003),#0xFC
	mov	(_MX_TURN + 0x0004),#0x76
	mov	(_MX_TURN + 0x0005),#0x32
	mov	(_MX_TURN + 0x0006),#0x12
	mov	(_MX_TURN + 0x0007),#0x02
;	matrix.c:15: unsigned char MX_GO[4] = {0x13, 0x7F, 0xD9, 0x11};
	mov	_MX_GO,#0x13
	mov	(_MX_GO + 0x0001),#0x7F
	mov	(_MX_GO + 0x0002),#0xD9
	mov	(_MX_GO + 0x0003),#0x11
;	matrix.c:16: unsigned char MX_STOP[2] = {0x37, 0xF8};
	mov	_MX_STOP,#0x37
	mov	(_MX_STOP + 0x0001),#0xF8
;	matrix.c:17: unsigned char MX_UTURN[8] = {0x1C, 0x36, 0x22, 0x22, 0x22, 0xFA, 0x72, 0x22};
	mov	_MX_UTURN,#0x1C
	mov	(_MX_UTURN + 0x0001),#0x36
	mov	(_MX_UTURN + 0x0002),#0x22
	mov	(_MX_UTURN + 0x0003),#0x22
	mov	(_MX_UTURN + 0x0004),#0x22
	mov	(_MX_UTURN + 0x0005),#0xFA
	mov	(_MX_UTURN + 0x0006),#0x72
	mov	(_MX_UTURN + 0x0007),#0x22
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function 'reverse'
;------------------------------------------------------------
;b                         Allocated to registers r2 
;------------------------------------------------------------
;	matrix.c:20: unsigned char reverse(unsigned char b) {
;	-----------------------------------------
;	 function reverse
;	-----------------------------------------
_reverse:
	using	0
	mov	r2,dpl
;	matrix.c:21: b = (b & 0xF0) >> 4 | (b & 0x0F) << 4;
	mov	a,#0xF0
	anl	a,r2
	swap	a
	anl	a,#0x0f
	mov	r3,a
	mov	a,#0x0F
	anl	a,r2
	swap	a
	anl	a,#0xf0
	orl	a,r3
	mov	r2,a
;	matrix.c:22: b = (b & 0xCC) >> 2 | (b & 0x33) << 2;
	mov	a,#0xCC
	anl	a,r2
	rr	a
	rr	a
	anl	a,#0x3f
	mov	r3,a
	mov	a,#0x33
	anl	a,r2
	add	a,acc
	add	a,acc
	orl	a,r3
	mov	r2,a
;	matrix.c:23: b = (b & 0xAA) >> 1 | (b & 0x55) << 1;
	mov	a,#0xAA
	anl	a,r2
	clr	c
	rrc	a
	mov	r3,a
	mov	a,#0x55
	anl	a,r2
	add	a,acc
	orl	a,r3
;	matrix.c:24: return b;
	mov	dpl,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'mxDirection'
;------------------------------------------------------------
;flipped                   Allocated to registers r2 
;------------------------------------------------------------
;	matrix.c:28: void mxDirection(unsigned char flipped) {
;	-----------------------------------------
;	 function mxDirection
;	-----------------------------------------
_mxDirection:
;	matrix.c:29: if (flipped) mxDisplay(MX_TURN, 0x01);
	mov	a,dpl
	mov	r2,a
	jz	L003002?
	mov	_mxDisplay_PARM_2,#0x01
	mov	dptr,#_MX_TURN
	mov	b,#0x40
	ljmp	_mxDisplay
L003002?:
;	matrix.c:30: else mxDisplay(MX_TURN, 0x00);
	mov	_mxDisplay_PARM_2,#0x00
	mov	dptr,#_MX_TURN
	mov	b,#0x40
	ljmp	_mxDisplay
;------------------------------------------------------------
;Allocation info for local variables in function 'mxGo'
;------------------------------------------------------------
;flipped                   Allocated to registers r2 
;------------------------------------------------------------
;	matrix.c:34: void mxGo(unsigned char flipped) {
;	-----------------------------------------
;	 function mxGo
;	-----------------------------------------
_mxGo:
;	matrix.c:35: if (flipped) mxDisplay(MX_TURN, 0x02);
	mov	a,dpl
	mov	r2,a
	jz	L004002?
	mov	_mxDisplay_PARM_2,#0x02
	mov	dptr,#_MX_TURN
	mov	b,#0x40
	ljmp	_mxDisplay
L004002?:
;	matrix.c:36: else mxDisplay(MX_TURN, 0x00);
	mov	_mxDisplay_PARM_2,#0x00
	mov	dptr,#_MX_TURN
	mov	b,#0x40
	ljmp	_mxDisplay
;------------------------------------------------------------
;Allocation info for local variables in function 'mxDisplay'
;------------------------------------------------------------
;options                   Allocated with name '_mxDisplay_PARM_2'
;grid                      Allocated with name '_mxDisplay_grid_1_54'
;i                         Allocated to registers r7 
;------------------------------------------------------------
;	matrix.c:47: void mxDisplay(unsigned char *grid, unsigned char options) {
;	-----------------------------------------
;	 function mxDisplay
;	-----------------------------------------
_mxDisplay:
	mov	_mxDisplay_grid_1_54,dpl
	mov	(_mxDisplay_grid_1_54 + 1),dph
	mov	(_mxDisplay_grid_1_54 + 2),b
;	matrix.c:49: for (i = 0; i < 8; i++) {
	mov	a,#0x01
	anl	a,_mxDisplay_PARM_2
	mov	r5,a
	mov	a,#0x02
	anl	a,_mxDisplay_PARM_2
	mov	r6,a
	mov	r7,#0x00
L005010?:
	cjne	r7,#0x08,L005022?
L005022?:
	jc	L005023?
	ret
L005023?:
;	matrix.c:50: if (options & 0x02) {
	mov	a,r6
	jz	L005008?
;	matrix.c:51: if (options & 0x01) mxWrite(i+1, reverse(grid[i]));
	mov	a,r5
	jz	L005002?
	mov	a,r7
	inc	a
	mov	r0,a
	mov	a,r7
	add	a,_mxDisplay_grid_1_54
	mov	r1,a
	clr	a
	addc	a,(_mxDisplay_grid_1_54 + 1)
	mov	r2,a
	mov	r3,(_mxDisplay_grid_1_54 + 2)
	mov	dpl,r1
	mov	dph,r2
	mov	b,r3
	lcall	__gptrget
	mov	dpl,a
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	lcall	_reverse
	mov	_mxWrite_PARM_2,dpl
	pop	ar0
	mov	dpl,r0
	lcall	_mxWrite
	pop	ar7
	pop	ar6
	pop	ar5
	ljmp	L005012?
L005002?:
;	matrix.c:52: else mxWrite(i+1, grid[i]);	
	mov	a,r7
	inc	a
	mov	r2,a
	mov	a,r7
	add	a,_mxDisplay_grid_1_54
	mov	r3,a
	clr	a
	addc	a,(_mxDisplay_grid_1_54 + 1)
	mov	r4,a
	mov	r0,(_mxDisplay_grid_1_54 + 2)
	mov	dpl,r3
	mov	dph,r4
	mov	b,r0
	lcall	__gptrget
	mov	_mxWrite_PARM_2,a
	mov	dpl,r2
	push	ar5
	push	ar6
	push	ar7
	lcall	_mxWrite
	pop	ar7
	pop	ar6
	pop	ar5
	ljmp	L005012?
L005008?:
;	matrix.c:54: if (options & 0x01) mxWrite(i+1, reverse(grid[7-i]));
	mov	a,r5
	jz	L005005?
	mov	a,r7
	inc	a
	mov	r2,a
	mov	ar3,r7
	mov	r4,#0x00
	mov	a,#0x07
	clr	c
	subb	a,r3
	mov	r3,a
	clr	a
	subb	a,r4
	mov	r4,a
	mov	a,r3
	add	a,_mxDisplay_grid_1_54
	mov	r3,a
	mov	a,r4
	addc	a,(_mxDisplay_grid_1_54 + 1)
	mov	r4,a
	mov	r0,(_mxDisplay_grid_1_54 + 2)
	mov	dpl,r3
	mov	dph,r4
	mov	b,r0
	lcall	__gptrget
	mov	dpl,a
	push	ar2
	push	ar5
	push	ar6
	push	ar7
	lcall	_reverse
	mov	_mxWrite_PARM_2,dpl
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar2
	mov	dpl,r2
	push	ar5
	push	ar6
	push	ar7
	lcall	_mxWrite
	pop	ar7
	pop	ar6
	pop	ar5
	sjmp	L005012?
L005005?:
;	matrix.c:55: else mxWrite(i+1, grid[7-i]);	
	mov	a,r7
	inc	a
	mov	r2,a
	mov	ar3,r7
	mov	r4,#0x00
	mov	a,#0x07
	clr	c
	subb	a,r3
	mov	r3,a
	clr	a
	subb	a,r4
	mov	r4,a
	mov	a,r3
	add	a,_mxDisplay_grid_1_54
	mov	r3,a
	mov	a,r4
	addc	a,(_mxDisplay_grid_1_54 + 1)
	mov	r4,a
	mov	r0,(_mxDisplay_grid_1_54 + 2)
	mov	dpl,r3
	mov	dph,r4
	mov	b,r0
	lcall	__gptrget
	mov	_mxWrite_PARM_2,a
	mov	dpl,r2
	push	ar5
	push	ar6
	push	ar7
	lcall	_mxWrite
	pop	ar7
	pop	ar6
	pop	ar5
L005012?:
;	matrix.c:49: for (i = 0; i < 8; i++) {
	inc	r7
	ljmp	L005010?
;------------------------------------------------------------
;Allocation info for local variables in function 'mxWrite'
;------------------------------------------------------------
;value                     Allocated with name '_mxWrite_PARM_2'
;address                   Allocated to registers r2 
;------------------------------------------------------------
;	matrix.c:61: void mxWrite(unsigned char address, unsigned char value) {
;	-----------------------------------------
;	 function mxWrite
;	-----------------------------------------
_mxWrite:
	mov	r2,dpl
;	matrix.c:62: if ((address < 1) || (address > 8)) return;
	cjne	r2,#0x01,L006007?
L006007?:
	jc	L006001?
	mov	a,r2
	add	a,#0xff - 0x08
	jnc	L006002?
L006001?:
	ret
L006002?:
;	matrix.c:63: mxSPI(address);
	mov	dpl,r2
	lcall	_mxSPI
;	matrix.c:64: mxSPI(value);
	mov	dpl,_mxWrite_PARM_2
	lcall	_mxSPI
;	matrix.c:65: mxPulse();
	ljmp	_mxPulse
;------------------------------------------------------------
;Allocation info for local variables in function 'mxSPI'
;------------------------------------------------------------
;value                     Allocated to registers r2 
;j                         Allocated to registers r3 
;temp                      Allocated to registers r4 
;------------------------------------------------------------
;	matrix.c:69: void mxSPI(unsigned char value) {
;	-----------------------------------------
;	 function mxSPI
;	-----------------------------------------
_mxSPI:
	mov	r2,dpl
;	matrix.c:71: for (j = 0; j < 8; j++) {
	mov	r3,#0x00
L007001?:
	cjne	r3,#0x08,L007010?
L007010?:
	jnc	L007005?
;	matrix.c:72: temp = value & 0x80;
	mov	a,#0x80
	anl	a,r2
	mov	r4,a
;	matrix.c:73: LED_DATA = (temp == 0x80) ? HIGH : LOW;
	cjne	r4,#0x80,L007012?
	setb	c
	sjmp	L007013?
L007012?:
	clr	c
L007013?:
	mov	_P1_3,c
;	matrix.c:76: LED_CLK = HIGH;
	setb	_P1_2
;	matrix.c:77: Timer3us(20);
	mov	dpl,#0x14
	push	ar2
	push	ar3
	lcall	_Timer3us
	pop	ar3
	pop	ar2
;	matrix.c:78: LED_CLK = LOW;
	clr	_P1_2
;	matrix.c:81: value = value << 1;
	mov	a,r2
	add	a,r2
	mov	r2,a
;	matrix.c:71: for (j = 0; j < 8; j++) {
	inc	r3
	sjmp	L007001?
L007005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'mxSPIR'
;------------------------------------------------------------
;value                     Allocated to registers r2 
;j                         Allocated to registers r3 
;temp                      Allocated to registers r4 
;------------------------------------------------------------
;	matrix.c:86: void mxSPIR(unsigned char value) {
;	-----------------------------------------
;	 function mxSPIR
;	-----------------------------------------
_mxSPIR:
	mov	r2,dpl
;	matrix.c:88: for (j = 0; j < 8; j++) {
	mov	r3,#0x00
L008001?:
	cjne	r3,#0x08,L008010?
L008010?:
	jnc	L008005?
;	matrix.c:89: temp = value & 0x01;
	mov	a,#0x01
	anl	a,r2
	mov	r4,a
;	matrix.c:90: LED_DATA = (temp == 0x01) ? HIGH : LOW;
	cjne	r4,#0x01,L008012?
	setb	c
	sjmp	L008013?
L008012?:
	clr	c
L008013?:
	mov	_P1_3,c
;	matrix.c:93: LED_CLK = HIGH;
	setb	_P1_2
;	matrix.c:94: Timer3us(20);
	mov	dpl,#0x14
	push	ar2
	push	ar3
	lcall	_Timer3us
	pop	ar3
	pop	ar2
;	matrix.c:95: LED_CLK = LOW;
	clr	_P1_2
;	matrix.c:98: value = value >> 1;
	mov	a,r2
	clr	c
	rrc	a
	mov	r2,a
;	matrix.c:88: for (j = 0; j < 8; j++) {
	inc	r3
	sjmp	L008001?
L008005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'mxPulse'
;------------------------------------------------------------
;------------------------------------------------------------
;	matrix.c:103: void mxPulse(void) {
;	-----------------------------------------
;	 function mxPulse
;	-----------------------------------------
_mxPulse:
;	matrix.c:104: LED_CS = HIGH;
	setb	_P1_4
;	matrix.c:105: waitms(1);
	mov	dptr,#0x0001
	lcall	_waitms
;	matrix.c:106: LED_CS = LOW;
	clr	_P1_4
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'mxClear'
;------------------------------------------------------------
;j                         Allocated to registers r2 
;------------------------------------------------------------
;	matrix.c:110: void mxClear(void) {
;	-----------------------------------------
;	 function mxClear
;	-----------------------------------------
_mxClear:
;	matrix.c:112: for (j = 1; j <= 8; j++) {
	mov	r2,#0x01
L010001?:
	mov	a,r2
	add	a,#0xff - 0x08
	jc	L010005?
;	matrix.c:113: mxSPI(j);
	mov	dpl,r2
	push	ar2
	lcall	_mxSPI
;	matrix.c:114: mxSPI(0x00);
	mov	dpl,#0x00
	lcall	_mxSPI
;	matrix.c:115: mxPulse();
	lcall	_mxPulse
	pop	ar2
;	matrix.c:112: for (j = 1; j <= 8; j++) {
	inc	r2
	sjmp	L010001?
L010005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'mxIntensity'
;------------------------------------------------------------
;intensity                 Allocated to registers r2 
;------------------------------------------------------------
;	matrix.c:120: void mxIntensity(unsigned char intensity) {
;	-----------------------------------------
;	 function mxIntensity
;	-----------------------------------------
_mxIntensity:
;	matrix.c:121: if (intensity > 0x0F) return;
	mov	a,dpl
	mov	r2,a
	add	a,#0xff - 0x0F
	jnc	L011002?
	ret
L011002?:
;	matrix.c:122: mxSPI(0x0A);
	mov	dpl,#0x0A
	push	ar2
	lcall	_mxSPI
	pop	ar2
;	matrix.c:123: mxSPI(intensity);
	mov	dpl,r2
	lcall	_mxSPI
;	matrix.c:124: mxPulse();
	ljmp	_mxPulse
;------------------------------------------------------------
;Allocation info for local variables in function 'mxInit'
;------------------------------------------------------------
;------------------------------------------------------------
;	matrix.c:128: void mxInit(void) {
;	-----------------------------------------
;	 function mxInit
;	-----------------------------------------
_mxInit:
;	matrix.c:130: P1MDOUT &= 0b_1111_0001;
	anl	_P1MDOUT,#0xF1
;	matrix.c:132: LED_CS = LOW;
	clr	_P1_4
;	matrix.c:135: mxSPI(0x09);
	mov	dpl,#0x09
	lcall	_mxSPI
;	matrix.c:136: mxSPI(0x00);
	mov	dpl,#0x00
	lcall	_mxSPI
;	matrix.c:137: mxPulse();
	lcall	_mxPulse
;	matrix.c:140: mxSPI(0x0A);
	mov	dpl,#0x0A
	lcall	_mxSPI
;	matrix.c:141: mxSPI(0x01);
	mov	dpl,#0x01
	lcall	_mxSPI
;	matrix.c:142: mxPulse();
	lcall	_mxPulse
;	matrix.c:145: mxSPI(0x0b);
	mov	dpl,#0x0B
	lcall	_mxSPI
;	matrix.c:146: mxSPI(0x07);
	mov	dpl,#0x07
	lcall	_mxSPI
;	matrix.c:147: mxPulse();
	lcall	_mxPulse
;	matrix.c:150: mxClear();
	lcall	_mxClear
;	matrix.c:153: mxSPI(0x0C);
	mov	dpl,#0x0C
	lcall	_mxSPI
;	matrix.c:154: mxSPI(0x01);
	mov	dpl,#0x01
	lcall	_mxSPI
;	matrix.c:155: mxPulse();
	ljmp	_mxPulse
;------------------------------------------------------------
;Allocation info for local variables in function 'mxTest'
;------------------------------------------------------------
;------------------------------------------------------------
;	matrix.c:159: void mxTest(void) {
;	-----------------------------------------
;	 function mxTest
;	-----------------------------------------
_mxTest:
;	matrix.c:160: mxSPI(0x0F);
	mov	dpl,#0x0F
	lcall	_mxSPI
;	matrix.c:161: mxSPI(0x01);
	mov	dpl,#0x01
	lcall	_mxSPI
;	matrix.c:162: mxPulse();
	lcall	_mxPulse
;	matrix.c:163: waitms(1000);
	mov	dptr,#0x03E8
	lcall	_waitms
;	matrix.c:164: mxSPI(0x0F);
	mov	dpl,#0x0F
	lcall	_mxSPI
;	matrix.c:165: mxSPI(0x00);
	mov	dpl,#0x00
	lcall	_mxSPI
;	matrix.c:166: mxPulse();
	ljmp	_mxPulse
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST

	CSEG

end
