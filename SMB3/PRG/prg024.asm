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

Title_GfxBuffer = $6C00

Title_GfxDefault:
	LDA #HIGH(Graphics_Buffer)
	STA <Video_Upd_AddrH

	LDA #LOW(Graphics_Buffer)
	STA <Video_Upd_AddrL
	RTS

GraphicsBuf_Prep_And_WaitVSyn2:
	LDA <Graphics_Queue
	BEQ Title_GfxDefault

	ASL A		 	
	TAY		 	

	LDA Video_Upd_Table2,Y
	STA <Video_Upd_AddrL

	LDA Video_Upd_Table2+1,Y
	STA <Video_Upd_AddrH

	LDY #$00

Title_GfxBuffer_Loop:	
	LDA [Video_Upd_AddrL], Y
	BEQ Title_GfxCommit

	STA Title_GfxBuffer, Y
	INY

	LDA [Video_Upd_AddrL], Y
	STA Title_GfxBuffer, Y
	INY

	LDA [Video_Upd_AddrL], Y
	STA Title_GfxBuffer, Y

	AND #$3F
	TAX
	INY

Title_GfxBuffer_DataLoop:
	LDA [Video_Upd_AddrL], Y
	STA Title_GfxBuffer, Y 
	INY
	DEX
	BNE Title_GfxBuffer_DataLoop
	JMP Title_GfxBuffer_Loop

Title_GfxCommit:
	STA Title_GfxBuffer, Y

	LDA #HIGH(Title_GfxBuffer)
	STA <Video_Upd_AddrH

	LDA #LOW(Title_GfxBuffer)
	STA <Video_Upd_AddrL

	JSR VBlank_Wait

	CLI		 ; Enable further masked interrupts
	RTS		 ; Return


; IntIRQ_TitleEnding:
; 	STA MMC3_IRQENABLE

; 	; Some kind of delay loop?
; 	LDX #$04	 ; X = 4
; PRG024_A82B:
; 	NOP		 ; ?
; 	DEX		 ; X--
; 	BNE PRG024_A82B	 ; While X > 0, loop

; 	LDA PPU_STAT

; 	LDY #$0b
; 	LDA #$00
; 	STY PPU_VRAM_ADDR
; 	STA PPU_VRAM_ADDR

; 	LDA PPU_VRAM_DATA

; 	LDA <PPU_CTL1_Copy	
; 	ORA <PPU_CTL1_Mod	; Combine bits from PPU_CTL1_Copy into PPU_CTL1_Mod
; 	STA PPU_CTL1	 ; Stored to the register!

; 	LDA PPU_STAT

; 	; H-Scroll locked at 0
; 	LDA #$00
; 	STA PPU_SCROLL

; 	; V-Scroll locked at $EF
; 	LDA #$ef
; 	STA PPU_SCROLL

; 	STA MMC3_IRQDISABLE

; 	JMP IntIRQ_Finish_NoDis	 ; Jump to IntIRQ_Finish_NoDis

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

	STA <PPU_CTL1_Copy
	STA <PPU_CTL2_Copy

	; Clear the first 245 bytes of RAM
	LDX #$f5	 ; X = 245

PRG024_A8BF:
	LDA #$00	 	; A = $00
	STA <Temp_Var1,X	; Clear this byte
	DEX		 	; X--
	BNE PRG024_A8BF	 	; Loop...


	; Clearing memory used by various title screen objects
	LDA #$88
	STA Random_Pool		; Seed the randomizer

	LDA #%00101000
	STA PPU_CTL1		; use 8x16 sprites, sprites use PT2
	STA <PPU_CTL1_Copy	; Sync with PPU_CTL1_Copy

	JSR Title_Display_Title	; Put up the curtain!

	; Some kind of hardware thing perhaps
	; LDA #$00
	; STA PPU_VRAM_ADDR
	; STA PPU_VRAM_ADDR

	; LDA #$10	
	; STA PPU_VRAM_ADDR
	; STA PPU_VRAM_ADDR

	; LDA #$00	
	; STA PPU_VRAM_ADDR
	; STA PPU_VRAM_ADDR

	; LDA #$10	 
	; STA PPU_VRAM_ADDR	
	; STA PPU_VRAM_ADDR	

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

	LDA #$01
	STA <Graphics_Queue
	JSR GraphicsBuf_Prep_And_WaitVSyn2

	LDA #$00
	STA PPU_CTL2

	LDA #$02
	STA <Graphics_Queue
	JSR GraphicsBuf_Prep_And_WaitVSyn2

	LDA #$00
	STA PPU_CTL2
	
	LDA #$03
	STA <Graphics_Queue
	JSR GraphicsBuf_Prep_And_WaitVSyn2

	LDA #$00
	STA PPU_CTL2

	LDA #$FC
	STA <Horz_Scroll

	JSR Title_RandomizeStars
	JSR Title_Sprites
	JSR Title_FadeIn

PRG024_A946:
	LDA #$00
	STA Graphics_Queue
	
	; Used for VSync
	JSR GraphicsBuf_Prep_And_WaitVSyn2

PRG024_A955: 
	DEC <Title_Ticker	; Decrement title tick counter
	BPL PRG024_A946	 	; If >= 0, loop...

PRG024_A959:
	; Title_Ticker = 0...

	; Used for VSync
	;JSR GraphicsBuf_Prep_And_WaitVSyn2

	; There are 6 objects on the title screen that need their states set; if this value hits 6, we're done with that
; 	LDY <Title_ObjInitIdx	; Y = Title_ObjInitIdx
; 	CPY #$06	 	
; 	BGE PRG024_A976	 	; If Title_ObjInitIdx >= 6, jump to PRG024_A976

; 	; Title_ObjInitIdx < 6... (more objects to go yet)

; 	; Waiting for event timer to run out
; 	DEC <Title_ObjInitDly	; Title_ObjInitDly--
; 	BNE PRG024_A976	 	; If Title_ObjInitDly > 0, jump to PRG024_A976

; 	; Load next delay for object init
; 	; Title_ObjInitIdx is 0 to 5
; 	; LDA Title_ObjInitIdx_Time,Y
; 	; STA <Title_ObjInitDly	; Title_ObjInitDly = Title_ObjInitIdx_Time[Title_ObjInitIdx]

; 	; LDA Title_Obj_InitIdx,Y
; 	; TAY		 	; Y = Title_Obj_InitIdx[Title_ObjInitIdx]

; 	; LDA #$01	 	
; 	; STA Title_ObjStates,Y 	; Title_ObjStates[Y] = 1  Set title screen object to state 1

; 	; ; Doing next object...
; 	; INC <Title_ObjInitIdx	; Title_ObjInitIdx++

; PRG024_A976:
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

Title_Screen_Tiles:
	.byte $FE, $FE, $90, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $95, $91, $FE, $FE, $FE
	.byte $FE, $FE, $94, $FF, $FF, $FF, $FF, $FF, $AF, $01, $02, $03, $04, $05, $06, $AF, $08, $09, $0A, $AF, $0C, $0D, $FF, $FF, $FF, $FF, $FF, $FF, $97, $FE, $FE, $FE
	.byte $FE, $FE, $94, $FF, $FF, $FF, $FF, $FF, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1A, $AF, $1C, $1D, $FF, $FF, $FF, $FF, $FF, $FF, $97, $FE, $FE, $FE
	.byte $FE, $FE, $94, $FF, $FF, $FF, $FF, $FF, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2A, $2B, $2C, $2D, $FF, $FF, $FF, $FF, $FF, $FF, $97, $FE, $FE, $FE
	.byte $FE, $FE, $94, $AF, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3A, $3B, $3C, $3D, $AF, $3F, $60, $61, $62, $63, $64, $65, $66, $67, $68, $97, $FE, $FE, $FE
	.byte $FE, $FE, $94, $40, $41, $42, $43, $44, $AF, $46, $47, $48, $49, $4A, $4B, $4C, $4D, $4E, $4F, $70, $71, $72, $73, $74, $75, $76, $77, $78, $97, $FE, $FE, $FE
	.byte $FE, $FE, $94, $50, $51, $52, $53, $54, $AF, $56, $57, $58, $59, $5A, $5B, $5C, $5D, $5E, $5F, $80, $81, $82, $83, $84, $85, $86, $87, $88, $97, $FE, $FE, $FE
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
	JSR Randomize
	JSR Read_Joypads

	LDA World_Select_Enabled
	BNE Title_SkipStars

	JSR Title_DoStars

Title_SkipStars:
	JSR World_Select
	JSR Title_Menu

	LDA <Pad_Input
	AND #PAD_START
	BEQ TitleState_WaitRTS

Title_DoGameStart:
	LDA Title_GameMenu
	
	JSR DynJump

	.word TitleState_Start
	.word TitleState_Start
	.word TitleState_Start
	.word TitleState_Confirm
	.word TitleState_Cancel
	.word TitleState_EraseGame


TitleState_StartGame:
	LDA #SND_LEVELCOIN
	STA Sound_QLevel1

	LDA #$FF
	STA Title_DelayTicker
	
	LDA #$28
	STA Title_DelayTicker + 1

	LDA #$01
	STA Title_State
	RTS

TitleState_Start:
	JMP TitleState_StartGame
	
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
	STA Save_Ram_CheckSum + 1
	STA Game_Options

	LDA #TITLEMENU_NEWGAME_ONLY
	STA Title_GameMenu

	JMP Title_MenuUpdate

Title_DelayTicker = $6900

TitleState_Delay:
	DEC Title_DelayTicker
	BNE TitleState_DelayRTS

	DEC Title_DelayTicker +1
	BNE TitleState_DelayRTS

	LDA #$02
	STA Title_State

	JSR Title_FadeOut

TitleState_DelayRTS:
	LDA #$00
	STA <Graphics_Queue
	RTS


Title_PrepForWorldMap:
	LDA #$FF
	STA Player_Stats_Boundary_Start
	STA Player_Stats_Boundary_End
	STA Level_NoStars

	INC Force_StatusBar_Init

	LDA #$40
	STA Air_Time

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
	LDY #$80

Title_SpritesLoop:
	LDA Title_SpritesX, X
	SUB <Horz_Scroll
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
	LDX Save_Ram_CheckSum - 4
	CPX #SECOND_QUEST
	BNE Title_NormPalette

	LDA FadeIn_Stage
	ADD #14
	JMP Title_QueuePalette

Title_NormPalette:
	LDA FadeIn_Stage

Title_QueuePalette:	
	STA Graphics_Queue
	JSR GraphicsBuf_Prep_And_WaitVSyn2

	DEC FadeIn_Ticker
	BPL Title_FadeInTick

	INC FadeIn_Stage

	LDA FadeIn_Stage
	CMP #$08
	BNE Tite_FadeInLoop

	RTS


FadeOut_Ticker = $6000
FadeOut_Stage = $6001

Title_FadeOut:
	LDA #$04
	STA MMC3_IRQDISABLE

	LDA #$07
	STA FadeOut_Stage

Tite_FadeOutLoop:
	LDA #$04
	STA FadeOut_Ticker

Title_FadeOutTick:
	LDA FadeOut_Stage
	STA Graphics_Queue
	JSR GraphicsBuf_Prep_And_WaitVSyn2

	DEC FadeOut_Ticker
	BPL Title_FadeOutTick

	DEC FadeOut_Stage

	LDA FadeOut_Stage
	CMP #$03
	BNE Tite_FadeOutLoop

	RTS	

Title_GameMenu = $6800
Title_GameMenu_Init = $6801

TITLEMENU_NEWGAME_ONLY = $00
TITLEMENU_CONTINUE = $02
TITLEMENU_NEWGAME = $03
TITLEMENU_CONFIRM_NO = $04
TITLEMENU_CONFIRM_YES = $05

TitleMenu_DrawMode:
	.byte $09, $09, $0A, $0B, $0C, $0D, $10, $11

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
	AND #(PAD_SELECT | PAD_UP | PAD_DOWN | PAD_LEFT | PAD_RIGHT)
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
	.byte $00, $E3, $E5, $E7, $E9, $EB, $ED, $EF, $F1

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

	LDA #$08
	STA World_Start
	BNE World_Select_Sprite

World_Select_CheckMax:
	CMP #$09
	BCC World_Select_Sprite

	LDA #$01
	STA World_Start

World_Select_Sprite:
	LDY #$00
	LDX World_Start
	LDA World_Number_Sprite, X
	STA Sprite_RAMTile, Y

	LDA #SPR_PAL0
	STA Sprite_RAMAttr, Y

	LDA #$8A
	SUB <Horz_Scroll
	STA Sprite_RAMX, Y

	LDA #$C7
	STA Sprite_RAMY, Y

World_SelectRTS:
	RTS

World_Select_CheckEnable:
	LDA <Pad_Holding
	CMP #(PAD_DOWN | PAD_A | PAD_B | PAD_SELECT)
	BNE World_Select_CheckEnableRTS

	JSR TitleState_EraseGame

	LDA #$01
	STA World_Select_Enabled
	STA World_Start

	LDX #$7F
	LDA #$FF 

World_Select_ClearSprites:
	STA Sprite_RAM, X
	DEX
	BPL World_Select_ClearSprites

	LDA #$4D
	STA PatTable_BankSel + 5

	LDA #$0E
	STA Graphics_Queue

	JSR GraphicsBuf_Prep_And_WaitVSyn2

World_Select_CheckEnableRTS:
	RTS

Video_Upd_Table2:
	.word Graphics_Buffer		; $00 - Graphics buffer for dynamically generated content
	.word Title_Clear
	.word Title_Attributes	; $01 - Loads palette for title screen (and falls into Title_Checkerboard_Floor)
	.word Title_Subtitle
	.word Title_FadeIn_1		; $03 - Title screen colors fade in part 1
	.word Title_FadeIn_2		; $04 - Title screen colors fade in part 2
	.word Title_FadeIn_3		; $05 - Title screen colors fade in part 3
	.word Title_FadeIn_4		; $06 - Title screen colors fade in part 4
	.word Title_FadeIn_5		; $07 - Loads the 1P/2P select menu
	.word Title_NewGameOnly
	.word Title_Continue
	.word Title_NewGame
	.word Title_ConfirmNo
	.word Title_ConfirmYes
	.word Title_WorldSelect
	.word Title_Reset
	.word Title_Reset
	.word Title_Reset
	.word Title_FadeIn_Alt1		; $03 - Title screen colors fade in part 1
	.word Title_FadeIn_Alt2		; $04 - Title screen colors fade in part 2
	.word Title_FadeIn_Alt3		; $05 - Title screen colors fade in part 3
	.word Title_FadeIn_Alt4		; $06 - Title screen colors fade in part 4
	.word Title_FadeIn_Alt5		; $07 - Loads the 1P/2P select menu

	; Falls into...
Title_Clear:
	vaddr $3F00
	.byte 32	; 16 bytes (colors) to follow...
	.byte $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
	.byte $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F

	vaddr $2300
	.byte $20
	.byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE
	.byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE

	vaddr $2320
	.byte $20
	.byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE
	.byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE

	vaddr $2340
	.byte $20
	.byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE
	.byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE

	vaddr $2360
	.byte $20
	.byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE
	.byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE

	vaddr $2380
	.byte $20
	.byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE
	.byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE

	vaddr $23A0
	.byte $20
	.byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE
	.byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE			
	.byte 00
	
Title_Attributes:
	vaddr $23C0
	.byte 32
	.byte %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
	.byte %00000000, %00000000, %11111111, %00000000, %01100110, %01110111, %11111111, %00000000
	.byte %01000100, %10011001, %00000000, %01110111, %10011001, %11001100, %01110111, %00000000
	.byte %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000

	vaddr $23E0
	.byte 32
	.byte %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
	.byte %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
	.byte %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
	.byte %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000, %00000000
	.byte 00

Title_Subtitle:
	vaddr $2268
	.byte 15
	.byte $7E, $6E, $6F, $9F, $7F, $6A, $6A, $7E, $FE, $7E, $7D, $8F, $9F, $7A, $7E

	vaddr $21AC
	.byte $06
	.byte $D4, $D5, $D6, $D7, $D8, $D9

	vaddr $21CC
	.byte $06
	.byte $FE, $DA, $DB, $DC, $DD, $FE

	vaddr $21EC
	.byte $06
	.byte $FE, $DA, $DB, $DC, $DD, $FE

	vaddr $220C
	.byte $06
	.byte $FE, $FA, $FB, $FC, $FD, $FE

	vaddr $222C
	.byte $06
	.byte $F4, $F5, $F6, $F7, $F8, $F9

Title_Version:
	vaddr $2381
	.byte 30
	.byte $6F, $69, $7D, $7F, $79, $7A, $6C, $6C, $0E, $6D, $0F, $7A, $6B, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $0E, $07, $3E, $99, $3E, $45, $FE
	.byte $00
	
	
Title_FadeIn_1:
	vaddr $3F00
	.byte 32	; 16 bytes (colors) to follow...
	.byte $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
	.byte $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
	.byte $00	; Terminator

Title_FadeIn_2:
	vaddr $3F00
	.byte 32	; 16 bytes (colors) to follow...
	.byte $00, $0F, $00, $01, $00, $0F, $00, $0A, $00, $0F, $00, $08, $00, $0F, $00, $06
	.byte $00, $0F, $00, $01, $00, $0F, $00, $0A, $00, $0F, $00, $08, $00, $0F, $00, $06
	.byte $00	; Terminator

Title_FadeIn_3:
	vaddr $3F00
	.byte 32	; 16 bytes (colors) to follow...
	.byte $10, $0F, $10, $11, $10, $0F, $10, $1A, $10, $0F, $10, $18, $10, $0F, $10, $16
	.byte $10, $0F, $10, $11, $10, $0F, $10, $1A, $10, $0F, $10, $18, $10, $0F, $10, $16
	.byte $00	; Terminator

Title_FadeIn_4:
	vaddr $3F00
	.byte 32	; 16 bytes (colors) to follow...
	.byte $10, $0F, $20, $21, $10, $0F, $20, $1A, $10, $0F, $20, $28, $10, $0F, $20, $16
	.byte $10, $0F, $20, $21, $10, $0F, $20, $1A, $10, $0F, $20, $28, $10, $0F, $20, $16
	.byte $00	; Terminator

Title_FadeIn_5:
	vaddr $3F00
	.byte 32	; 16 bytes (colors) to follow...
	.byte $10, $0F, $30, $21, $10, $0F, $30, $1A, $10, $0F, $30, $28, $10, $0F, $30, $16
	.byte $10, $0F, $30, $21, $10, $0F, $30, $1A, $10, $0F, $30, $28, $10, $0F, $30, $16
	.byte $00	; Terminator


Title_FadeIn_Alt1:
	vaddr $3F00
	.byte 32	; 16 bytes (colors) to follow...
	.byte $0f, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
	.byte $0f, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
	.byte $00	; Terminator

Title_FadeIn_Alt2:
	vaddr $3F00
	.byte 32	; 16 bytes (colors) to follow...
	.byte $10, $0F, $00, $0C, $00, $0F, $00, $06, $00, $0F, $00, $09, $00, $0F, $00, $05
	.byte $10, $0F, $00, $0C, $00, $0F, $00, $06, $00, $0F, $00, $09, $00, $0F, $00, $05
	.byte $00	; Terminator

Title_FadeIn_Alt3:
	vaddr $3F00
	.byte 32	; 16 bytes (colors) to follow...
	.byte $10, $0F, $10, $1C, $10, $0F, $10, $16, $10, $0F, $10, $19, $10, $0F, $10, $15
	.byte $10, $0F, $10, $1C, $10, $0F, $10, $16, $10, $0F, $10, $19, $10, $0F, $10, $15
	.byte $00	; Terminator

Title_FadeIn_Alt4:
	vaddr $3F00
	.byte 32	; 16 bytes (colors) to follow...
	.byte $10, $0F, $20, $1C, $10, $0F, $20, $26, $10, $0F, $20, $29, $10, $0F, $20, $15
	.byte $10, $0F, $20, $1C, $10, $0F, $20, $26, $10, $0F, $20, $29, $10, $0F, $20, $15
	.byte $00	; Terminator

Title_FadeIn_Alt5:
	vaddr $3F00
	.byte 32	; 16 bytes (colors) to follow...
	.byte $10, $0F, $30, $1C, $10, $0F, $30, $16, $10, $0F, $30, $29, $10, $0F, $30, $15
	.byte $10, $0F, $30, $1C, $10, $0F, $30, $16, $10, $0F, $30, $29, $10, $0F, $30, $15
	.byte $00	; Terminator

Title_Continue:
	vaddr $22AB
	.byte 08
	.byte $69, $6A, $6B, $6C, $6D, $6B, $6E, $7A
	
	vaddr $22EB
	.byte 08
	.byte $8B, $9A, $9B, $FE, $9C, $9D, $9E, $9A
	.byte 00

Title_NewGame:
	vaddr $22AB
	.byte 08
	.byte $89, $8A, $8B, $8C, $8D, $8B, $8E, $9A
	
	vaddr $22EB
	.byte 08
	.byte $6B, $7A, $7B, $FE, $7C, $7D, $7E, $7A
	.byte 00


Title_NewGameOnly:
	vaddr $22AB
	.byte 08
	.byte $6B, $7A, $7B, $FE, $7C, $7D, $7E, $7A

	vaddr $22EB
	.byte 08
	.byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE
	.byte 00	

Title_ConfirmNo:
	vaddr $22AB
	.byte 08
	.byte $69, $6A, $6B, $1F, $6D, $7F, $7E, $1E

	vaddr $22EB
	.byte 08
	.byte $FE, $2E, $9A, $2F, $FE, $6B, $6A, $FE
	.byte 00	

Title_ConfirmYes:
	vaddr $22AB
	.byte 08
	.byte $69, $6A, $6B, $1F, $6D, $7F, $7E, $1E

	vaddr $22EB
	.byte 08
	.byte $FE, $8F, $7A, $6F, $FE, $8B, $8A, $FE
	.byte 00	

Title_WorldSelect:
	vaddr $232B
	.byte 08
	.byte $7B, $6A, $7F, $BE, $BF, $FE, $FE, $FE
	.byte $00

Title_Reset:
	vaddr $3F00
	.byte 32	; 16 bytes (colors) to follow...
	.byte $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
	.byte $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F
	.byte $00	; Terminator


; Super Mario Bros. 3 Full Disassembly by Southbird 2012
; For more info, see http://www.sonicepoch.com/sm3mix/
;
; PLEASE INCLUDE A CREDIT TO THE SOUTHBIRD DISASSEMBLY
; AND THE ABOVE LINK SOMEWHERE IN YOUR WORKS :)
;
; Original disassembler source generated by DCC6502 version v1.4
; (With labels, comments, and some syntax corrections for nesasm by Southbird)
; For more info about DCC6502, e-mail veilleux@ameth.org
;
; This source file last updated: 2012-03-12 22:48:24.881635889 -0500
; Distribution package date: Fri Apr  6 23:46:16 UTC 2012
;---------------------------------------------------------------------------

; FIXME: Appears to be unused Video_Upd_Table format data??

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Map_DoInventory_And_PoofFX
;
; This is a super major function which entirely handles the
; inventory flip and usage on the map (opening, closing,
; using items, cycling items, etc.) and also manages the 
; "poof" effect that occurs when a power-up is used or a
; special item takes effect (e.g. hammer breaking lock)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Map_DoInventory_And_PoofFX:
; 	LDA Map_Powerup_Poof
; 	BEQ PRG026_A078	 ; If Map_Powerup_Poof = 0 (no powerup being applied), jump to PRG026_A078
; 	JSR Map_Poof_Update	 ; If "poof" is active, update it!

; PRG026_A078:
; 	LDA Inventory_Open
; 	BEQ PRG026_A082	 	; If Inventory_Open = 0, jump to PRG026_A082

; 	; If Inventory_Open >= 1, set "2" into Player_HaltTick (???)
; 	; This actually isn't used on the map... perhaps there was
; 	; to be in-level inventory usage once?
; 	LDA #$02	 
; 	STA Player_HaltTick	 ; Player_HaltTick = 2

; PRG026_A082:
; 	LDA InvFlip_Counter	; Call a subroutine based on the value in InvFlip_Counter
; 	JSR DynJump	 	; Dynamic jump based on LUT below...

; 	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
; 	; Jump destinations based on InvFlip_Counter:
; 	.word Inventory_DoHilites	; 0: When inventory panel is open, highlight items
; 	.word Inventory_Close		; 1: Updates video to close panel down during flip
; 	.word Inventory_DoFlipPalChange	; 2: Change colors
; 	.word Inventory_DoFlipVideoUpd	; 3: Performs video updates as panel flips open or closed (includes displaying inventory items!)
; 	.word Inventory_DoPowerupUse	; 4: Does the "poof" effect from using a power-up item (and closing the Inventory)

; Inventory_DoHilites:
; 	LDA #$2b	 
; 	STA InvFlip_VAddrHi	; VRAM Hi-byte is $2B

; 	LDA #$00	 
; 	STA InvHilite_Item 	; Hilite on first column

; 	LDX Level_Tileset	; X = Level_Tileset
; 	CPX #$07	 
; 	BEQ PRG026_A0A6	 	; If Level_Tileset = $07 (Toad House), jump to PRG026_A0A6

; 	STA InvStart_Item	; If not Toad House, Start on first row, first item

; PRG026_A0A6:
; 	LDA #$38
; 	STA InvHilite_X	 	; First item hilited

; 	LDX #$00	 
; 	STX InvFlip_Frame	; InvFlip_Frame = 0

; 	INC InvFlip_Counter	; InvFlip_Counter = 1
; 	LDA Inventory_Open	 
; 	BEQ PRG026_A0CA	 	; If Inventory_Open = 0 (it's not), jump to PRG026_A0CA (RTS)

; 	; Inventory is open...
; 	LDA InvStart_Item	; A = InvStart_Item

; PRG026_A0C3:
; 	TAX		 	; X = A (InvStart_Item + offset)
; 	LDA Inventory_Items,X	; Get this item -> A

; PRG026_A0CA:
; 	RTS		 ; Return

; InvFlip_VAddrLo_LUT:
; 	.byte $00, $60, $20, $40

; Inventory_Close:
; 	LDX Graphics_BufCnt		; X = current position in graphics buffer
	
; 	LDA InvFlip_VAddrHi		; A = VRAM High Address
; 	STA Graphics_Buffer,X		; Store into the buffer
	
; 	LDY InvFlip_Frame	 	; Y = InvFlip_Frame
	
; 	LDA InvFlip_VAddrLo_LUT,Y	; Get appropriate low byte for video address
; 	STA Graphics_Buffer+1,X	 	; Store into the buffer

; 	; This is data in the style of the Video_Upd_Table; see "Video_Upd_Table" in PRG030 for format.
; 	LDA #VU_REPEAT | 32 	
; 	STA Graphics_Buffer+2,X		; Repeat 32 times

; 	LDA #$fc	 	
; 	STA Graphics_Buffer+3,X		; Tile $FC

; 	LDA #$00	 	
; 	STA Graphics_Buffer+4,X		; Terminator

; 	LDA Graphics_BufCnt
; 	ADD #$04	 
; 	STA Graphics_BufCnt	; Graphics_BufCnt += 4

; 	INY			; Y++
; 	TYA			; A = Y
; 	AND #$03		; A is 0 to 3 
; 	STA InvFlip_Frame	; Next indexed low byte
; 	BNE PRG026_A10F	 	; If A <> 0, jump to PRG026_A10F
; 	LDX Inventory_Open	; X = Inventory_Open
; 	BEQ PRG026_A109	 	; If Inventory_Open = 0, jump to PRG026_A109
; 	LDA #$08	 	; Otherwise, A = 8 (?)

; PRG026_A109:
; 	STA InvFlip_Frame	; Update the lo index
; 	INC InvFlip_Counter	; InvFlip_Counter = 2

; PRG026_A10F:
; 	RTS		 ; Return

; 	; Palette changes for opening the Inventory
; 	; This is data in the style of the Video_Upd_Table; see "Video_Upd_Table" in PRG030 for format.
; Inventory_DoFlipPalChange:

; 	INC InvFlip_Counter	; InvFlip_Counter = 3
; 	RTS		 	; Return...

; ; This is data in the style of the Video_Upd_Table; see "Video_Upd_Table" in PRG030 for format.
; Flip_Video_Data_Opening:	; Inventory_Open = 1

; Flip_TopBarInv:	
; 	vaddr $2B00
; 	.byte $02, $FC, $80

; 	vaddr $2B02
; 	.byte VU_REPEAT | $1C, $81

; 	vaddr $2B1E
; 	.byte $02, $82, $FC

; 	.byte $00


; 	; If editing this, check out note under PRG026_A2E4, "MAGIC 12 OFFSET"
; Flip_MidTItems:	
; 	vaddr $2B20

; 	;                 W    O   R   LD   [x]
; 	.byte  32, $FC, $90, $FE
; 	.byte  "ITEMS "

; 	; Top of items start rendering here (replaced at runtime)
; 	;      Item 1         Item 2         Item 3         Item 4         Item 5         Item 6         Item 7
; 	.byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE

; 	;       |
; 	.byte $92, $FC

; 	.byte $00

; 	; If editing this, check out note under PRG026_A2E4, "MAGIC 12 OFFSET"
; Flip_MidBItems:	
; 	vaddr $2B40

; 	;                 < M >     x  [ Lives]
; 	.byte  32, $FC, $90, $FE, $FE, $FE, $FE, $FE, $FE, $FE

; 	; Bottom of items start rendering here (replaced at runtime)
; 	;      Item 1         Item 2         Item 3         Item 4         Item 5         Item 6         Item 7
; 	.byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE

; 	;       |
; 	.byte $92, $FC

; 	.byte $00

; Flip_BottomBarInv:	
; 	vaddr $2B60
; 	.byte   2, $FC, $A0
	
; 	vaddr $2B62
; 	.byte VU_REPEAT | 28, $A1

; 	vaddr $2B7E
; 	.byte 2, $A2, $FC

; 	.byte $00

; ; ******************************************************************


; ; This is data in the style of the Video_Upd_Table; see "Video_Upd_Table" in PRG030 for format.
; Flip_Video_Data_Closing:	; Inventory_Open = 0

; Flip_TopBarMid:
; 	vaddr $2B20
; 	.byte 2, $FF, $80

; 	vaddr $2B22
; 	.byte VU_REPEAT | 28, $81

; 	vaddr $2B3E
; 	.byte 2, $A2, $FF

; 	.byte $00

; Flip_BotBarMid:
; 	; Lower left corner
; 	vaddr $2B40
; 	.byte 2, $FF, $A8

; 	; Bottom bar
; 	vaddr $2B42
; 	.byte VU_REPEAT | 28, $A4

; 	; Upper right corner
; 	vaddr $2B5E
; 	.byte 2, $A5, $FF

; 	.byte $00

; Flip_EraseTopBarMid:	
; 	vaddr $2B20
; 	.byte VU_REPEAT | 32, $FF

; 	.byte $00

; Flip_EraseBotBarMid:	
; 	vaddr $2B40
; 	.byte VU_REPEAT | 32, $FF
	
; 	.byte $00

; 	; Sync with PRG030 "StatusBar" macro
; Flip_TopBarCards:
; 	vaddr $2B00
; 	.byte 2, $FC, $80

; 	vaddr $2B02
; 	.byte VU_REPEAT | 18, $81	; Bar across the top

; 	vaddr $2B14
; 	.byte 12, $81, $81, $81, $81, $81, $81, $81, $81, $81, $81, $82, $FC	; TOP SLOT ON FLIP

; 	.byte $00

; 	; Sync with PRG030 "StatusBar" macro
; 	; If editing this, check out note under PRG026_A2E4, "MAGIC 12 OFFSET"
; Flip_MidTStatCards:	
; 	vaddr $2B20

; 	.byte $20, $FE, $90, $FE, $D1, $D1, $D1, $D1, $D1, $D1, $FE, $E0, $E9, $E9, $E9, $E9	; [M/L]x  000000 c000| etc.
; 	.byte $EA, $48, $D0, $30, $30, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $92, $FC

; 	.byte $00

; 	; Sync with PRG030 "StatusBar" macro
; 	; If editing this, check out note under PRG026_A2E4, "MAGIC 12 OFFSET"
; Flip_MidBStatCards:	
; 	vaddr $2B40

; 	; Discrepency --------v  (Pattern is ... $FE, $FE ... in PRG030 status bar)  Unimportant; inserts <M> which is replaced anyway
; 	.byte $20, $FE, $90, $FE, $30, $30, $30, $30, $30, $30, $FE, $D0, $30, $30, $30, $30	; [M/L]x  000000 c000| etc.
; 	.byte $FE, $D3, $30, $30, $30, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $92, $FC
; 	; Discrepency --------^  (Pattern is ... $F0, $F0 ... in PRG030 status bar graphics)

; 	.byte $00

; 	; Sync with PRG030 "StatusBar" macro
; Flip_BottomBarCards:	
; 	vaddr $2B60
; 	.byte $02, $FC, $A0	; Lower corner

; 	vaddr $2B62
; 	.byte VU_REPEAT | 18, $A1	; Bottom bar

; 	vaddr $2B74
; 	.byte $0C, $A1, $A1, $A1, $A1, $A1, $A1, $A1, $A1, $A1, $A1, $A2, $FC	; lower corner and card bottoms

; 	.byte $00

; Flip_END:
; ; ******************************************************************

; InvGBuf_By_Open:	; Points to two different graphics buffer data blocks depending on Inventory_Open
; 	.word Flip_Video_Data_Closing, Flip_Video_Data_Opening

; FVDC .func \1-Flip_Video_Data_Closing
; FVDO .func \1-Flip_Video_Data_Opening

; Flip_Video_Offsets:
; 	; Offsets into Flip_Video_Data_Closing
; 	.byte FVDC(Flip_TopBarMid)	;  0: Draw top bar (at middle)
; 	.byte FVDC(Flip_BotBarMid)	;  1: Draw bottom bar (at middle)
; 	.byte FVDC(Flip_EraseTopBarMid)	;  2: Erase top bar (at middle)
; 	.byte FVDC(Flip_EraseBotBarMid)	;  3: Erase bottom bar (at middle)
; 	.byte FVDC(Flip_MidTStatCards)	;  4: Draw top middle row of normal status bar/cards
; 	.byte FVDC(Flip_MidBStatCards)	;  5: Draw bottom middle row of normal status bar/cards
; 	.byte FVDC(Flip_TopBarCards)	;  6: Draw top bar (at top)
; 	.byte FVDC(Flip_BottomBarCards)	;  7: Draw bottom bar (at bottom)

; 	; Offsets into Flip_Video_Data_Opening (note reuse of Closing data)
; 	.byte FVDO(Flip_TopBarMid)	;  8: Draw top bar (at middle)
; 	.byte FVDO(Flip_BotBarMid)	;  9: Draw bottom bar (at middle)
; 	.byte FVDO(Flip_EraseTopBarMid)	; 10: Erase top bar (at middle)
; 	.byte FVDO(Flip_EraseBotBarMid)	; 11: Erase bottom bar (at middle)
; 	.byte FVDO(Flip_MidTItems)	; 12: Draw top middle row of inventory
; 	.byte FVDO(Flip_MidBItems)	; 13: Draw bottom middle row of inventory
; 	.byte FVDO(Flip_TopBarInv)	; 14: Draw top bar (at top)
; 	.byte FVDO(Flip_BottomBarInv)	; 15: Draw bottom bar (at bottom)

; Flip_Video_Ends:
; 	; Ending data addresses per offset into Flip_Video_Data_Closing (when to stop copying!)
; 	.byte FVDC(Flip_BotBarMid)	; 0
; 	.byte FVDC(Flip_EraseTopBarMid)	; 1
; 	.byte FVDC(Flip_EraseBotBarMid)	; 2
; 	.byte FVDC(Flip_TopBarCards)	; 3
; 	.byte FVDC(Flip_MidBStatCards)	; 4
; 	.byte FVDC(Flip_BottomBarCards)	; 5
; 	.byte FVDC(Flip_MidTStatCards)	; 6
; 	.byte FVDC(Flip_END)		; 7

; 	; Ending data addresses per offset into Flip_Video_Data_Opening (when to stop copying!)
; 	.byte FVDO(Flip_BotBarMid)	; 8
; 	.byte FVDO(Flip_EraseTopBarMid)	; 9
; 	.byte FVDO(Flip_EraseBotBarMid)	; 10
; 	.byte FVDO(Flip_TopBarCards)	; 11
; 	.byte FVDO(Flip_MidBItems)	; 12
; 	.byte FVDO(Flip_BottomBarInv)	; 13
; 	.byte FVDO(Flip_MidTItems)	; 14
; 	.byte FVDO(Flip_TopBarMid)	; 15

; InvFlip_TileLayout_Sel:
; 	; Based on Inventory_Open
; 	.word InvCard_Tile_Layout	; When inventory closing, render cards
; 	.word InvItem_Tile_Layout	; When inventory opening, render items

; InvCard_Tile_Layout:	
; 	RTS

; 	;# INVENTORY ITEM CODE

; InvItem_Tile_Layout:
; 	; Item tiles layout when closing/unselected
; 	; NOTE: See also InvItem_Hilite_Layout
; 	; power ups
; 	;equippible items
; 	.byte $68, $69, $78, $79
; 	.byte $6A, $6B, $7A, $7B
; 	.byte $6C, $6D, $7C, $7D
; 	.byte $DC, $DD, $EC, $ED
; 	.byte $86, $87, $96, $97
; 	.byte $A4, $A5, $A6, $A7
; 	.byte $DE, $DF, $EE, $EF	; ITEM_STAR2
; 	.byte $DE, $DF, $EE, $EF	; ITEM_STAR2
; 	.byte $00, $01, $10, $11
; 	.byte $02, $03, $12, $13
; 	.byte $04, $05, $14, $15
; 	.byte $06, $07, $16, $17
; 	.byte $08, $09, $18, $19
; 	.byte $0A, $0B, $1A, $1B
; 	.byte $0C, $0D, $1C, $1D	
; 	.byte $0E, $0F, $1E, $1F

; Inventory_DoFlipVideoUpd:
; 	LDA Inventory_Open
; 	ASL A
; 	TAX		 	; X = Inventory_Open << 1

; 	; Store address to video data into Temp_Var15 based on Inventory_Open status
; 	LDA InvGBuf_By_Open,X
; 	STA <Temp_Var15	
; 	LDA InvGBuf_By_Open+1,X
; 	STA <Temp_Var16

; 	; InvFlip_Frame indexes which block of video data we'll be using...

; 	LDY InvFlip_Frame		; Y = InvFlip_Frame
; 	LDA Flip_Video_Ends,Y		; Get offset value that is the END of the video data
; 	STA <Temp_Var13			; Store into Temp_Var13

; 	LDA Flip_Video_Offsets,Y	; Get offset value that is the BEGINNING of the video data
; 	TAY		 		; Y = A

; 	LDX Graphics_BufCnt	
; 	STX <Temp_Var9			; Temp_Var9 = Graphics_BufCnt (where in Graphics_Buffer we begin)

; 	; Copy all of the video update data into the Graphics_Buffer
; PRG026_A2E4:
; 	LDA [Temp_Var15],Y	; Get next byte 
; 	STA Graphics_Buffer,X	; Store it into the buffer
; 	INX		 	; X++
; 	INY		 	; Y++
; 	CPY <Temp_Var13		
; 	BNE PRG026_A2E4	 	; While Y <> end of update data, loop!

; 	LDA Graphics_BufCnt
; 	ADD #10
; 	STA <Temp_Var13		; Temp_Var13 = Offset to 12 bytes in from where we started the graphics buffer
; 	DEX		 
; 	STX Graphics_BufCnt	; Update Graphics_BufCnt with where the buffer actually is

; 	LDA InvFlip_Frame
; 	AND #$07
; 	TAX
; 	DEX		 	; X = (InvFlip_Frame & 7) - 1
; 	SUB #$04	 	; A = (InvFlip_Frame & 7) - 4
; 	CMP #$02	 
; 	BGE PRG026_A30C	 	; If A >= 2, jump to PRG026_A30C
; 	JSR Inventory_DrawItemsOrCards	 	; Otherwise, JSR to Inventory_DrawItemsOrCards

; PRG026_A30C:
; 	JSR InvFlipFrame_UpdateStatusBar ; Update status bar as needed for flip frame
; 	INC InvFlip_Frame	; InvFlip_Frame++
; 	LDA InvFlip_Frame	 
; 	AND #$07	 
; 	BNE PRG026_A327	 	; If InvFlip_Frame & 7 <> 0, jump to PRG026_A327 (RTS)

; 	; We've reached fully open or closed!
; 	LDA Inventory_Open
; 	BNE PRG026_A324		; If fully open, jump to PRG026_A324

; 	; Fully closed!
; 	LDA #$00	 	
; 	STA InvFlip_Counter	; InvFlip_Counter = 0
; 	RTS		 	; Return!

; PRG026_A324:
; 	; Fully open...
; 	INC InvFlip_Counter	; InvFlip_Counter = 4

; PRG026_A327:
; 	RTS		 	; Return

; Inventory_DrawItemsOrCards:
; 	LDA Inventory_Open
; 	BNE PRG026_A344		; If Inventory_Open <> 0, jump to PRG026_A344

; PRG026_A336:

; 	JMP PRG026_A355	 	; Jump to PRG026_A355...

; PRG026_A344:
; 	; Inventory is opening!  Set up for inventory items!

; 	LDA #(Inventory_Items - Inventory_Items)	; Mario's inventory
; 	LDX Player_Current				; X = Player_Current
; 	BEQ PRG026_A34D					; If Player_Current = 0 (Mario), jump to PRG026_A34D
; 	LDA #(Inventory_Items2 - Inventory_Items)	; Luigi's inventory

; PRG026_A34D:
; 	ADD InvStart_Item	; Offset to the starting item
; 	STA <Temp_Var14		; Store this into Temp_Var14 (offset to first pattern in item layout)
; 	LDA #$07	 	; Number of items to display minus one

; PRG026_A355:
; 	STA <Temp_Var11		; Store number of items to display...

; 	; Set pointer to proper render items
; 	LDA Inventory_Open
; 	ASL A		 
; 	TAX		 ; X = Inventory_Open * 2 (2 byte index)
; 	LDA InvFlip_TileLayout_Sel,X
; 	STA <Temp_Var15	
; 	LDA InvFlip_TileLayout_Sel+1,X
; 	STA <Temp_Var16		; Temp_Var15/16 point to start of pattern data for inventory items / cards

; PRG026_A366:
; 	LDY <Temp_Var14	; Starting item/card offset

; 	TYA
; 	;LDA Inventory_Items,Y	; Get this item
; 	; Item/card to process...
; 	ASL A		
; 	ASL A		
; 	TAY		 	; Y = item << 2

; 	LDA InvFlip_Frame
; 	AND #$07
; 	CMP #$04	 
; 	BEQ PRG026_A37D	 	; If currently on InvFlip_Frame = 4 or 12 (drawing the top half of items/cards), jump to PRG026_A37D

; 	; On frame 5, the bottom half of the object/card is drawn in
; 	TYA		 
; 	ORA #$02	 
; 	TAY		 	; Y (item offset) OR'd with 2 (do the bottom half of the object!)

; PRG026_A37D:

; 	; This loop copies two bytes of the item/card
; 	; into the buffer; the graphic is made up of 4 bytes,
; 	; but in a single row of 8x8s, it's two at a time :)
; 	LDX <Temp_Var13		; X = Temp_Var13 (offset into the graphics buffer)
; PRG026_A37F:
; 	LDA [Temp_Var15],Y	; Get next tile for this power-up
; 	STA Graphics_Buffer,X	; Store it into the graphics buffer
; 	INX		 	; X++
; 	INY		 	; Y++
; 	TYA		 	
; 	AND #$01	 	; A = Y & 1
; 	BNE PRG026_A37F	 	; If A <> 0, loop (loops for two bytes)

; PRG026_A38B:
; 	LDA <Temp_Var13		; X = Temp_Var13 (offset into the graphics buffer)
; 	ADD #$03
; 	STA <Temp_Var13		; Temp_Var13 += 3 (2 for the power-up, 1 for spacing)
; 	INC <Temp_Var14	; Next item!
; 	DEC <Temp_Var11		; One less item left to display...
; 	BPL PRG026_A366	 	; While Temp_Var11 >= 0, loop!

; PRG026_A398:

; InvFlipFrame_DoNothing:
; 	RTS		 	; Return...


; InvFlipFrame_UpdateStatusBar:
; 	LDA InvFlip_Frame
; 	AND #$07
; 	JSR DynJump

; 	; THESE MUST BE HERE FOR DynJump TO WORK!
; 	.word InvFlipFrame_DoNothing		; 0
; 	.word InvFlipFrame_DoNothing		; 1
; 	.word InvFlipFrame_DoNothing		; 2
; 	.word InvFlipFrame_DoNothing		; 3
; 	.word InvFlipFrame_DrawWorldCoins	; 4
; 	.word InvFlipFrame_DrawMLLivesScore	; 5
; 	.word InvFlipFrame_DoNothing		; 6
; 	.word InvFlipFrame_DoNothing		; 7

; InvFlipFrame_DrawWorldCoins:
; 	RTS		 ; Return

; InvFlipFrame_DrawMLLivesScore:
; 	RTS		 ; Return

; ; These tables really define a lot of behavior for the inventory item menu
; InvItem_AddSub:		.byte 8, -8	; Press down to go forward 7 items, up to go back 7 items
; InvItem_IndexOOR:	.byte 16, -8	; Out-of-range index values for wrap-around when pressing down/up
; InvItem_Wrap:		.byte 0, 8	; Wrap-around values for Inventory start
; InvItem_NextPrior:	.byte 24, -24	; Whether left or right was pressed, how to add/sub the highlight X position
; InvItem_HiliteOORX:	.byte $F8, $20	; Highlight out-of-range X position to tell when at ends, for right/left
; InvItem_HiliteMinMax:	.byte $38, $E0	; Highlight left min and right max for right/left overflows
; InvItem_RightLeft:	.byte 1, -1	; Whether right or left was pressed, how to inc/dec the highlight index
; InvItem_RightLeftMinMax:.byte 0, 7	; Right/left overflows wrap-around index value
; InvItem_PerPlayerOff:	.byte $00, (Inventory_Items2 - Inventory_Items)	; Offset per player
; Inventory_DoPowerupUse:
; 	LDA Map_Powerup_Poof
; 	BNE PRG026_A398	 	; If no power-up "poof" effect occurring, jump to PRG026_A398 (RTS)

; 	LDA <Map_UseItem
; 	BEQ PRG026_A41A	 	; If Map_UseItem = 0 (not using item), jump to PRG026_A41A
; 	JMP PRG026_A4FC	 	; Otherwise, jump to PRG026_A4FC

; PRG026_A41A:
; 	; Not using item
; 	LDA Pad_Input	 ; Get Player 
; 	AND #(PAD_B | PAD_START)	; B or START close the Inventory panel
; 	BEQ PRG026_A436	 ; If neither B nor START are pressed, jump to PRG026_A436

; 	; Need to close the panel
; 	LDA #SND_MAPINVENTORYFLIP	 
; 	STA Sound_QMap	 	; Play inventory flip sound
; Inventory_ForceFlip:
; 	LDA Inventory_Open	
; 	EOR #$01	 
; 	STA Inventory_Open	; Inventory_Open ^= 1 (set to opposite)
; 	LDA #$00	 
; 	STA InvFlip_Counter	; Reset Inventory_Open
; 	JMP Inventory_DoHilites	; Jump to Inventory_DoHilites

; PRG026_A436:
; 	; Neither B nor START pressed
; 	LDA Pad_Input
; 	AND #(PAD_DOWN | PAD_UP)
; 	BEQ PRG026_A491	 	; If neither up nor down pressed, jump to PRG026_A491

; 	; Up or Down pressed...
; 	LSR A
; 	LSR A
; 	LSR A
; 	TAY		 	; Y = Pad_Input >> 3 (will be 0 if down, 1 if up)
; 	LDA #SND_LEVELBLIP	 
; 	STA Sound_QLevel1	; Play item select sound

; 	LDA InvStart_Item	; A = InvStart_Item
; 	ADD InvItem_AddSub,Y	; +/- 7 based on up/down

; 	STA InvStart_Item	; Update InvStart_Item
; 	CMP InvItem_IndexOOR,Y
; 	BNE PRG026_A45B	 	; If we haven't hit the max or min, jump to PRG026_A45B

; 	; We've hit a limit!
; 	LDA InvItem_Wrap,Y
; 	STA InvStart_Item	; Wrap-around

; PRG026_A45B:
; 	LDX InvStart_Item	; X = InvStart_Item
; 	LDA Player_Current	; A = Player_Current
; 	BEQ PRG026_A468	 	; If Player_Current = 0 (Mario), jump to PRG026_A468
; 	TXA			; A = InvStart_Item
; 	ADD #(Inventory_Items2 - Inventory_Items)	 ; Offset to Luigi's items
; 	TAX			; X = offset to item

; PRG026_A468:
; 	LDY Player_Current		; Y = Player_Current
; 	TXA		 		; A = starting of the row Inventory item
; 	CMP InvItem_PerPlayerOff,Y	; If it's the very first item of this player (just wrapped around)
; 	BEQ PRG026_A476	 		; If so, jump to PRG026_A476
; PRG026_A476:
; 	TXA
	
; Inventory_ForceUpdate_AndFlip:
; 	LDA #$0c	 		
; 	STA InvFlip_Frame	 	; InvFlip_Frame = $0C
; 	LDA #$03	 	
; 	STA InvFlip_Counter	 	; InvFlip_Counter = 3
; 	LDA #$00	 
; 	STA InvHilite_Item	 	; InvHilite_Item = 0 (first item highlighted on new row)
; 	LDA #$38	 
; 	STA InvHilite_X			; InvHilite_X = $48 (first item highlighted on new row)
; 	RTS		 	; Return...

; PRG026_A491:
	
; 	; Neither B nor START nor Up nor Down pressed...
; 	LDY #$00		; Y = 0
; 	LDX Player_Current	; X = Player_Current
; 	BEQ PRG026_A4A1		; If Player_Current = 0 (Mario), jump to PRG026_A4A1
; 	LDY #(Inventory_Items2 - Inventory_Items)	 ; Offset to Luigi's items

; PRG026_A4A1:

; 	LDA <Pad_Input	 
; 	AND #(PAD_LEFT | PAD_RIGHT)	 
; 	BEQ PRG026_A4F6	 	; If neither left nor right is pressed, jump to PRG026_A4F6

; 	LSR A		 	; Diminish to 0/1 condition (right = 0, left = 1)
; 	TAX		 	; Move result to X

; 	LDA #SND_LEVELBLIP	 
; 	STA Sound_QLevel1	; Play item selection sound

; PRG026_A4B4:
; 	LDA InvHilite_Item
; 	ADD InvItem_RightLeft,X	; Inc/Dec InvHilite_Item appropriately
; 	STA InvHilite_Item	; Update InvHilite_Item

; 	LDA InvHilite_X	
; 	ADD InvItem_NextPrior,X	; Add/Sub to highlight X as appropriate
; 	STA InvHilite_X	  	; Update InvHilite_X

; 	CMP InvItem_HiliteOORX,X	
; 	BNE PRG026_A4D9	 	; If we have NOT hit an item limit, jump to PRG026_A4D9

; 	; Properly wrap the item selection around to the left or right side
; 	LDA InvItem_RightLeftMinMax,X
; 	STA InvHilite_Item	
; 	LDA InvItem_HiliteMinMax,X
; 	STA InvHilite_X	 	

; PRG026_A4D9:
; 	JMP Inv_Display_Hilite

; PRG026_A4F6:
; 	LDA <Pad_Input		
; 	AND #PAD_A
; 	BEQ PRG026_A511	 	; If Player is NOT pressing A, jump to PRG026_A511

; PRG026_A4FC:
; 	LDA InvHilite_Item
; 	ADD InvStart_Item
; 	TAY		 	; Y = InvHilite_Item + InvStart_Item

; 	LDA Player_Current
; 	BEQ PRG026_A50E	 	; If Player_Current = 0 (Mario), jump to PRG026_A50E
; 	TYA		 	
; 	ADD #(Inventory_Items2 - Inventory_Items)
; 	TAY		 	; Y += Luigi offset

; PRG026_A50E:
; 	JMP Inv_UseItem_Powerup	 ; Use item and don't come back!

; PRG026_A511:
; 	JMP Inv_Display_Hilite	 ; Highlight item and don't come back!

; ;#INVENTORY ITEM PALETTE
; InvItem_Pal: 
; 	; Per-Item LUT
; 	;	0    1    2    3    4    5    6    7    8    9   10   11   12   13
; 	;items
; 	.byte $FF, $0F, $30, $16
; 	.byte $FF, $0F, $30, $1A
; 	.byte $FF, $0F, $30, $06
; 	.byte $FF, $0F, $30, $1A
; 	.byte $FF, $0F, $30, $1A
; 	.byte $FF, $0F, $30, $27
; 	.byte $FF, $0F, $30, $1A
; 	.byte $FF, $0F, $30, $27
; 	;badges
; 	.byte $00, $01, $10, $11
; 	.byte $02, $03, $12, $13
; 	.byte $04, $05, $14, $15
; 	.byte $06, $07, $16, $17
; 	.byte $08, $09, $18, $19
; 	.byte $0A, $0B, $1A, $1B
; 	.byte $0C, $0D, $1C, $1D	
; 	.byte $0E, $0F, $1E, $1F	
	

; InvItem_SetColor:
; 	; Inventory is open ... assign proper color for item that is highlighted
; 	LDX Level_Tileset	; X = Level_Tileset
; 	CPX #$07	 	
; 	BEQ PRG026_A539	 	; If Level_Tileset = 7 (Toad House), jump to PRG026_A539 (RTS)

; 	ASL A
; 	ASL A
; 	TAX		 	; A = Current inventory item selected

; 	LDA InvItem_Pal + 1,X	; Get the color that will be used for this item
; 	STA Palette_Buffer+$15	; Store it into the palette buffer

; 	LDA InvItem_Pal + 2,X	; Get the color that will be used for this item
; 	STA Palette_Buffer+$16	; Store it into the palette buffer

; 	LDA InvItem_Pal + 3,X	; Get the color that will be used for this item
; 	STA Palette_Buffer+$17	; Store it into the palette buffer 

; 	LDA #$06		
; 	STA <Graphics_Queue	; Update the palette when capable

; PRG026_A539:
; 	RTS		 ; Return

; Inv_UseItem_Powerup:
; 	LDA InvHilite_Item
; 	ADD InvStart_Item
; 	TAX		 	; Y = InvHilite_Item + InvStart_Item (currently highlighted item)

; 	LDA Inventory_Items,X	; Get the item (should be a POWER-UP item, Super Mushroom to P-Wing only)
; 	BNE Inv_UseItem_Powerup1

; 	; play error sound
; 	RTS

; Inv_Item_Map:

; Inv_UseItem_Powerup1:
	
; 	DEC Inventory_Items, X
; 	LDA Inv_Item_Map, X
; 	STA Player_Badge

; 	LDA #$14	 
; 	STA Map_Powerup_Poof	 	; Map_Powerup_Poof = $14
; 	LDX Player_Current	 	; X = Player_Current

; 	; Target "Map Poof" on active Player
; 	LDA <World_Map_Y,X
; 	STA <MapPoof_Y	

; 	LDA <World_Map_X,X
; 	STA <MapPoof_X	
; 	RTS
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ; Map_Poof_Update
; ;
; ; Updates map "poof" effect, including decrementing
; ; Map_Powerup_Poof and inserting the sprites to be
; ; displayed based on the current count...
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Map_Poof_Tiles:
; 	; "Outer" and "Inner" tiles for the map poof sprites
; 	.byte $49, $41
; 	.byte $49, $39
; 	.byte $49, $35
; 	.byte $49, $31
; 	.byte $45, $47
; 	.byte $45, $47

; Map_Poof_Update:
; 	LDA <MapPoof_Y	
; 	SUB #$08	 	; Center Map Poof

; 	; Four pieces with identical Y
; 	STA Sprite_RAM+$60
; 	STA Sprite_RAM+$64
; 	STA Sprite_RAM+$68
; 	STA Sprite_RAM+$6C

; 	; Four pieces with identical Y (offset 16 from the above)
; 	ADD #16			
; 	STA Sprite_RAM+$70
; 	STA Sprite_RAM+$74
; 	STA Sprite_RAM+$78
; 	STA Sprite_RAM+$7C

; 	LDY #$00	 	; Y = 0
; 	LDA <MapPoof_X	
; 	SUB <Horz_Scroll	; Offset poof effect based on horizontal scroll
; 	SUB #$08	 	; Center horizontally

; 	; This will loop through to position each piece of the poof sprite
; 	; horizontally, spaced 8 pixels apart.
; PRG026_A7EA:
; 	STA Sprite_RAM+$63,Y	; Upper and...
; 	STA Sprite_RAM+$73,Y	; ... lower sprites with same X coordinate
; 	ADD #$08	 	; X coordinate += 8 (next poof sprite over)
; 	INY
; 	INY
; 	INY
; 	INY		 ; Y += 4 (next sprite)
; 	CPY #16
; 	BNE PRG026_A7EA	 ; Loop while Y < 16 (8 sprites total, doing 2 at a time)

; 	; The four "corners" of the poof, pieces of the sprite
; 	; flipped as appropriate...
; 	LDA #$03
; 	STA Sprite_RAM+$62
; 	STA Sprite_RAM+$66

; 	LDA #$43
; 	STA Sprite_RAM+$6A
; 	STA Sprite_RAM+$6E

; 	LDA #$83
; 	STA Sprite_RAM+$72
; 	STA Sprite_RAM+$76

; 	LDA #$c3
; 	STA Sprite_RAM+$7A
; 	STA Sprite_RAM+$7E

; 	LDA Map_Powerup_Poof
; 	AND #$1c	 	; Constrain the value of Map_Powerup_Poof, only change every 4 units
; 	LSR A		 	; A >> 1 (2 tiles per valid change in Map_Powerup_Poof)
; 	TAY		 	; Y = A

; 	; Tile for "outer" poof sprites
; 	LDA Map_Poof_Tiles,Y
; 	STA Sprite_RAM+$61
; 	STA Sprite_RAM+$6D
; 	STA Sprite_RAM+$71
; 	STA Sprite_RAM+$7D

; 	; Tile for "inner" poof sprites
; 	LDA Map_Poof_Tiles+1,Y
; 	STA Sprite_RAM+$65
; 	STA Sprite_RAM+$69
; 	STA Sprite_RAM+$75
; 	STA Sprite_RAM+$79

; 	DEC Map_Powerup_Poof	; Decrease "poof" effect
; 	LDA Map_Powerup_Poof	
; 	BNE PRG026_A84B	 	; If Map_Powerup_Poof <> 0, jump to PRG026_A84B (RTS)

; 	JMP Inventory_ForceFlip	; When poof has completed, inventory is closed

; PRG026_A84B:
; 	RTS		 ; Return
; ; #INVENTORY SPRITES
; InvItem_Hilite_Layout:
; 	; Item sprite tiles layout when highlighted
; 	; NOTE: See also InvItem_Tile_Layout
; 	; NOTE: If both tile values are equal, the right
; 	;        half is horizontally flipped
; 	.byte $FF, $FF		; Empty
; 	.byte $C1, $C1
; 	.byte $C3, $C5
; 	.byte $C7, $C7
; 	.byte $C9, $C9
; 	.byte $CB, $CB
; 	.byte $CD, $CD
; 	.byte $CF, $D1
; 	.byte $D3, $D3
; 	.byte $D1, $D1
; 	.byte $D3, $D3
; 	.byte $D5, $D7
; 	.byte $EF, $F1
; 	.byte $F3, $F3
; 	.byte $DD, $DF
; 	.byte $E1, $E3
; 	.byte $E7, $E9
; 	.byte $E5, $E5
; 	; Shield
; 	.byte $D9, $DB

; Inv_Display_Hilite:
; 	LDA InvHilite_Item
; 	ADD InvStart_Item
; 	TAY	
; 	LDA Inventory_Items,Y	
; 	;JSR ToThreeDigits

; 	; Use palette 3 for both
; 	LDA #SPR_PAL1
; 	STA Sprite_RAM+02
; 	STA Sprite_RAM+06
; 	STA Sprite_RAM+10
; 	STA Sprite_RAM+22
; 	STA Sprite_RAM+26

; 	LDA #(SPR_PAL1 | SPR_HFLIP)
; 	STA Sprite_RAM+14

; 	LDA #(SPR_PAL1 | SPR_VFLIP)
; 	STA Sprite_RAM+18
	

; 	LDA #(SPR_PAL1 | SPR_VFLIP | SPR_HFLIP)
; 	STA Sprite_RAM+30

; 	LDA #$c0
; 	STA Sprite_RAM+00
; 	STA Sprite_RAM+04
; 	STA Sprite_RAM+08
; 	STA Sprite_RAM+12

; 	LDA #$d0
; 	STA Sprite_RAM+16
; 	STA Sprite_RAM+20
; 	STA Sprite_RAM+24
; 	STA Sprite_RAM+28

; 	LDA InvHilite_X
; 	SUB #$08
; 	STA Sprite_RAM+03
; 	STA Sprite_RAM+19

; 	ADD #$08
; 	STA Sprite_RAM+07
; 	STA Sprite_RAM+23

; 	ADD #$08
; 	STA Sprite_RAM+11
; 	STA Sprite_RAM+27

; 	ADD #$08
; 	STA Sprite_RAM+15
; 	STA Sprite_RAM+31

; 	LDA #$F5
; 	STA Sprite_RAM+1
; 	STA Sprite_RAM+13
; 	STA Sprite_RAM+17
; 	STA Sprite_RAM+29

; 	LDA #$F7
; 	STA Sprite_RAM+5
; 	STA Sprite_RAM+9
	
; 	LDX <Temp_Var2
; 	LDA NumberSpriteMap, X
; 	STA Sprite_RAM+21
; 	LDX <Temp_Var3
; 	LDA NumberSpriteMap, X
; 	STA Sprite_RAM+25
; 	RTS		 	; Return...

; NumberSpriteMap:
; 	.byte $A1, $A3, $A5, $A7, $A9, $AB, $AD, $AF, $B1, $B3

; Map_Poof_To_Row:
; 	; Convert a Map Poof Y coordinate to a row LUT
; 	.byte $20, $30, $40, $50, $60, $70, $80

; Map_Completion_Bit:
; 	; Set proper map "completion" bit based on row
; 	.byte $80, $40, $20, $10, $08, $04, $02, $01

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ; Map_SetCompletion_By_Poof
; ;
; ; Set completion bit on map for the CURRENT Player based on the location
; ; of the map "poof" effect (from using a hammer); does not actually do 
; ; graphics or RAM alteration to map, however.  Just marks completion bit 
; ; for future reloads of the map...
; ;
; ; 'X' is set to the row where the rock existed
; ; 'Y' is set to the offset for the map completion for the CURRENT Player
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Map_SetCompletion_By_Poof:	; $A8D4

; 	; This loop will determine what row to mark completion on based on
; 	; the Y coordinate of the "map poof"
; 	LDY #6	
; 	LDA <Temp_Var1		; A = Temp_Var1 (Map Poof Y)
; PRG026_A8D8:
; 	CMP Map_Poof_To_Row,Y	; Compare Map Poof Y to this value
; 	BEQ PRG026_A8E2		; If it matches, jump to PRG026_A8E2
; 	DEY			; Y--
; 	BPL PRG026_A8D8		; While Y >= 0, loop!

; 	; If it doesn't match, use Y = 7 (which amounts to the last row anyway, but SHOULDN'T HAPPEN)
; 	LDY #7
; PRG026_A8E2:
; 	STY <Temp_Var5		; Temp_Var5 = Y
; 	LDA <Temp_Var2		; A = current screen (map X Hi byte)
; 	ASL A
; 	ASL A
; 	ASL A
; 	ASL A
; 	STA <Temp_Var4		; Temp_Var4 = Temp_Var2 << 4
; 	LDA <Temp_Var3		
; 	LSR A
; 	LSR A
; 	LSR A
; 	LSR A
; 	ORA <Temp_Var4	 	; A = Temp_Var3 >> 3 (Map Poof X, div 16) OR'd with Temp_Var4 (row is upper 4 bits, column is lower 4 bits)
; 	TAY		 	; Y = A
; 	LDX Player_Current	; X = Player_Current
; 	BEQ PRG026_A8FF	 	; If Player_Current = 0 (Mario), jump to PRG026_A8FF
; 	TYA		 	; 
; 	ADD #$40	 	; 
; 	TAY		 	; Y += $40 for Luigi (Luigi's clear bits are 64 ahead of Mario's)

; PRG026_A8FF:
; 	LDX <Temp_Var5		; X = row on which the rock existed
; 	RTS		 	; Return!

	; Per-world Big [?] block areas

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; HandleLevelJunction
;
; Fades out the screen, sets up the pointers, and loads a new
; area!  And some other tedious things as required to swap out
; to a different level and potentially swap back in later...
;
; Used for all bonus areas, alternate exits, whatever!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
HandleLevelJunction:
	; Fades out the screen
	JSR Palette_PrepareFadeOut	 ; Prepare

PRG026_A936:
	JSR GraphicsBuf_Prep_And_WaitVSync	; Wait VSync
	JSR Palette_DoFadeOut	; Fade
	LDA Fade_Level
	BNE PRG026_A936	 ; While Fade_Level > 0, loop

	LDA #%00011000	 	; Show sprites + BG
	STA <PPU_CTL2_Copy

	JSR GraphicsBuf_Prep_And_WaitVSync	; Wait VSync

	LDA #$00
	STA PPU_CTL2	 	; Disable display
	STA Level_AScrlConfig	; Level_AScrlConfig = 0

	; Stop Update_Select activity temporarily
	INC UpdSel_Disable

	JSR LevelJct_General	 ; Do what's appropriate for the Level Junction!

	LDA <Horz_Scroll
	STA Level_Jct_HS	 ; Level_Jct_HS = Horz_Scroll

	LDA <Horz_Scroll_Hi
	STA Level_Jct_HSHi	 ; Level_Jct_HSHi = Horz_Scroll_Hi

	LDA <Vert_Scroll
	STA Level_Jct_VS	 ; Level_Jct_VS = Vert_Scroll

	LDA <Vert_Scroll_Hi
	STA Level_Jct_VSHi	 ; Level_Jct_VSHi = Vert_Scroll_Hi

	LDA #$01
	STA Map_ReturnStatus	; Map_ReturnStatus = 1 (??)

	; Scroll_Cols2Upd = 32 (full dirty scroll update sweep)
	LDA #32
	STA Scroll_Cols2Upd


	; For this next part, the appropriate scroll column counter 
	; (based on which way the system last scrolled) is faked out
	; to think it is behind a whole screen (how mean!) to force
	; a "dirty" update after we transition...

	LDX <Scroll_LastDir
	BNE PRG026_A982	 	; If screen last moved left (1), jump to PRG026_A982

	; X = Scroll_LastDir = 0 (Screen last moved right)

	LDA <Scroll_ColumnR
	SUB #16
	STA <Scroll_ColumnR	; Scroll_ColumnR -= 16 (pretend we have a whole screen to the right to update)

	JMP PRG026_A989	 ; Jump to PRG026_A989

PRG026_A982:

	; X = Scroll_LastDir = 1 (Screen last moved left)

	LDA <Scroll_ColumnL
	ADD #16
	STA <Scroll_ColumnL	; Scroll_ColumnL += 16 (pretend we have a whole screen to the left to update)

PRG026_A989:
	LDA Level_JctCtl
	CMP #$02
	BEQ PRG026_A995	 ; If Level_JctCtl = 2 (Big Question Block bonus area), jump to PRG026_A995

	; The Big Question Block bonus area locks horizontal scrolling,
	; but everyone else is free to set it correctly!
	;LDA Level_Jct_HS
	;STA <Horz_Scroll	 ; Horz_Scroll = Level_Jct_HS

PRG026_A995:
	JMP PRG030_897B	 ; Jump to PRG026_897B (continue preparation of display!)


LevelJct_General:	

	LDA #$00
	STA Level_7Vertical
		; Toggle Level_JctFlag
	LDA Level_JctFlag
	EOR #$01
	STA Level_JctFlag

PRG026_AB0E:
	
	; Common (regular and vertical level) continue point...

	LDA <Horz_Scroll
	STA <Scroll_Temp	; Scroll_Temp = Horz_Scroll
	LDA <Horz_Scroll_Hi	; A = Horz_Scroll_Hi

	JMP Scroll_Update_Ranges ; Set scrolling appropriately!

	; For levels which employ the "generic exit" pipe at the end


StatusBar_FullPalette:
	.byte $30, $11, $27, $00
	.byte $30, $14, $27, $00
	.byte $30, $15, $27, $00
	.byte $30, $06, $27, $00
	.byte $30, $17, $27, $00
	.byte $30, $0A, $27, $00
	.byte $30, $0C, $27, $00
	.byte $30, $2D, $2D, $00

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Palette_PrepareFadeIn
;
; This subroutine is called prior to performing a palette
; fade-in.  It configures the initial version of the buffer
; with all of the darkest shades of colors.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Palette_PrepareFadeIn:
	CLC			; signals to use "fade in" prep code 

Palette_PrepareFadeOut_Entry:	; entry point when preparing to fade out!

	; Set the palette address to the beginning of palettes, $3F00
	LDA #$3f	 
	STA Palette_AddrHi

	LDA #$00	 
	STA Palette_AddrLo

	STA Palette_Term	 ; Palette_Term = 0, Terminate the palette data

	LDA #32
	STA Palette_BufCnt	 ; Loading 32 colors

	; Prepare all 31 colors in their darkest shades!
	LDY #31		 ; Y = 31
PRG026_ABB8:
	PHP		 ; Save processor status

	LDA Pal_Data,Y	 ; Get next byte of target palette data

	BCS PRG026_ABC5	 ; If carry is set (fade out), jump to PRG026_ABC5 (fade out needs the colors as they're to be targeted!)

	SUB #$30	 ; Otherwise, A -= $30 (darkest shade of this color)
	BCS PRG026_ABC5	 ; If we didn't go "less than black", jump to PRG026_ABC5
	LDA #$0f	 ; Otherwise, A = $F (black)

PRG026_ABC5:
	PLP		 ; Restore processor status

	STA Palette_Buffer,Y	; Copy this byte of palette data to the buffer
	DEY		 	; Y--
	BPL PRG026_ABB8	 	; While Y >= 0, loop!

	LDA #$04
	STA Fade_Level	 ; Fade_Level = 4
	STA Fade_Tick	 ; Fade_Tick = 0
	INC Fade_State	 ; Fade_State = 1 (Fade in)

	LDA #$06	 
	STA <Graphics_Queue	 ; Reset the graphics buffer
	RTS		 ; Return

Palette_DoFadeIn:
	LDA Fade_Tick	 
	BEQ PRG026_ABE4	 ; If Fade_Tick = 0, jump to PRG026_ABE4

	DEC Fade_Tick	 ; Otherwise, Fade_Tick--

PRG026_ABE4:
	LDA Fade_Level	 
	BNE Not_FadeLevel
	
	JMP PRG026_AC1A	 ; If Fade_Level = 0, jump to PRG026_AC1A

Not_FadeLevel:
	LDA Fade_Tick
	BEQ Not_FadeTick 

	JMP PRG026_AC19	 ; If Fade_Tick <> 0, jump to PRG026_AC19

Not_FadeTick:
	LDA #$04	
	STA Fade_Tick	 ; Fade_Tick = 4 (reload) 

	DEC Fade_Level	 ; Fade_Level--

	LDY #31		 ; Y = 31

PRG026_ABF8:
	LDA Palette_Buffer,Y	; Get next byte of palette data 
	CMP #$0f	 	; Is this color black?
	BNE PRG026_AC07	 	; If not, jump to PRG026_AC07

	LDA Pal_Data,Y	 ; Get the target byte
	AND #$0f	 ; Gets the darkest shade of this color
	JMP PRG026_AC0F	 ; Jump to PRG026_AC0F

PRG026_AC07:
	CMP Pal_Data,Y	 ; Compare this against the target palette byte
	BEQ PRG026_AC12	 ; If we reached the target, jump to PRG026_AC12
	ADD #$10	 ; Otherwise, add $10 (brighter)

PRG026_AC0F:
	STA Palette_Buffer,Y	 ; Update the buffer!
	

PRG026_AC12:
	DEY		 ; Y--
	BPL PRG026_ABF8	 ; While Y >= 0, loop!

	LDA Game_Options
	AND #$E0
	LSR A
	LSR A
	LSR A
	TAX

	LDA StatusBar_Palette
	CMP #$0F
	BNE StatusBar_FI_NotBlack

	LDA StatusBar_FullPalette, X
	AND #$0F
	BNE StatusBar_FI_StorePalette

StatusBar_FI_NotBlack:
	CMP StatusBar_FullPalette, X
	BEQ StatusBar_FI_StorePalette

	ADD #$10

StatusBar_FI_StorePalette:	
	STA StatusBar_Palette

	LDA StatusBar_Palette + 1
	CMP #$0F
	BNE StatusBar_FI_NotBlack1

	LDA StatusBar_FullPalette + 1, X
	AND #$0F
	BNE StatusBar_FI_StorePalette1

StatusBar_FI_NotBlack1:
	CMP StatusBar_FullPalette + 1, X
	BEQ StatusBar_FI_StorePalette1

	ADD #$10

StatusBar_FI_StorePalette1:	
	STA StatusBar_Palette + 1

	LDA StatusBar_Palette + 2
	CMP #$0F
	BNE StatusBar_FI_NotBlack2

	LDA StatusBar_FullPalette + 2, X
	AND #$0F
	BNE StatusBar_FI_StorePalette2

StatusBar_FI_NotBlack2:
	CMP StatusBar_FullPalette + 2, X
	BEQ StatusBar_FI_StorePalette2

	ADD #$10

StatusBar_FI_StorePalette2:	
	STA StatusBar_Palette + 2

	LDA #$06	 
	STA <Graphics_Queue	 ; Queue graphics routine 6

PRG026_AC19:
	RTS		 ; Return


PRG026_AC1A:
	LDA #$00	 
	STA Fade_State	 ; Fade_State = 0
	RTS		 ; Return


Palette_PrepareFadeOut:
	LDA FadeOut_Cancel
	BNE PRG026_AC29	 	; If FadeOut_Cancel <> 0, jump to PRG026_AC29 (RTS)

	SEC			; signals to use "fade out" prep code		 
	JMP Palette_PrepareFadeOut_Entry

PRG026_AC29:
	RTS		 ; Return

Palette_DoFadeOut:
	LDA FadeOut_Cancel
	BNE PRG026_AC60	 ; If FadeOut_Cancel <> 0, jump to PRG026_AC60

	LDA Fade_Tick
	BEQ PRG026_AC37	 ; If Fade_Tick = 0, jump to PRG026_AC37

	DEC Fade_Tick	 ; Fade_Tick--

PRG026_AC37:
	LDA Fade_Level
	BEQ PRG026_AC60	 ; If Fade_Level = 0, jump to PRG026_AC60

	LDA Fade_Tick
	BNE PRG026_AC5F	 ; If Fade_Tick <> 0, jump to PRG026_AC5F

	LDA #$04
	STA Fade_Tick	 ; Fade_Tick = 4

	DEC Fade_Level	 ; Fade_Level--

	; For all palette colors...
	LDY #31
PRG026_AC4B:
	LDA Palette_Buffer,Y	; Get this color
	SUB #16		 	; Subtract 16 from it
	BPL PRG026_AC55	 	; If we didn't go below zero, jump to PRG026_AC55

	LDA #$0f	 	; Otherwise, set it to safe minimum

PRG026_AC55:
	STA Palette_Buffer,Y	; Update palette color
	DEY		 	; Y--
	BPL PRG026_AC4B	 	; While Y >= 0, loop!

	LDA StatusBar_Palette
	CMP #$0F
	BEQ StatusBar_FO_StorePalette

	SUB #$10
	BPL StatusBar_FO_StorePalette

	LDA #$0F

StatusBar_FO_StorePalette:
	STA StatusBar_Palette

	LDA StatusBar_Palette + 1
	CMP #$0F
	BEQ StatusBar_FO_StorePalette1

	SUB #$10
	BPL StatusBar_FO_StorePalette1

	LDA #$0F

StatusBar_FO_StorePalette1:
	STA StatusBar_Palette + 1

	LDA StatusBar_Palette + 2
	CMP #$0F
	BEQ StatusBar_FO_StorePalette2

	SUB #$10
	BPL StatusBar_FO_StorePalette2

	LDA #$0F

StatusBar_FO_StorePalette2:
	STA StatusBar_Palette + 2
			
	; Update palette
	LDA #$06
	STA <Graphics_Queue

PRG026_AC5F:
	RTS		 ; Return

PRG026_AC60:
	; Fade out cancellation request

	LDA #$00
	STA Fade_State
	STA FadeOut_Cancel
	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Palette_FadeIn
;
; This performs the palette fade-in routine
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Palette_FadeIn:		; AC69
	JSR Palette_PrepareFadeIn	 ; Prepare to fade in!

	; Some kind of hardware thing??
	; LDA #$00
	; STA PPU_VRAM_ADDR
	; STA PPU_VRAM_ADDR

	; LDA #$10
	; STA PPU_VRAM_ADDR
	; STA PPU_VRAM_ADDR

	; LDA #$00
	; STA PPU_VRAM_ADDR
	; STA PPU_VRAM_ADDR

	; LDA #$10
	; STA PPU_VRAM_ADDR
	; STA PPU_VRAM_ADDR

PRG026_AC8C:
	LDA PPU_STAT	 ; Get PPU_STAT
	AND #$80	 
	BNE PRG026_AC8C	 ; If VBlank is NOT occurring, loop!

	LDA #%10101000	 ; PT2 is sprites, use 8x16 sprites, generate VBlanks

	; Update PPU_CTL1 and local copy
	STA PPU_CTL1	 
	STA <PPU_CTL1_Copy

	LDA #%00011000	 	; Show sprites + BG
	STA <PPU_CTL2_Copy

PRG026_AC9E:
	; Update the palette based on the buffer
	JSR GraphicsBuf_Prep_And_WaitVSync

	JSR Palette_DoFadeIn	; Do the fade in
	LDA Fade_Level	 
	BNE PRG026_AC9E	 	; If fade-in not complete, go around again!

	RTS		 	; Return...


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Palette_FadeOut
;
; This performs the palette fade-out routine
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Palette_FadeOut:
	JSR Palette_PrepareFadeOut	; Prepare to fade out!

	; Wait for V-Blank
PRG026_ACAD:
	LDA PPU_STAT
	AND #$80	
	BNE PRG026_ACAD	

	LDA #%10101000	 ; PT2 is sprites, use 8x16 sprites, generate VBlanks
	; Update PPU_CTL1 and local copy
	STA PPU_CTL1	 
	STA <PPU_CTL1_Copy

	LDA #%00011000	 	; Show sprites + BG
	STA <PPU_CTL2_Copy

PRG026_ACBF:
	; Update the palette based on the buffer
	JSR GraphicsBuf_Prep_And_WaitVSync

	JSR Palette_DoFadeOut	; Do the fade out
	LDA Fade_Level	 	
	BNE PRG026_ACBF	 	; If fade-out not complete, go around again!

	RTS		 ; Return
 

; PRG026_ACCB:	.byte $40, $40, $20, $00, $00, $00

; ;Map_EnterLevel_Effect:		; routine called while entering a level
; 	LDA PPU_STAT
; 	LDX Map_EntTran_BorderLoop	; X = current border index (0-3: Top 0, bottom 1, right 2, left 3)

; 	; Copy this border's VRAM addresses to Map_EntTran_VAddrH/L
; 	LDA Map_EntTran_BVAddrH,X
; 	STA Map_EntTran_VAddrH	 
; 	LDA Map_EntTran_BVAddrL,X
; 	STA Map_EntTran_VAddrL	 

; 	LDA Map_EntTran_BorderLoop	; Get current border loop index
; 	AND #$02	 
; 	BEQ PRG026_ACF6	 		; If not updating left/right (i.e. doing top/bottom), jump to PRG026_ACF6

; 	LDY Map_EntTran_LRCnt	 	; Y = Map_EntTran_LRCnt

; 	; Set vertical update mode (left/right edges benefit from this)
; 	LDA <PPU_CTL1_Copy
; 	ORA #$04	 
; 	STA <PPU_CTL1_Copy

; 	JMP PRG026_ACFF	 ; Jump to PRG026_ACFF

; PRG026_ACF6:
; 	LDY Map_EntTran_TBCnt	 	; Y = Map_EntTran_TBCnt

; 	; Set horizontal update mode (top/bottom edges benefit from this)
; 	LDA <PPU_CTL1_Copy
; 	AND #$fb	 
; 	STA <PPU_CTL1_Copy

; PRG026_ACFF:
; 	LDA <PPU_CTL1_Copy
; 	STA PPU_CTL1	 	; Commit changes to PPU_CTL1

; 	; Set this border's VRAM addresses
; 	LDA Map_EntTran_VAddrH
; 	STA PPU_VRAM_ADDR	
; 	LDA Map_EntTran_VAddrL
; 	STA PPU_VRAM_ADDR	

; PRG026_AD10:
; 	LDA #$ff		; black pattern	
; 	STA PPU_VRAM_DATA	; Store into VRAM

; 	LDA Map_EntTran_BorderLoop
; 	AND #$02
; 	BNE PRG026_AD26	 	; If updating left/right, jump to PRG026_AD26

; 	; top/bottom update...
; 	INC Map_EntTran_VAddrL	; Map_EntTran_VAddrL++

; 	LDA Map_EntTran_VAddrL
; 	AND #$1f
; 	BEQ PRG026_AD2B	 	; If Map_EntTran_VAddrL has covered 32 bytes, jump to PRG026_AD2B

; PRG026_AD26:
; 	DEY		 	; Y--
; 	BPL PRG026_AD10	 	; While Y >= 0, loop!
; 	BMI PRG026_AD37	 	; If loop has ended, jump to PRG026_AD37

; PRG026_AD2B:
; 	; After covering 32 bytes, reset
; 	LDA Map_EntTran_VAddrL
; 	SUB #32
; 	STA Map_EntTran_VAddrL	; Map_EntTran_VAddrL -= 32
; 	DEY		 	; Y--
; 	BPL PRG026_ACFF	 	; While Y >= 0, loop! (and reset VRAM address, since autoincrement needs reset too)

; PRG026_AD37:
; 	;JSR Border_Do	 ; Update this edge of the border

; 	INC Map_EntTran_BorderLoop
; 	LDA Map_EntTran_BorderLoop
; 	AND #$03	 
; 	STA Map_EntTran_BorderLoop	; Map_EntTran_BorderLoop = (Map_EntTran_BorderLoop + 1) & 3

; 	LDY Map_EntTran_Cnt		; Y = Map_EntTran_Cnt
; 	CPY #$06
; 	BGE PRG026_AD67	 		; If Map_EntTran_Cnt >= 6, jump to PRG026_AD67

; 	LDA <PPU_CTL1_Copy
; 	AND #$04	 
; 	BNE PRG026_AD67	 		; If vertical update bit is set (?), jump to PRG026_AD67 (RTS)

; 	; Pump in final black tiles
; 	LDX #31

; 	; Set VRAM address to [$2B][PRG026_ACCB[Y]]
; 	LDA #$2b
; 	STA PPU_VRAM_ADDR

; 	LDA PRG026_ACCB,Y
; 	STA PPU_VRAM_ADDR
; PRG026_AD5F:
; 	LDA #$ff	 
; 	STA PPU_VRAM_DATA
; 	DEX		 ; X--
; 	BPL PRG026_AD5F	 ; While X >= 0, loop!

; PRG026_AD67:
; 	RTS		 ; Return


; Border_Do:
; 	LDA Map_EntTran_BorderLoop
; 	JSR DynJump

; 	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
; 	.word Border_Top
; 	.word Border_Bottom
; 	.word Border_Right
; 	.word Border_Left

; Border_Top:
; 	LDX Map_EntTran_BorderLoop	; X = current border index
; 	LDA Map_EntTran_BVAddrL,X
; 	AND #$1f
; 	CMP #$1f
; 	BEQ PRG026_AD94	 		; If Map_EntTran_BVAddrL is at the 31st byte, jump to PRG026_AD94

; 	; Otherwise... Map_EntTran_BVAddrH/L += 33 (causes it to shift over, creating the diagonals)
; 	LDA Map_EntTran_BVAddrL,X
; 	ADD #33
; 	STA Map_EntTran_BVAddrL,X
; 	LDA Map_EntTran_BVAddrH,X
; 	ADC #$00	 
; 	STA Map_EntTran_BVAddrH,X
; 	RTS		 ; Return

; PRG026_AD94:
; 	; 31st byte, top
; 	; Map_EntTran_BVAddrH/L += 1
; 	LDA Map_EntTran_BVAddrL,X
; 	ADD #$01	
; 	STA Map_EntTran_BVAddrL,X
; 	LDA Map_EntTran_BVAddrH,X
; 	ADC #$00	 
; 	STA Map_EntTran_BVAddrH,X
; 	RTS		 ; Return

; Border_Right:
; 	LDX Map_EntTran_BorderLoop	; X = current border index

; 	; Map_EntTran_BVAddrH/L += 31
; 	LDA Map_EntTran_BVAddrL,X
; 	ADD #31
; 	STA Map_EntTran_BVAddrL,X
; 	LDA Map_EntTran_BVAddrH,X
; 	ADC #$00	
; 	STA Map_EntTran_BVAddrH,X
; 	RTS		 ; Return

; Border_Bottom:
; 	LDX Map_EntTran_BorderLoop	; X = current border index

; 	; Map_EntTran_BVAddrH/L -= 31 (causes it to shift over, creating the diagonals)
; 	LDA Map_EntTran_BVAddrL,X
; 	SUB #31
; 	STA Map_EntTran_BVAddrL,X
; 	LDA Map_EntTran_BVAddrH,X
; 	SBC #$00	 
; 	STA Map_EntTran_BVAddrH,X

; 	DEC Map_EntTran_TBCnt
; 	DEC Map_EntTran_TBCnt	 ; Map_EntTran_TBCnt -= 2
; 	RTS		 ; Return

; Border_Left:
; 	LDX Map_EntTran_BorderLoop	; X = current border index

; 	; Map_EntTran_BVAddrH/L += 33
; 	LDA Map_EntTran_BVAddrL,X
; 	ADD #33
; 	STA Map_EntTran_BVAddrL,X
; 	LDA Map_EntTran_BVAddrH,X
; 	ADC #$00	
; 	STA Map_EntTran_BVAddrH,X
; 	DEC Map_EntTran_LRCnt	 
; 	DEC Map_EntTran_LRCnt	 ; Map_EntTran_LRCnt -= 2
; 	RTS		 ; Return

; Level_Opening_Effect:	; Unused in the US release; this is the reverse effect of the map entry

; 	LDA PPU_STAT
; 	LDA Map_EntTran_BorderLoop	; A = current border index (0-3: Top 0, bottom 1, right 2, left 3)
; 	AND #$02
; 	BEQ PRG026_AE07	 		; If updating top/bottom, jump to PRG026_AE07

; 	; left/right update..
; 	LDY Map_EntTran_LRCnt

; 	; Set vertical update mode (left/right edges benefit from this)
; 	LDA <PPU_CTL1_Copy
; 	ORA #$04	 
; 	STA <PPU_CTL1_Copy
; 	JMP PRG026_AE10	 		; Jump to PRG026_AE10

; PRG026_AE07:
; 	LDY Map_EntTran_TBCnt	 	; Y = Map_EntTran_TBCnt

; 	; Set horizontal update mode (top/bottom edges benefit from this)
; 	LDA <PPU_CTL1_Copy
; 	AND #$fb	 
; 	STA <PPU_CTL1_Copy

; PRG026_AE10:
; 	LDA <PPU_CTL1_Copy
; 	STA PPU_CTL1	 	; Commit changes to PPU_CTL1
; 	LDX Map_EntTran_BorderLoop	; X = current border index 

; 	; Set VRAM address for this border
; 	LDA Map_EntTran_BVAddrH,X
; 	STA PPU_VRAM_ADDR	 
; 	LDA Map_EntTran_BVAddrL,X
; 	STA PPU_VRAM_ADDR	 

; PRG026_AE24:
; 	LDA Scroll_ColorStrip,Y	 
; 	STA PPU_VRAM_DATA	 ; Store attribute data to VRAM

; 	CPY Map_EntTran_Temp
; 	BEQ PRG026_AE35	 	; If Y = Map_EntTran_Temp, jump to PRG026_AE35

; 	DEY		 	; Y--
; 	BPL PRG026_AE24	 	; While Y >= 0, loop
; 	JMP PRG026_AE51	 	; Jump to PRG026_AE51

; PRG026_AE35:
; 	LDA #$ff	 
; 	STA Map_EntTran_Temp	; Map_EntTran_Temp = $FF

; 	; Set VRAM address to [$28][Map_EntTran_BVAddrL & $1f]
; 	LDA #$28	 
; 	STA PPU_VRAM_ADDR
; 	LDA Map_EntTran_BVAddrL,X
; 	AND #$1f	 
; 	STA PPU_VRAM_ADDR	

; 	DEY		 	; Y--

; PRG026_AE48:
; 	LDA Scroll_ColorStrip,Y	 
; 	STA PPU_VRAM_DATA	 ; Store attribute data to VRAM
; 	DEY		 	; Y--
; 	BPL PRG026_AE48	 ; While Y >= 0, loop

; PRG026_AE51:
; 	JSR BorderOut_Do	 ; Update this edge of the border!

; 	INC Map_EntTran_BorderLoop
; 	LDA Map_EntTran_BorderLoop
; 	AND #$03	
; 	STA Map_EntTran_BorderLoop	; Map_EntTran_BorderLoop = (Map_EntTran_BorderLoop + 1) & 3

; 	INC Map_EntTran_Cnt		; Map_EntTran_Cnt++
; 	RTS		 ; Return

; BorderOut_VHLimitTRL:	.byte $20, $00, $00, $00, $28
; BorderOut_VHLimitB:	.byte $23, $00, $00, $00, $2A

; BorderOut_Do:
; 	LDA Map_EntTran_BorderLoop
; 	JSR DynJump	 

; 	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
; 	.word BorderOut_Top
; 	.word BorderOut_Bottom
; 	.word BorderOut_Right
; 	.word BorderOut_Left

; BorderOut_Top:
; 	LDX Map_EntTran_InitValIdx
; 	LDA BorderOut_VHLimitTRL,X

; 	LDX Map_EntTran_BorderLoop
; 	CMP Map_EntTran_BVAddrH,X
; 	BNE PRG026_AE92	 		; If Map_EntTran_BVAddrH[Map_EntTran_BorderLoop] <> BorderOut_VHLimitTRL[Map_EntTran_InitValIdx], jump to PRG026_AE92

; 	; Otherwise...
; 	LDA Map_EntTran_BVAddrL,X
; 	CMP #$20
; 	BGE PRG026_AE92	 ; If Map_EntTran_BVAddrL >= $20, jump to PRG026_AE92
; 	BLT PRG026_AEA6	 ; Otherwise, jump to PRG026_AEA6

; PRG026_AE92:
; 	; Map_EntTran_BVAddrL >= $20

; 	LDX Map_EntTran_BorderLoop	; X = border index

; 	; Map_EntTran_BVAddrH/L -= 33
; 	LDA Map_EntTran_BVAddrL,X
; 	SUB #33
; 	STA Map_EntTran_BVAddrL,X
; 	LDA Map_EntTran_BVAddrH,X
; 	SBC #$00	
; 	STA Map_EntTran_BVAddrH,X

; PRG026_AEA6:
; 	LDA Map_EntTran_BVAddrH,X
; 	CMP #$27
; 	BNE PRG026_AEBB			; If Map_EntTran_BVAddrH <> $27, jump to PRG026_AEBB (RTS)

; 	; Map_EntTran_BVAddrH = $23
; 	LDA #$23
; 	STA Map_EntTran_BVAddrH,X

; 	; Map_EntTran_BVAddrL -= $40
; 	LDA Map_EntTran_BVAddrL,X
; 	SUB #$40	
; 	STA Map_EntTran_BVAddrL,X

; PRG026_AEBB:
; 	RTS

; BorderOut_Right:
; 	LDX Map_EntTran_InitValIdx
; 	LDA BorderOut_VHLimitTRL,X

; 	LDX Map_EntTran_BorderLoop
; 	CMP Map_EntTran_BVAddrH,X
; 	BNE PRG026_AED7 		; If Map_EntTran_BVAddrH[Map_EntTran_BorderLoop] <> BorderOut_VHLimitTRL[Map_EntTran_InitValIdx], jump to PRG026_AED7

; 	LDA Map_EntTran_BVAddrL,X
; 	CMP #$1e
; 	BNE PRG026_AED7			; If Map_EntTran_BVAddrL <> $1e, jump to PRG026_AED7

; 	INC Map_EntTran_BVAddrL,X	; Map_EntTran_BVAddrL++
; 	JMP PRG026_AEE8	 		; Jump to PRG026_AEE8

; PRG026_AED7:

; 	; Map_EntTran_BVAddrH/L -= 31
; 	LDA Map_EntTran_BVAddrL,X
; 	SUB #31
; 	STA Map_EntTran_BVAddrL,X
; 	LDA Map_EntTran_BVAddrH,X
; 	SBC #$00	 
; 	STA Map_EntTran_BVAddrH,X

; PRG026_AEE8:
; 	LDA Map_EntTran_BVAddrH,X
; 	CMP #$27	 
; 	BNE PRG026_AEFD	 		; If Map_EntTran_BVAddrH <> $27, jump to PRG026_AEFD (RTS)

; 	LDA #$23
; 	STA Map_EntTran_BVAddrH,X

; 	; Map_EntTran_BVAddrL -= $40
; 	LDA Map_EntTran_BVAddrL,X
; 	SUB #$40	
; 	STA Map_EntTran_BVAddrL,X

; PRG026_AEFD:
; 	RTS		 ; Return

; BorderOut_Bottom:
; 	LDX Map_EntTran_InitValIdx
; 	LDA BorderOut_VHLimitB,X

; 	LDX Map_EntTran_BorderLoop
; 	CMP Map_EntTran_BVAddrH,X
; 	BNE PRG026_AF1C 		; If Map_EntTran_BVAddrH[Map_EntTran_BorderLoop] <> BorderOut_VHLimitB[Map_EntTran_InitValIdx], jump to PRG026_AF1C

; 	LDA Map_EntTran_InitValIdx
; 	CMP #$04	 
; 	BLT PRG026_AF33	 		; If Map_EntTran_InitValIdx < 4, jump to PRG026_AF33

; 	LDA Map_EntTran_BVAddrL,X
; 	CMP #$e0	 
; 	BLT PRG026_AF1C	 		; If Map_EntTran_BVAddrL < $e0, jump to PRG026_AF1C
; 	BGE PRG026_AF33	 		; Otherwise, jump to PRG026_AF33

; PRG026_AF1C:
; 	; Map_EntTran_BVAddrH/L += 31
; 	LDA Map_EntTran_BVAddrL,X
; 	ADD #31
; 	STA Map_EntTran_BVAddrL,X
; 	LDA Map_EntTran_BVAddrH,X
; 	ADC #$00	
; 	STA Map_EntTran_BVAddrH,X

; 	INC Map_EntTran_TBCnt	
; 	INC Map_EntTran_TBCnt		; Map_EntTran_TBCnt += 2

; PRG026_AF33:
; 	LDA Map_EntTran_BVAddrH,X
; 	CMP #$23
; 	BNE PRG026_AF4E	 		; If Map_EntTran_BVAddrH <> $23, jump to PRG026_AF4E (RTS)

; 	LDA Map_EntTran_BVAddrL,X
; 	CMP #$c0	
; 	BLT PRG026_AF4E	 		; If Map_EntTran_BVAddrL < $c0, jump to PRG026_AF4E (RTS)

; 	LDA #$28	 
; 	STA Map_EntTran_BVAddrH,X	; Map_EntTran_BVAddrH = $28

; 	LDA Map_EntTran_BVAddrL,X
; 	AND #$1f	
; 	STA Map_EntTran_BVAddrL,X	; Map_EntTran_BVAddrL &= $31

; PRG026_AF4E:
; 	RTS		 ; Return

; BorderOut_Left:
; 	LDX Map_EntTran_InitValIdx
; 	LDA BorderOut_VHLimitTRL,X

; 	LDX Map_EntTran_BorderLoop
; 	CMP Map_EntTran_BVAddrH,X
; 	BNE PRG026_AF70 		; If Map_EntTran_BVAddrH[Map_EntTran_BorderLoop] <> BorderOut_VHLimitTRL[Map_EntTran_InitValIdx], jump to PRG026_AF70

; 	LDA Map_EntTran_BVAddrL,X
; 	CMP #$02
; 	BNE PRG026_AF70	 		; If Map_EntTran_BVAddrL <> 2, jump to PRG026_AF70

; 	DEC Map_EntTran_BVAddrL,X	; PRG026_AF70--

; 	LDA Map_EntTran_InitValIdx	 
; 	CMP #$04	
; 	BLT PRG026_AF84	 		; If Map_EntTran_InitValIdx < 4, jump to PRG026_AF84
; 	BEQ PRG026_AF87	 		; If Map_EntTran_InitValIdx = 4, jump to PRG026_AF87

; PRG026_AF70:

; 	; Map_EntTran_BVAddrH/L -= 33
; 	LDA Map_EntTran_BVAddrL,X
; 	SUB #33
; 	STA Map_EntTran_BVAddrL,X
; 	LDA Map_EntTran_BVAddrH,X
; 	SBC #$00
; 	STA Map_EntTran_BVAddrH,X

; 	INC Map_EntTran_LRCnt	 ; Map_EntTran_LRCnt++

; PRG026_AF84:
; 	INC Map_EntTran_LRCnt	 ; Map_EntTran_LRCnt++

; PRG026_AF87:
; 	LDA Map_EntTran_BVAddrH,X
; 	CMP #$27
; 	BNE PRG026_AF9C		; If Map_EntTran_BVAddrH <> $27, jump to PRG026_AF9C

; 	LDA #$23	 
; 	STA Map_EntTran_BVAddrH,X	; Map_EntTran_BVAddrH = $23

; 	LDA Map_EntTran_BVAddrL,X
; 	SUB #$40
; 	STA Map_EntTran_BVAddrL,X	; Map_EntTran_BVAddrL -= $40

; PRG026_AF9C:
; 	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
; Video_Misc_Updates
;
; This routine appears to be responsible for all video updates
; OTHER than scrolling, which includes palettes, clearing the
; "WORLD x" thing from a world map introduction, updating the
; status bar, printing "COURSE CLEAR!", etc...
;
; Loads data as specified from table Video_Upd_Table in PRG030 (see there for format and data source!)
; Cloned in its entirety in PRG024 (i.e. Video_Misc_Updates2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
Video_Misc_Updates:

	LDY #$00	 	; Y = 0
	LDA [Video_Upd_AddrL],Y	; Get byte
	BNE Video_Misc_Updates1	 	; If 0, jump to PRG026_B292 (RTS)
	RTS

Video_Misc_Updates1:
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
	BCS PRG026_B2B2		; If bit 7 was set, jump to PRG026_B2B2
	AND #$fb		; Otherwise, use horizontal updates! (clears vertical bit)

PRG026_B2B2:
	STA PPU_CTL1		; Update PPU_CTL1
	STA <PPU_CTL1_Copy	; Update PPU_CTL1_Copy

	PLA		; Restore A

	ASL A		 ; Check next bit...
	BCC PRG026_B2BE	 ; If not set, jump to PRG026_B2BE
	ORA #$02	 ; Otherwise, remaining value gets bit 1 set (forces skip of first increment)
	INY		 ; Y++ 

PRG026_B2BE:
	; Restore remainder of byte read (6-bits for value)
	LSR A
	LSR A
	TAX		 ; Keep it in X

	; The following will continuously write bytes from the stream
	; directly into the PPU 'X+1' times
PRG026_B2C1:
	BCS PRG026_B2C4	 ; If carry set, jump to PRG026_B2C4
	INY		 ; Y++
	
PRG026_B2C4:
	LDA [Video_Upd_AddrL],Y	; Get next byte
	STA PPU_VRAM_DATA	; Store into PPU
	DEX		 	; X--
	BNE PRG026_B2C1	 	; While X <> 0, loop! 

	; This advances the current position of the pointer so 'Y' can go
	; back to zero and we begin again...
	INY		 ; Y++
	TYA		 ; A = Y
	ADD <Video_Upd_AddrL
	STA <Video_Upd_AddrL
	LDA <Video_Upd_AddrH
	ADC #$00	 
	STA <Video_Upd_AddrH	; Entire video address value has 'Y' added to it
	JMP Video_Misc_Updates	; Jump back to start to process next command or terminate!


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Scroll_Commit_Column
;
; This subroutine takes the buffered set of tiles in Scroll_PatStrip
; and commits them to actual VRAM, OR it takes the buffer attribute
; bytes and commits those.
; Used by both the world map and a standard horizontally scrolling level
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Scroll_Commit_Column:
	LDA PPU_STAT

	LDA Scroll_ToVRAMHi	; A = Scroll_ToVRAMHi
	BEQ PRG026_B354	 	; If Scroll_ToVRAMHi = 0, jump to PRG030_B354

	LDX #$00	 	; X = 0

	LDA Scroll_ToVRAMHi	; A = Scroll_ToVRAMHi
	STA PPU_VRAM_ADDR	; Write as high byte to VRAM address

	LDA Scroll_LastCol8	
	STA PPU_VRAM_ADDR	; Low byte is Scroll_LastCol8
	
	LDA <PPU_CTL1_Copy	; Get the PPU_CTL1
	ORA #$04	 	; Use vertical update mode
	STA PPU_CTL1	 	; Set PPU_CTL1

PRG026_B2F9:

	; Push 5 blocks in
	LDA Scroll_PatStrip,X	 
	STA PPU_VRAM_DATA	 

	LDA Scroll_PatStrip+1,X
	STA PPU_VRAM_DATA	

	LDA Scroll_PatStrip+2,X
	STA PPU_VRAM_DATA	

	LDA Scroll_PatStrip+3,X
	STA PPU_VRAM_DATA	

	LDA Scroll_PatStrip+4,X
	STA PPU_VRAM_DATA	

	INX
	INX
	INX
	INX
	INX		; X += 5

	CPX #30	
	BNE PRG026_B2F9	; While X < 30, loop!

	; Begin update on Nametable 2
	LDA Scroll_ToVRAMHi	
	ORA #$08	 	
	STA PPU_VRAM_ADDR	

	LDA Scroll_LastCol8	
	STA PPU_VRAM_ADDR	

PRG026_B32E:
	; Push another 4
	LDA Scroll_PatStrip,X
	STA PPU_VRAM_DATA	

	LDA Scroll_PatStrip+1,X
	STA PPU_VRAM_DATA	

	LDA Scroll_PatStrip+2,X
	STA PPU_VRAM_DATA	

	LDA Scroll_PatStrip+3,X
	STA PPU_VRAM_DATA	 

	INX		
	INX		
	INX		
	INX		 ; X += 4

	CPX #30+24	 ; 24 more rows...!
	BNE PRG026_B32E	 ; While X < 54, loop! (54 rows of 8 gets down to the status bar in the NTSC model)

	LDA #$00	 
	STA Scroll_ToVRAMHi	 ; Scroll_ToVRAMHi = 0
	RTS		 ; Return

PRG026_B354:
	; If Scroll_ToVRAMHi = 0 ... do we need to commit any attribute updates??
	LDA Scroll_ToVRAMHA
	BEQ PRG026_B38E	 ; If Scroll_ToVRAMHA = 0, jump to PRG026_B38E (RTS)

	; Commiting attribute updates...
	LDA <PPU_CTL1_Copy
	STA PPU_CTL1	 	; Update PPU_CTL1

	LDX #$00	 	; X = 0
	LDY Scroll_LastAttr	; Y = Scroll_LastAttr (low part)
PRG026_B363:
	
	LDA Scroll_ToVRAMHA	; A = Scroll_ToVRAMHA (high part)
	STA PPU_VRAM_ADDR	; Set high address
	STY PPU_VRAM_ADDR	; Set low address
	
	LDA Scroll_AttrStrip,X	; Get next attribute byte
	STA PPU_VRAM_DATA	; Commit it!
	TYA		 
	ADD #$08	 
	TAY		 	; Y += 8
	BCC PRG026_B384	 	; If we haven't overflowed, jump to PRG026_B384

	; Update high byte 
	LDA Scroll_ToVRAMHA
	EOR #$08	 	; Flips to attribute table 2
	STA Scroll_ToVRAMHA
	
	LDY Scroll_LastAttr	; Get low byte

PRG026_B384:
	INX		 	; X++
	CPX #14
	BNE PRG026_B363	 	; If X <> 14, loop!

	LDA #$00	 
	STA Scroll_ToVRAMHA	 ; Scroll_ToVRAMHA = 0 (update complete!)

PRG026_B38E:
	RTS		 ; Return


Scroll_ToVRAM_Apply:
	LDA PPU_STAT

	LDA Scroll_ToVRAMHi
	BEQ PRG026_B3BD	 ; If Scroll_ToVRAMHi = 0 (no scrolled pattern update required), jump to PRG026_B3BD

	LDX #$00	 ; X = 0

	; Set high byte of VRAM address
	LDA Scroll_ToVRAMHi
	STA PPU_VRAM_ADDR

	; Set low byte of VRAM address
	LDA Scroll_LastCol8
	STA PPU_VRAM_ADDR

	; Do increment by 1
	LDA <PPU_CTL1_Copy
	AND #~$04
	STA PPU_CTL1

PRG026_B3AC:
	LDA Scroll_PatStrip,X	; Get next block
	STA PPU_VRAM_DATA	; Write to VRAM
	INX		 	; X++
	CPX #32			
	BNE PRG026_B3AC		; While X < 32, loop!

	; Scroll_ToVRAMHi = 0 (update complete)
	LDA #$00	 
	STA Scroll_ToVRAMHi	 ; Scroll_ToVRAMHi = 0

	RTS		 ; Return


PRG026_B3BD:
	LDA Scroll_ToVRAMHA
	BEQ PRG026_B3E5	  ; If Scroll_ToVRAMHA = 0 (no scrolled attribute update required), jump to PRG026_B3E5 (RTS)

	; Reset PPU_CTL1
	LDA <PPU_CTL1_Copy
	STA PPU_CTL1

	LDX #$00	 ; X = 0
	; Set high byte of VRAM address
	LDA Scroll_ToVRAMHA
	STA PPU_VRAM_ADDR

	; Set low byte of VRAM address
	LDA Scroll_LastAttr
	STA PPU_VRAM_ADDR

PRG026_B3D5:
	; Set next byte of attribute data
	LDA Scroll_AttrStrip,X
	STA PPU_VRAM_DATA

	INX		 ; X++ (next attribute byte)
	CPX #$08
	BLT PRG026_B3D5	 ; While X < 8, loop!

	; Scroll_ToVRAMHA = 0 (update complete)
	LDA #$00
	STA Scroll_ToVRAMHA

PRG026_B3E5:
	RTS		 ; Return

TileChng_VRAMCommit:
	LDY TileChng_VRAM_H
	BEQ PRG026_B38E	 ; If TileChng_VRAM_H = 0 (no tile change to do), jump to PRG026_B38E (RTS)

	LDA PPU_STAT

	; Switch to +1 increment mode
	LDA <PPU_CTL1_Copy
	AND #~$04
	STA PPU_CTL1

	LDA TileChng_VRAM_L	; Get VRAM low address
	STY PPU_VRAM_ADDR	; Set VRAM high address
	STA PPU_VRAM_ADDR	; Set VRAM low address

	; Commit the top two patterns
	LDA TileChng_Pats
	STA PPU_VRAM_DATA

	LDA TileChng_Pats+1
	STA PPU_VRAM_DATA

	; Set VRAM address at base +32
	LDA TileChng_VRAM_L
	ADD #32		; +32 to jump to next line
	STY PPU_VRAM_ADDR
	STA PPU_VRAM_ADDR

	; Commit the lower two patterns
	LDA TileChng_Pats+2
	STA PPU_VRAM_DATA

	LDA TileChng_Pats+3
	STA PPU_VRAM_DATA

	; TileChng_VRAM_H = 0 (Tile update commit completed!)
	LDA #$00
	STA TileChng_VRAM_H

	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; StatusBar_Update
;
; This subroutine basically handles all of the status bar updates
; besides cards; it inserts all of the following data:
; Power meter, coins, lives, score, time
; ... and performs updates where relevant, and even pushes it to the
; graphics buffer for commitment later on!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
StatusBar_Update:
	LDA Message_Id
	ORA Message_Id_Prev
	BEQ StatusBar_Norm

	JSR Message_Handler
	JMP AttemptUpdate

StatusBar_Norm:	
	LDA Force_StatusBar_Init
	BEQ NoForced_Init

	LDA #$00
	STA Force_StatusBar_Init
	BEQ Init_StatusBar

NoForced_Init:
	LDA Update_Level_Name
	BEQ StatusBar_DoUpdates

	JSR Game_UpdateLevelName
	RTS

; No_Level_Name_Update:

; 	LDA StatusBar_Mode
; 	CMP #$80
; 	BNE StatusBar_DoUpdates
; 	RTS

Init_StatusBar:
	JSR Initialize_Status_Bar
	JMP AttemptUpdate

StatusBar_DoUpdates:
	JSR Game_UpdatePower
	JSR Game_UpdateAir
	JSR Game_UpdateStars
	JSR Game_UpdateEnemyHealth
	JSR Game_UpdateCherries
	JSR Game_UpdateExperience
	JSR Game_UpdateCoins
	JSR Game_UpdateDayNightMeter
	JSR Game_UpdateBadge
	JSR Game_UpdateReserve


AttemptUpdate:
	INC Status_Bar_Render_Toggle

	LDA Map_Pan_Count
	BNE AttemptUpdate1

	LDA Status_Bar_Render_Toggle
	AND #$01
	BNE UpdatePalette

	LDA Graphics_BufCnt
	BNE AttemptUpdate1

	LDA Top_Needs_Redraw
	BNE Do_Top

	LDA Bottom_Needs_Redraw
	BNE Do_Bottom	 	; If graphics buffer is empty, jump to PRG026_B466

AttemptUpdate1:
	RTS

UpdatePalette:
	LDA <Graphics_Queue	; A = StatusBar_UpdFl
	BNE UpdatePalette1

	LDA #$06	 	;
	STA <Graphics_Queue	; Set Graphics_Queue = 6 (6?? Does it matter?)

UpdatePalette1:
	RTS

Do_Top:
	LDX Graphics_BufCnt

	LDA #$2B
	STA Graphics_Buffer, X

	LDA #$22
	STA Graphics_Buffer + 1, X

	LDA #$1C
	STA Graphics_Buffer + 2, X
	LDY #$00

Status_Top_Loop:
	LDA Status_Bar_Top,Y	; Get next byte from StatusBar_UpdTemplate
	STA Graphics_Buffer + 3,X		; Store it into the graphics buffer

	INY				; Y++
	INX				; X++

	CPY #$1C
	BNE Status_Top_Loop	 		

	LDA #$00
	STA Graphics_Buffer + 3, X

	LDA Graphics_BufCnt
	CLC
	ADC #$1F
	STA Graphics_BufCnt

	LDA #$00
	STA Top_Needs_Redraw
	RTS

	
Do_Bottom:
	LDX Graphics_BufCnt
	LDA #$2B
	STA Graphics_Buffer, X
	
	LDA #$42
	STA Graphics_Buffer + 1, X
	
	LDA #$1C
	LDY #$00
	STA Graphics_Buffer + 2, X

Status_Bottom_Loop:
	LDA Status_Bar_Bottom,Y	; Get next byte from StatusBar_UpdTemplate
	STA Graphics_Buffer + 3,X		; Store it into the graphics buffer
	INY				; Y++
	INX				; X++
	CPY #$1C
	BNE Status_Bottom_Loop	 		

	LDA #$00
	STA Graphics_Buffer + 3, X

	LDA Graphics_BufCnt
	CLC
	ADC #$1F
	STA Graphics_BufCnt

	LDA #$00
	STA Bottom_Needs_Redraw
	RTS
;
; Rest of ROM bank was empty...
Initial_Bar_Display1:
	.byte $EE, $D1, $D1, $D1, $D1, $D1, $D1, $DA, $DB, $E9, $E9, $E9, $E9, $EA, $FE, $FE, $FE, $FE, $FE, $D8, $74, $74, $76, $FA, $FA, $FD, $FA, $FA
	.byte $EF, $30, $30, $30, $30, $30, $30, $FE, $D0, $30, $30, $30, $30, $FE, $D7, $30, $30, $30, $FE, $D5, $30, $30, $76, $FA, $FA, $FD, $FA, $FA

Initialize_Status_Bar:
;	LDA StatusBar_Mode
;	BNE Init_Bar_2

	LDA #LOW(Initial_Bar_Display1)
	STA <Temp_Var1

	LDA #HIGH(Initial_Bar_Display1)
	STA <Temp_Var2

	JSR StatusBar_Template
	JSR StatusBar_DrawPower
	JSR StatusBar_DrawAir
	JSR StatusBar_DrawStars
	JSR StatusBar_DrawCherries
	JSR StatusBar_DrawExperience
	JSR StatusBar_DrawCoins
	JSR StatusBar_DrawEnemyHealth
	JSR StatusBar_DrawStarsCollected
	JSR StatusBar_DrawDayNightMeter
	JSR StatusBar_DrawReserve
	JSR StatusBar_DrawBadge

	INC Top_Needs_Redraw
	INC Bottom_Needs_Redraw
	RTS


StatusBar_Template:
	LDY #$00

StatusBar_Template1:
	LDA [Temp_Var1], Y
	STA Status_Bar_Top, Y
	INY
	CPY #$38
	BNE StatusBar_Template1
	RTS

Game_UpdatePower:
	; LDA StatusBar_Mode
	; BNE Game_UpdatePower1
	
	LDA Player_Power
	CMP Old_Player_Power
	BEQ Game_UpdatePower1
	
	STA Old_Player_Power
	BNE StatusBar_DrawPower
	
Game_UpdatePower1:
	RTs

StatusBar_DrawPower:
	LDY #$00
	LDA Player_Power
	BEQ StatusBar_Fill_PowerMT3
	
	AND #$F0
	LSR A
	LSR A
	LSR A
	LSR A
	TAX
	CPX #$05
	BCC StatusBar_Fill_PowerMT1

	LDX #$05

StatusBar_Fill_PowerMT1:
	LDA #$D2

StatusBar_Fill_PowerMT2:
	STA Status_Bar_Top + 1,Y	; Store this tile into the buffer
	INY
	DEX
	BPL StatusBar_Fill_PowerMT2

StatusBar_Fill_PowerMT3:
	CPY #$06
	BCS StatusBar_Fill_PowerMT5

	LDA #$D1

StatusBar_Fill_PowerMT4:
	STA Status_Bar_Top + 1,Y
	INY
	CPY #$06
	BCC StatusBar_Fill_PowerMT4

StatusBar_Fill_PowerMT5:
	INC Top_Needs_Redraw
	RTS		 ; Return
;--------------------------------------
Game_UpdateAir:
	; LDA StatusBar_Mode
	; BNE Game_UpdateAir1
	
	LDA Air_Time
	CMP Old_Air_Time
	BEQ Game_UpdateAir1
	
	STA Old_Air_Time
	BNE StatusBar_DrawAir
		
Game_UpdateAir1:
	RTS

StatusBar_DrawAir:

	LDY #$00
	LDA Air_Time
	LSR A
	LSR A
	LSR A
	LSR A
	TAX
	BEQ Paritial_Air

Full_Air_Loop:				
	LDA #$E9
	STA Status_Bar_Top + 9, Y
	
	INY
	DEX
	BNE Full_Air_Loop
	
	CPY #$04				; Did it fill all the way? we're done!
	BEQ Fill_Air_MT_Done

Paritial_Air:
							; Not filled all the way, let's fill the partial bar
	LDA Air_Time
	AND #$0F
	LSR A
	ADC #$E1				; offset the tile number
	STA Status_Bar_Top + 9, Y
	INY

	LDA #$E1

Empty_Air_Loop:
	CPY #$04				
	BEQ Fill_Air_MT_Done		; Did it fill all the way? we're done!
	STA Status_Bar_Top + 9, Y	; no? let's fill empty tiles
	INY
	BNE Empty_Air_Loop
	
Fill_Air_MT_Done: 
	INC Top_Needs_Redraw
	RTS

;--------------------------------------

Game_UpdateStars:
	; LDA StatusBar_Mode
	; BNE Game_UpdateStars1
	
	LDA Paper_Stars
	CMP Old_Paper_Stars
	BEQ Game_UpdateStars1

	STA Old_Paper_Stars
	JSR StatusBar_DrawStars
	JMP StatusBar_DrawStarsCollected

Game_UpdateStars1:
	RTS

Game_UpdateEnemyHealth:
	LDA Enemy_Health
	CMP Old_Enemy_Health
	BEQ Game_UpdateEnemyHealthRTS

	STA Old_Enemy_Health
	JMP StatusBar_DrawEnemyHealth

Game_UpdateEnemyHealthRTS:
	RTS

StatusBar_DrawStars:
	LDA Paper_Stars
	STA <DigitsParam

	LDA #$00
	STA DigitsParam + 1
	
	JSR BytesTo3Digits

	LDA <DigitsResult + 2
	ORA #$30
	STA Status_Bar_Bottom + 15

	LDA <DigitsResult + 1
	ORA #$30
	STA Status_Bar_Bottom + 16

	LDA <DigitsResult
	ORA #$30
	STA Status_Bar_Bottom + 17
	INC Bottom_Needs_Redraw
	RTS
	
;--------------------------------------
Game_UpdateCherries:
	; LDA StatusBar_Mode
	; BNE Game_UpdateCherries1

	;LDA Object_Count
	;CMP Old_Cherries
	;BEQ Game_UpdateCherries1
		
	;STA Old_Cherries
	;BNE StatusBar_DrawCherries
	
Game_UpdateCherries1:
	;RTS
	
StatusBar_DrawCherries:
	LDA Player_Cherries
	;LDA Object_Count
	STA <DigitsParam
	
	JSR BytesTo2Digits

	LDA <DigitsResult
	ORA #$30
	STA Status_Bar_Bottom + 21
	
	LDA <DigitsResult + 1
	ORA #$30
	STA Status_Bar_Bottom + 20

StatusBar_DrawCherries1:
	INC Bottom_Needs_Redraw
	RTS
	
; StatusBar_XpIcon:
; 	.byte $EF, $2D
;-----------------------------------
Game_UpdateExperience:
	LDA Exp_Earned
 	BNE Game_UpdateExperience1
	RTS

Game_UpdateExperience1:
	LDA Exp_Earned
	
	LDX Player_Badge
	CPX #BADGE_XP
	BNE Game_NoXpDouble

	ASL A

Game_NoXpDouble:
	STA <CalcParam1

	LDA #$00
	STA <CalcParam1 + 1
	STA <CalcParam1 + 2

	STA Debug_Snap
	LDA Player_Experience
	STA <CalcParam2

	LDA Player_Experience + 1
	STA <CalcParam2 + 1

	LDA Player_Experience + 2
	STA <CalcParam2 + 2

	JSR Add3ByteValue

	LDA <CalcResult 
	STA Player_Experience

	LDA <CalcResult + 1
	STA Player_Experience + 1

	LDA <CalcResult + 2
	STA Player_Experience + 2

	LDA #$00
	STA Exp_Earned

; 	LDX #$00

; 	LDA Kill_Tally_Ticker
; 	CMP #$02
; 	BCC StatusBar_DrawXpIcon

; 	INX

; StatusBar_DrawXpIcon:
; 	LDA StatusBar_XpIcon, X
; 	STA Status_Bar_Bottom

	INC Bottom_Needs_Redraw

	; LDA StatusBar_Mode
	; BEQ StatusBar_DrawExperience
	; RTS


StatusBar_DrawExperience:
	LDA Player_Experience
	STA <DigitsParam

	LDA Player_Experience + 1
	STA <DigitsParam + 1

	LDA Player_Experience + 2
	STA <DigitsParam + 2

	JSR BytesTo6Digits

	LDY #$05
	LDX #$00

StatusBar_DrawExperience1:
	LDA <DigitsResult, X
	ORA #$30
	STA Status_Bar_Bottom + 1, Y
	INX
	DEY
	BPL StatusBar_DrawExperience1
	INC Bottom_Needs_Redraw
	RTS		 ; Return
;--------------------------------------
Game_UpdateCoins:
	LDA Coins_Earned
	ORA Force_Coin_Update
	BNE Game_UpdateCoins0
	RTS
	
Game_UpdateCoins0:
	LDA #$00
	STA Force_Coin_Update

	LDA Player_Coins
	STA <CalcParam1

	LDA Player_Coins + 1
	STA <CalcParam1 + 1

	LDA Coins_Earned
	
	LDX Player_Badge
	CPX #BADGE_COIN
	BNE Coin_NoDouble

	ASL A

Coin_NoDouble:
	STA <CalcParam2

	LDA #$00
	STA <CalcParam2 + 1
	STA <CalcParam2 + 2

	JSR Add2ByteValue

	LDA <CalcResult
	STA Player_Coins

	LDA <CalcResult + 1
	STA Player_Coins + 1

	LDA <CalcResult + 2
	STA Player_Coins + 2

	LDA #$00
	STA Coins_Earned

	LDA Player_Coins + 1
	CMP #$27
	BCC Game_UpdateCoins1

	LDA Player_Coins
	CMP #$0F
	BCC Game_UpdateCoins1

	LDA #$0F
	STA Player_Coins

	LDA #$27
	STA Player_Coins + 1

Game_UpdateCoins1:
	
StatusBar_DrawCoins:
	LDA Player_Coins
	STA <DigitsParam

	LDA Player_Coins + 1
	STA <DigitsParam + 1

	JSR BytesTo4Digits

	LDX #$00
	LDY #$03

StatusBar_DrawCoins1:
	LDA <DigitsResult, X
	ORA #$30
	STA Status_Bar_Bottom + 9, Y
	INX
	DEY
	BPL StatusBar_DrawCoins1

	INC Bottom_Needs_Redraw
	RTS

StatusBar_SkullIcon:
	.byte $3E, $3D
;--------------------------------------
StatusBar_DrawEnemyHealth:
	LDA Enemy_Health_Mode
	BEQ DrawEnemy_HealthRTS

	LDA Enemy_Health
	BPL Enemy_Health_Good

	LDA #$00
	STA Enemy_Health

Enemy_Health_Good:
	LDX #$00
	LDA Enemy_Health
	BNE StatusBar_DrawSkull

	INX

StatusBar_DrawSkull:
	LDA StatusBar_SkullIcon, X
	STA Status_Bar_Top + 14
	
	LDA #$EA
	STA Status_Bar_Top + 18

	LDY #$00
	LDA Enemy_Health
	BMI DrawEnemy_HealthRTS

	LSR A
	LSR A
	LSR A
	LSR A
	TAX
	BEQ Paritial_EnemyHealth

Full_EnemyHealth_Loop:				
	LDA #$E9
	STA Status_Bar_Top + 15, Y
	
	INY
	DEX
	BNE Full_EnemyHealth_Loop
	
	CPY #$03				; Did it fill all the way? we're done!
	BEQ Fill_EnemyHealth_MT_Done

Paritial_EnemyHealth:
	LDA Enemy_Health
	AND #$0F
	LSR A
	ADC #$E1				; offset the tile number
	STA Status_Bar_Top + 15, Y
	INY

	LDA #$E1

Empty_EnemyHealth_Loop:
	CPY #$03				
	BEQ Fill_EnemyHealth_MT_Done		; Did it fill all the way? we're done!

	STA Status_Bar_Top + 15, Y	; no? let's fill empty tiles
	INY
	BNE Empty_EnemyHealth_Loop
	
Fill_EnemyHealth_MT_Done: 
	INC Top_Needs_Redraw

DrawEnemy_HealthRTS:
	RTS


;--------------------------------------
	
StatusBar_DrawStarsCollected:
	LDA Enemy_Health_Mode
	BNE StatusBar_DrawStarsRTS

	LDA Level_NoStars
	BEQ StatusBar_HasStars

	LDA #$FE
	STA Status_Bar_Top + 14
	STA Status_Bar_Top + 15
	STA Status_Bar_Top + 16
	STA Status_Bar_Top + 17
	STA Status_Bar_Top + 18
	INC Top_Needs_Redraw

StatusBar_DrawStarsRTS:
	RTS

StatusBar_HasStars:
	JSR GetLevelBit
	PHA
	LDX #$D6
	AND Paper_Stars_Collected1, Y
	BEQ StatusBar_DrawStars1
	INX

StatusBar_DrawStars1:
	STX Status_Bar_Top + 15
	LDX #$D6
	PLA
	PHA
	AND Paper_Stars_Collected2, Y
	BEQ StatusBar_DrawStars2
	INX

StatusBar_DrawStars2:
	STX Status_Bar_Top + 16
	LDX #$D6
	PLA
	AND Paper_Stars_Collected3, Y
	BEQ StatusBar_DrawStars3
	INX

StatusBar_DrawStars3:
	STX Status_Bar_Top + 17
	INC Top_Needs_Redraw
	RTS
;--------------------------------------

DayNightIcon:
	.byte $D8, $D9

DayNightTiles:
	.byte $60, $74, $61, $74, $62, $74, $63, $74, $64, $65, $66, $67, $70, $71, $72, $73, $74, $60, $74, $61, $74, $62, $74, $63

Game_UpdateDayNightMeter:
	; LDA StatusBar_Mode
	; BNE Game_UpdateDayNightMeter1

	LDA DayNightTicker
	CMP Old_DayNightTicker
	BEQ Game_UpdateDayNightMeter1
	
	STA Old_DayNightTicker
	BNE StatusBar_DrawDayNightMeter
	
Game_UpdateDayNightMeter1:
	RTS
	
StatusBar_DrawDayNightMeter:
	LDX #$00
	
	LDA DayNight
	BPL StatusBar_DrawDayNightMeter1
	INX

StatusBar_DrawDayNightMeter1:
	LDA DayNightIcon, X
	STA Status_Bar_Top + 19
	
	LDA DayNightTicker
	ASL A
	TAX
	
	LDA DayNightTiles, X
	STA Status_Bar_Top + 20
	
	LDA DayNightTiles + 1,X
	STA Status_Bar_Top + 21
	INC Top_Needs_Redraw
	RTS
;--------------------------------------
BadgeTiles:
	.byte $FA, $FA, $FA, $FA ; $00
	.byte $B2, $B3, $C2, $C3 ; $01
	.byte $B6, $B7, $C2, $C3 ; $02
	.byte $C6, $C7, $C2, $C3 ; $03
	.byte $BA, $BB, $CA, $CB ; $04
	.byte $B0, $B1, $C0, $C1 ; $05
	.byte $FF, $FF, $FF, $FF ; $06
	.byte $FF, $FF, $FF, $FF ; $07
	.byte $FF, $FF, $FF, $FF ; $08
	.byte $B4, $B5, $C4, $C5 ; $09
	.byte $FA, $ED, $98, $FA ; $10
	.byte $DC, $DD, $8E, $8F ; $11
	.byte $ED, $FA, $FA, $99; $12
	.byte $EB, $8B, $EC, $9B; $13
	.byte $FA, $89, $ED, $FA; $14
	.byte $8C, $8D, $DC, $DD; $15
	.byte $88, $FA, $FA, $ED; $16
	.byte $8A, $EB, $9A, $EC; $17
	.byte $B4, $B5, $C4, $C5 ; $18

Game_UpdateBadge:
	; LDA StatusBar_Mode
	; BNE Game_UpdateBadge1

	LDA Player_Badge
	CMP Old_Player_Badge
	BEQ Game_UpdateBadge1
	
	STA Old_Player_Badge
	BNE StatusBar_DrawBadge

Game_UpdateBadge1:	
	RTS

StatusBar_DrawBadge:
	LDA Player_Badge
	ASL A
	ASL A
	TAX
	
	LDA BadgeTiles, X
	STA (Status_Bar_Top + 23)
	
	LDA BadgeTiles + 1, X
	STA (Status_Bar_Top + 24)
	
	LDA BadgeTiles + 2, X
	STA (Status_Bar_Bottom + 23)
	
	LDA BadgeTiles + 3, X
	STA (Status_Bar_Bottom + 24)

	INC Top_Needs_Redraw
	INC Bottom_Needs_Redraw
	RTS	

;--------------------------------------

PowerUp_Reserve_Item:
	.byte $FA, $FA, $FA, $FA ; $00
	.byte $00, $01, $10, $11 ; $01
	.byte $02, $03, $12, $13 ; $02
	.byte $04, $05, $14, $15 ; $03
	.byte $06, $07, $16, $17 ; $04
	.byte $08, $09, $18, $19 ; $05
	.byte $0A, $0B, $1A, $1B ; $06
	.byte $0C, $0D, $1C, $1D ; $07
	.byte $0E, $0F, $1E, $1F ; $08
	.byte $68, $69, $78, $79 ; $09
	.byte $6A, $6B, $7A, $7B ; $0A
	.byte $9C, $9D, $AC, $AD ; $0B
	.byte $9E, $9F, $AE, $AF ; $0C
	.byte $6E, $6F, $7C, $7D ; $0D
	.byte $6E, $6F, $7C, $7C ; $0E
	.byte $6C, $6D, $7C, $7C ; $0F
	.byte $6A, $6B, $7E, $7F ; $11

Game_UpdateReserve:
	LDA PowerUp_Reserve
	CMP Old_PowerUp_Reserve
	BEQ Game_UpdateReserve1
	
	STA Old_PowerUp_Reserve
	BNE StatusBar_DrawReserve

Game_UpdateReserve1:	
	RTS
	
StatusBar_DrawReserve:
	LDA PowerUp_Reserve
	ASL A
	ASL A
	TAX
	
	LDA PowerUp_Reserve_Item, X
	STA (Status_Bar_Top + 26)
	
	LDA (PowerUp_Reserve_Item + 1), X
	STA (Status_Bar_Top + 27)
	
	LDA PowerUp_Reserve_Item + 2, X
	STA (Status_Bar_Bottom + 26)
	
	LDA (PowerUp_Reserve_Item + 3), X
	STA (Status_Bar_Bottom + 27)

Item_ReserveRTS:
	INC Top_Needs_Redraw
	INC Bottom_Needs_Redraw
	RTS

;----------------------------------------------
Game_UpdateLevelName:
	LDX Graphics_BufCnt
	BNE Game_UpdateLevelNameRTS

	LDA #$2B
	STA Graphics_Buffer, X
	
	LDA #$82
	STA Graphics_Buffer + 1, X
	
	LDA #$1C
	LDY #$00
	STA Graphics_Buffer + 2, X

LevelName_Loop:
	LDA LevelName,Y	; Get next byte from StatusBar_UpdTemplate
	STA Graphics_Buffer + 3,X		; Store it into the graphics buffer

	INY				; Y++
	INX				; X++
	CPY #$1C
	BNE LevelName_Loop	 		

	LDA #$00
	STA Graphics_Buffer + 3, X
	
	LDA Graphics_BufCnt
	CLC
	ADC #$1E
	STA Graphics_BufCnt

	LDA #$00
	STA Update_Level_Name

Game_UpdateLevelNameRTS:	
	RTS

Process_Spinners:
	LDA Game_Counter
	AND #$07
	TAX

Process_SpinnersNext:
	LDA SpinnerBlocksActive, X
	BEQ SpinnerRTS

	DEC SpinnerBlocksTimers, X
	BNE SpinnerRTS
	
	LDA Block_NeedsUpdate
	BNE Process_ReverseSpinner

	LDA #$80
	STA Block_NeedsUpdate

	LDA SpinnerBlocksX, X
	AND #$F0
	STA Block_ChangeX
	STA <Poof_X
	STA <Point_X

	LDA SpinnerBlocksXHi, X
	STA Block_ChangeXHi
	STA <Point_XHi
	 
	LDA SpinnerBlocksY, X
	AND #$F0
	STA Block_ChangeY
	STA <Poof_Y
	STA <Point_Y

	LDA SpinnerBlocksYHi, X
	STA Block_ChangeYHi
	STA <Point_YHi

	LDA SpinnerBlocksReplace, X
	STA Block_UpdateValue

	LDA SpinnerBlocksPoof, X
	BEQ SpinnerReset

	JSR CheckPoint_OffScreen
	BCC SpinnerReset

	JSR Common_MakePoof

SpinnerReset:
	LDA #$00
	STA SpinnerBlocksActive, X
	STA SpinnerBlocksPoof, X

SpinnerRTS:	
	RTS

Process_ReverseSpinner:
	INC SpinnerBlocksTimers, X
	RTS	

InitPals_Per_MapPUp:
	; Palettes as indexed by InitPal_Per_MapPowerup
	; Note that the first byte is never actually used.
	; Also note this should agree with Map_PostJC_PUpPP1/2 in PRG010
	; See also PRG027 InitPals_Per_MapPUp
	.byte $FF,  $0F, $16, $36	; 0 - Mario default palette
	.byte $FF,  $0F, $16, $36	; 1 - #DAHRKDAIZ SUPER MARIO
	.byte $FF,  $06, $30, $36	; 2 - Fire Flower
	.byte $FF,  $0F, $16, $36	; 3 - Leaf (Not used, uses 0 or 1 as appropriate)
	.byte $FF,  $0F, $28, $36	; 4 - Frog Suit
	.byte $FF,  $0F, $19, $36	; 5 - #DAHRKDAIZ Koopa Suit
	.byte $FF,  $0F, $30, $27	; 6 - Hammer Suit
	.byte $FF,  $01, $30, $31	; 7 - #DAHRKDAIZ Ice Mario
	.byte $FF,  $06, $27, $36	; 8 - #DAHRKDAIZ Fire Fox Mario
	.byte $FF,  $01, $30, $31	; 9 - Unused
	.byte $FF,  $0F, $06, $30	; A - #DAHRKDAIZ Boo Mario
	.byte $FF,  $0F, $36, $36	; B - #DAHRKDAIZ Ninja Mario

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Setup_PalData
;
; This subroutine loads the Pal_Data array with a set
; of colors based on Level_Tileset and thevalues in
; PalSel_Tile_Colors and PalSel_Obj_Colors OR base on
; the override value Pal_Force_Set12.  This also
; performs the corrections of red/green for Mario vs.
; Luigi (see Map_PlayerPalFix and BonusGame_PlayerPal)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Setup_PalData:
	LDX #$01
	LDA PaletteEffect
	
	CMP #$02
	BNE SetDNActive1
	
	LDX #$00

SetDNActive1:
	STX DayNightActive

	LDA PAGE_C000
	STA DAIZ_TEMP1

	LDA #20
	STA PAGE_C000

	JSR PRGROM_Change_C000

	LDA #$00
	STA <Temp_Var2

	LDA PaletteIndex
	STA <Temp_Var1
	CLC
	ROL <Temp_Var1
	ROL <Temp_Var2

	ROL <Temp_Var1
	ROL <Temp_Var2

	ROL <Temp_Var1
	ROL <Temp_Var2

	ROL <Temp_Var1
	ROL <Temp_Var2

	ROL <Temp_Var1
	ROL <Temp_Var2

	LDA <Temp_Var2
	CLC
	ADC #$C0
	STA <Temp_Var2

	; Copy 32 bytes of data into Pal_Data
	LDY #31	 ; Y = 31 (32 bytes total, a whole bg/sprite palette set)
	LDX #$0F

PRG027_B85E:
	LDA [Temp_Var1],Y
	STA Pal_Data,Y	
	
	CPY #$10
	BCS SkipMasterBackup
	STA MasterPal_Data, X
	DEX

SkipMasterBackup:
	DEY		 ; Y--
	BPL PRG027_B85E	 ; While Y >= 0, loop

	LDA DayNightActive
	BEQ No_Darken

	LDA DayNight
	BEQ No_Darken

	LDA Pal_Data
	CMP #$0F
	BEQ No_Darken

	LDX #$0F

Darken_Pal:
	LDA Pal_Data, X
	SEC
	SBC #$10
	BMI Skip_Darken

	STA Pal_Data, X

Skip_Darken:
	DEX
	BPL Darken_Pal

	LDA #$0F
	STA Pal_Data

No_Darken:
	; Technically all transparent colors are duplicates, but this basically
	; ensures that they're all equivalent in the palette RAM copy...
	LDA Pal_Data
	STA Pal_Data+16
	STA Pal_Data+20
	STA Pal_Data+24
	STA Pal_Data+28


	; The following patches in the correct palette for the
	; power-up the Player current has active.  Note this is
	; ONLY for the INITIAL LOADING of the map screen.

	LDA World_Map_Power	; A = World_Map_Power of this player
	ASL A		 
	ASL A		 
	TAY		 	; Y <<= 2

	; Store the correct power-up suit colors over the Player colors
	LDA InitPals_Per_MapPUp+3,Y
	STA Pal_Data+19

	LDA InitPals_Per_MapPUp+2,Y
	STA Pal_Data+18

	LDA InitPals_Per_MapPUp+1,Y
	STA Pal_Data+17 

PRG027_B8F9:
	; restores the C000 bank
	LDA DAIZ_TEMP1
	STA PAGE_C000
	JSR PRGROM_Change_C000

	RTS		 ; Return

Messages_Lookup:
	.word Empty_Message
	.word Game_Script_1_A
	.word Game_Script_1_1
	.word Game_Script_1_2
	.word Game_Script_1_3
	.word Game_Script_1_4
	.word Game_Script_1_5
	.word Game_Script_2_A
	.word Game_Script_2_1
	.word Game_Script_2_2
	.word Game_Script_2_3
	.word Game_Script_2_4
	.word Game_Script_2_5
	.word Game_Script_2_6
	.word Game_Script_2_7
	.word Game_Script_3_A
	.word Game_Script_3_1
	.word Game_Script_3_2
	.word Game_Script_3_3
	.word Game_Script_3_4
	.word Game_Script_3_5
	.word Game_Script_3_6
	.word Game_Script_3_7
	.word Game_Script_3_8
	.word Game_Script_3_9
	.word Badge_A_Explanation
	.word Badge_B_Explanation
	.word Badge_C_Explanation
	.word Badge_D_Explanation
	.word Badge_E_Explanation
	.word Badge_F_Explanation
	.word Level_Up1
	.word Level_Up2
	.word Level_Up3
	.word Level_Up4
	.word Level_Up5
	.word Level_Up6
	.word Second_QuestMsg
	.word Tutorial_Fire_1
	.word Tutorial_Fire_2
	.word Tutorial_Ice_1
	.word Tutorial_Ice_2
	.word Tutorial_Raccoon
	.word Tutorial_Fox_1
	.word Tutorial_Fox_2
	.word Tutorial_Koopa_1
	.word Tutorial_Koopa_2
	.word Tutorial_Frog_1
	.word Tutorial_Frog_2
	.word Tutorial_Sledge_1
	.word Tutorial_Sledge_2
	.word Tutorial_Ninja_1
	.word Tutorial_Ninja_2
	.word Training_1
	.word Training_2
	.word Training_3
	.word Training_4
	.word Training_5
	.word Training_6

Empty_Message:
	.byte $00

Messages_Table:
Game_Script_1_A:                ;V 
	.db "WIN 3 OUT OF 5 TO     "
	.db "MAKE IT OUT ALIVE...  "

Game_Script_1_1:                 
	.db "COLLECT ALL THE COINS "
	.db "BEFORE TIME ENDS      "

Game_Script_1_2:
	.db "DEFEAT 8 GOOMBAS      "
	.db "BEFORE TIME ENDS      "

Game_Script_1_3:
	.db "COMPLETE THE SPRITE   "
	.db "BEFORE TIME ENDS      "

Game_Script_1_4:
	.db "BREAK ALL THE BRICKS  "
	.db "BEFORE TIME ENDS      "

Game_Script_1_5:
	.db "PLACE THE MUSHROOM    "
	.db "BEFORE TIME ENDS      "

Game_Script_2_A:                
	.db "WITHIN 7, WIN 4. NOW  "
	.db "GO IN THE NEXT DOOR   "

Game_Script_2_1:                 
	.db "COLLECT 20 COINS      "
	.db "BEFORE TIME ENDS      "

Game_Script_2_2:
	.db "DEFEAT 13 SPINIES, 1  "
	.db "BUZZY BEFORE TIME ENDS"

Game_Script_2_3:	
	.db "COMPLETE THE SPRITE   "
	.db "BEFORE TIME ENDS      "

Game_Script_2_4:
	.db "BREAK ALL THE BRICKS  "
	.db "BEFORE TIME ENDS      "

Game_Script_2_5:
	.db "PLACE THE MUSHROOM    "
	.db "BLOCKS BEFORE TIME END"

Game_Script_2_6:
	.db "HIT ALL THE SWITCHES  "
	.db "BEFORE TIME ENDS      "

Game_Script_2_7:
	.db "FIND THE POWERUP      "
	.db "BEFORE TIME ENDS      "

Game_Script_3_A:
	.db "9 GAMES, THINK FAST   "
	.db "OR YOU WILL NOT LAST  "

Game_Script_3_1:
	.db "COLLECT 64 COINS      "
	.db "BEFORE TIME ENDS      "

Game_Script_3_2:
	.db "DEFEAT 3 PIRANHA      "
	.db "PLANTS BEFORE TIME END"

Game_Script_3_3:	
	.db "COMPLETE THE SPRITE   "
	.db "BEFORE TIME ENDS      "

Game_Script_3_4:
	.db "BREAK ALL THE BRICKS  "
	.db "BEFORE TIME ENDS      "

Game_Script_3_5:
	.db "PLACE THE MUSHROOM    "
	.db "BLOCKS BEFORE TIME END"

Game_Script_3_6:
	.db "HIT ALL THE SWITCHES  "
	.db "BEFORE TIME ENDS      "

Game_Script_3_7:
	.db "FIND THE POWERUP      "
	.db "BEFORE TIME ENDS      "

Game_Script_3_8:
	.db "AVOID FIREBALLS FOR   "
	.db "THE ALLOTTED TIME     "

Game_Script_3_9:
	.db "MAKE IT TO THE DOOR   "
	.db "BEFORE TIME ENDS      "

Badge_A_Explanation:
	.db "ALL XP EARNED IS      "
	.db "DOUBLED               "

Badge_B_Explanation:
	.db "DOUBLE LENGTH P METER "
	.db "POWER USAGE           "

Badge_C_Explanation:
	.db "ALL COINS COLLECTED   "
	.db "ARE DOUBLED           "

Badge_D_Explanation:
	.db "AIR METER LASTS MUCH  "
	.db "LONGER                "

Badge_E_Explanation:
	.db "OLD POWERUP GOES INTO "
	.db "RESERVE, SELECT TO USE"

Badge_F_Explanation:
	.db "FIND MAGIC STARS      "
	.db "HIDDEN NEARBY         "

Level_Up1:
	.db "TAKE AN EXTRA HIT WHEN"
	.db "FULLY POWERED UP      "

Level_Up2:
	.db "START LEVELS AS SUPER "
	.db "WHEN NO POWERUP!      "

Level_Up3:
	.db "INCREASE RECOVERY TIME"
	.db "WHEN TAKING DAMAGE!   "

Level_Up4:
	.db "ITEM BLOCKS ALWAYS    "
	.db "CONTAIN FULL POWERUP! "

Level_Up5:
	.db "HOLD UP AND PRESS A TO"
	.db "PERFORM A DOUBLE JUMP!"

Level_Up6:
	.db "50 CHERRIES HOLD A & B"
	.db "PRESS SELECT  FOR STAR"

Second_QuestMsg:
	.db "ENTER THE PIPE TO FIND"
	.db "A QUEST FOR EXPERTS.  "

Tutorial_Fire_1:
	.db " B THROWS FIREBALLS,  "
	.db " HOLD UP TO THROW UP. "

Tutorial_Fire_2:
	.db "  MELT ICE BELOW AND  "
	.db "   ABOVE TO PROCEED.  "

Tutorial_Ice_1:
	.db "  B THROWS ICEBALLS,  "
	.db "FREEZE ENEMIES & WATER"

Tutorial_Ice_2:
	.db "STAND ON FROZEN FOES, "
	.db "OR KICK THEM FORWARD. "

Tutorial_Raccoon:
	.db "B BAT YOUR TAIL AND   "
	.db "DEFLECT PROJECTILES.  "

Tutorial_Fox_1:
	.db "DOUBLE TAP AND HOLD B "
	.db "  TO DASH AND ATTACK. "

Tutorial_Fox_2:
	.db "SWIM IN LAVA AND AVOID"
	.db "FIRE BASED DAMAGE.    "

Tutorial_Frog_1:
	.db "BREATHE UNDER WATER & "
	.db "JUMP MUCH HIGHER.     "

Tutorial_Frog_2:
	.db "DOUBLE TAP AND HOLD B "
	.db "TO BECOME  INVINCIBLE."

Tutorial_Koopa_1:
	.db "RUN AND HOLD DOWN TO  "
	.db "SPIN IN A SHELL.      "
	
Tutorial_Koopa_2:
	.db "USE SHELL SPINS TO    "
	.db "BOUNCE OFF HAZARDS.   "

Tutorial_Sledge_1:
	.db "B TO THROW HAMMERS &  "
	.db "BREAK BRICKS & STONE. "

Tutorial_Sledge_2:
	.db "IN THE AIR, HOLD DOWN "
	.db "AND PRESS B TO POUND! "

Tutorial_Ninja_1:
	.db " B & ANY DIRECTION TO "
	.db "   THROW SHURIKENS.   "

Tutorial_Ninja_2:
	.db "SLIDE AGAINST THE WALL"
	.db "& PRESS A TO WALLJUMP."

Training_1:
	.db "   GET HIT 10 TIMES   "
	.db "    IN 120 SECONDS!   "

Training_2:
	.db "BREAK 50 BRICKS BLOCKS"
	.db "    IN 100 SECONDS!   "

Training_3:
	.db "  USE DAMAGE BOOST TO "
	.db "    REACH THE END!    "

Training_4:
	.db "DESTROY 10 SPINIES TO "
	.db "CYCLE THROUGH POWERUPS"

Training_5:
	.db "JUMP TO AVOID ALL THE "
	.db "  INCOMING OBSTACLES! "

Training_6:
	.db "  COLLECT 50 CHERRIES "
	.db "   WHILE  INVINCIBLE  "
					

Message_Low = Temp_Var1
Message_Hi = Temp_Var2
Message_Text_Top = Status_Bar_Top
Message_Text_Bottom = Status_Bar_Bottom - 22

Messages_Display:
	LDA Message_Id
	BNE Messages_DisplayDraw

	INC Force_StatusBar_Init

	LDA #$00
	STA Message_Id_Prev
	RTS

Messages_DisplayDraw:
	CMP Message_Id_Prev
	BEQ Messages_DisplayRTS

	LDA #$01
	STA Top_Needs_Redraw
	STA Bottom_Needs_Redraw

	LDA Message_Id
	STA Message_Id_Prev
	ASL A
	TAX

	LDA Messages_Lookup, X
	STA <Message_Low

	LDA Messages_Lookup + 1, X
	STA <Message_Hi

	LDY #$00

Message_Load:	
	LDA [Message_Low], Y
	CPY #22
	BCS Message_Write_Bottom

	STA Message_Text_Top, Y
	JMP Message_Loop

Message_Write_Bottom:
	STA Message_Text_Bottom, Y

Message_Loop:
	INY
	CPY #44
	BCC Message_Load
	RTS

Message_Fill:
	LDA #$20

	CPY #$22
	BCS Message_Fill_Bottom
	STA Message_Text_Top, Y
	JMP Message_Fill_Loop

Message_Fill_Bottom:
	STA Message_Text_Bottom, Y

Message_Fill_Loop:	
	INY
	CPY #44
	BCC Message_Fill

Messages_DisplayRTS:	
	RTS

Map_DayNightPalIndex:
	.byte $09, $0E, $03, $00, $0A, $0B, $07, $06

Map_DayNightPalette:
	LDA DayNight
	BEQ Map_DayNightPaletteRTS

	LDX World_Num
	LDA Map_DayNightPalIndex, X
	TAX

	LDA #$0F
	STA Pal_Data, X

	LDA World_Num
	CMP #$07
	BNE Map_DayNightPaletteRTS

	LDA #$0F
	STA Pal_Data + $0F

Map_DayNightPaletteRTS:
	RTS

Title_StarStartHideTimers:
	.byte $00, $40, $80, $C0

Title_StarStartSRAM:
	.byte $00, $08, $10, $18

Title_StarStartX:
	.byte $00, $20, $00, $80

Title_StarStartY:
	.byte $20, $00, $80, $00

Title_RandomOffsetX:
	.word Save_Ram_CheckSum
	.word Save_Ram_CheckSum + 1
	.word Save_Ram_CheckSum + 1
	.word Save_Ram_CheckSum

Title_RandomOffsetY:
	.word Save_Ram_CheckSum + 1
	.word Save_Ram_CheckSum
	.word Save_Ram_CheckSum
	.word Save_Ram_CheckSum + 1

Title_RandomizeStars:
	LDA #$00
	STA Title_StarGfxTimer
	
	LDX #$03

Title_NextStar:
	TXA 
	ASL A
	TAY 

	LDA Title_RandomOffsetX, Y
	STA <Temp_Var2

	LDA Title_RandomOffsetX + 1, Y
	STA <Temp_Var1

	LDA Title_RandomOffsetY, Y
	STA <Temp_Var4

	LDA Title_RandomOffsetY + 1, Y
	STA <Temp_Var3

	LDY #$00

	LDA Title_StarStartX, X
	ADD [Temp_Var1], Y
	STA Title_StarsX, X

	LDA Title_StarStartY, X
	ADD [Temp_Var3], Y
	STA Title_StarsY, X

	LDA #$20
	STA Title_StarsSparkleTimer, X

	LDA Title_StarStartHideTimers, X
	STA Title_StarsHideTimer, X

	LDA #$20
	STA Title_StarsSparkleTimer, X

	LDA Title_StarStartSRAM, X
	STA Title_StarsSRAM, X

	DEX
	BPL Title_NextStar

	RTS

Title_StarGfxTimer = $7500
Title_StarDoTimer = $7501

Title_StarPatTables:
	.byte $90, $91, $92, $93

Title_DoStars:
	INC Title_StarDoTimer

	LDA Title_StarDoTimer
	AND #$1F
	BEQ Title_DoStars1
	RTS

Title_DoStars1:
	INC Title_StarGfxTimer
	LDA Title_StarGfxTimer
	LSR A
	LSR A
	LSR A
	AND #$03
	TAY

	LDA Title_StarPatTables, Y
	STA PatTable_BankSel + 5

	LDX #$03

Title_StarLoop:
	JSR Title_StarNorm
	
	DEX
	BPL Title_StarLoop

	LDX #$0F

Title_SparkleLoop:
	JSR Title_Sparkle
	
	DEX
	BPL Title_SparkleLoop
	RTS

Title_StarsHideTimer = $7400
Title_StarsSparkleTimer = $7410
Title_StarsX = $7420
Title_StarsXFrac = $7428
Title_StarsY = $7430
Title_StarsYFrac = $7438
Title_StarTicker = $7440
Title_StarsSRAM = $7450
Title_SparklesX = $7470
Title_SparklesY = $7480
Title_SparklesTimer = $7490

Title_Affect:
	.byte $00, PAD_A, PAD_B, PAD_A | PAD_B

Title_SpeedModifiersXY
	.byte $80, $80  ; $80
	.byte $FF, $80  ; $FF (PAD_RIGHT)
	.byte $40, $80  ; $02 (PAD_LEFT)
	.byte $80, $80  ; $03 (PAD_LEFT | PAD_RIGHT)
	.byte $80, $FF  ; $04 (PAD_DOWN)
	.byte $FF, $FF  ; $05 (PAD_DOWN | PAD_RIGHT)
	.byte $40, $FF  ; $06 (PAD_DOWN | PAD_LEFT)
	.byte $80, $80	; $07 (PAD_DOWN | PAD_LEFT | PAD_RIGHT)
	.byte $80, $40  ; $08 (PAD_UP)
	.byte $FF, $40  ; $09 (PAD_UP | PAD_RIGHT)
	.byte $40, $40  ; $0A (PAD_UP | PAD_LEFT)
	.byte $80, $80	; $0B (PAD_UP | PAD_LEFT | PAD_RIGHT)
	.byte $80, $80	; $0C (PAD_UP | PAD_DOWN)
	.byte $80, $80	; $0D (PAD_UP | PAD_DOWN | PAD_RIGHT)
	.byte $80, $80	; $0E (PAD_UP | PAD_DOWN | PAD_LEFT)
	.byte $80, $80	; $0F (PAD_UP | PAD_DOWN | PAD_LEFT | PAD_RIGHT)

Title_StarNorm:
	LDA Title_StarsHideTimer, X
	BEQ Title_StarMove

	DEC Title_StarsHideTimer, X
	RTS

Title_StarMove:
	LDY #$00

	LDA <Pad_Holding
	AND #(PAD_A | PAD_B)
	LSR A
	LSR A
	LSR A
	LSR A
	LSR A
	LSR A
	STA <Temp_Var1

	CPX <Temp_Var1
	BNE Title_StarMoveX

	LDA <Pad_Holding
	AND #$0F
	ASL A
	TAY

Title_StarMoveX:
	LDA Title_StarsXFrac, X
	ADD Title_SpeedModifiersXY, Y
	STA Title_StarsXFrac, X

	LDA Title_StarsX, X
	ADC #$00
	STA Title_StarsX, X

	BCC Title_StarMoveY

	;JMP Title_StarReset

Title_StarMoveY:
	LDA Title_StarsYFrac, X
	ADD Title_SpeedModifiersXY + 1, Y
	STA Title_StarsYFrac, X

	LDA Title_StarsY, X
	ADC #$00
	STA Title_StarsY, X
	BCC Title_StarTimer
	
	;JMP Title_StarReset

Title_StarTimer:
	DEC Title_StarsSparkleTimer, X
	LDA Title_StarsSparkleTimer, X
	BNE Title_StarDraw

 	JSR Title_MakeSparkle

	LDA #$20
	STA Title_StarsSparkleTimer, X

Title_StarDraw:
	LDY Title_StarsSRAM, X
	
	LDA #$FF
	STA Sprite_RAMTile, Y
	STA Sprite_RAMTile+4, Y

	LDA Title_StarsX, X
	STA Sprite_RAMX, Y

	ADD #$08
	BCC Title_StarDrawX

	LDA #$FF
	STA Sprite_RAMY + 4, Y 

Title_StarDrawX:
	STA Sprite_RAMX + 4, Y

	LDA Title_StarsY, X
	STA Sprite_RAMY, Y
	STA Sprite_RAMY+4, Y

	LDA Save_Ram_CheckSum + 1
	ADD #SPR_PAL2
	AND #SPR_PAL3
	STA Sprite_RAMAttr, Y

	ORA #SPR_HFLIP
	STA Sprite_RAMAttr+4, Y
	RTS

Title_MakeSparkle:
	LDY #$07

Title_MakeSparkleLoop:
	LDA Title_SparklesTimer, Y
	BEQ Title_CreateSparkle

	DEY
	BPL Title_MakeSparkleLoop
	RTS

Title_CreateSparkle:
	LDA #$30
	STA Title_SparklesTimer, Y
	
	LDA Title_StarsX, X
	STA Title_SparklesX, Y

	LDA Title_StarsY, X
	STA Title_SparklesY, Y
	RTS


Title_SparkleAttribute:
	.byte $00, (SPR_HFLIP), (SPR_VFLIP), (SPR_HFLIP | SPR_VFLIP)
	.byte $00, (SPR_HFLIP), (SPR_VFLIP), (SPR_HFLIP | SPR_VFLIP)
	.byte $00, (SPR_HFLIP), (SPR_VFLIP), (SPR_HFLIP | SPR_VFLIP)
	.byte $00, (SPR_HFLIP), (SPR_VFLIP), (SPR_HFLIP | SPR_VFLIP)

Title_SparkleSRAM:
	.byte $20, $24, $28, $2C, $30, $34, $38, $3C
	.byte $40, $44, $48, $4C, $50, $54, $58, $5C

Title_Sparkle:
	LDA Title_SparklesTimer, X
	BNE Title_SparkleDraw

Title_ClearSparkle:
	LDA #$FF
	STA Title_SparklesX, X
	STA Title_SparklesY, X
	RTS

Title_SparkleDraw:
	DEC Title_SparklesTimer, X
	LDA Title_SparkleSRAM, X
	TAY

	LDA Title_SparklesY, X
	SUB #$18
	CMP #$40
	BCC Title_ClearSparkle

	LDA Title_SparklesY, X
	STA Sprite_RAMY, Y

	LDA Title_SparklesX, X
	STA Sprite_RAMX, Y

	LDA #$F1
	STA Sprite_RAMTile, Y

	LDA Save_Ram_CheckSum + 1
	ADD #SPR_PAL2
	AND #SPR_PAL3
	ORA Title_SparkleAttribute, X
	STA Sprite_RAMAttr, Y

Title_SparkleRTS:
	RTS

Title_StarResetX:
	.byte $00, $20, $00, $40, $00, $60, $00, $80

Title_StarResetY:
	.byte $20, $00, $40, $00, $60, $00, $80, $00

Title_StarResetHide:
	.byte $20, $40, $60, $80, $A0, $C0, $E0, $FF

Title_StarReset:
	LDA RandomN, X
	AND #$07
	TAY

	LDA Title_StarResetX, Y
	STA Title_StarsX, X

	LDA Title_StarResetY, Y
	STA Title_StarsY, X

	LDA Title_StarResetHide, Y
	STA Title_StarsHideTimer, X
	RTS