;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Mon Apr 03 19:56:59 2017
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
	public _Timer2_ISR
	public _main
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
_main_v1_1_59:
	ds 4
_main_v2_1_59:
	ds 4
_main_sloc0_1_0:
	ds 2
_main_sloc1_1_0:
	ds 2
_main_sloc2_1_0:
	ds 2
_main_sloc3_1_0:
	ds 2
_main_sloc4_1_0:
	ds 2
_main_sloc5_1_0:
	ds 2
_main_sloc6_1_0:
	ds 4
_main_sloc7_1_0:
	ds 4
_linetrack_vleft_1_80:
	ds 4
_linetrack_vright_1_80:
	ds 4
_linetrack_sloc0_1_0:
	ds 4
_linetrack_sloc1_1_0:
	ds 4
_turncar_v_1_86:
	ds 4
_turncar_direction_1_86:
	ds 1
_uturn_vleft_1_96:
	ds 4
_uturn_vright_1_96:
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
_main_sloc8_1_0:
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
;	robot.c:8: volatile  char pwm_count=0;
	mov	_pwm_count,#0x00
;	robot.c:9: volatile  char mode = 0;
	mov	_mode,#0x00
;	robot.c:10: volatile  char pwm_both =0;
	mov	_pwm_both,#0x00
;	robot.c:11: volatile  char pwm_Left0 = 0; //p1.5
	mov	_pwm_Left0,#0x00
;	robot.c:12: volatile  char pwm_Left1 = 0; //p1.6
	mov	_pwm_Left1,#0x00
;	robot.c:13: volatile  char pwm_Right0 = 0; //p2.0
	mov	_pwm_Right0,#0x00
;	robot.c:14: volatile  char pwm_Right1 = 0; //p2.1
	mov	_pwm_Right1,#0x00
;	robot.c:15: volatile  char direction = 0; // 1 for back 0 for forward
	mov	_direction,#0x00
;	robot.c:17: volatile  char currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:18: volatile  char currentstate = 1;
	mov	_currentstate,#0x01
;	robot.c:21: volatile float time = 0.0f;
	mov	_time,#0x00
	mov	(_time + 1),#0x00
	mov	(_time + 2),#0x00
	mov	(_time + 3),#0x00
;	robot.c:22: volatile float distance = 0.0f;
	mov	_distance,#0x00
	mov	(_distance + 1),#0x00
	mov	(_distance + 2),#0x00
	mov	(_distance + 3),#0x00
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;v1                        Allocated with name '_main_v1_1_59'
;v2                        Allocated with name '_main_v2_1_59'
;sloc0                     Allocated with name '_main_sloc0_1_0'
;sloc1                     Allocated with name '_main_sloc1_1_0'
;sloc2                     Allocated with name '_main_sloc2_1_0'
;sloc3                     Allocated with name '_main_sloc3_1_0'
;sloc4                     Allocated with name '_main_sloc4_1_0'
;sloc5                     Allocated with name '_main_sloc5_1_0'
;sloc6                     Allocated with name '_main_sloc6_1_0'
;sloc7                     Allocated with name '_main_sloc7_1_0'
;------------------------------------------------------------
;	robot.c:24: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	using	0
;	robot.c:26: volatile float v1 = 0;
	mov	_main_v1_1_59,#0x00
	mov	(_main_v1_1_59 + 1),#0x00
	mov	(_main_v1_1_59 + 2),#0x00
	mov	(_main_v1_1_59 + 3),#0x00
;	robot.c:27: volatile float v2 = 0;
	mov	_main_v2_1_59,#0x00
	mov	(_main_v2_1_59 + 1),#0x00
	mov	(_main_v2_1_59 + 2),#0x00
	mov	(_main_v2_1_59 + 3),#0x00
;	robot.c:29: MOTOR_LEFT0 = 0;
	clr	_P1_5
;	robot.c:30: MOTOR_LEFT1 = 0;
	clr	_P1_6
;	robot.c:31: MOTOR_RIGHT0 = 0;
	clr	_P2_0
;	robot.c:32: MOTOR_RIGHT1 = 0;
	clr	_P2_1
;	robot.c:35: currentstate = 1;  	//1-FORWARD, 2-BACKWARDS, 3-STOPPED, 4-DEBUGGER
	mov	_currentstate,#0x01
;	robot.c:36: currentcmd = 0;		//0-NO COMMAND, 1-TURN LEFT, 2-TURN RIGHT, 3-FORWARDS, 4-BACKWARDS, 5-STOP, 6-UTURN
	mov	_currentcmd,#0x00
;	robot.c:39: printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
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
;	robot.c:42: InitPinADC(2, 3); // Configure P2.3 as analog input (tank1)
	mov	_InitPinADC_PARM_2,#0x03
	mov	dpl,#0x02
	lcall	_InitPinADC
;	robot.c:43: InitPinADC(2, 4); // Configure P2.4 as analog input	(tank1)
	mov	_InitPinADC_PARM_2,#0x04
	mov	dpl,#0x02
	lcall	_InitPinADC
;	robot.c:44: InitPinADC(2, 5); // Configure P2.5 as analog input (tank2)
	mov	_InitPinADC_PARM_2,#0x05
	mov	dpl,#0x02
	lcall	_InitPinADC
;	robot.c:45: InitPinADC(2, 6); // Configure P2.6 as analog input (tank2)
	mov	_InitPinADC_PARM_2,#0x06
	mov	dpl,#0x02
	lcall	_InitPinADC
;	robot.c:48: InitADC();	
	lcall	_InitADC
;	robot.c:51: while (1) {	
L002039?:
;	robot.c:54: currentcmd = readData(currentcmd); 
	mov	dpl,_currentcmd
	lcall	_readData
	mov	_currentcmd,dpl
;	robot.c:57: printf("frontL %f frontR %f backL %f backR %f command %1d, state %1d left0 %3d left1 %3d right0 %3d right1 %3d\r", Volts_at_Pin(TANK_FL),Volts_at_Pin(TANK_FR),Volts_at_Pin(TANK_RL),Volts_at_Pin(TANK_RR), currentcmd, currentstate, pwm_Left0, pwm_Left1, pwm_Right0, pwm_Right1);
	mov	_main_sloc5_1_0,_pwm_Right1
	mov	a,_pwm_Right1
	rlc	a
	subb	a,acc
	mov	(_main_sloc5_1_0 + 1),a
	mov	_main_sloc4_1_0,_pwm_Right0
	mov	a,_pwm_Right0
	rlc	a
	subb	a,acc
	mov	(_main_sloc4_1_0 + 1),a
	mov	_main_sloc3_1_0,_pwm_Left1
	mov	a,_pwm_Left1
	rlc	a
	subb	a,acc
	mov	(_main_sloc3_1_0 + 1),a
	mov	_main_sloc0_1_0,_pwm_Left0
	mov	a,_pwm_Left0
	rlc	a
	subb	a,acc
	mov	(_main_sloc0_1_0 + 1),a
	mov	_main_sloc1_1_0,_currentstate
	mov	a,_currentstate
	rlc	a
	subb	a,acc
	mov	(_main_sloc1_1_0 + 1),a
	mov	_main_sloc2_1_0,_currentcmd
	mov	a,_currentcmd
	rlc	a
	subb	a,acc
	mov	(_main_sloc2_1_0 + 1),a
	mov	dpl,#0x0E
	lcall	_Volts_at_Pin
	mov	r0,dpl
	mov	r1,dph
	mov	r6,b
	mov	r7,a
	mov	dpl,#0x0D
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	lcall	_Volts_at_Pin
	mov	_main_sloc6_1_0,dpl
	mov	(_main_sloc6_1_0 + 1),dph
	mov	(_main_sloc6_1_0 + 2),b
	mov	(_main_sloc6_1_0 + 3),a
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_main_sloc7_1_0,dpl
	mov	(_main_sloc7_1_0 + 1),dph
	mov	(_main_sloc7_1_0 + 2),b
	mov	(_main_sloc7_1_0 + 3),a
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar6
	push	_main_sloc5_1_0
	push	(_main_sloc5_1_0 + 1)
	push	_main_sloc4_1_0
	push	(_main_sloc4_1_0 + 1)
	push	_main_sloc3_1_0
	push	(_main_sloc3_1_0 + 1)
	push	_main_sloc0_1_0
	push	(_main_sloc0_1_0 + 1)
	push	_main_sloc1_1_0
	push	(_main_sloc1_1_0 + 1)
	push	_main_sloc2_1_0
	push	(_main_sloc2_1_0 + 1)
	push	ar0
	push	ar1
	push	ar6
	push	ar7
	push	_main_sloc6_1_0
	push	(_main_sloc6_1_0 + 1)
	push	(_main_sloc6_1_0 + 2)
	push	(_main_sloc6_1_0 + 3)
	push	_main_sloc7_1_0
	push	(_main_sloc7_1_0 + 1)
	push	(_main_sloc7_1_0 + 2)
	push	(_main_sloc7_1_0 + 3)
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xe1
	mov	sp,a
;	robot.c:60: Sonar_Reading();
	lcall	_Sonar_Reading
;	robot.c:61: if (distance < 7) {
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
	jz	L002005?
;	robot.c:62: currentstate = 3;		//code for testing
	mov	_currentstate,#0x03
;	robot.c:63: stopcar();
	lcall	_stopcar
;	robot.c:64: while (distance < 7) {
L002001?:
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
	jz	L002003?
;	robot.c:65: Sonar_Reading();
	lcall	_Sonar_Reading
	sjmp	L002001?
L002003?:
;	robot.c:67: currentstate = 1;		//code for testing
	mov	_currentstate,#0x01
L002005?:
;	robot.c:71: switch (currentstate) {
	mov	r2,_currentstate
	cjne	r2,#0x01,L002074?
	sjmp	L002006?
L002074?:
	cjne	r2,#0x02,L002075?
	sjmp	L002007?
L002075?:
;	robot.c:72: case FORWARD_STATE:
	cjne	r2,#0x03,L002009?
	sjmp	L002008?
L002006?:
;	robot.c:73: linetrack(0);	// forwards
	mov	dptr,#0x0000
	lcall	_linetrack
;	robot.c:75: v1 = Volts_at_Pin(TANK_FL);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	_main_v1_1_59,dpl
	mov	(_main_v1_1_59 + 1),dph
	mov	(_main_v1_1_59 + 2),b
	mov	(_main_v1_1_59 + 3),a
;	robot.c:76: v2 = Volts_at_Pin(TANK_FR);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_main_v2_1_59,dpl
	mov	(_main_v2_1_59 + 1),dph
	mov	(_main_v2_1_59 + 2),b
	mov	(_main_v2_1_59 + 3),a
;	robot.c:77: break;
;	robot.c:78: case REVERSE_STATE:
	sjmp	L002009?
L002007?:
;	robot.c:79: linetrack(1);	// backwards
	mov	dptr,#0x0001
	lcall	_linetrack
;	robot.c:81: v2 = Volts_at_Pin(TANK_RL);
	mov	dpl,#0x0D
	lcall	_Volts_at_Pin
	mov	_main_v2_1_59,dpl
	mov	(_main_v2_1_59 + 1),dph
	mov	(_main_v2_1_59 + 2),b
	mov	(_main_v2_1_59 + 3),a
;	robot.c:82: v1 = Volts_at_Pin(TANK_RR);
	mov	dpl,#0x0E
	lcall	_Volts_at_Pin
	mov	_main_v1_1_59,dpl
	mov	(_main_v1_1_59 + 1),dph
	mov	(_main_v1_1_59 + 2),b
	mov	(_main_v1_1_59 + 3),a
;	robot.c:83: break;
;	robot.c:84: case STOP_STATE:
	sjmp	L002009?
L002008?:
;	robot.c:85: stopcar();		// stop car
	lcall	_stopcar
;	robot.c:87: }
L002009?:
;	robot.c:90: switch (currentcmd) {
	mov	a,_currentcmd
	mov	r2,a
	jnb	acc.7,L002077?
	ljmp	L002036?
L002077?:
	clr	c
	mov	a,#(0x06 ^ 0x80)
	mov	b,r2
	xrl	b,#0x80
	subb	a,b
	jnc	L002078?
	ljmp	L002036?
L002078?:
	mov	a,r2
	add	a,r2
	add	a,r2
	mov	dptr,#L002079?
	jmp	@a+dptr
L002079?:
	ljmp	L002010?
	ljmp	L002024?
	ljmp	L002028?
	ljmp	L002032?
	ljmp	L002033?
	ljmp	L002034?
	ljmp	L002035?
;	robot.c:92: case CMD_NONE:
L002010?:
;	robot.c:94: if ((currentstate-1) ? 
	mov	r2,_currentstate
	mov	a,_currentstate
	rlc	a
	subb	a,acc
	mov	r3,a
	dec	r2
	cjne	r2,#0xff,L002080?
	dec	r3
L002080?:
	mov	a,r2
	orl	a,r3
	jz	L002043?
;	robot.c:95: (v1 > 1.2 && v2 > 1.2) :
	mov	a,#0x9A
	push	acc
	mov	a,#0x99
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v1_1_59
	mov	dph,(_main_v1_1_59 + 1)
	mov	b,(_main_v1_1_59 + 2)
	mov	a,(_main_v1_1_59 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L002045?
	mov	a,#0x9A
	push	acc
	mov	a,#0x99
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v2_1_59
	mov	dph,(_main_v2_1_59 + 1)
	mov	b,(_main_v2_1_59 + 2)
	mov	a,(_main_v2_1_59 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L002046?
L002045?:
	mov	r2,#0x00
	sjmp	L002047?
L002046?:
	mov	r2,#0x01
L002047?:
	mov	a,r2
	add	a,#0xff
	mov	_main_sloc8_1_0,c
	sjmp	L002044?
L002043?:
;	robot.c:96: (v1 > 0.7 && v2 > 1)) {
	mov	a,#0x33
	push	acc
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v1_1_59
	mov	dph,(_main_v1_1_59 + 1)
	mov	b,(_main_v1_1_59 + 2)
	mov	a,(_main_v1_1_59 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L002048?
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v2_1_59
	mov	dph,(_main_v2_1_59 + 1)
	mov	b,(_main_v2_1_59 + 2)
	mov	a,(_main_v2_1_59 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L002049?
L002048?:
	mov	r2,#0x00
	sjmp	L002050?
L002049?:
	mov	r2,#0x01
L002050?:
	mov	a,r2
	add	a,#0xff
	mov	_main_sloc8_1_0,c
L002044?:
	jb	_main_sloc8_1_0,L002086?
	ljmp	L002039?
L002086?:
;	robot.c:97: printf("\nINTERSECTION\n");
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
;	robot.c:99: if (currentstate == 1) {
	mov	a,#0x01
	cjne	a,_currentstate,L002020?
;	robot.c:100: if (Volts_at_Pin(TANK_RL)>Volts_at_Pin(TANK_RR)) {
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
	jz	L002012?
;	robot.c:101: pwm_Left1 = 50;
	mov	_pwm_Left1,#0x32
;	robot.c:102: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:103: pwm_Right0 = 30;
	mov	_pwm_Right0,#0x1E
;	robot.c:104: pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
	sjmp	L002021?
L002012?:
;	robot.c:107: pwm_Left1 = 30;
	mov	_pwm_Left1,#0x1E
;	robot.c:108: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:109: pwm_Right0 = 50;
	mov	_pwm_Right0,#0x32
;	robot.c:110: pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
	sjmp	L002021?
L002020?:
;	robot.c:112: } else if (currentstate == 2) {
	mov	a,#0x02
	cjne	a,_currentstate,L002021?
;	robot.c:113: if (Volts_at_Pin(TANK_FL)>Volts_at_Pin(TANK_FR)) {
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
	jz	L002015?
;	robot.c:114: pwm_Left0 = 50;
	mov	_pwm_Left0,#0x32
;	robot.c:115: pwm_Left1 = -1;
	mov	_pwm_Left1,#0xFF
;	robot.c:116: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
;	robot.c:117: pwm_Right1 = 30;
	mov	_pwm_Right1,#0x1E
	sjmp	L002021?
L002015?:
;	robot.c:120: pwm_Left0 = 30;
	mov	_pwm_Left0,#0x1E
;	robot.c:121: pwm_Left1 = -1;
	mov	_pwm_Left1,#0xFF
;	robot.c:122: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
;	robot.c:123: pwm_Right1 = 50;
	mov	_pwm_Right1,#0x32
L002021?:
;	robot.c:127: waitms(1500);
	mov	dptr,#0x05DC
	lcall	_waitms
;	robot.c:129: break;
	ljmp	L002039?
;	robot.c:131: case CMD_LEFT:
L002024?:
;	robot.c:133: printf("Turn left at the next intersection\n");
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
;	robot.c:134: if (v1 > 0.7 && v2 >1)  {
	mov	a,#0x33
	push	acc
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v1_1_59
	mov	dph,(_main_v1_1_59 + 1)
	mov	b,(_main_v1_1_59 + 2)
	mov	a,(_main_v1_1_59 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L002093?
	ljmp	L002039?
L002093?:
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v2_1_59
	mov	dph,(_main_v2_1_59 + 1)
	mov	b,(_main_v2_1_59 + 2)
	mov	a,(_main_v2_1_59 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L002094?
	ljmp	L002039?
L002094?:
;	robot.c:135: printf("\n\r INTERSECTION\n");
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	robot.c:140: turncar(currentstate);
	mov	r2,_currentstate
	mov	a,_currentstate
	rlc	a
	subb	a,acc
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	lcall	_turncar
;	robot.c:141: currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:143: break;
	ljmp	L002039?
;	robot.c:146: case CMD_RIGHT:
L002028?:
;	robot.c:148: printf("\nTurn right at the next intersection\n");
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	robot.c:149: if (v1 > 0.7 && v2 >1) {
	mov	a,#0x33
	push	acc
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v1_1_59
	mov	dph,(_main_v1_1_59 + 1)
	mov	b,(_main_v1_1_59 + 2)
	mov	a,(_main_v1_1_59 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L002095?
	ljmp	L002039?
L002095?:
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v2_1_59
	mov	dph,(_main_v2_1_59 + 1)
	mov	b,(_main_v2_1_59 + 2)
	mov	a,(_main_v2_1_59 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L002096?
	ljmp	L002039?
L002096?:
;	robot.c:150: printf("\n\r INTERSECTION\n");
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	robot.c:152: turncar(currentstate + 2); //1 = right
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
;	robot.c:153: currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:155: break;
	ljmp	L002039?
;	robot.c:158: case CMD_FORWARD:
L002032?:
;	robot.c:160: printf("\nGO!\n");
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	robot.c:161: currentstate = 1;
	mov	_currentstate,#0x01
;	robot.c:162: currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:163: break;
	ljmp	L002039?
;	robot.c:166: case CMD_REVERSE:
L002033?:
;	robot.c:168: printf("\nReverse Reverse!\n");
	mov	a,#__str_7
	push	acc
	mov	a,#(__str_7 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	robot.c:169: currentstate = 2;
	mov	_currentstate,#0x02
;	robot.c:170: currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:171: break;
	ljmp	L002039?
;	robot.c:174: case CMD_STOP:
L002034?:
;	robot.c:176: printf("\nHALT peasants!\n");
	mov	a,#__str_8
	push	acc
	mov	a,#(__str_8 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	robot.c:177: currentstate = 3;
	mov	_currentstate,#0x03
;	robot.c:178: currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:179: break;
	ljmp	L002039?
;	robot.c:182: case CMD_UTURN:
L002035?:
;	robot.c:183: uturn();
	lcall	_uturn
;	robot.c:184: printf("\nUTURN\n");
	mov	a,#__str_9
	push	acc
	mov	a,#(__str_9 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	robot.c:185: currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:186: break;
	ljmp	L002039?
;	robot.c:189: default: 
L002036?:
;	robot.c:190: currentstate = 1;
	mov	_currentstate,#0x01
;	robot.c:191: }
	ljmp	L002039?
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	robot.c:195: void Timer2_ISR (void) interrupt 5 {
;	-----------------------------------------
;	 function Timer2_ISR
;	-----------------------------------------
_Timer2_ISR:
	push	acc
	push	b
	push	psw
	mov	psw,#0x00
;	robot.c:196: TF2H = 0; // Clear Timer2 interrupt flag
	clr	_TF2H
;	robot.c:198: pwm_count++;
	inc	_pwm_count
;	robot.c:199: if(pwm_count>100) pwm_count=0;
	clr	c
	mov	a,#(0x64 ^ 0x80)
	mov	b,_pwm_count
	xrl	b,#0x80
	subb	a,b
	jnc	L003002?
	mov	_pwm_count,#0x00
L003002?:
;	robot.c:202: MOTOR_LEFT0 = pwm_count > pwm_Left0 ? 0 : 1; //p1.5
	clr	c
	mov	a,_pwm_Left0
	xrl	a,#0x80
	mov	b,_pwm_count
	xrl	b,#0x80
	subb	a,b
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P1_5,c
;	robot.c:203: MOTOR_LEFT1 = pwm_count > pwm_Left1 ? 0 : 1; //p1.6
	clr	c
	mov	a,_pwm_Left1
	xrl	a,#0x80
	mov	b,_pwm_count
	xrl	b,#0x80
	subb	a,b
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P1_6,c
;	robot.c:204: MOTOR_RIGHT0 = pwm_count > pwm_Right0 ? 0 : 1; //p2.0
	clr	c
	mov	a,_pwm_Right0
	xrl	a,#0x80
	mov	b,_pwm_count
	xrl	b,#0x80
	subb	a,b
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P2_0,c
;	robot.c:205: MOTOR_RIGHT1 = pwm_count > pwm_Right1 ? 0 : 1; //p2.1
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
;Allocation info for local variables in function 'readData'
;------------------------------------------------------------
;prevcommand               Allocated to registers r2 
;command                   Allocated to registers r3 
;------------------------------------------------------------
;	robot.c:298: unsigned char readData(unsigned char prevcommand) {
;	-----------------------------------------
;	 function readData
;	-----------------------------------------
_readData:
	mov	r2,dpl
;	robot.c:299: unsigned char command = prevcommand;
	mov	ar3,r2
;	robot.c:300: if (!COMMAND_PIN) {
	jnb	_P1_1,L004028?
	ljmp	L004010?
L004028?:
;	robot.c:302: while (!COMMAND_PIN);
L004001?:
	jnb	_P1_1,L004001?
;	robot.c:303: P1_4 = 1;
	setb	_P1_4
;	robot.c:304: waitms((int)(CMDFRQ + CMDFRQ/2));
	mov	dptr,#0x0060
	push	ar2
	lcall	_waitms
;	robot.c:305: P1_4 = 0;
	clr	_P1_4
;	robot.c:306: command |= COMMAND_PIN<<2;
	mov	c,_P1_1
	clr	a
	rlc	a
	add	a,acc
	add	a,acc
	mov	r3,a
;	robot.c:307: waitms(CMDFRQ);
	mov	dptr,#0x0040
	push	ar3
	lcall	_waitms
	pop	ar3
;	robot.c:308: P1_4 = 1;
	setb	_P1_4
;	robot.c:309: command |= COMMAND_PIN<<1;
	mov	c,_P1_1
	clr	a
	rlc	a
	add	a,acc
	orl	ar3,a
;	robot.c:310: waitms(CMDFRQ);
	mov	dptr,#0x0040
	push	ar3
	lcall	_waitms
	pop	ar3
	pop	ar2
;	robot.c:311: P1_4 = 0;
	clr	_P1_4
;	robot.c:312: command |= COMMAND_PIN;
	mov	c,_P1_1
	clr	a
	rlc	a
	mov	r4,a
	orl	ar3,a
;	robot.c:313: while (!COMMAND_PIN);
L004004?:
	jnb	_P1_1,L004004?
;	robot.c:317: (command & 0x01) ? '1' : '0');
	mov	a,r3
	jnb	acc.0,L004013?
	mov	r4,#0x31
	sjmp	L004014?
L004013?:
	mov	r4,#0x30
L004014?:
	mov	a,r4
	rlc	a
	subb	a,acc
	mov	r5,a
;	robot.c:316: (command & 0x02) ? '1' : '0',
	mov	a,r3
	jnb	acc.1,L004015?
	mov	r6,#0x31
	sjmp	L004016?
L004015?:
	mov	r6,#0x30
L004016?:
	mov	a,r6
	rlc	a
	subb	a,acc
	mov	r7,a
;	robot.c:315: (command & 0x04) ? '1' : '0',
	mov	a,r3
	jnb	acc.2,L004017?
	mov	r0,#0x31
	sjmp	L004018?
L004017?:
	mov	r0,#0x30
L004018?:
	mov	a,r0
	rlc	a
	subb	a,acc
	mov	r1,a
;	robot.c:314: printf("\nCommand received: 0b_0%c%c%c\n", 
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	a,#__str_10
	push	acc
	mov	a,#(__str_10 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf7
	mov	sp,a
	pop	ar3
	pop	ar2
;	robot.c:318: if (command > 6) command = prevcommand; 
	mov	a,r3
	add	a,#0xff - 0x06
	jnc	L004010?
	mov	ar3,r2
L004010?:
;	robot.c:321: return command;
	mov	dpl,r3
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'linetrack'
;------------------------------------------------------------
;forwardbackward           Allocated to registers r2 r3 
;vleft                     Allocated with name '_linetrack_vleft_1_80'
;vright                    Allocated with name '_linetrack_vright_1_80'
;sloc0                     Allocated with name '_linetrack_sloc0_1_0'
;sloc1                     Allocated with name '_linetrack_sloc1_1_0'
;------------------------------------------------------------
;	robot.c:328: void linetrack (int forwardbackward) {
;	-----------------------------------------
;	 function linetrack
;	-----------------------------------------
_linetrack:
	mov	r2,dpl
	mov	r3,dph
;	robot.c:336: if (forwardbackward == 0) {
	mov	a,r2
	orl	a,r3
	jz	L005010?
	ljmp	L005004?
L005010?:
;	robot.c:337: vleft=Volts_at_Pin(TANK_FL);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	_linetrack_vleft_1_80,dpl
	mov	(_linetrack_vleft_1_80 + 1),dph
	mov	(_linetrack_vleft_1_80 + 2),b
	mov	(_linetrack_vleft_1_80 + 3),a
;	robot.c:338: vright=Volts_at_Pin(TANK_FR);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_linetrack_vright_1_80,dpl
	mov	(_linetrack_vright_1_80 + 1),dph
	mov	(_linetrack_vright_1_80 + 2),b
	mov	(_linetrack_vright_1_80 + 3),a
;	robot.c:341: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:342: pwm_Left1 = vright*vright*75/(vright*vright+vleft*vleft);
	push	_linetrack_vright_1_80
	push	(_linetrack_vright_1_80 + 1)
	push	(_linetrack_vright_1_80 + 2)
	push	(_linetrack_vright_1_80 + 3)
	mov	dpl,_linetrack_vright_1_80
	mov	dph,(_linetrack_vright_1_80 + 1)
	mov	b,(_linetrack_vright_1_80 + 2)
	mov	a,(_linetrack_vright_1_80 + 3)
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
	push	_linetrack_vright_1_80
	push	(_linetrack_vright_1_80 + 1)
	push	(_linetrack_vright_1_80 + 2)
	push	(_linetrack_vright_1_80 + 3)
	mov	dpl,_linetrack_vright_1_80
	mov	dph,(_linetrack_vright_1_80 + 1)
	mov	b,(_linetrack_vright_1_80 + 2)
	mov	a,(_linetrack_vright_1_80 + 3)
	lcall	___fsmul
	mov	_linetrack_sloc1_1_0,dpl
	mov	(_linetrack_sloc1_1_0 + 1),dph
	mov	(_linetrack_sloc1_1_0 + 2),b
	mov	(_linetrack_sloc1_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_linetrack_vleft_1_80
	push	(_linetrack_vleft_1_80 + 1)
	push	(_linetrack_vleft_1_80 + 2)
	push	(_linetrack_vleft_1_80 + 3)
	mov	dpl,_linetrack_vleft_1_80
	mov	dph,(_linetrack_vleft_1_80 + 1)
	mov	b,(_linetrack_vleft_1_80 + 2)
	mov	a,(_linetrack_vleft_1_80 + 3)
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
;	robot.c:343: pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
;	robot.c:344: pwm_Right0 = vleft*vleft*75/(vright*vright+vleft*vleft);
	push	_linetrack_vleft_1_80
	push	(_linetrack_vleft_1_80 + 1)
	push	(_linetrack_vleft_1_80 + 2)
	push	(_linetrack_vleft_1_80 + 3)
	mov	dpl,_linetrack_vleft_1_80
	mov	dph,(_linetrack_vleft_1_80 + 1)
	mov	b,(_linetrack_vleft_1_80 + 2)
	mov	a,(_linetrack_vleft_1_80 + 3)
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
	push	_linetrack_vright_1_80
	push	(_linetrack_vright_1_80 + 1)
	push	(_linetrack_vright_1_80 + 2)
	push	(_linetrack_vright_1_80 + 3)
	mov	dpl,_linetrack_vright_1_80
	mov	dph,(_linetrack_vright_1_80 + 1)
	mov	b,(_linetrack_vright_1_80 + 2)
	mov	a,(_linetrack_vright_1_80 + 3)
	lcall	___fsmul
	mov	_linetrack_sloc0_1_0,dpl
	mov	(_linetrack_sloc0_1_0 + 1),dph
	mov	(_linetrack_sloc0_1_0 + 2),b
	mov	(_linetrack_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_linetrack_vleft_1_80
	push	(_linetrack_vleft_1_80 + 1)
	push	(_linetrack_vleft_1_80 + 2)
	push	(_linetrack_vleft_1_80 + 3)
	mov	dpl,_linetrack_vleft_1_80
	mov	dph,(_linetrack_vleft_1_80 + 1)
	mov	b,(_linetrack_vleft_1_80 + 2)
	mov	a,(_linetrack_vleft_1_80 + 3)
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
;	robot.c:345: } else if (forwardbackward == 1) {
	cjne	r2,#0x01,L005011?
	cjne	r3,#0x00,L005011?
	sjmp	L005012?
L005011?:
	ret
L005012?:
;	robot.c:348: vleft=Volts_at_Pin(TANK_RL);
	mov	dpl,#0x0D
	lcall	_Volts_at_Pin
	mov	_linetrack_vleft_1_80,dpl
	mov	(_linetrack_vleft_1_80 + 1),dph
	mov	(_linetrack_vleft_1_80 + 2),b
	mov	(_linetrack_vleft_1_80 + 3),a
;	robot.c:349: vright=Volts_at_Pin(TANK_RR);
	mov	dpl,#0x0E
	lcall	_Volts_at_Pin
	mov	_linetrack_vright_1_80,dpl
	mov	(_linetrack_vright_1_80 + 1),dph
	mov	(_linetrack_vright_1_80 + 2),b
	mov	(_linetrack_vright_1_80 + 3),a
;	robot.c:352: pwm_Left1 = -1;
	mov	_pwm_Left1,#0xFF
;	robot.c:353: pwm_Left0 = vright*vright*75/(vright*vright+vleft*vleft);
	push	_linetrack_vright_1_80
	push	(_linetrack_vright_1_80 + 1)
	push	(_linetrack_vright_1_80 + 2)
	push	(_linetrack_vright_1_80 + 3)
	mov	dpl,_linetrack_vright_1_80
	mov	dph,(_linetrack_vright_1_80 + 1)
	mov	b,(_linetrack_vright_1_80 + 2)
	mov	a,(_linetrack_vright_1_80 + 3)
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
	push	_linetrack_vright_1_80
	push	(_linetrack_vright_1_80 + 1)
	push	(_linetrack_vright_1_80 + 2)
	push	(_linetrack_vright_1_80 + 3)
	mov	dpl,_linetrack_vright_1_80
	mov	dph,(_linetrack_vright_1_80 + 1)
	mov	b,(_linetrack_vright_1_80 + 2)
	mov	a,(_linetrack_vright_1_80 + 3)
	lcall	___fsmul
	mov	_linetrack_sloc1_1_0,dpl
	mov	(_linetrack_sloc1_1_0 + 1),dph
	mov	(_linetrack_sloc1_1_0 + 2),b
	mov	(_linetrack_sloc1_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_linetrack_vleft_1_80
	push	(_linetrack_vleft_1_80 + 1)
	push	(_linetrack_vleft_1_80 + 2)
	push	(_linetrack_vleft_1_80 + 3)
	mov	dpl,_linetrack_vleft_1_80
	mov	dph,(_linetrack_vleft_1_80 + 1)
	mov	b,(_linetrack_vleft_1_80 + 2)
	mov	a,(_linetrack_vleft_1_80 + 3)
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
;	robot.c:354: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
;	robot.c:355: pwm_Right1 = vleft*vleft*75/(vright*vright+vleft*vleft);
	push	_linetrack_vleft_1_80
	push	(_linetrack_vleft_1_80 + 1)
	push	(_linetrack_vleft_1_80 + 2)
	push	(_linetrack_vleft_1_80 + 3)
	mov	dpl,_linetrack_vleft_1_80
	mov	dph,(_linetrack_vleft_1_80 + 1)
	mov	b,(_linetrack_vleft_1_80 + 2)
	mov	a,(_linetrack_vleft_1_80 + 3)
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
	push	_linetrack_vright_1_80
	push	(_linetrack_vright_1_80 + 1)
	push	(_linetrack_vright_1_80 + 2)
	push	(_linetrack_vright_1_80 + 3)
	mov	dpl,_linetrack_vright_1_80
	mov	dph,(_linetrack_vright_1_80 + 1)
	mov	b,(_linetrack_vright_1_80 + 2)
	mov	a,(_linetrack_vright_1_80 + 3)
	lcall	___fsmul
	mov	_linetrack_sloc1_1_0,dpl
	mov	(_linetrack_sloc1_1_0 + 1),dph
	mov	(_linetrack_sloc1_1_0 + 2),b
	mov	(_linetrack_sloc1_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_linetrack_vleft_1_80
	push	(_linetrack_vleft_1_80 + 1)
	push	(_linetrack_vleft_1_80 + 2)
	push	(_linetrack_vleft_1_80 + 3)
	mov	dpl,_linetrack_vleft_1_80
	mov	dph,(_linetrack_vleft_1_80 + 1)
	mov	b,(_linetrack_vleft_1_80 + 2)
	mov	a,(_linetrack_vleft_1_80 + 3)
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
;	robot.c:363: void stopcar(void) {
;	-----------------------------------------
;	 function stopcar
;	-----------------------------------------
_stopcar:
;	robot.c:365: pwm_Left1 = -1;
	mov	_pwm_Left1,#0xFF
;	robot.c:366: pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
;	robot.c:367: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:368: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'turncar'
;------------------------------------------------------------
;leftright                 Allocated to registers r2 r3 
;v                         Allocated with name '_turncar_v_1_86'
;direction                 Allocated with name '_turncar_direction_1_86'
;------------------------------------------------------------
;	robot.c:374: void turncar (int leftright) {
;	-----------------------------------------
;	 function turncar
;	-----------------------------------------
_turncar:
	mov	r2,dpl
	mov	r3,dph
;	robot.c:383: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:384: pwm_Left1 = -1;
	mov	_pwm_Left1,#0xFF
;	robot.c:385: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
;	robot.c:386: pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
;	robot.c:388: direction = currentstate - 1;
	mov	a,_currentstate
	dec	a
	mov	_turncar_direction_1_86,a
;	robot.c:391: if (leftright == 1) {
	cjne	r2,#0x01,L007062?
	cjne	r3,#0x00,L007062?
	sjmp	L007063?
L007062?:
	ljmp	L007022?
L007063?:
;	robot.c:393: pwm_Right0 = 100;
	mov	_pwm_Right0,#0x64
;	robot.c:396: v = direction ? Volts_at_Pin(TANK_FR) : Volts_at_Pin(TANK_RR);
	mov	a,_turncar_direction_1_86
	jz	L007026?
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	sjmp	L007027?
L007026?:
	mov	dpl,#0x0E
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
L007027?:
	mov	_turncar_v_1_86,r4
	mov	(_turncar_v_1_86 + 1),r5
	mov	(_turncar_v_1_86 + 2),r6
	mov	(_turncar_v_1_86 + 3),r7
;	robot.c:398: while (v < 1.2) {
L007001?:
	mov	a,#0x9A
	push	acc
	mov	a,#0x99
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_turncar_v_1_86
	mov	dph,(_turncar_v_1_86 + 1)
	mov	b,(_turncar_v_1_86 + 2)
	mov	a,(_turncar_v_1_86 + 3)
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r4
	jz	L007003?
;	robot.c:400: v = direction ? Volts_at_Pin(TANK_FR) : Volts_at_Pin(TANK_RR);
	mov	a,_turncar_direction_1_86
	jz	L007028?
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	sjmp	L007029?
L007028?:
	mov	dpl,#0x0E
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
L007029?:
	mov	_turncar_v_1_86,r4
	mov	(_turncar_v_1_86 + 1),r5
	mov	(_turncar_v_1_86 + 2),r6
	mov	(_turncar_v_1_86 + 3),r7
;	robot.c:401: printf ("\nv = %f\r\n", v);
	push	_turncar_v_1_86
	push	(_turncar_v_1_86 + 1)
	push	(_turncar_v_1_86 + 2)
	push	(_turncar_v_1_86 + 3)
	mov	a,#__str_11
	push	acc
	mov	a,#(__str_11 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	sjmp	L007001?
L007003?:
;	robot.c:405: waitms(300);
	mov	dptr,#0x012C
	lcall	_waitms
;	robot.c:408: pwm_Right0 = -1; 
	mov	_pwm_Right0,#0xFF
	ret
L007022?:
;	robot.c:412: else if (leftright == 3) {
	cjne	r2,#0x03,L007067?
	cjne	r3,#0x00,L007067?
	sjmp	L007068?
L007067?:
	ljmp	L007019?
L007068?:
;	robot.c:414: pwm_Left1 = 75;
	mov	_pwm_Left1,#0x4B
;	robot.c:415: waitms(200);
	mov	dptr,#0x00C8
	lcall	_waitms
;	robot.c:418: v = direction ? Volts_at_Pin(TANK_FL) : Volts_at_Pin(TANK_RL);
	mov	a,_turncar_direction_1_86
	jz	L007030?
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	sjmp	L007031?
L007030?:
	mov	dpl,#0x0D
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
L007031?:
	mov	_turncar_v_1_86,r4
	mov	(_turncar_v_1_86 + 1),r5
	mov	(_turncar_v_1_86 + 2),r6
	mov	(_turncar_v_1_86 + 3),r7
;	robot.c:420: while (v < 1.2) {
L007004?:
	mov	a,#0x9A
	push	acc
	mov	a,#0x99
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_turncar_v_1_86
	mov	dph,(_turncar_v_1_86 + 1)
	mov	b,(_turncar_v_1_86 + 2)
	mov	a,(_turncar_v_1_86 + 3)
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r4
	jz	L007006?
;	robot.c:422: v = direction ? Volts_at_Pin(TANK_FL) : Volts_at_Pin(TANK_RL);
	mov	a,_turncar_direction_1_86
	jz	L007032?
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	sjmp	L007033?
L007032?:
	mov	dpl,#0x0D
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
L007033?:
	mov	_turncar_v_1_86,r4
	mov	(_turncar_v_1_86 + 1),r5
	mov	(_turncar_v_1_86 + 2),r6
	mov	(_turncar_v_1_86 + 3),r7
;	robot.c:423: printf ("\nv = %f\r\n", v);
	push	_turncar_v_1_86
	push	(_turncar_v_1_86 + 1)
	push	(_turncar_v_1_86 + 2)
	push	(_turncar_v_1_86 + 3)
	mov	a,#__str_11
	push	acc
	mov	a,#(__str_11 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	sjmp	L007004?
L007006?:
;	robot.c:427: pwm_Left1 = -1; 
	mov	_pwm_Left1,#0xFF
	ret
L007019?:
;	robot.c:431: else if (leftright == 2) {
	cjne	r2,#0x02,L007072?
	cjne	r3,#0x00,L007072?
	sjmp	L007073?
L007072?:
	ljmp	L007016?
L007073?:
;	robot.c:433: pwm_Right1 = 100;
	mov	_pwm_Right1,#0x64
;	robot.c:436: v = direction ? Volts_at_Pin(TANK_FR) : Volts_at_Pin(TANK_RR);
	mov	a,_turncar_direction_1_86
	jz	L007034?
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	sjmp	L007035?
L007034?:
	mov	dpl,#0x0E
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
L007035?:
	mov	_turncar_v_1_86,r4
	mov	(_turncar_v_1_86 + 1),r5
	mov	(_turncar_v_1_86 + 2),r6
	mov	(_turncar_v_1_86 + 3),r7
;	robot.c:438: while (v < 0.9) {
L007007?:
	mov	a,#0x66
	push	acc
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_turncar_v_1_86
	mov	dph,(_turncar_v_1_86 + 1)
	mov	b,(_turncar_v_1_86 + 2)
	mov	a,(_turncar_v_1_86 + 3)
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r4
	jz	L007009?
;	robot.c:440: v = direction ? Volts_at_Pin(TANK_FR) : Volts_at_Pin(TANK_RR);
	mov	a,_turncar_direction_1_86
	jz	L007036?
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	sjmp	L007037?
L007036?:
	mov	dpl,#0x0E
	lcall	_Volts_at_Pin
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
L007037?:
	mov	_turncar_v_1_86,r4
	mov	(_turncar_v_1_86 + 1),r5
	mov	(_turncar_v_1_86 + 2),r6
	mov	(_turncar_v_1_86 + 3),r7
;	robot.c:441: printf ("\nv = %f\r\n", v);
	push	_turncar_v_1_86
	push	(_turncar_v_1_86 + 1)
	push	(_turncar_v_1_86 + 2)
	push	(_turncar_v_1_86 + 3)
	mov	a,#__str_11
	push	acc
	mov	a,#(__str_11 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	sjmp	L007007?
L007009?:
;	robot.c:445: waitms(300);
	mov	dptr,#0x012C
	lcall	_waitms
;	robot.c:448: pwm_Right1 = -1; 
	mov	_pwm_Right1,#0xFF
	ret
L007016?:
;	robot.c:452: else if (leftright == 4) {
	cjne	r2,#0x04,L007077?
	cjne	r3,#0x00,L007077?
	sjmp	L007078?
L007077?:
	ret
L007078?:
;	robot.c:454: pwm_Left0 = 75;
	mov	_pwm_Left0,#0x4B
;	robot.c:455: waitms(200);
	mov	dptr,#0x00C8
	lcall	_waitms
;	robot.c:458: v = direction ? Volts_at_Pin(TANK_FL) : Volts_at_Pin(TANK_RL);
	mov	a,_turncar_direction_1_86
	jz	L007038?
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	sjmp	L007039?
L007038?:
	mov	dpl,#0x0D
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
L007039?:
	mov	_turncar_v_1_86,r2
	mov	(_turncar_v_1_86 + 1),r3
	mov	(_turncar_v_1_86 + 2),r4
	mov	(_turncar_v_1_86 + 3),r5
;	robot.c:460: while (v < 0.9) {
L007010?:
	mov	a,#0x66
	push	acc
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_turncar_v_1_86
	mov	dph,(_turncar_v_1_86 + 1)
	mov	b,(_turncar_v_1_86 + 2)
	mov	a,(_turncar_v_1_86 + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L007012?
;	robot.c:462: v = direction ? Volts_at_Pin(TANK_FL) : Volts_at_Pin(TANK_RL);
	mov	a,_turncar_direction_1_86
	jz	L007040?
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	sjmp	L007041?
L007040?:
	mov	dpl,#0x0D
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
L007041?:
	mov	_turncar_v_1_86,r2
	mov	(_turncar_v_1_86 + 1),r3
	mov	(_turncar_v_1_86 + 2),r4
	mov	(_turncar_v_1_86 + 3),r5
;	robot.c:463: printf ("\nv = %f\r\n", v);
	push	_turncar_v_1_86
	push	(_turncar_v_1_86 + 1)
	push	(_turncar_v_1_86 + 2)
	push	(_turncar_v_1_86 + 3)
	mov	a,#__str_11
	push	acc
	mov	a,#(__str_11 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	sjmp	L007010?
L007012?:
;	robot.c:467: pwm_Left0 = -1; 
	mov	_pwm_Left0,#0xFF
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uturn'
;------------------------------------------------------------
;vleft                     Allocated with name '_uturn_vleft_1_96'
;vright                    Allocated with name '_uturn_vright_1_96'
;------------------------------------------------------------
;	robot.c:474: void uturn(void) {
;	-----------------------------------------
;	 function uturn
;	-----------------------------------------
_uturn:
;	robot.c:478: vleft = Volts_at_Pin(TANK_FL);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	_uturn_vleft_1_96,dpl
	mov	(_uturn_vleft_1_96 + 1),dph
	mov	(_uturn_vleft_1_96 + 2),b
	mov	(_uturn_vleft_1_96 + 3),a
;	robot.c:479: vright = Volts_at_Pin(TANK_FR);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_uturn_vright_1_96,dpl
	mov	(_uturn_vright_1_96 + 1),dph
	mov	(_uturn_vright_1_96 + 2),b
	mov	(_uturn_vright_1_96 + 3),a
;	robot.c:482: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:483: pwm_Left1 = 50;
	mov	_pwm_Left1,#0x32
;	robot.c:484: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
;	robot.c:485: pwm_Right1 = 50;
	mov	_pwm_Right1,#0x32
;	robot.c:488: waitms(3000);
	mov	dptr,#0x0BB8
	lcall	_waitms
;	robot.c:490: while ((Volts_at_Pin(TANK_FL)-Volts_at_Pin(TANK_FR))<-0.3 || (Volts_at_Pin(TANK_FL)-Volts_at_Pin(TANK_FR))>0.3);
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
;	robot.c:516: void Sonar_Reading(void)
;	-----------------------------------------
;	 function Sonar_Reading
;	-----------------------------------------
_Sonar_Reading:
;	robot.c:519: TL0=0; 
	mov	_TL0,#0x00
;	robot.c:520: TH0=0;
	mov	_TH0,#0x00
;	robot.c:521: TF0=0;
	clr	_TF0
;	robot.c:522: overflow_count=0;
	mov	_overflow_count,#0x00
;	robot.c:525: Trigger = 0; 
	clr	_P0_6
;	robot.c:526: Timer3us(2);
	mov	dpl,#0x02
	lcall	_Timer3us
;	robot.c:527: Trigger = 1; // turn on trig
	setb	_P0_6
;	robot.c:528: Timer3us(10);//10us delay 
	mov	dpl,#0x0A
	lcall	_Timer3us
;	robot.c:529: Trigger = 0; // trun off trig 
	clr	_P0_6
;	robot.c:530: while(Echo!=0); // Wait for the signal to be zero
L009001?:
	jb	_P0_1,L009001?
;	robot.c:531: while(Echo!=1); // Wait for the signal to be one
L009004?:
	jnb	_P0_1,L009004?
;	robot.c:535: TR0=1; // Start the timer
	setb	_TR0
;	robot.c:536: while(Echo!=0) // Wait for the signal to be zero
L009009?:
	jnb	_P0_1,L009011?
;	robot.c:538: if(TF0==1) // Did the 16-bit timer overflow?
;	robot.c:540: TF0=0;
	jbc	_TF0,L009023?
	sjmp	L009009?
L009023?:
;	robot.c:541: overflow_count++;
	inc	_overflow_count
	sjmp	L009009?
L009011?:
;	robot.c:544: TR0=0; // Stop timer 0, the 24-bit number [overflow_count-TH0-TL0] has the period!
	clr	_TR0
;	robot.c:545: time=(overflow_count*65536.0+TH0*256.0+TL0)*(12.0/SYSCLK);
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
;	robot.c:546: distance = ((time/2.0f)/29.1f)*100000;
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
;	robot.c:548: printf( "\r\n p=%fcm\n" , distance);
	push	_distance
	push	(_distance + 1)
	push	(_distance + 2)
	push	(_distance + 3)
	mov	a,#__str_12
	push	acc
	mov	a,#(__str_12 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	ret
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 0x1B
	db '[2J'
	db 0x00
__str_1:
	db 'frontL %f frontR %f backL %f backR %f command %1d, state %1d'
	db ' left0 %3d left1 %3d right0 %3d right1 %3d'
	db 0x0D
	db 0x00
__str_2:
	db 0x0A
	db 'INTERSECTION'
	db 0x0A
	db 0x00
__str_3:
	db 'Turn left at the next intersection'
	db 0x0A
	db 0x00
__str_4:
	db 0x0A
	db 0x0D
	db ' INTERSECTION'
	db 0x0A
	db 0x00
__str_5:
	db 0x0A
	db 'Turn right at the next intersection'
	db 0x0A
	db 0x00
__str_6:
	db 0x0A
	db 'GO!'
	db 0x0A
	db 0x00
__str_7:
	db 0x0A
	db 'Reverse Reverse!'
	db 0x0A
	db 0x00
__str_8:
	db 0x0A
	db 'HALT peasants!'
	db 0x0A
	db 0x00
__str_9:
	db 0x0A
	db 'UTURN'
	db 0x0A
	db 0x00
__str_10:
	db 0x0A
	db 'Command received: 0b_0%c%c%c'
	db 0x0A
	db 0x00
__str_11:
	db 0x0A
	db 'v = %f'
	db 0x0D
	db 0x0A
	db 0x00
__str_12:
	db 0x0D
	db 0x0A
	db ' p=%fcm'
	db 0x0A
	db 0x00

	CSEG

end
