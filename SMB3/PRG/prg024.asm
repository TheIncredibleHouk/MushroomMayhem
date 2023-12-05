

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; GraphicsBuf_Prep_And_WaitVSyn2
;
; This subroutine takes Graphics_Queue and loads and address
; from Video_Upd_Table2 into the Video_Upd_Addr, then waits for
; a VBlank cycle to occur via reading the VBlank_Tick after
; force-setting it to zero.  This gets the system into a state
; where it can actually apply the update!
;
; See also GraphicsBuf_Prep_And_WaitVSync in PRG030
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GraphicsBuf_Prep_And_WaitVSyn2:
	STA Debug_Snap

	LDA <Graphics_Queue
	ASL A		 	
	TAY		 	; Y = Graphics_Queue << 1

	; Get the address where the video update data is
	LDA Video_Upd_Table2,Y
	STA <Video_Upd_AddrL
	LDA Video_Upd_Table2+1,Y
	STA <Video_Upd_AddrH	

	LDA #$01	
	STA <VBlank_TickEn	 ; Enable the VBlank tick
	LDA #$00	 
	STA <VBlank_Tick	 ; Force VBlank_Tick = 0, so we know when a VBlank has occurred

	; Waiting for VBlank...
PRG024_A81C:
	LDA <VBlank_Tick
	BPL PRG024_A81C

	LDA #$00	 
	STA <VBlank_TickEn	 ; Disable the VBlank

	CLI		 ; Enable further masked interrupts
	RTS		 ; Return


IntIRQ_TitleEnding:
	STA MMC3_IRQENABLE

	; Some kind of delay loop?
	LDX #$04	 ; X = 4
PRG024_A82B:
	NOP		 ; ?
	DEX		 ; X--
	BNE PRG024_A82B	 ; While X > 0, loop

	LDA PPU_STAT

	LDY #$0b
	LDA #$00
	STY PPU_VRAM_ADDR
	STA PPU_VRAM_ADDR

	LDA PPU_VRAM_DATA

	LDA <PPU_CTL1_Copy	
	ORA <PPU_CTL1_Mod	; Combine bits from PPU_CTL1_Copy into PPU_CTL1_Mod
	STA PPU_CTL1	 ; Stored to the register!

	LDA PPU_STAT

	; H-Scroll locked at 0
	LDA #$00
	STA PPU_SCROLL

	; V-Scroll locked at $EF
	LDA #$ef
	STA PPU_SCROLL

	STA MMC3_IRQDISABLE

	JMP IntIRQ_Finish_NoDis	 ; Jump to IntIRQ_Finish_NoDis

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
; Video_Misc_Updates2
;
; This routine is responsible for arbitrary video updates
;
; Loads data as specified from table Video_Upd_Table2 in PRG024 (see Video_Upd_Table in PRG030 for format!)
; Cloned in its entirety in PRG026 (i.e. Video_Misc_Updates)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
Video_Misc_Updates2:
	LDY #$00	 	; Start at offset 0
	LDA [Video_Upd_AddrL],Y	; Get next byte from data
	BNE PRG024_A860	 	; If not $00 (terminator), process it @ PRG024_A860
	RTS		 ; Return

PRG024_A860:
	LDX PPU_STAT	 	; Flush video

	STA PPU_VRAM_ADDR	; Store byte into video address high
	INY		 	; Y++
	LDA [Video_Upd_AddrL],Y	; Get next byte
	STA PPU_VRAM_ADDR	; Store byte into video address low

	INY		 	; Y++
	LDA [Video_Upd_AddrL],Y	; Get next byte...

	ASL A		 	; Its uppermost bit dictates whether to use horizontal (1B) or vertical (32B) advancement
	PHA		 	; Save A

	LDA <PPU_CTL1_Copy	; Get PPU_CTL1 settings
	ORA #$04	 	; Set PPU update vertical (each write advances by 32)
	BCS PRG024_A879		; If bit 7 was set, jump to PRG026_B2B2
	AND #$fb		; Otherwise, use horizontal updates! (clears vertical bit)

PRG024_A879:
	STA PPU_CTL1		; Update PPU_CTL1
	STA <PPU_CTL1_Copy	; Update PPU_CTL1_Copy

	PLA		; Restore A

	ASL A		 ; Check next bit...
	BCC PRG024_A885	 ; If not set, jump to PRG026_B2BE
	ORA #$02	 ; Otherwise, remaining value gets bit 1 set (forces skip of first increment)
	INY		 ; Y++ 

PRG024_A885:
	; Restore remainder of byte read (6-bits for value)
	LSR A
	LSR A
	TAX		 ; Keep it in X

	; The following will continuously write bytes from the stream
	; directly into the PPU 'X+1' times
PRG024_A888:
	BCS PRG024_A88B	 ; If carry set, jump to PRG026_B2C4
	INY		 ; Y++

PRG024_A88B:
	LDA [Video_Upd_AddrL],Y	; Get next byte
	STA PPU_VRAM_DATA	; Store into PPU
	DEX		 	; X--
	BNE PRG024_A888	 	; While X <> 0, loop! 

	; This advances the current position of the pointer so 'Y' can go
	; back to zero and we begin again...
	INY		 ; Y++
	TYA		 ; A = Y
	ADD <Video_Upd_AddrL
	STA <Video_Upd_AddrL
	LDA <Video_Upd_AddrH
	ADC #$00	 
	STA <Video_Upd_AddrH	; Entire video address value has 'Y' added to it
	JMP Video_Misc_Updates2	; Jump back to start to process next command or terminate!

; Title_Obj_InitIdx:	.byte $02, $00, $01, $03, $04, $05	; Indexes into Title_ObjStates, inits to state 1 in this order
; Title_ObjInitIdx_Time:	.byte $03, $03, $06, $12, $11, $00	; Timing values to delay the next Title_ObjInitIdx

Do_Title_Screen:	; $A8AF
	JSR Sprite_RAM_Clear		; Clear Sprite RAM Copy
	JSR Reset_PPU_Clear_Nametables

	; Basically just hiding everything
	LDA #$00
	STA PPU_CTL1
	STA PPU_CTL2

	; Clear the first 245 bytes of RAM
	LDX #$f5	 ; X = 245
PRG024_A8BF:
	LDA #$00	 	; A = $00
	STA <Temp_Var1,X	; Clear this byte
	DEX		 	; X--
	BNE PRG024_A8BF	 	; Loop...


	; Clearing memory used by various title screen objects
	LDX #(Title_ObjFrame - Title_MLAccelCnt + 6)
PRG024_A8C8:
	LDA #$00	 ; A = 0
	STA Title_MLAccelCnt,X	 ; Clear this byte
	DEX		 ; X--
	BPL PRG024_A8C8	 ; Loop while X >= 0...

	; Set Mario and Luigi's lives to 4
	LDA #$04
	STA Player_Lives
	STA Player_Lives+1

	LDA #$ff
	STA <Title_ObjInitIdx	; Title_ObjInitIdx = $FF (Should be 0 - 5, does this have an early increment or something?)

	; Set Mario and Luigi's Y position to 160
	LDA #160
	STA <Title_ObjY
	STA <Title_ObjY+1

	LDA #240
	STA <Title_ObjX		; Set Mario's X coordinate to 240

	LDA #$00
	STA <Title_ObjX+1	; Set Luigi's X coordinate to 0

	; Set Mario and Luigi to "Big" power level
	LDA #$01
	STA <Title_ObjMLPower	
	STA <Title_ObjMLPower+1	

	LDA #$88
	STA Random_Pool		; Seed the randomizer

	LDA #%00101000
	STA PPU_CTL1		; use 8x16 sprites, sprites use PT2
	STA <PPU_CTL1_Copy	; Sync with PPU_CTL1_Copy

	JSR Title_Display_Title	; Put up the curtain!

	
	LDY #$02	 ; A = 1
	LDA Video_Upd_Table2,Y
	STA <Video_Upd_AddrL
	LDA Video_Upd_Table2+1,Y
	STA <Video_Upd_AddrH
	JSR Video_Misc_Updates2

	LDY #$04	 ; A = 1
	LDA Video_Upd_Table2,Y
	STA <Video_Upd_AddrL
	LDA Video_Upd_Table2+1,Y
	STA <Video_Upd_AddrH
	JSR Video_Misc_Updates2

	LDY #$06	 ; A = 1
	LDA Video_Upd_Table2,Y
	STA <Video_Upd_AddrL
	LDA Video_Upd_Table2+1,Y
	STA <Video_Upd_AddrH
	JSR Video_Misc_Updates2

	; Some kind of hardware thing perhaps
	LDA #$00
	STA PPU_VRAM_ADDR
	STA PPU_VRAM_ADDR
	LDA #$10	
	STA PPU_VRAM_ADDR
	STA PPU_VRAM_ADDR
	LDA #$00	
	STA PPU_VRAM_ADDR
	STA PPU_VRAM_ADDR
	LDA #$10	 
	STA PPU_VRAM_ADDR	
	STA PPU_VRAM_ADDR	

	; Wait for V-Blank to end
PRG024_A930:
	LDA PPU_STAT
	AND #$80	
	BNE PRG024_A930	

	LDA #%10101000
	STA PPU_CTL1	 	; Generate VBlank Resets, use 8x16 sprites, sprites use PT2
	STA <PPU_CTL1_Copy	; Keep PPU_CTL1_Copy in sync!

	LDA #%00011110
	STA <PPU_CTL2_Copy	; Setup for: No BG or sprite clipping, show BG and sprites

	LDA #53
	STA <Title_Ticker	; Set Title_Ticker = 53 (initial delay prior to curtain raise)

	JSR Title_Sprites
	JSR Title_FadeIn

PRG024_A946:
	LDA #$00
	STA Graphics_Queue
	
	; Used for VSync
	JSR GraphicsBuf_Prep_And_WaitVSyn2
	JSR Title_Sprites

PRG024_A955: 
	DEC <Title_Ticker	; Decrement title tick counter
	BPL PRG024_A946	 	; If >= 0, loop...

PRG024_A959:
	; Title_Ticker = 0...

	; Used for VSync
	JSR GraphicsBuf_Prep_And_WaitVSyn2

	; There are 6 objects on the title screen that need their states set; if this value hits 6, we're done with that
	LDY <Title_ObjInitIdx	; Y = Title_ObjInitIdx
	CPY #$06	 	
	BGE PRG024_A976	 	; If Title_ObjInitIdx >= 6, jump to PRG024_A976

	; Title_ObjInitIdx < 6... (more objects to go yet)

	; Waiting for event timer to run out
	DEC <Title_ObjInitDly	; Title_ObjInitDly--
	BNE PRG024_A976	 	; If Title_ObjInitDly > 0, jump to PRG024_A976

	; Load next delay for object init
	; Title_ObjInitIdx is 0 to 5
	; LDA Title_ObjInitIdx_Time,Y
	; STA <Title_ObjInitDly	; Title_ObjInitDly = Title_ObjInitIdx_Time[Title_ObjInitIdx]

	; LDA Title_Obj_InitIdx,Y
	; TAY		 	; Y = Title_Obj_InitIdx[Title_ObjInitIdx]

	; LDA #$01	 	
	; STA Title_ObjStates,Y 	; Title_ObjStates[Y] = 1  Set title screen object to state 1

	; ; Doing next object...
	; INC <Title_ObjInitIdx	; Title_ObjInitIdx++

PRG024_A976:
	JSR Title_DoState	; Do whatever this state of the title screen does

	; Title_ResetTrig is the trigger to reset the title screen
	LDA <Title_ResetTrig
	BEQ PRG024_A980	 	; If Title_ResetTrig = 0, jump to PRG024_A980

	JMP Do_Title_Screen	; Reset title screen...

PRG024_A980:
	; Reset trigger is not set...

	LDA <Title_State
	CMP #$05	 
	BNE PRG024_A959	 ; If Title_State <> 5, jump to PRG024_A959

	; When Title_State = 5, we're about to finish and go off to the map!

	; Performs a clearing loop starting from World_Map_Y + $80 ($F5) down and through
	LDX #$80	 ; Clearing $80 bytes
	LDA #$00	 ; Clear value
PRG024_A98A:
	STA <World_Map_Y,X	; Clear this byte
	DEX		 	; X--
	BPL PRG024_A98A	 	; X >= 0, loop!

	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Title_Display_Curtain
;
; You know that nifty "bowser" curtain 
; on the title screen?  Here it is...
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Title_Screen_Tiles:
	.byte $FE, $FE, $90, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $91, $FE, $FE, $FE
	.byte $FE, $FE, $94, $FF, $FF, $FF, $FF, $FF, $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $0B, $0C, $0D, $FF, $FF, $FF, $FF, $FF, $FF, $97, $FE, $FE, $FE
	.byte $FE, $FE, $94, $FF, $FF, $FF, $FF, $FF, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1A, $1B, $1C, $1D, $FF, $FF, $FF, $FF, $FF, $FF, $97, $FE, $FE, $FE
	.byte $FE, $FE, $94, $FF, $FF, $FF, $FF, $FF, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2A, $2B, $2C, $2D, $FF, $FF, $FF, $FF, $FF, $FF, $97, $FE, $FE, $FE
	.byte $FE, $FE, $94, $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3A, $3B, $3C, $3D, $3E, $3F, $60, $61, $62, $63, $64, $65, $66, $67, $68, $97, $FE, $FE, $FE
	.byte $FE, $FE, $94, $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4A, $4B, $4C, $4D, $4E, $4F, $70, $71, $72, $73, $74, $75, $76, $77, $78, $97, $FE, $FE, $FE
	.byte $FE, $FE, $94, $50, $51, $52, $53, $54, $55, $56, $57, $58, $59, $5A, $5B, $5C, $5D, $5E, $5F, $80, $81, $82, $83, $84, $85, $86, $87, $88, $97, $FE, $FE, $FE
	.byte $FE, $FE, $92, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $96, $93, $FE, $FE, $FE

Title_Display_Title:
	SEI

	LDA PPU_STAT 	; read PPU status to reset the high/low latch

	; Set VRAM_ADDR to $2000 (Nametable 0)
	LDA #$20
	STA PPU_VRAM_ADDR
	LDA #$80
	STA PPU_VRAM_ADDR
	
	LDX #$00

PRG024_A9A1:
	LDA Title_Screen_Tiles, X

PRG024_A9A3:
	STA PPU_VRAM_DATA	; Write $08/$09 to this byte in the VRAM
	INX
	CPX #$00
	BNE PRG024_A9A1	 	; Loop while Y not zero

	CLI
	RTS		 	; Return!


Title_DoState:

	; Clear the queues for Mario/Luigi
	LDA #$00
	STA <Title_ObjMLQueue
	STA <Title_ObjMLQueue+1
	STA Total_Players

	LDA <Title_State	
	JSR DynJump	 	; Dynamically jump based on Title_State...

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word TitleState_Wait		; 00 - Curtain raise
	.word TitleState_Delay	; 01 - Opening sequence (updates Mario/Luigi's action scripts, the title screen objects, makes the big '3' glow...)
	.word Title_PrepForWorldMap			; 02 - Prepares some variables before going into 1P/2P menu mode
	.word Title_PrepForWorldMap			; 03 - Runs the 1P/2P menu with the koopas
	.word Title_PrepForWorldMap		; 04 - Final data initialization before going to world map
	.word Title_PrepForWorldMap			; 05 - just RTS, bootstraps world map
	.word Title_PrepForWorldMap			; 06 - Skip intro sequence (cleanly jump to 1P/2P menu)
	.word Title_PrepForWorldMap			; 07 - Debug menu

TitleState_Wait:
	JSR World_Select
	JSR Title_Menu

	LDA <Pad_Input
	AND #PAD_START
	BEQ TitleState_WaitRTS

	LDA Title_GameMenu
	
	JSR DynJump

	.word TitleState_Start
	.word TitleState_Start
	.word TitleState_Start
	.word TitleState_Confirm
	.word TitleState_Cancel
	.word TitleState_EraseGame
	
TitleState_Start:
	LDA #SND_LEVELCOIN
	STA Sound_QLevel1

	LDA #$40
	STA Title_DelayTicker

	LDA #$01
	STA Title_State
	
TitleState_WaitRTS:
	RTS

TitleState_Confirm:
	LDA #TITLEMENU_CONFIRM_NO
	STA Title_GameMenu
	JMP Title_MenuUpdate

TitleState_Cancel:
	LDA #TITLEMENU_CONTINUE
	STA Title_GameMenu
	JMP Title_MenuUpdate

TitleState_EraseGame:
	LDA #$00
	STA Save_Ram_CheckSum

	LDA #TITLEMENU_NEWGAME_ONLY
	STA Title_GameMenu
	JMP Title_MenuUpdate

Title_DelayTicker = $6900

TitleState_Delay:
	DEC Title_DelayTicker
	BNE TitleState_DelayRTS

	LDA #$02
	STA Title_State

TitleState_DelayRTS:
	RTS


Title_PrepForWorldMap:
	LDA #$FF
	STA Player_Stats_Boundary_Start
	STA Player_Stats_Boundary_End

	INC Force_StatusBar_Init

	LDA #$40
	STA Air_Time
	STA Tile_Anim_Enabled

	LDA #$0F
	STA StatusBar_Palette
	STA StatusBar_Palette + 1
	STA StatusBar_Palette + 2

	LDA #0
	STA Player_Level

	LDA #$01
	STA Total_Players	 ; Total_Players should be 1/2, not 0/1

	INC <Title_State	 ; Next title state...
	
	LDA #$4B
	STA BrickBust_Tile
	STA BrickBust_Tile+1
	STA BrickBust_Tile+2

	LDA #SPR_PAL3
	STA BrickBust_Pal
	STA BrickBust_Pal+1
	STA BrickBust_Pal+2
	RTS		 ; Return

Title_SpritesX:
	.byte $60, $60, $78, $78, $98, $98, $30, $40, $40, $70, $88, $B0, $B0, $C8, $C8

Title_SpritesY:
	.byte $27, $37, $27, $37, $27, $37, $47, $3F, $4F, $47, $3F, $3F, $4F, $3F, $4F

Title_SpritesAttr:
	.byte SPR_PAL3, SPR_PAL3, SPR_PAL2, SPR_PAL2, SPR_PAL3, SPR_PAL3, SPR_PAL1, SPR_PAL2, SPR_PAL2, SPR_PAL3, SPR_PAL2, SPR_PAL0, SPR_PAL0, SPR_PAL1, SPR_PAL1

Title_SpritesTile:
	.byte $A1, $BD, $A3, $A5, $A7, $A9, $AB, $AD, $AF, $B1, $B3, $B5, $B7, $B9, $BB

Title_SpriteCount:
	.byte (15 - 1)

Title_Sprites:
	LDX Title_SpriteCount
	LDY #$00

Title_SpritesLoop:
	LDA Title_SpritesX, X
	STA Sprite_RAMX, Y

	LDA Title_SpritesY, X
	STA Sprite_RAMY, Y

	LDA Title_SpritesAttr, X
	STA Sprite_RAMAttr, Y

	LDA Title_SpritesTile, X
	STA Sprite_RAMTile, Y

	INY
	INY
	INY
	INY

	DEX
	BPL Title_SpritesLoop

	RTS

FadeIn_Ticker = $6000
FadeIn_Stage = $6001

Title_FadeIn:
	LDA #$04
	STA MMC3_IRQDISABLE
	STA FadeIn_Stage

Tite_FadeInLoop:
	LDA #$04
	STA FadeIn_Ticker

Title_FadeInTick:
	LDA FadeIn_Stage
	STA Graphics_Queue
	JSR GraphicsBuf_Prep_And_WaitVSyn2

	DEC FadeIn_Ticker
	BPL Title_FadeInTick

	INC FadeIn_Stage

	LDA FadeIn_Stage
	CMP #$08
	BNE Tite_FadeInLoop

	RTS

Title_GameMenu = $6800
Title_GameMenu_Init = $6801

TITLEMENU_NEWGAME_ONLY = $00
TITLEMENU_CONTINUE = $02
TITLEMENU_NEWGAME = $03
TITLEMENU_CONFIRM_NO = $04
TITLEMENU_CONFIRM_YES = $05

TitleMenu_DrawMode:
	.byte $09, $09, $0A, $0B, $0C, $0D

Title_Menu:
	LDA Title_GameMenu_Init
	BNE Title_MenuController

	INC Title_GameMenu_Init

	LDA Save_Ram_CheckSum
	ORA Save_Ram_CheckSum
	BNE Title_MenuContinue

	LDA #$00
	STA Title_GameMenu
	BEQ Title_MenuUpdate

Title_MenuContinue:
	LDA #TITLEMENU_CONTINUE
	STA Title_GameMenu
	BNE Title_MenuUpdate

Title_MenuController:
	LDA Title_GameMenu
	BEQ Title_MenuRTS

	LDA <Pad_Input
	AND #PAD_SELECT
	BEQ Title_MenuRTS

	LDA #SND_MAPPATHMOVE
	STA Sound_QMap

	LDA Title_GameMenu
	EOR #$01
	STA Title_GameMenu

Title_MenuUpdate:
	LDY Title_GameMenu
	LDA TitleMenu_DrawMode, Y
	STA Graphics_Queue

	JSR GraphicsBuf_Prep_And_WaitVSyn2

Title_MenuRTS:
	RTS


World_Select_Enabled = $6802
World_Number_Sprite:
	.byte $00, $E3, $E5, $E7, $E9, $EB, $ED, $EF

World_Select:
	LDA World_Select_Enabled
	BEQ World_Select_CheckEnable

	LDA <Pad_Input
	AND #(PAD_RIGHT | PAD_UP)
	BNE World_Select_Increase

	LDA <Pad_Input
	AND #(PAD_LEFT | PAD_DOWN)
	BEQ World_Select_Sprite
	
	DEC World_Start
	JMP World_Select_Verify

World_Select_Increase:
	INC World_Start
	JMP World_Select_Verify

World_Select_Verify:
	LDA World_Start
	BNE World_Select_CheckMax

	LDA #$07
	STA World_Start
	BNE World_Select_Sprite

World_Select_CheckMax:
	CMP #$08
	BCC World_Select_Sprite

	LDA #$01
	STA World_Start

World_Select_Sprite:
	LDY #$80
	LDX World_Start
	LDA World_Number_Sprite, X
	STA Sprite_RAMTile, Y

	LDA #SPR_PAL0
	STA Sprite_RAMAttr, Y

	LDA #$8A
	STA Sprite_RAMX, Y

	LDA #$C7
	STA Sprite_RAMY, Y

World_SelectRTS:
	RTS

World_Select_CheckEnable:
	LDA <Pad_Holding
	CMP #(PAD_DOWN | PAD_A | PAD_B | PAD_SELECT)
	BNE World_Select_CheckEnableRTS

	LDA #$01
	STA World_Select_Enabled
	STA World_Start

	LDA #$0E
	STA Graphics_Queue

	JSR GraphicsBuf_Prep_And_WaitVSyn2

World_Select_CheckEnableRTS:
	RTS
