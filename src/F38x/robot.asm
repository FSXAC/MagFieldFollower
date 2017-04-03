;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Mon Apr 03 11:56:31 2017
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
	public _movecar_PARM_2
	public _Timer2_ISR
	public _main
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
	public _forward_backward
	public _readData
	public _linetrack
	public _stopcar
	public _turncar
	public _uturn
	public _movecar
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
_main_v1_1_57:
	ds 4
_main_v2_1_57:
	ds 4
_main_sloc0_1_0:
	ds 2
_main_sloc1_1_0:
	ds 4
_main_sloc2_1_0:
	ds 4
_linetrack_forwardbackward_1_87:
	ds 2
_linetrack_vleft_1_88:
	ds 4
_linetrack_vright_1_88:
	ds 4
_linetrack_sloc0_1_0:
	ds 4
_turncar_v_1_95:
	ds 4
_turncar_direction_1_95:
	ds 1
_uturn_vleft_1_105:
	ds 4
_uturn_vright_1_105:
	ds 4
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
_movecar_PARM_2:
	ds 2
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
_main_sloc3_1_0:
	DBIT	1
_Timer2_ISR_sloc0_1_0:
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
;	robot.c:10: volatile  char pwm_count=0;
	mov	_pwm_count,#0x00
;	robot.c:11: volatile  char mode = 0;
	mov	_mode,#0x00
;	robot.c:12: volatile  char pwm_both =0;
	mov	_pwm_both,#0x00
;	robot.c:13: volatile  char pwm_Left0 = 0; //p1.5
	mov	_pwm_Left0,#0x00
;	robot.c:14: volatile  char pwm_Left1 = 0; //p1.6
	mov	_pwm_Left1,#0x00
;	robot.c:15: volatile  char pwm_Right0 = 0; //p2.0
	mov	_pwm_Right0,#0x00
;	robot.c:16: volatile  char pwm_Right1 = 0; //p2.1
	mov	_pwm_Right1,#0x00
;	robot.c:17: volatile  char direction = 0; // 1 for back 0 for forward
	mov	_direction,#0x00
;	robot.c:19: volatile  char currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:20: volatile  char currentstate = 1;
	mov	_currentstate,#0x01
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;v1                        Allocated with name '_main_v1_1_57'
;v2                        Allocated with name '_main_v2_1_57'
;i                         Allocated to registers 
;sloc0                     Allocated with name '_main_sloc0_1_0'
;sloc1                     Allocated with name '_main_sloc1_1_0'
;sloc2                     Allocated with name '_main_sloc2_1_0'
;------------------------------------------------------------
;	robot.c:22: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	using	0
;	robot.c:24: volatile float v1 = 0;
	mov	_main_v1_1_57,#0x00
	mov	(_main_v1_1_57 + 1),#0x00
	mov	(_main_v1_1_57 + 2),#0x00
	mov	(_main_v1_1_57 + 3),#0x00
;	robot.c:25: volatile float v2 = 0;
	mov	_main_v2_1_57,#0x00
	mov	(_main_v2_1_57 + 1),#0x00
	mov	(_main_v2_1_57 + 2),#0x00
	mov	(_main_v2_1_57 + 3),#0x00
;	robot.c:28: MOTOR_LEFT0 =0;
	clr	_P1_5
;	robot.c:29: MOTOR_LEFT1 =0;
	clr	_P1_6
;	robot.c:30: MOTOR_RIGHT0 =0;
	clr	_P2_0
;	robot.c:31: MOTOR_RIGHT1 =0;
	clr	_P2_1
;	robot.c:34: currentstate = 2;  	//1-FORWARD, 2-BACKWARDS, 3-STOPPED, 4-DEBUGGER
	mov	_currentstate,#0x02
;	robot.c:35: currentcmd = 2;		//0-NO COMMAND, 1-TURN LEFT, 2-TURN RIGHT, 3-FORWARDS, 4-BACKWARDS, 5-STOP, 6-UTURN
	mov	_currentcmd,#0x02
;	robot.c:38: printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	robot.c:41: InitPinADC(2, 3); // Configure P2.3 as analog input (tank1)
	mov	_InitPinADC_PARM_2,#0x03
	mov	dpl,#0x02
	lcall	_InitPinADC
;	robot.c:42: InitPinADC(2, 4); // Configure P2.4 as analog input	(tank1)
	mov	_InitPinADC_PARM_2,#0x04
	mov	dpl,#0x02
	lcall	_InitPinADC
;	robot.c:43: InitPinADC(2, 5); // Configure P2.5 as analog input (tank2)
	mov	_InitPinADC_PARM_2,#0x05
	mov	dpl,#0x02
	lcall	_InitPinADC
;	robot.c:44: InitPinADC(2, 6); // Configure P2.6 as analog input (tank2)
	mov	_InitPinADC_PARM_2,#0x06
	mov	dpl,#0x02
	lcall	_InitPinADC
;	robot.c:50: InitADC();
	lcall	_InitADC
;	robot.c:54: while(1)
L002033?:
;	robot.c:57: readData(); 
	lcall	_readData
;	robot.c:59: printf("frontL %f frontR %f backL %f backR %f command %1d\r\n", Volts_at_Pin(LQFP32_MUX_P2_3),Volts_at_Pin(LQFP32_MUX_P2_4),Volts_at_Pin(LQFP32_MUX_P2_5),Volts_at_Pin(LQFP32_MUX_P2_6), currentcmd);
	mov	_main_sloc0_1_0,_currentcmd
	mov	a,_currentcmd
	rlc	a
	subb	a,acc
	mov	(_main_sloc0_1_0 + 1),a
	mov	dpl,#0x0E
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	dpl,#0x0D
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	lcall	_Volts_at_Pin
	mov	_main_sloc1_1_0,dpl
	mov	(_main_sloc1_1_0 + 1),dph
	mov	(_main_sloc1_1_0 + 2),b
	mov	(_main_sloc1_1_0 + 3),a
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_main_sloc2_1_0,dpl
	mov	(_main_sloc2_1_0 + 1),dph
	mov	(_main_sloc2_1_0 + 2),b
	mov	(_main_sloc2_1_0 + 3),a
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r0,b
	mov	r1,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	push	_main_sloc0_1_0
	push	(_main_sloc0_1_0 + 1)
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	_main_sloc1_1_0
	push	(_main_sloc1_1_0 + 1)
	push	(_main_sloc1_1_0 + 2)
	push	(_main_sloc1_1_0 + 3)
	push	_main_sloc2_1_0
	push	(_main_sloc2_1_0 + 1)
	push	(_main_sloc2_1_0 + 2)
	push	(_main_sloc2_1_0 + 3)
	push	ar2
	push	ar3
	push	ar0
	push	ar1
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xeb
	mov	sp,a
;	robot.c:62: switch (currentstate) {
	mov	r2,_currentstate
	cjne	r2,#0x01,L002063?
	sjmp	L002001?
L002063?:
	cjne	r2,#0x02,L002064?
	sjmp	L002002?
L002064?:
;	robot.c:63: case 1:
	cjne	r2,#0x03,L002004?
	sjmp	L002003?
L002001?:
;	robot.c:64: linetrack(0);	//forwards
	mov	dptr,#0x0000
	lcall	_linetrack
;	robot.c:66: v1 = Volts_at_Pin(LQFP32_MUX_P2_3);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	_main_v1_1_57,dpl
	mov	(_main_v1_1_57 + 1),dph
	mov	(_main_v1_1_57 + 2),b
	mov	(_main_v1_1_57 + 3),a
;	robot.c:67: v2 = Volts_at_Pin(LQFP32_MUX_P2_4);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_main_v2_1_57,dpl
	mov	(_main_v2_1_57 + 1),dph
	mov	(_main_v2_1_57 + 2),b
	mov	(_main_v2_1_57 + 3),a
;	robot.c:68: break;
;	robot.c:69: case 2:
	sjmp	L002004?
L002002?:
;	robot.c:70: linetrack(1);	//backwards
	mov	dptr,#0x0001
	lcall	_linetrack
;	robot.c:72: v1 = Volts_at_Pin(LQFP32_MUX_P2_5);
	mov	dpl,#0x0D
	lcall	_Volts_at_Pin
	mov	_main_v1_1_57,dpl
	mov	(_main_v1_1_57 + 1),dph
	mov	(_main_v1_1_57 + 2),b
	mov	(_main_v1_1_57 + 3),a
;	robot.c:73: v2 = Volts_at_Pin(LQFP32_MUX_P2_6);
	mov	dpl,#0x0E
	lcall	_Volts_at_Pin
	mov	_main_v2_1_57,dpl
	mov	(_main_v2_1_57 + 1),dph
	mov	(_main_v2_1_57 + 2),b
	mov	(_main_v2_1_57 + 3),a
;	robot.c:74: break;
;	robot.c:75: case 3:
	sjmp	L002004?
L002003?:
;	robot.c:76: stopcar();		//stop car
	lcall	_stopcar
;	robot.c:78: }
L002004?:
;	robot.c:81: switch (currentcmd) {
	mov	a,_currentcmd
	mov	r2,a
	jnb	acc.7,L002066?
	ljmp	L002030?
L002066?:
	clr	c
	mov	a,#(0x06 ^ 0x80)
	mov	b,r2
	xrl	b,#0x80
	subb	a,b
	jnc	L002067?
	ljmp	L002030?
L002067?:
	mov	a,r2
	add	a,r2
	add	a,r2
	mov	dptr,#L002068?
	jmp	@a+dptr
L002068?:
	ljmp	L002005?
	ljmp	L002018?
	ljmp	L002022?
	ljmp	L002026?
	ljmp	L002027?
	ljmp	L002028?
	ljmp	L002029?
;	robot.c:83: case 0 :
L002005?:
;	robot.c:85: if ((currentstate-1)? (v1 > 1.2 && v2 > 1.2):(v1 > 0.7 && v2 > 1)) {
	mov	r2,_currentstate
	mov	a,_currentstate
	rlc	a
	subb	a,acc
	mov	r3,a
	dec	r2
	cjne	r2,#0xff,L002069?
	dec	r3
L002069?:
	mov	a,r2
	orl	a,r3
	jz	L002037?
	mov	a,#0x9A
	push	acc
	mov	a,#0x99
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v1_1_57
	mov	dph,(_main_v1_1_57 + 1)
	mov	b,(_main_v1_1_57 + 2)
	mov	a,(_main_v1_1_57 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L002039?
	mov	a,#0x9A
	push	acc
	mov	a,#0x99
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v2_1_57
	mov	dph,(_main_v2_1_57 + 1)
	mov	b,(_main_v2_1_57 + 2)
	mov	a,(_main_v2_1_57 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L002040?
L002039?:
	mov	r2,#0x00
	sjmp	L002041?
L002040?:
	mov	r2,#0x01
L002041?:
	mov	a,r2
	add	a,#0xff
	mov	_main_sloc3_1_0,c
	sjmp	L002038?
L002037?:
	mov	a,#0x33
	push	acc
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v1_1_57
	mov	dph,(_main_v1_1_57 + 1)
	mov	b,(_main_v1_1_57 + 2)
	mov	a,(_main_v1_1_57 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L002042?
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v2_1_57
	mov	dph,(_main_v2_1_57 + 1)
	mov	b,(_main_v2_1_57 + 2)
	mov	a,(_main_v2_1_57 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L002043?
L002042?:
	mov	r2,#0x00
	sjmp	L002044?
L002043?:
	mov	r2,#0x01
L002044?:
	mov	a,r2
	add	a,#0xff
	mov	_main_sloc3_1_0,c
L002038?:
	jb	_main_sloc3_1_0,L002075?
	ljmp	L002033?
L002075?:
;	robot.c:86: printf("\nINTERSECTION\n");
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	robot.c:87: if (currentstate == 1) {
	mov	a,#0x01
	cjne	a,_currentstate,L002010?
;	robot.c:88: if (Volts_at_Pin(LQFP32_MUX_P2_5)>Volts_at_Pin(LQFP32_MUX_P2_6)) {
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
	jz	L002007?
;	robot.c:89: pwm_Left1 = 50;
	mov	_pwm_Left1,#0x32
;	robot.c:90: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:91: pwm_Right0 = 30;
	mov	_pwm_Right0,#0x1E
;	robot.c:92: pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
	sjmp	L002010?
L002007?:
;	robot.c:95: pwm_Left1 = 30;
	mov	_pwm_Left1,#0x1E
;	robot.c:96: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:97: pwm_Right0 = 50;
	mov	_pwm_Right0,#0x32
;	robot.c:98: pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
L002010?:
;	robot.c:101: if (currentstate == 2) {
	mov	a,#0x02
	cjne	a,_currentstate,L002015?
;	robot.c:102: if (Volts_at_Pin(LQFP32_MUX_P2_3)>Volts_at_Pin(LQFP32_MUX_P2_4)) {
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
	jz	L002012?
;	robot.c:103: pwm_Left0 = 50;
	mov	_pwm_Left0,#0x32
;	robot.c:104: pwm_Left1 = -1;
	mov	_pwm_Left1,#0xFF
;	robot.c:105: pwm_Right1 = 30;
	mov	_pwm_Right1,#0x1E
;	robot.c:106: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
	sjmp	L002015?
L002012?:
;	robot.c:109: pwm_Left0 = 30;
	mov	_pwm_Left0,#0x1E
;	robot.c:110: pwm_Left1 = -1;
	mov	_pwm_Left1,#0xFF
;	robot.c:111: pwm_Right1 = 50;
	mov	_pwm_Right1,#0x32
;	robot.c:112: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
L002015?:
;	robot.c:115: waitms(1500);
	mov	dptr,#0x05DC
	lcall	_waitms
;	robot.c:117: break;
	ljmp	L002033?
;	robot.c:119: case 1 :
L002018?:
;	robot.c:121: if (v1 > 0.7 && v2 >1)  {
	mov	a,#0x33
	push	acc
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v1_1_57
	mov	dph,(_main_v1_1_57 + 1)
	mov	b,(_main_v1_1_57 + 2)
	mov	a,(_main_v1_1_57 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L002082?
	ljmp	L002033?
L002082?:
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v2_1_57
	mov	dph,(_main_v2_1_57 + 1)
	mov	b,(_main_v2_1_57 + 2)
	mov	a,(_main_v2_1_57 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L002083?
	ljmp	L002033?
L002083?:
;	robot.c:122: printf("\n\r INTERSECTION\n");
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	robot.c:125: turncar(currentstate); //1 = forward left, 2 = backward left
	mov	r2,_currentstate
	mov	a,_currentstate
	rlc	a
	subb	a,acc
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	lcall	_turncar
;	robot.c:126: currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:128: break;
	ljmp	L002033?
;	robot.c:131: case 2 :
L002022?:
;	robot.c:133: if (v1 > 0.7 && v2 >1) {
	mov	a,#0x33
	push	acc
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v1_1_57
	mov	dph,(_main_v1_1_57 + 1)
	mov	b,(_main_v1_1_57 + 2)
	mov	a,(_main_v1_1_57 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L002084?
	ljmp	L002033?
L002084?:
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v2_1_57
	mov	dph,(_main_v2_1_57 + 1)
	mov	b,(_main_v2_1_57 + 2)
	mov	a,(_main_v2_1_57 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L002085?
	ljmp	L002033?
L002085?:
;	robot.c:134: printf("\n\r INTERSECTION\n");
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	robot.c:137: turncar(currentstate+2); //3 = forward right, 4 = backward right
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
;	robot.c:138: currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:140: break;
	ljmp	L002033?
;	robot.c:143: case 3 :
L002026?:
;	robot.c:145: currentstate = 1;
	mov	_currentstate,#0x01
;	robot.c:146: currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:147: break;
	ljmp	L002033?
;	robot.c:150: case 4 :
L002027?:
;	robot.c:152: currentstate = 2;
	mov	_currentstate,#0x02
;	robot.c:153: currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:154: break;
	ljmp	L002033?
;	robot.c:157: case 5 :
L002028?:
;	robot.c:159: currentstate = 3;
	mov	_currentstate,#0x03
;	robot.c:160: currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:161: break;
	ljmp	L002033?
;	robot.c:164: case 6 :
L002029?:
;	robot.c:165: uturn();
	lcall	_uturn
;	robot.c:166: currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:167: break;
	ljmp	L002033?
;	robot.c:170: default: 
L002030?:
;	robot.c:171: currentstate = 1;
	mov	_currentstate,#0x01
;	robot.c:172: }
	ljmp	L002033?
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	robot.c:176: void Timer2_ISR (void) interrupt 5 {
;	-----------------------------------------
;	 function Timer2_ISR
;	-----------------------------------------
_Timer2_ISR:
	push	acc
	push	b
	push	psw
	mov	psw,#0x00
;	robot.c:177: TF2H = 0; // Clear Timer2 interrupt flag
	clr	_TF2H
;	robot.c:179: pwm_count++;
	inc	_pwm_count
;	robot.c:180: if(pwm_count>100) pwm_count=0;
	clr	c
	mov	a,#(0x64 ^ 0x80)
	mov	b,_pwm_count
	xrl	b,#0x80
	subb	a,b
	jnc	L003002?
	mov	_pwm_count,#0x00
L003002?:
;	robot.c:183: MOTOR_LEFT0 = pwm_count > pwm_Left0 ? 0 : 1; //p1.5
	clr	c
	mov	a,_pwm_Left0
	xrl	a,#0x80
	mov	b,_pwm_count
	xrl	b,#0x80
	subb	a,b
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P1_5,c
;	robot.c:184: MOTOR_LEFT1 = pwm_count > pwm_Left1 ? 0 : 1; //p1.6
	clr	c
	mov	a,_pwm_Left1
	xrl	a,#0x80
	mov	b,_pwm_count
	xrl	b,#0x80
	subb	a,b
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P1_6,c
;	robot.c:185: MOTOR_RIGHT0 = pwm_count > pwm_Right0 ? 0 : 1; //p2.0
	clr	c
	mov	a,_pwm_Right0
	xrl	a,#0x80
	mov	b,_pwm_count
	xrl	b,#0x80
	subb	a,b
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P2_0,c
;	robot.c:186: MOTOR_RIGHT1 = pwm_count > pwm_Right1 ? 0 : 1; //p2.1
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
	pop	b
	pop	acc
	reti
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;------------------------------------------------------------
;Allocation info for local variables in function 'forward_backward'
;------------------------------------------------------------
;direction                 Allocated to registers r2 
;------------------------------------------------------------
;	robot.c:193: void forward_backward(unsigned char direction) {
;	-----------------------------------------
;	 function forward_backward
;	-----------------------------------------
_forward_backward:
;	robot.c:194: if (direction == 0) { //p2.1,1.6 on
	mov	a,dpl
	mov	r2,a
	jnz	L004004?
;	robot.c:195: pwm_Left0 = pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
	mov	_pwm_Left0,#0xFF
;	robot.c:196: pwm_Left1 = pwm_Right1 = pwm_both;  //MOTOR_LEFT1 = MOTOR_RIGHT1 = pwm_both;
	mov	_pwm_Right1,_pwm_both
	mov	_pwm_Left1,_pwm_both
	ret
L004004?:
;	robot.c:199: else if (direction == 1) { //p2.0,1.5 on
	cjne	r2,#0x01,L004006?
;	robot.c:200: pwm_Left1 = pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
	mov	_pwm_Left1,#0xFF
;	robot.c:201: pwm_Left0 = pwm_Right0 = pwm_both; 
	mov	_pwm_Right0,_pwm_both
	mov	_pwm_Left0,_pwm_both
L004006?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'readData'
;------------------------------------------------------------
;commandflag               Allocated to registers r2 r3 
;------------------------------------------------------------
;	robot.c:212: void readData (void) {
;	-----------------------------------------
;	 function readData
;	-----------------------------------------
_readData:
;	robot.c:213: int commandflag = 0;					//determines if there's a real command coming in or not
	mov	r2,#0x00
	mov	r3,#0x00
;	robot.c:216: if (COMMAND_PIN == 0) {					//0---
	jnb	_P1_0,L005039?
	ljmp	L005022?
L005039?:
;	robot.c:217: waitms(CMDFRQ*1.5);
	mov	dptr,#0x0069
	push	ar2
	push	ar3
	lcall	_waitms
	pop	ar3
	pop	ar2
;	robot.c:218: if (COMMAND_PIN == 1) {				//01--
	jnb	_P1_0,L005019?
;	robot.c:219: waitms(CMDFRQ);
	mov	dptr,#0x0046
	push	ar2
	push	ar3
	lcall	_waitms
	pop	ar3
	pop	ar2
;	robot.c:220: if (COMMAND_PIN == 0) {			//010-
	jb	_P1_0,L005007?
;	robot.c:221: waitms(CMDFRQ);
	mov	dptr,#0x0046
	push	ar2
	push	ar3
	lcall	_waitms
	pop	ar3
	pop	ar2
;	robot.c:222: if (COMMAND_PIN == 0) 	currentcmd = 4;	//0100	
	jb	_P1_0,L005002?
	mov	_currentcmd,#0x04
	sjmp	L005022?
L005002?:
;	robot.c:223: else 					currentcmd = 5;	//0101
	mov	_currentcmd,#0x05
	sjmp	L005022?
L005007?:
;	robot.c:226: waitms(CMDFRQ);
	mov	dptr,#0x0046
	push	ar2
	push	ar3
	lcall	_waitms
	pop	ar3
	pop	ar2
;	robot.c:227: if (COMMAND_PIN == 0) 	currentcmd = 6;	//0110
	jb	_P1_0,L005022?
	mov	_currentcmd,#0x06
	sjmp	L005022?
L005019?:
;	robot.c:231: waitms(CMDFRQ);
	mov	dptr,#0x0046
	push	ar2
	push	ar3
	lcall	_waitms
	pop	ar3
	pop	ar2
;	robot.c:232: if (COMMAND_PIN == 1) {			//001-
	jnb	_P1_0,L005016?
;	robot.c:233: waitms(CMDFRQ);
	mov	dptr,#0x0046
	push	ar2
	push	ar3
	lcall	_waitms
	pop	ar3
	pop	ar2
;	robot.c:234: if (COMMAND_PIN == 1) 	currentcmd = 3;	//0011
	jnb	_P1_0,L005010?
	mov	_currentcmd,#0x03
	sjmp	L005022?
L005010?:
;	robot.c:235: else 					currentcmd = 2;	//0010
	mov	_currentcmd,#0x02
	sjmp	L005022?
L005016?:
;	robot.c:238: waitms(CMDFRQ);
	mov	dptr,#0x0046
	push	ar2
	push	ar3
	lcall	_waitms
	pop	ar3
	pop	ar2
;	robot.c:239: if (COMMAND_PIN == 1) 	currentcmd = 1; //0001
	jnb	_P1_0,L005013?
	mov	_currentcmd,#0x01
	sjmp	L005022?
L005013?:
;	robot.c:241: commandflag = 1;
	mov	r2,#0x01
	mov	r3,#0x00
L005022?:
;	robot.c:248: if (commandflag == 0)	{while (COMMAND_PIN == 0);} 
	mov	a,r2
	orl	a,r3
	jnz	L005028?
L005023?:
	jnb	_P1_0,L005023?
L005028?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'linetrack'
;------------------------------------------------------------
;forwardbackward           Allocated with name '_linetrack_forwardbackward_1_87'
;vleft                     Allocated with name '_linetrack_vleft_1_88'
;vright                    Allocated with name '_linetrack_vright_1_88'
;sloc0                     Allocated with name '_linetrack_sloc0_1_0'
;------------------------------------------------------------
;	robot.c:258: void linetrack (int forwardbackward) {
;	-----------------------------------------
;	 function linetrack
;	-----------------------------------------
_linetrack:
	mov	_linetrack_forwardbackward_1_87,dpl
	mov	(_linetrack_forwardbackward_1_87 + 1),dph
;	robot.c:264: vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	_linetrack_vleft_1_88,dpl
	mov	(_linetrack_vleft_1_88 + 1),dph
	mov	(_linetrack_vleft_1_88 + 2),b
	mov	(_linetrack_vleft_1_88 + 3),a
;	robot.c:265: vright=Volts_at_Pin(LQFP32_MUX_P2_4);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_linetrack_vright_1_88,dpl
	mov	(_linetrack_vright_1_88 + 1),dph
	mov	(_linetrack_vright_1_88 + 2),b
	mov	(_linetrack_vright_1_88 + 3),a
;	robot.c:268: if (forwardbackward == 2) {
	mov	a,#0x02
	cjne	a,_linetrack_forwardbackward_1_87,L006013?
	clr	a
	cjne	a,(_linetrack_forwardbackward_1_87 + 1),L006013?
	sjmp	L006014?
L006013?:
	sjmp	L006002?
L006014?:
;	robot.c:269: vleft=Volts_at_Pin(LQFP32_MUX_P2_5);
	mov	dpl,#0x0D
	lcall	_Volts_at_Pin
	mov	_linetrack_vleft_1_88,dpl
	mov	(_linetrack_vleft_1_88 + 1),dph
	mov	(_linetrack_vleft_1_88 + 2),b
	mov	(_linetrack_vleft_1_88 + 3),a
;	robot.c:270: vright=Volts_at_Pin(LQFP32_MUX_P2_6);
	mov	dpl,#0x0E
	lcall	_Volts_at_Pin
	mov	_linetrack_vright_1_88,dpl
	mov	(_linetrack_vright_1_88 + 1),dph
	mov	(_linetrack_vright_1_88 + 2),b
	mov	(_linetrack_vright_1_88 + 3),a
L006002?:
;	robot.c:274: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:275: pwm_Left1 = vright*vright*75/(vright*vright+vleft*vleft);
	push	_linetrack_vright_1_88
	push	(_linetrack_vright_1_88 + 1)
	push	(_linetrack_vright_1_88 + 2)
	push	(_linetrack_vright_1_88 + 3)
	mov	dpl,_linetrack_vright_1_88
	mov	dph,(_linetrack_vright_1_88 + 1)
	mov	b,(_linetrack_vright_1_88 + 2)
	mov	a,(_linetrack_vright_1_88 + 3)
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
	push	_linetrack_vright_1_88
	push	(_linetrack_vright_1_88 + 1)
	push	(_linetrack_vright_1_88 + 2)
	push	(_linetrack_vright_1_88 + 3)
	mov	dpl,_linetrack_vright_1_88
	mov	dph,(_linetrack_vright_1_88 + 1)
	mov	b,(_linetrack_vright_1_88 + 2)
	mov	a,(_linetrack_vright_1_88 + 3)
	lcall	___fsmul
	mov	_linetrack_sloc0_1_0,dpl
	mov	(_linetrack_sloc0_1_0 + 1),dph
	mov	(_linetrack_sloc0_1_0 + 2),b
	mov	(_linetrack_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_linetrack_vleft_1_88
	push	(_linetrack_vleft_1_88 + 1)
	push	(_linetrack_vleft_1_88 + 2)
	push	(_linetrack_vleft_1_88 + 3)
	mov	dpl,_linetrack_vleft_1_88
	mov	dph,(_linetrack_vleft_1_88 + 1)
	mov	b,(_linetrack_vleft_1_88 + 2)
	mov	a,(_linetrack_vleft_1_88 + 3)
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar0
	push	ar1
	mov	dpl,_linetrack_sloc0_1_0
	mov	dph,(_linetrack_sloc0_1_0 + 1)
	mov	b,(_linetrack_sloc0_1_0 + 2)
	mov	a,(_linetrack_sloc0_1_0 + 3)
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	push	ar2
	push	ar3
	push	ar0
	push	ar1
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
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
	mov	_pwm_Left1,dpl
;	robot.c:276: pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
;	robot.c:277: pwm_Right0 = vleft*vleft*75/(vright*vright+vleft*vleft);
	push	_linetrack_vleft_1_88
	push	(_linetrack_vleft_1_88 + 1)
	push	(_linetrack_vleft_1_88 + 2)
	push	(_linetrack_vleft_1_88 + 3)
	mov	dpl,_linetrack_vleft_1_88
	mov	dph,(_linetrack_vleft_1_88 + 1)
	mov	b,(_linetrack_vleft_1_88 + 2)
	mov	a,(_linetrack_vleft_1_88 + 3)
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
	push	_linetrack_vright_1_88
	push	(_linetrack_vright_1_88 + 1)
	push	(_linetrack_vright_1_88 + 2)
	push	(_linetrack_vright_1_88 + 3)
	mov	dpl,_linetrack_vright_1_88
	mov	dph,(_linetrack_vright_1_88 + 1)
	mov	b,(_linetrack_vright_1_88 + 2)
	mov	a,(_linetrack_vright_1_88 + 3)
	lcall	___fsmul
	mov	_linetrack_sloc0_1_0,dpl
	mov	(_linetrack_sloc0_1_0 + 1),dph
	mov	(_linetrack_sloc0_1_0 + 2),b
	mov	(_linetrack_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_linetrack_vleft_1_88
	push	(_linetrack_vleft_1_88 + 1)
	push	(_linetrack_vleft_1_88 + 2)
	push	(_linetrack_vleft_1_88 + 3)
	mov	dpl,_linetrack_vleft_1_88
	mov	dph,(_linetrack_vleft_1_88 + 1)
	mov	b,(_linetrack_vleft_1_88 + 2)
	mov	a,(_linetrack_vleft_1_88 + 3)
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
	mov	dpl,_linetrack_sloc0_1_0
	mov	dph,(_linetrack_sloc0_1_0 + 1)
	mov	b,(_linetrack_sloc0_1_0 + 2)
	mov	a,(_linetrack_sloc0_1_0 + 3)
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
	mov	_pwm_Right0,dpl
;	robot.c:281: if ((forwardbackward == 1)||(forwardbackward == 3)) {
	mov	a,#0x01
	cjne	a,_linetrack_forwardbackward_1_87,L006015?
	clr	a
	cjne	a,(_linetrack_forwardbackward_1_87 + 1),L006015?
	sjmp	L006005?
L006015?:
	mov	a,#0x03
	cjne	a,_linetrack_forwardbackward_1_87,L006016?
	clr	a
	cjne	a,(_linetrack_forwardbackward_1_87 + 1),L006016?
	sjmp	L006017?
L006016?:
	ret
L006017?:
L006005?:
;	robot.c:283: vleft=Volts_at_Pin(LQFP32_MUX_P2_5);
	mov	dpl,#0x0D
	lcall	_Volts_at_Pin
	mov	_linetrack_vleft_1_88,dpl
	mov	(_linetrack_vleft_1_88 + 1),dph
	mov	(_linetrack_vleft_1_88 + 2),b
	mov	(_linetrack_vleft_1_88 + 3),a
;	robot.c:284: vright=Volts_at_Pin(LQFP32_MUX_P2_6);
	mov	dpl,#0x0E
	lcall	_Volts_at_Pin
	mov	_linetrack_vright_1_88,dpl
	mov	(_linetrack_vright_1_88 + 1),dph
	mov	(_linetrack_vright_1_88 + 2),b
	mov	(_linetrack_vright_1_88 + 3),a
;	robot.c:287: if (forwardbackward == 3) {
	mov	a,#0x03
	cjne	a,_linetrack_forwardbackward_1_87,L006018?
	clr	a
	cjne	a,(_linetrack_forwardbackward_1_87 + 1),L006018?
	sjmp	L006019?
L006018?:
	sjmp	L006004?
L006019?:
;	robot.c:288: vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	_linetrack_vleft_1_88,dpl
	mov	(_linetrack_vleft_1_88 + 1),dph
	mov	(_linetrack_vleft_1_88 + 2),b
	mov	(_linetrack_vleft_1_88 + 3),a
;	robot.c:289: vright=Volts_at_Pin(LQFP32_MUX_P2_4);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_linetrack_vright_1_88,dpl
	mov	(_linetrack_vright_1_88 + 1),dph
	mov	(_linetrack_vright_1_88 + 2),b
	mov	(_linetrack_vright_1_88 + 3),a
L006004?:
;	robot.c:293: pwm_Left1 = -1;
	mov	_pwm_Left1,#0xFF
;	robot.c:294: pwm_Left0 = vright*vright*75/(vright*vright+vleft*vleft);
	push	_linetrack_vright_1_88
	push	(_linetrack_vright_1_88 + 1)
	push	(_linetrack_vright_1_88 + 2)
	push	(_linetrack_vright_1_88 + 3)
	mov	dpl,_linetrack_vright_1_88
	mov	dph,(_linetrack_vright_1_88 + 1)
	mov	b,(_linetrack_vright_1_88 + 2)
	mov	a,(_linetrack_vright_1_88 + 3)
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
	push	_linetrack_vright_1_88
	push	(_linetrack_vright_1_88 + 1)
	push	(_linetrack_vright_1_88 + 2)
	push	(_linetrack_vright_1_88 + 3)
	mov	dpl,_linetrack_vright_1_88
	mov	dph,(_linetrack_vright_1_88 + 1)
	mov	b,(_linetrack_vright_1_88 + 2)
	mov	a,(_linetrack_vright_1_88 + 3)
	lcall	___fsmul
	mov	_linetrack_sloc0_1_0,dpl
	mov	(_linetrack_sloc0_1_0 + 1),dph
	mov	(_linetrack_sloc0_1_0 + 2),b
	mov	(_linetrack_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_linetrack_vleft_1_88
	push	(_linetrack_vleft_1_88 + 1)
	push	(_linetrack_vleft_1_88 + 2)
	push	(_linetrack_vleft_1_88 + 3)
	mov	dpl,_linetrack_vleft_1_88
	mov	dph,(_linetrack_vleft_1_88 + 1)
	mov	b,(_linetrack_vleft_1_88 + 2)
	mov	a,(_linetrack_vleft_1_88 + 3)
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
	mov	dpl,_linetrack_sloc0_1_0
	mov	dph,(_linetrack_sloc0_1_0 + 1)
	mov	b,(_linetrack_sloc0_1_0 + 2)
	mov	a,(_linetrack_sloc0_1_0 + 3)
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
;	robot.c:295: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
;	robot.c:296: pwm_Right1 = vleft*vleft*75/(vright*vright+vleft*vleft);
	push	_linetrack_vleft_1_88
	push	(_linetrack_vleft_1_88 + 1)
	push	(_linetrack_vleft_1_88 + 2)
	push	(_linetrack_vleft_1_88 + 3)
	mov	dpl,_linetrack_vleft_1_88
	mov	dph,(_linetrack_vleft_1_88 + 1)
	mov	b,(_linetrack_vleft_1_88 + 2)
	mov	a,(_linetrack_vleft_1_88 + 3)
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
	push	_linetrack_vright_1_88
	push	(_linetrack_vright_1_88 + 1)
	push	(_linetrack_vright_1_88 + 2)
	push	(_linetrack_vright_1_88 + 3)
	mov	dpl,_linetrack_vright_1_88
	mov	dph,(_linetrack_vright_1_88 + 1)
	mov	b,(_linetrack_vright_1_88 + 2)
	mov	a,(_linetrack_vright_1_88 + 3)
	lcall	___fsmul
	mov	_linetrack_sloc0_1_0,dpl
	mov	(_linetrack_sloc0_1_0 + 1),dph
	mov	(_linetrack_sloc0_1_0 + 2),b
	mov	(_linetrack_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_linetrack_vleft_1_88
	push	(_linetrack_vleft_1_88 + 1)
	push	(_linetrack_vleft_1_88 + 2)
	push	(_linetrack_vleft_1_88 + 3)
	mov	dpl,_linetrack_vleft_1_88
	mov	dph,(_linetrack_vleft_1_88 + 1)
	mov	b,(_linetrack_vleft_1_88 + 2)
	mov	a,(_linetrack_vleft_1_88 + 3)
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
	mov	dpl,_linetrack_sloc0_1_0
	mov	dph,(_linetrack_sloc0_1_0 + 1)
	mov	b,(_linetrack_sloc0_1_0 + 2)
	mov	a,(_linetrack_sloc0_1_0 + 3)
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
;	robot.c:308: void stopcar(void) {
;	-----------------------------------------
;	 function stopcar
;	-----------------------------------------
_stopcar:
;	robot.c:310: pwm_Left1 = -1;
	mov	_pwm_Left1,#0xFF
;	robot.c:311: pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
;	robot.c:312: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:313: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'turncar'
;------------------------------------------------------------
;leftright                 Allocated to registers r2 r3 
;v                         Allocated with name '_turncar_v_1_95'
;direction                 Allocated with name '_turncar_direction_1_95'
;------------------------------------------------------------
;	robot.c:319: void turncar (int leftright) {
;	-----------------------------------------
;	 function turncar
;	-----------------------------------------
_turncar:
	mov	r2,dpl
	mov	r3,dph
;	robot.c:326: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:327: pwm_Left1 = -1;
	mov	_pwm_Left1,#0xFF
;	robot.c:328: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
;	robot.c:329: pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
;	robot.c:331: direction = currentstate - 1;
	mov	a,_currentstate
	dec	a
	mov	_turncar_direction_1_95,a
;	robot.c:334: if (leftright == 1) {
	cjne	r2,#0x01,L008062?
	cjne	r3,#0x00,L008062?
	sjmp	L008063?
L008062?:
	ljmp	L008022?
L008063?:
;	robot.c:336: pwm_Right0 = 100;
	mov	_pwm_Right0,#0x64
;	robot.c:338: waitms(100);
	mov	dptr,#0x0064
	lcall	_waitms
;	robot.c:341: v= direction ? Volts_at_Pin(LQFP32_MUX_P2_4) : Volts_at_Pin(LQFP32_MUX_P2_6);
	mov	a,_turncar_direction_1_95
	jz	L008026?
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	sjmp	L008027?
L008026?:
	mov	dpl,#0x0E
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
L008027?:
	mov	_turncar_v_1_95,r4
	mov	(_turncar_v_1_95 + 1),r5
	mov	(_turncar_v_1_95 + 2),r6
	mov	(_turncar_v_1_95 + 3),r7
;	robot.c:343: while (v < 1.3) {
L008001?:
	mov	a,#0x66
	push	acc
	push	acc
	mov	a,#0xA6
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_turncar_v_1_95
	mov	dph,(_turncar_v_1_95 + 1)
	mov	b,(_turncar_v_1_95 + 2)
	mov	a,(_turncar_v_1_95 + 3)
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r4
	jz	L008003?
;	robot.c:345: v= direction ? Volts_at_Pin(LQFP32_MUX_P2_4) : Volts_at_Pin(LQFP32_MUX_P2_6);
	mov	a,_turncar_direction_1_95
	jz	L008028?
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	sjmp	L008029?
L008028?:
	mov	dpl,#0x0E
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
L008029?:
	mov	_turncar_v_1_95,r4
	mov	(_turncar_v_1_95 + 1),r5
	mov	(_turncar_v_1_95 + 2),r6
	mov	(_turncar_v_1_95 + 3),r7
;	robot.c:346: printf("Intersection voltage v = %f\r\n", v);
	push	_turncar_v_1_95
	push	(_turncar_v_1_95 + 1)
	push	(_turncar_v_1_95 + 2)
	push	(_turncar_v_1_95 + 3)
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	sjmp	L008001?
L008003?:
;	robot.c:349: waitms(300);
	mov	dptr,#0x012C
	lcall	_waitms
;	robot.c:352: pwm_Right0 = -1; 
	mov	_pwm_Right0,#0xFF
;	robot.c:353: pwm_Left0 = -1;		
	mov	_pwm_Left0,#0xFF
	ret
L008022?:
;	robot.c:357: else if (leftright == 3) {
	cjne	r2,#0x03,L008067?
	cjne	r3,#0x00,L008067?
	sjmp	L008068?
L008067?:
	ljmp	L008019?
L008068?:
;	robot.c:359: pwm_Left1 = 75;
	mov	_pwm_Left1,#0x4B
;	robot.c:361: waitms(200);
	mov	dptr,#0x00C8
	lcall	_waitms
;	robot.c:364: v= direction ? Volts_at_Pin(LQFP32_MUX_P2_3) : Volts_at_Pin(LQFP32_MUX_P2_5);
	mov	a,_turncar_direction_1_95
	jz	L008030?
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	sjmp	L008031?
L008030?:
	mov	dpl,#0x0D
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
L008031?:
	mov	_turncar_v_1_95,r4
	mov	(_turncar_v_1_95 + 1),r5
	mov	(_turncar_v_1_95 + 2),r6
	mov	(_turncar_v_1_95 + 3),r7
;	robot.c:366: while (v < 1.3) {
L008004?:
	mov	a,#0x66
	push	acc
	push	acc
	mov	a,#0xA6
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_turncar_v_1_95
	mov	dph,(_turncar_v_1_95 + 1)
	mov	b,(_turncar_v_1_95 + 2)
	mov	a,(_turncar_v_1_95 + 3)
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r4
	jz	L008006?
;	robot.c:368: v= direction ? Volts_at_Pin(LQFP32_MUX_P2_3) : Volts_at_Pin(LQFP32_MUX_P2_5);
	mov	a,_turncar_direction_1_95
	jz	L008032?
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	sjmp	L008033?
L008032?:
	mov	dpl,#0x0D
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
L008033?:
	mov	_turncar_v_1_95,r4
	mov	(_turncar_v_1_95 + 1),r5
	mov	(_turncar_v_1_95 + 2),r6
	mov	(_turncar_v_1_95 + 3),r7
;	robot.c:369: printf("Intersection voltage v = %f\r\n", v);
	push	_turncar_v_1_95
	push	(_turncar_v_1_95 + 1)
	push	(_turncar_v_1_95 + 2)
	push	(_turncar_v_1_95 + 3)
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	sjmp	L008004?
L008006?:
;	robot.c:375: pwm_Left1 = -1; 
	mov	_pwm_Left1,#0xFF
;	robot.c:376: pwm_Right1 = -1; 
	mov	_pwm_Right1,#0xFF
	ret
L008019?:
;	robot.c:378: else if (leftright == 2) {
	cjne	r2,#0x02,L008072?
	cjne	r3,#0x00,L008072?
	sjmp	L008073?
L008072?:
	ljmp	L008016?
L008073?:
;	robot.c:380: pwm_Right1 = 100;
	mov	_pwm_Right1,#0x64
;	robot.c:382: waitms(100);
	mov	dptr,#0x0064
	lcall	_waitms
;	robot.c:385: v= direction ? Volts_at_Pin(LQFP32_MUX_P2_4) : Volts_at_Pin(LQFP32_MUX_P2_6);
	mov	a,_turncar_direction_1_95
	jz	L008034?
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	sjmp	L008035?
L008034?:
	mov	dpl,#0x0E
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
L008035?:
	mov	_turncar_v_1_95,r4
	mov	(_turncar_v_1_95 + 1),r5
	mov	(_turncar_v_1_95 + 2),r6
	mov	(_turncar_v_1_95 + 3),r7
;	robot.c:386: printf("Intersection voltage v = %f\r\n", v);
	push	_turncar_v_1_95
	push	(_turncar_v_1_95 + 1)
	push	(_turncar_v_1_95 + 2)
	push	(_turncar_v_1_95 + 3)
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	robot.c:388: while (v < 1) {
L008007?:
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_turncar_v_1_95
	mov	dph,(_turncar_v_1_95 + 1)
	mov	b,(_turncar_v_1_95 + 2)
	mov	a,(_turncar_v_1_95 + 3)
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r4
	jz	L008009?
;	robot.c:390: v= direction ? Volts_at_Pin(LQFP32_MUX_P2_4) : Volts_at_Pin(LQFP32_MUX_P2_6);
	mov	a,_turncar_direction_1_95
	jz	L008036?
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	sjmp	L008037?
L008036?:
	mov	dpl,#0x0E
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
L008037?:
	mov	_turncar_v_1_95,r4
	mov	(_turncar_v_1_95 + 1),r5
	mov	(_turncar_v_1_95 + 2),r6
	mov	(_turncar_v_1_95 + 3),r7
;	robot.c:391: printf("Intersection voltage v = %f\r\n", v);
	push	_turncar_v_1_95
	push	(_turncar_v_1_95 + 1)
	push	(_turncar_v_1_95 + 2)
	push	(_turncar_v_1_95 + 3)
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	sjmp	L008007?
L008009?:
;	robot.c:394: waitms(300);
	mov	dptr,#0x012C
	lcall	_waitms
;	robot.c:397: pwm_Right1 = -1; 
	mov	_pwm_Right1,#0xFF
	ret
L008016?:
;	robot.c:399: else if (leftright == 4) {
	cjne	r2,#0x04,L008077?
	cjne	r3,#0x00,L008077?
	sjmp	L008078?
L008077?:
	ret
L008078?:
;	robot.c:401: pwm_Left0 = 75;
	mov	_pwm_Left0,#0x4B
;	robot.c:403: waitms(200);
	mov	dptr,#0x00C8
	lcall	_waitms
;	robot.c:406: v= direction ? Volts_at_Pin(LQFP32_MUX_P2_3) : Volts_at_Pin(LQFP32_MUX_P2_5);
	mov	a,_turncar_direction_1_95
	jz	L008038?
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	sjmp	L008039?
L008038?:
	mov	dpl,#0x0D
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
L008039?:
	mov	_turncar_v_1_95,r2
	mov	(_turncar_v_1_95 + 1),r3
	mov	(_turncar_v_1_95 + 2),r4
	mov	(_turncar_v_1_95 + 3),r5
;	robot.c:408: while (v < 0.9) {
L008010?:
	mov	a,#0x66
	push	acc
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_turncar_v_1_95
	mov	dph,(_turncar_v_1_95 + 1)
	mov	b,(_turncar_v_1_95 + 2)
	mov	a,(_turncar_v_1_95 + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L008012?
;	robot.c:410: v= direction ? Volts_at_Pin(LQFP32_MUX_P2_3) : Volts_at_Pin(LQFP32_MUX_P2_5);
	mov	a,_turncar_direction_1_95
	jz	L008040?
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	sjmp	L008041?
L008040?:
	mov	dpl,#0x0D
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
L008041?:
	mov	_turncar_v_1_95,r2
	mov	(_turncar_v_1_95 + 1),r3
	mov	(_turncar_v_1_95 + 2),r4
	mov	(_turncar_v_1_95 + 3),r5
;	robot.c:411: printf("Intersection voltage v = %f\r\n", v);
	push	_turncar_v_1_95
	push	(_turncar_v_1_95 + 1)
	push	(_turncar_v_1_95 + 2)
	push	(_turncar_v_1_95 + 3)
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	sjmp	L008010?
L008012?:
;	robot.c:417: pwm_Left0 = -1; 
	mov	_pwm_Left0,#0xFF
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uturn'
;------------------------------------------------------------
;vleft                     Allocated with name '_uturn_vleft_1_105'
;vright                    Allocated with name '_uturn_vright_1_105'
;------------------------------------------------------------
;	robot.c:426: void uturn(void) {
;	-----------------------------------------
;	 function uturn
;	-----------------------------------------
_uturn:
;	robot.c:430: vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	_uturn_vleft_1_105,dpl
	mov	(_uturn_vleft_1_105 + 1),dph
	mov	(_uturn_vleft_1_105 + 2),b
	mov	(_uturn_vleft_1_105 + 3),a
;	robot.c:431: vright=Volts_at_Pin(LQFP32_MUX_P2_4);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_uturn_vright_1_105,dpl
	mov	(_uturn_vright_1_105 + 1),dph
	mov	(_uturn_vright_1_105 + 2),b
	mov	(_uturn_vright_1_105 + 3),a
;	robot.c:434: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:435: pwm_Left1 = 50;
	mov	_pwm_Left1,#0x32
;	robot.c:436: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
;	robot.c:437: pwm_Right1 = 50;
	mov	_pwm_Right1,#0x32
;	robot.c:440: waitms(4000);
	mov	dptr,#0x0FA0
	lcall	_waitms
;	robot.c:443: while (((vleft - vright) > 0.2) || ((vleft - vright) < (-0.2))) {
L009002?:
	push	_uturn_vright_1_105
	push	(_uturn_vright_1_105 + 1)
	push	(_uturn_vright_1_105 + 2)
	push	(_uturn_vright_1_105 + 3)
	mov	dpl,_uturn_vleft_1_105
	mov	dph,(_uturn_vleft_1_105 + 1)
	mov	b,(_uturn_vleft_1_105 + 2)
	mov	a,(_uturn_vleft_1_105 + 3)
	lcall	___fssub
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
	mov	a,#0x4C
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
	jnz	L009003?
	push	_uturn_vright_1_105
	push	(_uturn_vright_1_105 + 1)
	push	(_uturn_vright_1_105 + 2)
	push	(_uturn_vright_1_105 + 3)
	mov	dpl,_uturn_vleft_1_105
	mov	dph,(_uturn_vleft_1_105 + 1)
	mov	b,(_uturn_vleft_1_105 + 2)
	mov	a,(_uturn_vleft_1_105 + 3)
	lcall	___fssub
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
	mov	a,#0x4C
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
	jz	L009005?
L009003?:
;	robot.c:445: vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	_uturn_vleft_1_105,dpl
	mov	(_uturn_vleft_1_105 + 1),dph
	mov	(_uturn_vleft_1_105 + 2),b
	mov	(_uturn_vleft_1_105 + 3),a
;	robot.c:446: vright=Volts_at_Pin(LQFP32_MUX_P2_4);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_uturn_vright_1_105,dpl
	mov	(_uturn_vright_1_105 + 1),dph
	mov	(_uturn_vright_1_105 + 2),b
	mov	(_uturn_vright_1_105 + 3),a
	ljmp	L009002?
L009005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'movecar'
;------------------------------------------------------------
;power                     Allocated with name '_movecar_PARM_2'
;forback                   Allocated to registers r2 r3 
;------------------------------------------------------------
;	robot.c:453: void movecar (int forback, int power) {
;	-----------------------------------------
;	 function movecar
;	-----------------------------------------
_movecar:
	mov	r2,dpl
	mov	r3,dph
;	robot.c:455: if (forback == 1) {
	cjne	r2,#0x01,L010004?
	cjne	r3,#0x00,L010004?
;	robot.c:456: pwm_Left1 = power;
	mov	r4,_movecar_PARM_2
	mov	_pwm_Left1,r4
;	robot.c:457: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:458: pwm_Right0 = power;
	mov	_pwm_Right0,r4
;	robot.c:459: pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
	ret
L010004?:
;	robot.c:461: else if (forback == 2) {
	cjne	r2,#0x02,L010006?
	cjne	r3,#0x00,L010006?
;	robot.c:462: pwm_Left0 = power;
	mov	r2,_movecar_PARM_2
	mov	_pwm_Left0,r2
;	robot.c:463: pwm_Left1 = -1;
	mov	_pwm_Left1,#0xFF
;	robot.c:464: pwm_Right1 = power;
	mov	_pwm_Right1,r2
;	robot.c:465: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
L010006?:
	ret
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 0x1B
	db '[2J'
	db 0x00
__str_1:
	db 'frontL %f frontR %f backL %f backR %f command %1d'
	db 0x0D
	db 0x0A
	db 0x00
__str_2:
	db 0x0A
	db 'INTERSECTION'
	db 0x0A
	db 0x00
__str_3:
	db 0x0A
	db 0x0D
	db ' INTERSECTION'
	db 0x0A
	db 0x00
__str_4:
	db 'Intersection voltage v = %f'
	db 0x0D
	db 0x0A
	db 0x00

	CSEG

end
