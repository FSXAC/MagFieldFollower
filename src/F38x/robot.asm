;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Tue Apr 04 07:09:09 2017
;--------------------------------------------------------
$name robot
$optc51 --model-small
$printf_float
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
	public _main
	public _Timer2_ISR
	public _blinkerEnabled
	public _blinkerCount
	public _distance
	public _time
	public _overflow_count
	public _currentstate
	public _currentcmd
	public _direction
	public _pwm_Right1
	public _pwm_Right0
	public _pwm_Left1
	public _pwm_Left0
	public _pwm_both
	public _mode
	public _pwm_count
	public _readData
	public _linetrack
	public _stopcar
	public _turncar
	public _uturn
	public _Sonar_Reading
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
; overlayable bit register bank
;--------------------------------------------------------
	rseg BIT_BANK
bits:
	ds 1
	b0 equ  bits.0 
	b1 equ  bits.1 
	b2 equ  bits.2 
	b3 equ  bits.3 
	b4 equ  bits.4 
	b5 equ  bits.5 
	b6 equ  bits.6 
	b7 equ  bits.7 
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_pwm_count:
	ds 1
_mode:
	ds 1
_pwm_both:
	ds 1
_pwm_Left0:
	ds 1
_pwm_Left1:
	ds 1
_pwm_Right0:
	ds 1
_pwm_Right1:
	ds 1
_direction:
	ds 1
_currentcmd:
	ds 1
_currentstate:
	ds 1
_overflow_count:
	ds 1
_time:
	ds 4
_distance:
	ds 4
_blinkerCount:
	ds 2
_blinkerEnabled:
	ds 1
_main_v1_1_74:
	ds 4
_main_v2_1_74:
	ds 4
_linetrack_vleft_1_93:
	ds 4
_linetrack_vright_1_93:
	ds 4
_linetrack_sloc0_1_0:
	ds 4
_linetrack_sloc1_1_0:
	ds 4
_turncar_v_1_99:
	ds 4
_uturn_vleft_1_109:
	ds 4
_uturn_vright_1_109:
	ds 4
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg R_OSEG
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
_Timer2_ISR_sloc0_1_0:
	DBIT	1
_main_sloc0_1_0:
	DBIT	1
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
	CSEG at 0x002b
	ljmp	_Timer2_ISR
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
;	robot.c:10: volatile char pwm_count=0;
	mov	_pwm_count,#0x00
;	robot.c:11: volatile char mode = 0;
	mov	_mode,#0x00
;	robot.c:12: volatile char pwm_both =0;
	mov	_pwm_both,#0x00
;	robot.c:13: volatile char pwm_Left0 = 0; //p1.5
	mov	_pwm_Left0,#0x00
;	robot.c:14: volatile char pwm_Left1 = 0; //p1.6
	mov	_pwm_Left1,#0x00
;	robot.c:15: volatile char pwm_Right0 = 0; //p2.0
	mov	_pwm_Right0,#0x00
;	robot.c:16: volatile char pwm_Right1 = 0; //p2.1
	mov	_pwm_Right1,#0x00
;	robot.c:17: volatile char direction = 0; // 1 for back 0 for forward
	mov	_direction,#0x00
;	robot.c:20: volatile char currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:21: volatile char currentstate = 1;
	mov	_currentstate,#0x01
;	robot.c:25: volatile float time = 0.0f;
	mov	_time,#0x00
	mov	(_time + 1),#0x00
	mov	(_time + 2),#0x00
	mov	(_time + 3),#0x00
;	robot.c:26: volatile float distance = 0.0f;
	mov	_distance,#0x00
	mov	(_distance + 1),#0x00
	mov	(_distance + 2),#0x00
	mov	(_distance + 3),#0x00
;	robot.c:29: volatile unsigned int blinkerCount = 0;
	clr	a
	mov	_blinkerCount,a
	mov	(_blinkerCount + 1),a
;	robot.c:30: unsigned char blinkerEnabled = 0;
	mov	_blinkerEnabled,#0x00
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	robot.c:33: void Timer2_ISR (void) interrupt 5 {
;	-----------------------------------------
;	 function Timer2_ISR
;	-----------------------------------------
_Timer2_ISR:
	using	0
	push	bits
	push	acc
	push	b
	push	dpl
	push	dph
	push	(0+2)
	push	(0+3)
	push	(0+4)
	push	(0+5)
	push	(0+6)
	push	(0+7)
	push	(0+0)
	push	(0+1)
	push	psw
	mov	psw,#0x00
;	robot.c:35: TF2H = 0;
	clr	_TF2H
;	robot.c:38: blinkerCount++;
	mov	a,#0x01
	add	a,_blinkerCount
	mov	_blinkerCount,a
	clr	a
	addc	a,(_blinkerCount + 1)
	mov	(_blinkerCount + 1),a
;	robot.c:39: if (!(blinkerCount%3600)) blinkerEnabled = !blinkerEnabled;
	mov	__moduint_PARM_2,#0x10
	mov	(__moduint_PARM_2 + 1),#0x0E
	mov	dpl,_blinkerCount
	mov	dph,(_blinkerCount + 1)
	lcall	__moduint
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jnz	L002002?
	mov	a,_blinkerEnabled
	cjne	a,#0x01,L002010?
L002010?:
	clr	a
	rlc	a
	mov	_blinkerEnabled,a
L002002?:
;	robot.c:42: pwm_count++;
	inc	_pwm_count
;	robot.c:43: if(pwm_count>100) pwm_count=0;
	clr	c
	mov	a,#(0x64 ^ 0x80)
	mov	b,_pwm_count
	xrl	b,#0x80
	subb	a,b
	jnc	L002004?
	mov	_pwm_count,#0x00
L002004?:
;	robot.c:46: MOTOR_LEFT0 = pwm_count > pwm_Left0 ? 0 : 1; //p1.5
	clr	c
	mov	a,_pwm_Left0
	xrl	a,#0x80
	mov	b,_pwm_count
	xrl	b,#0x80
	subb	a,b
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P1_5,c
;	robot.c:47: MOTOR_LEFT1 = pwm_count > pwm_Left1 ? 0 : 1; //p1.6
	clr	c
	mov	a,_pwm_Left1
	xrl	a,#0x80
	mov	b,_pwm_count
	xrl	b,#0x80
	subb	a,b
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P1_6,c
;	robot.c:48: MOTOR_RIGHT0 = pwm_count > pwm_Right0 ? 0 : 1; //p2.0
	clr	c
	mov	a,_pwm_Right0
	xrl	a,#0x80
	mov	b,_pwm_count
	xrl	b,#0x80
	subb	a,b
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P2_0,c
;	robot.c:49: MOTOR_RIGHT1 = pwm_count > pwm_Right1 ? 0 : 1; //p2.1
	clr	c
	mov	a,_pwm_Right1
	xrl	a,#0x80
	mov	b,_pwm_count
	xrl	b,#0x80
	subb	a,b
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P2_1,c
	pop	psw
	pop	(0+1)
	pop	(0+0)
	pop	(0+7)
	pop	(0+6)
	pop	(0+5)
	pop	(0+4)
	pop	(0+3)
	pop	(0+2)
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	pop	bits
	reti
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;v1                        Allocated with name '_main_v1_1_74'
;v2                        Allocated with name '_main_v2_1_74'
;------------------------------------------------------------
;	robot.c:53: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	robot.c:55: volatile float v1 = 0;
	mov	_main_v1_1_74,#0x00
	mov	(_main_v1_1_74 + 1),#0x00
	mov	(_main_v1_1_74 + 2),#0x00
	mov	(_main_v1_1_74 + 3),#0x00
;	robot.c:56: volatile float v2 = 0;
	mov	_main_v2_1_74,#0x00
	mov	(_main_v2_1_74 + 1),#0x00
	mov	(_main_v2_1_74 + 2),#0x00
	mov	(_main_v2_1_74 + 3),#0x00
;	robot.c:58: MOTOR_LEFT0 = 0;
	clr	_P1_5
;	robot.c:59: MOTOR_LEFT1 = 0;
	clr	_P1_6
;	robot.c:60: MOTOR_RIGHT0 = 0;
	clr	_P2_0
;	robot.c:61: MOTOR_RIGHT1 = 0;
	clr	_P2_1
;	robot.c:64: currentstate = 1;  	//1-FORWARD, 2-BACKWARDS, 3-STOPPED, 4-DEBUGGER
	mov	_currentstate,#0x01
;	robot.c:65: currentcmd = 0;		//0-NO COMMAND, 1-TURN LEFT, 2-TURN RIGHT, 3-FORWARDS, 4-BACKWARDS, 5-STOP, 6-UTURN
	mov	_currentcmd,#0x00
;	robot.c:68: InitPinADC(2, 3); // Configure P2.3 as analog input (tank1)
	mov	_InitPinADC_PARM_2,#0x03
	mov	dpl,#0x02
	lcall	_InitPinADC
;	robot.c:69: InitPinADC(2, 4); // Configure P2.4 as analog input	(tank1)
	mov	_InitPinADC_PARM_2,#0x04
	mov	dpl,#0x02
	lcall	_InitPinADC
;	robot.c:70: InitPinADC(2, 5); // Configure P2.5 as analog input (tank2)
	mov	_InitPinADC_PARM_2,#0x05
	mov	dpl,#0x02
	lcall	_InitPinADC
;	robot.c:71: InitPinADC(2, 6); // Configure P2.6 as analog input (tank2)
	mov	_InitPinADC_PARM_2,#0x06
	mov	dpl,#0x02
	lcall	_InitPinADC
;	robot.c:74: InitADC();	
	lcall	_InitADC
;	robot.c:77: mxInit();
	lcall	_mxInit
;	robot.c:80: P0MDOUT |= 0b_0000_1100;
	orl	_P0MDOUT,#0x0C
;	robot.c:81: L_BLINKER = 0;
	clr	_P0_3
;	robot.c:82: R_BLINKER = 0;
	clr	_P0_2
;	robot.c:85: while (1) {	
L003054?:
;	robot.c:88: currentcmd = readData(currentcmd); 
	mov	dpl,_currentcmd
	lcall	_readData
	mov	_currentcmd,dpl
;	robot.c:96: if (currentcmd == CMD_LEFT) mxDirection(0);
	mov	a,#0x01
	cjne	a,_currentcmd,L003014?
	mov	dpl,#0x00
	lcall	_mxDirection
	sjmp	L003015?
L003014?:
;	robot.c:97: else if (currentcmd == CMD_RIGHT) mxDirection(1);
	mov	a,#0x02
	cjne	a,_currentcmd,L003011?
	mov	dpl,#0x01
	lcall	_mxDirection
	sjmp	L003015?
L003011?:
;	robot.c:98: else if (currentcmd == CMD_STOP||currentstate == 3) mxStop();
	mov	a,#0x05
	cjne	a,_currentcmd,L003114?
	sjmp	L003006?
L003114?:
	mov	a,#0x03
	cjne	a,_currentstate,L003007?
L003006?:
	lcall	_mxStop
	sjmp	L003015?
L003007?:
;	robot.c:99: else if (currentcmd == CMD_UTURN) mxUTurn();
	mov	a,#0x06
	cjne	a,_currentcmd,L003004?
	lcall	_mxUTurn
	sjmp	L003015?
L003004?:
;	robot.c:100: else if (currentcmd == CMD_NONE) mxClear();
	mov	a,_currentcmd
	jnz	L003015?
	lcall	_mxClear
L003015?:
;	robot.c:103: Sonar_Reading();
	lcall	_Sonar_Reading
;	robot.c:104: if (distance < 7) {
	clr	a
	push	acc
	push	acc
	mov	a,#0xE0
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,_distance
	mov	dph,(_distance + 1)
	mov	b,(_distance + 2)
	mov	a,(_distance + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L003020?
;	robot.c:105: stopcar();
	lcall	_stopcar
;	robot.c:106: while (distance < 7) {
L003016?:
	clr	a
	push	acc
	push	acc
	mov	a,#0xE0
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,_distance
	mov	dph,(_distance + 1)
	mov	b,(_distance + 2)
	mov	a,(_distance + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L003020?
;	robot.c:107: Sonar_Reading();
	lcall	_Sonar_Reading
;	robot.c:108: mxStop();
	lcall	_mxStop
	sjmp	L003016?
L003020?:
;	robot.c:113: L_BLINKER = (blinkerEnabled && (currentcmd == CMD_LEFT ||currentstate == 3));
	mov	a,_blinkerEnabled
	jz	L003058?
	mov	a,#0x01
	cjne	a,_currentcmd,L003123?
	sjmp	L003062?
L003123?:
	mov	a,#0x03
	cjne	a,_currentstate,L003124?
	sjmp	L003062?
L003124?:
	clr	_main_sloc0_1_0
	sjmp	L003063?
L003062?:
	setb	_main_sloc0_1_0
L003063?:
	jb	_main_sloc0_1_0,L003059?
L003058?:
	clr	_main_sloc0_1_0
	sjmp	L003060?
L003059?:
	setb	_main_sloc0_1_0
L003060?:
	mov	c,_main_sloc0_1_0
	mov	_P0_3,c
;	robot.c:114: R_BLINKER = (blinkerEnabled && (currentcmd == CMD_RIGHT||currentstate == 3)); 
	mov	a,_blinkerEnabled
	jz	L003064?
	mov	a,#0x02
	cjne	a,_currentcmd,L003127?
	sjmp	L003068?
L003127?:
	mov	a,#0x03
	cjne	a,_currentstate,L003128?
	sjmp	L003068?
L003128?:
	clr	_main_sloc0_1_0
	sjmp	L003069?
L003068?:
	setb	_main_sloc0_1_0
L003069?:
	jb	_main_sloc0_1_0,L003065?
L003064?:
	clr	_main_sloc0_1_0
	sjmp	L003066?
L003065?:
	setb	_main_sloc0_1_0
L003066?:
	mov	c,_main_sloc0_1_0
	mov	_P0_2,c
;	robot.c:117: switch (currentstate) {
	mov	r2,_currentstate
	cjne	r2,#0x01,L003130?
	sjmp	L003021?
L003130?:
	cjne	r2,#0x02,L003131?
	sjmp	L003022?
L003131?:
;	robot.c:118: case FORWARD_STATE:
	cjne	r2,#0x03,L003024?
	sjmp	L003023?
L003021?:
;	robot.c:119: linetrack(0);	// forwards
	mov	dptr,#0x0000
	lcall	_linetrack
;	robot.c:121: v1 = Volts_at_Pin(TANK_FL);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	_main_v1_1_74,dpl
	mov	(_main_v1_1_74 + 1),dph
	mov	(_main_v1_1_74 + 2),b
	mov	(_main_v1_1_74 + 3),a
;	robot.c:122: v2 = Volts_at_Pin(TANK_FR);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_main_v2_1_74,dpl
	mov	(_main_v2_1_74 + 1),dph
	mov	(_main_v2_1_74 + 2),b
	mov	(_main_v2_1_74 + 3),a
;	robot.c:123: break;
;	robot.c:124: case REVERSE_STATE:
	sjmp	L003024?
L003022?:
;	robot.c:125: linetrack(1);	// backwards
	mov	dptr,#0x0001
	lcall	_linetrack
;	robot.c:127: v2 = Volts_at_Pin(TANK_RL);
	mov	dpl,#0x0D
	lcall	_Volts_at_Pin
	mov	_main_v2_1_74,dpl
	mov	(_main_v2_1_74 + 1),dph
	mov	(_main_v2_1_74 + 2),b
	mov	(_main_v2_1_74 + 3),a
;	robot.c:128: v1 = Volts_at_Pin(TANK_RR);
	mov	dpl,#0x0E
	lcall	_Volts_at_Pin
	mov	_main_v1_1_74,dpl
	mov	(_main_v1_1_74 + 1),dph
	mov	(_main_v1_1_74 + 2),b
	mov	(_main_v1_1_74 + 3),a
;	robot.c:129: break;
;	robot.c:130: case STOP_STATE:
	sjmp	L003024?
L003023?:
;	robot.c:131: stopcar();		// stop car
	lcall	_stopcar
;	robot.c:132: mxStop();
	lcall	_mxStop
;	robot.c:134: }
L003024?:
;	robot.c:137: switch (currentcmd) {
	mov	a,_currentcmd
	mov	r2,a
	jnb	acc.7,L003133?
	ljmp	L003051?
L003133?:
	clr	c
	mov	a,#(0x06 ^ 0x80)
	mov	b,r2
	xrl	b,#0x80
	subb	a,b
	jnc	L003134?
	ljmp	L003051?
L003134?:
	mov	a,r2
	add	a,r2
	add	a,r2
	mov	dptr,#L003135?
	jmp	@a+dptr
L003135?:
	ljmp	L003025?
	ljmp	L003039?
	ljmp	L003043?
	ljmp	L003047?
	ljmp	L003048?
	ljmp	L003049?
	ljmp	L003050?
;	robot.c:139: case CMD_NONE:
L003025?:
;	robot.c:141: if ((currentstate-1) ? 
	mov	r2,_currentstate
	mov	a,_currentstate
	rlc	a
	subb	a,acc
	mov	r3,a
	dec	r2
	cjne	r2,#0xff,L003136?
	dec	r3
L003136?:
	mov	a,r2
	orl	a,r3
	jz	L003070?
;	robot.c:142: (v1 > 1.2 && v2 > 1.2) :
	mov	a,#0x9A
	push	acc
	mov	a,#0x99
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v1_1_74
	mov	dph,(_main_v1_1_74 + 1)
	mov	b,(_main_v1_1_74 + 2)
	mov	a,(_main_v1_1_74 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L003072?
	mov	a,#0x9A
	push	acc
	mov	a,#0x99
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v2_1_74
	mov	dph,(_main_v2_1_74 + 1)
	mov	b,(_main_v2_1_74 + 2)
	mov	a,(_main_v2_1_74 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L003073?
L003072?:
	mov	r2,#0x00
	sjmp	L003074?
L003073?:
	mov	r2,#0x01
L003074?:
	mov	a,r2
	add	a,#0xff
	mov	_main_sloc0_1_0,c
	sjmp	L003071?
L003070?:
;	robot.c:143: (v1 > 0.7 && v2 > 1)) {
	mov	a,#0x33
	push	acc
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v1_1_74
	mov	dph,(_main_v1_1_74 + 1)
	mov	b,(_main_v1_1_74 + 2)
	mov	a,(_main_v1_1_74 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L003075?
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v2_1_74
	mov	dph,(_main_v2_1_74 + 1)
	mov	b,(_main_v2_1_74 + 2)
	mov	a,(_main_v2_1_74 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L003076?
L003075?:
	mov	r2,#0x00
	sjmp	L003077?
L003076?:
	mov	r2,#0x01
L003077?:
	mov	a,r2
	add	a,#0xff
	mov	_main_sloc0_1_0,c
L003071?:
	jb	_main_sloc0_1_0,L003142?
	ljmp	L003054?
L003142?:
;	robot.c:146: if (currentstate == 1) {
	mov	a,#0x01
	cjne	a,_currentstate,L003035?
;	robot.c:147: if (Volts_at_Pin(TANK_RL)>Volts_at_Pin(TANK_RR)) {
	mov	dpl,#0x0D
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	dpl,#0x0E
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_Volts_at_Pin
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L003027?
;	robot.c:148: pwm_Left1 = 50;
	mov	_pwm_Left1,#0x32
;	robot.c:149: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:150: pwm_Right0 = 30;
	mov	_pwm_Right0,#0x1E
;	robot.c:151: pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
	sjmp	L003036?
L003027?:
;	robot.c:154: pwm_Left1 = 30;
	mov	_pwm_Left1,#0x1E
;	robot.c:155: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:156: pwm_Right0 = 50;
	mov	_pwm_Right0,#0x32
;	robot.c:157: pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
	sjmp	L003036?
L003035?:
;	robot.c:159: } else if (currentstate == 2) {
	mov	a,#0x02
	cjne	a,_currentstate,L003036?
;	robot.c:160: if (Volts_at_Pin(TANK_FL)>Volts_at_Pin(TANK_FR)) {
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	dpl,#0x0C
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_Volts_at_Pin
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L003030?
;	robot.c:161: pwm_Left0 = 50;
	mov	_pwm_Left0,#0x32
;	robot.c:162: pwm_Left1 = -1;
	mov	_pwm_Left1,#0xFF
;	robot.c:163: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
;	robot.c:164: pwm_Right1 = 30;
	mov	_pwm_Right1,#0x1E
	sjmp	L003036?
L003030?:
;	robot.c:167: pwm_Left0 = 30;
	mov	_pwm_Left0,#0x1E
;	robot.c:168: pwm_Left1 = -1;
	mov	_pwm_Left1,#0xFF
;	robot.c:169: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
;	robot.c:170: pwm_Right1 = 50;
	mov	_pwm_Right1,#0x32
L003036?:
;	robot.c:174: waitms(1500);
	mov	dptr,#0x05DC
	lcall	_waitms
;	robot.c:177: break;
	ljmp	L003054?
;	robot.c:179: case CMD_LEFT:
L003039?:
;	robot.c:182: if (v1 > 0.7 && v2 >1)  {
	mov	a,#0x33
	push	acc
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v1_1_74
	mov	dph,(_main_v1_1_74 + 1)
	mov	b,(_main_v1_1_74 + 2)
	mov	a,(_main_v1_1_74 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L003149?
	ljmp	L003054?
L003149?:
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v2_1_74
	mov	dph,(_main_v2_1_74 + 1)
	mov	b,(_main_v2_1_74 + 2)
	mov	a,(_main_v2_1_74 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L003150?
	ljmp	L003054?
L003150?:
;	robot.c:186: turncar(currentstate);
	mov	r2,_currentstate
	mov	a,_currentstate
	rlc	a
	subb	a,acc
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	lcall	_turncar
;	robot.c:187: currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:189: break;
	ljmp	L003054?
;	robot.c:192: case CMD_RIGHT:
L003043?:
;	robot.c:195: if (v1 > 0.7 && v2 >1) {
	mov	a,#0x33
	push	acc
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v1_1_74
	mov	dph,(_main_v1_1_74 + 1)
	mov	b,(_main_v1_1_74 + 2)
	mov	a,(_main_v1_1_74 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L003151?
	ljmp	L003054?
L003151?:
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v2_1_74
	mov	dph,(_main_v2_1_74 + 1)
	mov	b,(_main_v2_1_74 + 2)
	mov	a,(_main_v2_1_74 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L003152?
	ljmp	L003054?
L003152?:
;	robot.c:198: turncar(currentstate + 2); //1 = right
	mov	r2,_currentstate
	mov	a,_currentstate
	rlc	a
	subb	a,acc
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	inc	dptr
	inc	dptr
	lcall	_turncar
;	robot.c:199: currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:201: break;
	ljmp	L003054?
;	robot.c:204: case CMD_FORWARD:
L003047?:
;	robot.c:207: currentstate = 1;
	mov	_currentstate,#0x01
;	robot.c:208: currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:209: break;
	ljmp	L003054?
;	robot.c:212: case CMD_REVERSE:
L003048?:
;	robot.c:215: currentstate = 2;
	mov	_currentstate,#0x02
;	robot.c:216: currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:217: break;
	ljmp	L003054?
;	robot.c:220: case CMD_STOP:
L003049?:
;	robot.c:223: currentstate = 3;
	mov	_currentstate,#0x03
;	robot.c:224: currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:225: break;
	ljmp	L003054?
;	robot.c:228: case CMD_UTURN:
L003050?:
;	robot.c:229: mxUTurn();
	lcall	_mxUTurn
;	robot.c:230: uturn();
	lcall	_uturn
;	robot.c:232: currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:233: mxInit(); 
	lcall	_mxInit
;	robot.c:234: break;
	ljmp	L003054?
;	robot.c:237: default: 
L003051?:
;	robot.c:238: currentstate = 1;
	mov	_currentstate,#0x01
;	robot.c:239: }
	ljmp	L003054?
;------------------------------------------------------------
;Allocation info for local variables in function 'readData'
;------------------------------------------------------------
;prevcommand               Allocated to registers r2 
;command                   Allocated to registers r3 
;------------------------------------------------------------
;	robot.c:243: unsigned char readData(unsigned char prevcommand) {
;	-----------------------------------------
;	 function readData
;	-----------------------------------------
_readData:
	mov	r2,dpl
;	robot.c:244: unsigned char command = prevcommand;
	mov	ar3,r2
;	robot.c:245: if (!COMMAND_PIN) {
	jb	_P1_1,L004010?
;	robot.c:247: while (!COMMAND_PIN);
L004001?:
	jnb	_P1_1,L004001?
;	robot.c:248: waitms((int)(CMDFRQ + CMDFRQ/2));
	mov	dptr,#0x0060
	push	ar2
	lcall	_waitms
;	robot.c:249: command |= COMMAND_PIN<<2;
	mov	c,_P1_1
	clr	a
	rlc	a
	add	a,acc
	add	a,acc
	mov	r3,a
;	robot.c:250: waitms(CMDFRQ);
	mov	dptr,#0x0040
	push	ar3
	lcall	_waitms
	pop	ar3
;	robot.c:251: command |= COMMAND_PIN<<1;
	mov	c,_P1_1
	clr	a
	rlc	a
	add	a,acc
	orl	ar3,a
;	robot.c:252: waitms(CMDFRQ);
	mov	dptr,#0x0040
	push	ar3
	lcall	_waitms
	pop	ar3
	pop	ar2
;	robot.c:253: command |= COMMAND_PIN;
	mov	c,_P1_1
	clr	a
	rlc	a
	mov	r4,a
	orl	ar3,a
;	robot.c:254: while (!COMMAND_PIN);
L004004?:
	jnb	_P1_1,L004004?
;	robot.c:255: if (command > 6) command = prevcommand; 
	mov	a,r3
	add	a,#0xff - 0x06
	jnc	L004010?
	mov	ar3,r2
L004010?:
;	robot.c:258: return command;
	mov	dpl,r3
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'linetrack'
;------------------------------------------------------------
;forwardbackward           Allocated to registers r2 r3 
;vleft                     Allocated with name '_linetrack_vleft_1_93'
;vright                    Allocated with name '_linetrack_vright_1_93'
;sloc0                     Allocated with name '_linetrack_sloc0_1_0'
;sloc1                     Allocated with name '_linetrack_sloc1_1_0'
;------------------------------------------------------------
;	robot.c:265: void linetrack (int forwardbackward) {
;	-----------------------------------------
;	 function linetrack
;	-----------------------------------------
_linetrack:
	mov	r2,dpl
	mov	r3,dph
;	robot.c:273: if (forwardbackward == 0) {
	mov	a,r2
	orl	a,r3
	jz	L005010?
	ljmp	L005004?
L005010?:
;	robot.c:274: vleft=Volts_at_Pin(TANK_FL);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	_linetrack_vleft_1_93,dpl
	mov	(_linetrack_vleft_1_93 + 1),dph
	mov	(_linetrack_vleft_1_93 + 2),b
	mov	(_linetrack_vleft_1_93 + 3),a
;	robot.c:275: vright=Volts_at_Pin(TANK_FR);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_linetrack_vright_1_93,dpl
	mov	(_linetrack_vright_1_93 + 1),dph
	mov	(_linetrack_vright_1_93 + 2),b
	mov	(_linetrack_vright_1_93 + 3),a
;	robot.c:278: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:279: pwm_Left1 = vright*vright*75/(vright*vright+vleft*vleft);
	push	_linetrack_vright_1_93
	push	(_linetrack_vright_1_93 + 1)
	push	(_linetrack_vright_1_93 + 2)
	push	(_linetrack_vright_1_93 + 3)
	mov	dpl,_linetrack_vright_1_93
	mov	dph,(_linetrack_vright_1_93 + 1)
	mov	b,(_linetrack_vright_1_93 + 2)
	mov	a,(_linetrack_vright_1_93 + 3)
	lcall	___fsmul
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#0x0000
	mov	b,#0x96
	mov	a,#0x42
	lcall	___fsmul
	mov	_linetrack_sloc0_1_0,dpl
	mov	(_linetrack_sloc0_1_0 + 1),dph
	mov	(_linetrack_sloc0_1_0 + 2),b
	mov	(_linetrack_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_linetrack_vright_1_93
	push	(_linetrack_vright_1_93 + 1)
	push	(_linetrack_vright_1_93 + 2)
	push	(_linetrack_vright_1_93 + 3)
	mov	dpl,_linetrack_vright_1_93
	mov	dph,(_linetrack_vright_1_93 + 1)
	mov	b,(_linetrack_vright_1_93 + 2)
	mov	a,(_linetrack_vright_1_93 + 3)
	lcall	___fsmul
	mov	_linetrack_sloc1_1_0,dpl
	mov	(_linetrack_sloc1_1_0 + 1),dph
	mov	(_linetrack_sloc1_1_0 + 2),b
	mov	(_linetrack_sloc1_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_linetrack_vleft_1_93
	push	(_linetrack_vleft_1_93 + 1)
	push	(_linetrack_vleft_1_93 + 2)
	push	(_linetrack_vleft_1_93 + 3)
	mov	dpl,_linetrack_vleft_1_93
	mov	dph,(_linetrack_vleft_1_93 + 1)
	mov	b,(_linetrack_vleft_1_93 + 2)
	mov	a,(_linetrack_vleft_1_93 + 3)
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar6
	push	ar7
	push	ar4
	push	ar5
	mov	dpl,_linetrack_sloc1_1_0
	mov	dph,(_linetrack_sloc1_1_0 + 1)
	mov	b,(_linetrack_sloc1_1_0 + 2)
	mov	a,(_linetrack_sloc1_1_0 + 3)
	lcall	___fsadd
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,_linetrack_sloc0_1_0
	mov	dph,(_linetrack_sloc0_1_0 + 1)
	mov	b,(_linetrack_sloc0_1_0 + 2)
	mov	a,(_linetrack_sloc0_1_0 + 3)
	lcall	___fsdiv
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fs2schar
	mov	_pwm_Left1,dpl
;	robot.c:280: pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
;	robot.c:281: pwm_Right0 = vleft*vleft*75/(vright*vright+vleft*vleft);
	push	_linetrack_vleft_1_93
	push	(_linetrack_vleft_1_93 + 1)
	push	(_linetrack_vleft_1_93 + 2)
	push	(_linetrack_vleft_1_93 + 3)
	mov	dpl,_linetrack_vleft_1_93
	mov	dph,(_linetrack_vleft_1_93 + 1)
	mov	b,(_linetrack_vleft_1_93 + 2)
	mov	a,(_linetrack_vleft_1_93 + 3)
	lcall	___fsmul
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#0x0000
	mov	b,#0x96
	mov	a,#0x42
	lcall	___fsmul
	mov	_linetrack_sloc1_1_0,dpl
	mov	(_linetrack_sloc1_1_0 + 1),dph
	mov	(_linetrack_sloc1_1_0 + 2),b
	mov	(_linetrack_sloc1_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_linetrack_vright_1_93
	push	(_linetrack_vright_1_93 + 1)
	push	(_linetrack_vright_1_93 + 2)
	push	(_linetrack_vright_1_93 + 3)
	mov	dpl,_linetrack_vright_1_93
	mov	dph,(_linetrack_vright_1_93 + 1)
	mov	b,(_linetrack_vright_1_93 + 2)
	mov	a,(_linetrack_vright_1_93 + 3)
	lcall	___fsmul
	mov	_linetrack_sloc0_1_0,dpl
	mov	(_linetrack_sloc0_1_0 + 1),dph
	mov	(_linetrack_sloc0_1_0 + 2),b
	mov	(_linetrack_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_linetrack_vleft_1_93
	push	(_linetrack_vleft_1_93 + 1)
	push	(_linetrack_vleft_1_93 + 2)
	push	(_linetrack_vleft_1_93 + 3)
	mov	dpl,_linetrack_vleft_1_93
	mov	dph,(_linetrack_vleft_1_93 + 1)
	mov	b,(_linetrack_vleft_1_93 + 2)
	mov	a,(_linetrack_vleft_1_93 + 3)
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar6
	push	ar7
	push	ar4
	push	ar5
	mov	dpl,_linetrack_sloc0_1_0
	mov	dph,(_linetrack_sloc0_1_0 + 1)
	mov	b,(_linetrack_sloc0_1_0 + 2)
	mov	a,(_linetrack_sloc0_1_0 + 3)
	lcall	___fsadd
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,_linetrack_sloc1_1_0
	mov	dph,(_linetrack_sloc1_1_0 + 1)
	mov	b,(_linetrack_sloc1_1_0 + 2)
	mov	a,(_linetrack_sloc1_1_0 + 3)
	lcall	___fsdiv
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fs2schar
	mov	_pwm_Right0,dpl
	ret
L005004?:
;	robot.c:282: } else if (forwardbackward == 1) {
	cjne	r2,#0x01,L005011?
	cjne	r3,#0x00,L005011?
	sjmp	L005012?
L005011?:
	ret
L005012?:
;	robot.c:285: vleft=Volts_at_Pin(TANK_RL);
	mov	dpl,#0x0D
	lcall	_Volts_at_Pin
	mov	_linetrack_vleft_1_93,dpl
	mov	(_linetrack_vleft_1_93 + 1),dph
	mov	(_linetrack_vleft_1_93 + 2),b
	mov	(_linetrack_vleft_1_93 + 3),a
;	robot.c:286: vright=Volts_at_Pin(TANK_RR);
	mov	dpl,#0x0E
	lcall	_Volts_at_Pin
	mov	_linetrack_vright_1_93,dpl
	mov	(_linetrack_vright_1_93 + 1),dph
	mov	(_linetrack_vright_1_93 + 2),b
	mov	(_linetrack_vright_1_93 + 3),a
;	robot.c:289: pwm_Left1 = -1;
	mov	_pwm_Left1,#0xFF
;	robot.c:290: pwm_Left0 = vright*vright*75/(vright*vright+vleft*vleft);
	push	_linetrack_vright_1_93
	push	(_linetrack_vright_1_93 + 1)
	push	(_linetrack_vright_1_93 + 2)
	push	(_linetrack_vright_1_93 + 3)
	mov	dpl,_linetrack_vright_1_93
	mov	dph,(_linetrack_vright_1_93 + 1)
	mov	b,(_linetrack_vright_1_93 + 2)
	mov	a,(_linetrack_vright_1_93 + 3)
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x96
	mov	a,#0x42
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	_linetrack_vright_1_93
	push	(_linetrack_vright_1_93 + 1)
	push	(_linetrack_vright_1_93 + 2)
	push	(_linetrack_vright_1_93 + 3)
	mov	dpl,_linetrack_vright_1_93
	mov	dph,(_linetrack_vright_1_93 + 1)
	mov	b,(_linetrack_vright_1_93 + 2)
	mov	a,(_linetrack_vright_1_93 + 3)
	lcall	___fsmul
	mov	_linetrack_sloc1_1_0,dpl
	mov	(_linetrack_sloc1_1_0 + 1),dph
	mov	(_linetrack_sloc1_1_0 + 2),b
	mov	(_linetrack_sloc1_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_linetrack_vleft_1_93
	push	(_linetrack_vleft_1_93 + 1)
	push	(_linetrack_vleft_1_93 + 2)
	push	(_linetrack_vleft_1_93 + 3)
	mov	dpl,_linetrack_vleft_1_93
	mov	dph,(_linetrack_vleft_1_93 + 1)
	mov	b,(_linetrack_vleft_1_93 + 2)
	mov	a,(_linetrack_vleft_1_93 + 3)
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,_linetrack_sloc1_1_0
	mov	dph,(_linetrack_sloc1_1_0 + 1)
	mov	b,(_linetrack_sloc1_1_0 + 2)
	mov	a,(_linetrack_sloc1_1_0 + 3)
	lcall	___fsadd
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fs2schar
	mov	_pwm_Left0,dpl
;	robot.c:291: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
;	robot.c:292: pwm_Right1 = vleft*vleft*75/(vright*vright+vleft*vleft);
	push	_linetrack_vleft_1_93
	push	(_linetrack_vleft_1_93 + 1)
	push	(_linetrack_vleft_1_93 + 2)
	push	(_linetrack_vleft_1_93 + 3)
	mov	dpl,_linetrack_vleft_1_93
	mov	dph,(_linetrack_vleft_1_93 + 1)
	mov	b,(_linetrack_vleft_1_93 + 2)
	mov	a,(_linetrack_vleft_1_93 + 3)
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x96
	mov	a,#0x42
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	_linetrack_vright_1_93
	push	(_linetrack_vright_1_93 + 1)
	push	(_linetrack_vright_1_93 + 2)
	push	(_linetrack_vright_1_93 + 3)
	mov	dpl,_linetrack_vright_1_93
	mov	dph,(_linetrack_vright_1_93 + 1)
	mov	b,(_linetrack_vright_1_93 + 2)
	mov	a,(_linetrack_vright_1_93 + 3)
	lcall	___fsmul
	mov	_linetrack_sloc1_1_0,dpl
	mov	(_linetrack_sloc1_1_0 + 1),dph
	mov	(_linetrack_sloc1_1_0 + 2),b
	mov	(_linetrack_sloc1_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_linetrack_vleft_1_93
	push	(_linetrack_vleft_1_93 + 1)
	push	(_linetrack_vleft_1_93 + 2)
	push	(_linetrack_vleft_1_93 + 3)
	mov	dpl,_linetrack_vleft_1_93
	mov	dph,(_linetrack_vleft_1_93 + 1)
	mov	b,(_linetrack_vleft_1_93 + 2)
	mov	a,(_linetrack_vleft_1_93 + 3)
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,_linetrack_sloc1_1_0
	mov	dph,(_linetrack_sloc1_1_0 + 1)
	mov	b,(_linetrack_sloc1_1_0 + 2)
	mov	a,(_linetrack_sloc1_1_0 + 3)
	lcall	___fsadd
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fs2schar
	mov	_pwm_Right1,dpl
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'stopcar'
;------------------------------------------------------------
;------------------------------------------------------------
;	robot.c:300: void stopcar(void) {
;	-----------------------------------------
;	 function stopcar
;	-----------------------------------------
_stopcar:
;	robot.c:302: pwm_Left1 = -1;
	mov	_pwm_Left1,#0xFF
;	robot.c:303: pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
;	robot.c:304: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:305: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'turncar'
;------------------------------------------------------------
;leftright                 Allocated to registers r2 r3 
;v                         Allocated with name '_turncar_v_1_99'
;------------------------------------------------------------
;	robot.c:311: void turncar (int leftright) {
;	-----------------------------------------
;	 function turncar
;	-----------------------------------------
_turncar:
	mov	r2,dpl
	mov	r3,dph
;	robot.c:323: stopcar();
	push	ar2
	push	ar3
	lcall	_stopcar
	pop	ar3
	pop	ar2
;	robot.c:326: if (leftright == 1) {
	cjne	r2,#0x01,L007022?
	cjne	r3,#0x00,L007022?
;	robot.c:328: pwm_Right0 = 100;
	mov	_pwm_Right0,#0x64
;	robot.c:330: waitms(750);	
	mov	dptr,#0x02EE
	lcall	_waitms
;	robot.c:333: v = Volts_at_Pin(TANK_RR);
	mov	dpl,#0x0E
	lcall	_Volts_at_Pin
	mov	_turncar_v_1_99,dpl
	mov	(_turncar_v_1_99 + 1),dph
	mov	(_turncar_v_1_99 + 2),b
	mov	(_turncar_v_1_99 + 3),a
;	robot.c:335: while (v < 1) {
L007001?:
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_turncar_v_1_99
	mov	dph,(_turncar_v_1_99 + 1)
	mov	b,(_turncar_v_1_99 + 2)
	mov	a,(_turncar_v_1_99 + 3)
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r4
	jz	L007003?
;	robot.c:337: v = Volts_at_Pin(TANK_RR);
	mov	dpl,#0x0E
	lcall	_Volts_at_Pin
	mov	_turncar_v_1_99,dpl
	mov	(_turncar_v_1_99 + 1),dph
	mov	(_turncar_v_1_99 + 2),b
	mov	(_turncar_v_1_99 + 3),a
	sjmp	L007001?
L007003?:
;	robot.c:342: waitms(300);
	mov	dptr,#0x012C
	lcall	_waitms
;	robot.c:345: pwm_Right0 = -1; 
	mov	_pwm_Right0,#0xFF
	ret
L007022?:
;	robot.c:349: else if (leftright == 3) {
	cjne	r2,#0x03,L007019?
	cjne	r3,#0x00,L007019?
;	robot.c:351: pwm_Left1 = 75;
	mov	_pwm_Left1,#0x4B
;	robot.c:352: waitms(750);
	mov	dptr,#0x02EE
	lcall	_waitms
;	robot.c:355: v = Volts_at_Pin(TANK_RL);
	mov	dpl,#0x0D
	lcall	_Volts_at_Pin
	mov	_turncar_v_1_99,dpl
	mov	(_turncar_v_1_99 + 1),dph
	mov	(_turncar_v_1_99 + 2),b
	mov	(_turncar_v_1_99 + 3),a
;	robot.c:357: while (v < 0.7) {
L007004?:
	mov	a,#0x33
	push	acc
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_turncar_v_1_99
	mov	dph,(_turncar_v_1_99 + 1)
	mov	b,(_turncar_v_1_99 + 2)
	mov	a,(_turncar_v_1_99 + 3)
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r4
	jz	L007006?
;	robot.c:359: v = Volts_at_Pin(TANK_RL);
	mov	dpl,#0x0D
	lcall	_Volts_at_Pin
	mov	_turncar_v_1_99,dpl
	mov	(_turncar_v_1_99 + 1),dph
	mov	(_turncar_v_1_99 + 2),b
	mov	(_turncar_v_1_99 + 3),a
	sjmp	L007004?
L007006?:
;	robot.c:363: waitms(300);
	mov	dptr,#0x012C
	lcall	_waitms
;	robot.c:366: pwm_Left1 = -1; 
	mov	_pwm_Left1,#0xFF
	ret
L007019?:
;	robot.c:370: else if (leftright == 2) {
	cjne	r2,#0x02,L007016?
	cjne	r3,#0x00,L007016?
;	robot.c:372: pwm_Right1 = 75;
	mov	_pwm_Right1,#0x4B
;	robot.c:373: pwm_Left0 = 75;
	mov	_pwm_Left0,#0x4B
;	robot.c:375: waitms(250);
	mov	dptr,#0x00FA
	lcall	_waitms
;	robot.c:376: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:379: waitms(1000);
	mov	dptr,#0x03E8
	lcall	_waitms
;	robot.c:381: v = Volts_at_Pin(TANK_RR);
	mov	dpl,#0x0E
	lcall	_Volts_at_Pin
	mov	_turncar_v_1_99,dpl
	mov	(_turncar_v_1_99 + 1),dph
	mov	(_turncar_v_1_99 + 2),b
	mov	(_turncar_v_1_99 + 3),a
;	robot.c:383: while (v < 0.7) {
L007007?:
	mov	a,#0x33
	push	acc
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_turncar_v_1_99
	mov	dph,(_turncar_v_1_99 + 1)
	mov	b,(_turncar_v_1_99 + 2)
	mov	a,(_turncar_v_1_99 + 3)
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r4
	jz	L007009?
;	robot.c:385: v = Volts_at_Pin(TANK_RR);
	mov	dpl,#0x0E
	lcall	_Volts_at_Pin
	mov	_turncar_v_1_99,dpl
	mov	(_turncar_v_1_99 + 1),dph
	mov	(_turncar_v_1_99 + 2),b
	mov	(_turncar_v_1_99 + 3),a
	sjmp	L007007?
L007009?:
;	robot.c:390: pwm_Right1 = -1; 
	mov	_pwm_Right1,#0xFF
	ret
L007016?:
;	robot.c:394: else if (leftright == 4) {
	cjne	r2,#0x04,L007024?
	cjne	r3,#0x00,L007024?
;	robot.c:396: pwm_Left0 = 75;
	mov	_pwm_Left0,#0x4B
;	robot.c:398: pwm_Right1 = 75;
	mov	_pwm_Right1,#0x4B
;	robot.c:400: waitms(250);
	mov	dptr,#0x00FA
	lcall	_waitms
;	robot.c:402: pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
;	robot.c:404: waitms(1000);
	mov	dptr,#0x03E8
	lcall	_waitms
;	robot.c:407: v = Volts_at_Pin(TANK_RL);
	mov	dpl,#0x0D
	lcall	_Volts_at_Pin
	mov	_turncar_v_1_99,dpl
	mov	(_turncar_v_1_99 + 1),dph
	mov	(_turncar_v_1_99 + 2),b
	mov	(_turncar_v_1_99 + 3),a
;	robot.c:409: while (v < 0.7) {
L007010?:
	mov	a,#0x33
	push	acc
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_turncar_v_1_99
	mov	dph,(_turncar_v_1_99 + 1)
	mov	b,(_turncar_v_1_99 + 2)
	mov	a,(_turncar_v_1_99 + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L007012?
;	robot.c:411: v = Volts_at_Pin(TANK_RL);
	mov	dpl,#0x0D
	lcall	_Volts_at_Pin
	mov	_turncar_v_1_99,dpl
	mov	(_turncar_v_1_99 + 1),dph
	mov	(_turncar_v_1_99 + 2),b
	mov	(_turncar_v_1_99 + 3),a
	sjmp	L007010?
L007012?:
;	robot.c:416: pwm_Left0 = -1; 
	mov	_pwm_Left0,#0xFF
L007024?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uturn'
;------------------------------------------------------------
;vleft                     Allocated with name '_uturn_vleft_1_109'
;vright                    Allocated with name '_uturn_vright_1_109'
;------------------------------------------------------------
;	robot.c:423: void uturn(void) {
;	-----------------------------------------
;	 function uturn
;	-----------------------------------------
_uturn:
;	robot.c:427: vleft = Volts_at_Pin(TANK_FL);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	_uturn_vleft_1_109,dpl
	mov	(_uturn_vleft_1_109 + 1),dph
	mov	(_uturn_vleft_1_109 + 2),b
	mov	(_uturn_vleft_1_109 + 3),a
;	robot.c:428: vright = Volts_at_Pin(TANK_FR);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_uturn_vright_1_109,dpl
	mov	(_uturn_vright_1_109 + 1),dph
	mov	(_uturn_vright_1_109 + 2),b
	mov	(_uturn_vright_1_109 + 3),a
;	robot.c:431: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:432: pwm_Left1 = 50;
	mov	_pwm_Left1,#0x32
;	robot.c:433: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
;	robot.c:434: pwm_Right1 = 50;
	mov	_pwm_Right1,#0x32
;	robot.c:437: waitms(2000);
	mov	dptr,#0x07D0
	lcall	_waitms
;	robot.c:439: while ((Volts_at_Pin(TANK_FL)-Volts_at_Pin(TANK_FR))<-0.3 || (Volts_at_Pin(TANK_FL)-Volts_at_Pin(TANK_FR))>0.3);
L008002?:
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	dpl,#0x0C
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_Volts_at_Pin
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fssub
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0x9A
	push	acc
	mov	a,#0x99
	push	acc
	push	acc
	mov	a,#0xBE
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L008002?
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	dpl,#0x0C
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_Volts_at_Pin
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fssub
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0x9A
	push	acc
	mov	a,#0x99
	push	acc
	push	acc
	mov	a,#0x3E
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L008010?
	ljmp	L008002?
L008010?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Sonar_Reading'
;------------------------------------------------------------
;------------------------------------------------------------
;	robot.c:444: void Sonar_Reading(void) {
;	-----------------------------------------
;	 function Sonar_Reading
;	-----------------------------------------
_Sonar_Reading:
;	robot.c:446: TL0=0; 
	mov	_TL0,#0x00
;	robot.c:447: TH0=0;
	mov	_TH0,#0x00
;	robot.c:448: TF0=0;
	clr	_TF0
;	robot.c:449: overflow_count=0;
	mov	_overflow_count,#0x00
;	robot.c:452: Trigger = 0; 
	clr	_P0_6
;	robot.c:453: Timer3us(2);
	mov	dpl,#0x02
	lcall	_Timer3us
;	robot.c:454: Trigger = 1; // turn on trig
	setb	_P0_6
;	robot.c:455: Timer3us(10);//10us delay 
	mov	dpl,#0x0A
	lcall	_Timer3us
;	robot.c:456: Trigger = 0; // trun off trig 
	clr	_P0_6
;	robot.c:457: while(Echo!=0); // Wait for the signal to be zero
L009001?:
	jb	_P0_1,L009001?
;	robot.c:458: while(Echo!=1); // Wait for the signal to be one
L009004?:
	jnb	_P0_1,L009004?
;	robot.c:461: TR0=1; // Start the timer
	setb	_TR0
;	robot.c:462: while(Echo!=0) // Wait for the signal to be zero
L009009?:
	jnb	_P0_1,L009011?
;	robot.c:464: if(TF0==1) // Did the 16-bit timer overflow?
;	robot.c:466: TF0=0;
	jbc	_TF0,L009023?
	sjmp	L009009?
L009023?:
;	robot.c:467: overflow_count++;
	inc	_overflow_count
	sjmp	L009009?
L009011?:
;	robot.c:470: TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
	clr	_TR0
;	robot.c:471: time=(overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK);
	mov	dpl,_overflow_count
	lcall	___uchar2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x47
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_TH0
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___uchar2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x43
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	r6,_TL0
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___sint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x37BD
	mov	b,#0x86
	mov	a,#0x34
	lcall	___fsmul
	mov	_time,dpl
	mov	(_time + 1),dph
	mov	(_time + 2),b
	mov	(_time + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	robot.c:472: distance = ((time/2.0f)/29.1f)*100000;
	clr	a
	push	acc
	push	acc
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,_time
	mov	dph,(_time + 1)
	mov	b,(_time + 2)
	mov	a,(_time + 3)
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0xCD
	push	acc
	mov	a,#0xCC
	push	acc
	mov	a,#0xE8
	push	acc
	mov	a,#0x41
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x5000
	mov	b,#0xC3
	mov	a,#0x47
	lcall	___fsmul
	mov	_distance,dpl
	mov	(_distance + 1),dph
	mov	(_distance + 2),b
	mov	(_distance + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	ret
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST

	CSEG

end
