;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Sun Feb 26 15:48:40 2017
;--------------------------------------------------------
$name f38x_autotest
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
	public _Initial_Check
	public _Check_Pin_Zero
	public _Test_Pair
	public _dopass
	public _dofailb
	public _dofail
	public _Read_Pin
	public _Set_Pin_Zero
	public _Set_Pin_One
	public _Set_Pin_Input
	public _Set_Pin_Output
	public _countzero
	public _WaitXms
	public _Timer3us
	public __c51_external_startup
	public _UART0_Init
	public _SYSCLK_Init
	public _PORT_Init
	public _Test_Pair_PARM_2
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
_Test_Pair_PARM_2:
	ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
	rseg	R_OSEG
	rseg	R_OSEG
	rseg	R_OSEG
	rseg	R_OSEG
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
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
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
;Allocation info for local variables in function 'PORT_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	f38x_autotest.c:27: void PORT_Init (void)
;	-----------------------------------------
;	 function PORT_Init
;	-----------------------------------------
_PORT_Init:
	using	0
;	f38x_autotest.c:29: P0MDOUT |= 0x10; // Enable UTX as push-pull output
	orl	_P0MDOUT,#0x10
;	f38x_autotest.c:30: XBR0     = 0x01; // Enable UART on P0.4(TX) and P0.5(RX)                     
	mov	_XBR0,#0x01
;	f38x_autotest.c:31: XBR1     = 0x40; // Enable crossbar and weak pull-ups
	mov	_XBR1,#0x40
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SYSCLK_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	f38x_autotest.c:34: void SYSCLK_Init (void)
;	-----------------------------------------
;	 function SYSCLK_Init
;	-----------------------------------------
_SYSCLK_Init:
;	f38x_autotest.c:42: CLKSEL|=0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
	orl	_CLKSEL,#0x03
;	f38x_autotest.c:46: OSCICN |= 0x03;   // Configure internal oscillator for its maximum frequency
	orl	_OSCICN,#0x03
;	f38x_autotest.c:47: RSTSRC  = 0x04;   // Enable missing clock detector
	mov	_RSTSRC,#0x04
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'UART0_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	f38x_autotest.c:50: void UART0_Init (void)
;	-----------------------------------------
;	 function UART0_Init
;	-----------------------------------------
_UART0_Init:
;	f38x_autotest.c:52: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	f38x_autotest.c:55: TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	mov	_TH1,#0x30
;	f38x_autotest.c:56: CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	anl	_CKCON,#0xF4
;	f38x_autotest.c:57: CKCON |=  0x08;
	orl	_CKCON,#0x08
;	f38x_autotest.c:70: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	f38x_autotest.c:71: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
	anl	_TMOD,#0x0F
;	f38x_autotest.c:72: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	f38x_autotest.c:73: TR1 = 1; // START Timer1
	setb	_TR1
;	f38x_autotest.c:74: TI = 1;  // Indicate TX0 ready
	setb	_TI
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	f38x_autotest.c:77: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
;	f38x_autotest.c:79: PCA0MD &= ~0x40; // WDTE = 0 (clear watchdog timer enable)
	anl	_PCA0MD,#0xBF
;	f38x_autotest.c:80: PORT_Init();     // Initialize Port I/O
	lcall	_PORT_Init
;	f38x_autotest.c:81: SYSCLK_Init ();  // Initialize Oscillator
	lcall	_SYSCLK_Init
;	f38x_autotest.c:82: UART0_Init();    // Initialize UART0
	lcall	_UART0_Init
;	f38x_autotest.c:83: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer3us'
;------------------------------------------------------------
;us                        Allocated to registers r2 r3 r4 r5 
;i                         Allocated to registers r6 r7 r0 r1 
;------------------------------------------------------------
;	f38x_autotest.c:87: void Timer3us(unsigned long us)
;	-----------------------------------------
;	 function Timer3us
;	-----------------------------------------
_Timer3us:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
;	f38x_autotest.c:92: CKCON|=0b_0100_0000;
	orl	_CKCON,#0x40
;	f38x_autotest.c:94: TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	mov	_TMR3RL,#0xD0
	mov	(_TMR3RL >> 8),#0xFF
;	f38x_autotest.c:95: TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	f38x_autotest.c:97: TMR3CN = 0x04;                 // Sart Timer3 and clear overflow flag
	mov	_TMR3CN,#0x04
;	f38x_autotest.c:98: for (i = 0; i < us; i++)       // Count <us> overflows
	mov	r6,#0x00
	mov	r7,#0x00
	mov	r0,#0x00
	mov	r1,#0x00
L006004?:
	clr	c
	mov	a,r6
	subb	a,r2
	mov	a,r7
	subb	a,r3
	mov	a,r0
	subb	a,r4
	mov	a,r1
	subb	a,r5
	jnc	L006007?
;	f38x_autotest.c:100: while (!(TMR3CN & 0x80));  // Wait for overflow
L006001?:
	mov	a,_TMR3CN
	jnb	acc.7,L006001?
;	f38x_autotest.c:101: TMR3CN &= ~(0x80);         // Clear overflow indicator
	anl	_TMR3CN,#0x7F
;	f38x_autotest.c:98: for (i = 0; i < us; i++)       // Count <us> overflows
	inc	r6
	cjne	r6,#0x00,L006016?
	inc	r7
	cjne	r7,#0x00,L006016?
	inc	r0
	cjne	r0,#0x00,L006004?
	inc	r1
L006016?:
	sjmp	L006004?
L006007?:
;	f38x_autotest.c:103: TMR3CN = 0 ;                   // Stop Timer3 and clear overflow flag
	mov	_TMR3CN,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'WaitXms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r2 r3 
;------------------------------------------------------------
;	f38x_autotest.c:106: void WaitXms (unsigned int ms)
;	-----------------------------------------
;	 function WaitXms
;	-----------------------------------------
_WaitXms:
	mov	r2,dpl
	mov	r3,dph
;	f38x_autotest.c:109: for(j=ms; j!=0; j--)
L007001?:
	cjne	r2,#0x00,L007010?
	cjne	r3,#0x00,L007010?
	ret
L007010?:
;	f38x_autotest.c:111: Timer3us(249);
	mov	dptr,#(0xF9&0x00ff)
	clr	a
	mov	b,a
	push	ar2
	push	ar3
	lcall	_Timer3us
;	f38x_autotest.c:112: Timer3us(249);
	mov	dptr,#(0xF9&0x00ff)
	clr	a
	mov	b,a
	lcall	_Timer3us
;	f38x_autotest.c:113: Timer3us(249);
	mov	dptr,#(0xF9&0x00ff)
	clr	a
	mov	b,a
	lcall	_Timer3us
;	f38x_autotest.c:114: Timer3us(250);
	mov	dptr,#(0xFA&0x00ff)
	clr	a
	mov	b,a
	lcall	_Timer3us
	pop	ar3
	pop	ar2
;	f38x_autotest.c:109: for(j=ms; j!=0; j--)
	dec	r2
	cjne	r2,#0xff,L007011?
	dec	r3
L007011?:
	sjmp	L007001?
;------------------------------------------------------------
;Allocation info for local variables in function 'countzero'
;------------------------------------------------------------
;j                         Allocated to registers r2 
;------------------------------------------------------------
;	f38x_autotest.c:118: unsigned char countzero(void)
;	-----------------------------------------
;	 function countzero
;	-----------------------------------------
_countzero:
;	f38x_autotest.c:122: j=0;
	mov	r2,#0x00
;	f38x_autotest.c:124: if (P0_0==0) j++;
	jb	_P0_0,L008002?
	mov	r2,#0x01
L008002?:
;	f38x_autotest.c:125: if (P0_1==0) j++;
	jb	_P0_1,L008004?
	inc	r2
L008004?:
;	f38x_autotest.c:126: if (P0_2==0) j++;
	jb	_P0_2,L008006?
	inc	r2
L008006?:
;	f38x_autotest.c:127: if (P0_3==0) j++;
	jb	_P0_3,L008008?
	inc	r2
L008008?:
;	f38x_autotest.c:130: if (P0_6==0) j++;
	jb	_P0_6,L008010?
	inc	r2
L008010?:
;	f38x_autotest.c:131: if (P0_7==0) j++;
	jb	_P0_7,L008012?
	inc	r2
L008012?:
;	f38x_autotest.c:133: if (P1_0==0) j++;
	jb	_P1_0,L008014?
	inc	r2
L008014?:
;	f38x_autotest.c:134: if (P1_1==0) j++;
	jb	_P1_1,L008016?
	inc	r2
L008016?:
;	f38x_autotest.c:135: if (P1_2==0) j++;
	jb	_P1_2,L008018?
	inc	r2
L008018?:
;	f38x_autotest.c:136: if (P1_3==0) j++;
	jb	_P1_3,L008020?
	inc	r2
L008020?:
;	f38x_autotest.c:137: if (P1_4==0) j++;
	jb	_P1_4,L008022?
	inc	r2
L008022?:
;	f38x_autotest.c:138: if (P1_5==0) j++;
	jb	_P1_5,L008024?
	inc	r2
L008024?:
;	f38x_autotest.c:139: if (P1_6==0) j++;
	jb	_P1_6,L008026?
	inc	r2
L008026?:
;	f38x_autotest.c:140: if (P1_7==0) j++;
	jb	_P1_7,L008028?
	inc	r2
L008028?:
;	f38x_autotest.c:142: if (P2_0==0) j++;
	jb	_P2_0,L008030?
	inc	r2
L008030?:
;	f38x_autotest.c:143: if (P2_1==0) j++;
	jb	_P2_1,L008032?
	inc	r2
L008032?:
;	f38x_autotest.c:144: if (P2_2==0) j++;
	jb	_P2_2,L008034?
	inc	r2
L008034?:
;	f38x_autotest.c:145: if (P2_3==0) j++;
	jb	_P2_3,L008036?
	inc	r2
L008036?:
;	f38x_autotest.c:146: if (P2_4==0) j++;
	jb	_P2_4,L008038?
	inc	r2
L008038?:
;	f38x_autotest.c:147: if (P2_5==0) j++;
	jb	_P2_5,L008040?
	inc	r2
L008040?:
;	f38x_autotest.c:148: if (P2_6==0) j++;
	jb	_P2_6,L008042?
	inc	r2
L008042?:
;	f38x_autotest.c:149: if (P2_7==0) j++;
	jb	_P2_7,L008044?
	inc	r2
L008044?:
;	f38x_autotest.c:151: if (P3_0==0) j++;
	jb	_P3_0,L008046?
	inc	r2
L008046?:
;	f38x_autotest.c:153: return j;
	mov	dpl,r2
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Set_Pin_Output'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;mask                      Allocated to registers r3 
;------------------------------------------------------------
;	f38x_autotest.c:156: void Set_Pin_Output (unsigned char pin)
;	-----------------------------------------
;	 function Set_Pin_Output
;	-----------------------------------------
_Set_Pin_Output:
	mov	r2,dpl
;	f38x_autotest.c:160: mask=(1<<(pin&0x7));
	mov	a,#0x07
	anl	a,r2
	mov	b,a
	inc	b
	mov	a,#0x01
	sjmp	L009011?
L009009?:
	add	a,acc
L009011?:
	djnz	b,L009009?
	mov	r3,a
;	f38x_autotest.c:161: switch(pin/0x10)
	mov	a,r2
	swap	a
	anl	a,#0x0f
	mov  r2,a
	add	a,#0xff - 0x03
	jc	L009006?
	mov	a,r2
	add	a,r2
	add	a,r2
	mov	dptr,#L009013?
	jmp	@a+dptr
L009013?:
	ljmp	L009001?
	ljmp	L009002?
	ljmp	L009003?
	ljmp	L009004?
;	f38x_autotest.c:163: case 0: P0MDOUT |= mask; break;
L009001?:
	mov	a,r3
	orl	_P0MDOUT,a
;	f38x_autotest.c:164: case 1: P1MDOUT |= mask; break;
	ret
L009002?:
	mov	a,r3
	orl	_P1MDOUT,a
;	f38x_autotest.c:165: case 2: P2MDOUT |= mask; break; 
	ret
L009003?:
	mov	a,r3
	orl	_P2MDOUT,a
;	f38x_autotest.c:166: case 3: P3MDOUT |= mask; break; 
	ret
L009004?:
	mov	a,r3
	orl	_P3MDOUT,a
;	f38x_autotest.c:167: }	
L009006?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Set_Pin_Input'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;mask                      Allocated to registers r3 
;------------------------------------------------------------
;	f38x_autotest.c:170: void Set_Pin_Input (unsigned char pin)
;	-----------------------------------------
;	 function Set_Pin_Input
;	-----------------------------------------
_Set_Pin_Input:
	mov	r2,dpl
;	f38x_autotest.c:174: mask=(1<<(pin&0x7));
	mov	a,#0x07
	anl	a,r2
	mov	b,a
	inc	b
	mov	a,#0x01
	sjmp	L010011?
L010009?:
	add	a,acc
L010011?:
	djnz	b,L010009?
;	f38x_autotest.c:175: mask=~mask;
	cpl	a
	mov	r3,a
;	f38x_autotest.c:176: switch(pin/0x10)
	mov	a,r2
	swap	a
	anl	a,#0x0f
	mov  r2,a
	add	a,#0xff - 0x03
	jc	L010006?
	mov	a,r2
	add	a,r2
	add	a,r2
	mov	dptr,#L010013?
	jmp	@a+dptr
L010013?:
	ljmp	L010001?
	ljmp	L010002?
	ljmp	L010003?
	ljmp	L010004?
;	f38x_autotest.c:178: case 0: P0MDOUT &= mask; break;
L010001?:
	mov	a,r3
	anl	_P0MDOUT,a
;	f38x_autotest.c:179: case 1: P1MDOUT &= mask; break;
	ret
L010002?:
	mov	a,r3
	anl	_P1MDOUT,a
;	f38x_autotest.c:180: case 2: P2MDOUT &= mask; break; 
	ret
L010003?:
	mov	a,r3
	anl	_P2MDOUT,a
;	f38x_autotest.c:181: case 3: P3MDOUT &= mask; break; 
	ret
L010004?:
	mov	a,r3
	anl	_P3MDOUT,a
;	f38x_autotest.c:182: }	
L010006?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Set_Pin_One'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;mask                      Allocated to registers r3 
;------------------------------------------------------------
;	f38x_autotest.c:185: void Set_Pin_One (unsigned char pin)
;	-----------------------------------------
;	 function Set_Pin_One
;	-----------------------------------------
_Set_Pin_One:
	mov	r2,dpl
;	f38x_autotest.c:189: mask=(1<<(pin&0x7));
	mov	a,#0x07
	anl	a,r2
	mov	b,a
	inc	b
	mov	a,#0x01
	sjmp	L011011?
L011009?:
	add	a,acc
L011011?:
	djnz	b,L011009?
	mov	r3,a
;	f38x_autotest.c:190: switch(pin/0x10)
	mov	a,r2
	swap	a
	anl	a,#0x0f
	mov  r2,a
	add	a,#0xff - 0x03
	jc	L011006?
	mov	a,r2
	add	a,r2
	add	a,r2
	mov	dptr,#L011013?
	jmp	@a+dptr
L011013?:
	ljmp	L011001?
	ljmp	L011002?
	ljmp	L011003?
	ljmp	L011004?
;	f38x_autotest.c:192: case 0: P0 |= mask; break;
L011001?:
	mov	a,r3
	orl	_P0,a
;	f38x_autotest.c:193: case 1: P1 |= mask; break;
	ret
L011002?:
	mov	a,r3
	orl	_P1,a
;	f38x_autotest.c:194: case 2: P2 |= mask; break; 
	ret
L011003?:
	mov	a,r3
	orl	_P2,a
;	f38x_autotest.c:195: case 3: P3 |= mask; break; 
	ret
L011004?:
	mov	a,r3
	orl	_P3,a
;	f38x_autotest.c:196: }	
L011006?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Set_Pin_Zero'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;mask                      Allocated to registers r3 
;------------------------------------------------------------
;	f38x_autotest.c:199: void Set_Pin_Zero (unsigned char pin)
;	-----------------------------------------
;	 function Set_Pin_Zero
;	-----------------------------------------
_Set_Pin_Zero:
	mov	r2,dpl
;	f38x_autotest.c:203: mask=(1<<(pin&0x7));
	mov	a,#0x07
	anl	a,r2
	mov	b,a
	inc	b
	mov	a,#0x01
	sjmp	L012011?
L012009?:
	add	a,acc
L012011?:
	djnz	b,L012009?
;	f38x_autotest.c:204: mask=~mask;
	cpl	a
	mov	r3,a
;	f38x_autotest.c:205: switch(pin/0x10)
	mov	a,r2
	swap	a
	anl	a,#0x0f
	mov  r2,a
	add	a,#0xff - 0x03
	jc	L012006?
	mov	a,r2
	add	a,r2
	add	a,r2
	mov	dptr,#L012013?
	jmp	@a+dptr
L012013?:
	ljmp	L012001?
	ljmp	L012002?
	ljmp	L012003?
	ljmp	L012004?
;	f38x_autotest.c:207: case 0: P0 &= mask; break;
L012001?:
	mov	a,r3
	anl	_P0,a
;	f38x_autotest.c:208: case 1: P1 &= mask; break;
	ret
L012002?:
	mov	a,r3
	anl	_P1,a
;	f38x_autotest.c:209: case 2: P2 &= mask; break; 
	ret
L012003?:
	mov	a,r3
	anl	_P2,a
;	f38x_autotest.c:210: case 3: P3 &= mask; break; 
	ret
L012004?:
	mov	a,r3
	anl	_P3,a
;	f38x_autotest.c:211: }	
L012006?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Read_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;mask                      Allocated to registers r3 
;result                    Allocated to registers r2 
;------------------------------------------------------------
;	f38x_autotest.c:214: bit Read_Pin (unsigned char pin)
;	-----------------------------------------
;	 function Read_Pin
;	-----------------------------------------
_Read_Pin:
	mov	r2,dpl
;	f38x_autotest.c:218: mask=(1<<(pin&0x7));
	mov	a,#0x07
	anl	a,r2
	mov	b,a
	inc	b
	mov	a,#0x01
	sjmp	L013012?
L013010?:
	add	a,acc
L013012?:
	djnz	b,L013010?
	mov	r3,a
;	f38x_autotest.c:219: switch(pin/0x10)
	mov	a,r2
	swap	a
	anl	a,#0x0f
	mov  r2,a
	add	a,#0xff - 0x03
	jc	L013002?
	mov	a,r2
	add	a,r2
	add	a,r2
	mov	dptr,#L013014?
	jmp	@a+dptr
L013014?:
	ljmp	L013002?
	ljmp	L013003?
	ljmp	L013004?
	ljmp	L013005?
;	f38x_autotest.c:222: case 0: result = P0 & mask; break;
L013002?:
	mov	a,r3
	anl	a,_P0
	mov	r2,a
;	f38x_autotest.c:223: case 1: result = P1 & mask; break;
	sjmp	L013006?
L013003?:
	mov	a,r3
	anl	a,_P1
	mov	r2,a
;	f38x_autotest.c:224: case 2: result = P2 & mask; break; 
	sjmp	L013006?
L013004?:
	mov	a,r3
	anl	a,_P2
	mov	r2,a
;	f38x_autotest.c:225: case 3: result = P3 & mask; break; 
	sjmp	L013006?
L013005?:
	mov	a,r3
	anl	a,_P3
	mov	r2,a
;	f38x_autotest.c:226: }
L013006?:
;	f38x_autotest.c:227: return (result?1:0);
	mov	a,r2
	add	a,#0xff
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'dofail'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;------------------------------------------------------------
;	f38x_autotest.c:230: void dofail(unsigned char pin)
;	-----------------------------------------
;	 function dofail
;	-----------------------------------------
_dofail:
	mov	r2,dpl
;	f38x_autotest.c:232: printf("P%d.%d FAILED (OPEN)\n", pin/0x10, pin&7);
	mov	a,#0x07
	anl	a,r2
	mov	r3,a
	mov	r4,#0x00
	mov	a,r2
	swap	a
	anl	a,#0x0f
	mov	r2,a
	mov	r5,#0x00
	push	ar3
	push	ar4
	push	ar2
	push	ar5
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	f38x_autotest.c:233: while(1);
L014002?:
	sjmp	L014002?
;------------------------------------------------------------
;Allocation info for local variables in function 'dofailb'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;------------------------------------------------------------
;	f38x_autotest.c:236: void dofailb(unsigned char pin)
;	-----------------------------------------
;	 function dofailb
;	-----------------------------------------
_dofailb:
	mov	r2,dpl
;	f38x_autotest.c:238: printf("P%d.%d FAILED (SHORT)\n", pin/0x10, pin&7);
	mov	a,#0x07
	anl	a,r2
	mov	r3,a
	mov	r4,#0x00
	mov	a,r2
	swap	a
	anl	a,#0x0f
	mov	r2,a
	mov	r5,#0x00
	push	ar3
	push	ar4
	push	ar2
	push	ar5
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	f38x_autotest.c:239: while(1);
L015002?:
	sjmp	L015002?
;------------------------------------------------------------
;Allocation info for local variables in function 'dopass'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;------------------------------------------------------------
;	f38x_autotest.c:242: void dopass(unsigned char pin)
;	-----------------------------------------
;	 function dopass
;	-----------------------------------------
_dopass:
	mov	r2,dpl
;	f38x_autotest.c:244: printf("P%d.%d, ", pin/0x10, pin&7);
	mov	a,#0x07
	anl	a,r2
	mov	r3,a
	mov	r4,#0x00
	mov	a,r2
	swap	a
	anl	a,#0x0f
	mov	r2,a
	mov	r5,#0x00
	push	ar3
	push	ar4
	push	ar2
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
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Test_Pair'
;------------------------------------------------------------
;pin2                      Allocated with name '_Test_Pair_PARM_2'
;pin1                      Allocated to registers r2 
;------------------------------------------------------------
;	f38x_autotest.c:247: void Test_Pair (unsigned char pin1, unsigned char pin2)
;	-----------------------------------------
;	 function Test_Pair
;	-----------------------------------------
_Test_Pair:
;	f38x_autotest.c:249: Set_Pin_Output(pin1);
	mov  r2,dpl
	push	ar2
	lcall	_Set_Pin_Output
;	f38x_autotest.c:250: Set_Pin_Input(pin2);
	mov	dpl,_Test_Pair_PARM_2
	lcall	_Set_Pin_Input
	pop	ar2
;	f38x_autotest.c:251: Set_Pin_Zero(pin1);
	mov	dpl,r2
	push	ar2
	lcall	_Set_Pin_Zero
;	f38x_autotest.c:252: WaitXms(2);
	mov	dptr,#0x0002
	lcall	_WaitXms
;	f38x_autotest.c:253: if(Read_Pin(pin2)==1) dofail(pin2);
	mov	dpl,_Test_Pair_PARM_2
	lcall	_Read_Pin
	clr	a
	rlc	a
	mov	r3,a
	pop	ar2
	cjne	r3,#0x01,L017002?
	mov	dpl,_Test_Pair_PARM_2
	push	ar2
	lcall	_dofail
	pop	ar2
L017002?:
;	f38x_autotest.c:254: if (countzero()!=2) dofailb(pin2);
	push	ar2
	lcall	_countzero
	mov	r3,dpl
	pop	ar2
	cjne	r3,#0x02,L017017?
	sjmp	L017004?
L017017?:
	mov	dpl,_Test_Pair_PARM_2
	push	ar2
	lcall	_dofailb
	pop	ar2
L017004?:
;	f38x_autotest.c:255: dopass(pin2);
	mov	dpl,_Test_Pair_PARM_2
	push	ar2
	lcall	_dopass
;	f38x_autotest.c:257: Set_Pin_Output(pin2);
	mov	dpl,_Test_Pair_PARM_2
	lcall	_Set_Pin_Output
	pop	ar2
;	f38x_autotest.c:258: Set_Pin_Input(pin1);
	mov	dpl,r2
	push	ar2
	lcall	_Set_Pin_Input
;	f38x_autotest.c:259: Set_Pin_Zero(pin2);
	mov	dpl,_Test_Pair_PARM_2
	lcall	_Set_Pin_Zero
;	f38x_autotest.c:260: WaitXms(2);
	mov	dptr,#0x0002
	lcall	_WaitXms
	pop	ar2
;	f38x_autotest.c:261: if(Read_Pin(pin1)==1) dofail(pin1);
	mov	dpl,r2
	push	ar2
	lcall	_Read_Pin
	clr	a
	rlc	a
	mov	r3,a
	pop	ar2
	cjne	r3,#0x01,L017006?
	mov	dpl,r2
	push	ar2
	lcall	_dofail
	pop	ar2
L017006?:
;	f38x_autotest.c:262: if (countzero()!=2) dofailb(pin1);
	push	ar2
	lcall	_countzero
	mov	r3,dpl
	pop	ar2
	cjne	r3,#0x02,L017020?
	sjmp	L017008?
L017020?:
	mov	dpl,r2
	push	ar2
	lcall	_dofailb
	pop	ar2
L017008?:
;	f38x_autotest.c:263: dopass(pin1);
	mov	dpl,r2
	push	ar2
	lcall	_dopass
	pop	ar2
;	f38x_autotest.c:265: Set_Pin_One(pin1);
	mov	dpl,r2
	push	ar2
	lcall	_Set_Pin_One
;	f38x_autotest.c:266: Set_Pin_One(pin2);
	mov	dpl,_Test_Pair_PARM_2
	lcall	_Set_Pin_One
	pop	ar2
;	f38x_autotest.c:267: Set_Pin_Input(pin1);
	mov	dpl,r2
	lcall	_Set_Pin_Input
;	f38x_autotest.c:268: Set_Pin_Input(pin2);
	mov	dpl,_Test_Pair_PARM_2
	ljmp	_Set_Pin_Input
;------------------------------------------------------------
;Allocation info for local variables in function 'Check_Pin_Zero'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;------------------------------------------------------------
;	f38x_autotest.c:271: void Check_Pin_Zero (unsigned char pin)
;	-----------------------------------------
;	 function Check_Pin_Zero
;	-----------------------------------------
_Check_Pin_Zero:
;	f38x_autotest.c:273: if(Read_Pin(pin)==0)
	mov  r2,dpl
	push	ar2
	lcall	_Read_Pin
	pop	ar2
	jc	L018003?
;	f38x_autotest.c:275: printf("P%d.%d is connected to ground\n", pin/0x10, pin&7);
	mov	a,#0x07
	anl	a,r2
	mov	r3,a
	mov	r4,#0x00
	mov	a,r2
	swap	a
	anl	a,#0x0f
	mov	r2,a
	mov	r5,#0x00
	push	ar3
	push	ar4
	push	ar2
	push	ar5
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
L018003?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Initial_Check'
;------------------------------------------------------------
;------------------------------------------------------------
;	f38x_autotest.c:279: void Initial_Check (void)
;	-----------------------------------------
;	 function Initial_Check
;	-----------------------------------------
_Initial_Check:
;	f38x_autotest.c:281: if (countzero()!=0)
	lcall	_countzero
	mov	a,dpl
	jnz	L019010?
	ret
L019010?:
;	f38x_autotest.c:283: Check_Pin_Zero(0x00);
	mov	dpl,#0x00
	lcall	_Check_Pin_Zero
;	f38x_autotest.c:284: Check_Pin_Zero(0x01);
	mov	dpl,#0x01
	lcall	_Check_Pin_Zero
;	f38x_autotest.c:285: Check_Pin_Zero(0x02);
	mov	dpl,#0x02
	lcall	_Check_Pin_Zero
;	f38x_autotest.c:286: Check_Pin_Zero(0x03);
	mov	dpl,#0x03
	lcall	_Check_Pin_Zero
;	f38x_autotest.c:289: Check_Pin_Zero(0x06);
	mov	dpl,#0x06
	lcall	_Check_Pin_Zero
;	f38x_autotest.c:290: Check_Pin_Zero(0x07);
	mov	dpl,#0x07
	lcall	_Check_Pin_Zero
;	f38x_autotest.c:291: Check_Pin_Zero(0x10);
	mov	dpl,#0x10
	lcall	_Check_Pin_Zero
;	f38x_autotest.c:292: Check_Pin_Zero(0x11);
	mov	dpl,#0x11
	lcall	_Check_Pin_Zero
;	f38x_autotest.c:293: Check_Pin_Zero(0x12);
	mov	dpl,#0x12
	lcall	_Check_Pin_Zero
;	f38x_autotest.c:294: Check_Pin_Zero(0x13);
	mov	dpl,#0x13
	lcall	_Check_Pin_Zero
;	f38x_autotest.c:295: Check_Pin_Zero(0x14);
	mov	dpl,#0x14
	lcall	_Check_Pin_Zero
;	f38x_autotest.c:296: Check_Pin_Zero(0x15);
	mov	dpl,#0x15
	lcall	_Check_Pin_Zero
;	f38x_autotest.c:297: Check_Pin_Zero(0x16);
	mov	dpl,#0x16
	lcall	_Check_Pin_Zero
;	f38x_autotest.c:298: Check_Pin_Zero(0x17);
	mov	dpl,#0x17
	lcall	_Check_Pin_Zero
;	f38x_autotest.c:299: Check_Pin_Zero(0x20);
	mov	dpl,#0x20
	lcall	_Check_Pin_Zero
;	f38x_autotest.c:300: Check_Pin_Zero(0x21);
	mov	dpl,#0x21
	lcall	_Check_Pin_Zero
;	f38x_autotest.c:301: Check_Pin_Zero(0x22);
	mov	dpl,#0x22
	lcall	_Check_Pin_Zero
;	f38x_autotest.c:302: Check_Pin_Zero(0x23);
	mov	dpl,#0x23
	lcall	_Check_Pin_Zero
;	f38x_autotest.c:303: Check_Pin_Zero(0x24);
	mov	dpl,#0x24
	lcall	_Check_Pin_Zero
;	f38x_autotest.c:304: Check_Pin_Zero(0x25);
	mov	dpl,#0x25
	lcall	_Check_Pin_Zero
;	f38x_autotest.c:305: Check_Pin_Zero(0x26);
	mov	dpl,#0x26
	lcall	_Check_Pin_Zero
;	f38x_autotest.c:306: Check_Pin_Zero(0x27);
	mov	dpl,#0x27
	lcall	_Check_Pin_Zero
;	f38x_autotest.c:307: Check_Pin_Zero(0x30);
	mov	dpl,#0x30
	lcall	_Check_Pin_Zero
;	f38x_autotest.c:308: while(1);
L019002?:
	sjmp	L019002?
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;------------------------------------------------------------
;	f38x_autotest.c:312: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	f38x_autotest.c:316: printf("\n\nF38x board autotest\n");
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
;	f38x_autotest.c:317: Initial_Check();
	lcall	_Initial_Check
;	f38x_autotest.c:319: Test_Pair(0x01, 0x02); // P0.1 and P0.2
	mov	_Test_Pair_PARM_2,#0x02
	mov	dpl,#0x01
	lcall	_Test_Pair
;	f38x_autotest.c:320: Test_Pair(0x00, 0x03); // P0.0 and P0.3
	mov	_Test_Pair_PARM_2,#0x03
	mov	dpl,#0x00
	lcall	_Test_Pair
;	f38x_autotest.c:321: Test_Pair(0x22, 0x21); // P2.2 and P2.1
	mov	_Test_Pair_PARM_2,#0x21
	mov	dpl,#0x22
	lcall	_Test_Pair
;	f38x_autotest.c:322: Test_Pair(0x23, 0x20); // etc.
	mov	_Test_Pair_PARM_2,#0x20
	mov	dpl,#0x23
	lcall	_Test_Pair
;	f38x_autotest.c:323: printf("\n");
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
;	f38x_autotest.c:324: Test_Pair(0x24, 0x17);
	mov	_Test_Pair_PARM_2,#0x17
	mov	dpl,#0x24
	lcall	_Test_Pair
;	f38x_autotest.c:325: Test_Pair(0x25, 0x16);
	mov	_Test_Pair_PARM_2,#0x16
	mov	dpl,#0x25
	lcall	_Test_Pair
;	f38x_autotest.c:326: Test_Pair(0x26, 0x15);
	mov	_Test_Pair_PARM_2,#0x15
	mov	dpl,#0x26
	lcall	_Test_Pair
;	f38x_autotest.c:327: Test_Pair(0x27, 0x14);
	mov	_Test_Pair_PARM_2,#0x14
	mov	dpl,#0x27
	lcall	_Test_Pair
;	f38x_autotest.c:328: printf("\n");
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
;	f38x_autotest.c:329: Test_Pair(0x06, 0x11);
	mov	_Test_Pair_PARM_2,#0x11
	mov	dpl,#0x06
	lcall	_Test_Pair
;	f38x_autotest.c:330: Test_Pair(0x07, 0x12);
	mov	_Test_Pair_PARM_2,#0x12
	mov	dpl,#0x07
	lcall	_Test_Pair
;	f38x_autotest.c:331: Test_Pair(0x10, 0x13);
	mov	_Test_Pair_PARM_2,#0x13
	mov	dpl,#0x10
	lcall	_Test_Pair
;	f38x_autotest.c:333: printf("\n\nSuccess!\n");
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
;	f38x_autotest.c:335: Set_Pin_Output(0x30);
	mov	dpl,#0x30
	lcall	_Set_Pin_Output
;	f38x_autotest.c:336: while(1)
L020002?:
;	f38x_autotest.c:338: P3_0=0;
	clr	_P3_0
;	f38x_autotest.c:339: WaitXms(TOUT);
	mov	dptr,#0x01F4
	lcall	_WaitXms
;	f38x_autotest.c:340: P3_0=1;
	setb	_P3_0
;	f38x_autotest.c:341: WaitXms(TOUT);
	mov	dptr,#0x01F4
	lcall	_WaitXms
	sjmp	L020002?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 'P%d.%d FAILED (OPEN)'
	db 0x0A
	db 0x00
__str_1:
	db 'P%d.%d FAILED (SHORT)'
	db 0x0A
	db 0x00
__str_2:
	db 'P%d.%d, '
	db 0x00
__str_3:
	db 'P%d.%d is connected to ground'
	db 0x0A
	db 0x00
__str_4:
	db 0x0A
	db 0x0A
	db 'F38x board autotest'
	db 0x0A
	db 0x00
__str_5:
	db 0x0A
	db 0x00
__str_6:
	db 0x0A
	db 0x0A
	db 'Success!'
	db 0x0A
	db 0x00

	CSEG

end
