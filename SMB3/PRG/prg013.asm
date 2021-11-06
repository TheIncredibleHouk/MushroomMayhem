	.org $C000

HandleLevelEvent:

	LDA EventType
	JSR DynJump

	.word NoEvent ;00
	.word FloodFloor1 ;01
	.word FloodFloor2 ; 02
	.word LetEnemyHandle ;03
	.word TileSwitch ;04
	.word Snow_Event ;05
	.word Fireball_Event ;06
	.word Direction_Switch ;07
	.word Lava_Flood ; 08

NoEvent:
LetEnemyHandle:
	RTS

FFLevelsY:	.byte $17, $16, $15, $14, $13, $12, $11, $10
			.byte $0B, $0A, $09, $08, $07, $06, $05, $04

FloodFloor:
	LDA #$01
	STA Player_VibeDisable
	
	LDA Objects_State
	BNE FloodFloorRTS

	LDA #OBJ_EVENTFILLER
	STA Objects_ID

	LDA #$00
	STA Objects_Property

	LDA #OBJSTATE_INIT
	STA Objects_State

	LDA #$9C
	STA <Objects_XZ

	LDA #$00
	STA <Objects_XHiZ

	LDA #$04
	STA <Objects_XVelZ

	LDA FFLevelsY, X
	AND #$F0
	LSR A
	LSR A
	LSR A
	LSR A
	STA Objects_YHiZ

	LDA FFLevelsY, X
	AND #$0F
	ASL A
	ASL A
	ASL A
	ASL A
	STA Objects_YZ

	INC EventVar

FloodFloorRTS:
	RTS

FloodFloor1:
	LDX EventVar
	CPX #$08
	BEQ FloodFloorEnd

	JMP FloodFloor

FloodFloor2:
	LDA EventVar
	CMP #$08
	BEQ FloodFloorEnd

	ADD #$08
	TAX
	JMP FloodFloor

FloodFloorEnd:
	LDA #$00
	STA Player_VibeDisable
	STA EventSwitch
	RTS


TileSwitch_Tables:
	.byte $60, $62, $64, $66

TileSwitch:
	LDA EventSwitch
	BEQ TileSwitchRTS

	AND #$C0
	LSR A
	LSR A
	LSR A
	LSR A
	LSR A
	LSR A
	TAY

	LDA TileSwitch_Tables, Y
	STA PatTable_BankSel

	LDA #$00
	STA TileProperties + $37
	STA TileProperties + $77
	STA TileProperties + $B7
	STA TileProperties + $F7

	LDA #(TILE_PROP_SOLID_TOP | TILE_PROP_ESWITCH)
	STA TileProperties + $38
	STA TileProperties + $39
	STA TileProperties + $78
	STA TileProperties + $79
	STA TileProperties + $B8
	STA TileProperties + $B9
	STA TileProperties + $F8
	STA TileProperties + $F9
	
	LDA EventSwitch
	AND #$C0

	ORA #$37

	TAY

	LDA #TILE_PROP_SOLID_ALL
	STA TileProperties, Y

	LDA #$00
	STA TileProperties + 1, Y
	STA TileProperties + 2, Y
	STA EventSwitch

TileSwitchRTS:
	RTS

Snow_Event:
	LDA EventVar
	BNE Snow_Event1

	LDA <Player_XHi

	JSR DynJump
	
	.word Snow_EventLeftInit
	.word Snow_EventRightInit

Snow_Event1:
	JMP Snow_EventMove

Snow_EventLeftXStart:
	.byte $C0, $F0, $D0, $F8, $D8

Snow_EventRightXStart:
	.byte $40, $10, $30, $08, $38

Snow_EventLeftXVel:
	.byte $FB, $FC, $FB, $FD, $FC, $FB

Snow_EventRightXVel:
	.byte $05, $04, $05, $03, $04, $05

Snow_EventLeftColumns:
	.byte $F0, $E0, $D0, $C0, $B0, $A0, $90, $80, $70, $60, $50, $40, $30, $20, $10, $00

Snow_EventRightColumns:
	.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Snow_EventYStart:
	.byte $02, $07, $13, $15, $21, $2B

Snow_EventPatterns:
	.byte $55, $55, $5F, $55, $5F, $5F

Snow_EventDrawTicker = Objects_Data1
Snow_EventDoDraw = Objects_Data2
Snow_EventColumnsXHi = Objects_Data3
Snow_EventChangeColumns = Objects_Data4

Snow_EventLeftInit:
	LDY #$05
	
Snow_EventLeftInitNext:
	LDA Snow_EventLeftXStart, Y
	STA Weather_XPos, Y

	LDA Snow_EventYStart, Y
	STA Weather_YPos, Y

	LDA #$00
	STA Weather_YVel, Y

	LDA Snow_EventLeftXVel, Y
	STA Weather_XVel, Y

	DEY
	BPL Snow_EventLeftInitNext

	LDY #$0F

Snow_EventStoreColumnsLeft:
	LDA Snow_EventLeftColumns, Y
	STA Snow_EventChangeColumns, Y
	DEY
	BPL Snow_EventStoreColumnsLeft

	INC EventVar
	
	LDA #$00
	STA EventTicker
	STA Snow_EventDrawTicker
	STA Snow_EventColumnsXHi

	LDA #$01
	STA Snow_EventDoDraw
	RTS

Snow_EventRightInit:
	LDY #$05
	
Snow_EventRightInitNext:
	LDA Snow_EventRightXStart, Y
	STA Weather_XPos, Y

	LDA Snow_EventYStart, Y
	STA Weather_YPos, Y

	LDA #$00
	STA Weather_YVel, Y

	LDA Snow_EventRightXVel, Y
	STA Weather_XVel, Y

	DEY
	BPL Snow_EventRightInitNext

	LDY #$0F

Snow_EventStoreColumnsRight:
	LDA Snow_EventRightColumns, Y
	STA Snow_EventChangeColumns, Y
	DEY
	BPL Snow_EventStoreColumnsRight

	INC EventVar
	
	LDA #$00
	STA EventTicker
	STA Snow_EventDrawTicker

	LDA #$01
	STA Snow_EventDoDraw
	STA Snow_EventColumnsXHi
	RTS

Snow_EventMove:
	LDX #$05
	LDY Object_SpriteRAMOffset

Snow_MoveNext:
	LDA Weather_XPos, X
	ADD Weather_XVel, X
	STA Weather_XPos, X
	STA Sprite_RAMX, Y

	LDA Weather_YPos, X
	STA Sprite_RAMY, Y

	LDA Snow_EventPatterns, X
	STA Sprite_RAMTile, Y

	LDA #(SPR_PAL1 | SPR_BEHINDBG)
	STA Sprite_RAMAttr, Y

	INY
	INY
	INY
	INY

	DEX
	BPL Snow_MoveNext

	LDA Snow_EventDoDraw
	BEQ Snow_MoveNextRTS

	LDA #$01
	STA Player_VibeDisable

	LDA Block_NeedsUpdate
	BNE Snow_MoveNextRTS

	LDA Snow_EventDrawTicker
	AND #$07
	BNE Snow_EventIncTicker

	
	LDA Snow_EventDrawTicker
	AND #$78
	LSR A
	LSR A
	LSR A

	TAY
	LDA Snow_EventChangeColumns, Y
	STA Block_ChangeX
	STA Poof_X

	LDA Snow_EventColumnsXHi
	STA Block_ChangeXHi

	LDA #$90
	STA Block_ChangeY
	STA Poof_Y

	LDA #$01
	STA Block_ChangeYHi
	STA Poof_YHi

	LDA #$06
	STA Block_UpdateValue
	STA Block_NeedsUpdate

	JSR Common_MakePoof

Snow_EventIncTicker:
	INC Snow_EventDrawTicker

	BPL Snow_MoveNextRTS

	LDA #$00
	STA Snow_EventDoDraw

Snow_MoveNextRTS:
	RTS

Fireball_Event
	LDA #$01
	STA Player_VibeDisable

	LDA EventVar
	JSR DynJump

	.word Fireball_EventInit
	.word Fireball_EventShoot
	.word Fireball_EventFlash
	.word Fireball_ClearTiles
	.word Fireball_EventUnflash

Fireball_EventTimer = Objects_Data1

Fireball_EventInit:
	LDA #$FF
	STA Fireball_EventTimer

	INC EventVar
	RTS

Fireball_EventY:
	.byte $00, $08, $10, $18, $20, $28, $30, $24


Fireball_EventYVel:
	.byte $00, $F4, $00, $04

Fireball_XWrite:
	.byte $80, $90, $A0, $B0, $C0, $D0, $E0, $F0
	.byte $80, $90, $A0, $B0, $C0, $D0, $E0, $F0
	.byte $80, $90, $A0, $B0, $C0, $D0, $E0, $F0
	.byte $80, $90, $A0, $B0, $C0, $D0, $E0, $F0

Fireball_YWrite:
	.byte $00, $00, $00, $00, $00, $00, $00, $00
	.byte $10, $10, $10, $10, $10, $10, $10, $10
	.byte $20, $20, $20, $20, $20, $20, $20, $20
	.byte $30, $30, $30, $30, $30, $30, $30, $30
			
Fireball_EventShoot:
	LDA Fireball_EventTimer
	AND #$0F
	BNE Fireball_Timer

	LDA RandomN
	AND #$07
	TAY

	LDA Fireball_EventY, Y
	STA <Temp_Var14

	LDA RandomN
	AND #$30
	LSR A
	LSR A
	LSR A
	LSR A
	TAY

	LDA Fireball_EventYVel, Y
	STA <Temp_Var16

	LDY #$05

Fireball_FindEmpty:
	LDA SpecialObj_ID,Y
	BEQ Fireball_EmptyFound	 ; If object slot is dead/empty, jump to PRG000_C454 

	DEY		 ; Y--
	BPL Fireball_FindEmpty	 ; While Y >= 0, loop!
	BMI Fireball_Noshoot

Fireball_EmptyFound:
	LDA #$00
	STA SpecialObj_YVel,Y

	LDA #$20
	STA SpecialObj_XVel,Y

	LDA <Temp_Var14
	STA SpecialObj_Y,Y

	LDA #$01
	STA SpecialObj_YHi,Y

	LDA #$2C
	STA SpecialObj_X,Y

	LDA #$00
	STA SpecialObj_XHi,Y

	LDA #SOBJ_BIGFIREBALL
	STA SpecialObj_ID, Y

	LDA #$0F
	STA SpecialObj_Timer,Y
	BNE Fireball_Timer

Fireball_Noshoot:
	RTS

Fireball_Timer:
	DEC Fireball_EventTimer
	BEQ Fireball_DoFlash
	RTS

Fireball_DoFlash:
	INC EventVar
	RTS

Fireball_EventFlash:
	
	LDA Fireball_EventTimer
	CMP #$20
	BCC Fireball_MaskPal

	INC EventVar
	LDA #$00
	STA Fireball_EventTimer
	RTS
	
Fireball_MaskPal:

	AND #$18
	ASL A
	STA <Temp_Var1

	LDY #$0F

Fireball_WhiteOut:
	LDA MasterPal_Data, Y
	ADD <Temp_Var1
	CMP #$3F
	BCC Fireball_NotMaxPal

	LDA #$30

Fireball_NotMaxPal:
	STA Palette_Buffer, Y

	CPY #$00
	BNE Fireball_NotBG

	STA Palette_Buffer + $10

Fireball_NotBG:
	DEY
	BPL Fireball_WhiteOut

	INC Fireball_EventTimer
	RTS

Fireball_ClearTiles:
	LDA Block_NeedsUpdate
	BNE Fireball_NoWrite

	LDA Fireball_EventTimer
	CMP #$20
	BCC Fireball_MaskWrite

	INC EventVar
	LDA #$3F
	STA Fireball_EventTimer
	RTS

Fireball_MaskWrite:
	TAY

	INC Fireball_EventTimer

	LDA Fireball_XWrite, Y
	STA Block_ChangeX

	LDA #$00
	STA Block_ChangeXHi

	LDA Fireball_YWrite, Y
	STA Block_ChangeY

	LDA #$01
	STA Block_ChangeYHi

	LDA #$01
	STA Block_UpdateValue
	STA Block_NeedsUpdate

Fireball_NoWrite:
	RTS

Fireball_EventUnflash:
	LDA Fireball_EventTimer
	AND #$30
	STA <Temp_Var1

	LDY #$0F

Fireball_ReturnPal:
	LDA MasterPal_Data, Y
	ADD <Temp_Var1
	CMP #$3F
	BCC Fireball_NotMaxPal2

	LDA #$30

Fireball_NotMaxPal2:
	STA Palette_Buffer, Y

	CPY #$00
	BNE Fireball_NextPal

	STA Palette_Buffer + $10

Fireball_NextPal:
	DEY
	BPL Fireball_ReturnPal

	DEC Fireball_EventTimer
	BNE Fireball_ReturnPalRTS

	LDA #$00
	STA EventType

Fireball_ReturnPalRTS:
	RTS

DirectionSwitch_Tables:
	.byte $60, $62

Direction_Movement:
	.byte TILE_PROP_MOVE_RIGHT, TILE_PROP_MOVE_LEFT

Direction_Switch:
	LDA EventVar
	EOR #$01
	STA EventVar
	TAY

	LDA DirectionSwitch_Tables, Y
	STA PatTable_BankSel

	LDA Direction_Movement, Y
	STA TileProperties + $FE

	LDA #$00
	STA EventSwitch
	RTS

Lava_Flood:
	LDA EventVar

	JSR DynJump

	.word Lava_Init
	.word Lava_FloodWait
	.word Lava_BlockPath
	.word Lava_FloodWait
	.word Lava_FloodPhase1
	.word Lava_FloodWait
	.word Lava_FloodPhase2
	.word Lava_FloodWait
	.word Lava_Done

Lava_Init:
	LDA #$30
	STA EventTicker
	STA Player_VibeDisable

	LDA #00
	STA Player_FlipBits

	INC EventVar
	RTS

Lava_BlockPath:
	INC Block_NeedsUpdate	 ; Store type of block change!

	LDA #$40
	STA Block_ChangeX
	STA Block_ChangeY
	STA Player_VibeDisable

	LDA #$00
	STA Block_ChangeXHi
	STA Block_ChangeYHi

	LDA #$53
	STA Block_UpdateValue

	LDA #$7C
	STA EventTicker
	INC EventVar
	RTS

Lava_FloodPhase1:
	LDA #OBJ_EVENTFILLER
	STA Objects_ID
	STA Objects_ID + 1
	STA Player_VibeDisable

	LDA #$01
	STA Objects_Property
	STA Objects_Property + 1

	LDA #OBJSTATE_INIT
	STA Objects_State
	STA Objects_State + 1

	LDA #$00
	STA LavaFill_FrameTicker
	STA LavaFill_FrameTicker + 1

	STA <Objects_XHiZ
	STA <Objects_XHiZ + 1

	STA <Objects_YHiZ
	STA <Objects_YHiZ + 1

	LDA #$20
	STA <Objects_XZ
	
	LDA #$30
	STA <Objects_XZ + 1

	LDA #$3E
	STA <Objects_YZ
	STA <Objects_YZ + 1

	INC EventVar
	RTS

Lava_FloodWait:
	LDA #$01
	STA Player_VibeDisable

	DEC EventTicker
	BNE Lava_FloodWaitRTS

	INC EventVar

Lava_FloodWaitRTS:	
	RTS	

Lava_FloodPhase2:
	LDA #OBJ_EVENTFILLER
	STA Objects_ID
	STA Objects_ID + 1
	STA Player_VibeDisable

	LDA #$02
	STA Objects_Property
	STA Objects_Property + 1

	LDA #OBJSTATE_INIT
	STA Objects_State
	STA Objects_State + 1

	LDA #$00
	STA LavaFill_FrameTicker
	STA LavaFill_FrameTicker + 1


	LDA #$00
	STA <Objects_XHiZ
	STA <Objects_XHiZ + 1

	STA <Objects_YHiZ
	STA <Objects_YHiZ + 1

	LDA #$20
	STA <Objects_XZ
	
	LDA #$40
	STA <Objects_XZ + 1

	LDA #$C2
	STA <Objects_YZ
	STA <Objects_YZ + 1

	INC EventVar
	RTS

Lava_Done:
	LDA #$00
	STA Player_VibeDisable
	RTS	