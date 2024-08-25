	.inesprg 32  ; 16x 16KB PRG code (32 banks of 8KB)
	.ineschr 32  ; 16x  8KB CHR data (128 banks of 1KB)
	.inesmap 4   ; mapper 4 = MMC3, 8KB PRG, 1/2KB CHR bank swapping
	.inesmir 0   ; background mirroring
	;.inesbat 1	 ; enables sram

; Verifies:
; \$[0-9A-F][0-9A-F][0-9A-F][0-9A-F]

; Translators:
;
; Standard S&R on any address found via:
; [BJ].. \$[0-9A-F][0-9A-F][0-9A-F][0-9A-F]
;
; Then do the following for address label fixing:
; (^\s*.*\s*); (PRG005_[0-9A-F][0-9A-F][0-9A-F][0-9A-F])	-->	\n\2:\n\1	(Labels from comment to beginning of line)
; ^(\s*[BJ].. PRG005_[0-9A-F][0-9A-F][0-9A-F][0-9A-F]).*	-->	\1\n		(Formatting linebreak after B.. J..)
; \s*;.*							-->	(nothing)	(Cleans off remaining address constants)


; Handy pseudo instructions... only make sense in the context of CMPing a number...
BLT 	.macro
	BCC \1	; A < CMP (unsigned)
	.endm

BGE 	.macro
	BCS \1	; A >= CMP (unsigned)
	.endm

BLS 	.macro
	BMI \1	; A < CMP (signed)
	.endm

BGS 	.macro
	BPL \1	; A >= CMP (signed)
	.endm

; Clarifying pseudo instructions
ADD	.macro	; RegEx S&R "CLC.*\n.*?ADC" -> "ADD"
	CLC
	ADC \1
	.endm

SUB	.macro	; RegEx S&R "SEC.*\n.*?SBC" -> "SUB"
	SEC
	SBC \1
	.endm

NEG	.macro	; RegEx S&R "EOR #\$ff.*\n.*ADD #\$01" -> "NEG"
	EOR #$ff
	ADD #$01
	.endm


; This is used in video update streams; since the video address register
; takes the address high-then-low (contrary to 6502's normal low-then-high),
; this allows a 16-bit value but "corrects" it to the proper endianness.
vaddr	.macro
	.byte (\1 & $FF00) >> 8
	.byte (\1 & $00FF)
	.endm

MSG_ID .macro
	.byte #(((\1 - Messages_Table) / 44) + 1)
	.endm

SET_MSG	.macro
	LDA #(((\1 - Messages_Table) / 44) + 1)
	STA Message_Id
	.endm

CLR_MSG .macro
	LDA #$00
	STA Message_Id
	.endm		

; These are flags related to a video update stream value
VU_VERT		= $80	; Update in vertical (+32B) mode instead of horizontal (+1B) mode
VU_REPEAT	= $40	; Repeat following value several times instead of several raw values

; Provides a compilation-failing boundary check
BoundCheck:	.macro
			if \1 > \2
			fail \3 boundary exceeded (> \2)
			endif
		.endm

; Pads bytes to align to nearest 64 byte boundary for DMC samples
; RAS: This would be useful for your own works, but I can't use
; it in the natively disassembly since the assembler pads zeroes
; instead of $FF values... just FYI!
;
; Usage example:
;
; .LabelPriorToDMC: DMCAlign .LabelPriorToDMC
DMCAlign:	.macro
			.ds ((\1 + $3F) & $FFC0) - \1
		.endm

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PPU I/O regs (CPU side)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;	PPU_CTL1:
;	0-1: Name table address, changes between the four name tables at $2000 (0), $2400 (1), $2800 (2) and $2C00 (3).
;	2: Clear, PPU incs by 1 ("horizontal"); Set, PPU incs by 32 ("vertical")
;	3: Which pattern table holds for sprites; 0 for PT1 ($0000) or 1 for PT2 ($1000)
;	4: Which pattern table holds for BG; 0 for PT1 ($0000) or 1 for PT2 ($1000)
;	5: Set to use 8x16 sprites instead of 8x8
;	7: Set to generate VBlank NMIs
PPU_CTL1	= $2000		; Write only

;	PPU_CTL2:
;	0: Clear for color, set for mono
;	1: Clear to clip 8 left pixels of BG
;	2: Clear to clip 8 left pixels of sprites
;	3: If clear, BG hidden
;	4: If clear, sprites hidden
;	5-7: BG color in mono mode, "color intensity" in color mode (??)
PPU_CTL2	= $2001		; Write only

;	PPU_STAT:
;	4: if set, can write to VRAM, else writes ignored
;	5: if set, sprite overflow occurred on scanline
;	6: Set if any non-transparent pixel of sprite 0 is overlapping a non-transparent pixel of BG
;	7: VBlank is occurring (cleared after read)
PPU_STAT	= $2002

; Sprites: 256 bytes, each sprite takes 4, so 64 sprites total
; Only 8 sprites per scanline, sprite 0 is drawn on top (thus highest priority)
; PPU_SPR_ADDR / PPU_SPR_DATA
; * Byte 0 - Stores the y-coordinate of the top left of the sprite minus 1.
; * Byte 1 - Index number of the sprite in the pattern tables.
; * Byte 2 - Stores the attributes of the sprite.
;   * Bits 0-1 - Most significant two bits of the colour.  (Or "palette" 0-3)
;   * Bit 5 - Indicates whether this sprite has priority over the background.
;   * Bit 6 - Indicates whether to flip the sprite horizontally.
;   * Bit 7 - Indicates whether to flip the sprite vertically.
; * Byte 3 - X coordinate
PPU_SPR_ADDR	= $2003		; Set address sprite data
PPU_SPR_DATA	= $2004		; Read or write this sprite byte

PPU_SCROLL	= $2005		; Scroll register; read PPU_STAT, then write horiz/vert scroll
PPU_VRAM_ADDR	= $2006		; VRAM address (first write is high, next write is low)
PPU_VRAM_DATA	= $2007		; Data to read/write at this address

; Note that all transparent colors ($3F04, $3F08, $3F0C, $3F10, $3F14, $3F18 and $3F1C) are mirrored from 3F00
PPU_BG_PAL	= $3F00 	; 3F00-3F0F
PPU_SPR_PAL	= $3F10		; 3F10-3F1F


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SOUND I/O regs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; $4000(rct1)/$4004(rct2)/$400C(noise) bits
; ---------------------------------------
; 0-3	volume / envelope decay rate
; 4	envelope decay disable
; 5	length counter clock disable / envelope decay looping enable
; 6-7	duty cycle type (unused on noise channel)

; Duty cycles:
; 00 = a weak, grainy tone.  (12.5% Duty), 01 = a solid mid-strength tone. (25% Duty), 
; 10 = a strong, full tone (50% Duty), 11 = sounds a lot like 01 (25% Duty negated)

PAPU_CTL1	= $4000	; pAPU Pulse 1 Control Register.
PAPU_CTL2	= $4004	; pAPU Pulse 2 Control Register.
PAPU_NCTL1 	= $400C ; pAPU Noise Control Register 1.


; $4008(tri) bits
; ---------------
; 0-6	linear counter load register
; 7	length counter clock disable / linear counter start
PAPU_TCR1	= $4008	; pAPU Triangle Control Register 1.


; $4001(rct1)/$4005(rct2) bits
; --------------------------
; 0-2	right shift amount
; 3	decrease / increase (1/0) wavelength
; 4-6	sweep update rate
; 7	sweep enable
PAPU_RAMP1	= $4001	; pAPU Pulse 1 Ramp Control Register.
PAPU_RAMP2	= $4005	; pAPU Pulse 2 Ramp Control Register.


; $4002(rct1)/$4006(rct2)/$400A(Tri) bits
; -------------------------------------
; 0-7	8 LSB of wavelength
PAPU_FT1	= $4002	; pAPU Pulse 1 Fine Tune (FT) Register.
PAPU_FT2	= $4006	; pAPU Pulse 2 Fine Tune (FT) Register.
PAPU_TFREQ1	= $400A ; pAPU Triangle Frequency Register 1.


; $400E(noise) bits
; -----------------
; 0-3	playback sample rate
; 4-6	unused
; 7	random number type generation
PAPU_NFREQ1	= $400E ; pAPU Noise Frequency Register 1.

; $4003(rct1)/$4007(rct2)/$400B(tri)/$400F(noise) bits
; --------------------------------------------------
; 0-2	3 MS bits of wavelength (unused on noise channel) (the "high" frequency)
; 3-7	length of tone
PAPU_CT1	= $4003 ; pAPU Pulse 1 Coarse Tune (CT) Register.
PAPU_CT2	= $4007 ; pAPU Pulse 2 Coarse Tune (CT) Register.
PAPU_TFREQ2	= $400B ; pAPU Triangle Frequency Register 2.
PAPU_NFREQ2	= $400F ; pAPU Noise Frequency Register 2.


; $4010 - DMC Play mode and DMA frequency

; Bits 0-3:
;    f   period
;    ----------
;    0   $1AC
;    1   $17C
;    2   $154
;    3   $140
;    4   $11E
;    5   $0FE
;    6   $0E2
;    7   $0D6
;    8   $0BE
;    9   $0A0
;    A   $08E
;    B   $080
;    C   $06A
;    D   $054
;    E   $048
;    F   $036
; Bits 6-7: this is the playback mode.
;	00 - play DMC sample until length counter reaches 0 (see $4013)
;	x1 - loop the DMC sample (x = immaterial)
;	10 - play DMC sample until length counter reaches 0, then generate a CPU 
PAPU_MODCTL	= $4010 ; pAPU Delta Modulation Control Register.

PAPU_MODDA	= $4011 ; pAPU Delta Modulation D/A Register.
PAPU_MODADDR	= $4012 ; pAPU Delta Modulation Address Register.
PAPU_MODLEN	= $4013 ; pAPU Delta Modulation Data Length Register.

; read
; ----
; 0	rectangle wave channel 1 length counter status
; 1	rectangle wave channel 2 length counter status
; 2	triangle wave channel length counter status
; 3	noise channel length counter status
; 4	DMC is currently enabled (playing a stream of samples)
; 5	unknown
; 6	frame IRQ status (active when set)
; 7	DMC's IRQ status (active when set)
; 
; write
; -----
; 0	rectangle wave channel 1 enable
; 1	rectangle wave channel 2 enable
; 2	triangle wave channel enable
; 3	noise channel enable
; 4	enable/disable DMC (1=start/continue playing a sample;0=stop playing)
; 5-7	unknown
PAPU_EN		= $4015	; R/W pAPU Sound Enable


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; OTHER I/O regs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SPR_DMA		= $4014 ; Sprite DMA Register -- DMA from CPU memory at $100 x n to SPR-RAM (256 bytes)


; Read / Write Joypad 1/2:
;                   *  Bit 0 - Reads data from joypad or causes joypad strobe
;                      when writing.
;                   *  Bit 3 - Indicates whether Zapper is pointing at a sprite.
;                   *  Bit 4 - Cleared when Zapper trigger is released.
;                   Only bit 0 is involved in writing.
JOYPAD		= $4016		

; Frame counter control
; Changes the frame counter that changes updates on sound; any write resets
; the frame counter, good for synchronizing sound with VBlank etc.
; 0        4, 0,1,2,3, 0,1,2,3,..., etc.
; 1        0,1,2,3,4, 0,1,2,3,4,..., etc. 
; bit 6 - enable frame IRQs (when zero)
; bit 7 - 0 = 60 IRQs a frame / 1 = 48 IRQs a frame (obviously need bit 6 clear to use)
; Interestingly, both of the above are clear on bootup, meaning IRQs are being generated,
; but the 6502 ignores NMIs on startup; also, need to read from $4015 (PAPU_EN) to acknowledge
; the interrupt, otherwise it holds the status on!
FRAMECTR_CTL	= $4017


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MMC3 regs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; MMC3_COMMAND:
;  Bits 0-2 - Command number:
;  * 0 - Swap two 1 KB VROM banks at PPU $0000.
;  * 1 - Swap two 1 KB VROM banks at PPU $0800.
;  * 2 - Swap one 1 KB VROM bank at PPU $1000.
;  * 3 - Swap one 1 KB VROM bank at PPU $1400.
;  * 4 - Swap one 1 KB VROM bank at PPU $1800.
;  * 5 - Swap one 1 KB VROM bank at PPU $1C00.
;  * 6 - Swap PRG-ROM bank at either $8000 or $C000 based on bit 6.
;  * 7 - Swap PRG-ROM bank at either $A000 
;
;  Bit 6 - If 0, enables swapping at $8000 and $A000, otherwise enables
;  swapping at $C000 and $A000.  (NOTE: This is what SMB3 uses, so we only
;  have defs for this mode!)
;
;  Bit 7 - If 1, causes addresses for commands 0-5 to be the exclusive-or
;  of the address stated and $1000.

; Note that bit 6 is set on all of these consistently since SMB3 uses the PRG switch this way
MMC3_2K_TO_PPU_0000	= %01000000	; 0
MMC3_2K_TO_PPU_0800	= %01000001	; 1
MMC3_1K_TO_PPU_1000	= %01000010	; 2
MMC3_1K_TO_PPU_1400	= %01000011	; 3
MMC3_1K_TO_PPU_1800	= %01000100	; 4
MMC3_1K_TO_PPU_1C00	= %01000101	; 5
MMC3_8K_TO_PRG_C000	= %01000110	; 6
MMC3_8K_TO_PRG_A000	= %01000111	; 7
MMC3_PPU_XOR_1000	= %10000000


MMC3_COMMAND	= $8000	; consult ref
MMC3_PAGE  	= $8001	; page number to MMC3_COMMAND
MMC3_MIRROR	= $A000	; bit 0 clear is horizontal mirroring, bit 0 set is vertical mirroring
MMC3_SRAM_EN	= $A001	; bit 7 set to enable SRAM at $6000-$7FFF
MMC3_IRQCNT	= $C000 ; Countdown to an IRQ
MMC3_IRQLATCH	= $C001 ; Store a temp val to be copied to MMC3_IRQCNT later
MMC3_IRQDISABLE	= $E000 ; Disables IRQ generation and copies MMC3_IRQLATCH to MMC3_IRQCNT
MMC3_IRQENABLE	= $E001 ; Enables IRQ generation


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SMB3 RAM DEFS 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; (.*?)\s*=.*?;
; \t\1:\t\t.ds 1\t;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ZERO PAGE RAM COMMON
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Common use zero page RAM.  Bytes in $75-$F3 are context-dependent
	.data		; RAS: Using .data instead of .zp to export labels
	.org $00

; For clarification, none of the other "Temp" vars are damaged by NMI,
; the NMI does employ Temp_Var1-3, and restores them when it's done.

	Temp_Var1:		.ds 1	; Temporary storage variable (protected from damage by NMI)
	Temp_Var2:		.ds 1	; Temporary storage variable (protected from damage by NMI)
	Temp_Var3:		.ds 1	; Temporary storage variable (protected from damage by NMI)
	Temp_Var4:		.ds 1	; Temporary storage variable
	Temp_Var5:		.ds 1	; Temporary storage variable
	Temp_Var6:		.ds 1	; Temporary storage variable
	Temp_Var7:		.ds 1	; Temporary storage variable
	Temp_Var8:		.ds 1	; Temporary storage variable
	Temp_Var9:		.ds 1	; Temporary storage variable
	Temp_Var10:		.ds 1	; Temporary storage variable
	Temp_Var11:		.ds 1	; Temporary storage variable
	Temp_Var12:		.ds 1	; Temporary storage variable
	Temp_Var13:		.ds 1	; Temporary storage variable
	Temp_Var14:		.ds 1	; Temporary storage variable
	Temp_Var15:		.ds 1	; Temporary storage variable
	Temp_Var16:		.ds 1	; Temporary storage variable

	VBlank_Tick:		.ds 1	; can be used for timing, or knowing when an NMI just fired off

	Horz_Scroll_Hi:		.ds 1	; Provides a "High" byte for horizontally scrolling, or could be phrased as "current screen"
	PPU_CTL1_Mod:		; NOT DURING GAMEPLAY, this is used as an additional modifier to PPU_CTL1
	Vert_Scroll_Hi:		.ds 1	; Provides a "High" byte for vertically scrolling (only used during vertical levels!)

	Level_ExitToMap:	.ds 1	; When non-zero, kicks back to map (OR to event when Player_FallToKing or Player_RescuePrincess is nonzero!)

	Counter_1:		.ds 1	; This value simply increments every frame, used for timing various things

	PPU_CTL2_Copy:		.ds 1	; Essentially a copy of PPU_CTL2, which updates it as well, though the sprite/BG visibility setting is usually (always?) forced on

PAD_A		= $80
PAD_B		= $40
PAD_SELECT	= $20
PAD_START	= $10
PAD_UP		= $08
PAD_DOWN	= $04
PAD_LEFT	= $02
PAD_RIGHT	= $01

	Pad_Holding:		.ds 1	; Active player's inputs (i.e. 1P or 2P, whoever's playing) buttons being held in (continuous)
	Pad_Input:		.ds 1	; Active player's inputs (i.e. 1P or 2P, whoever's playing) buttons newly pressed only (one shot)

	Anim_Counter:	.ds 1

; Pal_Force_Set12:
; This overrides the normal palette routine of selecting by Level_Tileset and 
; loading the color sets PalSel_Tile_Colors/PalSel_Obj_Colors.  Setting 
; Pal_Force_Set12 to a non-zero value will select as the index instead of
; Level_Tileset, and then it will copy the first two sets of 16 colors from
; the palette data as bg / sprite colors.  FIXME is this used though??


	VBlank_TickEn:		.ds 1	; Enables the VBlank_Tick decrement and typically other things like joypad reading

				.ds 1	; $1F unused

	; $20 has a lot of different uses on the World Map...
	Map_EnterLevelFX:		; When entering a level on the map, dictates the status of the entry (0=None, 1=Boxing in, 2=Boxing out [J only]) NOTE: Overlap/reuse
	Map_IntBoxErase:		; Used for determining where in erasing the "World X" intro box we are NOTE: Overlap/reuse
	Map_ClearLevelFXCnt:		; Counter for "clear level" FX occurring (1-6: Poof, 7-9: Flip) ("poof"/"panel flip") NOTE: Overlap/reuse
	Map_ScrollOddEven:	.ds 1	; Toggles odd/even column as it scrolls

				.ds 1	; $21 unused

	Level_Width:		.ds 1	; Width of current level, in screens (0 = don't move at all, max is 15H/16V)

	; In horizontal "typical" levels, Scroll_ColumnR/L are a column and
	; levels are rendered in vertical stripes by these start points
	Scroll_ColumnR:		.ds 1	; ($23) Current tile column (every 16px) of right side of screen (non-vertical level style ONLY)
	Scroll_ColumnL:		.ds 1	; ($24) Current tile column (every 16px) of left side of screen (non-vertical level style ONLY)

	.org $23	; NOTE, the following two are also $23/$24
	; In vertical style levels, Scroll_VOffsetT/B are an offset into the
	; visible tile grid, and levels are rendered in horizontal strips
	Scroll_VOffsetT:	.ds 1	; ($23) Current tile offset (every 16px) of top of screen (vertical level style ONLY)
	Scroll_VOffsetB:	.ds 1	; ($24) Current tile offset (every 16px) of bottom of screen (vertical level style ONLY)

	Scroll_ColorStrip: 	.ds 54	; $25-$5A This stores a strip of just the upper 2 bits of a tile ($00, $40, $80, $C0) to produce attribute info

	Scroll_LastDir:		.ds 1	; 0=screen last moved right (or up, if vertical), 1=screen last moved left (or down, if vertical)

	Scroll_RightUpd:		; Indicates every 8 pixels update going to the right, or $FF if screen moves left
	Scroll_VertUpd:		.ds 1	; Indicates every 8 pixels update up or down, in vertical levels

	Scroll_LeftUpd:		.ds 1	; Indicates every 8 pixels update going to the left, or $FF if screen moves right

	; Prepares to perform a Video_Update when possible, indexes the "Video_Upd_Table" 
	; in PRG030 OR Video_Upd_Table2 in PRG025 (whichever is currently in context)
	; Also resets the graphics buffer afterward, since the RAM buffer is
	; constantly being called to possibly perform its own updates after this value
	; resets to zero.
	Graphics_Queue:		.ds 1

	Level_LayPtr_AddrL:	.ds 1	; Low byte of address to tile layout (ORIGINAL stored in Level_LayPtrOrig_AddrL)
	Level_LayPtr_AddrH:	.ds 1	; High byte of address to tile layout (ORIGINAL stored in Level_LayPtrOrig_AddrH)

			; Typical use pair at $63/$64
	Map_Tile_AddrL:		.ds 1	; Low byte of tile address
	Map_Tile_AddrH:		.ds 1	; High byte of tile address

						.ds 2

	.org $63	; NOTE, the following two are also $63/$64, bonus game context
	
	Video_Upd_AddrL:	.ds 1	; Video_Misc_Updates routine uses this as an address, low byte
	Video_Upd_AddrH:	.ds 1	; Video_Misc_Updates routine uses this as an address, hi byte
	Music_Base_L:		.ds 1	; Current music segment base address low byte
	Music_Base_H:		.ds 1	; Current music segment base address high byte

	Sound_Sqr_FreqL:	.ds 1	; Calculated square wave frequency for Note On (low byte)
	Sound_Sqr_FreqH:	.ds 1	; Calculated square wave frequency for Note On (high byte)
	Sound_Map_EntrV:	.ds 1	; Current index into the volume ramp-down table used exclusively for the "level enter" sound
	Sound_Map_EntV2:	.ds 1	; Same as Sound_Map_EntrV, only for the second track

	Music_PatchAdrL:	.ds 1	; Music current patch address low byte
	Music_PatchAdrH:	.ds 1	; Music current patch address high byte
	Sound_Map_Off:		.ds 1	; Current "offset" within a map sound effect

	; ASSEMBLER BOUNDARY CHECK, END OF ZERO PAGE PRE CONTEXT @ $74
.BoundZP_PreCtx:	BoundCheck .BoundZP_PreCtx, $74, Zero Page

	; NOTE: $75 - $F3 are context specific; see contexts below

	.org $F4
	Scroll_OddEven:		.ds 1	; 0 or 1, depending on what part of 8 pixels has crossed (need better description)

	Controller1Press:	.ds 1	; Player 1's controller "pressed this frame only" (see Controller1 for values)
	Controller1:	.ds 1	; Player 2's controller "pressed this frame only" (see Controller2 for values)
	Object_SpawnColumnOffset:		.ds 1	; Player 1's controller inputs -- R01 L02 D04 U08 S10 E20 B40 A80
	Object_SpawnScrollCount:		.ds 1	; Player 2's controller inputs -- R01 L02 D04 U08 S10 E20 B40 A80

	Object_LastScrollColumn: .ds 1	; $F9 unused
	Horz_Scroll_Backup:			.ds 1	; $FA unused
	Horz_ScrollHi_Backup:	.ds 1	; $FB unused

	Vert_Scroll:		.ds 1	; Vertical scroll of name table; typically at $EF (239, basically showing the bottom half)
	Horz_Scroll:		.ds 1	; Horizontal scroll of name table

	Player_OnObject:    .ds 1	; $FE unused

	PPU_CTL1_Copy:		.ds 1	; Holds PPU_CTL1 register data 

	; ASSEMBLER BOUNDARY CHECK, END OF ZERO PAGE @ $100
.BoundZP:	BoundCheck .BoundZP, $100, Zero Page

; NOTE: CONTEXT -- Page 0 RAM changes meaning depending on the "context", i.e. what state
; of the game we're currently in!  This means that variables are defined with overlapping
; addresses, and care must be taken to use the correct labels depending on the code!

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ZERO PAGE RAM: TITLE SCREEN / ENDING CONTEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.org $75	; $75-$F3 is available for this context-dependent situation

; Title screen "objects", which includes Mario, Luigi, and the assortment of other things
; The following are the offsets from any of the object arrays:
; 0 = Mario, 1 = Luigi, 2 = Starman, 3 = Mushroom, 4 = Super Leaf, 5 = Goomba, 6 = Buzzy Beatle, 7 = Koopa shell

; Note that some of this is used for the engine (especially in the Princess's chamber) but some of it is
; different (especially during the montage) so consider the overlapped variables in the next section

	Title_XPosHi:		.ds 8	; $75-$7C "High" part of the extended precision X position for all objects
	Title_YPosHi:		.ds 8	; $7D-$84 "High" part of the extended precision X position for all objects
	Title_ObjX:		.ds 8	; $85-$8C Title screen object X positions
	Title_ObjY:		.ds 8	; $8D-$94 Title screen object Y positions
	Title_ObjXVel:		.ds 8	; $95-$9C X velocities of title screen objects (4.4FP)
	Title_ObjYVel:		.ds 8	; $9D-$A3 Y velocities of title screen objects 
	Title_XPosFrac:		.ds 8	; $A5-$AC X position extended precision of objects (provides 4-bit fixed point)
	Title_YPosFrac:		.ds 8	; $AD-$B4 Y position extended precision of objects (provides 4-bit fixed point)
	Title_ObjYVelChng:	.ds 2	; $B5-$B6 Mario / Luigi change in Y velocity flag
	Title_ObjMLFlags:	.ds 2	; $B7-$B8 Mario / Luigi Sprite flags
	Title_ObjMLMoveDir:	.ds 1	; 0 = No move, 1 = Left, 2 = Right
				.ds 1	; $BA unused
	Title_ObjMLAnimFrame:	.ds 2	; $BB-$BC Mario / Luigi animation frame
	Title_ObjMLDirTicks:	.ds 2	; $BD-$BE Mario / Luigi animation ticks
	Title_ObjMLSprite:	.ds 2	; $BF-$C0 Mario / Luigi next sprite to display
	Title_ObjMLPower:	.ds 2	; $C1-$C2 Mario / Luigi current powerup (0 = Small, 1 = Big, 2 = Leaf)
	Title_ObjMLSprRAMOff:	.ds 2	; $C3-$C4 Mario / Luigi Defines a Sprite_RAM offset for Mario / Luigi
	Title_ObjMLSprVis:	.ds 2	; $C5-$C6 Mario / Luigi sprite sliver visibility bits (generated by Title_MLDetermineSpriteVis)
	Title_ObjMLTailTick:	.ds 2	; $C7-$C8 Mario / Luigi tail wagging tick
	Title_ObjMLHold:	.ds 2	; $C9-$CA Mario / Luigi holding something flag (when non-zero)
	Title_ObjMLBonkTick:	.ds 2	; $CB-$CC Mario / Luigi use "bonked" frame while > 0
	Title_ObjMLKickTick:	.ds 2	; $CD-$CE Mario / Luigi use kicking frame while > 0
	Title_ObjMPowerDown:	.ds 1	; Mario power down animation counter
	Title_ObjMLStop:	.ds 1	; Flag used briefly to "hold" Mario/Luigi from moving so they get a "running start"
	Title_CurMLIndex:	.ds 1	; 0 for Mario, 1 for Luigi
	Title_ObjFlags:		.ds 6	; $D2-$D7 Minor objects' sprite flags
	Title_ObjStates:	.ds 6	; $D8-$DD Title screen array of states for the individual objects (NOT including Mario/Luigi)
	Title_State:		.ds 1	; 00 = Prior to red curtain rise, 01 = Rising curtain...
	Title_ResetCnt:		.ds 1	; Title reset counter -- when on the menu, once this hits zero, the title sequence restarts
	Title_ResetCnt2:	.ds 1	; when this goes to zero, it decrements Title_ResetCnt
	Title_ResetTrig:	.ds 1	; when non-zero, resets title screen
	Title_UnusedFlag:	.ds 1	; doesn't seem to do anything useful but not do the "skip" state if Player presses START early on the title screen
	Title_Ticker:		.ds 1	; Tick counter for title screen intro "movie"
	Title_MActScriptPos:	.ds 1	; Offset within Mario's action script
	Title_LActScriptPos:	.ds 1	; Offset within Luigi's action script
	Title_MActScriptDelay:	.ds 1	; Mario's action script delay until next event
	Title_LActScriptDelay:	.ds 1	; Luigi's action script delay until next event
	Title_MActScriptDirSet:	.ds 1	; Mario's action script Buffer for last queue command (sets respective "Title_ObjMLDir" variable)
	Title_LActScriptDirSet:	.ds 1	; Luigi's action script Buffer for last queue command (sets respective "Title_ObjMLDir" variable)
	Title_ObjMLDir:		.ds 2	; $EA-$EB Mario / Luigi vector direction bitfield (1 = Left, 2 = Right, 4 = Down, 8 = Up, $10 = Sprite behind BG, $80 = Tail wagging)
	Title_ObjMLQueue:	.ds 2	; $EC-$ED Mario / Luigi queue to do something ($04 = Luigi's rebound off Mario, $10 = Kick shell, $20 = Begin carrying, $40 = Clear carry/bonk, do kick)
	Title_EventIndex:	.ds 1	; Title background event index (dynamic jump index for events on the title 
	Title_EventGrafX:	.ds 1	; Title background current graphic index to load (loads items from Video_Upd_Table2 in PRG025)
	Title_ObjInitIdx:	.ds 1	; Current title screen "event" ID during the intro scene with Mario and Luigi
	Title_ObjInitDly:	.ds 1	; Timer count before next object init
	Title_3GlowFlag:	.ds 1	; When non-zero, begins the "glowing" effect for the big '3'
	Title_3GlowIndex:	.ds 1	; Index into an array of colors to cause the big '3' on the title screen to glow

	; ASSEMBLER BOUNDARY CHECK, END OF CONTEXT @ $F5
.BoundZP_Title:	BoundCheck .BoundZP_Title, $F5, Zero Page Title Screen Context


; Ending-specific vars -- NOTE that Ending system uses some of the Title Screen code, so these variables overlap some of the above
; Basically don't assume anything here is free space without consulting above as well...

	.org $75
	Ending2_PicState:	.ds 1	; Ending part 2 picture loader state
	Ending2_ClearLen:	.ds 1	; Length of clear run
	Ending2_ClearPat:	.ds 1	; Pattern to clear the screen with
	Ending2_PicVRAMH:	.ds 1	; Ending part 2 picture VRAM Hi
	Ending2_PicVRAML:	.ds 1	; Ending part 2 picture VRAM Hi
	Ending2_QCmdEnd:	.ds 1	; Ending2_QueueCmd is incremented to this point
	Ending2_FadeTimer:	.ds 1	; Timer which controls the speed of the fade between worlds
	Ending2_QueueCmd:	.ds 1	; incremented after posting, up to Ending2_QCmdEnd
	Ending2_TimerH:		.ds 1	; Ending part 2 timer "high" part
	Ending2_TimerL:		.ds 1	; Ending part 2 timer "low" part
	Ending2_CurWorld:	.ds 1	; Current world we're showing (8 = THE END)

	.org $D2
	Ending_Timer:		.ds 2	; $D2-$D3 Twin ending timers, generally one for Mario and one for Princess
	EndText_Timer:		.ds 1	; Timer used for the ending text display
	Ending_State:		.ds 1	; Current state value for initial part of ending (the princess, prior to curtain)

	EndText_VL:		.ds 1	; Princess speech VRAM Address Low
	EndText_VH:		.ds 1	; Princess speech VRAM Address High
	EndText_CPos:		.ds 1	; Princess speech Character Position
	EndText_State:		.ds 1	; Princess speech state variable

	.org $F4
	Ending2_IntCmd:		.ds 1	; used during ending to buffer out the ending picture data on the interrupt.  Triggers "Do_Ending2_IntCmd" in PRG024 in interrupt context.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ZERO PAGE RAM: WORLD MAP CONTEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.org $75	; $75-$F3 is available for this context-dependent situation

	World_Map_Y:		.ds 2	; $75-$76 (Mario/Luigi) Y pixel coordinate position of Mario on world map
	World_Map_XHi:		.ds 2	; $77-$78 (Mario/Luigi) X pixel (hi byte) coordinate position of Mario on world map
	World_Map_X:		.ds 2	; $79-$7A (Mario/Luigi) X pixel (lo byte) coordinate position of Mario on world map
	World_Map_Move:		.ds 2	; $7B-$7C (Mario/Luigi) Movement left in specified direction (even numbers only!)
	World_Map_Dir:		.ds 2	; $7D-$7E (Mario/Luigi) Specified travel direction (8=Up, 4=Down, 2=Left, 1=Right)

	Map_UnusedPlayerVal:	.ds 2	; $7F-$80 (Mario/Luigi) Set for each Player to $20 when returning to map, but apparently unused otherwise!

				.ds 1	; $81 
				.ds 1	; $82 unused
				.ds 1	; $83 unused

	Map_UnusedPlayerVal2:	.ds 2	; $84-$85 (Mario/Luigi) Apparently unused at all, but backed up and persisted on the world map

; All the WarpWind vars are shared with the HandTrap; they share code, too...
	Map_WWOrHT_Y:		.ds 1	; Warp Whistle wind or Hand Trap Y position
	Map_HandTrap_XHi:	.ds 1	; Hand Trap X Hi (most vars are shared with warp wind, but technically not this one!)
	Map_WWOrHT_X:		.ds 1	; Warp Whistle wind or Hand Trap X position
	Map_WWOrHT_Cnt:		.ds 1	; Warp Whistle wind or Hand Trap counter 
	Map_WWOrHT_Dir:		.ds 1	; Direction the Warp Whistle wind travels (0 = right, 1 = left)

	; Double use
	Map_WarpWind_FX:		; 1 - 4 is the warp whistle effect
	Map_StarFX_State:	.ds 1	; 0 - 2 NOTE: Shared with Map_WarpWind_FX

	World_Map_Twirl:	.ds 1	; If set, Mario is "twirling"

				.ds 1	; $8D unused

	; When Player is "skidding" backward (from death or "twirling" from game over continuation)
	Map_Skid_DeltaY:	.ds 1	; Delta applied directly to Y
	Map_Skid_DeltaFracY:	.ds 1	; Fractional delta Y
	Map_Skid_FracY:		.ds 1	; Fractional Y accumulator

				.ds 1	; $91 unused

	Map_Skid_DeltaX:	.ds 1	; Delta applied directly to X
	Map_Skid_DeltaFracX:	.ds 1	; Fractional delta X
	Map_Skid_FracX:		.ds 1	; Fractional X accumulator
	Map_Skid_FracCarry:	.ds 1	; Fractional carry over accumulator (I think?)
	Map_Skid_Count:		.ds 1	; Just a ticker controlling the display frame of the twirl
	Map_Skid_Counter:	.ds 1

	; Map_Skid_TravDirs -- specifies which way Player must "twirl" to get to the destination
	; Bit 0 Set = Player must travel to the right versus the left
	; Bit 1 Set = Player must travel downward versus upward
	Map_Skid_TravDirs:	.ds 1

				.ds 1	; $99 unused
				.ds 1	; $9A unused

	Map_StarsX:		.ds 8	; $9B-$A2 During World Intro, X position of each star
	Map_StarsY:		.ds 8	; $A3-$AA During World Intro, Y position of each star
	Map_StarsOutRad:	.ds 1	; During World Intro, stars take off radius (0 = smallest, increments for larger)

						 .ds 3	;

	Map_StarsXSteps:	.ds 1	; During World Intro, number of "steps" remaining in the X position adjustment
	Map_StarsRadCnt:	.ds 1	; During World Intro, adds $70 per display frame and adds 1 to the radius when it overflows
	Map_StarsCenterX:	.ds 1	; During World Intro, X center of stars 
	Map_StarsCenterY:	.ds 1	; During World Intro, Y center of stars
	Map_StarsDeltaR:	.ds 1	; During World Intro, delta to the star radii
	Map_StarsConst9:	.ds 1	; During World Intro, ... Constant 9?

				.ds 1	; $B5 unused

	Map_StarsAnimCnt:	.ds 1	; During World Intro, a simple counter that adds 32 per frame and toggles Map_StarsFrame when it overflows
	Map_StarsFrame:		.ds 1	; During World Intro, "frame" of stars (0/1)
	Map_StarsPattern:	.ds 1	; During World Intro, stars current VROM pattern
	Map_StarsLandRad:	.ds 1	; During World Intro, stars landing radius (0 = largest, increments for smaller)
	Map_StarsYSteps:	.ds 1	; During World Intro, number of "steps" remaining in the Y position adjustment

				.ds 1	; $BB unused

	Map_StarsRadius:	.ds 8	; $BC-$C3 During World Intro, each star's "radius" position (each radius position is 0-31)
	Map_StarsState:		.ds 1	; 0 = Stars coming out from center, 1 = Stars moving in towards Player start
	Map_SkidBack:		.ds 1	; Player is skidding back (Map_Player_SkidBack stores whether they skidded on their last turn at all)

				.ds 1	; $C6 unused

	Map_UnusedGOFlag:	.ds 1	; Set at map initialization or if Player gets Game Over and selects CONTINUE/END, no apparent purpose

				.ds 1	; $C8 unused
				.ds 1	; $C9 unused
				.ds 1	; $CA unused
				.ds 1	; $CB unused

	Map_Intro_CurStripe:	.ds 1	; Current stripe of the "World X" intro box to be erased (0 - 7)
	Map_Intro_NTOff:	.ds 1	; Offset into nametable for erasing the "World X" intro box
	Map_Intro_ATOff:	.ds 1	; Offset into the attribute table for erasing the "World X" intro box

	Map_Airship_DC:		.ds 1	; set to 1 when the Airship knows where it's going
	Map_Airship_DY:		.ds 1	; Airship delta between current and target Y coordinate
	Map_Airship_YNib:	.ds 1	; Map_Airship_DY shifts out its lower 4 bits as upper 4 bits to this value
	Map_Airship_YAcc:	.ds 1	; Additional Y accumulator when traveling
	Map_Airship_DXHi:	.ds 1	; Airship delta between current and target X Hi coordinate
	Map_Airship_DX:		.ds 1	; Airship delta between current and target X coordinate
	Map_Airship_XNib:	.ds 1	; Map_Airship_DXHi/Map_Airship_DX shifts out its lower 4 bits as upper 4 bits to this value
	Map_Airship_Dir:	.ds 1	; Airship horizontal travel direction in bit 0, vertical direction in bit 1
	Map_HideObj:		.ds 1	; used for completion)

	MapPoof_Y:		.ds 1	; When using a power-up, "poof" appears at this Y coordinate
	MapPoof_X:		.ds 1	; When using a power-up, "poof" appears at this X coordinate
	Map_UseItem:		.ds 1	; Flag to signal that item is to be used

				.ds 10	; $DB-$E4 unused

	World_Map_Tile:		.ds 1	; Current tile index Mario is standing on
	World_Map_Prop:		.ds 1
				.ds 1	; $E7 unused
				.ds 1	; $E8 unused

	Scroll_Temp:		.ds 1	; Scroll hold value

				.ds 1	; $EA unused
				.ds 1	; $EB unused

	Player_WalkFrame:	.ds 1	; relative, not the same as Player_Frame

				.ds 7	; $ED-$F3 unused

	; ASSEMBLER BOUNDARY CHECK, END OF CONTEXT @ $F4
.BoundZP_Map:	BoundCheck .BoundZP_Map, $F4, Zero Page World Map Context


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ZERO PAGE RAM: BONUS GAME CONTEXT (see PRG022 for lots more info)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.org $75	; $75-$F3 is available for this context-dependent situation

				.ds 22	; $75-$8A unused

	BonusCoins_State:	.ds 1

				.ds 59	; $8C-$C6 unused

	BonusDie_Y:		.ds 1	; UNUSED Bonus Game Die (1-6) Y position
	BonusDie_X:		.ds 1	; UNUSED Bonus Game Die (1-6) X position
	BonusDie_YVel:		.ds 1	; UNUSED Bonus Game Die Y Velocity (when it departs)
	BonusDie_YVelFrac:	.ds 1	; UNUSED Bonus Game Die Y Velocity fractional accumulator

				.ds 41	; $CB-$F3 unused

	; ASSEMBLER BOUNDARY CHECK, END OF CONTEXT @ $F4
.BoundZP_Bonus:	BoundCheck .BoundZP_Bonus, $F4, Zero Page Bonus Context


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ZERO PAGE RAM: 2P VS CONTEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.org $75	; $75-$F3 is available for this context-dependent situation

	Vs_State:		.ds 1	; 2P Vs Mode state
	Vs_IsPaused:		.ds 1	; If set, 2P Vs is paused

				.ds 125	; $77-$F3 unused

	; ASSEMBLER BOUNDARY CHECK, END OF CONTEXT @ $F4
.BoundZP_Vs:	BoundCheck .BoundZP_Vs, $F4, Zero Page 2P Vs Context

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ZERO PAGE RAM: GAMEPLAY CONTEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.org $75	; $75-$F3 is available for this context-dependent situation

; There's a consistent difference of $12 between X and Y; this consistent distancing is meant to be maintained, so leave it alone!

	Player_XHi:		.ds 1	; Player X Hi 
	Objects_XHiZ:		.ds 8	; $76-$7D Other object's X Hi positions

				.ds 6	; $7E unused

	; Pipe_PlayerX/Y variables in use when traveling through pipes
	Pipe_PlayerX:		.ds 1	; Stores Player's X when they went into pipe (non-transit)
	Pipe_PlayerY:		.ds 1	; Stores Player's Y when they went into pipe (non-transit, aligned to nearest 16, minus 1)

	.org $84	; NOTE, the following two are also $84/$85
	; Otherwise, they are replaced with a lookup address
	Level_GndLUT_Addr:	.ds 3

	Player_YHiZ:		.ds 1	; Player Y Hi
	Objects_YHiZ:		.ds 8	; $88-$8F Other object's Y Hi positions
	Player_X:		.ds 1	; Player X
	Objects_XZ:		.ds 8	; $91-$98 Other object's X positions

				.ds 9	; $99 unused
	; Reuse of $9A
	CineKing_Var:		; General variable
	Player_YZ:		.ds 1	; Player Y
	Objects_YZ:		.ds 8	; $A3-$A9 Other object's Y positions

	Player_SpriteX:		.ds 1	; Player's sprite X
	Objects_SpriteX:	.ds 8	; $AC-$B3 Other object's sprite X positions
	Player_SpriteY:		.ds 1	; Player's sprite Y
	Objects_SpriteY:	.ds 8	; $B5-$BC Other object's sprite Y positions
	; WARNING: The distance between Player/Objects_XVelZ and Player/Objects_YVelZ must be same as Player/Objects_X/YVelFrac!
	Player_XVelZ:		.ds 1	; Player's X Velocity (negative values to the left) (max value is $38)
	Objects_XVelZ:		.ds 8	; $BE-$C5 Other object's X velocities
	Player_CarryXVel:	.ds 1
	TileYIndexBase:		.ds 6	; $C6-$CC OBJECT SLOTS 0 - 5 ONLY ... uncleared var??
	CurrentObjectIndexZ:	.ds 1	; Used as a backup for the slot index (e.g. current object, current score, etc.)
	Player_HaltGameZ:	.ds 1	; Player is halting game (e.g. dying, shrinking/growing, etc.)

	; WARNING: The distance between Player/Objects_XVelZ and Player/Objects_YVelZ must be same as Player/Objects_X/YVelFrac!
	Player_YVelZ:		.ds 1	; Player's Y Velocity (negative values upward)
	Objects_YVelZ:		.ds 8	; $D0-$D7 Other object's Y velocities
	Player_CarryYVel:	.ds 1
	Player_InAir:		.ds 1	; When set, Player is in the air

	; Reuse of $D9
	CineKing_Frame2:		; Used only by the World 6 King (Seal juggling a crown, the crown's frame)

	; <Objects_TilesDetectZ:
	; Object's detection bits:
	;	$01-hit wall right
	;	$02-hit wall left
	;	$04-hit ground
	;	$08-hit ceiling
	;	$80-object touching "32 pixel partition" floor (if active)
HIT_RIGHTWALL =		1
HIT_LEFTWALL =		2
HIT_GROUND =		4
HIT_CEILING =		8
	Objects_TilesDetectZ:	.ds 8	; $D9-$E0  on screen

	Player_SprWorkL:	.ds 1	; Sprite work address low
	Player_SprWorkH:	.ds 1	; Sprite work address high

	Level_TileOff:		.ds 1	; Tile mem offset
	Level_Tile:		.ds 1	; Temporary holding point for a detected tile index
	Level_Tile_Prop:		.ds 1
	Player_Jumped:		.ds 1	; for sloped levels only (3 bytes allocated, but only one actually used)
				; *NOTE: Code at PRG030_9EDB clears Player_Slopes+1 and Player_Slopes+2, but these are never used!
	Player_OnPlatform:	.ds 1

	TileXIndex:			.ds 1	; $E9 unused
	TileYIndex:			.ds 1	; $EA unused

	Player_Started:		.ds 1	; Set to Player's original starting X position (also used to check if level has initialized)

			.ds 1	; $EC unused

; Player_Suit -- Player's active powerup (see also: Player_QueueSuit)
PLAYERSUIT_SMALL	= 0
PLAYERSUIT_BIG		= 1
PLAYERSUIT_FIRE		= 2
PLAYERSUIT_RACCOON	= 3
PLAYERSUIT_FROG		= 4
PLAYERSUIT_TANOOKI	= 5
PLAYERSUIT_HAMMER	= 6
PLAYERSUIT_SUPERSUITBEGIN = PLAYERSUIT_FROG	; Marker for when "Super Suits" begin
PLAYERSUIT_LAST		= PLAYERSUIT_HAMMER	; Marker for "last" suit (Debug cycler needs it)
	Player_Suit:		.ds 1

	Player_Frame:		.ds 1	; Player display frame
	Player_FlipBits:	.ds 1	; Set to $00 for Player to face left, Set to $40 for Player to face right

	Player_WagCount:	.ds 1	; after wagging raccoon tail, until this hits zero, holding 'A' keeps your fall rate low
	Player_IsDying:		.ds 1	; 0 = Not dying, 1 = Dying, 2 = Dropped off screen, 3 = Death due to TIME UP

				.ds 1	; $F2 unused

	LevelSpawn_IndexZ:		.ds 1	; Not sure what Obj01 is!! This blocks its left/right handler logic.

	; ASSEMBLER BOUNDARY CHECK, END OF CONTEXT @ $F4
.BoundZP_Game:	BoundCheck .BoundZP_Game, $F4, Zero Page Gameplay Context

	Player_EffXVel: 	.ds 1
	Player_EffYVel:		.ds 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $1xx LOW STACK VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; These are actually "bottom" of the stack; I don't think this is normally recommended.
; but this is probably to keep them "safe" from other RAM clearing routines, since they directly effect the IRQ.
; The debug flag in particular is pretty precariously placed, and under some kind of heavy call stack, seems like
; there's risk it could be set by accident... but I guess this never happens... ?

	.data
	.org $0100

	Update_Select:	.ds 1		; Changes which path of "update routines" are selected; $00 = ??, $20 = Title Screen, $40 = Spade Game, $80 = Vertical level, $A0 = 32 pixel partition, $C0 = Normal

	IRQ_Mode:	.ds 1		; $00 is standard status bar, $20 is title/ending, $40 = 32 pixel partition, $60 = Spade Bonus Game (3 sliding rows), $80 is nothing (e.g. as in 2P versus), $A0 = ???

	.org $0160


; Main NES SRAM begin
	.data	; RAS: Using .data instead of .bss to export labels

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $2xx SPRITE RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.org $0200

; \$02([0-9A-F][0-9A-F])
; Sprite_RAM+$\1

; Sprite memory is laid out in four bytes:
; Byte 0 - Stores the y-coordinate of the top left of the sprite minus 1.
; Byte 1 - Index number of the sprite in the pattern tables.
; Byte 2 - Stores the attributes of the sprite.
; * Bits 0-1 - Most significant two bits of the colour.
; * Bit 5 - Indicates whether this sprite has priority over the background.
; * Bit 6 - Indicates whether to flip the sprite horizontally.
; * Bit 7 - Indicates whether to flip the sprite vertically.
; Byte 3 - X coordinate
Sprite_RAM:	.ds 256		; $0200 - $02FF; This is where sprite memory is stored locally prior to being DMA'ed

Sprite_RAMX = Sprite_RAM + 3
Sprite_RAMY = Sprite_RAM
Sprite_RAMTile = Sprite_RAM + 1
Sprite_RAMAttr = Sprite_RAM + 2

; Relevant flags
SPR_PAL0	= %00000000
SPR_PAL1	= %00000001
SPR_PAL2	= %00000010
SPR_PAL3	= %00000011
SPR_BEHINDBG	= %00100000
SPR_HFLIP	= %01000000
SPR_VFLIP	= %10000000

	; ASSEMBLER BOUNDARY CHECK, END OF SPRITE RAM
.Bound_SprRAM:	BoundCheck .Bound_SprRAM, $0300, Sprite RAM

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $03xx RAM (Largely graphics updating / control)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.org $0300

	Graphics_BufCnt:	.ds 1	; first byte holds current position within buffer (Graphics_Buffer+) to store info
	Graphics_Buffer:	.ds 107	; $0301-$036B Simple (and small!) delayed write buffer; uses same format as Video_Upd_Table in PRG030, get format info there
	TileChng_VRAM_H:	.ds 1	; High part of VRAM address to change
	TileChng_VRAM_L:	.ds 1	; Low part of VRAM address to change
	TileChng_Pats:		.ds 4	; $036E-$0371 The four patterns required to change a tile (for Block_NeedsUpdate)
	TileChng_ColorUpdate: .ds 1 ;
	Level_SizeOrig:		.ds 1	; Holds original size (width or height) of level (in screens)
	Level_PipeExitDir:	.ds 1	; Direction Player is going to exit from a pipe (1 = Up, 2 = Down, 3 = Right, 4 = Left, 5 = In-level Transit)
	Level_PipeNotExit:	.ds 1	; If set, pipes do NOT exit to map (i.e. as in pipe junctions)
	Level_PauseFlag:	.ds 1	; Set to 0 when not paused, or 1 when paused
	Level_SkipStatusBarUpd:	.ds 1	; When set, skips updating the status bar for one frame (priority graphics buffer changes I think)
	Raster_State:		.ds 1	; This variable's meaning depends on the IRQ_Mode in use; typically 0 is first pass, then more for further scanlines

				.ds 7	; $0379-$037F unused

	Scroll_ToVRAMHi:	.ds 1	; High byte for when pushing a column of tile data to VRAM (Set to $20, Name Table 0, after scroll update)

	; $381 dual use
	Scroll_LastCol8:		; Last 8x8 block column that was updated (non-vertical level ONLY)
	Scroll_LastOff8:	.ds 1	; Last 8x8 block offset that was updated (vertical level style ONLY)

	Scroll_PatStrip:	.ds 54	; $0382-$03B7 (may be less?) This stores a strip of 8x8 blocks, (non-vertical level: top to bottom with 2 columns), to render the next 16 pixel "sliver" of screen space
	Scroll_ToVRAMHA:	.ds 1	; High byte for when pushing attribute data to VRAM (Set to $23, attribute table 0)
	Scroll_LastAttr:	.ds 1
	Scroll_AttrStrip:	.ds 14	; $03BA-$03C7 (may be less?) This stores a 2x2 block of attribute coloring data
	World_Num_Debug:	.ds 1	; When debug mode is activated (KKKZSPIU), this is the world you select to start on
	Map_StarsDeltaX:	.ds 1	; Delta the stars move in X to reach the Player (always positive, code figures direction)
	Map_StarsDeltaY:	.ds 1	; Delta the stars move in Y to reach the Player (always positive, code figures direction)
						.ds 16	; $03CB-$03DA unused

	Map_Stars_PRelX:	.ds 0	; During world intro, screen relative position of Player X
	Map_Stars_PRelY:	.ds 0	; During world intro, screen relative position of Player Y
	Pause_Menu:			.ds 1
	Player_RunMeter:		.ds 1	; >>>>>>[P] charge level ($7F max)
	Player_Power:		.ds 1
	Old_Player_Power:	.ds 1
	Old_Player_Badge:	.ds 1
	Player_Debug:		.ds 1
	Player_CheatSub:	.ds 1
	; Level_JctCtl is configured when you enter a door or a pipe
	; * When $80, use current values for Level_AltLayout and Level_AltObjects
	; * When otherwise non-zero (inc $80), skips setting vertical start position
	;
	; Normal values for the junction:
	;  0 - Disables junction (i.e. no junction occurring)
	;  1 - Junction initialization
	;  2 - Big Question Block bonus area
	;  3 - General purpose junction (as specified by Level_AltLayout and Level_AltObjects)
	;  4 - Generic level exit (where you come up from a pipe in the generic exit area)
	;  5 - Special Toad House (used for the 1-3 warp whistle)
	Level_JctCtl:		.ds 1

	Level_JctFlag:		.ds 1	; Toggles when you junction

	Level_Redraw:		.ds 1
	Level_KeepObjects:	.ds 1

	Map_DrawPanState:	.ds 1	; Map draw/pan state
	ObjGroupRel_Idx:	.ds 1	; Holds relative index of object within its group (see PRG000_CA51)
	InvFlip_VAddrHi:	.ds 1	; Hi byte of VRAM address during inventory flip modifications

	MapBackgroundInit:	.ds 1	; $03E4 unused

	; CLOSING
	;  0: Erase old status bar complete, palette changed to blue
	;  1: Draw top bar (at middle)
	;  2: Draw bottom bar (at middle)
	;  3: Erase top bar (at middle)
	;  4: Draw top middle row of normal status bar/cards
	;  5: Draw bottom middle row of normal status bar/cards
	;  6: Draw top bar (at top)
	;  7: Draw bottom bar (at bottom)

	; OPENING
	;  8: Erase old status bar complete, palette changed to yellow
	;  9: Draw top bar (at middle)
	; 10: Draw bottom bar (at middle)
	; 11: Erase top bar (at middle)
	; 12: Erase bottom bar (at middle)
	; 13: Draw top middle row of inventory
	; 14: Draw bottom middle row of inventory
	; 15: Draw top bar (at top)
	; 16: Draw bottom bar (at bottom)
	InvFlip_Frame:		.ds 1	; Sort of a "frame" of animation during flipping of the inventory box; 0-7 during closing, 8-15 during opening
	InvFlip_Counter:	.ds 1	; 0 = Closed, 4 = Fully Open
	InvStart_Item:		.ds 1	; Starting inventory item; typ. $00, $07, $0E, $15 (Rows 1-4)
	InvHilite_X:		.ds 1	; Current hilite position X coordinate
	InvHilite_Item:		.ds 1	; Which item in the current row is highlighted, 0-6

	THouse_ID:		.ds 1	; An unused ID value that would track boxes already opened in a Toad House (concept unused!)

	Coins_Earned_Buffer:	.ds 1

	Coins_Earned:		.ds 1	; A "buffer" of coins earned to be added to your total, actual coinage stored in Player_Coins[2]
	Coins_Lost:			.ds 1
	Map_Powerup_Poof:	.ds 1	; Counter that handles the "poof" effect when a powerup is used on the map (requires Inventory to be open, and forces it to close afterward)
	Message_Id:			.ds 1
	Message_Id_Prev:	.ds 1


	; Level_FreeVertScroll
	; 0 = Screen locked at $EF (lowest point) unless flying or climbing a vine
	; 1 = Free vertical scroll
	; 2 = Locked at arbitrary point (i.e. whatever Vert_Scroll is, it stays there)
	Level_FreeVertScroll:		.ds 1

	Level_7Vertical:		.ds 1	; Set in World 7 vertical type levels
	Level_SelXStart:		.ds 1	; Selects X starting position when level begins (valid values 0-3)

UPDATERASTER_32PIXPART	= 1	; 32 pixel partition; common use is for levels with water along the bottom
UPDATERASTER_SPADEGAME	= 2	; Spade game sliders
UPDATERASTER_WATERLINE	= 3	; "Water line" mode (described at ObjHorzAutoScroller_Init)
UPDATERASTER_32PIXSHOWSPR= $80	; If NOT set, hides sprites that fall beneath the partition (i.e. for fixed water effect)
	Update_Request:		.ds 1	; This changes the current IRQ_Mode and Update_Select and doesn't persist
	Map_Starman:		.ds 1	; Player used a Starman!
	Map_Power_Disp:		.ds 1	; This is the powerup currently DISPLAYED on the map; it should be the same as $0746 World_Map_Power, except for Judgem's Cloud
	Map_Warp_PrevWorld:	.ds 1	; The world you're coming FROM when warping (also used as output from warp zone what world you're going to)

	; ASSEMBLER BOUNDARY CHECK, END OF $03xx
.Bound_0300:	BoundCheck .Bound_0300, $0400, $03xx


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $04xx WORLD MAP CONTEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; $0400-$04CF (except $0461 and $0462, see "$04xx RAM SOUND/MUSIC ENGINE") is available for this context-dependent situation
	; $0400-$0443 unused in either of the following cases

	; Doing double .org's because of major overlap, but be careful!

	.org $0447
; W8D = World 8 Darkness; overlaps the vars used by the entrance transition
	Map_W8D_VAddrH:		.ds 1

				.ds 3	; $0448-$044A unused

	Map_W8D_VAddrL:		.ds 1

				.ds 5	; $044C-$0450 unused

	Map_W8D_VAddrH2:	.ds 1

				.ds 1	; $0452 unused

	Map_W8D_VAddrL2:	.ds 1

				.ds 1	; $0454 unused

	Map_W8D_TileOff:	.ds 1	; In-tile offset (0 = upper left, 1 = lower left, 2 = upper right, 3 = lower right)

				.ds 2	; $0456-$0457 unused

	;Map_W8D_YOff:		.ds 1	; Y Offset from Player when doing darkness
	;Map_W8D_XOff:		.ds 1	; X Offset from Player when doing darkness
	;Map_W8D_RC:		.ds 1	; Row in the upper bits, column in the lower bits
	;Map_W8D_Dir:		.ds 1	; Direction of travel in darkness (1 = Right, 2 = Left, 4 = Down, 8 = Up)
	;Map_W8D_X:		.ds 1
	;Map_W8D_Y:		.ds 1
	;Map_W8D_Idx:		.ds 1

	; ASSEMBLER BOUNDARY CHECK, CONTEXT END OF $04D0
.BoundW8D_04D0:	BoundCheck .BoundW8D_04D0, $04D0, $04xx range World Map Entrance Transition context

	.org $0444
	; Entrance transition; overlaps with above
	; NOTE: Memory is cleared from here to +$1C, $460
	; For border arrays, 0-3: Top 0, bottom 1, right 2, left 3
	Map_EntTran_VLHalf:	.ds 1	; When 1, offset starts vertically "lower half" (at $F0 of first screen)
	Map_EntTran_TBCnt:	.ds 1	; decreasing counter as the transition moves inward top/bottom
	Map_EntTran_LRCnt:	.ds 1	; decreasing counter as the transition moves inward left/right
	Map_EntTran_BVAddrH:	.ds 4	; $0447-$044A Each border's current high part of VRAM address
	Map_EntTran_BVAddrL:	.ds 4	; $044B-$044E Each border's current low part of VRAM address
	Map_EntTran_BorderLoop:	.ds 1	; Border loop counter 
	Map_EntTran_Cnt:	.ds 1
	Map_EntTran_VAddrH:	.ds 1	; high part of VRAM address to modify
	Map_EntTran_VAddrHAdj:	.ds 1	; An adjusted version of the high address as needed to wrap (used in removed "box out" version only)
	Map_EntTran_VAddrL:	.ds 1	; low part of VRAM address to modify
	Map_EntTran_TileOff:	.ds 1	; Offset into tile memory (used in removed "box out" version only)
	Map_EntTran_Tile8x8:	.ds 1	; Offset to which 8x8 pattern of the tile we're grabbing that we need (used in removed "box out" version only)
	Map_EntTran_VRAMGap:	.ds 1	; Sets gap (i.e. 1 for vertical, 32 for horizontal; used in removed "box out" version only)
	Map_Transition_Column:	.ds 1
	Map_Transition_SpriteY:	.ds 1
	Map_Transition_SpriteIndex:	.ds 1
				.ds 5	; $0457-$045E unused

	Map_EntTran_Temp:	.ds 1	; Seems to me a multi-purpose value in entrance transition
	Map_EntTran_InitValIdx:	.ds 1	; Selects an index of values to initialize by

	; ASSEMBLER BOUNDARY CHECK, CONTEXT END OF $04D0
.BoundET_04D0:	BoundCheck .BoundET_04D0, $04D0, $04xx range World Map Entrance Transition context


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $04xx BONUS GAME CONTEXT (see PRG022 for lots more info)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.org $0400	; $0400-$04CF (except $0461 and $0462, see "$04xx RAM SOUND/MUSIC ENGINE") is available for this context-dependent situation
	; WARNING: $0400-$04CF gets cleared at end of bonus game!

	Roulette_Pos:		.ds 0	; $0400-$0402 horizontal position of each row
	Roulette_PosHi:		.ds 0	; $0403-$0405 Hi part of Roulette_Pos
	Roulette_ShapeLock:	.ds 0	; $0406-$0408 Locked position of each row (0 = Mushroom, 1 = Flower, 2 = Mushroom, 3 = Star)
	Roulette_ConfigRun:	.ds 0	; 0 = Configuring, 1 = Running
	Roulette_ConfigState:	.ds 0	; Early configuration state
	Roulette_RunState:	.ds 0	; Running state of game

	; NOTE: Watch the reuse here...
	Roulette_StopState:		; $040C-$040E Current "state" of each row while it is coming to a stop (1+)
	Roulette_xUpY:		.ds 1	; "x Up" display Y position (overlaps first byte of Roulette_StopState)
	Roulette_LivesToGive:	.ds 1	; Lives left to give in reward (overlaps second byte of Roulette_StopState)
				.ds 1	; Third byte of Roulette_StopState

	Roulette_Speed:		.ds 3	; $040F-$0411 Movement speed of each row (4.4FP)
	Roulette_StopCnt:	.ds 3	; $0412-$0414 Decrements to zero while each row is stopping
	Roulette_PosFrac:	.ds 3	; $0415-$0417 Fractional accumulator for position of row 1-3

				.ds 1	; $0418 unused

	Roulette_Turns:		.ds 1	; UNUSED "Turns Remaining" (if > 0, and you lose Roulette, hit a button and spin again!)

				.ds 12		; $041A-$0425 unused

	; UNUSED "Prize" that appears in some varities of the lost bonus games
	; (Or that's my best guess anyway.)  BMF54123's patch shows these as
	; Mushroom, Flower, Star, or Judgem's Cloud.  Perhaps it was a situation
	; like "Here's the prize on the table, if you can get it"...
	Card_SelectX:			; Card cursor X (NOTE: Shared with Bonus_PrizeX)
	Bonus_PrizeX:		.ds 1	; UNUSED Prize sprite X

	Card_SelectY:			; Card cursor Y (NOTE: Shared with Bonus_PrizeY)
	Bonus_PrizeY:		.ds 1	; UNUSED Prize sprite Y

	Card_Index:			; Currently selected card in "N-Spade" Card game (NOTE: Shared with Bonus_CurBufOffset)
	Bonus_CurBufOffset:	.ds 1	; Offset in graphics buffer while generating instruction box

	Card_FirstIndex:	.ds 1	; Card_Index of the first card you flipped (in case you get it wrong on the second...)

	Bonus_Round2:			; UNUSED Picks which "Round 2" game would be played (NOTE: Shared with Card_SelectXOrig)
	Card_SelectXOrig:	.ds 1	; Card cursor original X

	Card_MoveDelay:		.ds 1	; Decrements to zero; if not zero, can't move on N-Spade game
	Card_SprRAMOff:		.ds 1	; Sprite RAM offset after cursor is drawn; for drawing card flip
	Card_AnimTick:		.ds 1	; Animation tick, decrements to zero
	Card_VRAM_L:		.ds 1	; Low part of VRAM address of N-Spade card to modify
	Card_VRAM_H:		.ds 1	; High part of VRAM address of N-Spade card to modify

	Card_FlipCount:		.ds 1	; +1 for every card flip
	Card_MatchCard:		.ds 1	; Card to match, i.e. the first card you selected of the pair
	Card_UnusedVL:		.ds 1	; ?? Some VRAM Low; Seems to only be part of an unused routine
	Card_UnusedVH:		.ds 1	; ?? Some VRAM High; Seems to only be part of an unused routine

	; Bonus_GameHost
	;	0 = Toad Host: The only one we ever got
	; All others are UNUSED...
	;	1 = Koopa Troopa Host + "Prize" Game
	;	2 = Koopa Troopa Host, no "Prize" Game
	;	3 = Hammer Bro
	Bonus_GameHost:			; NOTE: Shared with Card_GameState
	Card_GameState:		.ds 1	; State of N-Spade card game
	Card_TurnsRemain:	.ds 1	; Number of turns remaining
	Card_FlipFrame:		.ds 1	; Frame of flipping card

; The next three vars belong to an unused routine @ PRG022:DA62; unclear what it did exactly
	Card_UnusedArray:	.ds 4	; $0437-$043A ??
	Card_UnusedAttr:	.ds 1	; Seems to only be part of an unused routine; attribute table offset of some sort
	Card_UnusedArrIdx:	.ds 1	; Seems to only be part of an unused routine; index for Card_UnusedArrIdx

	Card_Matches:		.ds 1	; Matches (local, this round; Seems to only be used as part of the unused routine)
	Card_CoinsToGive:	.ds 1	; If greater than zero, coins are being given

				.ds 1	; $043F unused

	; Bonus_GameState
	;
	; 0 = ?
	; 1 = Giving instructions die game
	; 2 = Rotating "die"
	; 3 = Coin spurt prize
	; 4 = Stopped die
	; 5 = Die flies away
	; 6 = ?? Initialize instructions?
	; 7 = Giving instructions
	; 8 = Pause before proceeding
	; 9 = Exiting
	Bonus_GameState:	.ds 1

	Card_InitState:		.ds 1	; Initialization state of N-Spade card game

	; Bonus_GameType
	; This appears to determine what game you're about to play.
	; This also reveals some of the greatest questionable loss in SMB3...
	; When this value is anything besides 1 or 2, it plays what I SUPPOSE
	; was a "roulette" game?  With a fixed graphics patch, it appears to
	; be a die cycling 1-6.
	;
	; 0 = Japanese text, translated as:
	;	If "1" appears, 1 (?)
	;	If "2" appears, I'll give you a key
	;	Otherwise, I'll give you coins.
	; 1 = Standard Spade game (UNUSED BONUS GAMES NOTE: May have once been the "odd" game spoken of in type 5)
	; 2 = N-Spade (UNUSED BONUS GAMES NOTE: May have once been the "even" game spoken of in type 5)
		; 3:		.ds 1	; I suspect this is a placeholder ('C' being the 3rd)
		; 4:		.ds 1	; I suspect this is a placeholder ('D' being the 4th)
	; 5 = Japanese: "If an odd number appears, I'll let you play the Roulette Game."
	; 6 = Japanese: "If an even number appears, I'll let you play the Card Game."
	; 7 = Japanese: "2, return (?)"
	;

	; The "unused" ones are just guesses (where even possible) based on the
	; semi-translated "greetings" for the sake of tracking...

	Bonus_GameType:		.ds 1

	Bonus_KTPrize:		.ds 1	; UNUSED Koopa Troopa's "Prize" Game Prize ID (0 = Mushroom, 1 = Star, 2 = Flower, 3 = Judgem's, by BMF54123's patch)

	; $0444-$04CF unused in this context (excluding $0461 and $0462, see "$04xx RAM SOUND/MUSIC ENGINE")

	; ASSEMBLER BOUNDARY CHECK, CONTEXT END OF $04D0
.BoundBonus_04D0:	BoundCheck .BoundBonus_04D0, $04D0, $04xx range Bonus context

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $04xx GAMEPLAY CONTEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.org $0400	; $0400-$04CF (except $0461 and $0462, see "$04xx RAM SOUND/MUSIC ENGINE") is available for this context-dependent situation

	Objects_PreviousTilesDetect:		.ds 8

	Fade_State:		.ds 1	; 0 = Nothing, 1 = Fade in, 3 = Fade out
	Fade_Tick:		.ds 1	; Ticks down and then decrements Fade_Level
	Fade_Level:		.ds 1	; 4 to 0, fade in level
	FadeOut_Cancel:		.ds 1	; If set, the next attempted fade out will be cancelled, which then resets this to zero
	Player_AllowAirJump:	.ds 1	; Counts down to zero, but while set, you can jump in the air
	StatusBar_Recolored: .ds 1

	CineKing_Frame:			; King's animation frame (NOTE: Shared with Objects_Data3 first byte)

	Objects_Data6:		.ds 8	; $0770-$0774 General purpose variable 6 (except as noted above)
	Objects_Data7:		.ds 8	; $0421-$0428 General object variable 7

	Objects_BoundLeft:	.ds 8
	Player_BoundLeft:	.ds 1
	SpecialObj_BoundLeft:	.ds 1
	Tail_BoundLeft:	.ds 1

	Objects_BoundLeftHi:.ds 8
	Player_BoundLeftHi:	.ds 1
	SpecialObj_BoundLeftHi:	.ds 1
	Tail_BoundLeftHi:	.ds 1

	Objects_BoundRight:	.ds 8
	Player_BoundRight:	.ds 1
	SpecialObj_BoundRight:	.ds 1
	Tail_BoundRight:	.ds 1

	Objects_BoundRightHi: .ds 8
	Player_BoundRightHi:  .ds 1
	SpecialObj_BoundRightHi:  .ds 1
	Tail_BoundRightHi:	.ds 1

	Objects_BoundBottom:	.ds 8
	Player_BoundBottom:	.ds 1
	SpecialObj_BoundBottom:	.ds 1
	Tail_BoundBottom:		.ds 1

	Objects_BoundBottomHi:.ds 8
	Player_BoundBottomHi:	.ds 1
	SpecialObj_BoundBottomHi:	.ds 1
	Tail_BoundBottomHi:		.ds 1

	Objects_BoundTop:	.ds 8
	Player_BoundTop:	.ds 1
	SpecialObj_BoundTop:	.ds 1
	Tail_BoundTop:		.ds 1

	Objects_BoundTopHi:.ds 8
	Player_BoundTopHi:	.ds 1
	SpecialObj_BoundTopHi:	.ds 1
	Tail_BoundTopHi:	.ds 1

	ObjectBump:			.ds 1
	BlockedLevel:		.ds 1
	CompleteLevelTimer:	.ds 1
	PBarHitTestX:		.ds 5
	PBarHitTestY:		.ds 5
	Weather_XPos:		.ds 8
	Weather_YPos:		.ds 8
	Weather_XVel:		.ds 8
	Weather_YVel:		.ds 8
	Weather_Pattern:	.ds 8
	Weather_Disabled:	.ds 1
	AnimOffset:			.ds 1;
	SprAnimOffset:		.ds 1;
	TrapSet:			.ds 1;
	DayNightActive:		.ds 1;
	LastPowerUp:		.ds 1;
	Reverse_Gravity:	.ds 1
	Moon_Gravity:		.ds 1
	NoGravity:			.ds 1;
	Object_WallStops:	.ds 1;
	Object_CeilingStops: .ds 1
	Player_ForcedSlide:	.ds 1
	Player_PrevVel:	ds 1
	RhythmPlatformEnabed: .ds 1
	RhythmPlatformInitiated: .ds 1
	RhythmKeeper:		.ds 5;
	RhythmMusic:		.ds 1;
	TreasureBox_Disabled: .ds 1

; $0461-$0462 are reserved for use by the sound/music engine
; These ought to be moved into the greater range to spare this area...
; $04EB and $04EC are unused, good place for these vars!!

Level_MusicQueue:		.ds 1	; Requests a song from Set 2A/B (used to allow delayed start)
Level_MusicQueueRestore:	.ds 1	; What to "restore" the BGM to when it changes (e.g. Starman, P-Switch, etc.)

; $04D0-$04FF is reserved for use by the sound/music engine
; Lower ranges are context-dependent

	Music_TriTrkPos:	.ds 1	; Offset of triangle track in currently playing index
	Music_NseTrkPos:	.ds 1	; Offset of noise track in currently playing index
	Music_PCMTrkPos:	.ds 1	; Offset of DMC track in currently playing index
	Music_Sq2RestH:		.ds 1	; Square 2 Track hold for rest values to be applied after each event
	Music_Sq2Rest:		.ds 1	; Square 2 Track "Rest" period (counts down to zero)
	Music_Sq2NoteLen:	.ds 1	; Square 2 Track length of note (counts down to zero, cuts off sound)
	Music_Sq1Rest:		.ds 1	; Square 1 Track "Rest" period (counts down to zero)
	Music_Sq1NoteLen:	.ds 1	; Square 1 Track length of note (counts down to zero, cuts off sound)
	Music_TriRestH:		.ds 1	; Triangle Track hold for rest values to be applied after each event
	Music_TriRest:		.ds 1	; Triangle Track "Rest" period (counts down to zero)
	Music_NoiseRest:	.ds 1	; Noise Track "Rest" period (counts down to zero)
	Music_NseRestH:		.ds 1	; Noise Track hold for rest values to be applied after each event
	Music_DMCRest:		.ds 1	; DMC Track "Rest" period (counts down to zero)
	Music_DMCRestH:		.ds 1	; DMC Track hold for rest values to be applied after each event
	Music_PCMStart:		.ds 1	; Holds the starting offset of the DMC track
	Music_NextIndex:	.ds 1	; Next "index" to be played

	SFX_Counter1:		.ds 1	; Generic purpose SFX counter
	SndCur_Player:		.ds 1	; Currently playing Player sound (blocks music on Square 1)
	SndCur_Level1:		.ds 1	; Currently playing "level 1" sound (blocks music on Square 2)
	SndCur_Level2:		.ds 1	; Currently playing "level 2" sound
	SndCur_Music1:		.ds 1	; Currently playing BGM from Music 1 set
	SndCur_Music2:		.ds 1	; Currently playing BGM from Music 2 set
	SndCur_Map:		.ds 1	; Currently playing map sound (blocks music on Square 1)
	SndCur_Pause:		.ds 1	; Holds copy of Sound_QPause, to play sound while everything else is paused
	SFX_Counter2:		.ds 1	; Generic purpose SFX counter for level sounds
	SFX_Counter3:		.ds 1	; Generic purpose SFX counter
	SFX_Counter4:		.ds 1	; Generic purpose SFX counter

				.ds 1	; $04EB unused
				.ds 1	; $04EC unused

	Sound_IsPaused:		.ds 1	; When set, sound processing is PAUSED


				.ds 1	; $04EE ununsed
				.ds 1	; $04EF ununsed
				.ds 1	; $04F0 ununsed

; For any of these queues, the value is a bit value, which offers
; a simple prioritization system; lowest value plays over any other

; Queue Player sound effects
SND_PLAYERJUMP	= $01	; Jump
SND_PLAYERBUMP	= $02	; Bump
SND_PLAYERSWIM	= $04	; Swim / Squish
SND_PLAYERKICK	= $08	; Kick
SND_PLAYERPIPE	= $10 	; Pipe / shrink
SND_PLAYERFIRE	= $20 	; Fireball
SND_PLAYERPOWER	= $40	; Full power ringing (must be constantly set or you don't hear it)
SND_PLAYERFROG	= $90	;
SND_SMALLJUMP	= $80 	; frog hop
	Sound_QPlayer:		.ds 1

; Queue Level sound effects 1
SND_LEVELCOIN	= $01	; Coin
SND_LEVELRISE	= $02 	; Powerup rising from block
SND_LEVELVINE	= $04 	; Vine rising
SND_LEVELBABOOM	= $08 	; Cannon fire
SND_LEVELBLIP	= $10 	; Text "type" sound / card select
SND_LEVELPOWER	= $20 	; Power up
SND_LEVEL1UP	= $40 	; 1-up
SND_LEVELPOOF	= $80 	; Lost suit / wand shot
SND_LEVELUNK	= $90	; Unknown / lost sound
SND_LEVELSHOE	= $A0	; Lost Kuirbo's Shoe
SND_LEVELTAILWAG= $B0	; Tail wag
	Sound_QLevel1:		.ds 1

; Queue Level sound effects 2
SND_LEVELCRUMBLE= $01	; Crumbling brick
SND_LEVELFLAME	= $02 	; Flame jet
SND_BOOMERANG	= $04 	; Boomerang
SND_LEVELAIRSHIP= $08	; Airship fly
SND_LEVELMARCH	= $10 	; Hammer Bros. march around
; $20 - Unused
; $40 - Unused
SND_LEVELSKID	= $80 	; Skid

	Sound_QLevel2:		.ds 1


; Queue music request 1
; The following I've grouped into "Set 1" (which play song index 0-7):
MUS1_PLAYERDEATH	= $01	; Player death
MUS1_GAMEOVER		= $02	; Game over
MUS1_BOSSVICTORY	= $04	; Victory normal
MUS1_WORLDVICTORY	= $08	; Victory super (King reverted, Bowser defeated, etc.)
MUS1_BOWSERFALL		= $10	; Bowser dramatic falling
MUS1_COURSECLEAR	= $20	; Course Clear
MUS1_TIMEWARNING	= $40	; Time Warning (attempts to speed up song playing)
MUS1_STOPMUSIC		= $80	; Stops playing any music
	Sound_QMusic1:		.ds 1

; Queue music request 2
; The following I've grouped into "Set 2A":
MUS2A_WORLD1		= $01	; World 1
MUS2A_WORLD2		= $02	; World 2
MUS2A_WORLD3		= $03	; World 3
MUS2A_WORLD4		= $04	; World 4
MUS2A_WORLD5		= $05	; World 5
MUS2A_WORLD6		= $06	; World 6
MUS2A_WORLD7		= $07	; World 7
MUS2A_WORLD8		= $08	; World 8
MUS2A_SKY		= $09	; Coin Heaven / Sky World / Warp Zone (World 9)
MUS2A_INVINCIBILITY	= $0A	; Invincibility
MUS2A_WARPWHISTLE	= $0B	; Warp whistle
MUS2A_MUSICBOX		= $0C	; Music box
MUS2A_THRONEROOM	= $0D	; King's room
MUS2A_BONUSGAME		= $0E	; Bonus game
MUS2A_ENDING		= $0F	; Ending music


; The following I've grouped into "Set 2B":
MUS2B_OVERWORLD		= $10	; Overworld 1
MUS2B_UNDERGROUND	= $20	; Underground
MUS2B_UNDERWATER	= $30	; Water
MUS2B_FORTRESS		= $40	; Fortress
MUS2B_BOSS		= $50	; Boss
MUS2B_AIRSHIP		= $60	; Airship
MUS2B_BATTLE		= $70	; Hammer Bros. battle
MUS2B_TOADHOUSE		= $80	; Toad House
MUS2B_ATHLETIC		= $90	; Overworld 2
MUS2B_PSWITCH		= $A0	; P-Switch
MUS2B_BOWSER		= $B0	; Bowser
MUS2B_WORLD8LETTER	= $C0	; Bowser's World 8 Letter
MUS2B_MASK		= $F0	; Not intended for use in code, readability/traceability only
	Sound_QMusic2:		.ds 1

; Queue map sound effects
SND_MAPENTERWORLD	= $01	; World begin starry entrance sound
SND_MAPPATHMOVE		= $02	; Path move
SND_MAPENTERLEVEL	= $04	; Enter level
SND_MAPINVENTORYFLIP	= $08	; Flip inventory
SND_MAPBONUSAPPEAR	= $10	; Bonus appears
; $20: ?? unused ?
; $40: ?? unused ?
SND_MAPDENY		= $80	; Denied
	Sound_QMap:		.ds 1

; Queue pause sound
PAUSE_STOPMUSIC		= $01	; Pause sound effect (like pressing START, pauses music!)
PAUSE_RESUMEMUSIC	= $02	; Resume sound (resumes music)
	Sound_QPause:		.ds 1

	DMC_Time:		.ds 1	; Time remaining on DMC sound
	Music_Sq1RestH:		.ds 1	; Square 1 Track hold for rest values to be applied after each event
	Music_Sq1AltRamp:		.ds 1	; When Square 1 track encounters a $00 byte, it actives a ramping mode, the value of which is stored here
	Music_LOST4FB:		.ds 1	; AFAIK, value in music engine that is "lost"; nothing seems to set it, and it doesn't do very much (possibly was a note length override??)
	Music_LOST4FC:		.ds 1	; AFAIK, value in music engine that is "lost"; nothing seems to set it, and it doesn't do very much

	Music_RestH_Base:	.ds 1	; Base offset into Music_RestH_LUT
	Music_Sq2TrkOff:	.ds 1	; Offset of square wave 2 track in currently playing index
	Music_Sq1TrkOff:	.ds 1	; Offset of square wave 1 track in currently playing index

	; ASSEMBLER BOUNDARY CHECK, CONTEXT END OF $04D0
.BoundSound_0500:	BoundCheck .BoundSound_0500, $0500, $04xx Sound Engine



; NOTE: CONTEXT -- RAM in the $500-$5FF range changes meaning depending on the "context", i.e. what
; state of the game we're currently in!  This means that variables are defined with overlapping
; addresses, and care must be taken to use the correct labels depending on the code!

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $05xx TITLE SCREEN CONTEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.org $0500	; $0500-$05FF is available for this context-dependent situation

				.ds 16	; $0500-$050F unused

	; NOTE: All of this block is cleared by the title screen
	Title_MLAccelCnt:	.ds 1	; constant moving counter which overflows to provide a more "natural" acceleration to the Bros
	Title_MarioPoof:	.ds 1	; countdown of Mario's "poof" when he collects the power up
	Title_MLHoldTick:	.ds 1	; Set to $40 when Mario/Luigi are "held" (count down to zero)
	Title_ObjVar:		.ds 6	; $513-$518 Minor objects user-defined variable 1 (automatically decrements if not zero!)
	Title_ObjVar2:		.ds 6	; $519-$51E Minor objects user-defined variable 2
	Title_ObjFrame:		.ds 6	; $51F-$524 Minor object "frame"; adds 2x the value here to the pattern selection for the object's sprites

	; $0525-$05FF unused

	; ASSEMBLER BOUNDARY CHECK, END OF $0600
.BoundTS_0600:	BoundCheck .BoundTS_0600, $0600, $05xx Title Screen context

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $5xx MAP CONTEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.org $0500	; $0500-$05FF is available for this context-dependent situation

	; NOTE: Most of the memory in this space is shared with Gameplay Context
	; so don't assume that any value that should be spared is safe in here...

	; NOTE: There are 8 defined "core" map objects, but up to 15 (?) can exist!
	; *** Index 1 is assumed reserved for the Airship, however...
	Map_Object_ActY:	.ds 15	; $0500-$050E For map objects, their actual display Y coordinate (as it may modify, esp. with marchers)
	Map_Object_ActX:	.ds 15	; $050F-$051D For map objects, their actual display X coordinate (as it may modify, esp. with marchers)
	Map_Object_ActXH:	.ds 15	; $051E-$052C For map objects, their actual display X Hi byte (as it may modify, esp. with marchers)
	Map_Object_Data:	.ds 15	; $052D-$053B For marching objects, 0/1 for their direction, could be anything though
	Map_March_Count:	.ds 15	; $053C-$054A Simply counts and overflows, but used to determine position of marching map objects (PER ID, not object index ... Actually is seems they go back and forth on that??)
						.ds 60	; $054B-$0586 unused

	Map_Objects_Vis:	.ds 15	; $0587-$058E Set for map objects as visible, clear if it's not
	Map_MarchInit:		.ds 1	; Set when marching data has been initialized (done once per marching cycle on the map)
	Map_InCanoe_Flag:	.ds 1	; Set when Player is in Canoe (modifies movement, allows movement in water, etc.)
	World_8_Dark:		.ds 1	; Darkness on World 8 Map, level 2 -- counts 0-7 while setting up the effect
	World_Map_AnimF:	.ds 1	; World map animation frame (for bushes, etc.)
	World_Map_AnimT:	.ds 1	; World map animation tick

	Save_Menu_Showing: .ds 1
	Save_Menu_YesNo:  .ds 1
	; $059B-$05FF unused

	; ASSEMBLER BOUNDARY CHECK, END OF $0600
.BoundM_0600:	BoundCheck .BoundM_0600, $0600, $05xx World Map context

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $5xx BONUS GAME CONTEXT (see PRG022 for lots more info)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.org $0500	; $0500-$05FF is available for this context-dependent situation

				.ds 231	; $0500-$05E6 unused

	BonusText_VH:		.ds 1
	BonusText_VL:		.ds 1

	; $05E9-$05FF unused

	; ASSEMBLER BOUNDARY CHECK, END OF $0600
.BoundBonus_0600:	BoundCheck .BoundBonus_0600, $0600, $05xx World Map context

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $5xx GAMEPLAY CONTEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.org $0500	; $0500-$05FF is available for this context-dependent situation

	; Event_Countdown is context dependent; without context, does nothing
	; * When you come out of a pipe, this counter decrements until the pipe should be finished
	; * When you die, counts down until dropping back to map

	; NOTE: Event_Countdown and the following 7 are all decremented together!
	Event_Countdown:	.ds 1

	Player_TailCount:	.ds 1	; Determines display frame of tail wag
	Player_InAir_OLD:	.ds 1	; Stores backup of Player_InAir
	Player_FireCount:		; Player shoots fireball/hammer, sets sprite frame (shared with Player_FrogHopCnt)
	Player_FrogHopCnt:	.ds 1	; Counter used for frog hopping along the ground (shared with Player_FireCount)
	Player_PMeterCnt:	.ds 1	; Tick counter used to count when to increase/decrease Power Meter
	Player_TailAttack:	.ds 1	; Initiailized to $12; counts down to zero, performs tail attack!

MARIO_SUBMARINE = 1
MARIO_PLANE = 2

	Player_Vehicle:	.ds 1
					.ds 1
	CineKing_Timer:			; Timer; decrements to zero (shares Objects_Timer first byte)
	Objects_Timer:		.ds 8	; $0518-$051F "Timer" values; automatically decrements to zero

	; NOTE: Until Timer2 expires, object will not hit other objects.
	; Probably used as a dampener to keep an object from slaughtering
	; another bunch of objects TOO quickly!
	Objects_Timer2:		.ds 8	; $0520-$0527 "Timer" values; automatically decrements to zero 

	; All the Level_BlockChgX/Y values are aligned to nearest 16 (i.e. tile coordinate)
	Block_ChangeXHi:	.ds 1	; Player X High value when block change was queued
	Block_ChangeX:	.ds 1	; Player X Low value when block change was queued
	Block_ChangeYHi:	.ds 1	; Player Y High value when block change was queued
	Block_ChangeY:	.ds 1	; Player Y Low value when block change was queued

	; The alternate vertical scrolls are used so that raster effects can be properly implemented!
	Level_VertScrollH:	.ds 1	; Alternate VertScroll_Hi used by engine, adjusted before being sent to Vert_Scroll_Hi
	Level_VertScroll:	.ds 1	; Alternate VertScroll used by engine, adjusted before being sent to Vert_Scroll

	Player_AboveTop:	.ds 1	; If Player is above top of level, this is $FF (-1), otherwise it is zero

	Level_InitAction:		; AT LEVEL INITIALIZATION ONLY: Performs a specific initialization routine (NOTE: Shared with Player_Slide)
	Player_Slide:		.ds 1	; Positive values sliding forward, negative values sliding backward; directly sets Vel

	Player_UphillFlag:	.ds 1	; When set, Player is walking uphill, and uses speed index value at Player_UphillSpeedIdx
	Player_Flip:		.ds 1	; Invincibility Somersault is used when set; only works in air, reset on ground
	Player_GroundPound: .ds 1
	Level_AirshipH:			; Height of the airship during the Airship Intro (shared with Player_KuriboDir)
	Player_KuriboDir:	.ds 1	; While Kuribo's shoe is moving: 0 - Not requesting move, 1 - move right, 2 - move left

	Player_Grow:		.ds 1	; Tick counter used to animate growth into Super Mario (20 is starting value, or 2f to shrink)
	Player_Invulnerable:	.ds 1	; Player "flashing invincibility" after being hit, counts down to zero
	Player_StarInv:		.ds 1	; Starman Invincibility counter; full/fatal invincibility, counts down to zero
	Player_Invicible:	.ds 1
	Player_SuitLost:	.ds 1	; Suit lost to hit discard "poof" counter
	Player_StarOff:		.ds 1	; Starman Invincibility wear-off (the last second or so when it slows and vanishes), counts down to zero
	Player_HaltTick:	.ds 1	; When non-zero, all action halts until this countdown hits zero
	Player_Kick:		.ds 1	; Kick frame in use, counts down to zero
	Player_PipeFace:	.ds 1	; Player forward frame, used for vertical pipe entrance, counts down to zero
	Player_EndLevel:	.ds 1	; Player's end of level run-off until count down to zero (player will actually wrap around horizontally if too large)
	Level_AirshipCtl:	.ds 1	; Airship control -- 1 = run and jump to catch air ship, 2 = climb to enter, 3 = ente


	LevelPartialInit:	.ds 1	; When set, performs a partial reinitialization of level data (notably does not perform the Level InitAction unless it is airship related)
	Level_TilesetIdx:	.ds 1	; Holds Level_Tileset as an "index" value instead, relative to levels (i.e. Level_Tileset - 1)
	Level_ObjectsInitialized:	.ds 1	; When set to zero, a mass reset is performed (used when changing "scenes" in a single level)
	Level_UnusedFlag:	.ds 1	; Unused; only set in a couple places, but never read back!
	Level_SlopeEn:		.ds 1	; If set, enables slope tiles (otherwise they're considered flat top-only solids)

	Block_NeedsUpdate:	.ds 1	; When non-zero, queues a "change tile" event
	Block_UpdateValue:	.ds 1	;
	Block_WasUpdated:	.ds 1
	Game_Counter:		.ds 1	; A counter which continuously increments unless something is "stopping" the action
	Game_Counter_NoStop:	.ds 1
	Level_Event:		.ds 1	; Check "LevelEvent_Do" for values; 0 means nothing
	Level_EventProperty: .ds 1
	Level_PSwitchCnt:	.ds 1	; When non-zero, P-Switch is active (init @ $80); counts down to zero and restarts music

	Player_TailDirection:	.ds 1	; While Player is sliding, this is added to X Velocity (does not persist, however)

	Player_IsClimbing:	.ds 1	; Set when Player is climing vine
	Player_IsClimbingObject: .ds 1;
	Player_FlipBits_OLD:	.ds 1	; Holds backup of Player_FlipBits
	Player_HitCeiling:	.ds 1	; Flag set when Player has just hit head off ceiling
	Player_HitFloor:	.ds 1
	Player_HitWall: .ds 1
	Player_FlyTime:		.ds 1	; When > 0, Player can fly (for power ups that do so); decrements (unless $FF) to 0
	Player_IsDucking:	.ds 1	; Set when Player is ducking down
	Player_XExit:	.ds 1	;
	Player_YExit:	.ds 1

	; Level_PipeMove is set to various values that dictate 
	; how Player is moving within a pipe
	; 
	; The lower 2 bits form a direction as follows:
	;	00 - right
	;	01 - left
	;	10 - down
	;	11 - up
	;
	; If bit 7 ($80) is NOT set, then we're just entering
	; the pipe, and next 3 bits say what it will do:
	; 000xx - Does nothing (not used, invalid)
	; 001xx - Exits level (i.e. World Map pipe junctions) 
	; 010xx - Junction to appropriate "Big Question Block" bonus area (Level_JctCtl = 2)
	; 011xx - Junction general (Level_JctCtl = 3)
	; 100xx - Junction to generic exit area (Level_JctCtl = 4)
	; 101xx - In-level transit (a la World 7 pipe mazes and other places; does not set Level_JctCtl)
	;
	; If bit 7 IS set, we're moving through the pipe (either exiting out one end or in-transit)
	Level_PipeMove:		.ds 1

	Level_CoinHeav:		.ds 1	; Enter coin heaven when set $80; Increments; at $D0, "soft jump" arrival; terminates at wrap to $00

	Player_MoveLR:		.ds 1	; 0 - Not moving left/right, 1 - Moving left, 2 - Moving right (reversed from the pad input)

	Player_WalkAnimTicks:	.ds 1	; Ticks between animation frames of walking; max value varies by Player's X velocity

	Player_InWater:		.ds 1	; Set for when in water (1 = Regular water specifically, other non-zero values indicate waterfall)
	Player_SwimCnt:		.ds 1	; Swim counter FIXME Describe better 0-3
	Player_QueueSuit:	.ds 1	; Queues a suit change (values like Player_Suit, but add 1, EXCEPT: $0F = Statue enable, $40 = Splash, $80 = Kuribo's Shoe)
	Player_Shell:		.ds 1	; Player is in Tanooki Statue mode; counts down to zero
	Player_ShellBump:	.ds 1
	Player_RunFlag:		.ds 1	; Set while Player is actually considered "running" (holding down B and at enough speed; doesn't persist)
	Player_BlockPounded:    .ds 1	; Set to cause block bounce (upper 4 bits specifies what kind of block will be bounced)
	Counter_ByPlayerSpd:	.ds 1	; A counter which increments faster as the Player goes faster

	Level_HAutoScroll:	.ds 1	; When set to 1, "auto horizontal scroll" is active (this can be toggled mid-level)

	Player_OffScreen:	.ds 1	; Set when Player is completely off screen

	; FloatLevel_PlayerWaterStat: For levels that "float" and have a fixed set of water at the bottom
	; Bit 6: Set if Player is beneath bottom of water
	; Bit 7: Set if beneath top of water
	FloatLevel_PlayerWaterStat:	.ds 1


	Player_LowClearance:	.ds 1	; Set when Player is in a "low clearance" situation (big Mario in a single block high tunnel)

	PUp_StarManFlash:	.ds 1	; Set when a Starman is bouncing about so it cycles colors! (also used to get super suit if set in advance)

	; Player_Behind_En:
	; Specifies whether the "Behind the scenes" effect is actually active
	; If the Player has stepped out from behind the background, it can be
	; still active, but he won't get the effect of it!
	Player_Behind_En:	.ds 1
	Player_Behind:		.ds 1	; When non-zero, Player is "behind the scenes" (as by white block)

	Player_Slippery:	.ds 1	; 0 = Ground is not slippery, 1 = Ground is a little slippery, 2 = Ground is REALLY slippery
	Player_SandSink:	.ds 1	; Sinking in quicksand! (holds Y when quicksand hit in upper 4 bits, bit 0 sets '0' jumping, '1' sinking)

	; Player_PartDetEn: "32 Pixel Partition Detection" enabler
	; When set, if Player Y >= 160, Player detects bottom two rows of tiles implicitly
	; Used with Update_Request = UPDATERASTER_32PIXPART if there's a floor 
	; (i.e. NOT used in levels with fixed water; for that, see FloatLevel_PlayerWaterStat)
	Player_PartDetEn:	.ds 1
	Player_InPipe:		.ds 1	; Player is going through pipe
	Player_MushFall:	.ds 1	; Set to 0 when mushroom is to fall to the left, 1 to the right
	Player_SprOff:		.ds 1	; Player sprite offset (NOTE: Should be multiples of 4, otherwise bad unaligned stuff happens!)

	; Strange gapping here; there's pretty much enough room for a couple more special objects
	Object_SpriteRAMOffset:		.ds 8	; $058F-$0596 Sprite_RAM offset by object

	SpecialObj_Data3:	.ds 8	; $0597-$059E General purpose variable 2
	SpecialObj_Stompable:	.ds 8	; $0597-$059E General purpose variable 2
	SpecialObj_AllowOffScreen:	.ds 8	; $0597-$059E General purpose variable 2

	SpecialObj_HurtEnemies:	.ds 8	; $05B5-$05BC General purpose variable 3

	SpecialObj_YVelFrac:	.ds 8	; $05A1-$05A8 Y velocity fractional accumulator
	PlayerProj_YVelFrac:	.ds 2

	SpecialObj_XVelFrac:	.ds 8	; $05AB-$05B2 X velocity fractional accumulator
	PlayerProj_XVelFrac:	.ds 2

	SpecialObj_Y:		.ds 8	; $05BF-$05C6 Y low coordinate of special object
	PlayerProj_Y:		.ds 2	; $7CE3-$7CE4 Player projectile Y

	SpecialObj_X:		.ds 8	; $05C9-$05D0 X low coordinate of special object
	PlayerProj_X:		.ds 2	; $7CE5-$7CE6 Player projectile X

	SpecialObj_YVel:	.ds 8	; $05D3-$05DA Y Velocity of special object
	PlayerProj_YVel:	.ds 2	; $7CE7-$7CE8 Player projectile Y Velocity (NOTE: Integer, not 4.4FP)

	SpecialObj_XVel:	.ds 8	; $05DD-$05E4 X Velocity of special object
	PlayerProj_XVel:	.ds 2	; $7CE9-$7CEA Player projectile X Velocity (NOTE: Fireball is integer, 4.4FP for hammer ONLY)

	Inventory_Open:		.ds 1	; Set when inventory panel is open, also used to dictate whether it is "opening" (1) or "closing" (0)
	Kill_Tally:		.ds 1	; Counter that increases with each successful hit of an object without touching the ground
	Kill_Tally_Ticker: .ds 1
	Kill_Count:			.ds 1

	; NOTE: Since Level_AScrlConfig checks are generally implemented as "BEQ/BNE", technically ANY
	; value enables auto scroll adjustments, but officially ASCONFIG_ENABLE is used to enable it
ASCONFIG_ENABLE		= $01	; Enables auto scroll coordinate adjustments of any sort
ASCONFIG_HDISABLE	= $80	; Disables horizontal auto scroll coordinate adjustment (generally if Horz Auto Scroll is not in use)
	Level_AScrlConfig:	.ds 1

	Cine_ToadKing:		.ds 1	; Set to 1, initializes Toad and transformed king; set to 2 while running that cinematic
	; The diagonal auto scroller wraps vertically several times to give the illusion
	; of a long vertical strip.  AScrlURDiag_WrapState is set to 1 and 2 during this
	; process which makes it possible.  Objects that need to offset themselves to
	; cope with this behavior utilize AScrlURDiag_WrapState_Copy to stay in sync.
	AScrlURDiag_WrapState_Copy:	.ds 1	; Copy of AScrlURDiag_WrapState
	AScrlURDiag_WrapState:		.ds 1
	
	; ASSEMBLER BOUNDARY CHECK, END OF $0600
.BoundGame_0600:	BoundCheck .BoundGame_0600, $0600, $05xx Gameplay context


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $06xx RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	; DURING ENDING ONLY
	.org $0600
	Ending_CmdBuffer:		.ds 192	; $0600-$06C0 Buffer used during ending sequence

	; Normal purpose $06xx RAM...
	.org $0600

HEAD_INDEX				= 0 ;
BODY_INDEX				= 1 ;
HEAD_FEET_LEFT_INDEX	= 2 ;
HEAD_FEET_RIGHT_INDEX	= 3 ;
HEAD_WALL_INDEX			= 4 ;
FEET_WALL_INDEX			= 5 ;
TAIL_INDEX				= 6 ;
	Level_Tile_Prop_Head:	.ds 1	; Tile at Player's head 
	Level_Tile_Prop_Body:	.ds 1
	Level_Tile_Prop_Floor_Ceiling_Left:	.ds 1	; Tile at Player's feet left
	Level_Tile_Prop_Floor_Ceiling_Right:	.ds 1	; Tile at Player's feet right
	Level_Tile_Prop_Wall_Upper:	.ds 1	; Tile "in front" of Player ("lower", at feet)
	Level_Tile_Prop_Wall_Lower:	.ds 1	; Tile "in front" of Player ("upper", at face)
	Level_Tile_Whack:	.ds 1	; Tile last hit by tail attack or shell

	; Level_Tile_Slope: Slope of tile for each of the positions above (first byte also used by objects)
	; 0: Slope shape at feet
	; 1: Slope shape at head
	; 2: "in front" of Player ("lower", at feet)
	; 3: "in front" of Player ("upper", at face)

	Scroll_Cols2Upd:	.ds 1	; Number of 8x8 columns to update (typically set to 32 for a full dirty update)


	PSwitchTiles:		.ds 4

	Object_VertTileProp:	.ds 8	; Object tile detected at "feet" of object
	Object_VertTileValue:	.ds 8
	Object_HorzTileProp:	.ds 8	; Object tile detected in front of object, i.e. a wall
	Object_HorzTileValue:	.ds 8
	Object_BodyTileProp:	.ds 8
	Object_BodyTileValue:	.ds 8
	ActualTile_LastValue:	.ds 1
	Tile_LastValue:		.ds 1
	Tile_LastProp:		.ds 1
	Brick_Bump:			.ds 1

	Objects_SpritesHorizontallyOffScreen:	.ds 8	; $0651-$0658 Flags; Bits 7-2 set when each 8x16 sprite is horizontally off-screen (left-to-right from MSb)

SPRITE_0_INVISIBLE = $80
SPRITE_1_INVISIBLE = $40
SPRITE_2_INVISIBLE = $20
SPRITE_3_INVISIBLE = $10
SPRITE_4_INVISIBLE = $08
SPRITE_5_INVISIBLE = $04

	Objects_SpawnIdx:	.ds 8	; $0659-$0660 Holds the index into level data that this object was spawned from

; Objects_State
OBJSTATE_DEADEMPTY	= 0	; Dead/Empty
OBJSTATE_INIT		= 1	; Init
OBJSTATE_NORMAL		= 2	; Normal (typical operation)
OBJSTATE_SHELLED	= 3	; Shelled (shelled enemy post-stomp)
OBJSTATE_KICKED		= 4	; Kicked (kicked by Player / spinning shell)
OBJSTATE_KILLED		= 5	; Killed (flipped over and falling off screen)
OBJSTATE_FRESH		= 6 ;
OBJSTATE_NONE		= 7 ; used to keep a slot open
OBJSTATE_FROZEN		= 8
OBJSTATE_FROZENSOLID	= 9


	Objects_State:		.ds 8

	Objects_Frame:		.ds 8	; $0669-$0670 "Frame" of object (see ObjectGroup_PatternSets)

	Objects_ID:		.ds 8	; $0671-$0678 All active actor IDs

	Objects_Orientation:	.ds 8	; $0679-$0680 Applied sprite attributes for this object (usually just horizontal/vertical flip)

	Objects_SpritesVerticallyOffScreen:	.ds 8	; $0681-$0688 Flags; Bits 3-0 set when each 8x16 sprite is vertically off-screen (top-to-bottom from MSb)
SPRITE_0_HINVISIBLE = $80
SPRITE_1_HINVISIBLE = $40
SPRITE_2_HINVISIBLE = $20
SPRITE_3_HINVISIBLE = $10
SPRITE_4_HINVISIBLE = $08
SPRITE_5_HINVISIBLE = $04

SPRITE_0_VINVISIBLE = $01
SPRITE_1_VINVISIBLE = $02
SPRITE_2_VINVISIBLE = $04
SPRITE_3_VINVISIBLE = $08

	Objects_Data4:		.ds 8	; $0689-$0690 Generic variable 1 for objects
	Objects_Data5:		.ds 8	; $0691-$0698 Generic variable 2 for objects

	Objects_ExpPoints: .ds 5


	Exp_Earned:		.ds 1	; $069C-$069D (16-bit value) A "buffer" of score earned to be added to your total, total score stored in Player_Experience
	Objects_Property:		.ds 5
	Player_IsHolding:	.ds 1	; Set when Player is holding something (animation effect only)

; NOTE!! These object vars are OBJECT SLOT 0 - 4 ONLY!

; Shell_SleepTimer: Used as the "wake up" out of shell timer
; If timer is less than $60, it decrements normally, otherwise...
;	If object is in state 2, timer decrements normally
;	If object is in state 4 (being held), timer only decrements every 4 ticks
;	In all other states, timer decrements every 2 ticks
	Shell_SleepTimer:		.ds 5	; $06A6-$06AA Used as the "wake up" out of shell timer
	Shell_ShakeTimer:		.ds 8	; $06AB-$06AF "Timer" values; automatically decrements to zero (used in "shakin' awake" effect)
	Objects_ShowShakeFeet: .ds 5
	Objects_SlowTimer:	.ds 5
	Explosion_Timer:	.ds 5

	Buffer_Occupied:	.ds 2	; $06B4-$06B5 Set if respective Object_BufferX/Y buffer is already taken by an object

	Object_DisableWater: .ds 1
	Objects_InWater:	.ds 8	; $06B7-$06BB Set when object is in water
	Objects_SlowFall:	.ds 8

	SpecialObj_Data2:	.ds 8	; $06BD-$06C4 General purpose variable 1

	SpecialObj_Data1:	.ds 8	; $06C7-$06CE Special object "data" field, defined by object
	PlayerProj_Data:	.ds 2


	SpecialObj_Timer:	.ds 8	; $06D1-$06D8 "Timer" values; automatically decrements to zero


	ObjectGenerator_Var:		.ds 8	; $06DB-$06E2
	ObjectGenerator_Timer:	.ds 8	; $06E3-$06EA Cannon Fire timer, decrements to zero
	ObjectGenerator_Property: .ds 8;
	ObjectGenerator_Visibility: .ds 8;

GENERATOR_HVISIBLE = 01;
GENERATOR_VVISIBLE = 02;

	; ASSEMBLER BOUNDARY CHECK, END OF $0700
.Bound_0700:	BoundCheck .Bound_0700, $0700, $06xx RAM


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $07xx RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	.org $0700
	Scroll_UpdAttrFlag:	.ds 1	; Set when it is time to update attributes


	Level_Tileset:		.ds 1	; Different tilesets which changes the detection and meaning in levels

	Bonus_UnusedVH:			; VRAM High address ?? Seems to only be part of an unused routine
	ToadTalk_VH:		.ds 1	; Cinematic Toad & King / "Toad House" Toad VRAM Address High

	Bonus_UnusedVL:			; VRAM Low address ?? Seems to only be part of an unused routine
	ToadTalk_VL:		.ds 1	; Cinematic Toad & King / "Toad House" Toad VRAM Address Low

	BonusText_CPos:
	ToadTalk_CPos:		.ds 1	; Cinematic Toad & King / "Toad House" Toad Character Position

	BonusText_CharPause:	.ds 1	; Counter that decrements to zero between letters
	Bonus_UnusedFlag:	.ds 1	; Doesn't do much besides block an unused subroutine

	Map_Pan_Count:		.ds 1	; Map is panning, counts to zero (Scroll_LastDir sets which direction we're panning)

	; NOTE sharing
	CineKing_Timer2:		; Timer; decrements to zero
	Bonus_Timer:			; Decrements to zero
	Map_Intro_Tick:		.ds 1	; Counts down to zero while displaying the "World X" intro
	Entering_From_Map:	.ds 1
	Previous_Coins:		.ds 3
	Previous_Cherries:	.ds 1
	Previous_Stars:		.ds 1
	Previous_Stars_Collected1: .ds 1
	Previous_Stars_Collected2: .ds 1
	Previous_Stars_Collected3: .ds 1
	Previous_PowerUp_Reserve: .ds 1
	Previous_Badge: .ds 1
	Previous_Map_Level: .ds 1
	Map_ReturnStatus:	.ds 1	; When 0, level panel is cleared; otherwise, Player is considered to have died (decrements life!)

	; Each byte of PatTable_BankSel sets the VROM available at
	; 0000 (first half BG), 0800 (second half BG, typ animated), 
	; 1000 (1/4 sprites), 1400 (2/4 sprites), 1800 (3/4 sprites),
	; and 1C00 (4/4 sprites), respectively
	PatTable_BankSel:	.ds 6	; $0719-$071E  Provides an array of 6 pages to set the entire Pattern Table [BG_Full_CHRROM_Switch]
	LastPatTab_Sel:		.ds 1
	PAGE_C000:		.ds 1	; Page to set PRG ROM C000 (PRGROM_Change_Both)
	PAGE_A000:		.ds 1	; Page to set PRG ROM A000 (PRGROM_Change_Both)
	PAGE_CMD:		.ds 1	; When using PRGROM_Change_Both2 or PRGROM_Change_A000, this value stores the MMC3 command
	Player_Current:		.ds 1	; Which Player is currently up (0 = Mario, 1 = Luigi)
	

	; NOTE: sharing
	World_EnterState:		; State variable during "world X" intro entrance, set to 3 when entering a level; overlaps GameOver_State
	CineKing_State:			; State of King-got-his-wand-back sequence
	GameOver_State:		.ds 1	; State variable used during "Gameover!" sequence only; overlaps World_EnterState

	Map_Operation:		.ds 1	; Map_Operation: Current "operation" happening on map (See Map_DoOperation in PRG010)

	Total_Players:		.ds 1	; Total players (0 = 1P, 1 = 2P)
	Level_NoStars:		.ds 1	; No apparent use; only assigned to, but never read back
	Bonus_DDDD:		.ds 1	; ?? Set to '1' if you exit the unused bonus game BONUS_UNUSED_DDDD
	Map_HandState:		.ds 1	; Hand trap state

	Map_WW_Backup_Y:	.ds 1	; Warp Whistle wind backs up the Player's map Y

	Map_WW_Backup_XH:	.ds 1	; Warp Whistle wind backs up the Player's map X Hi byte
	Map_WW_Backup_X:	.ds 1	; Warp Whistle wind backs up the Player's map X
	Map_WW_Backup_UPV2:	.ds 1	; Warp Whistle wind backs up Map_UnusedPlayerVal2

	Player_Lives:		.ds 2	; $0736-$0737 (Mario/Luigi) Player's lives
	Map_Unused738:		.ds 1	; Index used in some dead code in PRG011; sometimes index of unused array Map_Unused7DC6
	ClearPattern:		.ds 1	; Set by ClearPattern_ByTileset for use in Clear_Nametable_Short
	PalSel_Tile_Colors:	.ds 1	; Stores value to index which tile color set to use when palette loading routine is called
	PalSel_Obj_Colors:	.ds 1	; Stores value to index which object color set to use when palette loading routine is called
	Player_FallToKing:	.ds 2	; $073C-$073D (Mario/Luigi) Player will fall to king when Level_ExitToMap is nonzero (instead of map)
	Map_Player_SkidBack:	.ds 2	; $073E-$073F (Mario/Luigi) Set to '1' if Player died last turn or otherwise ejected (that is, they DID skid from their last turn, not necessarily currently skidding)

	Map_NSpadeMatches:	.ds 1	; Keeps count of N-Spade matches of active session (9 means game is done)
	Map_NSpadeInProg:	.ds 1	; If set, there's an N-Spade game "in progress" (so if you lose, you pick it up later)

	Map_Airship_Trav:	.ds 1	; Airship's current travel-table offset (randomly offset by 0-2, spices up life)

	Map_DoFortressFX:	.ds 1	; Bust locks, build bridges, whatever after Mini-Fortress is toppled

	; WARNING: The distance between Player/Objects_XVelFrac and Player/Objects_YVelFrac must be same as Player/Objects_X/YVel!
	Player_XVelZFrac:	.ds 1	; X velocity fractional accumulator
	Objects_XVelFrac:	.ds 8	; $074E-$0755 Other object's X velocity fractional accumulator

				.ds 1	; $0756 unused

	THouse_UnusedFlag:	.ds 1	; Cleared when Toad House gives you an item, but never used otherwise

				; WARNING: Though unused, this is required for the consistent padding between XVel(Frac) and YVel(Frac)
				; So use it if you want, but maintain the distance!!
				.ds 7	; $0758-$075E unused

	; WARNING: The distance between Player/Objects_XVelFrac and Player/Objects_YVelFrac must be same as Player/Objects_X/YVel!
	Player_YVelFrac:	.ds 1	; Y velocity fractional accumulator
	Objects_YVelFrac:	.ds 8	; $0760-$0767 Other object's Y velocity fractional accumulator


	Objects_ColorCycle:	.ds 8	; $0768-$076F Cycles colors of object and decrements to zero (e.g. "Melting" ice block, starman, etc.)

	; Objects_Data6: Special hardcoded behavior for the following objects ONLY:
	; OBJ_PYRANTULA, OBJ_CHAINCHOMPFREE, OBJ_VEGGIEGUY, 
	; OBJ_SKULLBLOOPER, or OBJ_FIRESNAKE
	; ... as the X/Y buffer slot they occupy (see Object_Delete)

	King_Y:				; Y position (NOTE: shared with Objects_TargetingYVal)

	Pipe_TransYDelta:		; In-level transit pipe Y delta value (WARNING: Shared with Level_ScrollDiffV)
	Level_ScrollDiffV:	.ds 1	; Difference between desired vertical and the current Vert_Scroll (WARNING: Shared with Pipe_TransYDelta)
	Level_ScrollDiffH:	.ds 1	; Difference between desired horizontal and the current Horz_Scroll

	Random_Pool:		.ds 10	; $0781-$078A (or $0789?) Data pool for pseudo-random number generator algorithm
RandomN = Random_Pool+1			; Pull a random number from the sequence (NOTE: RandomN+1 is also good; If you need multiple random numbers, call Randomize)

	Map_PlayerLost2PVs:	.ds 1	; When > 0, (1=Mario, 2=Luigi) doesn't lose a life for "death" exiting to map, but does lose their turn

	Player_RescuePrincess:	.ds 1	; Player will jump to the princess rescue when Level_ExitToMap is nonzero (instead of map)
	; Objects_PlayerHitStat:
	;	Bit 0 - Set if Player's bbox bottom is HIGHER than object's bbox bottom
	;	Bit 1 - Set if Player's bbox left edge is to the LEFT of object's bbox left edge
	;	Bit 4 - Set if Player tail attacked an object
	Objects_PlayerHitStat:	.ds 8	; $0796-$079D Player hit status

; ********************************************************************************
; The Palette_* vars here form a graphics buffer to be committed in the
; style of the Video_Upd_Table; see "Video_Upd_Table" in PRG030 for format.
	Video_DoPalUpd:			; Name consistent with Video_Upd_Table 
	Palette_AddrHi:		.ds 1	; Stores high part of palette address when committing palettes
	Palette_AddrLo:		.ds 1	; Stores low part of palette address when committing palettes
	Palette_BufCnt:		.ds 1	; 32 for updating entire palette
	Palette_Buffer:		.ds 32	; $07C1-$07E0 Buffer of palette bytes to commit, used for fade in/out
	Palette_Term:		.ds 1	; Set to zero as terminator, per requirement of the Video_Upd_Table format
; ********************************************************************************

; BigQBlock_GotIt: 
;	Big ? Blocks can only be retrieved once; this is a bitfield that marks which
;	ones you've gotten by setting a bit per screen space in the Big ? Block area.
;	Basically, if you reenter a Big ? Block area after opening it, it won't reappear!
;	See ObjInit_BigQBlock and ObjNorm_BigQBlock for usage...
;	NOTE: This is cleared completely upon Player death which works since levels
;	are not re-enterable, but still seems a bit extreme...
	
	Palette_NeedsUpdate:		.ds 1;

	DMC_Queue:		.ds 1	; Stores value to play on DMC
	DMC_Current:		.ds 1	; Currently playing DMC sound

	Sound_Sq1_CurFL:	.ds 1	; Holds current "low" frequency of Square Wave 1 (Warning: Must be +4 to Sound_Sq2_CurFL, see PRG031_E808)

	Music_NseStart:		.ds 1	; Holds the starting offset of the noise track (CHECK: Reuse of $07F3, is this bad??)

				.ds 1	; $07F4 unused, but required for padding

	Music2_Hold:		.ds 1	; A very little used feature, Music Set 1 overrides Music Set 2, but after a M1 song finishes, it restarts the M2 song
	Sound_Sq2_CurFL:	.ds 1	; Holds current "low" frequency of Square Wave 1 (Warning: Must be +4 from Sound_Sq1_CurFL, see PRG031_E808)

	Music_Sq2Patch:		.ds 1	; Current "instrument patch" for Square 2 (only upper 4 bits stored, 0ppp 0000)
	Music_Sq1Patch:		.ds 1	; Current "instrument patch" for Square 1 (only upper 4 bits stored, 0ppp 0000)

				.ds 1	; $07F9 unused

	Sound_Map_L2Hld:	.ds 1	; Same as Sound_Map_LHold, used for the secondary track (Warning: Will be affected by triangle, see PRG031_E808)
	Sound_Map_Len2:		.ds 1	; Same as Sound_Map_Len, used for the secondary track
	Sound_Map_LHold:	.ds 1	; Current length setting, used as delay after each byte of map sound (changed by special bytes in range $80-$FF)
	Sound_Map_Len:		.ds 1	; Countdown tick for current note/rest that map sound effect is on
	Sound_Map_Off2:		.ds 1	; Same as Sound_Map_Off, used for the secondary track
	Sound_Unused7FF:	.ds 1	; Cleared once, never used otherwise

	GameScript_Wins:	.ds 1
	GameScript_Losses:	.ds 1
	GameScript_LossLimit: .ds 1
	GameScript_Data:	.ds 16

	LevelName:			.ds 28
	; ASSEMBLER BOUNDARY CHECK, END OF $0800
.Bound_0800:	BoundCheck .Bound_0800, $0800, $07xx RAM


	.data
	.org $7000

	MapPointers:	.ds 256
	Cheat_Input: 	.ds 16
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $68xx SRAM for 2P Vs ONLY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; NOTE: $6000-$67FF is still in considered tile grid memory (see next section)
; 2P Vs just utilizes a chunk where no tiles will ever exist in 2P Mode

; 2P Vs Only
	.data
	.org $6800

	Vs_MemStart:			; Should be at "top"; this point and 512 bytes forward are cleared at start of 2P Vs

	; Vs_PlayerFrame
	; 0/1: Standing (0) / walking (0/1) / falling-not-jumped (1) frames
	; 2: Skidding turnaround
	; 3: Jumping/Falling-jumped
	; 4: Dizzy
	; 5: Kicking
	; 6: Dying
	; 7: Climbing
	Vs_PlayerFrame:		.ds 2	; $6800-$6801 Mario/Luigi Frame
	Vs_PlayerState:		.ds 2	; $6802-$6803 Mario/Luigi State (0=Init, 1=Normal, 2=Dying, 3=Ladder climbing)
	Vs_ObjectState:		.ds 12	; $6804-$680F Objects State (0=Dead/empty, 1=Normal, 2=Flipped over, 3=Dying)

				.ds 1	; $6810 unused

	Vs_PlayerBlkHitCnt:	.ds 2	; $6811-$6812 Mario/Luigi Hit block counter value
	Vs_PlayerY:		.ds 2	; $6813-$6814 Mario/Luigi Y
	Vs_ObjectsY:		.ds 12	; $6815-$6820 Objects Y

				.ds 1	; $6821 unused

	Vs_PlayerBlkHitY:	.ds 2	; $6822-$6823 Mario/Luigi Aligned Y position where block was hit
	Vs_PlayerX:		.ds 2	; $6824-$6825 Mario/Luigi X
	Vs_ObjectsX:		.ds 12	; $6826-$6831 Objects X

				.ds 1	; $6832 unused

	Vs_PlayerBlkHitX:	.ds 2	; $6833-$6834 Mario/Luigi Aligned Y position where block was hit
	Vs_PlayerYVel:		.ds 2	; $6835-$6836 Mario/Luigi Y Velocity
	Vs_ObjectYVel:		.ds 12	; $6837-$6842 Objects Y Velocity

				.ds 1	; $6843 unused

	Vs_PlayerBlkHitYVel:	.ds 2	; $6844-$6845 Mario/Luigi Hit block Y velocity
	Vs_PlayerXVel:		.ds 2	; $6846-$6847 Mario/Luigi X Velocity
	Vs_ObjectXVel:		.ds 12	; $6848-$6853 Objects X Velocity

				.ds 3	; $6854-$6856 unused

	Vs_PlayerClimbFrame:	.ds 2	; $6857-$6858 incremented as Player climbs
	Vs_ObjectAnimCnt:	.ds 12	; $6859-$6864 A continuous counter per object for animating (typically 2 frames)

				.ds 1	; $6865 unused

	Vs_PlayerDir:		.ds 2	; $6866-$6867 Mario/Luigi direction (1=Right, 2=Left)
	Vs_ObjectDir:		.ds 12	; $6868-$6873 Objects direction (1=Right, 2=Left)

				.ds 1	; $6874 unused

	Vs_PlayerYVelFrac:	.ds 2	; $6875-$6876 Mario/Luigi Y velocity fractional accumulator
	Vs_ObjectYVelFrac:	.ds 12	; $6877-$6882

				.ds 3	; $6883-$6885 unused

	Vs_PlayerXVelFrac:	.ds 2	; $6886-$6887 Mario/Luigi X velocity fractional accumulator
	Vs_ObjectXVelFrac:	.ds 12	; $6888-$6893

				.ds 3	; $6894-$6896 unused

	Vs_PlayerDetStat:	.ds 2	; $6897-$6898 Mario/Luigi detection status
	Vs_ObjectDetStat:	.ds 12	; $6899-$68A4 Objects detection status

				.ds 3	; $68A5-$68A7 unused

	Vs_ObjectVar1:		.ds 12	; $68A8-$68B3 General variable 1

				.ds 1	; $68B4 unused

	Vs_PlayerKick:		.ds 2	; $68B5-$68B6 Mario/Luigi Player is kicking until decrements to zero
	Vs_PlayerDizzy:		.ds 2	; $68B7-$68B8 Mario/Luigi Player "dizzy" face until decrements to zero
	Vs_PlayerStick:		.ds 2	; $68B9-$68BA Mario/Luigi Mario/Luigi Player "sticking" to ceiling; decrements to zero
	Vs_PlayerBumpTimer:	.ds 1	; Mario/Luigi Players bumped off eachother (and can't again until zero); decrements to zero
	Vs_POWBlockCnt:		.ds 1	; POW block counter; decrements to zero; until then, POW shaking!

	; 2P Vs Object IDs
VSOBJID_SPINY		= 0	; Spiny
VSOBJID_SIDESTEPPER	= 2	; Sidestepper
VSOBJID_FIGHTERFLY	= 3	; Fighter Fly
VSOBJID_FIREBALL_HORZ	= 4	; Horizontal Fireball that spawns to keep Players from hiding down at the bottom
VSOBJID_FIREBALL_ENDER	= 5	; Game Ender Fireball (bounces around, attempts to kill Players who've stuck around too long!)
VSOBJID_FIREBALL_FOUNTAIN= 6	; Fountain Fireball
VSOBJID_COIN		= 7	; Coin (from [?] block)
VSOBJID_MUSHROOMCARD	= 8	; Mushroom card
VSOBJID_FLOWERCARD	= 9	; Flower card
VSOBJID_STARCARD	= 10	; Star card
VSOBJID_KICKEDBLOCK	= 11	; Kicked block (from [?] block match)
	Vs_ObjectId:		.ds 12	; $68BD-$68C8 Objects ID

				.ds 1	; $68C9 unused

	Vs_ObjectSprRAMOff:	.ds 1	; Current object Sprite RAM offset
	Vs_ObjectSprRAMSel:	.ds 1	; Counter that runs $D to $0 (inclusive) and helps distribute Sprite RAM offsets among the objects
	Vs_EnemyCount:		.ds 1	; Number of spawned enemies (in the typical game)
	Vs_PlayerHaltTimer:	.ds 2	; $68CD-$68CE Mario/Luigi timer which halts gameplay; decrements to zero
	Vs_ObjHaltTimer:	.ds 12	; $68CF-$68DA Object timer which halts object when greater than zero; decrements to zero

				.ds 1	; $68DB unused

	Vs_ObjectTimer3:	.ds 12	; $68DC-$68E7

				.ds 1	; $68E8 unused

	Vs_PlayerCnt:		.ds 2	; $68E9-$68EA Mario/Luigi "counter" value; decrements to zero
	Vs_EnemyGetUpTimer:	.ds 12	; $68EB-$68F6 Timer for flipped-over enemy; decrements to zero

				.ds 1	; $68F7 unused

	Vs_PlayerJumped:	.ds 2	; $68F8-$68F9 Set to 1 if Player jumped; prevents Player from jumping again until they hit floor
	Vs_PlayerTileL:		.ds 2	; $68FA-$68FB Mario/Luigi Tile detected at Player's feet
	Vs_ObjectTileL:		.ds 12	; $68FC-$6907

				.ds 2	; $6908-$6909 unused

	Vs_PlayerBlkHit:	.ds 2	; $690A-$690B Mario/Luigi Holds Tile_Mem offset to bounce block they hit
	Vs_PlayerFlashInv:	.ds 2	; $690C-$690D Mario/Luigi Flashing invicibility (?)
	Vs_SpawnCnt2:		.ds 1	; FIXME describe better
	Vs_TooLongCnt:		.ds 1	; Increments after each round of spawning; if it overflows, "game ender" fireballs are spawned 
	Vs_CurIndex:		.ds 1	; Current index (Player or object)
	Vs_PlayerTileU:		.ds 2	; $6911-$6912 Mario/Luigi Tile detected above Player's feet

				.ds 13	; $6913-$691F unused

	Vs_ObjectPipeTimer:	.ds 12	; $6920-$692B Timer used for enemies to exit and emerge from pipes; decrements to zero

				.ds 1	; $692C unused

	Vs_Random:		.ds 3	; $692D-$692F Random generator for 2P Vs mode
	Vs_PlayerCoins:		.ds 2	; $6930-$6931 Player's coins (in 2P Vs); 5 wins the match
	Vs_TimeToExit:		.ds 1	; Decrements to zero then exits the 2P Vs
	Vs_ObjectIsLast:	.ds 12	; $6933-$693E Set if this is the last object (turns blue, move fast)

				.ds 1	; $693F unused

	Vs_POWHits:		.ds 1	; Number of times POW block has been hit (disabled on 3)
	Vs_PlayerYOff:		.ds 2	; $6941-$6942 Mario/Luigi Y offset applied
	Vs_UNKGAMECnt:		.ds 1	; Unknown "game" counter; after overflow, we exit
	Vs_PlayerYHi:		.ds 2	; $6944-$6945 Mario/Luigi Y Hi
	Vs_ObjectYHi:		.ds 12	; $6946-$6951 Object Y Hi

				.ds 3	; $6952-$6954 unused
	Vs_ObjectIsAngry:	.ds 12	; $6955-$6960 Set when Sidestepper is angry (not used for anything else)

				.ds 1	; $6961 unused

	Vs_AngrySidesteppers:	.ds 1	; When greater than zero, and spawning a Sidestepper, next one is an "angry" Sidestepper (then decrement)

				.ds 1	; $6963 unused

	Vs_ObjectVDir:		.ds 12	; $6964-$696F Objects vertical direction (4=Down, 8=Up)

				.ds 1	; $6970

	Vs_ObjectRestoreXVel:	.ds 12	; $6971-$697C Flipped over object restore X velocity

				.ds 1	; $697D unused

	Vs_ObjTimer2:		.ds 12	; $697E-$6989 Object timer; decrements to zero

				.ds 1	; $698A unused

	Vs_CardFlash:		.ds 2	; $698B-$698C Mario/Luigi Cycles color for card (when picked up from another Player)
	Vs_HaltTimerBackup:	.ds 15	; $698D-$699B Backs up all halt timers
	Vs_EnemySet:		.ds 1	; Specifies an index of active enemy set, selecting one of the quintuples from Vs_5EnemySets
	Vs_ObjectXOff:		.ds 1	; A one-shot X offset for display of object FIXME: When?
	Vs_PlayerWalkCnt:	.ds 2	; $699E-$699F Mario/Luigi counts up and overflows to toggle walk frames
	Vs_PlayerWalkFrame:	.ds 2	; $69A0-$69A1 Mario/Luigi incremented when Vs_PlayerWalkCnt overflows
	Vs_NextObjectIsLast:	.ds 1	; If there are 5 enemies and this is set, next enemy out is the "last" (turns blue, moves fast)

	; Display of "x Up" after getting 3 cards
	Vs_xUpCnt:		.ds 2	; $69A3-$69A4 Mario/Luigi "x Up" counter
	Vs_xUpY:		.ds 2	; $69A5-$69A6 Mario/Luigi "x Up" Y pos
	Vs_xUpX:		.ds 2	; $69A7-$69A8 Mario/Luigi "x Up" X pos
	Vs_xUpLives:		.ds 2	; $69A9-$69AA Mario/Luigi "x Up" Lives amount (1, 2, 3, 5)
	Vs_SpawnCnt:		.ds 1	; Spawn counter; increments and triggers spawning

	; ASSEMBLER BOUNDARY CHECK, 2P VS END OF $7950
.Bound_7950:	BoundCheck .Bound_7950, $7950, 2P VS RAM


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $6000-$7FFF MMC3 SRAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.org $6000

	; NOTE: $6800+ is used by 2P Vs RAM, see previous section

	; Tile_Mem stores for the greatest case:
	;	Vertical level max size is 	15 rows * 16 columns * 16 screens = 3840 ($0F00) bytes
	;	Non-vertical level max size is 	27 rows * 16 columns * 15 screens = 6480 ($1950) bytes
Tile_Mem:	.ds 6480	; $6000-$794F Space used to store the 16x16 "tiles" that make up the World Map or Level

	Map_MoveRepeat:		.ds 2	; $7950-$7951 (Mario/Luigi) counts up to $18 and then you keep moving without pause
	AScrlURDiag_OffsetX:	.ds 1	; When diagonal autoscroller is wrapping, this holds an X offset for Player/Objects to temporarily correct
	AScrlURDiag_OffsetY:	.ds 1	; When diagonal autoscroller is wrapping, this holds an Y offset for Player/Objects to temporarily correct
	StatusBar_UpdFl:	.ds 1	; Status bar Update Flag; toggles so to update status bar only every other frame
	UpdSel_Disable:		.ds 1	; When set, disables the Update_Select routine during the NMI, which halts most activity due to no reported V-Blanking

	; Item that will be given by treasure box; set by the object OBJ_TREASURESET by its row
	; Level_TreasureItem:
	; 0 = INVALID
	; 1 = Mushroom
	; 2 = Flower
	; 3 = Leaf
	; 4 = Frog
	; 5 = Tanooki
	; 6 = Hammer
	; 7 = Judgem's cloud
	; 8 = P-Wing
	; 9 = Star
	; A = Anchor
	; B = Hammer
	; C = Warp Whistle
	; D = Music Box
	Reset_Latch:		.ds 1	; If this value is anything besides $5A, the reset is run (I assume this is considered a safe value in case of data corruption, e.g. from runaway generator)

	Map_PlyrSprOvrY:	.ds 1	; "Player Sprite Override Y"; If set to $F8 during warp, erases Player's map sprite; otherwise provides a Y to put it at
	; These define values to use when you junction back
	; to the level you were before...
	Level_Jct_HSHi:		.ds 1	; Level junction horizontal scroll high value
	Level_Jct_HS:		.ds 1	; Level junction horizontal scroll value
	Level_Jct_VSHi:		.ds 1	; Level junction vertical scroll high value
	Level_Jct_VS:		.ds 1	; Level junction vertical scroll value

	Old_Paper_Stars:		.ds 1

	Map_Unused7992:			; Value used in some dead code in PRG011; cleared elsewhere (NOT SURE if maybe it sometimes meant Bonus_DiePos?)
	Bonus_DiePos:		.ds 1	; UNUSED Die in the lost bonus games, counts 0-5

	Map_Previous_Dir:	.ds 2	; $7993-$7994 (Mario/Luigi) Backup movement dir (remember which way Player moved last) (8=Up, 4=Down, 2=Left, 1=Right)

	Poison_Mode:		.ds 1	; Unused; cleared but never used otherwise
	Wall_Jump_Enabled:		.ds 1	;#DAHRKDAIZ When 1, wall jumping is enabled
	Wind:					.ds 1	; Wind factor (affects player!)
	WeatherActive:			.ds 1
	Player_FireDash:			.ds 1	; Indicates we are in Burning mode
	Burning_Mode:			.ds 1	;
	Player_Direction:		.ds 1	;
	Player_LastDirection:	.ds	1	;
	Player_LastXVel:		.ds 1
	EventSwitch:			.ds 1	; For e-switch levels
	EventVar:				.ds 1
	EventTicker:			.ds 1

EVENT_FLOOD_FLOOR1			= $01
EVENT_FLOOD_FLOOR2			= $02
EVENT_ENEMY_HANDLES			= $03
EVENT_COLOR_SWITCH			= $04
EVENT_SNOW					= $05
EVENT_FIREBALLS				= $06
EVENT_TILESWITCH			= $07
EVENT_8WAY_BULLETS			= $80
EVENT_LASER_TRAPS			= $81
EVENT_JUMP_LIMITS			= $82
	EventType:				.ds 1	; For e-switch levels
	LeftRightInfection:		.ds 1	;
	Player_Yolked:			.ds 1	;
	Player_Oiled:			.ds 1	;
	Player_Frozen:			.ds 1	;
	Frozen_Frame:			.ds	1
	PaletteEffect:			.ds 1
	PreviousPaletteEFfect:	.ds 1
	EffectCounter:			.ds 1
	HitTestOnly:			.ds 1
	SpinnerBlocksActive:	.ds 8;
	SpinnerBlocksTimers:	.ds 8;
	SpinnerBlocksX:			.ds 8;
	SpinnerBlocksXHi:		.ds 8;
	SpinnerBlocksY:			.ds 8;
	SpinnerBlocksYHi:		.ds 8;
	SpinnerBlocksReplace:	.ds 8
	SpinnerBlocksPoof:		.ds 8

	; Auto scroll effect variables -- everything to do with screens that aren't scrolling in the normal way
	; NOTE: Post-airship cinematic scene with Toad and King ONLY uses $7A01-$7A11 MMC3 SRAM (from Level_AScrlSelect to Level_AScrlHVelCarry)

	Level_AScrlSelect:	.ds 1	; Selects auto scroll routine to use (see PRG009_B922)

	; Values used in horizontal scrolling (Level_AScrlSelect = 0/1) only:
	; $00: World 3-6 / 1-4
	; $01: World 3 Airship
	; $02: World 6-2
	; $03: World 5 Airship
	; $04: World 2 Airship
	; $05: World 4 Airship
	; $06: World 6 Airship
	; $07: World 5-6
	; $0A: World 6-7
	; $0B: World 1 Airship
	; $0C: World 7 Airship
	; $0D: World 8 Airship
	; $0E: World 8 Battleship
	; $0F: World 7-4
	; $10: World 1 Coin Heaven
	; $11: Coin Ship
	; $13: World 8 Tank 1
	; $14: World 8 Tank 2
	Level_AScrlLimitSel:	.ds 1	; "Limit Selector" for the auto scroll (typically selects an end or a start/end pair, depending on style)

	; Level_AScrlVar
	; Variable used for different things depending on the auto scroll style
	; In horizontal scroll style (Level_AScrlSelect = 0), it's the current "movement" (see table AScroll_Movement)
	Level_AScrlVar:		.ds 1

	Level_AScrlLoopSel:	.ds 1	; Currently selected "movement loop" (horizontal only, see AScroll_MovementLoopStart; Just a var in others?)
	Level_AScrlMoveRepeat:	.ds 1	; Repeat current move until zero (decrements each full expiration of Level_AScrlMoveTicks); $FF when on last move, passes control to movement loop
	Level_AScrlLoopCurMove:	.ds 1	; Current "movement loop" index (into AScroll_MovementLoop)
	Level_AScrlSclLastDir:	.ds 1	; Auto scroll "Scroll_LastDir" 
	Level_AScrlMoveTicks:	.ds 1	; Counts down to zero, decrements Level_AScrlMoveRepeat (goes to next "movement")
	Level_AScrlTimer:	.ds 1	; Auto scroll counter, decrements to zero
	Level_AScrlPosHHi:	.ds 1	; Raster effect horizontal "high" position

	Level_AScrlPosH:	.ds 1	; Raster effect horizontal position
	Level_AScrlPosV:	.ds 1	; Raster effect vertical position
	Level_AScrlHVel:	.ds 1	; Auto scroll horizontal "velocity"
	Level_AScrlVVel:	.ds 1	; Auto scroll vertical "velocity"
	Level_AScrlHVelFrac:	.ds 1	; Auto scroll horizontal velocity fractional accumulator 
	Level_AScrlVVelFrac:	.ds 1	; Auto scroll vertical velocity fractional accumulator 
	Level_AScrlHVelCarry:	.ds 1	; '1' when last auto scroll H Velocity fraction accumulation rolled over
	Level_AScrlVVelCarry:	.ds 1	; '1' when last auto scroll V Velocity fraction accumulation rolled over
;;;;;;;;;;;;


; "Cannon Fire" are sort of objects that exist to repeatedly fire off cannon balls
; or other such armaments.  They are created by 

CFIRE_BULLETBILL	= $01	; Bullet Bill cannon
CFIRE_MISSILEBILL	= $02	; Missile Bill (homing Bullet Bill)
CFIRE_ROCKYWRENCH	= $03	; (Re-)Creates Rocky Wrench on timer
CFIRE_4WAY		= $04	; 4-way cannon
CFIRE_GOOMBAPIPE_DOWN	= $05	; Goomba pipe (left output)
CFIRE_GOOMBAPIPE_UP	= $06	; Goomba pipe (right output)
CFIRE_HLCANNON		= $07	; Fires cannonballs horizontally left
CFIRE_HLBIGCANNON	= $08	; Fires BIG cannonballs horizontally left
CFIRE_ULCANNON		= $09	; Fires cannonballs diagonally, upper left
CFIRE_URCANNON		= $0A	; Fires cannonballs diagonally, upper right
CFIRE_LLCANNON		= $0B	; Fires cannonballs diagonally, lower left
CFIRE_LRCANNON		= $0C	; Fires cannonballs diagonally, lower right
CFIRE_HLCANNON2		= $0D	; ?? Same as CFIRE_HLCANNON?
CFIRE_ULCANNON2		= $0E	; ?? Same as CFIRE_ULCANNON?
CFIRE_URCANNON2		= $0F	; ?? Same as CFIRE_URCANNON?
CFIRE_LLCANNON2		= $10	; ?? Same as CFIRE_LLCANNON?
CFIRE_HRCANNON		= $11	; Fires cannonballs horizontally right
CFIRE_HRBIGCANNON	= $12	; Fires BIG cannonballs horizontally right
CFIRE_LBOBOMBS		= $13	; Launches fused Bob-ombs to the left
CFIRE_RBOBOMBS		= $14	; Launches fused Bob-ombs to the right
CFIRE_LASER		= $15	; Laser fire

	ObjectGenerator_ID:		.ds 8	; $7A15-$7A1C ID of the cannon fire
	ObjectGenerator_YHi:		.ds 8	; $7A1D-$7A24 Cannon fire Y Hi
	ObjectGenerator_Y:		.ds 8	; $7A25-$7A2C Cannon fire Y
	ObjectGenerator_XHi:		.ds 8	; $7A2D-$7A34 Cannon fire X Hi
	ObjectGenerator_X:		.ds 8	; $7A35-$7A3C Cannon fire X
	ObjectGenerator_Parent:	.ds 8	; $7A3D-$7A44 Tie back to level object index of "parent" object

	Splash_DisTimer:	.ds 1	; Player water splashes are disabled until decrements to zero; set when Player hits any bounce block

; NOTE!! Objects_DisPatChng for OBJECT SLOT 0 - 5 ONLY!
	Objects_FrozenKicked:	.ds 6	; $7A49-$7A4E If set, this object no longer enforces a pattern bank change

; NOTE!! These object vars are OBJECT SLOT 0 - 5 ONLY!
	ObjSplash_Disabled:	.ds 8	; $7A4F-$7A54 Object water/lava splashes are disabled until decrements to zero

	DAIZ_TEMP1:		.ds 1	; #DAHRKDAIZ $7A70 USED for temprorary in variables

	Special_Suit_Flag:		.ds 1	; Special suit flag is used to indicate when we have a non-standard suit
									; Ice, Fire Fox, Boo and Ninja Mario all piggy back off existing code
									; and uses this flag to indicate different ways to execute (ice balls vs fire balls for example).
									; Here's a quick table of abilities:
									; Player_Suit		With Flag
									; Fire				Ice
									; Raccoon			Fire Fox
									; Frog				Frog
									; Koopa/Tanooki		Boo
									; Hammer/Sledge		Ninja
MARIO_BIG		= 01
MARIO_FIRE		= 02
MARIO_RACCOON	= 03
MARIO_FROG		= 04
MARIO_KOOPA		= 05
MARIO_HAMMER	= 06
MARIO_ICE		= 07
MARIO_FOX		= 08
MARIO_NINJA		= 11

	Player_EffectiveSuit:			ds 1
	DAIZ_TEMP2:			.ds 1	; #DAHRKDAIZ $7A74 USED for temprorary in variables
	DAIZ_TEMP3:			.ds 1   ; #DAHRKDAIZ $7A75 USED for temprorary in variables
	MushroomBlocks_Enabled: .ds	1	; Indicates the enemies are invincible
	ProjectileToSpinners: ds 1	;
	End_Level_Timer:	.ds 1	; Once this goes to 0, the level ends
	Force_Coin_Update:	.ds 1	; Indicates the coins need to be update, overriding the Coins_earned marker
	Old_World_Map_Tile:	.ds	1	;
	UNUSED_1:  .ds 4	;

	Music_Start:		.ds 1	; Music start index (beginning of this song)
	Music_End:		.ds 1	; Music end index (inclusive last index to play before loop)
	Music_Loop:		.ds 1	; Music loop index (index to start from when song reaches end)

	Sound_Octave:		.ds 1	; Used for calculating octave

	UNUSED_2:			.ds 12	; $7AE4-$7AEF unused

	Music_Sq1Bend:		.ds 1	; Alters PAPU_FT1 for bend effects

				.ds 3	; $7AF1-$7AF3 unused

	Music_Sq2Bend:		.ds 1	; Alters PAPU_FT2 for bend effects

				.ds 2	; $7AF5-$7AF6 unused

	Music_RestH_Off:	.ds 1	; Offset added to Music_RestH_Base; typically $00 or $10 (for low time warning on compatible songs)

				.ds 7	; $7AF8-$7AFE unused

	PAPU_MODCTL_Copy:	.ds 1	; Current PAPU_MODCTL register

	Level_ObjIdxStartByScreen: .ds 16	; $7B00-$7B0F Defines the starting index into Level_Objects for each "screen"

	Level_ObjectsSpawned:	.ds 48	; $7B10-$7B3F When $80 set, object is already spawned, $00 means not

; Level_ObjPtr_AddrL is an array that defines the level objects to appear
; The first byte copied in has no apparent purpose
; The rest is a repeating series of 3 bytes -- ID, Column, Row (C/R of tile grid, multiply by 16 for pixel location), $FF for terminator
	Level_Objects:		.ds 48*3	; $7B40-$7BCF
	

; For certain objects that require a buffer of X or Y values; only a couple are available.
; Each contains 32 bytes, intended for enemies that have "tails"; Buffer_Occupied determines
; which of the two buffers is free, if any at all.  The object will hold onto it then.
; Because of this, objects which employ it must also be hardcoded to release it; see
; "Object_Delete" for the hardcoded list of objects which must release this resource...
	Object_BufferX:		.ds 32	; $7C20-$7C3F / $7C40-$7C5F
	Object_BufferY:		.ds 32	; $7C60-$7C7F / $7C80-$7C9F
; Variables used by Chain Chomps ONLY -- manages the chain links 

	ChainChomp_ChainX1:	.ds 5	; $7CA0-$7CA4 Chain Link 1 X
	ChainChomp_ChainX2:	.ds 5	; $7CA5-$7CA9 Chain Link 2 X
	ChainChomp_ChainX3:	.ds 5	; $7CAA-$7CAE Chain Link 3 X
	ChainChomp_ChainX4:	.ds 5	; $7CAF-$7CB4 Chain Link 4 X
							
	ChainChomp_ChainY1:	.ds 5	; $7CB4-$7CB8 Chain Link 1 Y
	ChainChomp_ChainY2:	.ds 5	; $7CB9-$7CBD Chain Link 2 Y
	ChainChomp_ChainY3:	.ds 5	; $7CBE-$7CC2 Chain Link 3 Y
	ChainChomp_ChainY4:	.ds 5	; $7CC3-$7CC8 Chain Link 4 Y

; NOTE!! These object vars are OBJECT SLOT 0 - 4 ONLY!
	
	Objects_Data8:		.ds 8	; $7CC8-$7CCC Generic object variable 10
	Objects_Data9:		.ds 5	; $7CCD-$7CD1 Generic object variable 11
	Objects_Data10:		.ds 5	; $7CD2-$7CD6 Generic object variable 12
	Objects_Data11:		.ds 5	; $7CD7-$7CDB Generic object variable 13
	Objects_Data12:		.ds 5	; $7CDC-$7CE0 Generic object variable 14
	Objects_Data13:		.ds 5	; $7CDC-$7CE0 Generic object variable 14
	Objects_BeingHeld:		.ds 8	; $7CDC-$7CE0 Generic object variable 14
	Objects_Ticker: 	.ds 5
	
	Objects_DynamicallySpawned:	.ds 8
	Objects_Kicked:		.ds 5
	Objects_Shelled:	.ds 5
	Objects_DetectedObject: .ds 8
	Objects_ToggleDetect: .ds 8

ATTR_FIREPROOF		= %00000001
ATTR_ICEPROOF		= %00000010
ATTR_HAMMERPROOF	= %00000100
ATTR_NINJAPROOF		= %00001000 
ATTR_TAILPROOF		= %00010000
ATTR_DASHPROOF		= %00100000
ATTR_STOMPPROOF		= %01000000
ATTR_INVINCIBLE		= %10000000
ATTR_PROJECTILEPROOF = (ATTR_FIREPROOF | ATTR_ICEPROOF | ATTR_NINJAPROOF | ATTR_HAMMERPROOF)
ATTR_ATTACKPROOF = (ATTR_PROJECTILEPROOF | ATTR_TAILPROOF | ATTR_DASHPROOF | ATTR_STOMPPROOF)
ATTR_ALLWEAPONPROOF	= %11111111

	Objects_WeaponAttr: .ds 8
ATTR_BUMPNOKILL			= %00000001
ATTR_CARRYANDBUMP		= %00000010
ATTR_NOICE				= %00000100 ; *
ATTR_STOMPKICKSOUND		= %00001000 ; *
ATTR_WINDAFFECTS		= %00010000
ATTR_HASSHELL			= %00100000 ; *
ATTR_SHELLPROOF			= %01000000
ATTR_EXPLOSIONPROOF		= %10000000

	Objects_BehaviorAttr: .ds 8
	Objects_BoundBox:	.ds 8
	Objects_XYCS:		.ds 8
	Objects_XYCSPrev:	.ds 8
	Objects_PlayerProjHit:	.ds 8
	Objects_EffectiveXVel: .ds 8
	Objects_SpritesRequested: .ds 8
	Objects_Regen: .ds 8

HIT_FIREBALL	= $01
HIT_ICEBALL		= $02
HIT_HAMMER		= $04
HIT_NINJASTAR	= $08
HIT_TAIL		= $10
HIT_STOMPED		= $20
HIT_SHELL		= $40
HIT_EXPLOSION	= $80

	Last_EventGen:		.ds 1
	Level_EventTimer:	.ds 1	;
	Level_EventData:	.ds 1

	Vert_Scroll_Off:	.ds 1	; Vertical scroll offset, used for "vibration" effects
	Level_Vibration:	.ds 1	; While greater than zero, screen vibrates (from impact of heavy fellow)
	Player_VibeDisable:	.ds 1	; While greater than zero, Player is unable to move (from impact of heavy fellow)

	Proj_Attack:		.ds 1
	Sprite_FreeRAM:		.ds 1
	Scroll_Updated:		.ds 1

; NOTE!! This object var is OBJECT SLOT 0 - 4 ONLY!
	Objects_Health:	.ds 5	; $7CF6-$7CFA Somewhat uncommon "HP" used generally for bosses only (e.g. they take so many fireballs)

; Stores "rows" of completed levels or other map alterations (e.g. rock break,
; mini-fortress lock removal, etc.) for a given column, from the leftmost.
; Rows 1-7 use decending bits from $80, and row 9 uses bit $01.  This makes row 8
; invalid for hosting a level panel ever!
; --------- TOP OF MAP
; $80
; $40
; $20
; $10
; $08
; $04
; $02
; INVALID
; $01
; --------- BOT OF MAP
	; Inventory_Items: 
	; 0 = Empty
	; 1 = Mushroom
	; 2 = Flower
	; 3 = Leaf
	; 4 = Frog
	; 5 = Tanooki
	; 6 = Hammer
	; 7 = Judgem's cloud
	; 8 = P-Wing
	; 9 = Star
	; A = Anchor
	; B = Hammer
	; C = Warp Whistle
	; D = Music Box
	
	Inventory_Items:	.ds 0	; $7D80-$7D9B Mario, 4 rows of 7 items 
	Inventory_Cards:	.ds 0	; #DAHRKDAIZ indicates the player is at the top of water
	Inventory_Score:	.ds 0	; $7D9F-$7DA1 Mario, 3 byte score
	Air_Time_Frac:		.ds 1
	Air_Time:			.ds 1	;
	Old_Air_Time:		.ds 1
	Enemy_Health:		.ds 1
	Old_Enemy_Health:	.ds 1
	Enemy_Health_Mode:	.ds 1

AIR_INCREASE	= 3
	Air_Change:			.ds 1	
	Power_Change:		.ds 1
	Power_Tick:			.ds 1
	Top_Of_Water:		.ds 1	;

	; #DAHRKDAIZ these are unused, but the labels ramin to one byte to allow the assembler to corrrectly calculate some offsets in the game
	Inventory_Items2:	.ds 0	; $7DA3-$7DBE Luigi, 4 rows of 7 items 
	Inventory_Cards2:	.ds 0	; $7DBF-$7DC1 Luigi, 3 cards
	Inventory_Score2:	.ds 0	; $7DC2-$7DC4 Luigi, 3 byte score
	Player_Coins2:	.ds 0	; Luigi's coins

	Map_GameOver_CursorY:	.ds 0	; Game Over popup cursor Y ($60/$68)

	Pal_Data:		.ds 32	; $7DDE-$7DFD Holds an entire bg/sprite palette (this is the MASTER palette, what fades target, and others may source for "original" colors!)

	Level_AltLayout:	.ds 0	; $7DFE-$7DFF Pointer to level's "alternate" layout (when you go into bonus pipe, etc.)
	Level_AltObjects:	.ds 0	; $7E00-$7E01 Pointer to level's "alternate" object set (when you go into bonus pipe, etc.)

	Status_Bar_Top:		.ds 28		; Tiles to display at the top of the status bar
	Status_Bar_Bottom:	.ds 28		; Tiles to display at the bottom of the status bar
	Status_Bar_Render_Toggle: .ds 4	; Indicates if we're toggling the status mode
	Player_Pal_Backup:  .ds 3	; $AC #DAHRKDAIZ player palette backup for the "rainbow palette" effect
	Update_Level_Name: .ds 1;
	StatusBar_FirstInit: .ds 1
	Force_StatusBar_Init: .ds 1
	Top_Needs_Redraw:	.ds 1; Indicates what the last status bar mode was before the toggle
	Bottom_Needs_Redraw:	.ds 1; Indicates what the last status bar mode was before the toggle
	Game_Timer_Tick:		.ds 1; Indicates the game timer needs to increase by 1 second

Max_Item_Count = 8
CARD_MUSHROOM	= 0
CARD_FLOWER	= 1
CARD_STAR	= 2
CARD_1UP	= 3
CARD_10COIN	= 4
CARD_20COIN	= 5
CARD_WILD	= 8	; UNUSED Wild card (can match any other!)

	Level_HorzScrollLock:	.ds 1	; Set to '1' while in a Big Question block area, locks horizontal scrolling

	Map_BorderAttrFromTiles:.ds 44	; $7EBE-$7EC8 (?) Attributes collected from map tiles that get overwritten by border FIXME SIZE UNCERTAIN

	Map_Objects_Y:		.ds 14	; $7EEB-$7EF8, Y coordinate of all map objects
	Map_Objects_XLo:	.ds 14	; $7EF9-$7F06, X coordinate lo byte of all map objects
	Map_Objects_XHi:	.ds 14	; $7F07-$7F14, X coordinate hi byte of all map objects

; Map_Objects_IDs: ID of all 8 map objects 
; none of these apply anymore
MAPOBJ_EMPTY		= $00	; None
MAPOBJ_HELP		= $FF	; HELP
MAPOBJ_AIRSHIP		= $FF	; Airship
MAPOBJ_HAMMERBRO	= $FF	; Hammer Bro
MAPOBJ_BOOMERANGBRO	= $FF	; Boomerang Bro
MAPOBJ_HEAVYBRO		= $FF	; Heavy Bro
MAPOBJ_FIREBRO		= $FF	; Fire Bro
MAPOBJ_W7PLANT		= $FF	; World 7 Plant
MAPOBJ_UNK08		= $FF	; Unknown marching glitch object
MAPOBJ_NSPADE		= $FF 	; N-Spade
MAPOBJ_WHITETOADHOUSE	= $FF	; White Toad House
MAPOBJ_COINSHIP		= $FF	; Coin Ship
MAPOBJ_UNK0C		= $FF	; Unknown white colorization of $0F (goes to World 7 level??)
MAPOBJ_BATTLESHIP	= $FF	; World 8 Battleship
MAPOBJ_TANK		= $0E	; World 8 Tank
MAPOBJ_W8AIRSHIP	= $FF	; World 8 Airship
MAPOBJ_CANOE		= $FF	; Canoe

MAPOBJ_TOTALINIT	= $08	; Total number of map objects initialized per world
MAPOBJ_TOTAL		= $0E	; Total POSSIBLE map objects

	Map_Objects_IDs:	.ds 14	; $7F15-$7F22

	Map_SprRAMOffDistr:	.ds 1	; A free running counter on the map only which distributes Sprite_RAM offsets to ensure visibility

	; Store arrays defined by level data as starts after an "alternate" level junction event
	; Level_JctXLHStart:
	;	Lower 4 bits: X Hi
	;	Upper 4 bits: X Lo
	; Level_JctYLHStart:
	;	Bits 0 - 3: Go into Level_PipeExitDir
	;	Bits 4 - 6: 0 to 7, selects start position from LevelJct_YLHStarts and sets proper vertical with LevelJct_VertStarts
	;	Bit      7: If set, entering in vertical mode (for "dirty" refresh purposes)

	Tile_DetectionYHi:		.ds 1	; Object tile detect Y Hi
	Tile_DetectionY:		.ds 1	; Object tile detect Y Lo
	Tile_DetectionXHi:		.ds 1	; Object tile detect X Hi
	Tile_DetectionX:		.ds 1	; Object tile detect X Lo

	Tile_CenterDetectionYHi:		.ds 1	; Object tile detect Y Hi
	Tile_CenterDetectionY:		.ds 1	; Object tile detect Y Lo
	Tile_CenterDetectionXHi:		.ds 1	; Object tile detect X Hi
	Tile_CenterDetectionX:		.ds 1	; Object tile detect X Lo

	Splash_IsOil:			.ds 1
	;Bubble_Cnt:		.ds 3	; $7F7A-$7F7C Bubble counter value (0 = no bubble)

; NOTE: Object_WatrHit* values are set only once, then WatrHit_IsSetFlag latches
; and they will never update again; seems it is leftover debug code or maybe
; an unused feature (that an object could respond to a splashdown)

	Brick_Index:		.ds 1
	BrickBust_En:		.ds 3	; $7F9A-$7F9C Brick bust "Enable" (0 = disable, 2 = brick debris, anything else = "poof" away)
	Brick_DebrisYHi:	.ds 3	; $7F9D-$7F9F Brick bust upper chunks Y
	Brick_DebrisX:		.ds 3	; $7FA0-$7FA2 Brick bust base X
	BrickBust_YVel:		.ds 3	; $7FA3-$7FA5 Brick bust Y velocity
	Brick_DebrisXDist:	.ds 3	; $7FA6-$7FA8 Brick bust X split
	Brick_DebrisY:		.ds 3	; $7FA9-$7FAB Brick bust lower chunks Y
	BrickBust_HEn:		.ds 3	; $7FAC-$7FAE Bits to hide chunks (Bit 0 = Right, 1 = Left, 2 = Lower, 3 = Upper) OR poof counter
	BrickBust_Tile:		.ds 3
	BrickBust_Pal:		.ds 3

CHAIN_DEBRIS = $55
STAR_DEBRIS	= $17
BRICK_DEBRIS = $4B
ICE_DEBRIS = $59
OIL_DEBRIS = $61
BARREL_DEBRIS = $9D

	TileAnimSet:		.ds 1

	CoinPUp_State:		.ds 4	; $7FB2-$7FB5 State of up to 4 "Power Up" coins (i.e. coins that come out of ? blocks and bricks)
	CoinPUp_Y:		.ds 4	; $7FB6-$7FB9 Y of "Power Up" coins
	CoinPUp_X:		.ds 4	; $7FBA-$7FBD X of "Power Up" coins
	CoinPUp_YVel:		.ds 4	; $7FBE-$7FC1 Y velocity of "Power Up" coins
	CoinPUp_Counter:	.ds 4	; $7FC2-$7FC5 Counter used by "Power Up" coins

	; Special Object IDs:
SOBJ_HAMMER		= $01	; Hammer Bro hammer
SOBJ_VEGGIE	=	$02
SOBJ_BOOMERANG		= $02	; Boomerangs
SOBJ_OIL		= $03	;
SOBJ_FIREBALL	= $04 	;
SOBJ_POOF		= $05
SOBJ_ICEBALL	= $06	; Piranha fireball
SOBJ_MICROGOOMBA	= $00 	; Micro goombas
SOBJ_NINJASTAR		= $07 	; Spike's or Patooie's spike ball
SOBJ_EGG		= $08 	; Koopaling wand blast
SOBJ_OILOOZE		= $09 	; Lost Kuribo shoe that "flies off" (NOTE: In Japanese original, this also featured super suits)
SOBJ_BIGFIREBALL		= $0A 	; Rocky's Wrench
SOBJ_WRENCH		= $0A 	; Rocky's Wrench
SOBJ_CANNONBALL		= $0B 	; Cannonball
SOBJ_LIGHTNINGBOLT  = $0C
SOBJ_EXPLOSIONSTAR	= $0D 	; Explosion star
SOBJ_FLAME			= $0E
SOBJ_SKULL	= $0F	; Lava Lotus fire
SOBJ_FROST			= $10
SOBJ_POPPEDOUTCOIN	= $11 	; Popped out coin
SOBJ_BARREL			= $12   ;
SOBJ_BRICKDEBRIS	= $13 	; Brick debris (used for busting e.g. Piledriver Microgroomba, OR giant world brick busting)
SOBJ_FIREBLOB		= $14 	; Blooper kid
SOBJ_SPINYEGG		= $15
SOBJ_COINSPARKLE    = $17
SOBJ_PLUNGER		= $18
SOBJ_PLACEHOLDER = $FF
	SpecialObj_ID:		.ds 8	; $7FC6-$7FCD Special object spawn event IDs

; Player's hammer/fireball
PLAYER_FIREBALL		= 01
PLAYER_ICEBALL		= 02
PLAYER_HAMMER		= 03
PLAYER_NINJASTAR	= 04
PLAYER_POOF			= 05
PLAYER_BULLET		= 06

	PlayerProj_ID:		.ds 2	; $7CE1-$7CE2 Player projectile ID (0 = not in use, 1 = fireball, 2 = iceball, 3 = hammer, 4 = ninja star 3+ = Fireball impact "Poof")

	SpecialObj_XHi:		.ds 8	; $7FD5-$7FDC Special object Y high coordinate
	PlayerProj_XHi:			.ds 2

	SpecialObj_YHi:		.ds 8	; $7FD5-$7FDC Special object Y high coordinate
	PlayerProj_YHi:			.ds 2

	Objects_SpriteAttributes:	.ds 8	; $7FE7-$7FEE Object sprite attributes (only uses bit 6 for H-Flip and bits 0-1 for palette)

	Objects_Data1:		.ds 8	; $7F-$83 Generic variable 4 for objects SLOT 0 - 4 ONLY
	Objects_Data2:		.ds 8	; $7F-$83 Generic variable 4 for objects SLOT 0 - 4 ONLY
	Objects_Data3:		.ds 8	; $7FD0-$7FD4 Generic variable 3 for objects SLOT 0 - 4 ONLY

	;#FREERAM
	
	Background_Animations:		.ds 16
	Stop_Watch:			.ds 1	;

	Old_DayNightTicker:	.ds 1
	NightTransition:	.ds 1	; when not 0, we're transitioning into night
	DayTransition:		.ds 1	; when not 0, we're transitioning into day
	MasterPal_Data:		.ds 32	; keeps track of the unmodified, original palette
	LevelLoadPointer:	.ds 1	;
	LevelNumber:		.ds 1	;
	PreviousLevelNumber: .ds 1;
	PaletteIndex:		.ds 1	;
	Pointers:			.ds 60	;
	WorldWidth:			.ds 1
	TempX:				.ds 1
	TempY:				.ds 1
	TempA:				.ds 1;
	Objects_Global:		.ds 8
	AlignSpriteFlag:	.ds 1
	JustName:			.ds 1
	LastHorzScroll:		.ds 1
	LastHorzScrollHi:	.ds 1
	Ignore_VBlank:		.ds 1
	StatusBar_Palette:	.ds 3 


ITEM_NONE = $00
ITEM_MUSHROOM = $01
ITEM_FIREFLOWER = $02
ITEM_SUPERLEAF = $03
ITEM_FROGSUIT = $04
ITEM_SHELL = $05
ITEM_HAMMERSUIT = $06
ITEM_ICEFLOWER = $07
ITEM_FOXLEAF = $08
ITEM_NINJASHROOM = $09
ITEM_STARMAN = $0A
ITEM_MEGASTARMAN = $0A
ITEM_STOPWATCH = $0B
ITEM_WINGS = $0C
ITEM_1_HP = $0D
ITEM_2_HP = $0E
ITEM_3_HP = $0F
ITEM_MEGASTAR = $10

BADGE_INVALID = 255

BADGE_XP = 1
BADGE_PMETER = 2
BADGE_COIN = 3
BADGE_AIR = 4
BADGE_ITEMRESERVE = 5
BADGE_RADAR 		= 9
BADGE_RADARSW		= 10
BADGE_RADARS		= 11
BADGE_RADARSE		= 12
BADGE_RADARE		= 13
BADGE_RADARNE		= 14
BADGE_RADARN		= 15
BADGE_RADARNW		= 16
BADGE_RADARW		= 17
BADGE_RADARUNKNOWN 	= 18


ABILITY_EXTRAHIT = 1
ABILITY_STARTBIG = 2
ABILITY_RECOVERY = 3
ABILITY_NOSHROOMS = 4
ABILITY_DOUBLEJUMP = 5
ABILITY_MAX = ABILITY_DOUBLEJUMP

	; #SAVE RAM
	Player_Stats_Boundary_Start: .ds 1	
	World_Num:			.ds 1	
	World_Map_Power:	.ds 1	
	Map_Entered_Y:		.ds 1	
	Map_Entered_XHi:	.ds 1	
	Map_Entered_X:		.ds 1
	Map_Previous_Y:		.ds 1	; $797E-$797F (Mario/Luigi) Stores the previous Y you were "safe" at; this is the Y you go back to if you die
	Map_Previous_XHi:	.ds 1	; $7980-$7981 (Mario/Luigi) Same as Map_Previous_Y, only for XHi
	Map_Previous_X:		.ds 1	; $7982-$7983 (Mario/Luigi) Same as Map_Previous_Y, only for X
	Map_Prev_XOff2:		.ds 1	; $7986-$7987 (Mario/Luigi) Holds a copy of Map_Prev_XOff, but I'm not sure why?
	Map_Prev_XHi2:		.ds 1	; $7988-$7989 (Mario/Luigi) Holds a copy of Map_Prev_XHi, but I'm not sure why?
	Map_Prev_XOff:		.ds 2	; $0722-$0723 (Mario/Luigi) Stores previous scroll X offset on map
	Map_Prev_XHi:		.ds 2	; $0724-$0725 (Mario/Luigi) Stores previous "hi byte" of map X
	CheckPoint_Flag:	.ds 1
	CheckPoint_Level:	.ds 1
	CheckPoint_X:		.ds 1
	CheckPoint_XHi:		.ds 1
	CheckPoint_Y:		.ds 1
	CheckPoint_YHi:		.ds 1
	Levels_Complete:    .ds 16	;
	Paper_Stars:			.ds 1	; 
	Paper_Stars_Collected1: .ds 16 ;
	Paper_Stars_Collected2:	.ds 16
	Paper_Stars_Collected3:	.ds 16

	PowerUp_Reserve:	.ds 1	;
	Old_PowerUp_Reserve: .ds 1

	DayNight:			.ds 1	; signifies if it's day or night
	DayNightMicroTicker: .ds 1	; with DayNightTicker, this keeps track of time left of current period (6 minutes total) 
	DayNightTicker:		.ds 1	;
	Player_Coins:		.ds 3	; Mario's coins
	Player_Cherries:	.ds 1;
	Player_Badge:		.ds 1	;
	Player_Level:		.ds 1	;
	Player_Experience:	.ds 3		; Experience points that increase by defeating enemies
	SecondQuest:		.ds 1
	Map_PrevMoveDir:	.ds 1
	CurrentDay:			.ds 1

NORMAL_QUEST = $FF
SECOND_QUEST = $FE

	Player_Stats_Boundary_End: .ds 1

	Save_Ram_Boundary_Start: 	.ds 1
	Save_Ram:			.ds (Player_Stats_Boundary_End - Player_Stats_Boundary_Start)
	Save_Ram_CheckSum:	.ds 2
	Save_Ram_Boundary_End: 		.ds 1

	World_Start: 		.ds 1
	Auto_Save:			.ds 1
	; Tile map property flags
MAP_PROP_BOUNDARY		= $00
MAP_PROP_TRAVERSABLE	= $01
MAP_PROP_ENTERABLE		= $02
MAP_PROP_COMPLETABLE	= $03
MAP_PROP_BOSS	= $04
	; Tile Property Flags
	; TSWF XXXX
	; T - Top Solid
	; S - Solid all the way around
	; W - Water
	; F - Foreground 
	; XXX - represents "special" types, affects mostly the player
	; some combination that produce a certain effect

TILE_PROP_FOREGROUND	= $10 ;
TILE_PROP_WATER			= $20 ;
TILE_PROP_SOLID_TOP		= $40 ;
TILE_PROP_SOLID_BOTTOM	= $80 ;
TILE_PROP_SOLID_ALL		= $C0 ;
TILE_PROP_ITEM			= $F0 ;

; non-solid properties
TILE_PROP_HARMFUL		= $01 ; 
TILE_PROP_DEPLETE_AIR	= $02 ; 
TILE_PROP_MOVE_LEFT		= $03 ; 
TILE_PROP_MOVE_RIGHT	= $04 ; 
TILE_PROP_MOVE_UP		= $05 ; 
TILE_PROP_MOVE_DOWN		= $06 ;
TILE_PROP_TREASURE		= $07 ; 
TILE_PROP_LOCK			= $08 ; 
TILE_PROP_OBJECTINTERACT= $09; 
TILE_PROP_TRAP			= $0A ;
TILE_PROP_CLIMBABLE		= $0B ;
TILE_PROP_COIN			= $0C ;
TILE_PROP_DOOR			= $0D ;
TILE_PROP_CHERRY		= $0E ;
TILE_PROP_BARRIER		= $0F ;

TILE_PROP_LAVA			= TILE_PROP_WATER | TILE_PROP_FOREGROUND | TILE_PROP_HARMFUL

; solid properties
;TILE_PROP_HARMFUL		= $01 ; 
TILE_PROP_SLICK			= $02 ; 
;TILE_PROP_MOVE_LEFT	= $03 ; 
;TILE_PROP_MOVE_RIGHT	= $04 ; 
;TILE_PROP_MOVE_UP		= $05 ; 
;TILE_PROP_MOVE_DOWN	= $06 ;
TILE_PROP_THIN_ICE		= $07 ; 
TILE_PROP_VPIPE_LEFT	= $08 ;
TILE_PROP_VPIPE_RIGHT	= $09 ;
TILE_PROP_HPIPE_BOTTOM	= $0A ;
TILE_PROP_LOCKBLOCK		= $0B ;
TILE_PROP_SOLID_OBJECTINTERACT	= $0C ;
TILE_PROP_STONE			= $0D ;
TILE_PROP_PSWITCH		= $0E ;
TILE_PROP_ESWITCH		= $0F ;


TILE_ITEM_COIN		= $F0 ;
TILE_ITEM_FIREFLOWER = $F1 ;
TILE_SEPCIAL_SUPERLEAF	= $F2 ;
TILE_SEPCIAL_ICEFLOWER	= $F3 ;
TILE_SEPCIAL_FROG		= $F4 ;
TILE_ITEM_FIREFOX	= $F5 ;
TILE_ITEM_KOOPA		= $F6 ;
TILE_ITEM_BOO		= $F7 ;
TILE_ITEM_SLEDGE		= $F8 ;
TILE_ITEM_NINJA		= $F9 ;
TILE_ITEM_STAR		= $FA ;
TILE_ITEM_VINE		= $FB ;
TILE_ITEM_PSWITCH	= $FC ;
TILE_ITEM_BRICK		= $FD ;
TILE_ITEM_SPINNER	= $FE 
	TileProperties:		 .ds 256;
	CurrentTileProperty: .ds 1;
	CurrentTile:		 .ds 1;
	FireBallTransitions: .ds 8;
	IceBallTransitions:  .ds 8;
	PSwitchTransitions: .ds 16;
	Force_LeveNameUpdate: .ds 1
	TileCheckX:			.ds 1
	TileCheckXHi:		.ds 1
	PreviousLevel:		.ds 1
	ForcedSwitch:       .ds 1
	Object_Count:	.ds 1
	Poison_TapTimer:	.ds 1
	Player_KeepBadge:	.ds 1
	LevelLoad_Thread:	.ds 1

	.org $7FFF
	Debug_Snap:			.ds	1;	should always be $7FFF, used as a constant address to easily create debug breakpoints
	; ASSEMBLER BOUNDARY CHECK, END OF $8000
.Bound_8000:	BoundCheck .Bound_8000, $8000, MMC3 SRAM

	.org $0700
	Save_Ram_Backup: .ds 1

	; ASSEMBLER BOUNDARY CHECK, END OF $7A12
.Bound_7A12:	BoundCheck .Bound_7A12, $7A12, Wand Return Cinematic Vars

	.code

; The objects are broken up into groups of 36 IDs across 5 ROM banks (1 - 5)
; These lookup table addresses are common, even though their banks are not,
; and so I define these constants for lack of a better solution:
ObjectGroup_InitJumpTable	= $A000
ObjectGroup_NormalJumpTable	= $A028
ObjectGroup_CollideJumpTable	= $A050
ObjectGroup_Attributes		= $A078
ObjectGroup_PatTableSel		= $A08C
ObjectGroup_KillAction		= $A0A0
ObjectGroup_PatternStarts	= $A0B4
ObjectGroup_PatternSets		= $A0C8

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; GAME CONSTANTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
OCSPECIAL_KILLCHANGETO	= $0800		; When enemy is killed, it changes to the object ID in the lower 8 bits (requires OA3_SHELL)

; Object Attributes Set 1 Flags

OA1_PAL0		= %00000000	; Object uses sprite palette 0
OA1_PAL1		= %00000001	; Object uses sprite palette 1
OA1_PAL2		= %00000010	; Object uses sprite palette 2
OA1_PAL3		= %00000011	; Object uses sprite palette 3
OA1_PALMASK		= %00000011	; Not intended for use in attribute table, readability/traceability only

; NOTE: The width and heights here are for sprite visibility testing
; For the object's bounding box, see OAT_BOUNDBOXxx

OA1_HEIGHT16		= %00000000	; Object is 16 pixels tall
OA1_HEIGHT32		= %00000100	; Object is 32 pixels tall
OA1_HEIGHT48		= %00001000	; Object is 48 pixels tall
OA1_HEIGHT64		= %00001100	; Object is 64 pixels tall
OA1_HEIGHTMASK		= %00001100	; Not intended for use in attribute table, readability/traceability only
	
OA1_WIDTH8		= %00010000	; Object is 8 pixels wide
OA1_WIDTH16		= %00100000	; Object is 16 pixels wide
OA1_WIDTH24		= %00110000	; Object is 24 pixels wide
OA1_WIDTH32		= %01000000	; Object is 32 pixels wide
OA1_WIDTH40		= %01010000	; Object is 40 pixels wide
OA1_WIDTH48		= %01100000	; Object is 48 pixels wide
OA1_WIDTH64		= %01110000	; Object is 64 pixels wide
OA1_WIDTHMASK		= %01110000	; Not intended for use in attribute table, readability/traceability only



; Object Attributes Set 2 Flags

	= %00000001	; Enemy does not go into shell (state 3) or squash (state 7) states when stomped on
	= %00000010	; "Grounded Player Mod"; Subtly modifies Player detection response; see comments in PRG000_D205
	= %00000100	; Object "doesn't care" about being stomped (indifferent, not same as OA3_NOTSTOMPABLE)
OA2_STOMP_KICKSND	= %00001000	; When applying X velocity, calculate "X Hi" position (applies to vertical levels only; if not set, Object_XHi will be fixed at zero)

; Object Attributes Set 3 Flags

; This selects what action should occur with the object when gameplay is halted (e.g. Player died)
;
; TIP: The most commonly used one is OA3_HALT_NORMALONLY, which means to continue executing the
;      object's "Normal" state if the object is in state 2, otherwise not do anything at all.
;      This does not mean that the other states will be ignored (i.e. object in shell state will
;      continue to use the built-in shell type drawing code) but no handling is performed.
;
;      Typically then the "Normal" state will have some kind of code to deal with halted gameplay,
;      e.g. calling its own draw routine.  The fact that there are enemy specific "special" halts
;      is ugly and hackish, and I fully recommend using OA3_HALT_NORMALONLY and handle gameplay
;      halts in the "Normal" state standard subroutine instead as much as possible.
OA3_HALT_HOTFOOTSPECIAL	= %00000000	; 0: Bank2/Hotfoot ONLY
OA3_HALT_JUSTDRAW	= %00000001	; 1: Standard draw
OA3_HALT_JUSTDRAWTALL	= %00000010	; 2: Draw tall 16x32 sprite
OA3_HALT_SPIKESPECIAL	= %00000011	; 3: Bank2/Spike ONLY
OA3_HALT_DONOTHING	= %00000100	; 4: Do nothing
OA3_HALT_NORMALONLY	= %00000101	; 5: If object is in "normal" state, do its normal routine, otherwise do nothing (COMMON)
OA3_HALT_JUSTDRAWWIDE	= %00000110	; 6: Draw wide 48x16 sprite
OA3_HALT_DONOTHING2	= %00000111	; 7: Do nothing
OA3_HALT_KURIBOSPECIAL	= %00001000	; 8: Bank2/Kuribo's Shoe ONLY
OA3_HALT_DONOTHING3	= %00001001	; 9: Do nothing
OA3_HALT_JUSTDRAWMIRROR	= %00001010	; 10: Draw mirrored 16x16 sprite
OA3_HALT_ENDCARDSPECIAL	= %00001011	; 11: Bank2/End Level Card ONLY
OA3_HALT_DONOTHING4	= %00001100	; 12: Do nothing
OA3_HALT_BUSTERSPECIAL	= %00001101	; 13: Bank2/Buster Beatle ONLY
OA3_HALT_PIRANHASPECIAL	= %00001110	; 14: Bank2/Piranha Spike Ball ONLY
OA3_HALT_MASK		= %00001111	; Not intended for use in attribute table, readability/traceability only

OA3_WINDAFFECTS		= %00010000	; Enemy should "squash" (state 7) not "shell" (state 3), or "killed" (state 6) in case of statue/Kuribo's shoe stomp; requires OA2_NOTSHELLED to be NOT SET
OA3_NOTSTOMPABLE	= %00100000	; If the Player tries to stomp this enemy, he will be HURT!  (E.g. Spikey enemy)
OA3_SHELL		= %01000000	; The CollideJumpTable entry MAY contain the "special" entry; see CollideJumpTable; also "dies" into "shell" (state 3) (i.e. object "bumps" into shell when hit from beneath)
OA3_TAILATKIMMUNE	= %10000000	; Object cannot - Raccoon tail attacked


; Object Attribute Common Flags

; Selects a bounding box from Object_BoundBox
BOUND8x16			= $00
BOUND16x16			= $01
BOUND16x24			= $02
BOUND16x16BLOCK		= $03
BOUND16X48TALL		= $04
BOUND24x32			= $05
BOUND32x16BLOCK		= $06
BOUND16x28			= $07
BOUND48x16			= $08
BOUND24x24			= $09
BOUND16x32			= $0A
BOUND16x32TALL		= $0B
BOUND16x48		= $0C
BOUND32X64		= $0D
BOUND32x32			= $0E
BOUND48x48			= $0F
OAT_BOUNDBOXMASK	= %00001111	; Not intended for use in attribute table, readability/traceability only

OAT_INTERACTWITHOBJECTS	= %00010000	; Turn away from other enemies if their paths collide
OAT_ICEPROOF		= %00100000	; Object is immune to Player's weapon (i.e. fireballs/hammers)
OAT_FIREPROOF	= %01000000	; Object is immune to Player's fireballs
OAT_WEAPONSHELLPROOF		= %10000000	; Object will run collision routine instead of standard "Kick"-sound/100 points/OBJSTATE_KILLED [i.e. object not killed by being rammed with held object]


; Flags for the ObjectGroup_PatTableSel table
OPTS_NOCHANGE		= 0		; Don't set a pattern table
OPTS_SETPT5		= $00		; Set pattern table bank 5
OPTS_SETPT6		= $80		; Set pattern table bank 6

; Determines what action is taken when object is in "Killed" state (6)
; See Object_DoKillAction for the jump table
; NOTE: Any action type other than zero always sets the frame to 2 (unless object is not general purpose, i.e. index >= 5)

KILLACT_STARDEATH	= 0
KILLACT_NORMALSTATE	= 1	; 5: Do "Normal" state and killed action (sinking/vert flip)


; Objects $BC to $D0 create Cannon Fires
OBJ_CFIRE_BULLETBILL	= $BC + CFIRE_BULLETBILL - 1	; Bullet Bill cannon
OBJ_CFIRE_MISSILEBILL	= $BC + CFIRE_MISSILEBILL - 1	; Missile Bill (homing BUllet Bill)
OBJ_CFIRE_ROCKYWRENCH	= $BC + CFIRE_ROCKYWRENCH - 1	; Creates Rocky Wrench (um why?)

; Objects in $D1+ appear to trigger special events
OBJ_SPAWN3GREENTROOPAS	= $D1	; Spawns up to 3 (depending on available slots) hopping green paratroops
OBJ_SPAWN3ORANGECHEEPS	= $D2	; Spawns up to 3 (depending on available slots) "lost" orange cheep cheeps (a school)
OBJ_AUTOSCROLL		= $B0	; Activates auto scrolling for e.g. World 1-4, World 8 Tank, etc.

; Miscellaneous Player frames
PF_KICK_SMALL		= $42	; Foot out kick when small
PF_KICK_BIG		= $2D	; Foot out kick when big
PF_DIE			= $4B	; Dying
PF_MIDGROW_SMALL	= $0B	; When going from small to big, "Mid-grow" showing small
PF_MIDGROW_HALFWAY	= $27	; When going from small to big, "Mid-grow" showing something in between
PF_SKID_SMALL		= $41	; Skidding while small
PF_SKID_BIG		= $30	; Skidding while not small
PF_SLIDE_SMALL		= $33	; Sliding down a slope while small
PF_SLIDE_BIG		= $31	; Sliding down a slope otherwise
PF_STATUE		= $1E	; Tanooki statue frame

; Jump / fall
PF_FALLBIG		= $06	; Falling when not small
PF_FASTJUMPBIG		= $38	; "Fast" jump frame when not small
PF_JUMPFALLSMALL	= $40	; Standard jump/fall frame when small
PF_FASTJUMPFALLSMALL	= $4E	; "Fast" jump/fall frame when small
PF_JUMPBIG		= $4F	; Jump as not small (except raccoon)
PF_JUMPRACCOON		= $50	; Jump frame as raccoon
PF_SOMERSAULT_BASE	= $1A	; $1A-$1D Invincibility somersault base frame

FALL_NORMAL		= 5	; Normal fall rate added to 'Y'
FALL_TAILWAG		= 1	; Adjusted fall rate for when wagging raccoon tail
FALL_OBJECT		= 4	; Fall rate for objects

FALLRATE_TAILWAGMAX	= 8	; Maximum Y velocity falling rate when wagging raccoon tail
FALLRATE_MAX		= $40	; Maximum Y velocity falling rate
FALLRATE_OBJECTMAX	= $60	; Maximum Y velocity falling rate of an object

; Walking frames
PF_WALKSMALL_BASE	= $3E	; $3E-$3F Base frame of walking while "small"
PF_WALKBIG_BASE		= $0C	; $0C-$0E Base frame of walking while big/fire/hammer
PF_WALKSPECIAL_BASE	= $00	; $00-$02 Base frame of walking as Raccoon, Frog, or Tanooki
PF_FROGHOP_BASE		= $15	; $15-$17 Base frame for frog suit hopping along

; In-pipe frames
PF_INPIPE_SMALL		= $32	; "Small", in pipe
PF_INPIPE_SMALLKURIBO	= $43	; "Small", in pipe with Kuribo's shoe
PF_INPIPE_BIG		= $05	; "Not small", in pipe
PF_INPIPE_BIGKURIBO	= $18	; "Not small", in pipe with Kuribo's shoe

; Swim frames
PF_SWIMACTIVE_SMALL	= $46	; $46-$48 Base frame of actively swimming while small
PF_SWIMACTIVE_BIG	= $34	; $34-$36 Base frame of actively swimming while not small

PF_FROGSWIM_UPBASE	= $12	; $12-$14 Base frame for frog suit swimming up
PF_FROGSWIM_IDLEBASE	= $1F	; $1F-$20 Base frame for idling frog suit in the water (kick kick kick ...)
PF_FROGSWIM_LRBASE	= $21	; $21-$23 Base frame for frog suit swimming left/right
PF_FROGSWIM_DOWNBASE	= $24	; $24-$26 Base frame for frog suit swimming down

; Swim frames
PF_SWIMIDLE_SMALL	= $46	; $46,$49 Base frame of idle swimming while small
PF_SWIMIDLE_BIG		= $3C	; $34,$3C-$3D Base frame of idle swimming while not small

; Tail attack frames
PF_TAILATKGROUND_BASE	= $03	; $03-$05 Base frame of tail attack while on the ground
PF_TAILATKINAIR_BASE	= $09	; $04,$05,$09 Base frame of tail attack while in the air (okay not really the "base" I guess)

; Kuribo's Shoe
PF_KURIBO_SMALL		= $43	; Kuribo's shoe when small
PF_KURIBO_BIG		= $18	; Kuribo's shoe when big

; Ducking
PF_DUCK_NOTRACCOON	= $0F	; Ducking, not raccoon
PF_DUCK_RACCOON		= $07	; Ducking, raccoon

; Player throw (fire/hammer)
PF_THROWONGROUND_BASE	= $0E	; $0E,$10-$11 Base frame of throwing fire/hammer while on ground
PF_THROWINAIR_BASE	= $34	; $34-$36 Base frame oft hrowing fire/hammer while in air

; Player running spread-eagle
PF_RUNSMALL_BASE	= $4C	; $4C-$4D Base frame of running when small
PF_RUNBIG_BASE		= $39	; $39-$3B Base frame of running when not small

; Player tail wag
PF_TAILWAGFLY_BASE	= $36	; $36-$38 Base frame of flying tail wag
PF_TAILWAGFALL		= $08	; $08-$0A Base frame of fluttering tail wag

; Player holding frames
PF_HOLDSMALL_BASE	= $2E	; $2E-$2F Base frame of holding an object when small
PF_HOLDBIG_BASE		= $29	; $29-$2B Base frame of holding an object when not small

; Player spinning around (inside the desert land twister) (I don't like the determination by "suits that can slide", but that's what it is)
PF_SPINSMALLORFROG_BASE	= $32	; $32,$3E Base frame of "spinning" when small or in frog suit
PF_SPINSLIDESUITS_BASE	= $04	; $04-$05,$0E Base frame of "spinning" when in a suit that can slide (I guess that's just not hammer then)
PF_SPINOTHER_BASE	= $02	; $02,$04-$05 Base frame of "spinning" when in a suit that can't slide (just hammer suit I think)

; Airship "caught anchor" frame or general vine climbing (animation is mirroring this frame)
PF_CLIMB_SMALL		= $4A	; When small
PF_CLIMB_FROG		= $28	; When frog
PF_CLIMB_BIG		= $2C	; Otherwise


; Velocity affects for Player -- note they are in 4.4 fixed point, so divide them by 16 for pixels/frame
PLAYER_TOPWALKSPEED	= $18	; Highest X velocity considered as Player "walking"
PLAYER_TOPRUNSPEED	= $28	; Highest X velocity when Player runs
PLAYER_TOPPOWERSPEED	= $38	; Highest X velocity hit when Player is at full "power"
PLAYER_MAXSPEED		= $40	; Player's maximum speed
PLAYER_JUMP		= -$38	; Player's root Y velocity for jumping (further adjusted a bit by Player_SpeedJumpInc)
PLAYER_TAILWAG_YVEL	= $10	; The Y velocity that the tail wag attempts to lock you at
PLAYER_FLY_YVEL		= -$18	; The Y velocity the Player flies at
PLAYER_SWIMSTART_YVEL	= -$20	; The Y velocity the Player starts swimming at (or applied when sinking too fast)
PLAYER_SWIM_YVEL	= $20	; The swim Y velocity the rest of the time
PLAYER_FROG_MAXYVEL	= -$20

; Applies only to objects following Object_Move's standard movements, but most write their own physics
OBJECT_FALL		= $03
OBJECT_FALLINWATER	= $01
OBJECT_MAXFALL		= $40
OBJECT_MAXFALLINWATER	= $10
OBJECT_MAXWATERUPWARD	= -$7F
OBJECT_FALLRATE		= $03
OBJECT_SLOWFALLRATE		= $02
OBJECT_FALLRATEINWATER	= $01

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ASM INCLUDES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	; Object support routines
	.bank 0
	.org $C000
	.include "PRG/prg000.asm"

	; Objects $00-$23
	.bank 1
	.org $A000
	.include "PRG/prg001.asm"

	; Objects $24-$47
	.bank 2
	.org $A000
	.include "PRG/prg002.asm"

	; Objects $48-$6B
	.bank 3
	.org $A000
	.include "PRG/prg003.asm"

	; Objects $6C-$8F
	.bank 4
	.org $A000
	.include "PRG/prg004.asm"

	; Objects $90-$B3 and special-function object placeholders ($B4-$BC, $D1-$D6)
	.bank 5
	.org $A000
	.include "PRG/prg005.asm"

	; Object placement/layout data (for levels)
	.bank 6
	.org $C000
	.include "PRG/prg006.asm"

	; Special Objects, Cannon Fire, and some miscellaneous routines
	.bank 7
	.org $A000
	.include "PRG/prg007.asm"

	; Most of Player control code
	.bank 8
	.org $A000
	.include "PRG/prg008.asm"

	; 2P Vs and Autoscroll
	.bank 9
	.org $A000
	.include "PRG/prg009.asm"

	; Handles map BG graphics and logic code; also stores a few DMC samples
	.bank 10
	.org $C000
	.include "PRG/prg010.asm"

	; Main map logic and map sprites
	.bank 11
	.org $A000
	.include "PRG/prg011.asm"

	; Tileset 0 (Map), Map object code, map level layouts (links to level layouts/object sets), 
	; completion code, Airship / bonus host room / toad shop / coin ship / unused map object $0C layout pointers
	.bank 12
	.org $A000
	.include "PRG/prg012.asm"

	; Tileset 14 (Underground style)
	.bank 13
	.org $A000
	.include "PRG/prg013.asm"

	; Tileset 18 (2P Vs), 2P Vs battlefields, and shared level load routines
	.bank 14
	.org $C000
	.include "PRG/prg014.asm"

	; Tileset 1 (Plains style)
	.bank 15
	.org $A000
	.include "PRG/prg015.asm"

	; Tileset 3 (Hills style)
	.bank 16
	.org $A000
	.include "PRG/prg016.asm"

	; Tileset 4 (High-Up style) / 12 (Ice)
	.bank 17
	.org $A000
	.include "PRG/prg017.asm"

	; Tileset 6 (Water level), 7 (Toad house), 8 (Vertical levels typical of World 7)
	.bank 18
	.org $A000
	.include "PRG/prg018.asm"

	; Tileset 5 (World 7 plant infestations), 11 (Giant World), 13 (Sky areas, inc. coin heaven)
	.bank 19
	.org $A000
	.include "PRG/prg019.asm"

	; Tileset 9 (Desert)
	.bank 20
	.org $A000
	.include "PRG/prg020.asm"

	; Tileset 2 (Fortress)
	.bank 21
	.org $A000
	.include "PRG/prg021.asm"

	; Bonus games (Spade, N-Spade, and the lost games)
	.bank 22
	.org $C000
	.include "PRG/prg022.asm"

	; Tileset 10 (Airship)
	.bank 23
	.org $A000
	.include "PRG/prg023.asm"

	; Title screen, ending (logic and images), Toad and King cinematic (Pre-wand-return only!)
	; Also home a large copy/paste error from PRG022, first half of sprite lists for ending
	.bank 24
	.org $A000
	.include "PRG/prg024.asm"

	; Contains mostly command buffer graphics for title screen / ending (large images), 
	; second half of sprite lists for ending, and a table to access them
	.bank 25
	.org $C000
	.include "PRG/prg025.asm"

	; Tileset 15, 16, 17 (Bonus games)
	; Status bar routines (draw, use items, etc.), level junctions
	; (inc. pointers for Big [?] block area and generic pipe exits), border draw, fade routines
	.bank 26
	.org $A000
	.include "PRG/prg026.asm"

	; Palettes, palette routines, Toad and King Cinematic (Post-wand-return only!)
	.bank 27
	.org $A000
	.include "PRG/prg027.asm"

	; First bank of the sound engine
	.bank 28
	.org $A000
	.include "PRG/prg028.asm"

	; Some of the music segments, tile/block change event, pipe movement code, Toad House code,
	; Player's draw and animation routines
	.bank 29
	.org $C000
	.include "PRG/prg029.asm"

	; This bank is ALWAYS active in ROM, sitting at 8000h-9FFFh
	; Contains interrupt handling code and other constantly reused functionality
	.bank 30
	.org $8000
	.include "PRG/prg030.asm"

	; This bank is ALWAYS active in ROM, sitting at E000h-FFFFh
	; Contains interrupt handling code and other constantly reused functionality
	.bank 31
	.org $E000
	.include "PRG/prg031.asm"
