HandleLevelEvent:

	LDA EventType
	JSR DynJump

	.word NoEvent
	.word FloodFloor1
	.word FloodFloor2
	.word LetEnemyHandle
	.word ColorSwitch
	.word Snow_Event
	.word Fireball_Event

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

	LDA #OBJ_WATERFILLER
	STA Objects_ID

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
	LDA #$01
	STA BossLevelData

	LDX EventVar
	CPX #$08
	BEQ FloodFloorEnd

	JMP FloodFloor

FloodFloor2:
	LDA #$02
	STA BossLevelData

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


Color_SwitchTables:
	.byte $60, $62, $64, $66

ColorSwitch:
	LDA EventSwitch
	BEQ ColorSwitchRTS

	AND #$C0
	LSR A
	LSR A
	LSR A
	LSR A
	LSR A
	LSR A
	TAY

	LDA Color_SwitchTables, Y
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

ColorSwitchRTS:
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
	
BossFight:
	
	LDA Objects_Property, X
	JSR DynJump

	.word Colossal_Cheep
	.word Giant_Piranha

Colossal_CheepSprites:
	.byte $95, $97, $99, $9B, $B5, $B7, $B9, $BB
	.byte $95, $97, $9D, $9F, $B5, $B7, $BD, $BF

Colossal_CheepPassesNeeded:
	.byte $01, $02, $01, $03

Colossal_CheepJumpChances:
	.byte $00, $00, $00, $01, $00, $00, $01, $00
	.byte $01, $00, $00, $00, $01, $00, $00, $01

Colossal_CheepFrames = Objects_Data1
Colossal_CheepAction = Objects_Data2
Colossal_CheepThresholdChecked = Objects_Data3
Colossal_CheepHealth = Objects_Data4
Colossal_CheepPasses = Objects_Data5
Colossal_CheepWaterLevel = Objects_Data6

Colossal_Cheep:
	LDA <Player_HaltGameZ
	BEQ Colossal_CheepNorm

	JMP Colossal_CheepDraw

Colossal_CheepNorm:
	LDA Colossal_CheepAction, X
	JSR DynJump

	.word Colossal_CheepInit
	.word Colossal_CheepSwim
	.word Colossal_CheepBounce
	.word Colossal_CheepHit
	.word Colossal_CheepDie
	.word Colossal_FloodRoom
	.word Colossal_SwimFlooded
	.word Colossal_CheepDrainRoom
	.word Colossal_CheepReset

Colossal_CheepInit:
	LDA #$D8
	STA <Objects_XZ, X

	LDA #$FF
	STA <Objects_XZ, X

	LDA #$20
	STA <Objects_XVelZ, X

	LDA #$00
	STA Colossal_CheepHealth, X

	LDA #$04
	STA Objects_Health, X

	INC Colossal_CheepAction, X

	LDA #OAT_BOUNDBOX09
	STA Objects_BoundBox, X

	JMP Colossal_CheepResetPasses

Colossal_CheepJumpThreshold:
	.byte $E0, $10

Colossal_CheepXVel:
	.byte $E0, $20

Colossal_CheepSwim:
	LDA #$A8
	STA <Objects_YZ, X

	LDA #$00
	STA <Objects_YHiZ, X

	LDA #SPR_PAL1
	STA Objects_SpriteAttributes, X

	JSR Object_ApplyXVel
	JSR Object_FaceDirectionMoving
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles

	JSR Object_CheckOffScreen
	BCC Keep_Swimming

	LDA #$00
	STA Colossal_CheepThresholdChecked, X

	JSR Object_XDistanceFromPlayer
	LDY <XDiffLeftRight

	DEC Colossal_CheepPasses, X

	LDA Colossal_CheepXVel, Y
	STA <Objects_XVelZ, X
	BNE CC_NoJump

Keep_Swimming:
	LDY #$00
	
	LDA Objects_Orientation, X
	AND #SPR_HFLIP
	BEQ CC_CheckThreshold

	INY

CC_CheckThreshold:
	LDA Colossal_CheepThresholdChecked, X
	BNE CC_NoJump

	LDA <Objects_XZ, X
	AND #$F0
	CMP Colossal_CheepJumpThreshold, Y
	BNE CC_NoJump

	LDA #$01
	STA Colossal_CheepThresholdChecked, X

	LDA RandomN
	AND #$07
	TAY

	LDA Colossal_CheepJumpChances, Y
	BNE CC_NoJump

	LDA #$B0
	STA <Objects_YVelZ, X

	LDA #$02
	STA Colossal_CheepAction, X

CC_NoJump:
	JMP Colossal_CheepAnimate

Colossal_CheepBounce:
	JSR Object_FaceDirectionMoving
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_DetectPlayer
	BCC CC_NoHurtPlayer

	JSR Object_HurtPlayer

CC_NoHurtPlayer:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE CC_CheckBounce

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	JMP CC_CheckBounce

CC_HurtByShell:
	
	JSR DestroyAllEnemies
	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	INC Colossal_CheepHealth, X
	LDA Colossal_CheepHealth, X
	CMP #$03
	BNE CC_GoBackwards

	JSR DestroyAllEnemies

	LDA #$80
	STA Objects_Timer, X

	LDA #$04
	STA Colossal_CheepAction, X

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	JMP Colossal_CheepDraw

CC_GoBackwards:

	LDA #$03
	STA Colossal_CheepAction, X
	BNE CC_NoSkyBounce

CC_CheckBounce:

	JSR Object_CheckOffScreen
	BCC CC_CheckFloor

	LDA #$01
	STA Colossal_CheepAction, X

	JSR Object_XDistanceFromPlayer
	LDY <XDiffLeftRight

	LDA Colossal_CheepXVel, Y
	STA <Objects_XVelZ, X

	LDA RandomN
	AND #$03
	BNE CC_NoSkyBounce

	LDA #$00
	STA <Objects_YZ, X
	STA <Objects_YHiZ, X

	LDA #$02
	STA Colossal_CheepAction, X

CC_NoSkyBounce:
	JMP CC_AnimateNorm

CC_CheckFloor:
	JSR Object_DetectTiles

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ CC_KeepBouncing

	JSR Object_HitGround

	LDA #$20
	STA Level_Vibration

	LDA #SND_LEVELBABOOM
	STA Sound_QLevel1

	LDA #$C0
	STA <Objects_YVelZ, X
	
	LDA Colossal_CheepPasses, X
	BPL CC_KeepBouncing

	LDA Colossal_CheepHealth, X
	STA <Temp_Var10

CC_MakeObjects:
	JSR CC_MakeObject
	DEC <Temp_Var10
	BPL CC_MakeObjects

	JSR Colossal_CheepResetPasses

CC_KeepBouncing:
	JMP Colossal_CheepAnimate

Colosssal_Objects:
	.byte OBJ_GREENTROOPA, OBJ_GOOMBA, OBJ_POWERUP, OBJ_GREENTROOPA, OBJ_GOOMBA, OBJ_GREENTROOPA, OBJ_POWERUP, OBJ_GOOMBA

Colosssal_ObjectsData:
	.byte $00, $00, POWERUP_MUSHROOM, $00, $00, $00, POWERUP_MUSHROOM, $00

Colosssal_ObjectsPal:
	.byte $02, $03, $01, $02, $03, $02, $01, $03

Colosssal_ObjectsX:
	.byte $40, $C0, $70, $90
	.byte $78, $98, $48, $C8
	.byte $80, $30, $D0, $50
	.byte $10, $40, $C0, $F0

CC_MakeObject:
	JSR Object_FindEmptyX
	BCC CC_MakeObjectRTS

	LDA RandomN, X
	AND #$07
	TAY

	LDA Colosssal_Objects, Y
	STA Objects_ID, X

	LDA Colosssal_ObjectsData, Y
	STA Objects_Data1, X

	LDA #$FF
	STA <Objects_YHiZ, X

	LDA #$E0
	STA <Objects_YZ, X

	LDA #$00
	STA <Objects_XHiZ, X

	LDA Colosssal_ObjectsPal, Y
	STA Objects_SpriteAttributes, X

	STX <Temp_Var1

	LDA RandomN
	AND #$30
	ASL A
	ASL A
	
	ORA <Temp_Var1
	LDY <Temp_Var1

	LDA Colosssal_ObjectsX, Y
	STA <Objects_XZ, X

	JSR Object_CalcBoundBoxForced
	JSR Object_MoveTowardsPlayer

	LDX <CurrentObjectIndexZ

CC_MakeObjectRTS:
	RTS

Colosssal_CheepFlash:
	.byte SPR_PAL1, SPR_PAL3

Colossal_CheepHit:
	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	JSR Object_Move
	JSR Object_CalcBoundBox
	
	LDA Game_Counter
	LSR A
	LSR A
	AND #$01
	TAY
	
	LDA Colosssal_CheepFlash, Y
	STA Objects_SpriteAttributes, X

	JSR Object_CheckOffScreen
	BCC CC_KeepMovingBack

	LDA #$05
	STA Colossal_CheepAction, X

CC_KeepMovingBack:
	JMP CC_CheckFloor

Colossal_CheepDie:
	LDA Objects_Timer, X
	BEQ CC_Die

	LDA Game_Counter
	LSR A
	AND #$01
	TAY

	LDA Colosssal_CheepFlash, Y
	STA Objects_SpriteAttributes, X
	JMP CC_AnimateNorm

CC_Die:
	LDA #$80
	STA CompleteLevelTimer

	LDA <Objects_XZ, X
	ADD #$08
	STA <Objects_XZ, X

	LDA <Objects_XHiZ, X
	ADC #$00
	STA <Objects_XHiZ, X

	LDA <Objects_YZ, X
	ADD #$08
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	ADC #$00
	STA <Objects_YHiZ, X

	JMP Object_Explode

WaterFill_XOffsets:
	.byte $FC, $F8, $F4
	.byte $FC, $F8, $F4
	.byte $FC, $F8, $F4

WaterFill_YOffsets:
	.byte $7F, $6F, $5F
	.byte $4F, $3F, $2F
	.byte $1F, $0F, $00

Colossal_FloodRoom:
	LDA Objects_Timer, X
	BNE CCNo_Water

	LDA  Colossal_CheepWaterLevel, X
	CMP #$09
	BCC Create_Water

	INC Colossal_CheepAction, X
	
	LDA Colossal_CheepHealth, X
	STA Colossal_CheepPasses, X

	LDA <Objects_XVelZ, X
	EOR #$FF
	ADD #$01
	
	JSR Double_Value

	STA <Objects_XVelZ, X

	JSR Colossal_CheepReposition

	LDA #$00
	STA Colossal_CheepWaterLevel, X

CCNo_Water:
	RTS

Create_Water:
	LDA #$03
	STA <Temp_Var10

More_Water:
	LDY Colossal_CheepWaterLevel, X
	JSR Object_FindEmptyX

	LDA #OBJ_WATERFILLER
	STA Objects_ID, X

	LDA WaterFill_XOffsets, Y
	STA <Objects_XZ, X

	LDA #$FF
	STA <Objects_XHiZ, X

	LDA WaterFill_YOffsets, Y
	STA <Objects_YZ, X

	LDA #00
	STA <Objects_YHiZ, X

	LDA #$40
	STA <Objects_XVelZ, X

	LDA #SPR_PAL2
	STA Objects_SpriteAttributes, X

	LDA #SPR_HFLIP
	STA Objects_Orientation, X

	LDX <CurrentObjectIndexZ

	INC Colossal_CheepWaterLevel, X
	DEC <Temp_Var10
	BNE More_Water

	LDA #$50
	STA Objects_Timer, X
	RTS

Colossal_CheepYOffsets:
	.byte $08, $28, $48, $68

Colossal_CheepReposition:
	LDA RandomN, X
	AND #$03
	TAY

	LDA Colossal_CheepYOffsets, Y
	STA <Objects_YZ, X
	
	LDA #$00
	STA <Objects_YHiZ, X

	LDA Colossal_CheepAction, X
	CMP #$07
	BCS CC_NoBubble

	JSR Colossal_CheepMakeBubble

CC_NoBubble:
	RTS

Colossal_SwimFlooded:
	JSR Object_ApplyXVel
	JSR Object_FaceDirectionMoving
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_AttackOrDefeat

	JSR Object_CheckOffScreen
	BCC CC_FloodKeepSwimming

	LDA <Objects_XVelZ, X
	EOR #$FF
	ADD #$01
	STA <Objects_XVelZ, X

	DEC Colossal_CheepPasses, X
	BNE CC_SwimAgain

	INC Colossal_CheepAction, X
	JSR DestroyAllEnemies

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X
	RTS

CC_SwimAgain:
	JSR Colossal_CheepReposition

CC_FloodKeepSwimming:
	JMP Colossal_CheepAnimate

Colossal_CheepDrainRoom:
	JMP Colossal_FloodRoom

Colossal_CheepReset:
	LDA #$01
	STA Colossal_CheepAction, X

	JMP Colossal_CheepResetPasses

Colossal_CheepResetPasses:
	LDA RandomN, X
	AND #$03
	TAY 

	LDA Colossal_CheepPassesNeeded, Y
	STA Colossal_CheepPasses, X
	RTS

Colossal_CheepBubbleX:
	.byte $28, $48, $68, $88

Colossal_CheepMakeBubble:
	JSR Object_FindEmptyX

	LDA RandomN, X
	AND #$03
	TAY

	LDA #OBJ_BUBBLE
	STA Objects_ID, X

	LDA #$03
	STA Bubble_Action, X

	LDA Colossal_CheepBubbleX, Y
	STA <Objects_XZ, X

	LDA #$00
	STA <Objects_XHiZ, X
	STA <Objects_YHiZ, X
	STA Objects_Property, X

	LDA #$80
	STA <Objects_YZ, X

	LDA #SPR_PAL2
	STA Objects_SpriteAttributes, X

	LDX <CurrentObjectIndexZ
	RTS
	
Colossal_CheepAnimate:
	INC Colossal_CheepFrames, X
	
	LDA <Objects_YVelZ, X
	BPL CC_AnimateNorm

	LDA Colossal_CheepFrames, X
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame, X

	JMP Colossal_CheepDraw

CC_AnimateNorm:
	LDA Colossal_CheepFrames, X
	
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame, X

Colossal_CheepDraw:
	LDA #LOW(Colossal_CheepSprites)
	STA <Giant_TilesLow

	LDA #HIGH(Colossal_CheepSprites)
	STA <Giant_TilesHi

	LDA #$1B
	STA PatTable_BankSel + 4

	LDA Objects_Orientation, X
	AND #~SPR_VFLIP
	STA Objects_Orientation, X

	JSR Object_CheckForeground
	JMP Object_DrawGiant

Giant_PiranhaSprites:
	.byte $81, $83, $85, $87, $A1, $A3, $A5, $A7
	.byte $89, $8B, $8D, $8F, $A9, $AB, $AD, $AF

Giant_PiranhaAction = Objects_Data1
Giant_PiranhaFrames = Objects_Data2
Giant_PiranhaAttackTicker = Objects_Data3
Giant_PiranhaTicker = Objects_Data4

Giant_Piranha:
	LDA <Player_HaltGameZ
	BEQ Giant_PiranhaNorm

	JMP Giant_PiranhaDraw

Giant_PiranhaNorm:
	LDA Giant_PiranhaAction, X
	JSR DynJump

	.word Giant_PiranhaInit
	.word Giant_WaitUnder
	.word Giant_PiranhaAttackUp
	.word Giant_PiranhaAttackDown

Giant_PiranhaInit:
	LDA #SPR_PAL1
	STA Objects_SpriteAttributes, X

	LDA #SPR_BEHINDBG
	STA Objects_Orientation, X

	LDA #ATTR_STOMPPROOF
	STA Objects_WeaponAttr, X
	
	LDA #$C0
	STA <Objects_YZ, X

	LDA #$00
	STA <Objects_YHiZ, X

	LDA #$F0
	STA ChaseVel_LimitLo, X

	LDA #$10
	STA ChaseVel_LimitHi, X

	LDA #$04
	STA Objects_Health, X

	INC Giant_PiranhaAction, X

	LDA #$80
	STA Objects_Timer, X
	RTS

Giant_WaitUnder:
	LDA Objects_Timer, X
	BNE Giant_WaitUnder1

	INC Giant_PiranhaAction, X

	LDA Player_X
	AND #$F0

	STA <Objects_XZ, X

Giant_WaitUnder1:
	RTS

Giant_PiranhaAttackUp:
	LDA #$C0
	STA <Objects_YVelZ, X

	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

	LDA <Objects_YZ, X
	CMP #$90
	BCS Giant_PiranhaAttackUpRTS

	LDA #$40
	STA Objects_Timer, X
	INC Giant_PiranhaAction, X

Giant_PiranhaAttackUpRTS:
	JMP Giant_PiranhaAnimate

Giant_PiranhaBurstBlocks:
	LDA <Objects_XZ, X
	ADD #$08
	STA Block_DetectX

	LDA #$00
	STA Block_DetectXHi


Giant_PiranhaAttackDown:
	LDA Objects_Timer, X
	BNE Giant_PiranhaAttackDownRTS

	LDA #$40
	STA <Objects_YVelZ, X

	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

	LDA <Objects_YZ, X
	CMP #$C0
	BCC Giant_PiranhaAttackDownRTS

	LDA #$01
	STA  Giant_PiranhaAction, X

	LDA #$80
	STA Objects_Timer, X

Giant_PiranhaAttackDownRTS:
	JMP Giant_PiranhaAnimate

;
;	INC Thwomp_Ticker, X
;	LDA Thwomp_Ticker, X
;	AND #$01
;	TAY
;
;	LDA Objects_BoundLeft, X
;	ADD Thwomp_DetectXOffset, Y
;	STA Tile_DetectionX
;
;	LDA Objects_BoundLeftHi, X
;	ADC #$00
;	STA Tile_DetectionXHi
;
;	LDA Objects_BoundTop, X
;	STA Tile_DetectionY
;
;	LDA Objects_BoundTopHi, X
;	STA Tile_DetectionYHi
;
;	JSR Object_DetectTile
;	LDA Tile_LastProp
;	CMP #TILE_PROP_SOLID_TOP
;	BCC AngryThwomp_NoHit
;
;	JSR Object_HitCeiling
;
;	INC Thwomp_TilesDetected, X
;	LDA Thwomp_TilesDetected, X
;	CMP #$03
;	BCS AngryThwomp_DetectCeil
;
;	LDA #$E0
;	STA <Objects_YVelZ, X
;
;	LDA Tile_LastProp
;	CMP #TILE_ITEM_COIN
;	BCC AngryThwomp_NoBump
;
;	JSR Object_DirectBumpBlocks
;
;AngryThwomp_NoBump:
;	JMP Thwomp_Draw
;
;AngryThwomp_DetectCeil:
;	LDA #$20
;	STA Level_Vibration
;
;	LDA #$30
;	STA Objects_Timer, X
;
;	LDA #SND_LEVELBABOOM
;	STA Sound_QLevel1
;	INC Thwomp_Action, X
;	RTS

Giant_PiranhaAnimate:
	INC Giant_PiranhaFrames, X
	LDA Giant_PiranhaFrames, X
	AND #$08
	LSR A
	LSR A
	LSR A
	STA Objects_Frame, X

Giant_PiranhaDraw:
	LDA #LOW(Giant_PiranhaSprites)
	STA <Giant_TilesLow

	LDA #HIGH(Giant_PiranhaSprites)
	STA <Giant_TilesHi

	LDA #$58
	STA PatTable_BankSel + 4

	LDA Objects_Orientation, X
	AND #~SPR_VFLIP
	STA Objects_Orientation, X

	JMP Object_DrawGiant