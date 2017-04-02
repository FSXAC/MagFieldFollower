;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Sun Apr 02 13:29:27 2017
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
_linetrack_forwardbackward_1_79:
	ds 2
_linetrack_vleft_1_80:
	ds 4
_linetrack_vright_1_80:
	ds 4
_linetrack_sloc0_1_0:
	ds 4
_turncar_vleft_1_85:
	ds 4
_turncar_vright_1_85:
	ds 4
_uturn_vleft_1_91:
	ds 4
_uturn_vright_1_91:
	ds 4
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
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	robot.c:20: void Timer2_ISR (void) interrupt 5 {
;	-----------------------------------------
;	 function Timer2_ISR
;	-----------------------------------------
_Timer2_ISR:
	using	0
	push	acc
	push	b
	push	psw
	mov	psw,#0x00
;	robot.c:21: TF2H = 0; // Clear Timer2 interrupt flag
	clr	_TF2H
;	robot.c:23: pwm_count++;
	inc	_pwm_count
;	robot.c:24: if(pwm_count>100) pwm_count=0;
	clr	c
	mov	a,#(0x64 ^ 0x80)
	mov	b,_pwm_count
	xrl	b,#0x80
	subb	a,b
	jnc	L002002?
	mov	_pwm_count,#0x00
L002002?:
;	robot.c:27: MOTOR_LEFT0 = pwm_count > pwm_Left0 ? 0 : 1; //p1.5
	clr	c
	mov	a,_pwm_Left0
	xrl	a,#0x80
	mov	b,_pwm_count
	xrl	b,#0x80
	subb	a,b
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P1_5,c
;	robot.c:28: MOTOR_LEFT1 = pwm_count > pwm_Left1 ? 0 : 1; //p1.6
	clr	c
	mov	a,_pwm_Left1
	xrl	a,#0x80
	mov	b,_pwm_count
	xrl	b,#0x80
	subb	a,b
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P1_6,c
;	robot.c:29: MOTOR_RIGHT0 = pwm_count > pwm_Right0 ? 0 : 1; //p2.0
	clr	c
	mov	a,_pwm_Right0
	xrl	a,#0x80
	mov	b,_pwm_count
	xrl	b,#0x80
	subb	a,b
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P2_0,c
;	robot.c:30: MOTOR_RIGHT1 = pwm_count > pwm_Right1 ? 0 : 1; //p2.1
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
;	robot.c:37: void forward_backward(unsigned char direction) {
;	-----------------------------------------
;	 function forward_backward
;	-----------------------------------------
_forward_backward:
;	robot.c:38: if (direction == 0) { //p2.1,1.6 on
	mov	a,dpl
	mov	r2,a
	jnz	L003004?
;	robot.c:39: pwm_Left0 = pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
	mov	_pwm_Left0,#0xFF
;	robot.c:40: pwm_Left1 = pwm_Right1 = pwm_both;  //MOTOR_LEFT1 = MOTOR_RIGHT1 = pwm_both;
	mov	_pwm_Right1,_pwm_both
	mov	_pwm_Left1,_pwm_both
	ret
L003004?:
;	robot.c:43: else if (direction == 1) { //p2.0,1.5 on
	cjne	r2,#0x01,L003006?
;	robot.c:44: pwm_Left1 = pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
	mov	_pwm_Left1,#0xFF
;	robot.c:45: pwm_Left0 = pwm_Right0 = pwm_both; 
	mov	_pwm_Right0,_pwm_both
	mov	_pwm_Left0,_pwm_both
L003006?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'readData'
;------------------------------------------------------------
;commandflag               Allocated to registers r2 r3 
;------------------------------------------------------------
;	robot.c:52: void readData (void) {
;	-----------------------------------------
;	 function readData
;	-----------------------------------------
_readData:
;	robot.c:53: int commandflag = 0;					//determines if there's a real command coming in or not
	mov	r2,#0x00
	mov	r3,#0x00
;	robot.c:55: if (COMMAND_PIN == 0) {					//0---
	jnb	_P1_0,L004039?
	ljmp	L004022?
L004039?:
;	robot.c:56: waitms(6);
	mov	dptr,#0x0006
	push	ar2
	push	ar3
	lcall	_waitms
	pop	ar3
	pop	ar2
;	robot.c:57: if (COMMAND_PIN == 1) {				//01--
	jnb	_P1_0,L004019?
;	robot.c:58: waitms(4);
	mov	dptr,#0x0004
	push	ar2
	push	ar3
	lcall	_waitms
	pop	ar3
	pop	ar2
;	robot.c:59: if (COMMAND_PIN == 0) {			//010-
	jb	_P1_0,L004007?
;	robot.c:60: waitms(4);
	mov	dptr,#0x0004
	push	ar2
	push	ar3
	lcall	_waitms
	pop	ar3
	pop	ar2
;	robot.c:61: if (COMMAND_PIN == 0) {		//0100	
	jb	_P1_0,L004002?
;	robot.c:62: currentcmd = 4;
	mov	_currentcmd,#0x04
	sjmp	L004022?
L004002?:
;	robot.c:65: currentcmd = 5;
	mov	_currentcmd,#0x05
	sjmp	L004022?
L004007?:
;	robot.c:69: waitms(4);
	mov	dptr,#0x0004
	push	ar2
	push	ar3
	lcall	_waitms
	pop	ar3
	pop	ar2
;	robot.c:70: if (COMMAND_PIN == 0) {		//0110
	jb	_P1_0,L004022?
;	robot.c:71: currentcmd = 6;
	mov	_currentcmd,#0x06
	sjmp	L004022?
L004019?:
;	robot.c:76: waitms(4);
	mov	dptr,#0x0004
	push	ar2
	push	ar3
	lcall	_waitms
	pop	ar3
	pop	ar2
;	robot.c:77: if (COMMAND_PIN == 1) {			//001-
	jnb	_P1_0,L004016?
;	robot.c:78: waitms(4);
	mov	dptr,#0x0004
	push	ar2
	push	ar3
	lcall	_waitms
	pop	ar3
	pop	ar2
;	robot.c:79: if (COMMAND_PIN == 1) {		//0011
	jnb	_P1_0,L004010?
;	robot.c:80: currentcmd = 3;
	mov	_currentcmd,#0x03
	sjmp	L004022?
L004010?:
;	robot.c:83: currentcmd = 2;
	mov	_currentcmd,#0x02
	sjmp	L004022?
L004016?:
;	robot.c:87: waitms(4);
	mov	dptr,#0x0004
	push	ar2
	push	ar3
	lcall	_waitms
	pop	ar3
	pop	ar2
;	robot.c:88: if (COMMAND_PIN == 1) {		//0001	
	jnb	_P1_0,L004013?
;	robot.c:89: currentcmd == 1;
	mov	a,_currentcmd
	sjmp	L004022?
L004013?:
;	robot.c:92: commandflag = 1;
	mov	r2,#0x01
	mov	r3,#0x00
L004022?:
;	robot.c:97: if (commandflag == 0) {					//only wait for signal to end if a command has been received. 
	mov	a,r2
	orl	a,r3
	jnz	L004027?
;	robot.c:98: while (COMMAND_PIN == 0) {}
L004023?:
	jnb	_P1_0,L004023?
L004027?:
;	robot.c:101: printf("current command is %d\r\n", currentcmd);		
	mov	r2,_currentcmd
	mov	a,_currentcmd
	rlc	a
	subb	a,acc
	mov	r3,a
	push	ar2
	push	ar3
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'linetrack'
;------------------------------------------------------------
;forwardbackward           Allocated with name '_linetrack_forwardbackward_1_79'
;vleft                     Allocated with name '_linetrack_vleft_1_80'
;vright                    Allocated with name '_linetrack_vright_1_80'
;sloc0                     Allocated with name '_linetrack_sloc0_1_0'
;------------------------------------------------------------
;	robot.c:105: void linetrack (int forwardbackward) {
;	-----------------------------------------
;	 function linetrack
;	-----------------------------------------
_linetrack:
	mov	_linetrack_forwardbackward_1_79,dpl
	mov	(_linetrack_forwardbackward_1_79 + 1),dph
;	robot.c:109: vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	_linetrack_vleft_1_80,dpl
	mov	(_linetrack_vleft_1_80 + 1),dph
	mov	(_linetrack_vleft_1_80 + 2),b
	mov	(_linetrack_vleft_1_80 + 3),a
;	robot.c:110: vright=Volts_at_Pin(LQFP32_MUX_P2_4);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_linetrack_vright_1_80,dpl
	mov	(_linetrack_vright_1_80 + 1),dph
	mov	(_linetrack_vright_1_80 + 2),b
	mov	(_linetrack_vright_1_80 + 3),a
;	robot.c:112: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:114: pwm_Left1 = vright*vright*75/(vright*vright+vleft*vleft);
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
;	robot.c:115: pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
;	robot.c:117: pwm_Right0 = vleft*vleft*75/(vright*vright+vleft*vleft);
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
;	robot.c:119: if (forwardbackward) {
	mov	a,_linetrack_forwardbackward_1_79
	orl	a,(_linetrack_forwardbackward_1_79 + 1)
	jz	L005003?
;	robot.c:120: pwm_Left0 = pwm_Left1;
	mov	_pwm_Left0,_pwm_Left1
;	robot.c:121: pwm_Left1 = -1;
	mov	_pwm_Left1,#0xFF
;	robot.c:122: pwm_Right1 = pwm_Right1;
	mov	_pwm_Right1,_pwm_Right1
;	robot.c:123: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
L005003?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'stopcar'
;------------------------------------------------------------
;------------------------------------------------------------
;	robot.c:130: void stopcar(void) {
;	-----------------------------------------
;	 function stopcar
;	-----------------------------------------
_stopcar:
;	robot.c:131: pwm_Left1 = -1;
	mov	_pwm_Left1,#0xFF
;	robot.c:132: pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
;	robot.c:133: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:134: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'turncar'
;------------------------------------------------------------
;leftright                 Allocated to registers r2 r3 
;vleft                     Allocated with name '_turncar_vleft_1_85'
;vright                    Allocated with name '_turncar_vright_1_85'
;------------------------------------------------------------
;	robot.c:137: void turncar (int leftright) {
;	-----------------------------------------
;	 function turncar
;	-----------------------------------------
_turncar:
	mov	r2,dpl
	mov	r3,dph
;	robot.c:141: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:142: pwm_Left1 = -1;
	mov	_pwm_Left1,#0xFF
;	robot.c:143: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
;	robot.c:144: pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
;	robot.c:147: if (leftright == 0) {
	mov	a,r2
	orl	a,r3
	jz	L007022?
	ljmp	L007012?
L007022?:
;	robot.c:149: pwm_Right0 = 50;
	mov	_pwm_Right0,#0x32
;	robot.c:151: waitms(1000);
	mov	dptr,#0x03E8
	lcall	_waitms
;	robot.c:153: vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	_turncar_vleft_1_85,dpl
	mov	(_turncar_vleft_1_85 + 1),dph
	mov	(_turncar_vleft_1_85 + 2),b
	mov	(_turncar_vleft_1_85 + 3),a
;	robot.c:154: vright=Volts_at_Pin(LQFP32_MUX_P2_4);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_turncar_vright_1_85,dpl
	mov	(_turncar_vright_1_85 + 1),dph
	mov	(_turncar_vright_1_85 + 2),b
	mov	(_turncar_vright_1_85 + 3),a
;	robot.c:156: while (((vleft - vright) > 0.2) || ((vleft - vright) < (-0.2))) {
L007002?:
	push	_turncar_vright_1_85
	push	(_turncar_vright_1_85 + 1)
	push	(_turncar_vright_1_85 + 2)
	push	(_turncar_vright_1_85 + 3)
	mov	dpl,_turncar_vleft_1_85
	mov	dph,(_turncar_vleft_1_85 + 1)
	mov	b,(_turncar_vleft_1_85 + 2)
	mov	a,(_turncar_vleft_1_85 + 3)
	lcall	___fssub
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
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
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fsgt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r4
	jnz	L007003?
	push	_turncar_vright_1_85
	push	(_turncar_vright_1_85 + 1)
	push	(_turncar_vright_1_85 + 2)
	push	(_turncar_vright_1_85 + 3)
	mov	dpl,_turncar_vleft_1_85
	mov	dph,(_turncar_vleft_1_85 + 1)
	mov	b,(_turncar_vleft_1_85 + 2)
	mov	a,(_turncar_vleft_1_85 + 3)
	lcall	___fssub
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
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
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fslt
	mov	r4,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r4
	jz	L007004?
L007003?:
;	robot.c:158: vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	_turncar_vleft_1_85,dpl
	mov	(_turncar_vleft_1_85 + 1),dph
	mov	(_turncar_vleft_1_85 + 2),b
	mov	(_turncar_vleft_1_85 + 3),a
;	robot.c:159: vright=Volts_at_Pin(LQFP32_MUX_P2_4);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_turncar_vright_1_85,dpl
	mov	(_turncar_vright_1_85 + 1),dph
	mov	(_turncar_vright_1_85 + 2),b
	mov	(_turncar_vright_1_85 + 3),a
	ljmp	L007002?
L007004?:
;	robot.c:163: pwm_Right0 = -1; 		
	mov	_pwm_Right0,#0xFF
	ret
L007012?:
;	robot.c:166: else if (leftright == 1) {
	cjne	r2,#0x01,L007025?
	cjne	r3,#0x00,L007025?
	sjmp	L007026?
L007025?:
	ret
L007026?:
;	robot.c:168: pwm_Left1 = 50;
	mov	_pwm_Left1,#0x32
;	robot.c:170: waitms(1000);
	mov	dptr,#0x03E8
	lcall	_waitms
;	robot.c:172: vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	_turncar_vleft_1_85,dpl
	mov	(_turncar_vleft_1_85 + 1),dph
	mov	(_turncar_vleft_1_85 + 2),b
	mov	(_turncar_vleft_1_85 + 3),a
;	robot.c:173: vright=Volts_at_Pin(LQFP32_MUX_P2_4);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_turncar_vright_1_85,dpl
	mov	(_turncar_vright_1_85 + 1),dph
	mov	(_turncar_vright_1_85 + 2),b
	mov	(_turncar_vright_1_85 + 3),a
;	robot.c:175: while (((vleft - vright) > 0.2) || ((vleft - vright) < (-0.2))) {
L007006?:
	push	_turncar_vright_1_85
	push	(_turncar_vright_1_85 + 1)
	push	(_turncar_vright_1_85 + 2)
	push	(_turncar_vright_1_85 + 3)
	mov	dpl,_turncar_vleft_1_85
	mov	dph,(_turncar_vleft_1_85 + 1)
	mov	b,(_turncar_vleft_1_85 + 2)
	mov	a,(_turncar_vleft_1_85 + 3)
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
	jnz	L007007?
	push	_turncar_vright_1_85
	push	(_turncar_vright_1_85 + 1)
	push	(_turncar_vright_1_85 + 2)
	push	(_turncar_vright_1_85 + 3)
	mov	dpl,_turncar_vleft_1_85
	mov	dph,(_turncar_vleft_1_85 + 1)
	mov	b,(_turncar_vleft_1_85 + 2)
	mov	a,(_turncar_vleft_1_85 + 3)
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
	jz	L007008?
L007007?:
;	robot.c:177: vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	_turncar_vleft_1_85,dpl
	mov	(_turncar_vleft_1_85 + 1),dph
	mov	(_turncar_vleft_1_85 + 2),b
	mov	(_turncar_vleft_1_85 + 3),a
;	robot.c:178: vright=Volts_at_Pin(LQFP32_MUX_P2_4);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_turncar_vright_1_85,dpl
	mov	(_turncar_vright_1_85 + 1),dph
	mov	(_turncar_vright_1_85 + 2),b
	mov	(_turncar_vright_1_85 + 3),a
	ljmp	L007006?
L007008?:
;	robot.c:182: pwm_Left1 = -1; 
	mov	_pwm_Left1,#0xFF
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uturn'
;------------------------------------------------------------
;vleft                     Allocated with name '_uturn_vleft_1_91'
;vright                    Allocated with name '_uturn_vright_1_91'
;------------------------------------------------------------
;	robot.c:186: void uturn(void) {
;	-----------------------------------------
;	 function uturn
;	-----------------------------------------
_uturn:
;	robot.c:190: vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	_uturn_vleft_1_91,dpl
	mov	(_uturn_vleft_1_91 + 1),dph
	mov	(_uturn_vleft_1_91 + 2),b
	mov	(_uturn_vleft_1_91 + 3),a
;	robot.c:191: vright=Volts_at_Pin(LQFP32_MUX_P2_4);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_uturn_vright_1_91,dpl
	mov	(_uturn_vright_1_91 + 1),dph
	mov	(_uturn_vright_1_91 + 2),b
	mov	(_uturn_vright_1_91 + 3),a
;	robot.c:193: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:194: pwm_Left1 = 50;
	mov	_pwm_Left1,#0x32
;	robot.c:195: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
;	robot.c:196: pwm_Right1 = 50;
	mov	_pwm_Right1,#0x32
;	robot.c:198: waitms(4000);
	mov	dptr,#0x0FA0
	lcall	_waitms
;	robot.c:200: while (((vleft - vright) > 0.2) || ((vleft - vright) < (-0.2))) {
L008002?:
	push	_uturn_vright_1_91
	push	(_uturn_vright_1_91 + 1)
	push	(_uturn_vright_1_91 + 2)
	push	(_uturn_vright_1_91 + 3)
	mov	dpl,_uturn_vleft_1_91
	mov	dph,(_uturn_vleft_1_91 + 1)
	mov	b,(_uturn_vleft_1_91 + 2)
	mov	a,(_uturn_vleft_1_91 + 3)
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
	jnz	L008003?
	push	_uturn_vright_1_91
	push	(_uturn_vright_1_91 + 1)
	push	(_uturn_vright_1_91 + 2)
	push	(_uturn_vright_1_91 + 3)
	mov	dpl,_uturn_vleft_1_91
	mov	dph,(_uturn_vleft_1_91 + 1)
	mov	b,(_uturn_vleft_1_91 + 2)
	mov	a,(_uturn_vleft_1_91 + 3)
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
	jz	L008005?
L008003?:
;	robot.c:202: vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	_uturn_vleft_1_91,dpl
	mov	(_uturn_vleft_1_91 + 1),dph
	mov	(_uturn_vleft_1_91 + 2),b
	mov	(_uturn_vleft_1_91 + 3),a
;	robot.c:203: vright=Volts_at_Pin(LQFP32_MUX_P2_4);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_uturn_vright_1_91,dpl
	mov	(_uturn_vright_1_91 + 1),dph
	mov	(_uturn_vright_1_91 + 2),b
	mov	(_uturn_vright_1_91 + 3),a
	ljmp	L008002?
L008005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;------------------------------------------------------------
;	robot.c:207: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	robot.c:208: MOTOR_LEFT0 =0;
	clr	_P1_5
;	robot.c:209: MOTOR_LEFT1 =0;
	clr	_P1_6
;	robot.c:210: MOTOR_RIGHT0 =0;
	clr	_P2_0
;	robot.c:211: MOTOR_RIGHT1 =0;
	clr	_P2_1
;	robot.c:213: currentstate = 1;  	//initialize the car to be stopped
	mov	_currentstate,#0x01
;	robot.c:214: currentcmd = 1;		//initialize the command to be null
	mov	_currentcmd,#0x01
;	robot.c:217: printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	robot.c:226: InitPinADC(2, 3); // Configure P2.3 as analog input
	mov	_InitPinADC_PARM_2,#0x03
	mov	dpl,#0x02
	lcall	_InitPinADC
;	robot.c:227: InitPinADC(2, 4); // Configure P2.4 as analog input
	mov	_InitPinADC_PARM_2,#0x04
	mov	dpl,#0x02
	lcall	_InitPinADC
;	robot.c:228: InitPinADC(1, 0);
	mov	_InitPinADC_PARM_2,#0x00
	mov	dpl,#0x01
	lcall	_InitPinADC
;	robot.c:229: InitADC();
	lcall	_InitADC
;	robot.c:231: while(1)
L009026?:
;	robot.c:235: printf("adc readings = %f\r\n", Volts_at_Pin(LQFP32_MUX_P1_0));
	mov	dpl,#0x00
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	robot.c:237: switch (currentstate) {
	mov	r2,_currentstate
	cjne	r2,#0x01,L009042?
	sjmp	L009001?
L009042?:
	cjne	r2,#0x02,L009043?
	sjmp	L009002?
L009043?:
;	robot.c:238: case 1:
	cjne	r2,#0x03,L009004?
	sjmp	L009003?
L009001?:
;	robot.c:239: linetrack(0);	//forwards
	mov	dptr,#0x0000
	lcall	_linetrack
;	robot.c:240: break;
;	robot.c:241: case 2:
	sjmp	L009004?
L009002?:
;	robot.c:242: linetrack(1);	//backwards
	mov	dptr,#0x0001
	lcall	_linetrack
;	robot.c:243: break;
;	robot.c:244: case 3:
	sjmp	L009004?
L009003?:
;	robot.c:245: stopcar();		//stop car
	lcall	_stopcar
;	robot.c:247: }
L009004?:
;	robot.c:249: switch (currentcmd) {
	mov	a,_currentcmd
	mov	r2,a
	jnb	acc.7,L009045?
	ljmp	L009023?
L009045?:
	clr	c
	mov	a,#(0x06 ^ 0x80)
	mov	b,r2
	xrl	b,#0x80
	subb	a,b
	jnc	L009046?
	ljmp	L009023?
L009046?:
	mov	a,r2
	add	a,r2
	add	a,r2
	mov	dptr,#L009047?
	jmp	@a+dptr
L009047?:
	ljmp	L009005?
	ljmp	L009011?
	ljmp	L009015?
	ljmp	L009019?
	ljmp	L009020?
	ljmp	L009021?
	ljmp	L009022?
;	robot.c:251: case 0 :
L009005?:
;	robot.c:253: if (currentstate == 1) {
	mov	a,#0x01
	cjne	a,_currentstate,L009048?
	sjmp	L009049?
L009048?:
	ljmp	L009026?
L009049?:
;	robot.c:254: if (Volts_at_Pin(LQFP32_MUX_P2_3) > 1 && Volts_at_Pin(LQFP32_MUX_P2_4) > 1) {
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
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
	jnz	L009050?
	ljmp	L009026?
L009050?:
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
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
	jnz	L009051?
	ljmp	L009026?
L009051?:
;	robot.c:256: pwm_Left1 = 35;
	mov	_pwm_Left1,#0x23
;	robot.c:257: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:258: pwm_Right0 = 35;
	mov	_pwm_Right0,#0x23
;	robot.c:259: pwm_Right1 = -1;						
	mov	_pwm_Right1,#0xFF
;	robot.c:260: waitms(1500);
	mov	dptr,#0x05DC
	lcall	_waitms
;	robot.c:263: break;
	ljmp	L009026?
;	robot.c:264: case 1 :
L009011?:
;	robot.c:266: if (Volts_at_Pin(LQFP32_MUX_P2_3) > 1 && Volts_at_Pin(LQFP32_MUX_P2_4) > 1) {
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
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
	jnz	L009052?
	ljmp	L009026?
L009052?:
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
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
	jnz	L009053?
	ljmp	L009026?
L009053?:
;	robot.c:268: pwm_Left1 = 35;
	mov	_pwm_Left1,#0x23
;	robot.c:269: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:270: pwm_Right0 = 35;
	mov	_pwm_Right0,#0x23
;	robot.c:271: pwm_Right1 = -1;						
	mov	_pwm_Right1,#0xFF
;	robot.c:272: waitms(1500);
	mov	dptr,#0x05DC
	lcall	_waitms
;	robot.c:274: turncar(0); //0 = left
	mov	dptr,#0x0000
	lcall	_turncar
;	robot.c:275: currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:278: break;
	ljmp	L009026?
;	robot.c:281: case 2 :
L009015?:
;	robot.c:283: if (Volts_at_Pin(LQFP32_MUX_P2_4) > 1 || Volts_at_Pin(LQFP32_MUX_P2_3) > 1) {
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
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
	jnz	L009016?
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
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
	jnz	L009055?
	ljmp	L009026?
L009055?:
L009016?:
;	robot.c:284: printf("\n\r reached intersection :D");
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
;	robot.c:285: pwm_Left1 = 35;
	mov	_pwm_Left1,#0x23
;	robot.c:286: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	robot.c:287: pwm_Right0 = 35;
	mov	_pwm_Right0,#0x23
;	robot.c:288: pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
;	robot.c:289: waitms(1500);
	mov	dptr,#0x05DC
	lcall	_waitms
;	robot.c:291: turncar(1); //1 = right
	mov	dptr,#0x0001
	lcall	_turncar
;	robot.c:292: currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:294: break;
	ljmp	L009026?
;	robot.c:297: case 3 :
L009019?:
;	robot.c:298: currentstate = 1;
	mov	_currentstate,#0x01
;	robot.c:299: currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:300: break;
	ljmp	L009026?
;	robot.c:303: case 4 :
L009020?:
;	robot.c:304: currentstate = 2;
	mov	_currentstate,#0x02
;	robot.c:305: currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:306: break;
	ljmp	L009026?
;	robot.c:309: case 5 :
L009021?:
;	robot.c:310: currentstate = 3;
	mov	_currentstate,#0x03
;	robot.c:311: currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:312: break;
	ljmp	L009026?
;	robot.c:315: case 6 :
L009022?:
;	robot.c:316: uturn();  //uturn
	lcall	_uturn
;	robot.c:317: currentcmd = 0;
	mov	_currentcmd,#0x00
;	robot.c:318: break;
	ljmp	L009026?
;	robot.c:319: default: 
L009023?:
;	robot.c:320: currentstate = 1;
	mov	_currentstate,#0x01
;	robot.c:321: }
	ljmp	L009026?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 'current command is %d'
	db 0x0D
	db 0x0A
	db 0x00
__str_1:
	db 0x1B
	db '[2J'
	db 0x00
__str_2:
	db 'adc readings = %f'
	db 0x0D
	db 0x0A
	db 0x00
__str_3:
	db 0x0A
	db 0x0D
	db ' reached intersection :D'
	db 0x00

	CSEG

end
