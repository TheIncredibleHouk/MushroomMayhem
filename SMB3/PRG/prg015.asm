    .org ObjectGroup_InitJumpTable
;****************************** OBJECT INITIALIZATION ******************************
    
OBJ_SPIKE    		= $78
OBJ_SPIKEBALL       = $79
OBJ_CHAINCHOMP      = $7A
OBJ_GIANTCHOMP      = $7B
OBJ_THWOMP          = $7C
OBJ_ANGRYTHWOMP     = $7D
OBJ_BOO             = $7E
OBJ_PIRATEBOO       = $7F
OBJ_FIREICEBAR      = $80
OBJ_PODOBO          = $81
OBJ_PIPEPODOBO      = $82
OBJ_PODOBO_X        = $83
OBJ_PEEKABOO 		= $84
OBJ_POLTERGUY		= $85
OBJ_SPECTER			= $86
OBJ_MISSILE			= $87
OBJ_PHASM			= $88
OBJ_BOOWAVE			= $89
OBJ_BALLCHAIN		= $8A
OBJ_PARACHOMP		= $8B

    .word ObjInit_Spike ; Object $78
    .word ObjInit_SpikeBall ; Object $79
    .word ObjInit_ChainChomp ; Object $7A
    .word ObjInit_GiantChomp ; Object $7B
    .word ObjInit_Thwomp ; Object $7C
    .word ObjInit_AngryThwomp ; Object $7D
    .word ObjInit_Boo ; Object $7E
    .word ObjInit_PirateBoo ; Object $7F
    .word ObjInit_ProjBar ; Object $80
    .word ObjInit_Podobo ; Object $81
    .word ObjInit_PipePodobo ; Object $82
    .word ObjInit_DiagonalPodobo ; Object $83
    .word ObjInit_PeekaBoo ; Object $84
    .word ObjInit_PolterGuy ; Object $85
    .word ObjInit_Specter ; Object $86
    .word ObjInit_Missile ; Object $87
    .word ObjInit_Phasm ; Object $88
    .word ObjInit_BooWave ; Object $89
    .word ObjInit_BallChain ; Object $8A
    .word ObjInit_ParaChomp ; Object $8B

	.org ObjectGroup_NormalJumpTable	; <-- help enforce this table *here*
;****************************** OBJECT GAME LOOP ******************************
    .word ObjNorm_Spike ; Object $78
    .word ObjNorm_SpikeBall ; Object $79
    .word ObjNorm_ChainChomp ; Object $7A
    .word ObjNorm_GiantChomp ; Object $7B
    .word ObjNorm_Thwomp ; Object $7C
    .word ObjNorm_AngryThwomp ; Object $7D
    .word ObjNorm_Boo ; Object $7E
    .word ObjNorm_PirateBoo ; Object $7F
    .word ObjNorm_ProjectileBar ; Object $80
    .word ObjNorm_Podobo ; Object $81
    .word ObjNorm_PipePodobo ; Object $82
    .word ObjNorm_DiagonalPodobo ; Object $83
    .word ObjNorm_PeekaBoo ; Object $84
    .word ObjNorm_PolterGuy ; Object $85
    .word ObjNorm_Specter ; Object $86
    .word ObjNorm_Missile ; Object $87
    .word ObjNorm_Phasm ; Object $88
    .word ObjNorm_BooWave ; Object $89
    .word ObjNorm_BallChain ; Object $8A
    .word ObjNorm_ParaChomp ; Object $8B

	.org ObjectGroup_CollideJumpTable	; <-- help enforce this table *here*
;****************************** OBJECT PLAYER INTERACTION ******************************
    .word Player_GetHurt ; Object $78
    .word Player_GetHurt ; Object $79
    .word Player_GetHurt ; Object $7A
    .word Player_GetHurt ; Object $7B
    .word Player_GetHurt ; Object $7C
    .word Player_GetHurt ; Object $7D
    .word Player_GetHurt ; Object $7E
    .word PirateBoo_TakeCoins ; Object $7F
    .word ObjHit_DoNothing ; Object $80
    .word Player_GetHurt ; Object $81
    .word Player_GetHurt ; Object $82
    .word Player_GetHurt ; Object $83
    .word Player_GetHurt ; Object $84
    .word Player_GetHurt ; Object $85
    .word Player_GetHurt ; Object $86
    .word Object_Explode ; Object $87
    .word ObjHit_DoNothing ; Object $88
    .word ObjHit_DoNothing ; Object $89
    .word Player_GetHurt ; Object $8A
    .word Player_GetHurt ; Object $8B

	.org ObjectGroup_Attributes	; <-- help enforce this table *here*
;****************************** OBJECT PALETTE/SIZE ******************************
    .byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $78
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $79
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $7A
    .byte OA1_PAL2 | OA1_HEIGHT32 | OA1_WIDTH32 ; Object $7B
    .byte OA1_PAL2 | OA1_HEIGHT32 | OA1_WIDTH48 ; Object $7C
    .byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH48 ; Object $7D
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $7E
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $7F
    .byte OA1_PAL1 | OA1_WIDTH8 | OA1_WIDTH8 ; Object $80
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $81
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $82
    .byte OA1_PAL1 | OA1_HEIGHT64 | OA1_WIDTH16 ; Object $83
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $84
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $85
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $86
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $87
    .byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $88
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $89
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $8A
    .byte OA1_PAL1 | OA1_HEIGHT64 | OA1_WIDTH24 ; Object $8B

	.org ObjectGroup_PatTableSel	; <-- help enforce this table *here*
;****************************** OBJECT PATTERN TABLE ******************************
    .byte OPTS_SETPT5 | $0E ; Object $78
    .byte OPTS_SETPT5 | $0E ; Object $79
    .byte OPTS_SETPT5 | $0E ; Object $7A
    .byte OPTS_SETPT5 | $0E ; Object $7B
    .byte OPTS_NOCHANGE ; Object $7C
    .byte OPTS_SETPT5 | $12 ; Object $7D
    .byte OPTS_SETPT5 | $37 ; Object $7E
    .byte OPTS_SETPT5 | $37 ; Object $7F
    .byte OPTS_NOCHANGE ; Object $80
    .byte OPTS_NOCHANGE ; Object $81
    .byte OPTS_NOCHANGE ; Object $82
    .byte OPTS_SETPT5 | $0A ; Object $83
    .byte OPTS_SETPT5 | $37 ; Object $84
    .byte OPTS_SETPT5 | $37 ; Object $85
    .byte OPTS_SETPT6 | $13 ; Object $86
    .byte OPTS_NOCHANGE ; Object $87
    .byte OPTS_SETPT5 | $37 ; Object $88
    .byte OPTS_SETPT5 | $37 ; Object $89
    .byte OPTS_SETPT5 | $0E ; Object $8A
    .byte OPTS_SETPT5 | $0E ; Object $8B

	.org ObjectGroup_KillAction	; <-- help enforce this table *here*
;****************************** OBJECT DEATH ROUTINE ******************************
	.byte KILLACT_NORMALSTATE ; Object $78
    .byte KILLACT_STARDEATH ; Object $79
    .byte KILLACT_STARDEATH ; Object $7A
    .byte KILLACT_STARDEATH ; Object $7B
    .byte KILLACT_NORMALSTATE ; Object $7C
    .byte KILLACT_NORMALSTATE ; Object $7D
    .byte KILLACT_NORMALSTATE ; Object $7E
    .byte KILLACT_STARDEATH ; Object $7F
    .byte KILLACT_STARDEATH ; Object $80
    .byte KILLACT_STARDEATH ; Object $81
    .byte KILLACT_STARDEATH ; Object $82
    .byte KILLACT_STARDEATH ; Object $83
    .byte KILLACT_NORMALSTATE ; Object $84
    .byte KILLACT_NORMALSTATE ; Object $85
    .byte KILLACT_STARDEATH ; Object $86
    .byte KILLACT_STARDEATH ; Object $87
    .byte KILLACT_STARDEATH ; Object $88
    .byte KILLACT_NORMALSTATE ; Object $89
    .byte KILLACT_STARDEATH ; Object $8A
    .byte KILLACT_NORMALSTATE ; Object $8B

OG7_POff .func (\1 - ObjectGroup07_PatternSets)

	.org ObjectGroup_PatternStarts	; <-- help enforce this table *here*

	; Index by object group relative index (ObjGroupRel_Idx)
	.byte OG7_POff(ObjP78), OG7_POff(ObjP79), OG7_POff(ObjP7A), OG7_POff(ObjP7B)
    .byte OG7_POff(ObjP7C), OG7_POff(ObjP7D), OG7_POff(ObjP7E), OG7_POff(ObjP7F)
    .byte OG7_POff(ObjP80), OG7_POff(ObjP81), OG7_POff(ObjP82), OG7_POff(ObjP83)
    .byte OG7_POff(ObjP84), OG7_POff(ObjP85), OG7_POff(ObjP86), OG7_POff(ObjP87)
    .byte OG7_POff(ObjP88), OG7_POff(ObjP89), OG7_POff(ObjP8A), OG7_POff(ObjP8B)

ObjectGroup07_PatternSets:

ObjP78:
    .byte $B1, $B3, $B5, $B7, $B9, $BB, $B1, $BF, $B1, $B3

ObjP79:
    .byte $95, $95, $97, $97

ObjP7A:
    .byte $91, $93, $9D, $9F

ObjP7B:
ObjP7C:
    .byte $99, $9B, $B9, $BB
	.byte $AD, $97, $B5, $B7

ObjP7D:	
	.byte $9D, $9F, $BD, $BF
	.byte $91, $93, $B1, $B3
    .byte $D9, $DB, $F9, $FB


ObjP7E:
    .byte $9D, $9F

ObjP89:
	.byte $99, $9B

ObjP7F:
    .byte $B1, $B3

ObjP80:
ObjP81:
ObjP82:
    .byte $8D, $8D, $8F, $8F, $95, $95

ObjP83:
    .byte $B1, $B3, $B5, $B7, $B9, $BB

ObjP84:
	.byte $B1, $B3
	.byte $B5, $B5
	.byte $B5, $B5
	.byte $B7, $B7

ObjP85:
	.byte $B9, $BB
	.byte $B5, $B7

ObjP86:
	.byte $ED, $ED
	.byte $EF, $EF

ObjP87:
	.byte $B3, $B3

ObjP88:
	.byte $89, $89
	.byte $87, $87
	.byte $85, $85
	.byte $83, $83
	.byte $81, $81
	.byte $83, $83

ObjP8A:
	.byte $97, $97

ObjP8B:
	.byte $91, $93
	.byte $9D, $9F

Spike_XOff:
	.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	.byte $00, $00, $01, $02, $03, $04

Spike_YOff:
	.byte $00, $00, $00, $FE, $FE, $FC, $FA, $F8, $F6, $F4, $F2
	.byte $F0, $EE, $F0, $F0, $F0, $F0

ObjInit_Spike:
	LDA #$04
	STA Objects_SpritesRequested, X

	LDA #ATTR_ICEPROOF
	STA Objects_WeaponAttr, X
	
	LDA #(ATTR_STOMPKICKSOUND)
	STA Objects_BehaviorAttr, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #$40
	STA Objects_Timer, X
	STA Objects_Regen, X

	LDA #$02
	STA Objects_ExpPoints, X
	RTS

Spike_Action = Objects_Data3
Spike_Frame = Objects_Data4
Spike_BallOffset = Objects_Data5

ObjNorm_Spike:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE Spike_Norm1
	
	LDA Spike_Action, X
	BEQ Spike_Die

	LDA <Objects_XZ, X
	STA Debris_X

	LDA <Objects_YZ, X
	STA Debris_Y

	JSR Common_MakeDebris

	LDA #$99
	STA BrickBust_Tile, Y

	LDA #SPR_PAL1
	STA BrickBust_Pal, Y
	
Spike_Die:
	JMP Object_StarBurstDeath

Spike_Norm1:
	LDA <Player_HaltGameZ
	BEQ Spike_Norm
	JMP Spike_Draw

Spike_Norm:
	JSR Object_DeleteOffScreen
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	JSR Object_FacePlayer
	JSR Object_AttackOrDefeat

	LDA Spike_Action, X
	JSR DynJump

	.word SpikeWait
	.word SpikeOpenMouth
	.word SpikeThrowSpike

SpikeWait:
	LDA #$00
	STA Objects_Frame, X

	LDA Objects_Timer, X
	BNE SpikeWait1

	INC Spike_Action, X

	LDA #$60
	STA Objects_Timer, X

SpikeWait1:
	LDA Object_SpriteRAMOffset,X
	JMP Spike_Draw

SpikeOpenMouth:
	INC Spike_Frame, X
	INC Spike_BallOffset, X

	LDA Spike_BallOffset, X
	CMP #$20
	BCC SpikeOpenMouth0

	LDA #$20
	STA Spike_BallOffset, X

	LDA Objects_Timer, X
	BNE SpikeOpenMouth0

	INC Spike_Action, X

SpikeOpenMouth0:
	LDA Spike_Frame, X
	CMP #$20
	BCS SpikeOpenMouth1

	LSR A
	LSR A
	LSR A
	AND #$03
	STA Objects_Frame, X

SpikeOpenMouth1:
	JMP Spike_Draw
	
SpikeThrow_XVel:
	.byte $10, $18

SpikeThrow_YVel:
	.byte $D0, $C0

SpikeThrowSpike:
	LDA Objects_SpritesHorizontallyOffScreen,X
	ORA Objects_SpritesHorizontallyOffScreen,X
	BNE Spike_Draw

	JSR Object_FindEmptyX
	BCC Spike_Draw

	LDY <CurrentObjectIndexZ

	LDA #OBJ_SPIKEBALL
	STA Objects_ID, X

	LDA #OBJSTATE_FRESH
	STA Objects_State, X

	LDA Objects_YZ, Y
	SUB #$12
	STA <Objects_YZ, X

	LDA Objects_YHiZ, Y
	SBC #$00
	STA <Objects_YHiZ, X

	LDA Objects_XZ, Y
	STA <Objects_XZ, X

	LDA Objects_XHiZ, Y
	STA <Objects_XHiZ, X

	
	LDA RandomN, X
	AND #$01
	TAY

	LDA SpikeThrow_XVel, Y
	STA <Objects_XVelZ, X

	LDY CurrentObjectIndexZ

	LDA Objects_Orientation, Y
	AND #SPR_HFLIP
	BNE Spike_BallNoFlip

	LDA <Objects_XVelZ, X
	EOR #$FF
	ADD #$01
	STA <Objects_XVelZ, X

Spike_BallNoFlip:
	LDA RandomN, X
	AND #$10
	LSR A
	LSR A
	LSR A
	LSR A
	TAY

	LDA SpikeThrow_YVel, Y
	STA <Objects_YVelZ, X

	JSR Object_CalcBoundBox

	LDX <CurrentObjectIndexZ
	LDA #$00
	STA Spike_Action, X
	STA Spike_BallOffset, X
	STA Spike_Frame, X

	LDA #$40
	STA Objects_Timer, X

Spike_Draw:
	JSR Object_Draw
	
	LDA Spike_Action, X
	BEQ Spike_Draw1

	LDY Object_SpriteRAMOffset, X

	LDA #$95
	STA Sprite_RAMTile + 8, Y
	STA Sprite_RAMTile + 12, Y

	LDA #SPR_PAL1
	STA Sprite_RAMAttr + 8, Y

	LDA #(SPR_PAL1 | SPR_HFLIP)
	STA Sprite_RAMAttr + 12, Y

	LDA Spike_BallOffset, X
	LSR A
	STA <Temp_Var1

	LDX <CurrentObjectIndexZ
	LDA Objects_Orientation, X
	BEQ Spike_BallRight

	LDX <Temp_Var1

	LDA Sprite_RAMX, Y
	SUB Spike_XOff, X
 	BCC Spike_BallUnderflow2

	STA Sprite_RAMX + 8, Y
	
	LDA Sprite_RAMY, Y
	ADD Spike_YOff, X
	STA Sprite_RAMY + 8, Y

	LDA Sprite_RAMX + 8, Y
	ADD #$08
	BCS Spike_BallUnderflow2
	
	STA Sprite_RAMX + 12, Y

	LDA Sprite_RAMY, Y
	ADD Spike_YOff, X
	STA Sprite_RAMY + 12, Y

Spike_BallUnderflow2:
	RTS

Spike_BallRight:
	LDX <Temp_Var1

	LDA Sprite_RAMX, Y
	ADD Spike_XOff, X
	BCS Spike_Draw1
	STA Sprite_RAMX + 8, Y

	LDA Sprite_RAMY, Y
	ADD Spike_YOff, X
	STA Sprite_RAMY + 8, Y

	LDA Sprite_RAMX + 8, Y
	ADD #$08
	BCS Spike_Draw1
	
	STA Sprite_RAMX + 12, Y

	LDA Sprite_RAMY, Y
	ADD Spike_YOff, X
	STA Sprite_RAMY + 12, Y
Spike_Draw1:
	RTS



ObjInit_SpikeBall:
	LDA #(ATTR_FIREPROOF | ATTR_ICEPROOF | ATTR_DASHPROOF | ATTR_NINJAPROOF | ATTR_TAILPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	LDA #(ATTR_SHELLPROOF | ATTR_WINDAFFECTS | ATTR_BUMPNOKILL)
	STA Objects_BehaviorAttr, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X
	RTS

SpikeBall_Frame  = Objects_Data1

ObjNorm_SpikeBall:

	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE SpikeBallNotKilled

	JMP SpikeBall_Burst

SpikeBallNotKilled:
	LDA <Player_HaltGameZ
	BNE SpikeBall_Draw
	
	JSR Object_DeleteOffScreen
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Shell_KillOthers
	JSR Object_DetectTiles
	JSR Object_CheckForeground

	LDA <Objects_YVelZ, X
	
	BMI Spike_BumpBottom

	JSR Object_TestBottomBumpBlocks
	JMP Spike_BumpSides

Spike_BumpBottom:
	JSR Object_TestTopBumpBlocks

Spike_BumpSides:
	JSR Object_TestSideBumpBlocks

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ SpikeNoBounce

	LDA Object_VertTileProp, X
	CMP #TILE_ITEM_BRICK
	BEQ SpikeNoBounce

	LDA #$E0
	STA <Objects_YVelZ, X

	LDA Sound_QLevel1
	ORA #SND_LEVELBABOOM
	STA Sound_QLevel1

SpikeNoBounce:
	LDA <Objects_TilesDetectZ, X
	AND #(HIT_LEFTWALL | HIT_RIGHTWALL)
	BEQ SpikeBall_Animate

	LDA Object_HorzTileProp, X
	CMP #TILE_ITEM_BRICK
	BEQ SpikeBall_KeepGoing

	JMP SpikeBall_Burst

SpikeBall_KeepGoing:
	LDA <Objects_XVelZ, X
	EOR #$FF
	ADD #$01
	STA <Objects_XVelZ, X
	JMP SpikeBall_Animate

SpikeBall_Animate:
	INC SpikeBall_Frame, X
	LDA SpikeBall_Frame, X
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame, X

SpikeBall_Draw:
	JMP Object_DrawMirrored

SpikeBall_Burst:
	LDA #$99
	STA Object_BurstTile

	LDA #SPR_PAL1
	STA Object_BurstPalette
	JMP Object_Burst


Chomp_Frame = Objects_Data1
Chomp_Charges = Objects_Data2
Chomp_PinX = Objects_Data3
Chomp_PinY = Objects_Data4
Chomp_Charging = Objects_Data5
Chomp_CanCharge = Objects_Data6
Chomp_XChainMax = Objects_Data7
Chomp_YChainMax = Objects_Data8

ObjInit_ChainChomp:
	LDA #$06
	STA Objects_SpritesRequested, X

	LDA #$03
	STA Objects_ExpPoints, X

	LDA #$04
	STA Objects_Health, X

	LDA Objects_Property, X
	BEQ ChainChomp_NotCharging

	LDA #$02
	STA Chomp_Charging, X

ChainChomp_NotCharging:

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_FIREPROOF | ATTR_ICEPROOF | ATTR_STOMPPROOF | ATTR_TAILPROOF |  ATTR_NINJAPROOF)
	STA Objects_WeaponAttr, X

	LDA #ATTR_BUMPNOKILL
	STA Objects_BehaviorAttr, X

	LDA <Objects_XZ,X
	ADD #$08
	STA Chomp_PinX,X
	SUB #$04
	STA ChainChomp_ChainX1, X
	STA ChainChomp_ChainX2, X
	STA ChainChomp_ChainX3, X
	STA ChainChomp_ChainX4, X
	
	LDA <Objects_YZ,X
	ADD #$08
	STA Chomp_PinY,X
	SUB #$08
	STA ChainChomp_ChainY1, X
	STA ChainChomp_ChainY2, X
	STA ChainChomp_ChainY3, X
	STA ChainChomp_ChainY4, X
	
	LDA <Objects_YZ,X
	SUB #$10
	STA <Objects_YZ,X
	
	LDA <Objects_YHiZ,X
	SBC #$00
	STA <Objects_YHiZ,X
	
	JSR Object_MoveTowardsPlayerFast
	
	LDA #$04
	STA Chomp_Charges, X
	
	RTS		 ; Return


Chomp_ChargeTimers:
	.byte $40, $60, $50, $70, $50, $40, $60, $60

Chomp_ChargeXVel:
	.byte $40, $38, $30, $28, $20, $40, $38, $30

Chomp_ChargeYVel:
	.byte $FF, $F0, $E0, $D0, $C0, $00, $F0, $E0

Chomp_Restrain:
	
	LDA Chomp_XChainMax, X
	BEQ RestrainY

	JSR MaxOutChainsX
	LDA Chomp_Charging, X
	BNE RestrainXCharging

	LDY #$00
	LDA <Objects_XZ, X
	SUB Chomp_PinX, X
	BMI Chomp_Restrain1

	INY

Chomp_Restrain1:
	LDA <Objects_XVelZ, X
	BEQ Chomp_RestrainXRTS

	AND #$80
	CMP MaxChainVelCmp, Y
	BNE Chomp_RestrainXRTS

	LDA <Objects_XVelZ, X
	EOR #$FF
	ADD #$01
	STA <Objects_XVelZ, X

Chomp_RestrainXRTS:
	RTS

RestrainXCharging:
	LDA #$00
	STA <Objects_XVelZ, X
	STA <Objects_YVelZ, X

RestrainY:
	LDA Chomp_YChainMax, X
	BEQ RestraintRTS

	JSR MaxOutChainsY

	LDA <Objects_YVelZ, X
	BPL RestraintRTS

	LDA #$00
	STA <Objects_YVelZ, X
	STA <Objects_XVelZ, X

RestraintRTS:
	RTS

MaxChainVelCmp:
	.byte $80, $00

MaxOutChainsX:
	LDY #$00
	LDA <Objects_XZ, X
	SUB Chomp_PinX, X
	BMI MaxOutChainsX1

	INY

MaxOutChainsX1:
	LDA ChainChomp_ChainX4, X
	ADD ChainOffset, Y

	STA ChainChomp_ChainX3, X
	ADD ChainOffset, Y

	STA ChainChomp_ChainX2, X
	ADD ChainOffset, Y

	STA ChainChomp_ChainX1, X
	JSR EvenOutYChains

MaxOutChainsX2:
	RTS

MaxOutChainsY:
	LDA ChainChomp_ChainY4, X
	ADD ChainOffset
	STA ChainChomp_ChainY3, X
	ADD ChainOffset
	STA ChainChomp_ChainY2, X
	ADD ChainOffset
	STA ChainChomp_ChainY1, X
	JSR EvenOutXChains
	RTS

EvenOutYChains:
	LDA <Objects_YZ, X
	ADD #$08
	STA <Temp_Var2

	LDA ChainChomp_ChainY4, X
	SUB <Temp_Var2
	JSR Half_Value
	JSR Half_Value
	
	STA <Temp_Var3

	LDA <Temp_Var2

	ADD <Temp_Var3
	STA ChainChomp_ChainY1, X

	ADD <Temp_Var3
	STA ChainChomp_ChainY2, X

	ADD <Temp_Var3
	STA ChainChomp_ChainY3, X
	RTS

EvenOutXChains:
	LDA <Objects_XZ, X
	ADD #$08
	STA <Temp_Var2

	LDA ChainChomp_ChainX4, X
	SUB <Temp_Var2
	JSR Half_Value
	JSR Half_Value
	
	STA <Temp_Var3

	LDA <Temp_Var2

	ADD <Temp_Var3
	STA ChainChomp_ChainX1, X

	ADD <Temp_Var3
	STA ChainChomp_ChainX2, X

	ADD <Temp_Var3
	STA ChainChomp_ChainX3, X
	RTS

ObjNorm_ChainChomp:

	LDA <Player_HaltGameZ
	BEQ ChompNorm

	LDA Chomp_Charging, X
	CMP #$02
	BCS NoChainDraw

	JSR Chomp_DrawChains

NoChainDraw:
	JMP Object_Draw

ChompNorm:
	LDA #$60
	JSR Object_DeleteOffScreenRange

	LDA Chomp_Charging, X
	JSR DynJump

	.word Chomp_BounceAround
	.word Chomp_ChargeAtPlayer
	.word Chomp_Free

ChargeSignCheck:
	.byte $00, $80

Chomp_BounceAround:
	JSR Object_Move
	JSR Chomp_MoveChains
	JSR Chomp_Restrain
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat	 
	JSR Object_FaceDirectionMoving
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	
	LDA Chomp_CanCharge, X
	BEQ Chomp_NoCharge
	
	JSR Object_XDistanceFromPlayer
	CMP #$20
	BCC Chomp_NoCharge
	
	LDA <Objects_XZ, X
	SUB Chomp_PinX, X
	AND #$80
	CMP ChargeSignCheck, Y
	BNE Chomp_NoCharge
	
	JSR Chomp_Charge
	LDA #$00
	STA Chomp_CanCharge, X
	JMP ChompAnimate

Chomp_NoCharge:
	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ ChompAnimate

	LDA #$01
	STA Chomp_CanCharge, X

	LDA #$E8
	STA <Objects_YVelZ, X

	LDA #$10
	JSR Object_DetectTileAhead
	CMP #TILE_PROP_SOLID_ALL
	BCC NoBounceHigher

	LDA #$D0
	STA <Objects_YVelZ, X

NoBounceHigher:
	LDA <Objects_XVelZ, X
	BNE ChompAnimate

	JSR Object_MoveAwayFromPlayerFast

ChompAnimate:
	INC Chomp_Frame, X
	LDA Chomp_Frame, X
	LSR A
	LSR A

	LDY Chomp_Charging, X
	BNE Chomp_NotFastAnim

	LSR A

Chomp_NotFastAnim:
	AND #$01
	STA Objects_Frame, X
	JSR Chomp_DrawChains
	JMP Object_Draw

Chomp_ChargeAtPlayer:
	JSR Object_ApplyXVel
	JSR Object_ApplyYVel_NoGravity
	JSR Chomp_MoveChains
	JSR Chomp_Restrain
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat	 
	JSR Object_FaceDirectionMoving
	
	LDA Objects_Timer, X
	BNE Chomp_ChargeAtPlayer1

	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE Chomp_ChargeNoDec

	DEC Chomp_Charges, X
	BEQ Chomp_GetFree

Chomp_ChargeNoDec:
	LDA #$00
	STA Chomp_Charging, X
	STA <Objects_XVelZ, X
	
Chomp_ChargeAtPlayer1:
	JMP ChompAnimate

Chomp_GetFree:
	JSR Object_MoveTowardsPlayerFast

	LDA Chomp_PinX, X
	SUB <Objects_XZ, X

	JSR Half_Value
	ADD <Objects_XZ, X
	STA <Debris_X

	LDA Chomp_PinY,  X
	SUB <Objects_YZ, X

	JSR Half_Value

	ADD <Objects_YZ,X
	STA <Debris_Y
	JSR Common_MakeChains
	LDA #$02
	STA Chomp_Charging, X

	JMP ChompAnimate

Chomp_Aim:
	LDA RandomN
	AND #$07
	TAY
	LDA Chomp_ChargeXVel, Y
	STA <Objects_XVelZ, X

	LDA Chomp_ChargeYVel, Y
	STA <Objects_YVelZ, X

	JSR Object_XDistanceFromPlayer
	CPY #$00
	BNE Chomp_Aim1

	LDA <Objects_XVelZ, X
	EOR #$FF
	ADD #$01
	STA <Objects_XVelZ, X

Chomp_Aim1:
	RTS
	
Chomp_Charge:
	JSR Chomp_Aim
	
	LDA #$20
	STA Objects_Timer, X
	INC Chomp_Charging, X
	RTS

ChainOffset:
	.byte $F3, $0D

Chomp_MoveChains:
	LDA #$00
	STA Chomp_XChainMax, X
	STA Chomp_YChainMax, X

	LDA ChainChomp_ChainY4, X
	SUB <Vert_Scroll
	STA <Temp_Var1

	LDA ChainChomp_ChainY1, X
	SUB <Vert_Scroll
	SUB <Temp_Var1
	BPL Chain1OK
	
	INC ChainChomp_ChainY1, X
	INC ChainChomp_ChainY1, X

Chain1OK:
	LDA ChainChomp_ChainY2, X
	SUB <Vert_Scroll
	SUB <Temp_Var1
	BPL Chain2OK

	INC ChainChomp_ChainY2, X
	INC ChainChomp_ChainY2, X

Chain2OK:
	LDA ChainChomp_ChainY3, X
	SUB <Vert_Scroll
	SUB <Temp_Var1
	BPL Chain3OK


	INC ChainChomp_ChainY3, X
	INC ChainChomp_ChainY3, X

Chain3OK:	
	LDA <Objects_XZ, X
	ADD #$08
	STA <Temp_Var1

	LDY #$00
	LDA ChainChomp_ChainX1, X
	ADD #$04
	SUB <Temp_Var1
	BPL CMVC1

	INY

CMVC1:
	CMP ChainOffset + 1
	BCC SetChain_YJumpCC

	CMP ChainOffset
	BCS SetChain_YJumpCS

	ADD ChainOffset, Y
	EOR #$FF
	ADD #$01
	ADD ChainChomp_ChainX1, X
	STA ChainChomp_ChainX1, X
	ADD #$04
	STA <Temp_Var1

	LDY #$00
	LDA ChainChomp_ChainX2, X
	ADD #$04
	SUB <Temp_Var1
	BPL CMVC2

	INY

CMVC2:
	CMP ChainOffset + 1

SetChain_YJumpCC:
	BCC SetChain_Y

	CMP ChainOffset

SetChain_YJumpCS:
	BCS SetChain_Y
	
	ADD ChainOffset, Y
	EOR #$FF
	ADD #$01
	ADD ChainChomp_ChainX2, X
	STA ChainChomp_ChainX2, X
	ADD #$04
	STA <Temp_Var1

	LDY #$00
	LDA ChainChomp_ChainX3, X
	ADD #$04
	SUB <Temp_Var1
	BPL CMVC3

	INY

CMVC3:
	CMP ChainOffset + 1
	BCC SetChain_Y

	CMP ChainOffset
	BCS SetChain_Y
	
	ADD ChainOffset, Y
	EOR #$FF
	ADD #$01
	ADD ChainChomp_ChainX3, X
	STA ChainChomp_ChainX3, X
	ADD #$04
	STA <Temp_Var1

	LDY #$00
	LDA ChainChomp_ChainX4, X
	ADD #$04
	SUB <Temp_Var1
	BPL CMVCMaxX

	INY

CMVCMaxX:
	CMP ChainOffset + 1
	BCC SetChain_Y

	CMP ChainOffset
	BCS SetChain_Y

	ADD ChainOffset, Y

	BEQ SetChain_Y

	INC Chomp_XChainMax, X

SetChain_Y:
	LDA <Objects_YZ, X
	ADD #$08
	STA <Temp_Var1

	LDY #$00
	LDA ChainChomp_ChainY1, X
	ADD #$08
	SUB <Temp_Var1
	BPL CMVC4

	INY

CMVC4:
	CMP ChainOffset + 1
	BCC Chomp_MoveChains1CC

	CMP ChainOffset
	BCS Chomp_MoveChains1CS

	ADD ChainOffset, Y
	EOR #$FF
	ADD #$01
	ADD ChainChomp_ChainY1, X
	STA ChainChomp_ChainY1, X
	ADD #$08
	STA <Temp_Var1

	LDY #$00
	LDA ChainChomp_ChainY2, X
	ADD #$08
	SUB <Temp_Var1
	BPL CMVC5

	INY

CMVC5:

	CMP ChainOffset + 1
Chomp_MoveChains1CC:
	BCC Chomp_MoveChains1

	CMP ChainOffset
Chomp_MoveChains1CS:
	BCS Chomp_MoveChains1
	
	ADD ChainOffset, Y
	EOR #$FF
	ADD #$01
	ADD ChainChomp_ChainY2, X
	STA ChainChomp_ChainY2, X
	ADD #$08
	STA <Temp_Var1

	LDY #$00
	LDA ChainChomp_ChainY3, X
	ADD #$08
	SUB <Temp_Var1
	BPL CMVC6

	INY

CMVC6:
	CMP ChainOffset + 1
	BCC Chomp_MoveChains1

	CMP ChainOffset
	BCS Chomp_MoveChains1
	
	ADD ChainOffset, Y
	EOR #$FF
	ADD #$01
	ADD ChainChomp_ChainY3, X
	STA ChainChomp_ChainY3, X

	ADD #$08
	STA <Temp_Var1

	LDY #$00
	LDA ChainChomp_ChainY4, X
	ADD #$08
	SUB <Temp_Var1
	BPL CMVCMaxY

	INY

CMVCMaxY:
	CMP ChainOffset + 1
	BCC Chomp_MoveChains1

	CMP ChainOffset
	BCS Chomp_MoveChains1
	
	ADD ChainOffset, Y
	BEQ Chomp_MoveChains1

	INC Chomp_YChainMax, X

Chomp_MoveChains1:
	RTS

Chomp_DrawChains:
	LDY Object_SpriteRAMOffset, X
	STY <Temp_Var4

	LDA ChainChomp_ChainX1, X
	SUB <Horz_Scroll
	STA <Temp_Var2
	

	LDA ChainChomp_ChainY1, X
	SUB <Vert_Scroll
	STA <Temp_Var1

	JSR Object_ParticleVisibleTestC
	BCS CDC1

	LDY <Temp_Var4
	LDA <Temp_Var2
	STA Sprite_RAMX + 8, Y

	LDA <Temp_Var1
	STA Sprite_RAMY + 8, Y

CDC1:
	LDA ChainChomp_ChainX2, X
	SUB <Horz_Scroll
	STA <Temp_Var2

	LDA ChainChomp_ChainY2, X
	SUB <Vert_Scroll
	STA <Temp_Var1

	JSR Object_ParticleVisibleTestC
	BCS CDC2

	LDY <Temp_Var4
	LDA <Temp_Var2
	STA Sprite_RAMX + 12, Y
	LDA <Temp_Var1
	STA Sprite_RAMY + 12, Y

CDC2:
	LDA ChainChomp_ChainX3, X
	SUB <Horz_Scroll
	STA <Temp_Var2

	LDA ChainChomp_ChainY3, X
	SUB <Vert_Scroll
	STA <Temp_Var1

	JSR Object_ParticleVisibleTestC
	BCS CDC3
	
	LDY <Temp_Var4
	LDA <Temp_Var2
	STA Sprite_RAMX + 16, Y
	LDA <Temp_Var1
	STA Sprite_RAMY + 16, Y
	
CDC3:
	LDA ChainChomp_ChainX4, X
	SUB <Horz_Scroll
	STA <Temp_Var2

	LDA ChainChomp_ChainY4, X
	SUB <Vert_Scroll
	STA <Temp_Var1

	JSR Object_ParticleVisibleTestC
	BCS CDC4

	LDY <Temp_Var4
	LDA <Temp_Var2
	STA Sprite_RAMX + 20, Y
	LDA <Temp_Var1
	STA Sprite_RAMY + 20, Y

CDC4:
	LDY <Temp_Var4
	LDA #$55
	STA Sprite_RAMTile + 8, Y
	STA Sprite_RAMTile + 12, Y
	STA Sprite_RAMTile + 16, Y
	STA Sprite_RAMTile + 20, Y

	LDA #SPR_PAL1
	STA Sprite_RAMAttr + 8, Y
	STA Sprite_RAMAttr + 12, Y
	STA Sprite_RAMAttr + 16, Y
	STA Sprite_RAMAttr + 20, Y
	RTS

Chomp_Free:
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat	 
	JSR Object_FaceDirectionMoving
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ FreeNoBounce

	JSR Object_MoveTowardsPlayerFast

	LDA #$E8
	STA <Objects_YVelZ, X

	LDA #$10
	JSR Object_DetectTileAhead
	CMP #TILE_PROP_SOLID_ALL
	BCC FreeNoBounce

	LDA #$D0
	STA <Objects_YVelZ, X

FreeNoBounce:
	INC Chomp_Frame, x
	LDA Chomp_Frame, x
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame, X
	JMP Object_Draw    
    


;***********************************************************************************
; Giant Chomp
;***********************************************************************************
; IMMUNITIES:
;		All
;***********************************************************************************
;	This enemy waits for Mario to be within 48 pixels between its midpoint and Mario's midpoint.
;	Then this enemy falls straight down, breaking any solid block it comes in contact with.
;	When it hits a solid object, it resets it's velocity to 0 and continues to fall
;***********************************************************************************	

GiantChomp_Action = Objects_Data1
GiantChomp_AnimTicks = Objects_Data2

GiantChomp_Palette:
	.byte SPR_PAL1, SPR_PAL0

GiantChompFrames:
	.byte $81, $83, $85, $87, $A1, $A3, $A5, $A7
	.byte $89, $8B, $8D, $8F, $A9, $AB, $AD, $AF

GiantChomp_Offsets:
	.byte $E0, $C0
	.byte $FF, $00

ObjInit_GiantChomp:
	LDA #$08
	STA Objects_SpritesRequested,X 
	
	LDA #BOUND32x32
	STA Objects_BoundBox, X

	LDA #ATTR_ATTACKPROOF
	STA Objects_WeaponAttr, X

	LDA #(ATTR_SHELLPROOF | ATTR_BUMPNOKILL)
	STA Objects_BehaviorAttr, X
	RTS

ObjNorm_GiantChomp:
	LDA GiantChomp_Action, X
	JSR DynJump

	.word GiantChomp_Wait
	.word GiantChomp_Attack
	
GiantChomp_Wait:
	JSR Object_CalcBoundBox
	JSR Object_XDistanceFromPlayer

	LDA <XDiff
	CMP #$30
	BCS WaitChompRTS
	
	INC GiantChomp_Action, X
	
	LDY Objects_Property, X

	LDA #$40
	STA <Objects_YVelZ, X

	LDA <Vert_Scroll
	ADD GiantChomp_Offsets, Y
	STA <Objects_YZ, X

	LDA <Vert_Scroll_Hi
	ADC GiantChomp_Offsets + 2, Y
	STA <Objects_YHiZ, X

	LDA GiantChomp_Orientation, Y
	STA Objects_Orientation, X

WaitChompRTS:
	RTS

GiantChompDetect_XOffset:
	.byte $08, $18, $08, $18

GiantChompDetect_YOffset:
	.byte $1C, $1C, $04, $04

GiantChomp_Pal:
	.byte SPR_PAL2, SPR_PAL0


GiantChomp_Orientation:
	.byte $00, SPR_VFLIP	

GiantChomp_Attack:
	LDA <Player_HaltGameZ
	BEQ GiantChomp_Norm
	JMP GiantChomp_Draw

GiantChomp_Norm:
	LDA Objects_Property, X
	CMP #$02
	BEQ GiantChomp_NoDelete

	JSR Object_DeleteOffScreen

GiantChomp_NoDelete:
	LDA Objects_Property, X
	STA Reverse_Gravity

	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

	LDA #ATTR_EXPLOSIONPROOF
	STA <Kill_TypeCheck
	JSR Object_KillOthers


	LDA Objects_Property, X
	ASL A
	TAY

	LDA Game_Counter
	AND #$01
	BNE GiantChomp_OtherBlock

	INY

GiantChomp_OtherBlock:
	LDA Objects_BoundLeft, X
	ADC GiantChompDetect_XOffset, Y
	STA Block_DetectX

	LDA Objects_BoundLeftHi, X
	ADC #$00
	STA Block_DetectXHi

	LDA Objects_BoundTop, X
	ADD GiantChompDetect_YOffset, Y
	STA Block_DetectY

	LDA Objects_BoundTopHi, X
	ADC #$00
	STA Block_DetectYHi

	JSR Object_DetectTile
	CMP #TILE_PROP_SOLID_ALL
	BCC GiantChomp_Animate

	LDA Tile_LastValue
	AND #$C0
	ORA #$01

	JSR Object_ChangeBlock

	LDA Sound_QLevel2
	ORA #SND_LEVELCRUMBLE
	STA Sound_QLevel2

	LDA Objects_SpritesVerticallyOffScreen, X
	BNE GiantChomp_SlowFall

	LDA Block_DetectX
	STA <Debris_X

	LDA Block_DetectY
	STA <Debris_Y
	JSR Common_MakeBricks
	
GiantChomp_SlowFall:
	LDA #$00
	STA <Objects_YVelZ, X

GiantChomp_Animate:
	LDA Game_Counter
	AND #$08
	LSR A
	LSR A
	LSR A
	STA Objects_Frame, X

GiantChomp_Draw:
	LDA #LOW(GiantChompFrames)
	STA <Giant_TilesLow

	LDA #HIGH(GiantChompFrames)
	STA <Giant_TilesHi

	JSR Object_DrawGiant

GiantChomp_RTS:
	RTS    


ObjInit_Thwomp:
	LDA #$06
	STA Objects_SpritesRequested, X

	LDA #(ATTR_FIREPROOF | ATTR_ICEPROOF | ATTR_NINJAPROOF | ATTR_TAILPROOF | ATTR_DASHPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	LDA #(ATTR_SHELLPROOF | ATTR_BUMPNOKILL)
	STA Objects_BehaviorAttr, X

	LDA #BOUND24x32
	STA Objects_BoundBox, X

	LDA #$10
	STA Objects_Health, X

	LDA Objects_Property, X
	BEQ Thwomp_Awake

	LDA #$03
	STA Thwomp_Action, X
	
	LDA #(ATTR_SHELLPROOF | ATTR_BUMPNOKILL | ATTR_WINDAFFECTS)
	STA Objects_BehaviorAttr, X

Thwomp_Awake:	
	; Var4 = origin Y
	LDA <Objects_YZ, X
	STA Thwomp_StartY, X

	LDA <Objects_YHiZ, X
	STA Thwomp_StartYHi, X
	
	; center the X
	LDA <Objects_XZ,X
	ADD #$04
	STA <Objects_XZ,X

	LDA <Objects_XHiZ,X
	ADD #$00
	STA <Objects_XHiZ,X

	LDA #$05
	STA Objects_Health, X

PRG004_A676:
	RTS		 ; Return


Thwomp_Action = Objects_Data1
Thwomp_Ticker = Objects_Data2
Thwomp_StartY = Objects_Data3
Thwomp_StartYHi = Objects_Data4
Thwomp_TilesDetected = Objects_Data5

Thwomp_DetectXOffset:
	.byte $05, $14

ObjNorm_Thwomp:
	LDA <Player_HaltGameZ
	BEQ Thwomp_Normal

	JMP Thwomp_Draw

Thwomp_Normal:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE Thwomp_DoAction

	LDA <Objects_XZ, X
	ADD #$08
	STA <Debris_X

	LDA <Objects_YZ, X
	STA <Debris_Y

	JSR Common_MakeDebris
	LDA #BRICK_DEBRIS
	STA BrickBust_Tile, Y

	LDA Objects_SpriteAttributes, X
	STA BrickBust_Pal, Y
	
	LDA <Objects_XZ, X

	LDA <Objects_YZ, X
	ADD #$10
	STA <Debris_Y

	JSR Common_MakeDebris
	LDA #BRICK_DEBRIS
	STA BrickBust_Tile, Y

	LDA Objects_SpriteAttributes, X
	STA BrickBust_Pal, Y
	JMP Object_SetDeadAndNotSpawned

Thwomp_DoAction:
	JSR Object_DeleteOffScreen
	
	LDA Thwomp_Action, X
	JSR DynJump

	.word Thwomp_WaitForPlayer
	.word Thwomp_FallToGround
	.word Thwomp_ReturnToOrigin
	.word Thwomp_Sleep

Thwomp_WaitForPlayer:
	LDA #$12
	STA PatTable_BankSel + 4

	LDA Objects_SpritesVerticallyOffScreen,X
	CMP #(SPRITE_0_VINVISIBLE | SPRITE_1_VINVISIBLE)

	BEQ Thwomp_KeepWaiting
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_CheckForeground
	JSR Object_AttackOrDefeat

	JSR Object_XDistanceFromPlayer

	LDY #$00
	LDA <XDiff
	CMP #$50
	BCS Thwomp_KeepFrame

	INY

Thwomp_KeepFrame:
	TYA
	STA Objects_Frame, X

	LDA <XDiff
	CMP #$20
	BCS Thwomp_KeepWaiting

	INC Thwomp_Action, X

	LDA #$00
	STA Thwomp_TilesDetected, X

	LDA #$02
	STA Objects_Frame, X

Thwomp_KeepWaiting:
	JMP Thwomp_Draw

Thwomp_FallToGround:
	LDA #$12
	STA PatTable_BankSel + 4

	JSR Object_Move
	JSR Object_CalcBoundBox
	
	JSR Object_AttackOrDefeat

	INC Thwomp_Ticker, X
	LDA Thwomp_Ticker, X
	AND #$01
	TAY

	LDA Objects_BoundLeft, X
	ADD Thwomp_DetectXOffset, Y
	STA Tile_DetectionX

	LDA Objects_BoundLeftHi, X
	ADC #$00
	STA Tile_DetectionXHi

	LDA Objects_BoundBottom, X
	STA Tile_DetectionY

	LDA Objects_BoundBottomHi, X
	STA Tile_DetectionYHi

	JSR Object_DetectTile

	LDA Tile_LastProp
	CMP #TILE_PROP_SOLID_TOP
	BCC Thwomp_NoHit

	JSR Object_HitGround

	INC Thwomp_TilesDetected, X
	LDA Thwomp_TilesDetected, X
	CMP #$03
	BCS Thwomp_DetectGrnd

	LDA #$20
	STA <Objects_YVelZ, X

	LDA Tile_LastProp
	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_SOLID_OBJECTINTERACT)
	BEQ Thwomp_Burst

	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_STONE)
	BNE Thwomp_CheckBlock

Thwomp_Burst:
	LDA #TILE_ITEM_BRICK
	STA Tile_LastProp

Thwomp_CheckBlock:
	CMP #TILE_ITEM_COIN
	BCC Thwomp_NoBump

	JSR Object_DirectBumpBlocks

Thwomp_NoBump:
	JMP Thwomp_Draw

Thwomp_DetectGrnd:
	LDA #$20
	STA Level_Vibration

	LDA #$30
	STA Objects_Timer, X

	LDA #SND_LEVELBABOOM
	STA Sound_QLevel1
	INC Thwomp_Action, X

Thwomp_NoHit:
	JMP Thwomp_Draw

Thwomp_ReturnToOrigin:
	LDA #$12
	STA PatTable_BankSel + 4

	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

	LDA Objects_Timer, X
	BNE Thwomp_Draw

	LDA #$01
	STA Objects_Frame, X

	LDA #$F0
	STA <Objects_YVelZ, X
	JSR Object_Move

	LDA <Objects_YZ, X
	CMP Thwomp_StartY, X
	BNE Thwomp_Draw

	LDA <Objects_YHiZ, X
	CMP Thwomp_StartYHi, X
	BNE Thwomp_Draw

	LDA #$00
	STA Thwomp_Action, X

Thwomp_Draw:

	JSR Object_Draw16x32	 ; Draw left 2/3 of Thwomp

	LDY Object_SpriteRAMOffset,X	 ; Y = Sprite_RAM offset

	; The right sprites appear +16 away from Thwomp's left
	LDA Objects_SpritesHorizontallyOffScreen,X
	AND #SPRITE_2_INVISIBLE
	BNE Thwomp_DrawRTS

	LDA Objects_SpritesVerticallyOffScreen,X
	AND #SPRITE_0_VINVISIBLE
	BNE Thwomp_Draw1

	LDA Objects_SpriteX, X
	ADD #$10
	STA Sprite_RAMX + 16,Y

	LDA Objects_SpriteY, X
	STA Sprite_RAMY + 16,Y

	LDA Sprite_RAMAttr,Y
	ORA #SPR_HFLIP
	STA Sprite_RAMAttr + 16,Y

	
	LDA Sprite_RAMTile, Y
	STA Sprite_RAMTile + 16, Y

Thwomp_Draw1:
	LDA Objects_SpritesVerticallyOffScreen,X
	AND #SPRITE_1_VINVISIBLE
	BNE Thwomp_DrawRTS

	LDA Objects_SpriteX, X
	ADD #$10
	STA Sprite_RAMX + 20,Y

	LDA Objects_SpriteY, X
	ADD #$10
	STA Sprite_RAMY + 20,Y

	; Right sprite horizontally flipped
	LDA Sprite_RAMAttr + 8,Y
	ORA #SPR_HFLIP
	STA Sprite_RAMAttr + 20,Y

	LDA Sprite_RAMTile + 8, Y
	STA Sprite_RAMTile + 20, Y

Thwomp_DrawRTS:
	RTS		 ; Return    

Thwomp_Sleep:   
	LDA #$12
	STA PatTable_BankSel + 5

	LDA Wind
	PHA
	
	JSR Half_Value
	JSR Half_Value
	STA Wind

	JSR Object_Move

	PLA
	STA Wind 
	
	JSR Object_CalcBoundBox
	JSR Explosion_KillOthers
	JSR Object_AttackOrDefeat

	INC Thwomp_Ticker, X
	LDA Thwomp_Ticker, X
	AND #$01
	TAY

	LDA Objects_BoundLeft, X
	ADD Thwomp_DetectXOffset, Y
	STA Tile_DetectionX

	LDA Objects_BoundLeftHi, X
	ADC #$00
	STA Tile_DetectionXHi

	LDA Objects_BoundBottom, X
	STA Tile_DetectionY

	LDA Objects_BoundBottomHi, X
	STA Tile_DetectionYHi

	JSR Object_DetectTile

	LDA Tile_LastProp
	CMP #TILE_PROP_SOLID_TOP
	BCC Thwomp_SleepNoHit

	JSR Object_HitGround

	LDA #(ATTR_SHELLPROOF | ATTR_BUMPNOKILL | ATTR_WINDAFFECTS)
	STA Objects_BehaviorAttr, X

	LDA <Objects_YHiZ, X
	BMI Thwomp_SleepNoBreak

	LDA <Objects_YZ, X
	CMP #$80
	BCC Thwomp_SleepNoBreak

	LDA #OBJSTATE_KILLED
	STA Objects_State, X
	BNE Thwomp_SleepDetectGrnd

Thwomp_SleepNoHit:
	LDA #(ATTR_SHELLPROOF | ATTR_BUMPNOKILL)
	STA Objects_BehaviorAttr, X

Thwomp_SleepDetectGrnd:
Thwomp_SleepNoBreak:
	LDA #$04
	STA Objects_Frame, X
	JMP Thwomp_Draw

ObjInit_AngryThwomp:
	LDA #$06
	STA Objects_SpritesRequested, X

	LDA #BOUND24x32
	STA Objects_BoundBox, X

	LDA #(ATTR_FIREPROOF | ATTR_ICEPROOF | ATTR_NINJAPROOF | ATTR_TAILPROOF | ATTR_DASHPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	LDA #(ATTR_SHELLPROOF | ATTR_BUMPNOKILL)
	STA Objects_BehaviorAttr, X	

	LDA #$03
	STA Thwomp_Action, X

	LDA <Objects_XZ, X
	ADD #$04
	STA <Objects_XZ, X

	LDA Objects_Property, X
	EOR #$01
	STA Objects_Frame, X

	LDA #$05
	STA Objects_Health, X

	LDY Objects_Property, X
	LDA AngryThwomp_StartAction, Y
	STA Thwomp_Action, X
	RTS

AngryThwomp_StartAction:
	.byte $03, $01

ObjNorm_AngryThwomp:
	LDA <Player_HaltGameZ
	BEQ AngryThwomp_Normal

	JMP Thwomp_Draw

AngryThwomp_Normal:

	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE AngryThwomp_DoAction

	LDA <Objects_XZ, X
	ADD #$08
	STA <Debris_X

	LDA <Objects_YZ, X
	STA <Debris_Y

	JSR Common_MakeDebris
	LDA #BRICK_DEBRIS
	STA BrickBust_Tile, Y

	LDA Objects_SpriteAttributes, X
	STA BrickBust_Pal, Y
	
	LDA <Objects_XZ, X

	LDA <Objects_YZ, X
	ADD #$10
	STA <Debris_Y

	JSR Common_MakeDebris
	LDA #BRICK_DEBRIS
	STA BrickBust_Tile, Y

	LDA Objects_SpriteAttributes, X
	STA BrickBust_Pal, Y
	JMP Object_Delete

AngryThwomp_DoAction:
	JSR Object_DeleteOffScreen

	LDA Thwomp_Action, X
	AND #$03

	JSR DynJump

	.word Thwomp_FallToGround
	.word AngryThwompWait
	.word Thwomp_FallToCeiling
	.word AngryThwompWait

AngryThwompWait:
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_CheckForeground
	JSR Object_AttackOrDefeat

	LDA Objects_Timer, X
	BNE AngryThwompWaitRTS

	
	LDA Objects_SpritesVerticallyOffScreen,X
	CMP #(SPRITE_0_VINVISIBLE | SPRITE_1_VINVISIBLE)
	BEQ AngryThwompWaitRTS

	JSR Object_XDistanceFromPlayer

	LDA <XDiff
	CMP #$40
	BCS AngryThwompWaitRTS

	INC Thwomp_Action, X
	LDA Objects_Frame, X
	EOR #$01
	STA Objects_Frame, X

	LDA #$00
	STA Thwomp_TilesDetected, X

AngryThwompWaitRTS:
	JMP Thwomp_Draw


Thwomp_FallToCeiling:
	INC Reverse_Gravity
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

	INC Thwomp_Ticker, X
	LDA Thwomp_Ticker, X
	AND #$01
	TAY

	LDA Objects_BoundLeft, X
	ADD Thwomp_DetectXOffset, Y
	STA Tile_DetectionX

	LDA Objects_BoundLeftHi, X
	ADC #$00
	STA Tile_DetectionXHi

	LDA Objects_BoundTop, X
	STA Tile_DetectionY

	LDA Objects_BoundTopHi, X
	STA Tile_DetectionYHi

	JSR Object_DetectTile
	
	LDA Tile_LastProp
	CMP #TILE_PROP_SOLID_TOP
	BCC AngryThwomp_NoHit

	JSR Object_HitCeiling

	INC Thwomp_TilesDetected, X
	LDA Thwomp_TilesDetected, X
	CMP #$03
	BCS AngryThwomp_DetectCeil

	LDA #$E0
	STA <Objects_YVelZ, X

	LDA Tile_LastProp
	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_SOLID_OBJECTINTERACT)
	BEQ AngryThwomp_Burst

	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_STONE)
	BNE AngryThwomp_CheckBlock


AngryThwomp_Burst
	LDA #TILE_ITEM_BRICK
	STA Tile_LastProp


AngryThwomp_CheckBlock:
	LDA Tile_LastProp
	CMP #TILE_ITEM_COIN
	BCC AngryThwomp_NoBump

	JSR Object_DirectBumpBlocks

AngryThwomp_NoBump:
	JMP Thwomp_Draw

AngryThwomp_DetectCeil:
	LDA #$20
	STA Level_Vibration

	LDA #$30
	STA Objects_Timer, X

	LDA #SND_LEVELBABOOM
	STA Sound_QLevel1
	INC Thwomp_Action, X

AngryThwomp_NoHit:
	JMP Thwomp_Draw    	

Boo_Chasing = Objects_Data1
Boo_ChaseTicks = Objects_Data2
    
Boo_PlayerCheck:
	.byte $00, $01

ObjInit_Boo:
	LDA #(ATTR_FIREPROOF | ATTR_ICEPROOF | ATTR_HAMMERPROOF | ATTR_PROJECTILEPROOF | ATTR_TAILPROOF | ATTR_DASHPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	LDA #(ATTR_EXPLOSIONPROOF | ATTR_SHELLPROOF)
	STA Objects_BehaviorAttr, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #$10
	STA ChaseVel_LimitHi, X

	LDA #$F0
	STA ChaseVel_LimitLo, X
	RTS

ObjNorm_Boo:
	LDA Objects_Timer, X
	BEQ Boo_CheckDead

	CMP #$01
	BNE Boo_TempDead

	LDA <Objects_XZ, X
	STA <Poof_X

	LDA <Objects_YZ, X
	STA <Poof_Y

	JSR Common_MakePoof

Boo_TempDead:
	RTS	

Boo_CheckDead:	
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE Boo_NotDead

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	LDA <Objects_XZ, X
	STA <Poof_X

	LDA <Objects_YZ, X
	STA <Poof_Y

	JSR Common_MakePoof
	
	LDA #$7F
	STA Objects_Timer, X
	RTS

Boo_NotDead:
	LDA <Player_HaltGameZ
	BNE Boo_Draw

	JSR Object_DeleteOffScreen
	JSR Object_FacePlayer
	JSR Object_XDistanceFromPlayer
	
	LDY <XDiffLeftRight

	LDA Player_Direction
	CMP Boo_PlayerCheck, Y
	BNE Boo_NoChase

	LDA #$01
	BNE Boo_CheckChase

Boo_NoChase:
	LDA #$00

Boo_CheckChase:	
	CMP Boo_Chasing, X
	BEQ Boo_SetChase

	PHA
	
	LDA #$00
	STA <Objects_XVelZ, X
	STA <Objects_YVelZ, X
	STA Boo_ChaseTicks, X
	
	PLA

Boo_SetChase:
	STA Boo_Chasing, X
	CMP #$00
	BEQ Boo_Interact

	INC Boo_ChaseTicks, X
	
	LDA Boo_ChaseTicks, X
	CMP #$10
	BCC Boo_Interact

	DEC Boo_ChaseTicks, X
	JSR Object_ChasePlayer

Boo_Interact:
	JSR Object_CalcBoundBox	
	INC Object_DisableWater
	JSR Object_DetectTiles
	JSR Object_CheckForeground
	JSR Object_AttackOrDefeat

Boo_Draw:
	LDA Boo_Chasing, X
	BNE Boo_SetFrame

	LDA Game_Counter
	AND #$01
	BEQ Boo_SetFrame
	RTS

Boo_SetFrame:	
	STA Objects_Frame, X

	JMP Object_Draw

PirateBoo_CoinTimer = Objects_Data1

ObjInit_PirateBoo:
	LDA #(ATTR_FIREPROOF | ATTR_ICEPROOF | ATTR_HAMMERPROOF | ATTR_PROJECTILEPROOF | ATTR_TAILPROOF | ATTR_DASHPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	LDA #(ATTR_EXPLOSIONPROOF | ATTR_SHELLPROOF)
	STA Objects_BehaviorAttr, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #$E8
	STA ChaseVel_LimitLo, X

	LDA #$18
	STA ChaseVel_LimitHi, X

	LDA Objects_Property, X
	BEQ PriateBoo_InitRTS

	LDA #SPR_BEHINDBG
	STA Objects_SpriteAttributes, X

PriateBoo_InitRTS:
	RTS

ObjNorm_PirateBoo:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE PirateBoo_NotDead

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X
	
	LDA #$FF
	STA Objects_Timer, X

PirateBoo_NotDead:
	LDA <Player_HaltGameZ
	BNE PirateBoo_Draw

	JSR Object_CalcBoundBox
	JSR Object_ChasePlayer
	JSR Object_FaceDirectionMoving
	JSR Object_InteractWithPlayer	

PirateBoo_Draw:
	JMP Object_Draw 	

PirateBoo_TakeCoins:
	INC PirateBoo_CoinTimer, X
	LDA PirateBoo_CoinTimer, X
	AND #$07
	BNE PirateBoo_Draw

	INC Coins_Lost

	LDA Sound_QLevel1
	ORA #SND_LEVELCOIN
	STA Sound_QLevel1
	STA Force_Coin_Update
	BNE PirateBoo_Draw        


ObjInit_ProjBar:
	LDA #BOUND8x16
	STA Objects_BoundBox, X

	JSR Object_NoInteractions

	LDA #$05
	STA Objects_SpritesRequested, X
	
	LDA Objects_XZ, X
	ADD #$04
	STA Objects_XZ, X

	LDA Objects_Property, X
	AND #$01
	STA Objects_Data5, X

	LDA Objects_Property, X
	LSR A
	AND #01
	STA Objects_Data4, X

	LDA Objects_Property, X
	AND #$04
	BEQ Init_ProjBarRTS
	
	LDA #$40
	STA Objects_Data3, X

Init_ProjBarRTS:
	RTS

BarTiles:
	.byte $65, $59

BarPalette:
	.byte $01, $02

RadialTable:
	.byte 08, 16, 24, 32
	.byte 08, 15, 23, 31
	.byte 07, 14, 22, 29
	.byte 07, 13, 20, 26
	.byte 05, 11, 17, 23
	.byte 04, 07, 13, 17
	.byte 03, 06, 09, 12
	.byte 01, 03, 04, 06

RadialTableY:
	.byte 00, 00, 00, 00
	.byte -01, -03, -04, -06
	.byte -03, -06, -09, -12
	.byte -04, -07, -13, -17
	.byte -05, -11, -17, -23
	.byte -07, -13, -20, -26
	.byte -07, -14, -22, -29
	.byte -08, -15, -23, -31
	.byte -08, -16, -24, -32
	.byte -08, -15, -23, -31
	.byte -07, -14, -22, -29
	.byte -07, -13, -20, -26
	.byte -05, -11, -17, -23
	.byte -04, -07, -13, -17
	.byte -03, -06, -09, -12
	.byte -01, -03, -04, -06
	.byte 00, 00, 00, 00
	.byte 01, 03, 04, 06
	.byte 03, 06, 09, 12
	.byte 04, 07, 13, 17
	.byte 05, 11, 17, 23
	.byte 07, 13, 20, 26
	.byte 07, 14, 22, 29
	.byte 08, 15, 23, 31
	.byte 08, 16, 24, 32
	.byte 08, 15, 23, 31
	.byte 07, 14, 22, 29
	.byte 07, 13, 20, 26
	.byte 05, 11, 17, 23
	.byte 04, 07, 13, 17
	.byte 03, 06, 09, 12
	.byte 01, 03, 04, 06

ObjNorm_ProjectileBar:
	JSR Object_CalcBoundBox
	JSR Object_DeleteOffScreen

	LDA <Player_HaltGameZ
	BNE DoBarBar

	LDA Objects_Property, X
	AND #$01
	BEQ DecBar

	INC Objects_Data3, X
	JMP DoBarBar

DecBar:
	DEC Objects_Data3, X

DoBarBar:
	LDY #$08
	JSR Object_DetermineVerticallyOffScreen
	LDY #$08
	JSR Object_DetermineHorizontallyOffScreen

DoPBarDraw:
	LDA Objects_SpritesVerticallyOffScreen, X
	ORA Objects_SpritesHorizontallyOffScreen, X
	BEQ DrawPBar
	RTS

DrawPBar:
	LDA Objects_XZ, X
	STA DAIZ_TEMP1
	STA PBarHitTestX
	LDA Objects_YZ, X
	STA DAIZ_TEMP2
	STA PBarHitTestY
	JSR Object_CalcSpriteXY_NoHi
	LDY Object_SpriteRAMOffset, X
	LDA Objects_Data4, X
	TAX
	LDA BarTiles, X
	STA Sprite_RAM + 1, Y
	STA Sprite_RAM + 5, Y
	STA Sprite_RAM + 9, Y
	STA Sprite_RAM + 13, Y
	STA Sprite_RAM + 17, Y
	LDA BarPalette, X
	STA Sprite_RAM + 2, Y
	STA Sprite_RAM + 6, Y
	STA Sprite_RAM + 10, Y
	STA Sprite_RAM + 14, Y
	STA Sprite_RAM + 18, Y
	LDX <CurrentObjectIndexZ

	LDA Objects_Data3, X
	AND #$7C
	STA TempX
	LDX <CurrentObjectIndexZ

DrawProjectileBar:
	LDA <Objects_SpriteX, X
	STA Sprite_RAM + 3, Y
	STA TempA
	LDA <Objects_SpriteY, X
	STA Sprite_RAM , Y
	LDA #$03
	STA TempY
	
SetXOffset:
	LDX TempX
	LDA RadialTable, X
	BPL DoXOffsetAdd
	EOR #$FF
	ADD #$01
	STA <Temp_Var1
	LDA DAIZ_TEMP1
	SUB <Temp_Var1
	LDX TempY
	STA PBarHitTestX + 1, X
	LDA TempA
	SUB <Temp_Var1
	BCS StoreXOffset
	LDA #$00
	BEQ StoreXOffset

DoXOffsetAdd:
	PHA
	ADD DAIZ_TEMP1
	LDX TempY
	STA PBarHitTestX + 1, X
	PLA
	ADD TempA
	BCC StoreXOffset
	LDA #$00

StoreXOffset:
	STA Sprite_RAM +  7, Y
	INC TempX
	INY
	INY
	INY
	INY
	DEC TempY
	BPL SetXOffset

	LDA TempX
	SUB #$04
	STA TempX
	
	LDX <CurrentObjectIndexZ
	LDA <Objects_SpriteY, X
	LDY Object_SpriteRAMOffset, X
	STA Sprite_RAM , Y
	STA TempA
	LDA #$03
	STA TempY
	
SetYOffset:
	LDX TempX
	LDA RadialTableY, X
	BPL DoYOffsetAdd
	EOR #$FF
	ADD #$01
	STA <Temp_Var1
	LDA DAIZ_TEMP2
	SUB <Temp_Var1
	LDX TempY
	STA PBarHitTestY + 1, X
	LDA TempA
	SUB <Temp_Var1
	BCS StoreYOffset
	LDA #$F8
	BEQ StoreYOffset

DoYOffsetAdd:
	PHA
	ADD DAIZ_TEMP2
	LDX TempY
	STA PBarHitTestY + 1, X
	PLA
	ADD TempA
	BCC StoreYOffset
	LDA #$F8

StoreYOffset:
	STA Sprite_RAM +  4, Y
	INC TempX
	INY
	INY
	INY
	INY
	DEC TempY 
	BPL SetYOffset

	LDA TempX
	SUB #$04
	STA TempX
	LDX #$04

CheckColide:
	STX TempX
	JSR ProjectileBarCollide
	LDX TempX
	DEX
	BPL CheckColide
	LDX CurrentObjectIndexZ
	RTS

   
PObjYOff_PlayerSize:	.byte 18, 10	; Small vs not small
PObj_VLimit:	.byte $10, $16

ProjectileBarCollide:

	LDY #$00	 ; Y = 0 (small/ducking)

	LDA <Player_Suit
	BEQ P_PRG007_B7E4	 ; If Player is small, jump to PRG007_B7E4

	LDA Player_IsDucking
	BNE P_PRG007_B7E4	 ; If Player is ducking, jump to PRG007_B7E4

	INY		 ; Y = 1 (otherwise)

P_PRG007_B7E4:
	LDA PBarHitTestY,X		; Special object Y
	ADD #$08			; +8
	SUB <Player_YZ			; Subtract Player Y
	SUB PObjYOff_PlayerSize,Y	; Subtract Player height offset
	CMP PObj_VLimit,Y
	BGE P_PRG007_B826	 	; If result >= SObj_VLimit, jump to PRG007_B843 (RTS)

	LDA PBarHitTestX,X		; Special object X
	ADD #$04			; +6
	SUB <Player_X			; Subtract Player X
	SBC #$00			; Carry?
	CMP #16
	BGE P_PRG007_B826	 	; If result >= 16, jump to PRG007_B843 (RTS)

P_PRG007_B805:
	LDA Player_FlashInv	; If Player is flashing from being hit ...
	ORA <Player_HaltGameZ	; ... if gameplay is halted ...
	ORA Player_IsDying	; ... Player is dying ...
	BEQ P_PRG007_B827	 	; ... jump to Player_Behind_En (RTS)

P_PRG007_B826:
	RTS		 ; Return

XKnockBacks: .byte $20, $E0, $E0, $20
YKnockBacks: .byte $E0, $20, $20, $E0

P_PRG007_B827:
	LDX <CurrentObjectIndexZ
	LDA Objects_Data4, X
	BEQ P_PRG007_B828
	JSR Object_YDistanceFromPlayer
	TYA
	ASL A
	ADD Objects_Data5, X
	TAY
	LDA XKnockBacks, Y
	STA <Player_XVelZ
	JSR Object_XDistanceFromPlayer
	TYA
	ASL A
	ADD Objects_Data5, X
	TAY
	LDA YKnockBacks, Y
	STA <Player_YVelZ 
	STA <Player_InAir
	JSR Player_Freeze
	LDX <CurrentObjectIndexZ
	PLA
	PLA
	RTS

P_PRG007_B828:
	JMP Player_GetHurt	 ; Hurt Player and don't come back!
     


Podobo_Limit = Objects_Data3
Podobo_LimitHi = Objects_Data4
Podobo_Frame = Objects_Data1
Podobo_Timer = Objects_Data5
Podobo_BridgeBreak = Objects_Data6
Podobo_Hiding = Objects_Data7

Podobo_TileCheck:
	.byte $10, $F0
	.byte $00, $FF

Podobo_HeightLimits:
	.byte $2A, $D6
	.byte $00, $FF

Podobo_JumpYVel:
	.byte $C0, $40

ObjInit_Podobo:
	LDA #(ATTR_FIREPROOF | ATTR_HAMMERPROOF | ATTR_NINJAPROOF | ATTR_TAILPROOF | ATTR_DASHPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	LDA #(ATTR_SHELLPROOF | ATTR_NOICE )
	STA Objects_BehaviorAttr, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #$01
	STA Objects_Health, X

	LDA Objects_Property, X
	BEQ ObjInit_Podobo1

	LDA #$0A
	STA PatTable_BankSel+4

ObjInit_Podobo1:
	LDY #$00

	LDA Objects_Property, X
	AND #$02
	BEQ ObjInit_Podobo2

	INY

ObjInit_Podobo2:
	LDA <Objects_YZ,X
	ADD Podobo_HeightLimits, Y
	STA Podobo_Limit,X

	LDA <Objects_YHiZ,X
	ADC Podobo_HeightLimits + 2, Y
	STA Podobo_LimitHi,X

	LDA <Objects_XZ, X
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	STA Tile_DetectionXHi

	LDA <Objects_YZ, X
	STA Tile_DetectionY

	LDA <Objects_YHiZ, X
	STA Tile_DetectionYHi

	LDA Objects_Property, X
	AND #$02
	LSR A
	STA TempA

Podob_NextTileCheck:
	LDY TempA
	LDA Tile_DetectionY
	ADD Podobo_TileCheck, Y
	STA Tile_DetectionY

	LDA Tile_DetectionYHi
	ADC Podobo_TileCheck + 2, Y
	STA Tile_DetectionYHi

	JSR Object_DetectTile
	AND #TILE_PROP_WATER
	BEQ Podob_NextTileCheck

	LDA Tile_DetectionY
	STA <Objects_YZ, X

	LDA Tile_DetectionYHi
	STA <Objects_YHiZ, X

	LDA #$40
	STA Objects_Timer, X

	LDA Podobo_JumpYVel, Y
	STA <Objects_YVelZ, X
	STA Podobo_Hiding, X

	LDA #$01
	STA Objects_InWater, X

	RTS		 ; Return

ObjNorm_Podobo:
	LDA <Player_HaltGameZ
	BEQ Podobo_Norm

	JMP Podobo_Draw

Podobo_Norm:
	
	JSR Object_DeleteOffScreen

	LDA Objects_Timer,X
	BEQ Podobo_Move	 ; If timer expired, jump to PRG005_A259

Podobo_Hide:
	RTS

Podobo_Move:
	LDA Podobo_Hiding, X
	BEQ Podobo_KeepMoving

	JSR Object_XDistanceFromPlayer
	CMP #$60
	BCS Podobo_MoveDone
	
	LDA #$00
	STA Podobo_Hiding, X

Podobo_KeepMoving:
	LDA Objects_Property, X
	AND #$02
	BNE Podobo_ReverseMove

	LDA <Objects_YVelZ, X
	BPL Podobo_MoveGravity

	LDA <Objects_YZ, X
	SUB Podobo_Limit, X

	LDA <Objects_YHiZ, X
	SBC Podobo_LimitHi, X
	BCC Podobo_MoveGravity

	LDA #$C0
	STA <Objects_YVelZ, X
	BNE Podobo_MoveGravity

Podobo_ReverseMove:
	INC Reverse_Gravity

	LDA <Objects_YVelZ, X
	BMI Podobo_MoveGravity

	LDA <Objects_YZ, X
	SUB Podobo_Limit, X

	LDA <Objects_YHiZ, X
	SBC Podobo_LimitHi, X
	BCS Podobo_MoveGravity

	LDA #$40
	STA <Objects_YVelZ, X

Podobo_MoveGravity:
	JSR Object_Move

Podobo_MoveDone:
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_DetectTiles
	JSR Object_CheckForeground

	LDA Object_VertTileProp, X
	CMP #(TILE_PROP_SOLID_TOP | TILE_PROP_SOLID_OBJECTINTERACT)
	BEQ Podobo_DoBridgeBreak

	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_SOLID_OBJECTINTERACT)
	BNE Podobo_NoBridgeBreak

Podobo_DoBridgeBreak:
	LDA #$03
	STA Podobo_BridgeBreak, X

Podobo_NoBridgeBreak:
	JSR Podobo_BreakBridges

	LDA Objects_Property, X
	AND #$02
	BEQ Podobo_CheckLavaNorm

	LDA <Objects_YVelZ, X
	BPL Podobo_Animate

	LDA <Objects_YZ, X
	AND #$0F
	CMP #$05
	BCS Podobo_Animate
	BCC Podobo_CheckLava

Podobo_CheckLavaNorm:
	LDA <Objects_YVelZ, X
	BMI Podobo_Animate

	LDA <Objects_YZ, X
	AND #$0F
	CMP #$0B
	BCC Podobo_Animate

Podobo_CheckLava:
	LDA Object_BodyTileProp, X
	CMP #(TILE_PROP_WATER | TILE_PROP_HARMFUL)
	BEQ Podobo_Pause

	CMP #(TILE_PROP_FOREGROUND |TILE_PROP_WATER | TILE_PROP_HARMFUL)
	BNE Podobo_Animate

Podobo_Pause:

	LDA #$40
	STA Objects_Timer, X

	LDY #$00

	LDA Objects_Property, X
	AND #$02
	BEQ Podobo_NextYVel

	INY

Podobo_NextYVel:
	LDA Podobo_JumpYVel, Y
	STA <Objects_YVelZ, X
	STA Podobo_Hiding, X

Podobo_Animate:
	; Frame loop 0-2
	INC Podobo_Frame, X
	LDA Podobo_Frame, X
	LSR A
	LSR A
	LSR A
	AND #$03
	CMP #$03
	BCC Podobo_StoreFrame

	LDA #$00
	STA Podobo_Frame, X

Podobo_StoreFrame:
	STA Objects_Frame, X


	LDA <Objects_YVelZ, X
	BPL Podobo_Flip

	LDA #$00
	STA Objects_Orientation, X
	BEQ Podobo_Draw

Podobo_Flip:

	LDA #SPR_VFLIP
	STA Objects_Orientation, X
	BNE Podobo_Draw
	
Podobo_Draw:
	LDA Objects_Timer, X
	ORA Podobo_Hiding, X
	BEQ Podobo_Draw1

	RTS

Podobo_Draw1:
	JMP Object_DrawMirrored

Podobo_BridgeOffsets:
	.byte $00, $18, $F8, $08
	.byte $00, $00, $FF, $00

Podobo_BreakBridges:
	LDY Podobo_BridgeBreak, X
	BEQ Podobo_BreakBridgesRTS

	LDA Block_NeedsUpdate
	BNE Podobo_BreakBridgesRTS

	DEC Podobo_BridgeBreak, X

	LDA <Objects_XZ , X
	ADD Podobo_BridgeOffsets, Y
	STA Tile_DetectionX

	LDA <Objects_XHiZ , X
	ADC Podobo_BridgeOffsets + 4, Y
	STA Tile_DetectionXHi

	LDA <Objects_YZ, X
	STA Tile_DetectionY

	LDA <Objects_YHiZ, X
	STA Tile_DetectionYHi

	JSR Object_DetectTile
	CMP #(TILE_PROP_SOLID_TOP | TILE_PROP_SOLID_OBJECTINTERACT)
	BNE Podobo_BreakBridgesRTS

	TYA
	AND #$C0
	ORA #$01
	
	JSR Object_ChangeBlock

	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE Podobo_BreakBridgesRTS

	LDA Tile_DetectionX
	STA Debris_X

	LDA Tile_DetectionY
	STA Debris_Y

	JSR Common_MakeBricks

Podobo_BreakBridgesRTS:
	RTS
	     


PipePodobo_YVel:
	.byte $20, $E0

PipePodobo_Orientation:
	.byte SPR_VFLIP, $00

PipePodobo_StartY = Objects_Data3
PipePodobo_StartYHi = Objects_Data4
PipePodobo_Frame = Objects_Data5
PipePodobo_Hidden = Objects_Data6

ObjInit_PipePodobo:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_FIREPROOF | ATTR_HAMMERPROOF | ATTR_NINJAPROOF | ATTR_TAILPROOF | ATTR_DASHPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	LDA #(ATTR_SHELLPROOF | ATTR_NOICE )
	STA Objects_BehaviorAttr, X

	LDA #$01
	STA Objects_Health, X

	LDA Objects_Property, X
	AND #$01
	BEQ ObjInit_PipePodobo1

	LDA #$0A
	STA PatTable_BankSel+4

ObjInit_PipePodobo1:
	LDA Objects_Property, X
	AND #$02
	LSR A
	TAY

	LDA PipePodobo_YVel, Y
	STA Objects_YVelZ, X

	LDA PipePodobo_Orientation, Y
	STA Objects_Orientation,X

	LDA #SPR_BEHINDBG
	ORA Objects_SpriteAttributes, X
	STA Objects_SpriteAttributes, X

	; Store original Y/Hi into Var5/Var4
	LDA <Objects_YZ,X
	STA PipePodobo_StartY,X

	LDA <Objects_YHiZ,X
	STA PipePodobo_StartYHi,X

	LDA <Objects_XZ, X
	ADD #$08
	STA <Objects_XZ, X

	RTS

ResetPipePodobo:
	LDA #$20
	STA Objects_Timer, X

	LDA PipePodobo_StartY, X
	STA <Objects_YZ, X

	LDA PipePodobo_StartYHi, X
	STA <Objects_YHiZ, X
	RTS		 ; Return

ObjNorm_PipePodobo:
	LDA <Player_HaltGameZ
	BEQ ObjNorm_PipePodobo1

	JMP Object_DrawMirrored

ObjNorm_PipePodobo1:
	JSR Object_DeleteOffScreen
	LDA Objects_Timer, X
	BEQ ObjNorm_PipePodobo2

	RTS

ObjNorm_PipePodobo2:
	JSR Object_ApplyYVel_NoGravity
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat	 ; Handle Player collision with Podoboo

	LDA <Objects_YZ, X
	AND #$0F
	BNE PipePodobo_Animate

	JSR Object_DetectTiles
	LDA Object_BodyTileProp, X
	CMP #TILE_PROP_SOLID_ALL
	BCC PipePodobo_Animate

	JSR ResetPipePodobo

PipePodobo_Animate:
	; Frame loop 0-2
	INC PipePodobo_Frame, X
	LDA PipePodobo_Frame, X
	LSR A
	LSR A
	LSR A
	AND #$03
	CMP #$03
	BCC PipePodobo_StoreFrame

	LDA #$00
	STA PipePodobo_Frame, X

PipePodobo_StoreFrame:
	STA Objects_Frame, X
	
PipePodobo_Draw:
	LDA Objects_Timer, X
	BEQ PipePodobo_DrawAnyway

	RTS

PipePodobo_DrawAnyway:
	JMP Object_DrawMirrored	    
         


Ricochet_Direction = Objects_Data4

Diagonal_PodoboInitXVel:
	.byte $F0, $F0, $10, $10

Diagonal_PodoboInitYVel:
	.byte $10, $F0, $F0, $10

Diagonal_PodoboSpriteFlips:
	.byte SPR_VFLIP, $00, SPR_HFLIP, SPR_VFLIP | SPR_HFLIP

ObjInit_DiagonalPodobo:
	LDA #(ATTR_FIREPROOF | ATTR_HAMMERPROOF | ATTR_NINJAPROOF | ATTR_TAILPROOF | ATTR_DASHPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	LDA #(ATTR_SHELLPROOF | ATTR_NOICE )
	STA Objects_BehaviorAttr, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA Objects_Property, X
	TAY

	LDA Diagonal_PodoboInitXVel, Y
	STA Objects_XVelZ, X

	LDA Diagonal_PodoboInitYVel, Y
	STA Objects_YVelZ, X

	LDA Diagonal_PodoboSpriteFlips, Y
	STA Objects_Orientation, X

	LDA #$01
	STA Objects_Health, X
	RTS

ObjNorm_DiagonalPodobo:
	LDA <Player_HaltGameZ
	BNE ObjNorm_DiagonalPodoboEnd

	JSR Object_DeleteOffScreen
	
	LDA Ricochet_Direction, X
	CMP #$0A
	BCS ObjNorm_DiagonalPodobo0

	INC Ricochet_Direction, X
	BNE ObjNorm_DiagonalPodobo01

ObjNorm_DiagonalPodobo0
	LDA #$00
	STA Ricochet_Direction, X
	
ObjNorm_DiagonalPodobo01:
	LDA Ricochet_Direction, X
	LSR A
	LSR A
	STA Objects_Frame, X

	INC Object_DisableWater
	JSR Object_ApplyXVel
	JSR Object_ApplyYVel_NoGravity
	
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_CheckForeground

	LDA <Objects_YZ, X
	AND #$0F
	BNE Podobo_RichocetCheck

	LDA Object_BodyTileProp, X
	AND #TILE_PROP_WATER
	BNE Podobo_Richocet

Podobo_RichocetCheck:
	LDA <Objects_TilesDetectZ,X
	AND #(HIT_GROUND | HIT_CEILING)
	BEQ ObjNorm_DiagonalPodobo1
	

Podobo_Richocet:
	LDA <Objects_YVelZ,X	 
	
	EOR #$FF
	ADD #$01
	
	STA <Objects_YVelZ,X
	
	LDA Objects_Orientation, X
	EOR #SPR_VFLIP
	STA Objects_Orientation, X

ObjNorm_DiagonalPodobo1:
	LDA <Objects_TilesDetectZ,X
	AND #(HIT_LEFTWALL | HIT_RIGHTWALL)
	BEQ ObjNorm_DiagonalPodobo2
	
	LDA <Objects_XVelZ,X	 
	
	EOR #$FF
	ADD #$01
	
	STA <Objects_XVelZ, X

	LDA Objects_Orientation, X
	EOR #SPR_HFLIP
	STA Objects_Orientation, X

ObjNorm_DiagonalPodobo2:
	JSR Object_AttackOrDefeat

ObjNorm_DiagonalPodoboEnd:
	JMP Object_Draw         

PeekaBoo_Action = Objects_Data1
PeekaBoo_Frames = Objects_Data2
PeekaBoo_AttackDirection = Objects_Data3
PeekaBoo_InverseTimer = Objects_Data4

PeekaBoo_HideTimers:
	.byte $40, $40, $60, $80, $40, $20, $40, $60

PeekaBoo_RaiseLower:
	.byte $F0, $10	

PeekaBoo_Timers:
	.byte $10, $0F	

PeekaBoo_SpriteOrientation:
	.byte SPR_BEHINDBG | SPR_PAL2, SPR_BEHINDBG | SPR_PAL2 | SPR_VFLIP	

ObjInit_PeekaBoo:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_FIREPROOF | ATTR_ICEPROOF | ATTR_HAMMERPROOF | ATTR_PROJECTILEPROOF | ATTR_TAILPROOF | ATTR_DASHPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	JSR Object_CalcBoundBox
	JSR Object_MoveTowardsPlayerFast

	LDA RandomN
	AND #$07
	TAY

	LDA PeekaBoo_HideTimers, Y
	STA Objects_Timer, X
	RTS

ObjNorm_PeekaBoo:

	LDA <Player_HaltGameZ
	BEQ PeekbaBoo_Normal

	LDA PeekaBoo_Action, X
	BNE PeekaBoo_HaltDrawMirrored

	JMP Object_Draw

PeekaBoo_HaltDrawMirrored:
	JMP Object_DrawMirrored

PeekbaBoo_Normal:
	JSR Object_DeleteOffScreen

	LDA PeekaBoo_Action, X
	JSR DynJump

	.word Peekaboo_Chase
	.word PeekaBoo_Raise
	.word PeekaBoo_Attack
	.word PeekaBoo_Lower


Peekaboo_Chase:
	JSR Object_ApplyXVel
	JSR Object_FaceDirectionMoving
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles

	LDA Object_BodyTileValue, X
	AND #$3F
	BEQ Peekaboo_Defeat

	LDA Object_BodyTileProp, X
	CMP #TILE_PROP_SOLID_ALL
	BCS Peekaboo_NotDefeated

Peekaboo_Defeat:
	JMP Object_PoofDie
	
Peekaboo_NotDefeated:	
	LDA <Objects_TilesDetectZ, X
	AND #(HIT_LEFTWALL | HIT_RIGHTWALL)
	BNE Peekaboo_Fine

	LDA <Objects_XVelZ, X
	EOR #$FF
	STA <Objects_XVelZ, X
	
Peekaboo_Fine:	
	JSR Object_YDistanceFromPlayer
	
	LDA <YDiffAboveBelow
	STA PeekaBoo_AttackDirection, X

	LDA Objects_Timer, X
	BNE PeekaBoo_KeepChase

	LDY PeekaBoo_AttackDirection, X

	LDA PeekaBoo_RaiseLower, Y
	STA <Objects_YVelZ, X

	LDA PeekaBoo_SpriteOrientation, Y
	STA Objects_SpriteAttributes, X

	INC PeekaBoo_Action, X

	LDA PeekaBoo_Timers, Y
	STA Objects_Timer, X
	STA PeekaBoo_InverseTimer, X
	RTS

PeekaBoo_KeepChase:	
	LDA #SPR_PAL1
	STA Objects_SpriteAttributes, X

	LDA #$00
	STA Objects_Frame, X

	JMP Object_Draw


PeekaBoo_Raise:
	JSR Object_ApplyYVel_NoGravity
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

	LDA Objects_Timer, X
	BNE PeekaBoo_RaiseDraw

	INC PeekaBoo_Action, X

	LDA #$20
	STA Objects_Timer, X

PeekaBoo_RaiseDraw:	

	LDA #$01
	STA Objects_Frame, X
	JMP Object_DrawMirrored

PeekaBoo_Attack:
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

	LDA Objects_Timer, X
	BNE PeekaBoo_AttackAnimate

	INC PeekaBoo_Action, X

	LDA PeekaBoo_InverseTimer, X
	STA Objects_Timer, X

	LDA <Objects_YVelZ, X
	EOR #$FF
	ADD #$01
	STA <Objects_YVelZ, X

PeekaBoo_AttackAnimate:
	INC PeekaBoo_Frames, X
	
	LDA PeekaBoo_Frames, X
	
	LSR A
	LSR A
	LSR A

	AND #$01
	ORA #$02
	STA Objects_Frame, X

	JMP Object_DrawMirrored

PeekaBoo_Lower:

	JSR Object_ApplyYVel_NoGravity
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

	LDA Objects_Timer, X
	BNE PeekaBoo_LowerDraw

	LDA #$00
	STA PeekaBoo_Action, X

	LDA RandomN
	AND #$07
	TAY

	LDA PeekaBoo_HideTimers, Y
	STA Objects_Timer, X
	RTS

PeekaBoo_LowerDraw:	
	LDA #$01
	STA Objects_Frame, X
	JMP Object_DrawMirrored


PolterGuy_PatternHoz:
	.byte $00

PolterGuy_StartDirection:
	.byte $FF, $01	

PolterGuy_StartSpeed:
	.byte $F0, $10	
	
PolterGuy_HasBomb = Objects_Data1

ObjInit_PolterGuy:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_FIREPROOF | ATTR_ICEPROOF | ATTR_HAMMERPROOF | ATTR_PROJECTILEPROOF | ATTR_TAILPROOF | ATTR_DASHPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	LDA #(ATTR_EXPLOSIONPROOF | ATTR_SHELLPROOF)
	STA Objects_BehaviorAttr, X

	LDA #03
	STA Patrol_Blocks, X

	LDA <Objects_XZ, X
	SUB #$04
	STA <Objects_XZ, X

	LDA <Objects_XHiZ, X
	SBC #$00
	STA <Objects_XHiZ, X

	JSR InitPatrol_NoTimers
	
	LDA #$01
	STA Patrol_YVelocityChange, X

	LDA #$08
	STA Patrol_YAccelLimit, X

	LDA Objects_Property, X
	AND #$01
	TAY

	LDA PolterGuy_StartDirection, Y
	STA Patrol_XVelocityChange, X

	LDA PolterGuy_StartSpeed, Y
	STA Patrol_XAccelLimit, X

	LDA RandomN
	AND #$7F
	STA Objects_Timer, X

	LDA Objects_Property, X
	AND #$02
	LSR A
	STA PolterGuy_HasBomb, X

	RTS

Polter_MissileDrop:
	.byte $00, $08

ObjNorm_PolterGuy:
	LDA <Player_HaltGameZ
	BEQ PolterGuy_Norm
	JMP PolterGuy_Draw

PolterGuy_Norm:

	LDA #$40
	JSR Object_DeleteOffScreenRange
	JSR PatrolDiagonal
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	
	LDA PolterGuy_HasBomb, X
	BEQ PolterGuy_Draw

	JSR Object_XDistanceFromPlayer
	CMP #$20
	BCS PolterGuy_Draw

	JSR Object_YDistanceFromPlayer
	LDA <YDiffAboveBelow
	BEQ PolterGuy_Draw

	JSR Object_FindEmptyY
	BCC PolterGuy_Draw

	LDA #$00
	STA PolterGuy_HasBomb, X

	LDA #OBJ_MISSILE
	STA Objects_ID, Y

	LDA #OBJSTATE_INIT
	STA Objects_State, Y

	LDA #$10
	STA Objects_Timer2, X

	LDA <Objects_XZ, X
	STA Objects_XZ, Y

	LDA <Objects_XHiZ, X
	STA Objects_XHiZ, Y

	LDA <Objects_YZ, X
	STA Objects_YZ, Y

	LDA <Objects_YHiZ, X
	STA Objects_YHiZ, Y

	LDA Objects_Orientation, X
	BEQ PolterGuy_Draw

	LDA Objects_XZ, Y
	ADD #$08
	STA Objects_XZ, Y

	LDA Objects_XHiZ, Y
	ADC #$00
	STA Objects_XHiZ, Y

PolterGuy_Draw:
	LDA PolterGuy_HasBomb, X
	STA Objects_Frame, X
	JMP Object_Draw

ObjInit_Specter:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #$01
	STA ObjSplash_Disabled, X
	RTS

ObjNorm_Specter:
	LDA <Player_HaltGameZ
	BEQ Specter_Norm
	JMP Specter_Draw

Specter_Norm:	
	JSR Object_DeleteOffScreen

	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_DetectTiles
	JSR Object_InteractWithTilesWallStops

	LDA Objects_Timer, X
	BNE Specter_Move

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BNE Specter_MoveUp

	JSR Object_YDistanceFromPlayer

	CPY #$00
	BEQ Specter_MoveUp

	LDA #$40
	STA Objects_Timer, X
	BNE Specter_Move

Specter_MoveUp:
	LDA #$40
	STA Objects_Timer, X

	LDA #$D8
	STA <Objects_YVelZ, X

	JSR Object_MoveTowardsPlayer

Specter_Move:
	LDA #$01
	STA Objects_InWater, X

	JSR Object_ApplyXVel
	JSR Object_ApplyY_With_Gravity

	LDA #$00
	STA Objects_InWater, X
	
Specter_Animate:
	LDY #$00
	LDA <Objects_YVelZ, X
	BMI Specter_SetFrame

	INY

Specter_SetFrame:
	TYA
	STA Objects_Frame, X

Specter_Draw:
	JMP Object_DrawMirrored

ObjInit_Missile:
	LDA #BOUND8x16
	STA Objects_BoundBox, X
	RTS

ObjNorm_Missile:
	LDA <Player_HaltGameZ
	BNE Missile_Draw

	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE	Missile_NoExplode

	JMP Object_Explode

Missile_NoExplode:	
	JSR Object_DeleteOffScreen

	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_InteractWithPlayer

	LDA <Objects_TilesDetectZ, X
	BEQ Missile_Draw

	JMP Object_Explode

Missile_Draw:
	JSR Object_Draw

	LDY Object_SpriteRAMOffset, X
	
	LDA #$FF
	STA Sprite_RAMY + 4, Y
	RTS

Phasm_Action = Objects_Data1
Phasm_AnimTicks = Objects_Data2
Phasm_LocationIndex = Objects_Data3
Phasm_OriginX = Objects_Data4
Phasm_OriginXHi = Objects_Data5
Phasm_OriginY = Objects_Data6
Phasm_OriginYHi = Objects_Data7

Phasm_XLocations:
	.byte $C0, $40, $C0, $40, $C0, $40, $C0, $40
	.byte $00, $10, $00, $10, $00, $10, $00, $10
	.byte $00, $40, $00, $40, $00, $40, $00, $40
	.byte $00, $C0, $00, $C0, $00, $C0, $00, $C0

Phasm_YLocations:
	.byte $00, $00, $00, $00, $00, $00, $00, $00
	.byte $C0, $E0, $00, $20, $C0, $E0, $00, $20
	.byte $00, $00, $00, $00, $00, $00, $00, $00
	.byte $00, $00, $00, $00, $00, $00, $00, $00

ObjInit_Phasm:
	LDA <Objects_XZ, X
	STA Phasm_OriginX, X

	LDA <Objects_XHiZ, X
	STA Phasm_OriginXHi, X

	LDA <Objects_YZ, X
	STA Phasm_OriginY, X

	LDA <Objects_YHiZ, X
	STA Phasm_OriginYHi, X

	JSR Phasm_SetLocation

	LDA #$20
	STA Objects_Timer, X

	JMP Object_NoInteractions

ObjNorm_Phasm:
	LDA Phasm_Action, X
	JSR DynJump

	.word Phasm_Wait
	.word Phasm_PhaseIn
	.word Phasm_Attack
	.word Phasm_PhaseOut

Phasm_Wait:
	LDA Objects_Timer, X
	BNE Phasm_WaitRTS

	INC Phasm_Action, X

	LDA #$0F
	STA Objects_Timer, X

	LDA #$00
	STA Phasm_AnimTicks, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

Phasm_WaitRTS:
	RTS	

Phasm_PhaseIn:
	LDA <Player_HaltGameZ
	BEQ Phasm_PhaseInNorm

	JMP Phasm_Draw

Phasm_PhaseInNorm:
	LDA Objects_Timer, X
	BNE Phasm_PhaseInAnimate

	INC Phasm_Action, X

	LDA #$80
	STA Objects_Timer, X

	JSR Object_CalcBoundBox
	JMP Phasm_Draw

Phasm_PhaseInAnimate:
	INC Phasm_AnimTicks, X
	
	LDA Phasm_AnimTicks, X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame, X

	JMP Phasm_Draw

Phasm_Attack:
	LDA <Player_HaltGameZ
	BNE Phasm_AttackDraw

	LDA #$C0
	JSR Object_DeleteOffScreenRange
	JSR Object_AttackOrDefeat

	LDA Objects_Timer, X
	BNE Phasm_AttackAnimate

	INC Phasm_Action, X

	LDA #$0F
	STA Objects_Timer, X

	LDA #$0F
	STA Phasm_AnimTicks, X
	JMP Phasm_Draw

Phasm_AttackAnimate:
	INC Phasm_AnimTicks, X
	LDA Phasm_AnimTicks, X
	LSR A
	LSR A
	LSR A
	LSR A
	AND #$03
	ADD #$02
	STA Objects_Frame, X

Phasm_AttackDraw:	
	JMP Phasm_Draw

Phasm_PhaseOut:
	LDA <Player_HaltGameZ
	BEQ Phasm_PhaseOutNorm

	JMP Phasm_Draw

Phasm_PhaseOutNorm:
	LDA Objects_Timer, X
	BNE Phasm_PhaseOutAnimate

	INC Phasm_LocationIndex, X

	LDA #$00
	STA Phasm_Action, X


	LDA #$20
	STA Objects_Timer, X

	JSR Object_CalcBoundBox

Phasm_SetLocation:
	LDA Objects_Property, X
	ASL A
	ASL A
	ASL A
	STA <Temp_Var5
	
	LDA Phasm_LocationIndex, X
	AND #$07
	STA Phasm_LocationIndex, X
	ADD <Temp_Var5

	TAY
	
	LDA #$00
	STA <Temp_Var2
	STA <Temp_Var4

	LDA Phasm_XLocations, Y
	BPL Phasm_NotNegX

	PHA

	LDA #$FF
	STA <Temp_Var2

	PLA 

Phasm_NotNegX:
	STA <Temp_Var1
	LDA Phasm_YLocations, Y
	BPL Phasm_NotNegY

	PHA
	LDA #$FF
	STA <Temp_Var4

	PLA

Phasm_NotNegY:	
	STA <Temp_Var3

	LDA Phasm_OriginX, X
	ADD <Temp_Var1
	STA <Objects_XZ, X

	LDA Phasm_OriginXHi, X
	ADC <Temp_Var2
	STA <Objects_XHiZ, X

	LDA Phasm_OriginY, X
	ADD <Temp_Var3
	STA <Objects_YZ, X

	LDA Phasm_OriginYHi, X
	ADC <Temp_Var4
	STA <Objects_YHiZ, X
	RTS

Phasm_PhaseOutAnimate:
	DEC Phasm_AnimTicks, X
	
	LDA Phasm_AnimTicks, X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame, X

	JMP Phasm_Draw

Phasm_Draw:
	JMP Object_DrawMirrored

BooWave_XStart:
	.byte $E0, $20
	.byte $FF, $01

ObjInit_BooWave:
	LDA #(ATTR_FIREPROOF | ATTR_ICEPROOF | ATTR_HAMMERPROOF | ATTR_PROJECTILEPROOF | ATTR_TAILPROOF | ATTR_DASHPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	LDA #(ATTR_EXPLOSIONPROOF | ATTR_SHELLPROOF)
	STA Objects_BehaviorAttr, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X
	JSR InitPatrolVertical

	LDA #$02
	STA Patrol_Blocks, X

	LDY #$00

	LDA Player_EffXVel
	BMI BooWave_SetSide

	INY

BooWave_SetSide:
	LDA <Horz_Scroll
	ADD BooWave_XStart, Y
	STA <Objects_XZ, X

	LDA <Horz_Scroll_Hi
	ADC BooWave_XStart + 2, Y
	STA <Objects_XHiZ, X

	LDA <Player_YZ
	SUB #$20
	STA <Objects_YZ, X

	LDA <Player_YHiZ
	SBC #$00
	STA <Objects_YHiZ, X 

	JSR Object_CalcBoundBox
	JSR Object_MoveTowardsPlayerFast

	RTS

ObjNorm_BooWave:
	LDA <Player_HaltGameZ
	BNE BooWave_Draw

	JSR Object_DeleteOffScreen
	JSR Object_FaceDirectionMoving
	JSR Object_ApplyXVel
	JSR PatrolUpDown
	JSR PatrolUpDown
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

BooWave_Draw:
	JMP Object_Draw


BallChain_XOrigin = Objects_Data1
BallChain_XHiOrigin = Objects_Data2
BallChain_YOrigin = Objects_Data3
BallChain_YHiOrigin = Objects_Data4

BallChain_XOffset:
	.byte $FA, $07, $08, $08

BallChain_XOffsetHi:	
	.byte $FF, $00, $00, $00

BallChain_YOffset:
	.byte $C0, $C0, $40, $40

BallChain_YOffsetHi:	
	.byte $FF, $FF, $00, $00

ObjInit_BallChain:
	LDA <Objects_XZ, X
	ADD #$04
	STA BallChain_XOrigin, X

	LDA <Objects_XHiZ, X
	ADC #$00
	STA BallChain_XHiOrigin, X

	LDA <Objects_YZ, X
	STA BallChain_YOrigin, X

	LDA <Objects_YHiZ, X
	STA BallChain_YHiOrigin, X

	LDY Objects_Property, X
	LDA <Objects_YZ, X
	ADD BallChain_YOffset, Y
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	ADC BallChain_YOffsetHi, Y
	STA <Objects_YHiZ, X

	LDA <Objects_XZ, X
	ADD BallChain_XOffset, Y
	STA <Objects_XZ, X

	LDA <Objects_XHiZ, X
	ADC BallChain_XOffsetHi, Y
	STA <Objects_XHiZ, X

	LDA #$04
	STA Objects_SpritesRequested, X

	LDA #$07
	STA Patrol_BlockDiameter, X
	
	JSR Object_NoInteractions
	JSR BallChain_InitMovement
	
	LDA #$05
	STA Objects_Property, X
	RTS

BallChain_InitMovement:
	LDA Objects_Property, X
	JSR DynJump

	.word InitCircleCW
	.word InitCircleCCW

ObjNorm_BallChain:
	LDA <Player_HaltGameZ
	BEQ BallChain_Norm
	JMP BallChain_Draw

BallChain_Norm:
	LDA #$60
	JSR Object_DeleteOffScreenRange

BallChain_Move:	
	LDA Objects_Property, X
	BEQ BallChain_Draw

	JSR PatrolDiagonal
	JSR PatrolDiagonal

BallChain_Move1:	
	JSR Object_CalcBoundBox
	JSR Object_DetectPlayer
	JSR Object_InteractWithPlayer

BallChain_Draw:
	LDA #$00
	STA Objects_Frame, X

	JSR Object_DrawMirrored
	
	LDY Object_SpriteRAMOffset, X


	LDA <Objects_XZ, X
	ADD #$0D
	STA <Temp_Var3

	LDA <Objects_XHiZ, X
	ADC #$00
	STA <Temp_Var4

	LDA <Temp_Var3
	SUB BallChain_XOrigin, X
	
	PHA

	LDA <Temp_Var4
	SBC BallChain_XHiOrigin, X
	STA <Temp_Var2

	PLA
	JSR Half_Value
	ADD BallChain_XOrigin, X
	STA <Point_X

	LDA BallChain_XHiOrigin, X
	ADC <Temp_Var2
	STA <Point_XHi

	LDA <Objects_YZ, X
	SUB BallChain_YOrigin, X
	
	PHA

	LDA <Objects_YHiZ, X
	SBC BallChain_YHiOrigin, X
	STA <Temp_Var2

	PLA
	JSR Half_Value

	ADD BallChain_YOrigin, X
	STA <Point_Y

	LDA <Temp_Var2
	ADC BallChain_YHiOrigin, X
	STA <Point_YHi
	
	LDA <Point_X
	SUB #$04
	STA <Point_X

	LDA <Point_XHi
	SBC #$00
	STA <Point_XHi

	LDA <Point_Y
	SUB #$04
	STA <Point_Y

	LDA <Point_YHi
	SBC #$00
	STA <Point_YHi

	JSR CheckPoint_OffScreen
	BCC BallChain_Center

	LDA <Point_RelativeX
	STA Sprite_RAMX + 8, Y

	LDA <Point_RelativeY
	STA Sprite_RAMY + 8, Y

	LDA #SPR_PAL2
	STA Sprite_RAMAttr + 8, Y

	LDA #$55
	STA Sprite_RAMTile + 8, Y
	

BallChain_Center:
	LDA BallChain_XOrigin, X
	STA <Point_X
	
	LDA BallChain_XHiOrigin, X
	STA <Point_XHi

	LDA BallChain_YOrigin, X
	STA <Point_Y
	
	LDA BallChain_YHiOrigin, X
	STA <Point_YHi

	JSR CheckPoint_OffScreen
	BCC BallChain_DrawRTS

	LDA <Point_RelativeX
	STA Sprite_RAMX + 12, Y

	LDA <Point_RelativeY
	STA Sprite_RAMY + 12, Y

	LDA #SPR_PAL2
	STA Sprite_RAMAttr + 12, Y

	LDA #$55
	STA Sprite_RAMTile + 12, Y

BallChain_DrawRTS:
	RTS

Object_ParticleVisibleTestC:
	TXA
	PHA
	LDX <CurrentObjectIndexZ
	LDA Objects_SpritesVerticallyOffScreen,X
	BNE PRG004_BE52C	 ; If any sprite is vertically off-screen, jump to PRG004_BE52

	LDA <Objects_SpriteY,X	
	CMP #200
	BGE PRG004_BE52C	 ; If Sprite Y >= 200, jump to PRG004_BE52

	LDY #$40	 ; Y = $40

	LDA <Objects_SpriteX,X
	BMI PRG004_BE45C	 ; If on right half, jump to PRG004_BE45

	LDY #$c0	 ; Y = $C0

PRG004_BE45C:
	CPY <Temp_Var2
	EOR Objects_SpritesHorizontallyOffScreen,X
	BMI PRG004_BE50C
	BCC PRG004_BE52C
	BCS PRG004_BE54C

PRG004_BE50C:
	BCC PRG004_BE54C

PRG004_BE52C:
	PLA
	TAX
	SEC		 ; Set carry (link not visible)

	RTS		 ; Return

PRG004_BE54C:
	PLA
	TAX
	CLC		 ; Clear carry (link is visible)
	RTS		 ; Return	

ObjInit_ParaChomp:
	LDA #$07
	STA Objects_SpritesRequested, X

	LDA #$04
	STA Objects_Health, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_FIREPROOF | ATTR_ICEPROOF | ATTR_STOMPPROOF | ATTR_TAILPROOF |  ATTR_NINJAPROOF)
	STA Objects_WeaponAttr, X

	LDA #ATTR_BUMPNOKILL
	STA Objects_BehaviorAttr, X

ParaChomp_Reset:
	LDA #$00
	STA <Objects_YVelZ, X

	LDA #$01
	STA Patrol_YVelocityChange, X

	LDA #$04
	STA Patrol_YAccelLimit, X

	LDA #$01
	STA Patrol_Blocks, X
	RTS


ParaChomp_Frame = Objects_Data1
ParaChomp_Grabbed = Objects_Data2
ParaChomp_HitDetection = Objects_Data3
ParaChomp_HitCeiling = Objects_Data4
	
ObjNorm_ParaChomp:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE ParaChomp_NotDead

	JSR Object_SetDeadAndNotSpawned

	JMP Object_StarBurstDeath

ParaChomp_NotDead:	

	LDA <Player_HaltGameZ
	BEQ ParaChomp_Norm

	JMP ParaChomp_Draw

ParaChomp_Norm:
	LDA PatTable_BankSel + 5
	CMP #$32
	BNE ParaChomp_NoBankSwap

	LDA #$4F
	STA PatTable_BankSel + 5

ParaChomp_NoBankSwap:
	LDA ParaChomp_Grabbed, X
	BEQ ParaChomp_NotGrabbed

	LDA ParaChomp_HitCeiling, X
	BNE ParaChomp_NoFly

	LDA #$F8
	STA <Objects_YVelZ, X
	STA Player_CarryYVel

	JSR Object_ApplyYVel_NoGravity

ParaChomp_NoFly:	
	JMP ParaChomp_DoInteract

ParaChomp_NotGrabbed:	
	JSR PatrolUpDown

ParaChomp_DoInteract:	
	JSR ParaChomp_Interact
	JSR ParaChomp_DetectTiles

ParaChomp_Animate:
	INC ParaChomp_Frame, X
	LDA ParaChomp_Frame, X
	LSR A
	LSR A

	LDY ParaChomp_Grabbed, X
	BNE ParaChomp_Slow

	LSR A

ParaChomp_Slow:
	AND #$01
	LDX <CurrentObjectIndexZ
	STA Objects_Frame, X

ParaChomp_Draw:
	JSR Object_Draw

ParaChomp_DrawChains:
	LDA Objects_SpritesHorizontallyOffScreen, X
	AND #SPRITE_0_HINVISIBLE
	BNE ParaChomp_DrawWings

	LDA Objects_SpriteX, X
	ADD #$04
	BCC ParaChomp_FirstChain
	JMP ParaChomp_DrawWings

ParaChomp_FirstChain:
	STA Sprite_RAMX+8, Y
	STA Sprite_RAMX+12, Y
	STA Sprite_RAMX+16, Y

	LDA Objects_SpritesVerticallyOffScreen, X
	AND #SPRITE_1_VINVISIBLE
	BNE ParaChomp_SecondChain

	LDA Objects_SpriteY, X
	ADD #$08
	STA Sprite_RAMY + 8, Y

ParaChomp_SecondChain:
	LDA Objects_SpritesVerticallyOffScreen, X
	AND #SPRITE_2_VINVISIBLE
	BNE ParaChomp_ThirdChain

	LDA Objects_SpriteY, X
	ADD #32
	STA Sprite_RAMY + 12, Y

ParaChomp_ThirdChain:
	LDA Objects_SpritesVerticallyOffScreen, X
	AND #SPRITE_3_VINVISIBLE
	BNE ParaChomp_ChainTiles

	LDA Objects_SpriteY, X
	ADD #56
	STA Sprite_RAMY + 16, Y

ParaChomp_ChainTiles:
	LDA #$55
	STA Sprite_RAMTile + 8, Y
	STA Sprite_RAMTile + 12, Y
	STA Sprite_RAMTile + 16, Y

	LDA #SPR_PAL2
	STA Sprite_RAMAttr + 8, Y
	STA Sprite_RAMAttr + 12, Y
	STA Sprite_RAMAttr + 16, Y

ParaChomp_DrawWings:
	LDA Objects_SpritesHorizontallyOffScreen, X
	AND #SPRITE_0_HINVISIBLE
	BNE ParaChomp_RightWing

	LDA Sprite_RAMY, Y
	SUB #$08
	STA Sprite_RAMY + 20, Y

	LDA Sprite_RAMX,Y
	SUB #$04
	STA Sprite_RAMX + 20,Y

ParaChomp_RightWing:
	LDA Objects_SpritesHorizontallyOffScreen, X
	AND #SPRITE_2_HINVISIBLE
	BNE ParaChomp_DrawWingsAttr

	LDA Sprite_RAMY + 4, Y
	SUB #$08
	STA Sprite_RAMY + 24, Y

	LDA Sprite_RAMX + 4,Y
	ADD #$05
	STA Sprite_RAMX + 24,Y

ParaChomp_DrawWingsAttr:
	LDA Objects_SpriteAttributes, X
	ORA Objects_Orientation, X
	AND #(SPR_BEHINDBG | SPR_VFLIP)
	ORA #SPR_PAL2
	STA Sprite_RAMAttr + 24,Y

	ORA #SPR_HFLIP
	STA Sprite_RAMAttr + 20,Y

	LDA Objects_Frame,X

	LDX #$CD
	AND #$01
	BNE ParaChomp_DrawWings3	

	LDX #$CF

ParaChomp_DrawWings3:
	TXA		 
	STA Sprite_RAMTile + 20, Y
	STA Sprite_RAMTile + 24, Y

ParaChomp_DrawWingsRTS:
	LDX <CurrentObjectIndexZ
	RTS

ParaChomp_Interact:
	LDA ParaChomp_HitDetection, X
	EOR #$01
	STA ParaChomp_HitDetection, X

	JSR ParaChomp_CalcBoundBox
	JSR Object_DeleteOffScreen
	JSR Object_DetectPlayer
	BCC ParaChomp_NoInteract

	JMP ParaChomp_PlayerInteract
	
ParaChomp_NoInteract:
	LDA ParaChomp_HitDetection, X
	BEQ ParaChomp_NoInteractRTS

	LDA ParaChomp_Grabbed, X
	BEQ ParaChomp_NoInteractRTS

	JSR ParaChomp_Reset
	
	LDA #$00
	STA Player_IsClimbingObject
	STA ParaChomp_Grabbed, X

ParaChomp_NoInteractRTS:	
	RTS

ParaChomp_CalcBoundBox:
	LDA ParaChomp_HitDetection, X

	JSR DynJump

	.word Object_CalcBoundBoxForced
	.word ParaChomp_ChainBoundBox

ParaChomp_PlayerInteract:
	LDA ParaChomp_HitDetection, X
	
	JSR DynJump

	.word Player_GetHurt
	.word ParaChomp_ChainGrab

ParaChomp_DetectTiles:
	LDA ParaChomp_HitDetection, X
	
	JSR DynJump

	.word ParaChomp_TileInteract
	.word ParaChomp_NoInteractRTS

ParaChomp_ChainBoundBox:
	LDA <Objects_XZ,X
	ADD #$08
	STA Objects_BoundLeft, X
	STA Objects_BoundRight, X

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Objects_BoundLeftHi, X
	STA Objects_BoundRightHi, X

	LDA <Objects_YZ,X
	ADD #$10
	STA Objects_BoundTop, X

	LDA <Objects_YHiZ, X
	ADC #$00
	STA Objects_BoundTopHi, X

	LDA <Objects_YZ,X
	ADD #$40
	STA Objects_BoundBottom, X

	LDA <Objects_YHiZ, X
	ADC #$00
	STA Objects_BoundBottomHi, X
	RTS		 ; Return

ParaChomp_ChainGrab:
	LDY #$00
	LDA <Pad_Holding
	AND #(PAD_DOWN | PAD_UP)
	BEQ ParaChomp_ChainGrabRTS

	STA Player_IsClimbingObject
	STA ParaChomp_Grabbed, X

ParaChomp_ChainGrabRTS:	
	RTS	

ParaChomp_TileInteract:
	JSR Object_DetectTileTopEdge
	CMP #(TILE_PROP_SOLID_ALL)
	BCC ParaChomp_TileInteractRTS

	PHA
	JSR Object_HitCeiling

	LDA #$01
	STA ParaChomp_HitCeiling, X

	LDA #$00
	STA Player_CarryYVel

	PLA
	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_HARMFUL)
	BNE ParaChomp_TileInteractRTS

	JSR Object_GetKilled
	
	LDA Sound_QPlayer
	ORA #SND_PLAYERKICK
	STA Sound_QPlayer

	LDA #$00
	STA Player_IsClimbingObject

ParaChomp_TileInteractRTS:
	RTS