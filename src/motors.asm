;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Sat Apr 01 20:29:25 2017
;--------------------------------------------------------
$name motors
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
	public _InitPinADC_PARM_2
	public _main
	public _uturn
	public _turncar
	public _stopcar
	public _linetrack
	public _readData
	public _Volts_at_Pin
	public _ADC_at_Pin
	public _InitPinADC
	public _InitADC
	public _forward_backward
	public _Timer2_ISR
	public _waitms
	public _Timer3us
	public __c51_external_startup
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
_linetrack_forwardbackward_1_83:
	ds 2
_linetrack_vleft_1_84:
	ds 4
_linetrack_vright_1_84:
	ds 4
_linetrack_sloc0_1_0:
	ds 4
_turncar_vleft_1_88:
	ds 4
_turncar_vright_1_88:
	ds 4
_uturn_vleft_1_93:
	ds 4
_uturn_vright_1_93:
	ds 4
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
	rseg	R_OSEG
_InitPinADC_PARM_2:
	ds 1
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
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:20: volatile  char pwm_count=0;
	mov	_pwm_count,#0x00
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:21: volatile  char mode = 0;
	mov	_mode,#0x00
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:22: volatile  char pwm_both =0;
	mov	_pwm_both,#0x00
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:23: volatile  char pwm_Left0 = 0; //p1.5
	mov	_pwm_Left0,#0x00
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:24: volatile  char pwm_Left1 = 0; //p1.6
	mov	_pwm_Left1,#0x00
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:25: volatile  char pwm_Right0 = 0; //p2.0
	mov	_pwm_Right0,#0x00
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:26: volatile  char pwm_Right1 = 0; //p2.1
	mov	_pwm_Right1,#0x00
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:27: volatile  char direction = 0; // 1 for back 0 for forward
	mov	_direction,#0x00
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:29: volatile  char currentcmd = 0;
	mov	_currentcmd,#0x00
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:30: volatile  char currentstate = 1;
	mov	_currentstate,#0x01
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:34: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:36: PCA0MD&=(~0x40) ;    // DISABLE WDT: clear Watchdog Enable bit
	anl	_PCA0MD,#0xBF
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:37: VDM0CN=0x80; // enable VDD monitor
	mov	_VDM0CN,#0x80
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:38: RSTSRC=0x02|0x04; // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:46: CLKSEL|=0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
	orl	_CLKSEL,#0x03
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:50: OSCICN |= 0x03; // Configure internal oscillator for its maximum frequency
	orl	_OSCICN,#0x03
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:53: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:55: TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	mov	_TH1,#0x30
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:56: CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	anl	_CKCON,#0xF4
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:57: CKCON |=  0x08;
	orl	_CKCON,#0x08
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:70: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:71: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
	anl	_TMOD,#0x0F
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:72: TMOD |=  0x20;
	orl	_TMOD,#0x20
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:73: TR1 = 1; // START Timer1
	setb	_TR1
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:74: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:77: P2MDOUT|=0b_0000_0011;
	orl	_P2MDOUT,#0x03
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:78: P0MDOUT |= 0x10; // Enable UTX as push-pull output
	orl	_P0MDOUT,#0x10
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:79: XBR0     = 0x01; // Enable UART on P0.4(TX) and P0.5(RX)
	mov	_XBR0,#0x01
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:80: XBR1     = 0x40; // Enable crossbar and weak pull-ups
	mov	_XBR1,#0x40
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:83: TMR2CN=0x00;   // Stop Timer2; Clear TF2;
	mov	_TMR2CN,#0x00
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:84: CKCON|=0b_0001_0000;
	orl	_CKCON,#0x10
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:85: TMR2RL=(-(SYSCLK/(2*48))/(100L)); // Initialize reload value
	mov	_TMR2RL,#0x78
	mov	(_TMR2RL >> 8),#0xEC
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:86: TMR2=0xffff;   // Set to reload immediately
	mov	_TMR2,#0xFF
	mov	(_TMR2 >> 8),#0xFF
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:87: ET2=1;         // Enable Timer2 interrupts
	setb	_ET2
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:88: TR2=1;         // Start Timer2
	setb	_TR2
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:90: EA=1; // Enable interrupts
	setb	_EA
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:92: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer3us'
;------------------------------------------------------------
;us                        Allocated to registers r2 
;i                         Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:96: void Timer3us(unsigned char us)
;	-----------------------------------------
;	 function Timer3us
;	-----------------------------------------
_Timer3us:
	mov	r2,dpl
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:101: CKCON|=0b_0100_0000;
	orl	_CKCON,#0x40
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:103: TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	mov	_TMR3RL,#0xD0
	mov	(_TMR3RL >> 8),#0xFF
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:104: TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:106: TMR3CN = 0x04;                 // Sart Timer3 and clear overflow flag
	mov	_TMR3CN,#0x04
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:107: for (i = 0; i < us; i++)       // Count <us> overflows
	mov	r3,#0x00
L003004?:
	clr	c
	mov	a,r3
	subb	a,r2
	jnc	L003007?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:109: while (!(TMR3CN & 0x80));  // Wait for overflow
L003001?:
	mov	a,_TMR3CN
	jnb	acc.7,L003001?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:110: TMR3CN &= ~(0x80);         // Clear overflow indicator
	anl	_TMR3CN,#0x7F
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:107: for (i = 0; i < us; i++)       // Count <us> overflows
	inc	r3
	sjmp	L003004?
L003007?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:112: TMR3CN = 0 ;                   // Stop Timer3 and clear overflow flag
	mov	_TMR3CN,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:115: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:118: for(j=ms; j!=0; j--)
L004001?:
	cjne	r2,#0x00,L004010?
	cjne	r3,#0x00,L004010?
	ret
L004010?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:120: Timer3us(249);
	mov	dpl,#0xF9
	push	ar2
	push	ar3
	lcall	_Timer3us
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:121: Timer3us(249);
	mov	dpl,#0xF9
	lcall	_Timer3us
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:122: Timer3us(249);
	mov	dpl,#0xF9
	lcall	_Timer3us
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:123: Timer3us(250);
	mov	dpl,#0xFA
	lcall	_Timer3us
	pop	ar3
	pop	ar2
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:118: for(j=ms; j!=0; j--)
	dec	r2
	cjne	r2,#0xff,L004011?
	dec	r3
L004011?:
	sjmp	L004001?
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:128: void Timer2_ISR (void) interrupt 5
;	-----------------------------------------
;	 function Timer2_ISR
;	-----------------------------------------
_Timer2_ISR:
	push	acc
	push	b
	push	psw
	mov	psw,#0x00
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:130: TF2H = 0; // Clear Timer2 interrupt flag
	clr	_TF2H
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:132: pwm_count++;
	inc	_pwm_count
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:133: if(pwm_count>100) pwm_count=0;
	clr	c
	mov	a,#(0x64 ^ 0x80)
	mov	b,_pwm_count
	xrl	b,#0x80
	subb	a,b
	jnc	L005002?
	mov	_pwm_count,#0x00
L005002?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:136: MOTOR_LEFT0 = pwm_count > pwm_Left0 ? 0 : 1; //p1.5
	clr	c
	mov	a,_pwm_Left0
	xrl	a,#0x80
	mov	b,_pwm_count
	xrl	b,#0x80
	subb	a,b
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P1_5,c
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:137: MOTOR_LEFT1 = pwm_count > pwm_Left1 ? 0 : 1; //p1.6
	clr	c
	mov	a,_pwm_Left1
	xrl	a,#0x80
	mov	b,_pwm_count
	xrl	b,#0x80
	subb	a,b
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P1_6,c
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:138: MOTOR_RIGHT0 = pwm_count > pwm_Right0 ? 0 : 1; //p2.0
	clr	c
	mov	a,_pwm_Right0
	xrl	a,#0x80
	mov	b,_pwm_count
	xrl	b,#0x80
	subb	a,b
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P2_0,c
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:139: MOTOR_RIGHT1 = pwm_count > pwm_Right1 ? 0 : 1; //p2.1
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
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:146: void forward_backward(unsigned char direction)
;	-----------------------------------------
;	 function forward_backward
;	-----------------------------------------
_forward_backward:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:149: if (direction == 0) { //p2.1,1.6 on
	mov	a,dpl
	mov	r2,a
	jnz	L006004?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:150: pwm_Left0 = pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
	mov	_pwm_Left0,#0xFF
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:151: pwm_Left1 = pwm_Right1 = pwm_both;  //MOTOR_LEFT1 = MOTOR_RIGHT1 = pwm_both;
	mov	_pwm_Right1,_pwm_both
	mov	_pwm_Left1,_pwm_both
	ret
L006004?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:154: else if (direction == 1) { //p2.0,1.5 on
	cjne	r2,#0x01,L006006?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:155: pwm_Left1 = pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
	mov	_pwm_Left1,#0xFF
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:156: pwm_Left0 = pwm_Right0 = pwm_both; 
	mov	_pwm_Right0,_pwm_both
	mov	_pwm_Left0,_pwm_both
L006006?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitADC'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:162: void InitADC (void)
;	-----------------------------------------
;	 function InitADC
;	-----------------------------------------
_InitADC:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:165: ADC0CF = 0xF8; // SAR clock = 31, Right-justified result
	mov	_ADC0CF,#0xF8
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:166: ADC0CN = 0b_1000_0000; // AD0EN=1, AD0TM=0
	mov	_ADC0CN,#0x80
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:167: REF0CN = 0b_0000_1000; //Select VDD as the voltage reference for the converter
	mov	_REF0CN,#0x08
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitPinADC'
;------------------------------------------------------------
;pinno                     Allocated with name '_InitPinADC_PARM_2'
;portno                    Allocated to registers r2 
;mask                      Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:170: void InitPinADC (unsigned char portno, unsigned char pinno)
;	-----------------------------------------
;	 function InitPinADC
;	-----------------------------------------
_InitPinADC:
	mov	r2,dpl
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:174: mask=1<<pinno;
	mov	b,_InitPinADC_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	L008012?
L008010?:
	add	a,acc
L008012?:
	djnz	b,L008010?
	mov	r3,a
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:176: switch (portno)
	mov	a,r2
	add	a,#0xff - 0x03
	jc	L008007?
	mov	a,r2
	add	a,r2
	add	a,r2
	mov	dptr,#L008014?
	jmp	@a+dptr
L008014?:
	ljmp	L008001?
	ljmp	L008002?
	ljmp	L008003?
	ljmp	L008004?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:178: case 0:
L008001?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:179: P0MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	anl	_P0MDIN,a
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:180: P0SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P0SKIP,a
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:181: break;
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:182: case 1:
	ret
L008002?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:183: P1MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	anl	_P1MDIN,a
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:184: P1SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P1SKIP,a
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:185: break;
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:186: case 2:
	ret
L008003?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:187: P2MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	anl	_P2MDIN,a
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:188: P2SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P2SKIP,a
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:189: break;
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:190: case 3:
	ret
L008004?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:191: P3MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P3MDIN,a
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:192: P3SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P3SKIP,a
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:196: }
L008007?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ADC_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers 
;------------------------------------------------------------
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:199: unsigned int ADC_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function ADC_at_Pin
;	-----------------------------------------
_ADC_at_Pin:
	mov	_AMX0P,dpl
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:202: AMX0N = LQFP32_MUX_GND;  // GND is negative input (Single-ended Mode)
	mov	_AMX0N,#0x1F
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:204: AD0BUSY=1;
	setb	_AD0BUSY
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:205: while (AD0BUSY); // Wait for dummy conversion to finish
L009001?:
	jb	_AD0BUSY,L009001?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:207: AD0BUSY = 1;
	setb	_AD0BUSY
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:208: while (AD0BUSY); // Wait for conversion to complete
L009004?:
	jb	_AD0BUSY,L009004?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:209: return (ADC0L+(ADC0H*0x100));
	mov	r2,_ADC0L
	mov	r3,#0x00
	mov	r5,_ADC0H
	mov	r4,#0x00
	mov	a,r4
	add	a,r2
	mov	dpl,a
	mov	a,r5
	addc	a,r3
	mov	dph,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Volts_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:212: float Volts_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function Volts_at_Pin
;	-----------------------------------------
_Volts_at_Pin:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:214: return ((ADC_at_Pin(pin)*3.30)/1024.0);
	lcall	_ADC_at_Pin
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x3333
	mov	b,#0x53
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x44
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
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'readData'
;------------------------------------------------------------
;commandflag               Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:218: void readData (void) {
;	-----------------------------------------
;	 function readData
;	-----------------------------------------
_readData:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:219: int commandflag = 0;					//determines if there's a real command coming in or not
	mov	r2,#0x00
	mov	r3,#0x00
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:221: if (COMMAND_PIN == 0) {					//0---
	jnb	_P1_0,L011039?
	ljmp	L011022?
L011039?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:222: waitms(6);
	mov	dptr,#0x0006
	push	ar2
	push	ar3
	lcall	_waitms
	pop	ar3
	pop	ar2
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:223: if (COMMAND_PIN == 1) {				//01--
	jnb	_P1_0,L011019?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:224: waitms(4);
	mov	dptr,#0x0004
	push	ar2
	push	ar3
	lcall	_waitms
	pop	ar3
	pop	ar2
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:225: if (COMMAND_PIN == 0) {			//010-
	jb	_P1_0,L011007?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:226: waitms(4);
	mov	dptr,#0x0004
	push	ar2
	push	ar3
	lcall	_waitms
	pop	ar3
	pop	ar2
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:227: if (COMMAND_PIN == 0) {		//0100	
	jb	_P1_0,L011002?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:228: currentcmd = 4;
	mov	_currentcmd,#0x04
	sjmp	L011022?
L011002?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:231: currentcmd = 5;
	mov	_currentcmd,#0x05
	sjmp	L011022?
L011007?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:235: waitms(4);
	mov	dptr,#0x0004
	push	ar2
	push	ar3
	lcall	_waitms
	pop	ar3
	pop	ar2
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:236: if (COMMAND_PIN == 0) {		//0110
	jb	_P1_0,L011022?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:237: currentcmd = 6;
	mov	_currentcmd,#0x06
	sjmp	L011022?
L011019?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:242: waitms(4);
	mov	dptr,#0x0004
	push	ar2
	push	ar3
	lcall	_waitms
	pop	ar3
	pop	ar2
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:243: if (COMMAND_PIN == 1) {			//001-
	jnb	_P1_0,L011016?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:244: waitms(4);
	mov	dptr,#0x0004
	push	ar2
	push	ar3
	lcall	_waitms
	pop	ar3
	pop	ar2
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:245: if (COMMAND_PIN == 1) {		//0011
	jnb	_P1_0,L011010?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:246: currentcmd = 3;
	mov	_currentcmd,#0x03
	sjmp	L011022?
L011010?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:249: currentcmd = 2;
	mov	_currentcmd,#0x02
	sjmp	L011022?
L011016?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:253: waitms(4);
	mov	dptr,#0x0004
	push	ar2
	push	ar3
	lcall	_waitms
	pop	ar3
	pop	ar2
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:254: if (COMMAND_PIN == 1) {		//0001	
	jnb	_P1_0,L011013?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:255: currentcmd == 1;
	mov	a,_currentcmd
	sjmp	L011022?
L011013?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:258: commandflag = 1;
	mov	r2,#0x01
	mov	r3,#0x00
L011022?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:263: if (commandflag == 0) {					//only wait for signal to end if a command has been received. 
	mov	a,r2
	orl	a,r3
	jnz	L011027?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:264: while (COMMAND_PIN == 0) {}
L011023?:
	jnb	_P1_0,L011023?
L011027?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:267: printf("current command is %d\r\n", currentcmd);		
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
;forwardbackward           Allocated with name '_linetrack_forwardbackward_1_83'
;vleft                     Allocated with name '_linetrack_vleft_1_84'
;vright                    Allocated with name '_linetrack_vright_1_84'
;sloc0                     Allocated with name '_linetrack_sloc0_1_0'
;------------------------------------------------------------
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:271: void linetrack (int forwardbackward) {
;	-----------------------------------------
;	 function linetrack
;	-----------------------------------------
_linetrack:
	mov	_linetrack_forwardbackward_1_83,dpl
	mov	(_linetrack_forwardbackward_1_83 + 1),dph
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:275: vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	_linetrack_vleft_1_84,dpl
	mov	(_linetrack_vleft_1_84 + 1),dph
	mov	(_linetrack_vleft_1_84 + 2),b
	mov	(_linetrack_vleft_1_84 + 3),a
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:276: vright=Volts_at_Pin(LQFP32_MUX_P2_4);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_linetrack_vright_1_84,dpl
	mov	(_linetrack_vright_1_84 + 1),dph
	mov	(_linetrack_vright_1_84 + 2),b
	mov	(_linetrack_vright_1_84 + 3),a
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:278: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:280: pwm_Left1 = vright*vright*75/(vright*vright+vleft*vleft);
	push	_linetrack_vright_1_84
	push	(_linetrack_vright_1_84 + 1)
	push	(_linetrack_vright_1_84 + 2)
	push	(_linetrack_vright_1_84 + 3)
	mov	dpl,_linetrack_vright_1_84
	mov	dph,(_linetrack_vright_1_84 + 1)
	mov	b,(_linetrack_vright_1_84 + 2)
	mov	a,(_linetrack_vright_1_84 + 3)
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
	push	_linetrack_vright_1_84
	push	(_linetrack_vright_1_84 + 1)
	push	(_linetrack_vright_1_84 + 2)
	push	(_linetrack_vright_1_84 + 3)
	mov	dpl,_linetrack_vright_1_84
	mov	dph,(_linetrack_vright_1_84 + 1)
	mov	b,(_linetrack_vright_1_84 + 2)
	mov	a,(_linetrack_vright_1_84 + 3)
	lcall	___fsmul
	mov	_linetrack_sloc0_1_0,dpl
	mov	(_linetrack_sloc0_1_0 + 1),dph
	mov	(_linetrack_sloc0_1_0 + 2),b
	mov	(_linetrack_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_linetrack_vleft_1_84
	push	(_linetrack_vleft_1_84 + 1)
	push	(_linetrack_vleft_1_84 + 2)
	push	(_linetrack_vleft_1_84 + 3)
	mov	dpl,_linetrack_vleft_1_84
	mov	dph,(_linetrack_vleft_1_84 + 1)
	mov	b,(_linetrack_vleft_1_84 + 2)
	mov	a,(_linetrack_vleft_1_84 + 3)
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
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:281: pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:283: pwm_Right0 = vleft*vleft*75/(vright*vright+vleft*vleft);
	push	_linetrack_vleft_1_84
	push	(_linetrack_vleft_1_84 + 1)
	push	(_linetrack_vleft_1_84 + 2)
	push	(_linetrack_vleft_1_84 + 3)
	mov	dpl,_linetrack_vleft_1_84
	mov	dph,(_linetrack_vleft_1_84 + 1)
	mov	b,(_linetrack_vleft_1_84 + 2)
	mov	a,(_linetrack_vleft_1_84 + 3)
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
	push	_linetrack_vright_1_84
	push	(_linetrack_vright_1_84 + 1)
	push	(_linetrack_vright_1_84 + 2)
	push	(_linetrack_vright_1_84 + 3)
	mov	dpl,_linetrack_vright_1_84
	mov	dph,(_linetrack_vright_1_84 + 1)
	mov	b,(_linetrack_vright_1_84 + 2)
	mov	a,(_linetrack_vright_1_84 + 3)
	lcall	___fsmul
	mov	_linetrack_sloc0_1_0,dpl
	mov	(_linetrack_sloc0_1_0 + 1),dph
	mov	(_linetrack_sloc0_1_0 + 2),b
	mov	(_linetrack_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_linetrack_vleft_1_84
	push	(_linetrack_vleft_1_84 + 1)
	push	(_linetrack_vleft_1_84 + 2)
	push	(_linetrack_vleft_1_84 + 3)
	mov	dpl,_linetrack_vleft_1_84
	mov	dph,(_linetrack_vleft_1_84 + 1)
	mov	b,(_linetrack_vleft_1_84 + 2)
	mov	a,(_linetrack_vleft_1_84 + 3)
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
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:285: if (forwardbackward) {
	mov	a,_linetrack_forwardbackward_1_83
	orl	a,(_linetrack_forwardbackward_1_83 + 1)
	jz	L012003?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:286: pwm_Left0 = pwm_Left1;
	mov	_pwm_Left0,_pwm_Left1
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:287: pwm_Left1 = -1;
	mov	_pwm_Left1,#0xFF
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:288: pwm_Right1 = pwm_Right1;
	mov	_pwm_Right1,_pwm_Right1
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:289: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
L012003?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'stopcar'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:296: void stopcar () {
;	-----------------------------------------
;	 function stopcar
;	-----------------------------------------
_stopcar:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:297: pwm_Left1 = -1;
	mov	_pwm_Left1,#0xFF
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:298: pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:299: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:300: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'turncar'
;------------------------------------------------------------
;leftright                 Allocated to registers r2 r3 
;vleft                     Allocated with name '_turncar_vleft_1_88'
;vright                    Allocated with name '_turncar_vright_1_88'
;------------------------------------------------------------
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:303: void turncar (int leftright) {
;	-----------------------------------------
;	 function turncar
;	-----------------------------------------
_turncar:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:307: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:308: pwm_Left1 = -1;
	mov	_pwm_Left1,#0xFF
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:309: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:310: pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:313: if (leftright == 0) {
	mov	a,r2
	orl	a,r3
	jz	L014022?
	ljmp	L014012?
L014022?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:315: pwm_Right0 = 50;
	mov	_pwm_Right0,#0x32
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:317: waitms(1000);
	mov	dptr,#0x03E8
	lcall	_waitms
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:319: vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	_turncar_vleft_1_88,dpl
	mov	(_turncar_vleft_1_88 + 1),dph
	mov	(_turncar_vleft_1_88 + 2),b
	mov	(_turncar_vleft_1_88 + 3),a
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:320: vright=Volts_at_Pin(LQFP32_MUX_P2_4);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_turncar_vright_1_88,dpl
	mov	(_turncar_vright_1_88 + 1),dph
	mov	(_turncar_vright_1_88 + 2),b
	mov	(_turncar_vright_1_88 + 3),a
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:322: while (((vleft - vright) > 0.2) || ((vleft - vright) < (-0.2))) {
L014002?:
	push	_turncar_vright_1_88
	push	(_turncar_vright_1_88 + 1)
	push	(_turncar_vright_1_88 + 2)
	push	(_turncar_vright_1_88 + 3)
	mov	dpl,_turncar_vleft_1_88
	mov	dph,(_turncar_vleft_1_88 + 1)
	mov	b,(_turncar_vleft_1_88 + 2)
	mov	a,(_turncar_vleft_1_88 + 3)
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
	jnz	L014003?
	push	_turncar_vright_1_88
	push	(_turncar_vright_1_88 + 1)
	push	(_turncar_vright_1_88 + 2)
	push	(_turncar_vright_1_88 + 3)
	mov	dpl,_turncar_vleft_1_88
	mov	dph,(_turncar_vleft_1_88 + 1)
	mov	b,(_turncar_vleft_1_88 + 2)
	mov	a,(_turncar_vleft_1_88 + 3)
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
	jz	L014004?
L014003?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:324: vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	_turncar_vleft_1_88,dpl
	mov	(_turncar_vleft_1_88 + 1),dph
	mov	(_turncar_vleft_1_88 + 2),b
	mov	(_turncar_vleft_1_88 + 3),a
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:325: vright=Volts_at_Pin(LQFP32_MUX_P2_4);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_turncar_vright_1_88,dpl
	mov	(_turncar_vright_1_88 + 1),dph
	mov	(_turncar_vright_1_88 + 2),b
	mov	(_turncar_vright_1_88 + 3),a
	ljmp	L014002?
L014004?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:329: pwm_Right0 = -1; 		
	mov	_pwm_Right0,#0xFF
	ret
L014012?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:332: else if (leftright == 1) {
	cjne	r2,#0x01,L014025?
	cjne	r3,#0x00,L014025?
	sjmp	L014026?
L014025?:
	ret
L014026?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:334: pwm_Left1 = 50;
	mov	_pwm_Left1,#0x32
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:336: waitms(1000);
	mov	dptr,#0x03E8
	lcall	_waitms
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:338: vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	_turncar_vleft_1_88,dpl
	mov	(_turncar_vleft_1_88 + 1),dph
	mov	(_turncar_vleft_1_88 + 2),b
	mov	(_turncar_vleft_1_88 + 3),a
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:339: vright=Volts_at_Pin(LQFP32_MUX_P2_4);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_turncar_vright_1_88,dpl
	mov	(_turncar_vright_1_88 + 1),dph
	mov	(_turncar_vright_1_88 + 2),b
	mov	(_turncar_vright_1_88 + 3),a
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:341: while (((vleft - vright) > 0.2) || ((vleft - vright) < (-0.2))) {
L014006?:
	push	_turncar_vright_1_88
	push	(_turncar_vright_1_88 + 1)
	push	(_turncar_vright_1_88 + 2)
	push	(_turncar_vright_1_88 + 3)
	mov	dpl,_turncar_vleft_1_88
	mov	dph,(_turncar_vleft_1_88 + 1)
	mov	b,(_turncar_vleft_1_88 + 2)
	mov	a,(_turncar_vleft_1_88 + 3)
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
	jnz	L014007?
	push	_turncar_vright_1_88
	push	(_turncar_vright_1_88 + 1)
	push	(_turncar_vright_1_88 + 2)
	push	(_turncar_vright_1_88 + 3)
	mov	dpl,_turncar_vleft_1_88
	mov	dph,(_turncar_vleft_1_88 + 1)
	mov	b,(_turncar_vleft_1_88 + 2)
	mov	a,(_turncar_vleft_1_88 + 3)
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
	jz	L014008?
L014007?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:343: vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	_turncar_vleft_1_88,dpl
	mov	(_turncar_vleft_1_88 + 1),dph
	mov	(_turncar_vleft_1_88 + 2),b
	mov	(_turncar_vleft_1_88 + 3),a
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:344: vright=Volts_at_Pin(LQFP32_MUX_P2_4);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_turncar_vright_1_88,dpl
	mov	(_turncar_vright_1_88 + 1),dph
	mov	(_turncar_vright_1_88 + 2),b
	mov	(_turncar_vright_1_88 + 3),a
	ljmp	L014006?
L014008?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:348: pwm_Left1 = -1; 
	mov	_pwm_Left1,#0xFF
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uturn'
;------------------------------------------------------------
;vleft                     Allocated with name '_uturn_vleft_1_93'
;vright                    Allocated with name '_uturn_vright_1_93'
;------------------------------------------------------------
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:352: void uturn () {
;	-----------------------------------------
;	 function uturn
;	-----------------------------------------
_uturn:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:356: vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	_uturn_vleft_1_93,dpl
	mov	(_uturn_vleft_1_93 + 1),dph
	mov	(_uturn_vleft_1_93 + 2),b
	mov	(_uturn_vleft_1_93 + 3),a
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:357: vright=Volts_at_Pin(LQFP32_MUX_P2_4);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_uturn_vright_1_93,dpl
	mov	(_uturn_vright_1_93 + 1),dph
	mov	(_uturn_vright_1_93 + 2),b
	mov	(_uturn_vright_1_93 + 3),a
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:359: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:360: pwm_Left1 = 50;
	mov	_pwm_Left1,#0x32
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:361: pwm_Right0 = -1;
	mov	_pwm_Right0,#0xFF
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:362: pwm_Right1 = 50;
	mov	_pwm_Right1,#0x32
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:364: waitms(4000);
	mov	dptr,#0x0FA0
	lcall	_waitms
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:366: while (((vleft - vright) > 0.2) || ((vleft - vright) < (-0.2))) {
L015002?:
	push	_uturn_vright_1_93
	push	(_uturn_vright_1_93 + 1)
	push	(_uturn_vright_1_93 + 2)
	push	(_uturn_vright_1_93 + 3)
	mov	dpl,_uturn_vleft_1_93
	mov	dph,(_uturn_vleft_1_93 + 1)
	mov	b,(_uturn_vleft_1_93 + 2)
	mov	a,(_uturn_vleft_1_93 + 3)
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
	jnz	L015003?
	push	_uturn_vright_1_93
	push	(_uturn_vright_1_93 + 1)
	push	(_uturn_vright_1_93 + 2)
	push	(_uturn_vright_1_93 + 3)
	mov	dpl,_uturn_vleft_1_93
	mov	dph,(_uturn_vleft_1_93 + 1)
	mov	b,(_uturn_vleft_1_93 + 2)
	mov	a,(_uturn_vleft_1_93 + 3)
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
	jz	L015005?
L015003?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:368: vleft=Volts_at_Pin(LQFP32_MUX_P2_3);
	mov	dpl,#0x0B
	lcall	_Volts_at_Pin
	mov	_uturn_vleft_1_93,dpl
	mov	(_uturn_vleft_1_93 + 1),dph
	mov	(_uturn_vleft_1_93 + 2),b
	mov	(_uturn_vleft_1_93 + 3),a
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:369: vright=Volts_at_Pin(LQFP32_MUX_P2_4);
	mov	dpl,#0x0C
	lcall	_Volts_at_Pin
	mov	_uturn_vright_1_93,dpl
	mov	(_uturn_vright_1_93 + 1),dph
	mov	(_uturn_vright_1_93 + 2),b
	mov	(_uturn_vright_1_93 + 3),a
	ljmp	L015002?
L015005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:373: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:376: MOTOR_LEFT0 =0;
	clr	_P1_5
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:377: MOTOR_LEFT1 =0;
	clr	_P1_6
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:378: MOTOR_RIGHT0 =0;
	clr	_P2_0
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:379: MOTOR_RIGHT1 =0;
	clr	_P2_1
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:381: currentstate = 1;  	//initialize the car to be stopped
	mov	_currentstate,#0x01
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:382: currentcmd = 1;		//initialize the command to be null
	mov	_currentcmd,#0x01
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:385: printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
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
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:394: InitPinADC(2, 3); // Configure P2.3 as analog input
	mov	_InitPinADC_PARM_2,#0x03
	mov	dpl,#0x02
	lcall	_InitPinADC
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:395: InitPinADC(2, 4); // Configure P2.4 as analog input
	mov	_InitPinADC_PARM_2,#0x04
	mov	dpl,#0x02
	lcall	_InitPinADC
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:396: InitPinADC(1, 0);
	mov	_InitPinADC_PARM_2,#0x00
	mov	dpl,#0x01
	lcall	_InitPinADC
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:397: InitADC();
	lcall	_InitADC
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:406: while(P1_1 !=0);
L016001?:
	jb	_P1_1,L016001?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:407: printf("1\r\n");
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
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:408: while(P1_1 !=1);
L016004?:
	jnb	_P1_1,L016004?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:409: printf("0\r\n");
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
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:413: switch (currentstate) {
	mov	r2,_currentstate
	cjne	r2,#0x01,L016053?
	sjmp	L016007?
L016053?:
	cjne	r2,#0x02,L016054?
	sjmp	L016008?
L016054?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:414: case 1:
	cjne	r2,#0x03,L016010?
	sjmp	L016009?
L016007?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:415: linetrack(0);	//forwards
	mov	dptr,#0x0000
	lcall	_linetrack
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:416: break;
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:417: case 2:
	sjmp	L016010?
L016008?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:418: linetrack(1);	//backwards
	mov	dptr,#0x0001
	lcall	_linetrack
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:419: break;
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:420: case 3:
	sjmp	L016010?
L016009?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:421: stopcar();		//stop car
	lcall	_stopcar
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:423: }
L016010?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:425: switch (currentcmd) {
	mov	a,_currentcmd
	mov	r2,a
	jnb	acc.7,L016056?
	ljmp	L016029?
L016056?:
	clr	c
	mov	a,#(0x06 ^ 0x80)
	mov	b,r2
	xrl	b,#0x80
	subb	a,b
	jnc	L016057?
	ljmp	L016029?
L016057?:
	mov	a,r2
	add	a,r2
	add	a,r2
	mov	dptr,#L016058?
	jmp	@a+dptr
L016058?:
	ljmp	L016011?
	ljmp	L016017?
	ljmp	L016021?
	ljmp	L016025?
	ljmp	L016026?
	ljmp	L016027?
	ljmp	L016028?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:427: case 0 :
L016011?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:429: if (currentstate == 1) {
	mov	a,#0x01
	cjne	a,_currentstate,L016059?
	sjmp	L016060?
L016059?:
	ljmp	L016001?
L016060?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:430: if (Volts_at_Pin(LQFP32_MUX_P2_3) > 1 && Volts_at_Pin(LQFP32_MUX_P2_4) > 1) {
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
	jnz	L016061?
	ljmp	L016001?
L016061?:
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
	jnz	L016062?
	ljmp	L016001?
L016062?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:432: pwm_Left1 = 35;
	mov	_pwm_Left1,#0x23
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:433: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:434: pwm_Right0 = 35;
	mov	_pwm_Right0,#0x23
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:435: pwm_Right1 = -1;						
	mov	_pwm_Right1,#0xFF
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:436: waitms(1500);
	mov	dptr,#0x05DC
	lcall	_waitms
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:439: break;
	ljmp	L016001?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:440: case 1 :
L016017?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:442: if (Volts_at_Pin(LQFP32_MUX_P2_3) > 1 && Volts_at_Pin(LQFP32_MUX_P2_4) > 1) {
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
	jnz	L016063?
	ljmp	L016001?
L016063?:
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
	jnz	L016064?
	ljmp	L016001?
L016064?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:444: pwm_Left1 = 35;
	mov	_pwm_Left1,#0x23
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:445: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:446: pwm_Right0 = 35;
	mov	_pwm_Right0,#0x23
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:447: pwm_Right1 = -1;						
	mov	_pwm_Right1,#0xFF
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:448: waitms(1500);
	mov	dptr,#0x05DC
	lcall	_waitms
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:450: turncar(0); //0 = left
	mov	dptr,#0x0000
	lcall	_turncar
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:451: currentcmd = 0;
	mov	_currentcmd,#0x00
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:454: break;
	ljmp	L016001?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:457: case 2 :
L016021?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:459: if (Volts_at_Pin(LQFP32_MUX_P2_4) > 1 || Volts_at_Pin(LQFP32_MUX_P2_3) > 1) {
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
	jnz	L016022?
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
	jnz	L016066?
	ljmp	L016001?
L016066?:
L016022?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:460: printf("\n\r reached intersection :D");
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
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:461: pwm_Left1 = 35;
	mov	_pwm_Left1,#0x23
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:462: pwm_Left0 = -1;
	mov	_pwm_Left0,#0xFF
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:463: pwm_Right0 = 35;
	mov	_pwm_Right0,#0x23
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:464: pwm_Right1 = -1;
	mov	_pwm_Right1,#0xFF
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:465: waitms(1500);
	mov	dptr,#0x05DC
	lcall	_waitms
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:467: turncar(1); //1 = right
	mov	dptr,#0x0001
	lcall	_turncar
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:468: currentcmd = 0;
	mov	_currentcmd,#0x00
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:470: break;
	ljmp	L016001?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:473: case 3 :
L016025?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:474: currentstate = 1;
	mov	_currentstate,#0x01
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:475: currentcmd = 0;
	mov	_currentcmd,#0x00
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:476: break;
	ljmp	L016001?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:479: case 4 :
L016026?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:480: currentstate = 2;
	mov	_currentstate,#0x02
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:481: currentcmd = 0;
	mov	_currentcmd,#0x00
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:482: break;
	ljmp	L016001?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:485: case 5 :
L016027?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:486: currentstate = 3;
	mov	_currentstate,#0x03
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:487: currentcmd = 0;
	mov	_currentcmd,#0x00
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:488: break;
	ljmp	L016001?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:491: case 6 :
L016028?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:492: uturn();  //uturn
	lcall	_uturn
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:493: currentcmd = 0;
	mov	_currentcmd,#0x00
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:494: break;
	ljmp	L016001?
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:495: default: 
L016029?:
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:496: currentstate = 1;
	mov	_currentstate,#0x01
;	C:\Users\Wenoa\Documents\GitHub\ELEC291P2\src\motors.c:497: }
	ljmp	L016001?
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
	db '1'
	db 0x0D
	db 0x0A
	db 0x00
__str_3:
	db '0'
	db 0x0D
	db 0x0A
	db 0x00
__str_4:
	db 0x0A
	db 0x0D
	db ' reached intersection :D'
	db 0x00

	CSEG

end
