;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Sun Feb 26 19:39:14 2017
;--------------------------------------------------------
$name All_timers
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
	public _main
	public _PCA_ISR
	public _Timer5_ISR
	public _Timer4_ISR
	public _Timer3_ISR
	public _Timer2_ISR
	public _Timer1_ISR
	public _Timer0_ISR
	public __c51_external_startup
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
	CSEG at 0x000b
	ljmp	_Timer0_ISR
	CSEG at 0x001b
	ljmp	_Timer1_ISR
	CSEG at 0x002b
	ljmp	_Timer2_ISR
	CSEG at 0x005b
	ljmp	_PCA_ISR
	CSEG at 0x0073
	ljmp	_Timer3_ISR
	CSEG at 0x009b
	ljmp	_Timer4_ISR
	CSEG at 0x00a3
	ljmp	_Timer5_ISR
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
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	All_timers.c:42: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	All_timers.c:44: PCA0MD&=(~WDTE) ;    // DISABLE WDT: clear Watchdog Enable bit
	anl	_PCA0MD,#0xBF
;	All_timers.c:45: VDM0CN=0x80; // enable VDD monitor
	mov	_VDM0CN,#0x80
;	All_timers.c:46: RSTSRC=0x02|0x04; // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	All_timers.c:54: CLKSEL|=0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
	orl	_CLKSEL,#0x03
;	All_timers.c:58: OSCICN |= 0x03; // Configure internal oscillator for its maximum frequency
	orl	_OSCICN,#0x03
;	All_timers.c:61: P1MDOUT|=0b_0001_1111;
	orl	_P1MDOUT,#0x1F
;	All_timers.c:62: P2MDOUT|=0b_0111_1111;
	orl	_P2MDOUT,#0x7F
;	All_timers.c:63: XBR1     = 0x40; // Enable crossbar and weak pull-ups
	mov	_XBR1,#0x40
;	All_timers.c:66: TR0=0;
	clr	_TR0
;	All_timers.c:67: TF0=0;
	clr	_TF0
;	All_timers.c:68: CKCON|=0b_0000_0100; // Timer 0 uses the system clock
	orl	_CKCON,#0x04
;	All_timers.c:69: TMOD&=0xf0;
	anl	_TMOD,#0xF0
;	All_timers.c:70: TMOD|=0x01; // Timer 0 in mode 1: 16-bit timer
	orl	_TMOD,#0x01
;	All_timers.c:72: TH0=(65536L-(SYSCLK/(2*TIMER_0_FREQ)))/0x100;
	mov	_TH0,#0xA2
;	All_timers.c:73: TL0=(65536L-(SYSCLK/(2*TIMER_0_FREQ)))%0x100;
	mov	_TL0,#0x40
;	All_timers.c:74: ET0=1;     // Enable Timer0 interrupts
	setb	_ET0
;	All_timers.c:75: TR0=1;     // Start Timer0
	setb	_TR0
;	All_timers.c:78: TR1=0;
	clr	_TR1
;	All_timers.c:79: TF1=0;
	clr	_TF1
;	All_timers.c:80: CKCON|=0b_0000_1000; // Timer 1 uses the system clock
	orl	_CKCON,#0x08
;	All_timers.c:81: TMOD&=0x0f;
	anl	_TMOD,#0x0F
;	All_timers.c:82: TMOD|=0x10; // Timer 1 in mode 1: 16-bit timer
	orl	_TMOD,#0x10
;	All_timers.c:84: TH1=(65536L-(SYSCLK/(2*TIMER_1_FREQ)))/0x100;
	mov	_TH1,#0xD1
;	All_timers.c:85: TL1=(65536L-(SYSCLK/(2*TIMER_1_FREQ)))%0x100;
	mov	_TL1,#0x20
;	All_timers.c:86: ET1=1;     // Enable Timer1 interrupts
	setb	_ET1
;	All_timers.c:87: TR1=1;     // Start Timer1
	setb	_TR1
;	All_timers.c:90: TMR2CN=0x00;   // Stop Timer2; Clear TF2;
	mov	_TMR2CN,#0x00
;	All_timers.c:91: CKCON|=0b_0001_0000; // Timer 2 uses the system clock
	orl	_CKCON,#0x10
;	All_timers.c:92: TMR2RL=(0x10000L-(SYSCLK/(2*TIMER_2_FREQ))); // Initialize reload value
	mov	_TMR2RL,#0xC0
	mov	(_TMR2RL >> 8),#0xE0
;	All_timers.c:93: TMR2=0xffff;   // Set to reload immediately
	mov	_TMR2,#0xFF
	mov	(_TMR2 >> 8),#0xFF
;	All_timers.c:94: ET2=1;         // Enable Timer2 interrupts
	setb	_ET2
;	All_timers.c:95: TR2=1;         // Start Timer2 (TMR2CN is bit addressable)
	setb	_TR2
;	All_timers.c:98: TMR3CN=0x00;   // Stop Timer3; Clear TF3;
	mov	_TMR3CN,#0x00
;	All_timers.c:99: CKCON|=0b_0100_0000; // Timer 3 uses the system clock
	orl	_CKCON,#0x40
;	All_timers.c:100: TMR3RL=(0x10000L-(SYSCLK/(2*TIMER_3_FREQ))); // Initialize reload value
	mov	_TMR3RL,#0x90
	mov	(_TMR3RL >> 8),#0xE8
;	All_timers.c:101: TMR3=0xffff;   // Set to reload immediately
	mov	_TMR3,#0xFF
	mov	(_TMR3 >> 8),#0xFF
;	All_timers.c:102: EIE1|=ET3;     // Enable Timer3 interrupts
	orl	_EIE1,#0x80
;	All_timers.c:103: TMR3CN|=TR3;   // Start Timer3 (TMR3CN is not bit addressable)
	orl	_TMR3CN,#0x04
;	All_timers.c:106: SFRPAGE=0xf;   // WARNING: Select SFR page 0xf!
	mov	_SFRPAGE,#0x0F
;	All_timers.c:107: TMR4CN=0x00;   // Stop Timer4; Clear TF4;
	mov	_TMR4CN,#0x00
;	All_timers.c:108: CKCON1|=0b_0000_0001; // Timer 4 uses the system clock
	orl	_CKCON1,#0x01
;	All_timers.c:109: TMR4RL=(0x10000L-(SYSCLK/(2*TIMER_4_FREQ))); // Initialize reload value
	mov	_TMR4RL,#0x40
	mov	(_TMR4RL >> 8),#0xED
;	All_timers.c:110: TMR4=0xffff;   // Set to reload immediately
	mov	_TMR4,#0xFF
	mov	(_TMR4 >> 8),#0xFF
;	All_timers.c:111: EIE2|=ET4;     // Enable Timer3 interrupts
	orl	_EIE2,#0x10
;	All_timers.c:112: TMR4CN|=TR4;   // Start Timer4 (TMR4CN is not bit addressable)
	orl	_TMR4CN,#0x04
;	All_timers.c:115: SFRPAGE=0xf;   // WARNING: Select SFR page 0xf!
	mov	_SFRPAGE,#0x0F
;	All_timers.c:116: TMR5CN=0x00;   // Stop Timer5; Clear TF5;
	mov	_TMR5CN,#0x00
;	All_timers.c:117: CKCON1|=0b_0000_0100; // Timer 5 uses the system clock
	orl	_CKCON1,#0x04
;	All_timers.c:118: TMR5RL=(0x10000L-(SYSCLK/(2*TIMER_5_FREQ))); // Initialize reload value
	mov	_TMR5RL,#0x60
	mov	(_TMR5RL >> 8),#0xF0
;	All_timers.c:119: TMR5=0xffff;   // Set to reload immediately
	mov	_TMR5,#0xFF
	mov	(_TMR5 >> 8),#0xFF
;	All_timers.c:120: EIE2|=ET5;     // Enable Timer5 interrupts
	orl	_EIE2,#0x20
;	All_timers.c:121: TR5=1;         // Start Timer5 (TMR5CN is bit addressable)
	setb	_TR5
;	All_timers.c:125: SFRPAGE=0x0;
	mov	_SFRPAGE,#0x00
;	All_timers.c:126: PCA0MD=0x00; // Disable and clear everything in the PCA
	mov	_PCA0MD,#0x00
;	All_timers.c:127: PCA0L=0; // Initialize the PCA counter to zero
	mov	_PCA0L,#0x00
;	All_timers.c:128: PCA0H=0;
	mov	_PCA0H,#0x00
;	All_timers.c:129: PCA0MD=CPS2; // Configure PCA.  CLK is the frequency input for the PCA
	mov	_PCA0MD,#0x08
;	All_timers.c:131: PCA0CPM0=PCA0CPM1=PCA0CPM2=PCA0CPM3=PCA0CPM4=ECOM|MAT|ECCF;
	mov	_PCA0CPM4,#0x49
	mov	_PCA0CPM3,#0x49
	mov	_PCA0CPM2,#0x49
	mov	_PCA0CPM1,#0x49
	mov	_PCA0CPM0,#0x49
;	All_timers.c:133: PCA0CPL0=(SYSCLK/(2*PCA_0_FREQ))%0x100; //Always write low byte first!
	mov	_PCA0CPL0,#0x64
;	All_timers.c:134: PCA0CPH0=(SYSCLK/(2*PCA_0_FREQ))/0x100;
	mov	_PCA0CPH0,#0x0D
;	All_timers.c:136: PCA0CPL1=(SYSCLK/(2*PCA_1_FREQ))%0x100; //Always write low byte first!
	mov	_PCA0CPL1,#0xB8
;	All_timers.c:137: PCA0CPH1=(SYSCLK/(2*PCA_1_FREQ))/0x100;
	mov	_PCA0CPH1,#0x0B
;	All_timers.c:139: PCA0CPL2=(SYSCLK/(2*PCA_2_FREQ))%0x100; //Always write low byte first!
	mov	_PCA0CPL2,#0x6A
;	All_timers.c:140: PCA0CPH2=(SYSCLK/(2*PCA_2_FREQ))/0x100;
	mov	_PCA0CPH2,#0x0A
;	All_timers.c:142: PCA0CPL3=(SYSCLK/(2*PCA_3_FREQ))%0x100; //Always write low byte first!
	mov	_PCA0CPL3,#0x60
;	All_timers.c:143: PCA0CPH3=(SYSCLK/(2*PCA_3_FREQ))/0x100;
	mov	_PCA0CPH3,#0x09
;	All_timers.c:145: PCA0CPL4=(SYSCLK/(2*PCA_4_FREQ))%0x100; //Always write low byte first!
	mov	_PCA0CPL4,#0x85
;	All_timers.c:146: PCA0CPH4=(SYSCLK/(2*PCA_4_FREQ))/0x100;
	mov	_PCA0CPH4,#0x08
;	All_timers.c:147: CR=1; // Enable PCA counter
	setb	_CR
;	All_timers.c:148: EIE1|=EPCA0; // Enable PCA interrupts
	orl	_EIE1,#0x10
;	All_timers.c:150: EA=1; // Enable interrupts
	setb	_EA
;	All_timers.c:152: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer0_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	All_timers.c:155: void Timer0_ISR (void) interrupt INTERRUPT_TIMER0
;	-----------------------------------------
;	 function Timer0_ISR
;	-----------------------------------------
_Timer0_ISR:
;	All_timers.c:157: PUSH_SFRPAGE;
	 push _SFRPAGE 
;	All_timers.c:158: SFRPAGE=0x0;
	mov	_SFRPAGE,#0x00
;	All_timers.c:160: TH0=(0x10000L-(SYSCLK/(2*TIMER_0_FREQ)))/0x100;
	mov	_TH0,#0xA2
;	All_timers.c:161: TL0=(0x10000L-(SYSCLK/(2*TIMER_0_FREQ)))%0x100;
	mov	_TL0,#0x40
;	All_timers.c:162: TIMER_OUT_0=!TIMER_OUT_0;
	cpl	_P2_0
;	All_timers.c:163: POP_SFRPAGE;
	 pop _SFRPAGE 
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer1_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	All_timers.c:166: void Timer1_ISR (void) interrupt INTERRUPT_TIMER1
;	-----------------------------------------
;	 function Timer1_ISR
;	-----------------------------------------
_Timer1_ISR:
;	All_timers.c:168: PUSH_SFRPAGE;
	 push _SFRPAGE 
;	All_timers.c:169: SFRPAGE=0x0;
	mov	_SFRPAGE,#0x00
;	All_timers.c:171: TH1=(0x10000L-(SYSCLK/(2*TIMER_1_FREQ)))/0x100;
	mov	_TH1,#0xD1
;	All_timers.c:172: TL1=(0x10000L-(SYSCLK/(2*TIMER_1_FREQ)))%0x100;
	mov	_TL1,#0x20
;	All_timers.c:173: TIMER_OUT_1=!TIMER_OUT_1;
	cpl	_P2_1
;	All_timers.c:174: POP_SFRPAGE;
	 pop _SFRPAGE 
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	All_timers.c:177: void Timer2_ISR (void) interrupt INTERRUPT_TIMER2
;	-----------------------------------------
;	 function Timer2_ISR
;	-----------------------------------------
_Timer2_ISR:
;	All_timers.c:179: PUSH_SFRPAGE;
	 push _SFRPAGE 
;	All_timers.c:180: SFRPAGE=0x0;
	mov	_SFRPAGE,#0x00
;	All_timers.c:181: TF2H = 0; // Clear Timer2 interrupt flag
	clr	_TF2H
;	All_timers.c:182: TIMER_OUT_2=!TIMER_OUT_2;
	cpl	_P2_2
;	All_timers.c:183: POP_SFRPAGE;
	 pop _SFRPAGE 
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer3_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	All_timers.c:186: void Timer3_ISR (void) interrupt INTERRUPT_TIMER3
;	-----------------------------------------
;	 function Timer3_ISR
;	-----------------------------------------
_Timer3_ISR:
;	All_timers.c:188: PUSH_SFRPAGE;
	 push _SFRPAGE 
;	All_timers.c:189: SFRPAGE=0x0;
	mov	_SFRPAGE,#0x00
;	All_timers.c:190: TMR3CN&=~TF3H; // Clear Timer3 interrupt flag
	anl	_TMR3CN,#0x7F
;	All_timers.c:191: TIMER_OUT_3=!TIMER_OUT_3;
	cpl	_P2_3
;	All_timers.c:192: POP_SFRPAGE;
	 pop _SFRPAGE 
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer4_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	All_timers.c:195: void Timer4_ISR (void) interrupt INTERRUPT_TIMER4
;	-----------------------------------------
;	 function Timer4_ISR
;	-----------------------------------------
_Timer4_ISR:
;	All_timers.c:197: PUSH_SFRPAGE;
	 push _SFRPAGE 
;	All_timers.c:198: SFRPAGE=0xf;
	mov	_SFRPAGE,#0x0F
;	All_timers.c:199: TMR4CN&=~TF4H; // Clear Timer4 interrupt flag
	anl	_TMR4CN,#0x7F
;	All_timers.c:200: TIMER_OUT_4=!TIMER_OUT_4;
	cpl	_P2_4
;	All_timers.c:201: POP_SFRPAGE;
	 pop _SFRPAGE 
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer5_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	All_timers.c:204: void Timer5_ISR (void) interrupt INTERRUPT_TIMER5
;	-----------------------------------------
;	 function Timer5_ISR
;	-----------------------------------------
_Timer5_ISR:
;	All_timers.c:206: PUSH_SFRPAGE;
	 push _SFRPAGE 
;	All_timers.c:207: SFRPAGE=0xf;
	mov	_SFRPAGE,#0x0F
;	All_timers.c:208: TF5H = 0; // Clear Timer5 interrupt flag
	clr	_TF5H
;	All_timers.c:209: SFRPAGE=0xf;
	mov	_SFRPAGE,#0x0F
;	All_timers.c:210: TIMER_OUT_5=!TIMER_OUT_5;
	cpl	_P2_5
;	All_timers.c:211: POP_SFRPAGE;
	 pop _SFRPAGE 
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
;------------------------------------------------------------
;Allocation info for local variables in function 'PCA_ISR'
;------------------------------------------------------------
;j                         Allocated to registers r2 r3 
;------------------------------------------------------------
;	All_timers.c:214: void PCA_ISR (void) interrupt INTERRUPT_PCA0
;	-----------------------------------------
;	 function PCA_ISR
;	-----------------------------------------
_PCA_ISR:
	push	acc
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	psw
	mov	psw,#0x00
;	All_timers.c:218: PUSH_SFRPAGE;
	 push _SFRPAGE 
;	All_timers.c:219: SFRPAGE=0x0;
	mov	_SFRPAGE,#0x00
;	All_timers.c:221: if (CCF0)
	jnb	_CCF0,L009002?
;	All_timers.c:223: j=(PCA0CPH0*0x100+PCA0CPL0)+(SYSCLK/(2L*PCA_0_FREQ));
	mov	r3,_PCA0CPH0
	mov	r2,#0x00
	mov	r4,_PCA0CPL0
	mov	r5,#0x00
	mov	a,r4
	add	a,r2
	mov	r2,a
	mov	a,r5
	addc	a,r3
	mov	r3,a
	rlc	a
	subb	a,acc
	mov	r4,a
	mov	r5,a
	mov	a,#0x64
	add	a,r2
	mov	r2,a
	mov	a,#0x0D
	addc	a,r3
	mov	r3,a
	clr	a
	addc	a,r4
	clr	a
	addc	a,r5
;	All_timers.c:224: PCA0CPL0=j%0x100; //Always write low byte first!
	mov	ar4,r2
	mov	_PCA0CPL0,r4
;	All_timers.c:225: PCA0CPH0=j/0x100;
	mov	ar4,r3
	mov	r5,#0x00
	mov	_PCA0CPH0,r4
;	All_timers.c:226: CCF0=0;
	clr	_CCF0
;	All_timers.c:227: PCA_OUT_0=!PCA_OUT_0;
	cpl	_P1_0
L009002?:
;	All_timers.c:229: if (CCF1)
	jnb	_CCF1,L009004?
;	All_timers.c:231: j=(PCA0CPH1*0x100+PCA0CPL1)+(SYSCLK/(2L*PCA_1_FREQ));
	mov	r5,_PCA0CPH1
	mov	r4,#0x00
	mov	r6,_PCA0CPL1
	mov	r7,#0x00
	mov	a,r6
	add	a,r4
	mov	r4,a
	mov	a,r7
	addc	a,r5
	mov	r5,a
	rlc	a
	subb	a,acc
	mov	r6,a
	mov	r7,a
	mov	a,#0xB8
	add	a,r4
	mov	r4,a
	mov	a,#0x0B
	addc	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	clr	a
	addc	a,r7
	mov	r7,a
	mov	ar2,r4
	mov	ar3,r5
;	All_timers.c:232: PCA0CPL1=j%0x100; //Always write low byte first!
	mov	ar4,r2
	mov	_PCA0CPL1,r4
;	All_timers.c:233: PCA0CPH1=j/0x100;
	mov	ar4,r3
	mov	r5,#0x00
	mov	_PCA0CPH1,r4
;	All_timers.c:234: CCF1=0;
	clr	_CCF1
;	All_timers.c:235: PCA_OUT_1=!PCA_OUT_1;
	cpl	_P1_1
L009004?:
;	All_timers.c:237: if (CCF2)
	jnb	_CCF2,L009006?
;	All_timers.c:239: j=(PCA0CPH2*0x100+PCA0CPL2)+(SYSCLK/(2L*PCA_2_FREQ));
	mov	r5,_PCA0CPH2
	mov	r4,#0x00
	mov	r6,_PCA0CPL2
	mov	r7,#0x00
	mov	a,r6
	add	a,r4
	mov	r4,a
	mov	a,r7
	addc	a,r5
	mov	r5,a
	rlc	a
	subb	a,acc
	mov	r6,a
	mov	r7,a
	mov	a,#0x6A
	add	a,r4
	mov	r4,a
	mov	a,#0x0A
	addc	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	clr	a
	addc	a,r7
	mov	r7,a
	mov	ar2,r4
	mov	ar3,r5
;	All_timers.c:240: PCA0CPL2=j%0x100; //Always write low byte first!
	mov	ar4,r2
	mov	_PCA0CPL2,r4
;	All_timers.c:241: PCA0CPH2=j/0x100;
	mov	ar4,r3
	mov	r5,#0x00
	mov	_PCA0CPH2,r4
;	All_timers.c:242: CCF2=0;
	clr	_CCF2
;	All_timers.c:243: PCA_OUT_2=!PCA_OUT_2;
	cpl	_P1_2
L009006?:
;	All_timers.c:245: if (CCF3)
	jnb	_CCF3,L009008?
;	All_timers.c:247: j=(PCA0CPH3*0x100+PCA0CPL3)+(SYSCLK/(2L*PCA_3_FREQ));
	mov	r5,_PCA0CPH3
	mov	r4,#0x00
	mov	r6,_PCA0CPL3
	mov	r7,#0x00
	mov	a,r6
	add	a,r4
	mov	r4,a
	mov	a,r7
	addc	a,r5
	mov	r5,a
	rlc	a
	subb	a,acc
	mov	r6,a
	mov	r7,a
	mov	a,#0x60
	add	a,r4
	mov	r4,a
	mov	a,#0x09
	addc	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	clr	a
	addc	a,r7
	mov	r7,a
	mov	ar2,r4
	mov	ar3,r5
;	All_timers.c:248: PCA0CPL3=j%0x100; //Always write low byte first!
	mov	ar4,r2
	mov	_PCA0CPL3,r4
;	All_timers.c:249: PCA0CPH3=j/0x100;
	mov	ar4,r3
	mov	r5,#0x00
	mov	_PCA0CPH3,r4
;	All_timers.c:250: CCF3=0;
	clr	_CCF3
;	All_timers.c:251: PCA_OUT_3=!PCA_OUT_3;
	cpl	_P1_3
L009008?:
;	All_timers.c:253: if (CCF4)
	jnb	_CCF4,L009010?
;	All_timers.c:255: j=(PCA0CPH4*0x100+PCA0CPL4)+(SYSCLK/(2L*PCA_4_FREQ));
	mov	r5,_PCA0CPH4
	mov	r4,#0x00
	mov	r6,_PCA0CPL4
	mov	r7,#0x00
	mov	a,r6
	add	a,r4
	mov	r4,a
	mov	a,r7
	addc	a,r5
	mov	r5,a
	rlc	a
	subb	a,acc
	mov	r6,a
	mov	r7,a
	mov	a,#0x85
	add	a,r4
	mov	r4,a
	mov	a,#0x08
	addc	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	clr	a
	addc	a,r7
	mov	r7,a
	mov	ar2,r4
	mov	ar3,r5
;	All_timers.c:256: PCA0CPL4=j%0x100; //Always write low byte first!
	mov	ar4,r2
	mov	r5,#0x00
	mov	_PCA0CPL4,r4
;	All_timers.c:257: PCA0CPH4=j/0x100;
	mov	ar2,r3
	mov	r3,#0x00
	mov	_PCA0CPH4,r2
;	All_timers.c:258: CCF4=0;
	clr	_CCF4
;	All_timers.c:259: PCA_OUT_4=!PCA_OUT_4;
	cpl	_P1_4
L009010?:
;	All_timers.c:262: CF=0;
	clr	_CF
;	All_timers.c:263: POP_SFRPAGE;
	 pop _SFRPAGE 
	pop	psw
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	pop	acc
	reti
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;------------------------------------------------------------
;	All_timers.c:266: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	All_timers.c:268: while(1)
L010002?:
;	All_timers.c:270: MAIN_OUT=!MAIN_OUT;
	cpl	_P2_6
	sjmp	L010002?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST

	CSEG

end
