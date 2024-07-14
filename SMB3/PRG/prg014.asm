    .org ObjectGroup_InitJumpTable
;****************************** OBJECT INITIALIZATION ******************************
    
OBJ_LAKITU    		= $64
OBJ_LAKITUHELPER	= $65
OBJ_SPINY    		= $66
OBJ_SPINYEGG   		= $67
OBJ_BUZZYBEETLE 	= $68
OBJ_BULLETBILL 		= $69
OBJ_MISSILEMARK		= $6A
OBJ_HARDICE    		= $6B
OBJ_FIRESNAKE  		= $6C
OBJ_FREEZIE    		= $6D
OBJ_SWOOSH    		= $6E
OBJ_RUSTER    		= $6F
OBJ_FIREBLAST		= $70
OBJ_ICEBLAST		= $71
OBJ_LAKITUWINDOW	= $72
OBJ_STINGBEE		= $73
OBJ_FUZZY			= $74
OBJ_ICEWALL			= $75
OBJ_METEOR			= $76
OBJ_SUNBEAM			= $77

    .word ObjInit_Lakitu ; Object $64
    .word ObjInit_Larry ; Object $65
    .word ObjInit_Spiny ; Object $66
    .word ObjInit_SpinyEgg ; Object $67
    .word ObjInit_BuzzyBeetle ; Object $68
    .word ObjInit_BulletBill ; Object $69
    .word ObjInit_MissileMark ; Object $6A
    .word ObjInit_HardIce ; Object $6B
    .word ObjInit_FireSnake ; Object $6C
    .word ObjInit_Freezie ; Object $6D
    .word ObjInit_Swoosh ; Object $6E
    .word ObjInit_Ruster ; Object $6F
    .word ObjInit_FireBlast ; Object $70
    .word ObjInit_FrostBlast ; Object $71
    .word ObjInit_LakituWindow ; Object $72
    .word ObjInit_StingBee ; Object $73
    .word ObjInit_Fuzzy ; Object $74
    .word ObjInit_IceWall ; Object $75
    .word ObjInit_Meteor ; Object $76
    .word ObjInit_SunBeam ; Object $77

	.org ObjectGroup_NormalJumpTable	; <-- help enforce this table *here*
;****************************** OBJECT GAME LOOP ******************************
    .word ObjNorm_Lakitu ; Object $64
    .word ObjNorm_Larry ; Object $65
    .word ObjNorm_Spiny ; Object $66
    .word ObjNorm_SpinyEgg ; Object $67
    .word ObjNorm_BuzzyBeetle ; Object $68
    .word ObjNorm_BulletBill ; Object $69
    .word ObjNorm_MissileMark ; Object $6A
    .word ObjNorm_HardIce ; Object $6B
    .word ObjNorm_FireSnake ; Object $6C
    .word ObjNorm_Freezie ; Object $6D
    .word ObjNorm_Swoosh ; Object $6E
    .word ObjNorm_Ruster ; Object $6F
    .word ObjNorm_FireBlast ; Object $70
    .word ObjNorm_FrostBlast ; Object $71
    .word ObjNorm_LakituWindow ; Object $72
    .word ObjNorm_StingBee ; Object $73
    .word ObjNorm_Fuzzy ; Object $74
    .word ObjNorm_IceWall ; Object $75
    .word ObjNorm_Meteor ; Object $76
    .word ObjNorm_SunBeam ; Object $77

	.org ObjectGroup_CollideJumpTable	; <-- help enforce this table *here*
;****************************** OBJECT PLAYER INTERACTION ******************************
    .word Player_GetHurt ; Object $64
    .word Larry_InteractWithPlayer ; Object $65
    .word Object_Hold ; Object $66
    .word Player_GetHurt ; Object $67
    .word Object_Hold ; Object $68
    .word Player_GetHurt ; Object $69
    .word Object_Explode ; Object $6A
    .word ObjHit_HardIce ; Object $6B
    .word Player_GetHurt ; Object $6C
    .word ObjHit_Freezie ; Object $6D
    .word Player_GetHurt ; Object $6E
    .word Player_GetHurt ; Object $6F
    .word Player_GetHurt ; Object $70
    .word Player_Freeze ; Object $71
    .word Player_GetHurt ; Object $72
    .word Player_GetHurt ; Object $73
    .word ObjHit_DoNothing ; Object $74
    .word ObjHit_SolidBlock ; Object $75
    .word Player_GetHurt ; Object $76
    .word Player_GetHurt ; Object $77

	.org ObjectGroup_Attributes	; <-- help enforce this table *here*
;****************************** OBJECT PALETTE/SIZE ******************************
    .byte OA1_PAL3 | OA1_HEIGHT32 | OA1_WIDTH16 ; Object $64
    .byte OA1_PAL3 | OA1_HEIGHT32 | OA1_WIDTH16 ; Object $65
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $66
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $67
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $68
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $69
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $6A
    .byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $6B
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $6C
    .byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $6D
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $6E
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $6F
    .byte OA1_PAL0 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $70
    .byte OA1_PAL0 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $71
    .byte OA1_PAL3 | OA1_HEIGHT32 | OA1_WIDTH16 ; Object $72
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $73
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $74
    .byte OA1_PAL2 | OA1_HEIGHT48 | OA1_WIDTH16 ; Object $75
    .byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $76
    .byte OA1_PAL0 | OA1_HEIGHT32 | OA1_WIDTH32 ; Object $77

	.org ObjectGroup_PatTableSel	; <-- help enforce this table *here*
;****************************** OBJECT PATTERN TABLE ******************************
    .byte OPTS_NOCHANGE ; Object $64
    .byte OPTS_NOCHANGE ; Object $65
    .byte OPTS_SETPT5 | $0B ; Object $66
    .byte OPTS_SETPT5 | $0B ; Object $67
    .byte OPTS_SETPT5 | $0B ; Object $68
    .byte OPTS_SETPT6 | $4F ; Object $69
    .byte OPTS_SETPT6 | $4F ; Object $6A
    .byte OPTS_SETPT5 | $0F ; Object $6B
    .byte OPTS_SETPT5 | $0A ; Object $6C
    .byte OPTS_SETPT5 | $33 ; Object $6D
    .byte OPTS_SETPT5 | $33 ; Object $6E
    .byte OPTS_SETPT5 | $33 ; Object $6F
    .byte OPTS_NOCHANGE ; Object $70
    .byte OPTS_NOCHANGE ; Object $71
    .byte OPTS_SETPT5 | $0B ; Object $72
    .byte OPTS_SETPT5 | $33 ; Object $73
    .byte OPTS_SETPT5 | $33 ; Object $74
    .byte OPTS_SETPT6 | $12 ; Object $75
    .byte OPTS_SETPT5 | $37 ; Object $76
    .byte OPTS_SETPT5 | $37 ; Object $77

	.org ObjectGroup_KillAction	; <-- help enforce this table *here*
;****************************** OBJECT DEATH ROUTINE ******************************
	.byte KILLACT_NORMALSTATE ; Object $64
    .byte KILLACT_STARDEATH ; Object $65
    .byte KILLACT_STARDEATH ; Object $66
    .byte KILLACT_STARDEATH ; Object $67
    .byte KILLACT_STARDEATH ; Object $68
    .byte KILLACT_STARDEATH ; Object $69
    .byte KILLACT_STARDEATH ; Object $6A
    .byte KILLACT_NORMALSTATE ; Object $6B
    .byte KILLACT_NORMALSTATE ; Object $6C
    .byte KILLACT_NORMALSTATE ; Object $6D
    .byte KILLACT_STARDEATH ; Object $6E
    .byte KILLACT_NORMALSTATE ; Object $6F
    .byte KILLACT_STARDEATH ; Object $70
    .byte KILLACT_STARDEATH ; Object $71
    .byte KILLACT_STARDEATH ; Object $72
    .byte KILLACT_STARDEATH ; Object $73
    .byte KILLACT_STARDEATH ; Object $74
    .byte KILLACT_STARDEATH ; Object $75
    .byte KILLACT_STARDEATH ; Object $76
    .byte KILLACT_STARDEATH ; Object $77

OG6_POff .func (\1 - ObjectGroup06_PatternSets)

	.org ObjectGroup_PatternStarts	; <-- help enforce this table *here*

	; Index by object group relative index (ObjGroupRel_Idx)
	.byte OG6_POff(ObjP64), OG6_POff(ObjP65), OG6_POff(ObjP66), OG6_POff(ObjP67)
    .byte OG6_POff(ObjP68), OG6_POff(ObjP69), OG6_POff(ObjP6A), OG6_POff(ObjP6B)
    .byte OG6_POff(ObjP6C), OG6_POff(ObjP6D), OG6_POff(ObjP6E), OG6_POff(ObjP6F)
    .byte OG6_POff(ObjP70), OG6_POff(ObjP71), OG6_POff(ObjP72), OG6_POff(ObjP73)
    .byte OG6_POff(ObjP74), OG6_POff(ObjP75), OG6_POff(ObjP76), OG6_POff(ObjP77)

ObjectGroup06_PatternSets:

ObjP64:
    .byte $9F, $41, $BD, $BD
	.byte $9F, $41, $9D, $9D

ObjP65:
    .byte $A9, $A9
	.byte $AB, $AB
	.byte $BD, $BD, $9F, $41 
	.byte $9D, $9D, $9F, $41

ObjP66:
    .byte $81, $83, $85, $87, $89, $89, $89, $89, $89, $89, $8F, $8F, $8B, $8D

ObjP67:
    .byte $99, $99

ObjP68:
    .byte $95, $97, $91, $93, $9B, $9B, $9B, $9B, $A1, $A1, $9B, $9B, $A3, $A5

ObjP69:
ObjP6A:
    .byte $DD, $DF
	.byte $00, $00
	.byte $DD, $DF
	.byte $BD, $BF
	.byte $B9, $BB
	.byte $B5, $B7

ObjP6B:
    .byte $99, $9B

ObjP6C:
    .byte $81, $83, $85, $87, $85, $87

ObjP6D:
    .byte $AD, $AF, $B1, $AF, $B5, $B7, $AD, $B3

ObjP6E:
	.byte $81, $83
	.byte $85, $87
	.byte $89, $8B
	.byte $8D, $8F
	.byte $A1, $A3
	.byte $A5, $A7
	.byte $A9, $AB

ObjP6F:
    .byte $91, $93
	.byte $95, $97
	.byte $91, $93
	.byte $95, $97

ObjP70:
ObjP71:
ObjP72:
    .byte $6B, $6B, $BD, $BD
	.byte $6B, $6B, $9D, $9D

ObjP73:
	.byte $B9, $BB, $B9, $BF

ObjP74:
	.byte $99, $9B
	.byte $9B, $99
	.byte $BD, $BF
	.byte $BF, $BD

ObjP75:
	.byte $E5, $E5, $E5, $E5, $E5, $E5

ObjP76:
	.byte $95, $97

ObjP77:
	.byte $89, $8B, $8B, $89
	.byte $89, $8B, $8B, $89

Lakitu_GraphicsTables:
	.byte $0B, $0B, $0B, $1A

ObjInit_Lakitu:

	LDA #$08
	STA Objects_SpritesRequested, X
	
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	STX <Temp_Var1

	LDY #$04

Lakitu_CheckSame:
	CPY <Temp_Var1
	BEQ Lakitu_CheckNextSlot

	LDA Objects_ID, Y
	CMP #OBJ_LAKITU
	BNE Lakitu_CheckNextSlot

	JMP Object_Delete

Lakitu_CheckNextSlot:
	DEY
	BPL Lakitu_CheckSame
	
	LDY Objects_Property, X
	LDA Lakitu_GraphicsTables, Y
	STA PatTable_BankSel + 4

	LDA #$20
	STA ChaseVel_LimitHi, X

	LDA #$E0
	STA ChaseVel_LimitLo, X

	LDA #(ATTR_NOICE)
	STA Objects_BehaviorAttr, X

	JSR Object_CalcBoundBox

	LDA #$FF
	STA Lakitu_EnemySlot, X 
	RTS		 ; Return


Lakitu_Frame = Objects_Data1
Lakitu_Action = Objects_Data2
Lakitu_BodyOffset = Objects_Data3
Lakitu_EnemySlot = Objects_Data4
Lakitu_EnemyOffset = Objects_Data5
Lakitu_MadePoof = Objects_Data6
Lakitu_SleepTime = Objects_Data7

ObjNorm_Lakitu:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE Lakitu_Alive

	JMP Lakitu_Die

Lakitu_Alive:
	LDA Objects_SlowTimer, X
	BEQ Lakitu_Do

	LDA <Player_X
	STA <Objects_XZ, X

	LDA <Player_XHi
	STA <Objects_XHiZ, X
	
	LDA <Vert_Scroll
	SUB #$10
	STA <Objects_YZ, X

	LDA #$FF
	STA <Objects_YHiZ, X

	JSR Object_CalcBoundBox
	RTS

Lakitu_Do:
	LDA <Player_HaltGameZ
	BEQ Lakitu_Norm

	JMP Lakitu_Draw

Lakitu_Norm:
	LDA Game_Counter
	AND #$03
	BNE Lakitu_Chase

	LDA #$00
	STA <Objects_YVelZ, X

	JSR Object_Move
	JMP Lakitu_CalcBoundBox

Lakitu_Chase:
	JSR Object_ChasePlayer

Lakitu_CalcBoundBox:
	LDA <Vert_Scroll
	ADD #$14
	STA <Temp_Var1

	LDA #$00
	ADC #$00
	STA <Temp_Var2

	LDA <Temp_Var1
	SUB <Objects_YZ, X
	STA <Temp_Var3

	LDA <Temp_Var2
	SBC <Objects_YHiZ, X
	STA <Temp_Var4
	
	LDA <Temp_Var3
	ORA <Temp_Var4
	BEQ Lakitu_InPlace

	LDA <Temp_Var4
	BMI Lakitu_Down

	LDA <Objects_YZ, X
	ADD #$01
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	ADC #$00
	STA <Objects_YHiZ, X

	JMP Lakitu_InPlace

Lakitu_Down:
	LDA <Objects_YZ, X
	SUB #$01
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	SBC #$00
	STA <Objects_YHiZ, X

Lakitu_InPlace:
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_AttackOrDefeat
	JSR Lakitu_DoAction
	JMP Lakitu_Draw

Lakitu_DoAction:
	LDA Lakitu_Action, X
	JSR DynJump

	.word Lakitu_Wait
	.word Lakitu_Lower
	.word Lakitu_GetEnemy
	.word Lakitu_RaiseEnemy
	.word Lakitu_Raise
	.word Lakitu_Aim

Lakitu_Die:
	LDA <Player_HaltGameZ
	BNE Lakitu_DieDone

	LDA Lakitu_MadePoof, X
	BNE Lakitu_NoPoof

	LDA <Objects_XZ, X
	STA Poof_X

	LDA <Objects_YZ, X 
	ADD #$10
	STA Poof_Y

	LDA <Objects_YHiZ, X
	ADC #$00
	STA Poof_YHi
	JSR Common_MakePoof

	INC Lakitu_MadePoof, X

	LDA Lakitu_EnemySlot, X
	BMI Lakitu_NoPoof

	TAY
	LDA #$00
	STA Objects_State, Y

Lakitu_NoPoof:
	LDA #$20
	STA <Objects_YVelZ, X

	LDA #$00
	STA <Objects_XVelZ, X

	JSR Object_Move

	LDA <Objects_YHiZ, X
	BEQ Lakitu_DieDone

	LDA <Objects_YZ, X
	CMP #$B0
	BCC Lakitu_DieDone

	LDA #$FF
	STA Objects_Timer2, X
	STA Objects_SlowTimer, X

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	JSR Lakitu_Reset

	LDA #$00
	STA Objects_Frame, X

	LDA Objects_Orientation, X
	AND #~SPR_VFLIP
	STA Objects_Orientation, X

	RTS

Lakitu_DieDone:
	LDA #$01
	STA Objects_Frame, X

	LDA #SPR_VFLIP
	ORA Objects_Orientation, X
	STA Objects_Orientation, X

	JMP Object_DrawMirrored

Lakitu_Wait:
	LDA Objects_Timer, X
	BNE Lakitu_WaitDone

	INC Lakitu_Action, X

Lakitu_WaitDone:
	RTS

Lakitu_Lower:
	INC Lakitu_BodyOffset, X
	LDY Lakitu_BodyOffset, X
	CPY #$10
	BCC Lakitu_LowerDone

	INC Lakitu_Action, X

Lakitu_LowerDone:
	RTS

Lakitu_GetEnemy:
	; JSR Lakitu_CheckObjCount

	; LDA <Lakitu_ObjectCount
	; CMP #$04
	; BCS Lakitu_GetEnemyDone

	LDA Objects_Property, X
	TAY
	LDA Lakitu_EnemyToss, Y
	STA <Temp_Var1

	LDA Lakitu_EnemyProperty, Y
	STA <Temp_Var2

	JSR Object_FindEmptyY
	BCC Lakitu_GetEnemyDone


	TYA
	STA Lakitu_EnemySlot, X

	LDA #OBJSTATE_NONE
	STA Objects_State, Y

	LDA #$01
	STA Objects_ExpPoints, Y

	LDA <Temp_Var1
	STA Objects_ID, Y	

	LDA <Temp_Var2
	STA Objects_Property, Y

	INC Lakitu_Action, X

Lakitu_GetEnemyDone:
	RTS

Lakitu_RaiseEnemy:
	INC Lakitu_EnemyOffset, X
	LDA Lakitu_EnemyOffset, X
	CMP #$0C
	BCC Lakitu_RaiseEnemyDone

	INC Lakitu_Action, X
	LDA #$01
	STA Objects_Frame, X

Lakitu_RaiseEnemyDone:
	RTS

Lakitu_Raise:
	DEC Lakitu_BodyOffset, X
	BNE Lakitu_RaiseDone

	INC Lakitu_Action, X

	LDA RandomN, X
	AND #$03
	TAY
	LDA Lakitu_AimTimers, Y
	STA Objects_Timer, X

Lakitu_RaiseDone:
	RTS

Lakitu_ObjectCount = Temp_Var1

Lakitu_CheckObjCount:
	LDY Objects_Property, X

	LDY #$04

	LDA #$00
	STA <Lakitu_ObjectCount

Lakitu_CheckNextObj:
	LDA Objects_State, Y
	BEQ Lakitu_NextObj

	INC <Lakitu_ObjectCount

Lakitu_NextObj:
	DEY
	BPL Lakitu_CheckNextObj
	RTS

Lakitu_AimTimers:
	.byte $30, $40, $50, $60

Lakitu_WaitTimers:
	.byte $40, $28, $30, $18

Lakitu_Aim: 
	JSR Object_XDistanceFromPlayer
	CMP #$04
	BCC Lakitu_AimAnyway

	LDA Objects_Timer, X
	BEQ Lakitu_AimAnyway

	RTS

Lakitu_AimAnyway:	
	LDA <Objects_XZ, X
	AND #$0F
	BNE Lakitu_AimDone

	LDA <Objects_XZ, X
	ADD #$08
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	STA Tile_DetectionXHi

	LDA <Objects_YZ, X
	SUB #$08
	STA Tile_DetectionY

	LDA <Objects_YHiZ, X
	SBC #$00
	STA Tile_DetectionYHi

	JSR Object_DetectTile

	LDA Tile_LastProp
	CMP #TILE_PROP_SOLID_ALL
	BCS Lakitu_AimDone

	LDY Lakitu_EnemySlot, X
	LDA #OBJSTATE_FRESH
	STA Objects_State, Y

	LDA <Objects_XZ, X
	STA Objects_XZ, Y

	LDA <Objects_XHiZ, X
	STA Objects_XHiZ, Y

	LDA <Objects_YZ, X
	SUB #$10
	STA Objects_YZ, Y

	LDA <Objects_YHiZ, X
	SBC #$00
	STA Objects_YHiZ, Y

	LDA #$F0
	STA Objects_YVelZ, Y

	LDA <Objects_XVelZ, X
	STA Objects_XVelZ, Y

Lakitu_Reset:

	LDA RandomN, X
	AND #$03
	TAY
	LDA Lakitu_WaitTimers, Y
	STA Objects_Timer, X

	LDA #$00
	STA Lakitu_EnemyOffset, X
	STA Lakitu_BodyOffset, X
	STA Lakitu_MadePoof, X
	STA Lakitu_Action, X
	STA Objects_Frame, X

	LDA #$FF
	STA Lakitu_EnemySlot, X
	
Lakitu_AimDone:
	RTS

Lakitu_Draw:
	LDA Object_SpriteRAMOffset, X
	ADD #$04
	STA Object_SpriteRAMOffset, X

	LDA <Objects_SpriteY, X
	ADD #$10
	STA <Objects_SpriteY, X

	JSR Object_Draw16x32Mirrored

	LDA Sprite_RAMY, Y
	STA <Temp_Var1

	LDA Sprite_RAMY + 8, Y
	STA Sprite_RAMY, Y

	LDA <Temp_Var1
	ADD Lakitu_BodyOffset, X
	BCS Lakitu_Draw_A
	STA Sprite_RAMY + 8, Y

Lakitu_Draw_A:
	LDA Sprite_RAMY + 4, Y
	STA <Temp_Var1

	LDA Sprite_RAMY + 12, Y
	STA Sprite_RAMY + 4, Y

	LDA <Temp_Var1
	ADD Lakitu_BodyOffset, X
	BCS Lakitu_Draw0
	STA Sprite_RAMY + 12, Y

Lakitu_Draw0:
	LDA Sprite_RAMX, Y
	ADD #$04
	BCS Lakitu_Draw1
	STA Sprite_RAMX, Y

Lakitu_Draw1:
	LDA Sprite_RAMX + 4, Y
	ADD #$04
	BCS Lakitu_Draw2

	STA Sprite_RAMX + 4, Y

Lakitu_Draw2:
	LDA Sprite_RAMAttr, Y
	AND #~SPR_PAL3
	ORA #SPR_PAL1
	STA Sprite_RAMAttr, Y

	LDA Sprite_RAMAttr + 4, Y
	AND #~SPR_PAL3
	ORA #SPR_PAL1
	STA Sprite_RAMAttr+ 4, Y

	TYA
	SUB #$04
	TAY

	LDA #$41
	STA Sprite_RAMTile, Y

	LDA Objects_SpriteX, X
	SUB #$04
	BCC Lakitu_Draw3
	STA Sprite_RAMX, Y
	
	LDA Objects_SpritesHorizontallyOffScreen, X
	AND #SPRITE_0_HINVISIBLE
	BNE Lakitu_Draw3

	LDA Sprite_RAMY + 4, Y
	STA Sprite_RAMY, Y


	LDA Sprite_RAMAttr + 4, Y
	STA Sprite_RAMAttr, Y

Lakitu_Draw3:
	LDA Lakitu_EnemySlot, X
	BMI Lakitu_DrawDone

	JSR Lakitu_DrawEnemy

Lakitu_DrawDone:
	LDA Object_SpriteRAMOffset, X
	SUB #$04
	STA Object_SpriteRAMOffset, X

	RTS

Lakitu_EnemyToss:
	.byte OBJ_SPINYEGG, OBJ_FREEZIE, OBJ_HARDICE, OBJ_LIGHTNINGBOLT

Lakitu_EnemyFrameLeft:
	.byte $99, $B1, $99, $99

Lakitu_EnemyFrameLeftAttr:
	.byte SPR_PAL1, SPR_PAL2, SPR_PAL2, SPR_PAL3

Lakitu_EnemyFrameRight:
	.byte $99, $B3, $9B, $9B

Lakitu_EnemyProperty:
	.byte $00, $00, $00, $00

Lakitu_EnemyFrameRightAttr:
	.byte SPR_PAL1 | SPR_HFLIP | SPR_VFLIP, SPR_PAL2, SPR_PAL2, SPR_PAL3

Lakitu_DrawEnemy:

	LDA Lakitu_EnemyOffset, X
	STA <Temp_Var1

	LDA Objects_Property, X
	TAX

	LDA Sprite_RAMY + 12, Y
	CMP #$F8
	BEQ Lakitu_Enemy1

	SUB <Temp_Var1
	STA Sprite_RAMY + 20, Y

Lakitu_Enemy1:
	STA <Temp_Var3

	LDA Lakitu_EnemyFrameLeft, X
	STA Sprite_RAMTile + 20, Y

	LDA Lakitu_EnemyFrameLeftAttr, X
	STA Sprite_RAMAttr + 20, Y

	LDA Sprite_RAMX + 12, Y
	STA Sprite_RAMX + 20, Y
	ADD #$08
	STA <Temp_Var2

	LDA <Temp_Var3
	CMP #$F8
	BEQ Lakitu_DrawEnemyDone
	STA Sprite_RAMY + 24, Y

	LDA Lakitu_EnemyFrameRight, X
	STA Sprite_RAMTile + 24, Y

	LDA Lakitu_EnemyFrameRightAttr, X
	STA Sprite_RAMAttr + 24, Y

	LDA <Temp_Var2
	STA Sprite_RAMX + 24, Y

Lakitu_DrawEnemyDone:
	RTS    

ObjInit_Larry:
	LDY #$04
	LDA #OBJ_LAKITUHELPER

Larry_CheckExists:
	CPY CurrentObjectIndexZ
	BEQ Larry_NotFound

	CMP Objects_ID, Y
	BNE Larry_NotFound

	JMP Object_Delete

Larry_NotFound:
	DEY
	BPL Larry_CheckExists

	LDA #$07
	STA Objects_SpritesRequested, X

	LDA #BOUND16x32
	STA Objects_BoundBox, X

	JSR Object_NoInteractions

	LDA #$20
	STA ChaseVel_LimitHi, X

	LDA #$E0
	STA ChaseVel_LimitLo, X

	JSR Object_CalcBoundBox

	LDA #$FF
	STA Larry_ItemSlot, X 

	LDA #$01
	STA Objects_Global, X

	LDA #$0B
	STA PatTable_BankSel + 4
	RTS		 ; Return

Larry_Frame = Objects_Data1
Larry_Action = Objects_Data2
Larry_BodyOffset = Objects_Data3
Larry_ItemSlot = Objects_Data4
Larry_ItemOffset = Objects_Data5

ObjNorm_Larry:
	LDA <Player_HaltGameZ
	BEQ Larry_DoAction

	JMP Larry_Draw

Larry_DoAction:
	LDA Larry_Action, X
	JSR DynJump

	.word Larry_InBag
	.word Larry_WaitOffScreen
	.word Larry_FindPlayer
	.word Larry_ThrowItem
	.word Larry_FleePlayer

Larry_ItemToss:
	.byte POWERUP_FIREFLOWER, POWERUP_NINJASHROOM, POWERUP_SHELL, POWERUP_FROGSUIT, POWERUP_PWING, POWERUP_FOXLEAF

Larry_SuitHelp:
	.byte $02, $0B, $05, $04, $03, MARIO_FOX

Larry_InBag:
	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer
	BCS Larry_Freed

	INC Larry_Frame, X

	LDA Larry_Frame, X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame, X

Larry_Freed:
	JMP Larry_Draw

Larry_RemoveBag:
	LDA <Objects_XZ, X
	STA <Poof_X

	LDA <Objects_YZ, X
	STA <Poof_Y

	LDA <Objects_YHiZ, X
	STA <Poof_YHi
	
	JSR Common_MakePoof

	LDA #SPR_PAL1
	STA Objects_SpriteAttributes, X

	LDA <Objects_YZ, X
	SUB #$10
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	SBC #$00
	STA <Objects_YHiZ, X

	LDA #$00
	STA Objects_SlowTimer, X

	
	LDA #$02
	STA Larry_Action, X

	JSR Larry_Prepare
	RTS

Larry_WaitOffScreen:
	LDY Objects_Property, X

	LDA Player_EffectiveSuit
	CMP Larry_SuitHelp, Y
	BNE Larry_Prepare

	LDA <Player_X
	STA <Objects_XZ, X

	LDA <Player_XHi
	STA <Objects_XHiZ, X

	LDA <Vert_Scroll
	SUB #$20
	STA <Objects_YZ, X

	LDA <Vert_Scroll_Hi
	SBC #$00
	STA <Objects_YHiZ, X

	RTS

Larry_Prepare:
	LDA Objects_Property, X
	TAY

	LDA Larry_ItemToss, Y
	STA <Temp_Var1

	LDA Larry_ItemFrameLeftAttr, Y
	STA <Temp_Var2

	JSR Check_ExistingPowerUps
	BCS Larry_WaitOffScreenRTS

	LDY #$05

Larry_FindSlot:
	
	LDA Objects_State,Y
	BEQ Larry_ItemSlotFound

	INY
	CPY #$08
	BNE Larry_FindSlot
	RTS

Larry_ItemSlotFound:
	TYA
	STA Larry_ItemSlot, X

	LDA #OBJ_POWERUP
	STA Objects_ID, Y	

	LDA <Temp_Var1
	STA PowerUp_Type, Y

	LDA <Temp_Var2
	STA Objects_SpriteAttributes, Y 

	LDA #OBJSTATE_NONE
	STA Objects_State, Y

	LDA #$02
	STA Objects_SpritesRequested, Y

	LDA #$02
	STA Larry_Action, X

	LDA #$02
	STA Objects_Frame, X
	JMP Larry_Draw

Larry_WaitOffScreenRTS:
	RTS

Larry_FindPlayer:
	JSR Object_ChasePlayer
	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer
	
	JMP Larry_Draw

Larry_InteractWithPlayer:
	LDA Larry_Action, X
	BNE Larry_ThrowItem

	JMP Larry_RemoveBag

Larry_ThrowItem:
	LDA <Objects_XZ, X
	ADD #$08
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	STA Tile_DetectionXHi

	LDA <Objects_YZ, X
	SUB #$08
	STA Tile_DetectionY

	LDA <Objects_YHiZ, X
	SBC #$00
	STA Tile_DetectionYHi

	JSR Object_DetectTile

	LDA Tile_LastProp
	CMP #TILE_PROP_SOLID_ALL
	BCS Larry_ThrowItemDone

	LDY Larry_ItemSlot, X
	LDA #OBJSTATE_NORMAL
	STA Objects_State, Y

	LDA <Objects_XZ, X
	STA Objects_XZ, Y

	LDA <Objects_XHiZ, X
	STA Objects_XHiZ, Y

	LDA <Objects_YZ, X
	SUB #$10
	STA Objects_YZ, Y

	LDA <Objects_YHiZ, X
	SBC #$00
	STA Objects_YHiZ, Y

	LDA #$00
	STA Objects_YVelZ, Y

	LDA <Objects_XVelZ, X
	BMI Larry_ItemLeftVel

	LDA #$08
	STA Objects_XVelZ, Y
	BPL Larry_Item_Frame

Larry_ItemLeftVel:
	LDA #$F8
	STA Objects_XVelZ, Y

Larry_Item_Frame:
	LDA #$00
	STA Objects_Frame, Y

	INC Larry_Action, X

	LDA #$FF
	STA Larry_ItemSlot, X

	LDA #$01
	STA Objects_Frame, X

Larry_ThrowItemDone:
	JMP Larry_Draw

Larry_FleePlayer:
	JSR Object_FleePlayer
	JSR Object_CalcBoundBox
	JSR Object_XDistanceFromPlayer
	
	LDA <XDiff
	CMP #$C0
	BCC Larry_FleeDraw

	LDA #$01
	STA Larry_Action, X

Larry_FleeDraw:
	JMP Larry_Draw

Larry_Draw:
	LDA Larry_Action, X
	BNE Larry_DrawFull

	JMP Object_DrawMirrored

Larry_DrawFull:
	LDA Objects_Frame, X

	JSR Object_Draw16x32Mirrored

	LDY Object_SpriteRAMOffset, X

	LDA Sprite_RAMX + 8, Y
	ADD #$04
	STA Sprite_RAMX + 8, Y

	LDA Sprite_RAMX + 12, Y
	ADD #$04
	STA Sprite_RAMX + 12, Y
	
	LDA Sprite_RAMX, Y
	SUB #$04
	STA Sprite_RAMX + 16, Y
	
	LDA Sprite_RAMAttr, Y
	STA Sprite_RAMAttr + 16, Y

	LDA #$41
	STA Sprite_RAMTile + 16, Y

	LDA Sprite_RAMY + 8, Y
	STA Sprite_RAMY + 16, Y
	
	LDA Larry_ItemSlot, X
	BMI Larry_DrawDone

	JSR Larry_DrawItem

Larry_DrawDone:
	RTS

Larry_ItemFrameLeftAttr:
	.byte SPR_PAL2, SPR_PAL1, SPR_PAL2, SPR_PAL2, SPR_PAL3, SPR_PAL3

Larry_ItemFrameRightAttr:
	.byte SPR_PAL2, SPR_PAL1, SPR_PAL2, SPR_PAL2, SPR_PAL3, SPR_PAL3

Larry_ItemPattern:
	.byte $04, $20, $10, $0C, $2C, $24

Larry_DrawItem:
	
	LDA #$0E
	STA <Temp_Var1

	LDA Objects_Property, X
	TAX
	
	LDA Larry_ItemPattern,X
	STA SprAnimOffset

	LDA Sprite_RAMY, Y
	CMP #$F8
	BEQ Larry_Item1

	SUB <Temp_Var1
	STA Sprite_RAMY + 20, Y

Larry_Item1:
	STA <Temp_Var3

	LDA #$51
	STA Sprite_RAMTile + 20, Y

	LDA Larry_ItemFrameLeftAttr, X
	STA Sprite_RAMAttr + 20, Y

	LDA Sprite_RAMX, Y
	STA Sprite_RAMX + 20, Y
	ADD #$08
	STA <Temp_Var2

	LDX <CurrentObjectIndexZ
	LDA Objects_Property, X
	TAX

	LDA <Temp_Var3
	CMP #$F8
	BEQ Larry_DrawItemDone

	STA Sprite_RAMY + 24, Y

	LDA #$53
	STA Sprite_RAMTile + 24, Y

	LDA Larry_ItemFrameRightAttr, X
	STA Sprite_RAMAttr + 24, Y

	LDA <Temp_Var2
	STA Sprite_RAMX + 24, Y

Larry_DrawItemDone:
	LDX <CurrentObjectIndexZ
	RTS



Spiny_Frame = Objects_Data1

ObjInit_Spiny:
	LDA #$04
	STA Objects_SpritesRequested, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X
	
	LDA #(ATTR_WINDAFFECTS | ATTR_HASSHELL | ATTR_CARRYANDBUMP)
	STA Objects_BehaviorAttr, X

	JSR Object_CalcBoundBox
	JSR Object_MoveTowardsPlayer

	LDA Objects_Property, X
	CMP #$02
	BNE ObjInit_SpinyRTS

	LDA #SPR_PAL2
	STA Objects_SpriteAttributes, X

ObjInit_SpinyRTS:
	RTS
	
ObjNorm_Spiny:
	LDA <Player_HaltGameZ
	BEQ Spiny_Norm

	JMP Spiny_Draw

Spiny_Norm:
	JSR Object_DeleteOffScreen

	LDA Objects_Property, X
	AND #$01
	BEQ Spiny_NormGravity

	INC Reverse_Gravity
	LDA Objects_Orientation, X
	ORA #SPR_VFLIP
	STA Objects_Orientation, X

Spiny_NormGravity:
	JSR Object_MoveDirectionFacing
	JSR Object_Move
	JSR Object_CalcBoundBox

	LDA Objects_Property, X
	AND #$01
	BEQ Spiny_NoDrop

	JSR Object_YDistanceFromPlayer
	CPY #$01
	BNE Spiny_NoDrop

	JSR Object_XDistanceFromPlayer
	
	LDA <XDiff
	CMP #$30
	BCS Spiny_NoDrop

	LDA #OBJSTATE_KICKED
	STA Objects_State, X

	JSR Object_MoveTowardsPlayer

	LDA <Objects_XVelZ, X
	JSR Double_Value
	STA <Objects_XVelZ, X

	LDA #$00
	STA Objects_Property, X

Spiny_NoDrop:
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles

	LDA Objects_Property, X
	CMP #$02
	BNE Spiny_NoEdgeMarch

	JSR Object_EdgeMarch
	
Spiny_NoEdgeMarch:
	JSR Object_InteractWithObjects
	JSR Object_AttackOrDefeat
	JSR Object_FaceDirectionMoving

	INC Spiny_Frame, X
	LDA Spiny_Frame, X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame, X

Spiny_Draw:
	JMP Object_Draw


SpinyEgg_Frame = Objects_Data1

ObjInit_SpinyEgg:
	LDA #(ATTR_WINDAFFECTS)
	STA Objects_BehaviorAttr, X
	
	LDA #ATTR_STOMPPROOF
	STA Objects_WeaponAttr, X

	LDA #$02
	STA Objects_Health, X


	LDA #BOUND16x16
	STA Objects_BoundBox, X
	RTS

ObjNorm_SpinyEgg:
	LDA <Player_HaltGameZ
	BEQ SpinyEgg_Norm

	JMP SpinyEgg_Draw

SpinyEgg_Norm:
	JSR Object_DeleteOffScreen
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ SpinyEgg_Animate

	LDA Objects_SpritesHorizontallyOffScreen,X
	ORA Objects_SpritesVerticallyOffScreen,X
	BNE SpinEgg_NoBurst

	LDA <Objects_XZ, X
	STA Debris_X

	LDA <Objects_YZ, X
	STA Debris_Y

	JSR Common_MakeDebris
	LDA #$A7
	STA BrickBust_Tile, Y

	LDA #SPR_PAL1
	STA BrickBust_Pal, Y

SpinEgg_NoBurst:
	LDA #OBJ_SPINY
	STA Objects_ID, X

	LDA #(ATTR_HASSHELL | ATTR_WINDAFFECTS | ATTR_CARRYANDBUMP)
	STA Objects_BehaviorAttr, X

	JSR Object_MoveTowardsPlayer

SpinyEgg_Animate:
	INC SpinyEgg_Frame, X

SpinyEgg_Draw:
	JSR Object_DrawMirrored

	LDA SpinyEgg_Frame, X
	LSR A
	LSR A
	LSR A
	AND #$01
	BEQ SpinyEgg_FlipRight

	LDA Sprite_RAMAttr, Y
	ORA #SPR_VFLIP
	STA Sprite_RAMAttr, Y
	RTS		 ; Return

SpinyEgg_FlipRight:
	LDA Sprite_RAMAttr + 4, Y
	ORA #SPR_VFLIP
	STA Sprite_RAMAttr + 4, Y
	RTS        

ObjInit_BuzzyBeetle:
	LDA #$04
	STA Objects_SpritesRequested, X
	
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_FIREPROOF)
	STA Objects_WeaponAttr, X
	
	LDA #(ATTR_WINDAFFECTS | ATTR_HASSHELL | ATTR_CARRYANDBUMP)
	STA Objects_BehaviorAttr, X

	JSR Object_CalcBoundBox
	JSR Object_MoveTowardsPlayer
	RTS
	
ObjNorm_BuzzyBeetle:
	JMP ObjNorm_Spiny
    


BulletBill_Frame:
	.byte $00, $00, $03, $04, $04, $03, $05, $05

BulletBill_Orientation:
	.byte $00, SPR_HFLIP, $00, $00, SPR_HFLIP, SPR_VFLIP, $00, SPR_HFLIP

ObjInit_BulletBill:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_FIREPROOF | ATTR_ICEPROOF)
	STA Objects_WeaponAttr, X

	LDA #(ATTR_STOMPKICKSOUND)
	STA Objects_BehaviorAttr, X

	LDA #$02
	STA Objects_Frame, X

	RTS

ObjNorm_BulletBill:
	LDA <Player_HaltGameZ
	BEQ BulletBill_Norm
	JMP Bullet_Draw	 ; If gameplay is halted, jump to PRG004_B1C2

BulletBill_Norm:
	JSR Object_DeleteOffScreen	; Delete object if it falls off-screen
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat	 	; Player to Bullet Bill collision
	INC Object_DisableWater
	JSR Object_DetectTiles
	JSR Object_CheckForeground
	JSR Object_ApplyXVel	 	
	JSR Object_ApplyYVel_NoGravity

	JMP Bullet_Animate    
    


ObjInit_MissileMark:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_FIREPROOF | ATTR_ICEPROOF)
	STA Objects_WeaponAttr, X

	; LDA Sound_QLevel1
	; ORA #SND_LEVELBABOOM
	; STA Sound_QLevel1
	RTS

Missile_Flash = Objects_Data5
Missile_HomingDisabled = Objects_Data3

ObjNorm_MissileMark:
	LDA <Player_HaltGameZ
	BEQ MissileMark_Norm
	JMP Bullet_Draw	 ; If gameplay is halted, jump to PRG004_B1C2

MissileMark_Norm:
	JSR Object_DeleteOffScreen	; Delete object if it falls off-screen

	LDA Objects_PlayerProjHit, X
	AND #HIT_ICEBALL
	STA Missile_HomingDisabled, X

	LDA Objects_PlayerProjHit, X
	AND #HIT_FIREBALL
	BEQ MissieMark_NotHit

	JSR Object_Explode

MissieMark_NotHit:

	LDA Objects_Timer, X
	BEQ ObjNorm_MissileMarkA
	
	LDA Objects_Timer, X
	
	LDA #$18
	STA ChaseVel_LimitHi, X

	LDA #$E8
	STA ChaseVel_LimitLo, X

	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_DetectTiles
	JSR Object_CheckForeground
	JSR Object_ApplyXVel
	JSR Object_ApplyYVel_NoGravity
	JMP Bullet_Animate
	 
ObjNorm_MissileMarkA:
	LDA Missile_HomingDisabled, X
	BEQ ObjNorm_MissileMarkC

	JSR Object_ApplyXVel
	JSR Object_ApplyYVel_NoGravity
	JMP ObjNorm_MissileMarkA1

ObjNorm_MissileMarkC:
	INC Missile_Flash, X

	LDA Missile_Flash, X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_SpriteAttributes,X

	JSR Object_ChasePlayer

ObjNorm_MissileMarkA1:
	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer
	JSR Object_DetectTiles
	
	LDA <Objects_TilesDetectZ, X
	BEQ Bullet_Animate

	LDA #$01
	STA Explosion_Timer, X

Bullet_Animate:
	LDY #$00
	
	LDA <Objects_YVelZ, X
	BNE Bullet_AnimateVertical

	LDA <Objects_XVelZ, X
	BMI Bullet_FrameOrientation
	
	INY
	BNE Bullet_FrameOrientation

Bullet_AnimateVertical:
	LDA #$4C
	STA PatTable_BankSel + 4

	LDY #$02
	
	LDA <Objects_YVelZ, X
	BMI Bullet_AnimateVerticalAngle
	
	LDY #$05

Bullet_AnimateVerticalAngle:
	LDA <Objects_XVelZ, X
	BEQ Bullet_FrameOrientation

	INY
	LDA <Objects_XVelZ, X
	BMI Bullet_FrameOrientation

	INY

Bullet_FrameOrientation:
	LDA BulletBill_Frame, Y
	STA Objects_Frame, X

	LDA BulletBill_Orientation, Y
	STA Objects_Orientation, X

Bullet_Draw:
	JMP Object_Draw    



;***********************************************************************************
; HARD ICE
;***********************************************************************************
; IMMUNITIES:
;		ALL
;***********************************************************************************
; 	This block will bounce when hitting the ground for a short bit. Once settled, it should
; 	write a solid block to the tile it's occupying and it should delete itself. If Mario hits
;  	the block from underneath, it should shatter.
;***********************************************************************************


ObjInit_HardIce:

	LDA #$20
	STA Objects_Timer, X

	LDA #BOUND16x16BLOCK
	STA Objects_BoundBox, X

	LDA #(ATTR_ICEPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	LDA #$00
	STA <Objects_XVelZ, X
	RTS

HardIce_HitCount = Objects_Data1
HardIce_CanHitTimer = Objects_Data2
HardIce_KillOthers = Objects_Data3
HardIce_PrevXVel = Objects_Data4

ObjNorm_HardIce:
	LDA <Player_HaltGameZ
	BEQ HardIce_NoXVel
	
	JMP Object_Draw

HardIce_NoXVel:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE HardIce_Norm

	JMP Object_BurstIce

HardIce_Norm:
	JSR Object_DeleteOffScreen
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer
	JSR Object_DetectTiles

	LDA <Objects_XVelZ, X
	STA HardIce_PrevXVel, X

	LDA Objects_BeingHeld, X
	BNE HardIce_Interacts
	
	LDA HardIce_KillOthers, X
	BEQ HardIce_NoBlocks
	
	JSR Object_TestTopBumpBlocks
	BCS HardIce_Burst
	
	JSR Object_TestSideBumpBlocks
	BCS HardIce_Burst

HardIce_NoBlocks:	
	JSR Object_DampenVelocity
	JSR Object_InteractWithTilesWallStops

HardIce_Interacts:
	LDA HardIce_KillOthers, X
	BEQ HardIce_NoKills

	JSR Shell_KillOthers
	BCS HardIce_Burst

HardIce_NoKills:
	LDA Objects_BeingHeld, X
	BNE HardIce_Draw

	LDA Object_BodyTileProp, X
	CMP #TILE_PROP_SOLID_ALL
	BCS HardIce_Burst

	LDA HardIce_PrevXVel, X
	ADD #$04
	CMP #$19
	BCC HardIce_NoBurst

	LDA <Objects_TilesDetectZ, X
	AND #(HIT_CEILING | HIT_LEFTWALL | HIT_RIGHTWALL)
	BNE HardIce_Burst

HardIce_NoBurst:
	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ HardIce_Draw

	LDA Object_BodyTileProp, X
	CMP #(TILE_PROP_OBJECTINTERACT)
	BNE HardIce_Burst

HardIce_ChangeBlock:
	LDA Block_NeedsUpdate
	BNE HardIce_Draw

	LDA <Objects_XZ, X
	ADD #$08
	STA Block_DetectX

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Block_DetectXHi

	LDA <Objects_YZ, X
	ADD #$08
	STA Block_DetectY

	LDA <Objects_YHiZ, X
	ADC #$00
	STA Block_DetectYHi

	LDA Object_BodyTileValue, X
	EOR #$01

	JSR Object_ChangeBlock
	JSR Object_Delete

HardIce_Draw:
	LDA #$00
	STA Objects_Orientation, X

	JMP Object_Draw 
	
HardIce_Burst:
	JMP Object_BurstIce

ObjHit_HardIce:
	JSR Object_Hold
	BCC HardIce_NotHold

	LDA #$01
	STA HardIce_KillOthers, X

	LDA <Objects_XVelZ, X
	STA HardIce_PrevXVel, X
	RTS

HardIce_NotHold:

	LDA #$0B
	SUB <HitTest_Result
	CMP #$03
	BCS HardIce_HitBlock

	JSR Object_XDistanceFromPlayer
	CMP #$0A
	BCC HardIce_Burst

HardIce_HitBlock:
	JMP ObjHit_SolidBlock

FireSnake_Frame = Objects_Data1
FireSnake_LowJumpCount = Objects_Data2
FireSnake_BufferOffset = Objects_Data3
FireSnake_Ticker = Objects_Data4
FireSnake_MakeFire = Objects_Data5
FireSnake_XCharge = Objects_Data6
FireSnake_YCharge = Objects_Data7
Firesnake_BufferOccupied = Objects_Data8

FiresSnake_Charge:
	.byte $F0, $10, $E0, $20

FireSnakeFlips:
	.byte $00, SPR_HFLIP

FireSnake_Jumps:
	.byte $E0, $D8, $C8, $BA, $B2, $A8, $A0, $98, $90, $8A, $8A, $8A, $8A, $8A, $8A, $8A

FireSnake_BufferOffsets:
	.byte 00, 16

ObjInit_FireSnake:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #$06
	STA Objects_SpritesRequested, X

	LDA #(ATTR_FIREPROOF | ATTR_DASHPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	LDA #(ATTR_NOICE | ATTR_WINDAFFECTS)
	STA Objects_BehaviorAttr, X

	JSR Object_InitBuffer

	LDA #$01
	STA Buffer_Occupied, Y

	TYA
	STA Firesnake_BufferOccupied, X

	LDA FireSnake_BufferOffsets, Y
	STA FireSnake_BufferOffset, X
	TAY

	LDA #$0F
	STA <Temp_Var1
	
FireSnake_InitLoop:
	LDA <Objects_XZ, X
	STA Object_BufferX, Y

	LDA <Objects_YZ, X
	STA Object_BufferY, Y

	INY
	DEC <Temp_Var1
	BPL FireSnake_InitLoop

	JMP Object_CalcBoundBox

ObjNorm_FireSnake:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE FireSnake_NotDead

	LDY Firesnake_BufferOccupied, X
	
	LDA #$00
	STA Buffer_Occupied, Y

	JSR Object_PoofDie
	JMP Object_SetDeadAndNotSpawned

FireSnake_NotDead:
	LDA <Player_HaltGameZ
	BEQ FireSnake_Norm	 ; If gameplay is NOT halted, jump to PRG003_BD95

	JMP FireSnake_Draw

FireSnake_Norm:
	INC FireSnake_Ticker, X

	LDA #$40
	JSR Object_DeleteOffScreenRange
	
	LDA Objects_State, X
	CMP #OBJSTATE_NORMAL
	BEQ FireSnake_Move

	LDY Firesnake_BufferOccupied, X

	LDA #$00
	STA Buffer_Occupied, Y

FireSnake_Move:
	LDA Objects_Timer, X
	BEQ FireSnake_NoCharge

	CMP #$01
	BNE FireSnake_NoCharge

	LDA FireSnake_XCharge, X
	STA <Objects_XVelZ, X

	LDA FireSnake_YCharge, X
	STA <Objects_YVelZ, X
	BNE FireSnake_NoMove

FireSnake_NoCharge:
	LDA FireSnake_Ticker, X
	AND #$01
	BNE FireSnake_NoMove

	JSR Object_Move

FireSnake_NoMove:
	LDA <Objects_YVelZ, X
	CMP #$18
	BMI FireSnake_NoYVelCap
	BCC FireSnake_NoYVelCap

	LDA #$20
	STA <Objects_YVelZ, X

FireSnake_NoYVelCap:
	
	JSR FireSnake_MoveTail
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_DetectTiles

	LDA <Objects_XVelZ, X
	PHA

	JSR Object_InteractWithTilesWallStops

	PLA
	STA <Objects_XVelZ, X

	JSR FireSnake_MeltIce

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BNE FireSnake_CheckTiles

	LDA #$00
	STA Objects_Timer, X
	JMP FireSnake_Animate
	
FireSnake_CheckTiles:
	LDA <Objects_YVelZ, X
	BPL FireSnake_MovingDown
	JMP FireSnake_Animate

FireSnake_MovingDown:
	LDA Objects_Timer, X
	BNE FireSnake_Animate

	JSR Object_DetectTileCenter
	CMP #TILE_PROP_OBJECTINTERACT
	BNE FireSnake_NoFire

	LDA Tile_DetectionX
	STA Block_ChangeX

	LDA Tile_DetectionXHi
	STA Block_ChangeXHi

	LDA Tile_DetectionY
	STA Block_ChangeY

	LDA Tile_DetectionYHi
	STA Block_ChangeYHi

	JSR Tile_WriteTempChange
	BCC FireSnake_NoFire

	LDX <CurrentObjectIndexZ

	LDA Tile_LastValue
	EOR #$01
	JSR Object_ChangeBlock

FireSnake_NoFire:
	JSR Object_YDistanceFromPlayer
	
	LDA <YDiff

	LDY <YDiffAboveBelow
	BEQ FireSnake_DetermineJump

	LDA #$00
	BEQ FireSnake_DoJump

FireSnake_DetermineJump:
	LSR A
	LSR A
	LSR A
	LSR A

	TAY

FireSnake_DoJump:
	LDA FireSnake_Jumps, Y
	STA FireSnake_YCharge, X

	LDA #$20
	STA Objects_Timer, X

	LDA #$00
	STA <Objects_XVelZ, X

	JSR Object_XDistanceFromPlayer

	LDA <XDiff
	CMP #$50
	BCC FireSnake_Charge
	
	LDA #$40
	STA Objects_Timer, X

	INY 
	INY

FireSnake_Charge:
	LDA FiresSnake_Charge, Y
	STA FireSnake_XCharge, X

FireSnake_Animate:
	INC FireSnake_Frame, X
	LDA FireSnake_Frame, X
	LSR A
	AND #$01
	STA Objects_Frame, X

	LDA FireSnake_Frame, X
	LSR A
	LSR A
	AND #$01
	TAY
	LDA Objects_Orientation, X
	AND #~SPR_HFLIP

	ORA FireSnakeFlips, Y
	STA Objects_Orientation, X
	JMP FireSnake_Draw

FireSnake_MoveTail:
	LDA FireSnake_Ticker, X
	AND #$01
	BNE MoveTail_RTS


	LDA #$0E
	STA <Temp_Var1

	LDA FireSnake_BufferOffset, X
	ADD #$0E
	TAY


MoveTail_Loop:
	LDA Object_BufferX, Y
	STA Object_BufferX + 1, Y

	LDA Object_BufferY, Y
	STA Object_BufferY + 1, Y
	DEY
	DEC <Temp_Var1
	BPL MoveTail_Loop

	INY
	LDA <Objects_XZ, X
	STA Object_BufferX, Y

	LDA <Objects_YZ, X
	STA Object_BufferY, Y

MoveTail_RTS:
	RTS



FireSnake_RAMOffset = Temp_Var15
FireSnake_TailPartX = Temp_Var2
FireSnake_TailPartY = Temp_Var1
FireSnake_TailOffset = Temp_Var16

FireSnake_Draw:
	JSR Object_Draw

FireSnake_DrawTail:
	LDY Object_SpriteRAMOffset, X
	STY <FireSnake_RAMOffset

	LDA FireSnake_BufferOffset, X
	STA <FireSnake_TailOffset
	TAX
	LDA Object_BufferX + 3, X
	SUB <Horz_Scroll
	ADD #$04
	STA <FireSnake_TailPartX
	

	LDA Object_BufferY + 3, X
	SUB <Vert_Scroll
	STA <FireSnake_TailPartY

	JSR Object_ParticleVisibleTest
	BCS FSDT1

	LDY <FireSnake_RAMOffset
	LDA <FireSnake_TailPartX
	STA Sprite_RAMX + 8, Y

	LDA <FireSnake_TailPartY
	STA Sprite_RAMY + 8, Y

	LDA Game_Counter
	AND #$03
	BNE FSDT1

	LDA Sprite_RAMX + 8, Y
	SUB Sprite_RAMX, Y
	STA <FireSnake_TailPartX

	LDA Sprite_RAMY + 8, Y
	SUB Sprite_RAMY, Y
	STA <FireSnake_TailPartY
	
	JSR FireSnake_TailHitTest

FSDT1:
	LDX <FireSnake_TailOffset

	LDA Object_BufferX + 7, X
	SUB <Horz_Scroll
	ADD #$04
	STA <FireSnake_TailPartX

	LDA Object_BufferY + 7, X
	SUB <Vert_Scroll
	STA <FireSnake_TailPartY

	JSR Object_ParticleVisibleTest
	BCS FSDT2

	LDY <FireSnake_RAMOffset
	LDA <FireSnake_TailPartX
	STA Sprite_RAMX + 12, Y

	LDA <FireSnake_TailPartY
	STA Sprite_RAMY + 12, Y

	LDA Game_Counter
	AND #$03
	CMP #$01
	BNE FSDT2

	LDA Sprite_RAMX + 12, Y
	SUB Sprite_RAMX, Y
	STA <FireSnake_TailPartX

	LDA Sprite_RAMY + 12, Y
	SUB Sprite_RAMY, Y
	STA <FireSnake_TailPartY
	JSR FireSnake_TailHitTest

FSDT2:
	LDX <FireSnake_TailOffset
	LDA Object_BufferX + 11, X
	SUB <Horz_Scroll
	ADD #$04
	STA <FireSnake_TailPartX
	

	LDA Object_BufferY + 11, X
	SUB <Vert_Scroll
	STA <FireSnake_TailPartY

	JSR Object_ParticleVisibleTest
	BCS FSDT3

	LDY <FireSnake_RAMOffset
	LDA <FireSnake_TailPartX
	STA Sprite_RAMX + 16, Y
	
	LDA <FireSnake_TailPartY
	STA Sprite_RAMY + 16, Y

	LDA Game_Counter
	AND #$03
	CMP #$02
	BNE FSDT3

	LDA Sprite_RAMX + 16, Y
	SUB Sprite_RAMX, Y
	STA <FireSnake_TailPartX

	LDA Sprite_RAMY + 16, Y
	SUB Sprite_RAMY, Y
	STA <FireSnake_TailPartY
	JSR FireSnake_TailHitTest

FSDT3:
	LDX <FireSnake_TailOffset
	LDA Object_BufferX + 15, X
	SUB <Horz_Scroll
	ADD #$04
	STA <FireSnake_TailPartX

	LDA Object_BufferY + 15, X
	SUB <Vert_Scroll
	STA <FireSnake_TailPartY

	JSR Object_ParticleVisibleTest
	BCS FSDT4

	LDY <FireSnake_RAMOffset
	LDA <FireSnake_TailPartX
	STA Sprite_RAMX + 20, Y
	
	LDA <FireSnake_TailPartY
	STA Sprite_RAMY + 20, Y

	LDA Game_Counter
	AND #$03
	CMP #$03
	BNE FSDT4

	LDA Sprite_RAMX + 20, Y
	SUB Sprite_RAMX, Y
	STA <FireSnake_TailPartX

	LDA Sprite_RAMY + 20, Y
	SUB Sprite_RAMY, Y
	STA <FireSnake_TailPartY
	JSR FireSnake_TailHitTest

FSDT4:
	LDY <FireSnake_RAMOffset

	LDA #$89
	STA Sprite_RAMTile + 8, Y
	STA Sprite_RAMTile + 12, Y

	LDA #$8B
	STA Sprite_RAMTile + 16, Y
	STA Sprite_RAMTile + 20, Y

	LDX <CurrentObjectIndexZ
	
	LDA Objects_SpriteAttributes, X
	STA <Temp_Var1

	LDA Objects_Frame, X
	AND #$01
	TAX

	LDA FireSnake_TailFlips, X
	ORA <Temp_Var1
	STA Sprite_RAMAttr + 8, Y
	STA Sprite_RAMAttr + 16, Y

	TXA
	EOR #$01
	TAX

	LDA FireSnake_TailFlips, X
	ORA <Temp_Var1
	STA Sprite_RAMAttr + 12, Y
	STA Sprite_RAMAttr + 20, Y
	RTS

FireSnake_TailHitTest:
	LDA <FireSnake_TailPartX
	STA <Temp_Var10

	LDA <FireSnake_TailPartY
	STA <Temp_Var11

	LDX <CurrentObjectIndexZ
	LDA Objects_BoundLeft, X
	STA <CalcParam1

	LDA Objects_BoundLeftHi, X
	STA <CalcParam1 + 1

	LDA #$00
	STA <CalcParam2 + 1

	LDA <Temp_Var10
	BPL TailHit_Add

	EOR #$FF
	ADD #$01
	STA <CalcParam2
	JSR Subtract2ByteValue
	JMP TailHit_Bound

TailHit_Add:
	STA CalcParam2
	JSR Add2ByteValue

TailHit_Bound:
	LDA <CalcResult
	STA SpecialObj_BoundLeft
	ADD #$08
	STA SpecialObj_BoundRight

	LDA <CalcResult + 1
	STA SpecialObj_BoundLeftHi
	ADC #$00
	STA SpecialObj_BoundRightHi

	LDA Objects_BoundTop, X
	STA <CalcParam1

	LDA Objects_BoundTopHi, X
	STA <CalcParam1 + 1

	LDA #$00
	STA <CalcParam2 + 1

	LDA <Temp_Var11
	BPL TailHit_Add2

	EOR #$FF
	ADD #$01
	STA CalcParam2
	JSR Subtract2ByteValue
	JMP TailHit_Bound2

TailHit_Add2:
	STA CalcParam2
	JSR Add2ByteValue

TailHit_Bound2:
	LDA <CalcResult
	STA SpecialObj_BoundTop
	ADD #$10
	STA SpecialObj_BoundBottom

	LDA <CalcResult + 1
	STA SpecialObj_BoundTopHi
	ADC #$00
	STA SpecialObj_BoundBottomHi
	
	JSR TailPiece_DetectPlayer
	BCC TailHit_None
	JSR Player_GetHurt

TailHit_None:
	RTS

TailPiece_DetectPlayer:
	STX TempX
	LDX #$09
	JSR Object_SpecialDetectPlayer
	LDX TempX
	RTS	

FireSnake_TailFlips:
	.byte SPR_PAL1, SPR_PAL1 | SPR_HFLIP

FireSnake_HitOffset:
	.byte $13, $FD
	.byte $00, $FF

FireSnake_MeltIce:
	LDA Objects_SpritesHorizontallyOffScreen,X
	ORA Objects_SpritesVerticallyOffScreen,X
	BNE FireSnake_NoMeltIce

	LDA Block_NeedsUpdate
	BEQ FireSnake_MeltIceGo

FireSnake_NoMeltIce:
	RTS

FireSnake_MeltIceGo:
	LDA Object_VertTileProp, X
	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_SLICK)
	BNE FireSnake_DetectIceHorz

	LDY #$00

	LDA <Objects_TilesDetectZ,X
	AND #HIT_GROUND
	BNE FireSnake_MeltIceVert

	INY

FireSnake_MeltIceVert:
	LDA <Objects_YZ, X
	ADD FireSnake_HitOffset, Y
	STA Block_DetectY
	
	AND #$F0
	STA <Poof_Y

	LDA <Objects_YHiZ, X
	ADC FireSnake_HitOffset + 2, Y
	STA Block_DetectYHi

	AND #$F0
	STA <Poof_YHi

	LDA <Objects_XZ, X
	ADD #$08
	STA Block_DetectX
	AND #$F0
	STA <Poof_X

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Block_DetectXHi

	JSR Common_MakePoof

	LDA Object_VertTileValue, X
	EOR #$01
	JMP Object_ChangeBlock

FireSnake_DetectIceHorz:
	LDA <Objects_XVelZ, X
	BEQ FireSnake_MeltIceRTS

	LDA Object_HorzTileProp, X
	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_SLICK)
	BNE FireSnake_MeltIceRTS

	LDY #$00

	LDA <Objects_TilesDetectZ,X
	AND #HIT_RIGHTWALL
	BNE FireSnake_MeltIceHorz

	INY

FireSnake_MeltIceHorz:
	LDA <Objects_XZ, X
	ADD FireSnake_HitOffset, Y
	STA Block_DetectX
	
	AND #$F0
	STA <Poof_X

	LDA <Objects_XHiZ, X
	ADC FireSnake_HitOffset + 2, Y
	STA Block_DetectXHi

	LDA <Objects_YZ, X
	ADD #$07
	STA Block_DetectY
	
	AND #$F0
	STA <Poof_Y

	LDA <Objects_YHiZ, X
	ADC #$00
	STA Block_DetectYHi

	AND #$F0
	STA <Poof_YHi

	JSR Common_MakePoof

	LDA Object_HorzTileValue, X
	EOR #$01
	JMP Object_ChangeBlock

FireSnake_MeltIceRTS:
	RTS    

ObjInit_Freezie:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #ATTR_ICEPROOF
	STA Objects_WeaponAttr, X
	
	LDA #(ATTR_WINDAFFECTS | ATTR_CARRYANDBUMP)
	STA Objects_BehaviorAttr, X

	LDA Objects_Property, X
	BNE Freezie_NotMoving

	LDA #$01
	STA Freezie_State, X

	JSR Object_CalcBoundBox
	JSR Object_MoveTowardsPlayer
	RTS

Freezie_NotMoving:
	CMP #$01
	BNE Freezie_HorzontalPipe

	LDA <Objects_XZ, X
	ADD #$08
	STA <Objects_XZ, X
	RTS

Freezie_HorzontalPipe:
	LDA <Objects_YZ, X
	SUB #$06
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	SBC #$00
	STA <Objects_YHiZ, X
	RTS

Freezie_Frame = Objects_Data1
Freezie_State = Objects_Data2
Freezie_NoYVel = Objects_Timer
Freezie_NoImpact = Objects_Data3

ObjNorm_Freezie:
	LDA <Player_HaltGameZ
	BEQ Freezie_Norm

	LDA Freezie_State, X
	BNE Freezie_JustDraw
	RTS

Freezie_JustDraw:
	JMP Freezie_Draw

Freezie_Norm:

	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE Freezie_DoAction

	JMP Freezie_Die

Freezie_DoAction:
	JSR Object_DeleteOffScreen
	LDA Freezie_State, X
	JSR DynJump

	.word Freezie_Wait
	.word Freezie_Move
	.word Freezie_Dead

Freezie_Wait:
	JSR Object_CalcBoundBox
	JSR Object_XDistanceFromPlayer
	
	CMP #$28
	BCC Freezie_ComeOut

	RTS

Freezie_ComeOut:
	LDA Objects_Property, X
	JSR DynJump

	.word Freezie_PopOut
	.word Freezie_PopOut
	.word Freezie_SlideRight
	.word Freezie_SlideLeft

Freezie_PopOut:
	LDA #$C0
	STA Objects_YVelZ, X
	
	JSR	Object_MoveTowardsPlayer
	
	LDA #$10
	STA Freezie_NoImpact, X

	INC Freezie_State, X
	RTS

Freezie_SlideLeft:
	LDA #$F8
	BNE Freezie_SetMove

Freezie_SlideRight:
	LDA #$08

Freezie_SetMove:
	STA <Objects_XVelZ, X
	
	LDA #$20
	STA Freezie_NoImpact, X

	LDA #$20
	STA Freezie_NoYVel,X
	INC Freezie_State, X
	RTS

Freezie_Move:
	LDA Freezie_NoYVel, X
	STA NoGravity

FreezieMove0:
	JSR Object_Move
	JSR Object_FaceDirectionMoving
	JSR Object_CalcBoundBox
	JSR Object_InteractWithObjects
	JSR Object_InteractWithPlayer
	
	JSR Object_DetectTiles

	LDA Freezie_NoImpact, X
	BEQ Freezie_DetectWorld

	DEC Freezie_NoImpact, X
	BNE Freezie_Animate

Freezie_DetectWorld:
	JSR Object_InteractWithTiles
	
	LDA Object_VertTileProp, X
	AND #$F0
	CMP #TILE_PROP_WATER
	BEQ Freezie_FreezeWater

	CMP #(TILE_PROP_WATER | TILE_PROP_FOREGROUND)
	BNE Freezie_CheckImpact

Freezie_FreezeWater:
	
	LDA <Objects_XZ, X
	ADD #$08
	STA Block_DetectX

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Block_DetectXHi

	LDA <Objects_YZ, X
	ADD #$18
	STA Block_DetectY

	LDA <Objects_YHiZ, X
	ADC #$00
	STA Block_DetectYHi
	
	LDA Object_VertTileValue, X
	EOR #$01

	JSR Object_ChangeBlock
	JSR Object_HitGround
	 
Freezie_CheckImpact:
	LDA <Objects_TilesDetectZ, X
	AND #(HIT_LEFTWALL | HIT_RIGHTWALL | HIT_CEILING)
	BEQ Freezie_Animate

	JMP Freezie_Die

Freezie_Animate:
	INC Freezie_Frame, X
	
	LDA Freezie_Frame, X
	LSR A
	LSR A 
	LSR A
	AND #$03
	STA Objects_Frame, X

Freezie_Draw:
	LDA Freezie_State, X
	CMP #$02
	BEQ FreezieDraw_RTS

	LDA Freezie_NoImpact, X
	BEQ Freezie_NoBehindBg

	LDA Objects_SpriteAttributes, X
	ORA #SPR_BEHINDBG
	STA Objects_SpriteAttributes, X

Freezie_NoBehindBg:
	JSR Object_Draw

FreezieDraw_RTS:
	RTS

FreezieThrowPlayerX:
	.byte $E0, $20

ObjHit_Freezie:
	LDA Player_Invulnerable
	BEQ Freeize_HitPlayer
	RTS

Freeize_HitPlayer:	

	JSR Player_Freeze
	JSR Object_XDistanceFromPlayer
	
	LDA FreezieThrowPlayerX, Y
	STA <Player_XVelZ
	
	LDA #$A0
	STA <Player_YVelZ
	STA <Player_InAir

Freezie_Die:

	LDA #$02
	STA Freezie_State, X
	
	LDA #SND_LEVELCRUMBLE
	STA Sound_QLevel2

	JSR Object_BurstIce
	JMP Object_SetDeadAndNotSpawned

	LDX <CurrentObjectIndexZ
	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	LDA #OBJ_FREEZIE
	STA Objects_ID, X

	LDA #$F0
	STA <Objects_XZ, X

	LDA #$FF
	STA <Objects_XHiZ, X

Freezie_Dead:
	JMP Object_SetDeadAndNotSpawned

ObjInit_Swoosh:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #$80
	STA Objects_Timer, X
	
	LDA #$01
	STA Swoosh_YVel, X

	LDA #$03
	STA Swoosh_Action, X
	STA Objects_Regen, X

	JSR Object_CalcBoundBox
	JSR Object_FacePlayer
	RTS


Swoosh_Times:
	.byte $10, $20, $30, $A0

Swoosh_Frame = Objects_Data1
Swoosh_Action = Objects_Data2
Swoosh_YVel = Objects_Data3

ObjNorm_Swoosh:
	JSR Object_DeleteOffScreen
	
	LDA <Player_HaltGameZ
	BEQ Swoosh_Normal

	JMP Object_Draw

Swoosh_Normal:
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_DetectTiles
	JSR Object_CheckForeground

	LDA Swoosh_Action, X
	JSR DynJump

	.word Swoosh_Idle
	.word Swoosh_BreathIn
	.word Swoosh_Wait
	.word Swoosh_BreathOut
	.word Swoosh_Reset

Swoosh_Idle:
	LDA <Counter_1
	AND #$01
	BNE Swoosh_NoBob

	LDA <Objects_YVelZ, X
	ADD Swoosh_YVel, X
	STA <Objects_YVelZ, X
	
	ADD #$0F
	CMP #$1F
	BCC Swoosh_Bob

	LDA Swoosh_YVel, X
	JSR Negate
	STA Swoosh_YVel, X

Swoosh_Bob:
	JSR Object_ApplyYVel_NoGravity	

Swoosh_NoBob:
	JSR Object_FacePlayer

	LDA #$00
	STA Objects_Frame, X

	LDA Objects_Timer, X
	BNE Swoosh_IdleDone

	INC Swoosh_Action, X

	LDA #$14
	STA Objects_Timer, X

Swoosh_IdleDone:
	JMP Object_Draw

Swoosh_BreathInFrames:
	.byte $03, $02, $02, $01, $01

Swoosh_BreathIn:
	LDA Objects_Timer, X
	BNE Swoosh_BreathInAnimate

	INC Swoosh_Action, X

	LDA #$18
	STA Objects_Timer, X
	JMP Object_Draw

Swoosh_BreathInAnimate:
	LSR A
	LSR A

	TAY
	LDA Swoosh_BreathInFrames, Y
	STA Objects_Frame, X
	JMP Object_Draw

Swoosh_Wait:
	LDA Objects_Timer, X
	BNE Swoosh_WaitDone

	INC Swoosh_Action, X
	
	LDA #$80
	STA Objects_Timer, X

Swoosh_WaitDone:	
	JMP Object_Draw	


Swoosh_BreathOutFrames:
	.byte $06, $05, $04, $04

Swoosh_PoofOffset:
	.byte $F0, $10

Swoosh_PoofXVel:
	.byte $D0, $30

Swoosh_PoofYVel:
	.byte $00, $08, $00, $F8	

Swoosh_BreathOut:
	JSR Swoosh_InteractWithPlayer

	LDA Objects_Timer, X
	AND #$0F
	CMP #$08
	BNE Swoosh_BreathNoPoof

	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE Swoosh_BreathNoPoof

	LDA Sound_QLevel2
	ORA #SND_LEVELAIRSHIP
	STA Sound_QLevel2

	LDY #$00
	LDA Objects_Orientation, X
	BEQ Swoosh_MakePoof

	INY

Swoosh_MakePoof:
	LDA <Objects_XZ, X
	ADD Swoosh_PoofOffset, Y
	STA <Poof_X

	LDA <Objects_YZ, X
	STA <Poof_Y

	STY <Temp_Var16
	
	JSR Common_MakePoof
	
	LDX <Temp_Var16

	LDA Swoosh_PoofXVel, X
	STA SpecialObj_XVel, Y
	STA SpecialObj_Data2, Y

	LDA RandomN
	AND #$03
	TAX

	LDA Swoosh_PoofYVel, X
	STA SpecialObj_YVel, Y
	
	LDX <CurrentObjectIndexZ

Swoosh_BreathNoPoof:	
	LDA Objects_Timer, X
	BNE Swoosh_BreathOutAnimate

	INC Swoosh_Action, X

	LDA #$08
	STA Objects_Timer, X
	JMP Object_Draw

Swoosh_BreathOutAnimate:
	LSR A
	LSR A
	LSR A
	LSR A
	LSR A

	TAY

	LDA Swoosh_BreathOutFrames, Y
	STA Objects_Frame, X
	JMP Object_Draw	

Swoosh_Reset:
	LDA Objects_Timer, X
	BNE Swoosh_ResetDone

	LDA #$00
	STA Swoosh_Action, X
	STA Objects_Frame, X

	LDA RandomN
	AND #$03
	TAY

	LDA Swoosh_Times, Y
	STA Objects_Timer, X

Swoosh_ResetDone:
	JMP Object_Draw	

Swoosh_PlayerSide:
	.byte $00, SPR_HFLIP

Swoosh_InteractWithPlayer:
	LDA Objects_Timer, X
	AND #$01
	BNE Swoosh_InteractWithPlayerRTS

	JSR Object_YDistanceFromPlayer
	CMP #$18
	BCS Swoosh_InteractWithPlayerRTS

	JSR Object_XDistanceFromPlayer
	STA <Temp_Var1

	LDA Objects_Orientation, X
	CMP Swoosh_PlayerSide, Y
	BNE Swoosh_InteractWithPlayerRTS

	LDA <Temp_Var1
	CMP #$80
	BCC Swoosh_Hit

Swoosh_InteractWithPlayerRTS:
	RTS

Swoosh_BreathCarryVel:
	.byte $08, $07, $06, $05, $04, $03, $02, $01

Swoosh_Hit:
	STY <Temp_Var1

	LSR A
	LSR A
	LSR A
	LSR A

	TAY

	LDA Swoosh_BreathCarryVel, Y
	LDY <Temp_Var1
	BNE Swoosh_Push

	JSR Negate

Swoosh_Push:
	ADD <Player_XVelZ
	STA <Player_XVelZ
	RTS	

Ruster_Frame = Objects_Data1
Ruster_Action = Objects_Data2
Ruster_Attacked = Objects_Data3
Ruster_Reps = Objects_Data4

ObjInit_Ruster:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	JSR Object_CalcBoundBox
	JSR Object_MoveTowardsPlayer
	
	LDA #$18
	STA ChaseVel_LimitHi, X

	LDA #$E8
	STA ChaseVel_LimitLo, X

	LDA Objects_Property, X
	STA Ruster_Action, X

	JSR Object_CalcBoundBox
	JSR Object_DetectTileCenter
	CMP #TILE_PROP_SOLID_ALL
	BCC Ruster_InitRTS

	JMP Object_PoofDie

Ruster_InitRTS:	
	RTS

ObjNorm_Ruster:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE Ruster_Alive

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	LDA #$30
	STA Objects_Timer2, X
	
	LDA #$01
	STA Ruster_Action, X

	LDA Ruster_Attacked, X
	CMP #$01
	BEQ Ruster_Die

	INC Ruster_Attacked, X

	LDA Ruster_Attacked, X
	STA Ruster_Reps, X

	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE Ruster_NoPoof

	LDA <Objects_XZ, X
	STA <Poof_X

	LDA <Objects_YZ, X
	STA <Poof_Y

	JSR Common_MakePoof

Ruster_NoPoof:
	LDA #$00
	STA <Objects_XVelZ, X
	STA <Objects_YVelZ, X

	LDA <Player_X
	STA <Objects_XZ, X

	LDA <Vert_Scroll
	ADD #$10
	STA <Objects_YZ, X

	LDA <Vert_Scroll_Hi
	ADC #$00
	STA <Objects_YHiZ, X

	JSR Object_CalcBoundBox

	JMP Ruster_Alive

Ruster_Die:
	JMP Object_StarBurstDeath
	
Ruster_Alive:	
	LDA <Player_HaltGameZ
	BEQ Ruster_Do

	LDA Objects_Timer2, X
	BEQ Ruster_HaltDraw
	RTS

Ruster_HaltDraw:	
	JMP Object_Draw

Ruster_Do:
	LDA #$20
	STA <DeleteRange
	JSR Object_DeleteOffScreenRange

	LDA Ruster_Action, X
	JSR DynJump

	.word Ruster_Norm
	.word Ruster_Angry

Ruster_Norm:
	JSR Object_Move
	JSR Object_FaceDirectionMoving
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles

	LDA Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ Ruster_Animate

	LDA Objects_PreviousTilesDetect, X
	AND #HIT_GROUND
	BNE Ruster_Animate

	LDA #$E8
	STA <Objects_YVelZ, X

	JSR Object_MoveTowardsPlayer

Ruster_Animate:
	LDA Objects_Orientation, X
	AND #~SPR_VFLIP
	STA Objects_Orientation, X
	
	INC Ruster_Frame, X
	LDA Ruster_Frame, X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame, X

	JMP Object_Draw

Ruster_AnimPals:
	.byte SPR_PAL3, SPR_PAL1

Ruster_Angry:
	LDA Objects_Timer2, X
	BEQ Ruster_Chase
	CMP #$01
	BNE Ruster_AngryRTS

	LDA <Objects_XZ, X
	STA <Poof_X

	LDA <Objects_YZ, X
	STA <Poof_Y
	JSR Common_MakePoof

Ruster_AngryRTS:	
	RTS

Ruster_Chase:
	LDA #$00
	STA Objects_XYCS, X
	STA Objects_XYCSPrev, X
	INC Objects_XYCSPrev, X

	JSR Object_ChasePlayer
	JSR Object_FaceDirectionMoving

	LDA Game_Counter
	AND #$01
	BNE Ruster_ResetReps

	DEC Ruster_Reps, X
	BNE Ruster_Chase

Ruster_ResetReps:
	LDA Ruster_Attacked, X
	STA Ruster_Reps, X

	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	
Ruster_AnimateFast:
	; LDA Objects_Timer2, X
	; LSR A
	; LSR A
	; AND #$01
	; TAY 

	; LDA Objects_SpriteAttributes, X
	; AND #~SPR_PAL3
	; ORA Ruster_AnimPals, Y
	; STA Objects_SpriteAttributes, X

	LDA Objects_Orientation, X
	AND #~SPR_VFLIP
	STA Objects_Orientation, X

	LDA Ruster_Attacked, X
	STA <Temp_Var1

	INC Ruster_Frame, X
	LDA Ruster_Frame, X
	LDY Ruster_Attacked, X

Ruster_AnimLoop:
	INY
	CPY #$03
	BEQ Ruster_DrawFast

	LSR A
	JMP Ruster_AnimLoop

Ruster_DrawFast:
	AND #$01
	ORA #$02
	STA Objects_Frame, X
	JMP Object_Draw

Object_ParticleVisibleTest:
	TXA
	PHA
	LDX <CurrentObjectIndexZ
	LDA Objects_SpritesVerticallyOffScreen,X
	BNE PRG004_BE52	 ; If any sprite is vertically off-screen, jump to PRG004_BE52

	LDA <Objects_SpriteY,X	
	CMP #200
	BGE PRG004_BE52	 ; If Sprite Y >= 200, jump to PRG004_BE52

	LDY #$40	 ; Y = $40

	LDA <Objects_SpriteX,X
	BMI PRG004_BE45	 ; If on right half, jump to PRG004_BE45

	LDY #$c0	 ; Y = $C0

PRG004_BE45:
	CPY <Temp_Var2
	EOR Objects_SpritesHorizontallyOffScreen,X
	BMI PRG004_BE50
	BCC PRG004_BE52
	BCS PRG004_BE54

PRG004_BE50:
	BCC PRG004_BE54

PRG004_BE52:
	PLA
	TAX
	SEC		 ; Set carry (link not visible)

	RTS		 ; Return

PRG004_BE54:
	PLA
	TAX
	CLC		 ; Clear carry (link is visible)
	RTS		 ; Return	

FrostFlame_SetPatternTable:
	LDY LastPatTab_Sel
	LDA PatTable_BankSel + 4, Y
	CMP #$36
	BEQ FrostFlame_SetPatternTableRTS

	TYA
	EOR #$01
	TAY

	LDA #$36
	STA PatTable_BankSel + 4, Y

FrostFlame_SetPatternTableRTS:
	RTS

FrostFlame_Direction:
	.byte $01, $FF

Flame_Offset:
	.byte $04, $18

FireBlast_Count = Objects_Data1

ObjInit_FireBlast:
	JSR Object_NoInteractions

	LDA #BOUND16x48
	STA Objects_BoundBox, X

	LDA #$01
	STA Objects_SlowTimer, X

ObjInit_FireBlastRTS:
	RTS

ObjNorm_FireBlast:
	LDA <Player_HaltGameZ
	BEQ Flames_Normal
	
	JMP FireBlast_RTS

Flames_Normal:
	JSR Object_DeleteOffScreen
	JSR FrostFlame_SetPatternTable

	LDA Objects_SlowTimer, X
	CMP #$01
	BNE Flame_NoSound

	LDA #SND_LEVELFLAME
	STA Sound_QLevel2

Flame_NoSound:
	BCS ObjInit_FireBlastRTS

	JSR Object_CalcBoundBoxForced

	LDA Player_EffectiveSuit
	CMP #MARIO_FOX
	BEQ Flames_NoHurt

	JSR Object_InteractWithPlayer

Flames_NoHurt:	
	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE Flames_NoKill

	LDA #ATTR_FIREPROOF
	STA <Kill_TypeCheck
	JSR Object_KillOthers

Flames_NoKill:
	LDA Objects_Timer, X
	BNE FireBlast_RTS

	INC FireBlast_Count, X
	LDA FireBlast_Count, X
	CMP #$10
	BNE FireBlast_MakeFlame

	LDA #$3F
	STA Objects_SlowTimer, X

	LDA #$00
	STA FireBlast_Count, X

FireBlast_MakeFlame:
	LDA #$08
	STA Objects_Timer, X

	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE FireBlast_RTS

	LDY Objects_Property, X
	LDA Flame_Offset, Y
	STA <Temp_Var1

	JSR Object_PrepProjectile
	BCC FireBlast_RTS

	LDA #SOBJ_FLAME
	STA SpecialObj_ID, Y

	LDA #$1F
	STA SpecialObj_Timer, Y

	LDA <Objects_YZ, X
	ADD <Temp_Var1
	STA SpecialObj_Y, Y

	LDA <Objects_YHiZ, X
	ADC #$00
	STA SpecialObj_YHi, Y

	LDA <Objects_XZ, X
	STA SpecialObj_X, Y

	LDA <Objects_XHiZ, X
	STA SpecialObj_XHi, Y

	LDA Objects_Property, X
	TAX
	
	LDA FrostFlame_Direction, X
	STA SpecialObj_Data2, Y

	LDX <CurrentObjectIndexZ

FireBlast_RTS:
	RTS

Frost_Offset:
	.byte $04, $18

FrostBlast_Count = Objects_Data1

ObjInit_FrostBlast:
	JSR Object_NoInteractions

	LDA #BOUND16x48
	STA Objects_BoundBox, X

	LDA #$01
	STA Objects_SlowTimer, X

	JSR Object_NoInteractions
	RTS

ObjNorm_FrostBlast:
	LDA <Player_HaltGameZ
	BNE FrostBlast_RTS

	JSR Object_DeleteOffScreen
	JSR FrostFlame_SetPatternTable
	
	LDA Objects_SlowTimer, X
	BNE FrostBlast_RTS

	JSR Object_CalcBoundBoxForced
	JSR Object_InteractWithPlayer

	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE FrostBlast_NoFreeze

	JSR Frost_FreezeObjects

FrostBlast_NoFreeze:	
	LDA Objects_Timer, X
	BNE FrostBlast_RTS

	INC FrostBlast_Count, X
	LDA FrostBlast_Count, X
	CMP #$10
	BNE FrostBlast_MakeFlame

	LDA #$3F
	STA Objects_SlowTimer, X

	LDA #$00
	STA FrostBlast_Count, X

FrostBlast_MakeFlame:
	LDA #$08
	STA Objects_Timer, X
	
	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE FireBlast_RTS

	LDY Objects_Property, X
	LDA Frost_Offset, Y
	STA <Temp_Var1
	
	JSR Object_PrepProjectile
	BCC FrostBlast_RTS

	LDA #SOBJ_FROST
	STA SpecialObj_ID, Y

	LDA #$1F
	STA SpecialObj_Timer, Y

	LDA <Objects_YZ, X
	ADD <Temp_Var1
	STA SpecialObj_Y, Y

	LDA <Objects_YHiZ, X
	ADC #$00
	STA SpecialObj_YHi, Y

	LDA <Objects_XZ, X
	STA SpecialObj_X, Y

	LDA <Objects_XHiZ, X
	STA SpecialObj_XHi, Y

	LDA Objects_Property, X
	TAX
	
	LDA FrostFlame_Direction, X
	STA SpecialObj_Data2, Y

	LDX <CurrentObjectIndexZ

FrostBlast_RTS:
	RTS

Frost_FreezeObjects:
	LDY #$04

Check_NextObject:
	CPY <CurrentObjectIndexZ
	BEQ Check_FindObject

	LDA Objects_State, Y
	BEQ Check_FindObject

	CMP #OBJSTATE_KILLED
	BEQ Check_FindObject

	LDA Objects_WeaponAttr, Y
	AND #ATTR_ICEPROOF
	BNE Check_FindObject

	LDX <CurrentObjectIndexZ
	
	JSR Object_DetectObjects
	BCC Check_FindObject

	LDA #OBJSTATE_FROZENSOLID
	STA Objects_State,Y
	
	LDA #$00
	STA Explosion_Timer, Y

Check_FindObject:
	DEY
	BPL	Check_NextObject
	RTS

ObjInit_LakituWindow:
	LDA #$06
	STA Objects_SpritesRequested, X
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDY Objects_Property, X

	LDA #(ATTR_NOICE)
	STA Objects_BehaviorAttr, X

	JSR Object_CalcBoundBox

	LDA <Objects_XZ, X
	ADD #$08
	STA <Objects_XZ, X

	LDA <Objects_YHiZ, X
	ADC #$00
	STA <Objects_YHiZ, X
	RTS		 ; Return


LakituWindow_Frame = Objects_Data1
LakituWindow_Action = Objects_Data2
LakituWindow_BodyOffset = Objects_Data3
LakituWindow_EnemyOffset = Objects_Data5
LakituWindow_MadePoof = Objects_Data6
LakituWindow_SleepTime = Objects_Data7

ObjNorm_LakituWindow:
	LDA <Player_HaltGameZ
	BEQ LakituWindow_Norm

	JMP LakituWindow_Draw

LakituWindow_Norm:
	JSR Object_DeleteOffScreen
	JSR Object_CalcBoundBox
	JSR Object_CheckForeground
	JSR Object_AttackOrDefeat
	JSR LakituWindow_DoAction
	JMP LakituWindow_Draw

LakituWindow_DoAction:
	LDA LakituWindow_Action, X
	JSR DynJump

	.word LakituWindow_Wait
	.word LakituWindow_Lower
	.word LakituWindow_RaiseEnemy
	.word LakituWindow_Raise
	.word LakituWindow_Aim

LakituWindow_Wait:
	LDA Objects_Timer, X
	BNE LakituWindow_WaitDone

	INC LakituWindow_Action, X

LakituWindow_WaitDone:
	RTS

LakituWindow_Lower:
	INC LakituWindow_BodyOffset, X
	LDY LakituWindow_BodyOffset, X
	CPY #$10
	BCC LakituWindow_LowerDone

	INC LakituWindow_Action, X

LakituWindow_LowerDone:
	RTS

LakituWindow_RaiseEnemy:
	INC LakituWindow_EnemyOffset, X
	LDA LakituWindow_EnemyOffset, X
	CMP #$0C
	BCC LakituWindow_RaiseEnemyDone

	INC LakituWindow_Action, X
	LDA #$01
	STA Objects_Frame, X

LakituWindow_RaiseEnemyDone:
	RTS

LakituWindow_Raise:
	DEC LakituWindow_BodyOffset, X
	BNE LakituWindow_RaiseDone

	INC LakituWindow_Action, X

	LDA RandomN, X
	AND #$03
	TAY
	LDA LakituWindow_AimTimers, Y
	STA Objects_Timer, X

LakituWindow_RaiseDone:
	RTS

LakituWindow_AimTimers:
	.byte $20, $40, $40, $10


LakituWindow_WaitTimers:
	.byte $40, $40, $60, $30

LakituWindow_Aim:
	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE LakituWindow_AimRTS

	LDA Objects_Timer, X
	BEQ LakituWindow_AimAnyway

LakituWindow_AimRTS:	
	RTS

LakituWindow_AimAnyway:	
	
	JSR Object_PrepProjectile	
	BCC LakituWindow_AimDone
	
	LDA #SOBJ_SPINYEGG
	STA SpecialObj_ID,Y

	LDA <Objects_XZ, X
	STA SpecialObj_X, Y

	LDA <Objects_XHiZ, X
	STA SpecialObj_XHi, Y

	LDA <Objects_YZ, X
	SUB #$10
	STA SpecialObj_Y, Y

	LDA <Objects_YHiZ, X
	SBC #$00
	STA SpecialObj_YHi, Y

	JSR Object_AimProjectile

	LDA SpecialObj_XVel, Y
	JSR Double_Value
	STA SpecialObj_XVel, Y

	LDA SpecialObj_YVel, Y
	JSR Double_Value
	STA SpecialObj_YVel, Y

LakituWindow_Reset:
	LDA RandomN, X
	AND #$03
	TAY
	LDA LakituWindow_WaitTimers, Y
	STA Objects_Timer, X

	LDA #$00
	STA LakituWindow_EnemyOffset, X
	STA LakituWindow_BodyOffset, X
	STA LakituWindow_MadePoof, X
	STA LakituWindow_Action, X
	STA Objects_Frame, X

LakituWindow_AimDone:
	RTS

LakituWindow_Draw:
	LDA <Objects_SpriteY, X
	ADD #$10
	STA <Objects_SpriteY, X

	JSR Object_Draw16x32Mirrored

	LDA Sprite_RAMY, Y
	STA <Temp_Var1

	LDA Sprite_RAMY + 8, Y
	STA Sprite_RAMY, Y

	LDA <Temp_Var1
	ADD LakituWindow_BodyOffset, X
	BCS LakituWindow_Draw_A
	STA Sprite_RAMY + 8, Y

LakituWindow_Draw_A:
	LDA Sprite_RAMY + 4, Y
	STA <Temp_Var1

	LDA Sprite_RAMY + 12, Y
	STA Sprite_RAMY + 4, Y

	LDA <Temp_Var1
	ADD LakituWindow_BodyOffset, X
	BCS LakituWindow_Draw0
	STA Sprite_RAMY + 12, Y

LakituWindow_Draw0:
	JSR LakituWindow_HideMask

	LDA #SPR_BEHINDBG
	STA Sprite_RAMAttr, Y

	LDA #SPR_BEHINDBG
	STA Sprite_RAMAttr+ 4, Y

	LDA LakituWindow_Action, X
	CMP #$02
	BCC LakituWindow_DrawDone

	JSR LakituWindow_DrawEnemy

LakituWindow_DrawDone:
	RTS

LakituWindow_DrawEnemy:
	LDA LakituWindow_EnemyOffset, X
	STA <Temp_Var1

	LDA Sprite_RAMY + 8, Y
	SUB <Temp_Var1
	STA Sprite_RAMY + 16, Y

	STA <Temp_Var3

	LDA #$99
	STA Sprite_RAMTile + 16, Y

	LDA Objects_SpriteAttributes, X
	AND #SPR_BEHINDBG
	ORA #SPR_PAL2
	STA Sprite_RAMAttr + 16, Y

	LDA Sprite_RAMX + 8, Y
	STA Sprite_RAMX + 16, Y

	LDA #$99
	STA Sprite_RAMTile + 20, Y

	LDA Objects_SpriteAttributes, X
	AND #SPR_BEHINDBG
	ORA #(SPR_PAL2 | SPR_HFLIP | SPR_VFLIP)
	STA Sprite_RAMAttr + 20, Y

	LDA Sprite_RAMX + 12, Y
	STA Sprite_RAMX + 20, Y

	LDA Sprite_RAMY + 12, Y
	SUB <Temp_Var1
	STA Sprite_RAMY + 20, Y

LakituWindow_DrawEnemyDone:
	RTS

LakituWindow_HideMask:
	LDA LakituWindow_Action, X
	BEQ LakituWindow_DoHide

	CMP #$05
	BNE LakituWindow_HideMaskRTS

LakituWindow_DoHide:	 
	LDA #$F8
	STA Sprite_RAMY, Y
	STA Sprite_RAMY + 4, Y

LakituWindow_HideMaskRTS:
	RTS

ObjInit_StingBee:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	JSR Object_CalcBoundBox

	JMP InitPatrol

StingBee_AnimTicks = Objects_Data1	
StingBee_Action	= Objects_Data2
StingBee_ChargeShake = Objects_Data3
StingBee_BackupXVel	= Objects_Data4
StingBee_DecreaseXVel	= Objects_Data5

ObjNorm_StingBee:
	LDA <Player_HaltGameZ
	BEQ StingBee_DoAction
	JMP StingBee_Draw

StingBee_DoAction:
	LDA StingBee_Action, X
	JSR DynJump

	.word StingBee_Norm
	.word StingBee_Charging
	.word StingBee_Charge


StingBee_DirectionTest:
	.byte $00, SPR_HFLIP

StingBee_ChargeDirection:
	.byte $C0, $40	

StingBee_ChargeSlowDown:
	.byte $01, $FF

StingBee_Norm:
	JSR Object_MovePattern
	JSR Object_FaceDirectionMoving
	JSR StingBee_Interact

	JSR Object_XDistanceFromPlayer
	
	LDA Objects_Orientation, X
	CMP StingBee_DirectionTest, Y
	BNE StingBee_Animate

	JSR Object_YDistanceFromPlayer
	CMP #$10
	BCS StingBee_Animate

	LDA <Objects_XVelZ, X
	STA StingBee_BackupXVel, X
	
	INC StingBee_Action, X
	LDA #$20
	STA Objects_Timer, X
	JMP StingBee_Animate

StingBee_Interact:
	LDA <Objects_XVelZ, X
	BNE StingBee_Interact1

	JSR Object_FacePlayer

StingBee_Interact1:
	JSR Object_DeleteOffScreen
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_InteractWithTilesWallStops
	JSR Object_AttackOrDefeat
	RTS

StingBee_Animate:
	INC StingBee_AnimTicks, X

	LDA StingBee_AnimTicks, X
	LSR A
	AND #$01
	STA Objects_Frame, X
	
StingBee_Draw:
	JMP Object_Draw

StingBee_Charging:
	JSR StingBee_Interact
	
	LDA Objects_Timer, X
	STA Shell_ShakeTimer, X
	BNE StingBee_AnimateFast

	INC StingBee_Action, X
	
	JSR Object_XDistanceFromPlayer

	LDA StingBee_ChargeDirection, Y
	STA <Objects_XVelZ, X

	LDA StingBee_ChargeSlowDown, Y
	STA StingBee_DecreaseXVel, X

StingBee_AnimateFast:
	INC StingBee_AnimTicks, X

	LDA StingBee_AnimTicks, X
	AND #$01
	STA Objects_Frame, X
	
	JMP StingBee_Draw

StingBee_Charge:
	LDA <Objects_XVelZ, X
	ADD StingBee_DecreaseXVel, X
	STA <Objects_XVelZ, X

	JSR Object_ApplyXVel
	JSR Object_FaceDirectionMoving
	JSR StingBee_Interact

	LDA <Objects_TilesDetectZ, X
	BNE StingBee_ChargeStop

	LDA <Objects_XVelZ, X
	BEQ StingBee_ChargeStop
	JMP StingBee_AnimateFast

StingBee_ChargeStop:
	LDA #$00
	STA StingBee_Action, X

	LDA StingBee_BackupXVel, X
	STA <Objects_XVelZ, X

	JMP StingBee_AnimateFast

Fuzzy_AnimTicks = Objects_Data1
Fuzzy_BlockCheck = Objects_Data2
Fuzzy_BlockCheckIndex = Objects_Data3
Fuzzy_BlockCheckCount = Objects_Data4
Fuzzy_XOrigin = Objects_Data5
Fuzzy_XHiOrigin = Objects_Data6

ObjInit_Fuzzy:
	LDA #(ATTR_FIREPROOF | ATTR_ICEPROOF | ATTR_NINJAPROOF | ATTR_HAMMERPROOF  | ATTR_TAILPROOF | ATTR_DASHPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	LDA #(ATTR_EXPLOSIONPROOF | ATTR_SHELLPROOF | ATTR_BUMPNOKILL)
	STA Objects_BehaviorAttr, X

	LDA <Objects_XZ, X
	STA Fuzzy_XOrigin, X

	LDA <Objects_XHiZ, X
	STA Fuzzy_XHiOrigin, X
	RTS

Fuzzy_PatTable:
	.byte $33, $33, $32

ObjNorm_Fuzzy:
	LDY Objects_Property, X
	LDA Fuzzy_PatTable, Y
	STA PatTable_BankSel + 4

	LDA <Player_HaltGameZ
	BEQ Fuzzy_Norm
	JMP Fuzzy_Draw

Fuzzy_Norm:	
	LDA <Objects_XZ, X
	CMP Fuzzy_XOrigin, X
	BNE Fuzzy_Move

	LDA <Objects_XHiZ, X
	CMP Fuzzy_XHiOrigin, X
	BNE Fuzzy_Move

	JSR Object_DeleteOffScreen

Fuzzy_Move:
	JSR Object_ApplyXVel
	JSR Object_ApplyYVel_NoGravity
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

	LDA <Objects_XZ, X
	ORA <Objects_YZ, X
	AND #$0F
	CMP #$00
	BEQ Fuzzy_FindBlock

	JMP Fuzzy_Animate

Fuzzy_BlockChecksX:
	.byte $08, $18, $08, $F8

Fuzzy_BlockChecksXHi:	
	.byte $00, $00, $00, $FF

Fuzzy_BlockChecksY:
	.byte $F8, $08, $18, $08

Fuzzy_BlockChecksYHi:	
	.byte $FF, $00, $00, $00

FUZZY_BLOCKCHECK_UP = $00
FUZZY_BLOCKCHECK_RIGHT = $01
FUZZY_BLOCKCHECK_DOWN = $02
FUZZY_BLOCKCHECK_LEFT = $03

Fuzzy_BlockXVelocities:
	.byte $00, $10, $00, $F0
	.byte $00, $20, $00, $E0
	.byte $00, $40, $00, $C0

Fuzzy_BlockYVelocities:
	.byte $F0, $00, $10, $00
	.byte $E0, $00, $20, $00
	.byte $C0, $00, $40, $00

Fuzzy_BlockChecks:
	.byte FUZZY_BLOCKCHECK_UP, FUZZY_BLOCKCHECK_RIGHT, FUZZY_BLOCKCHECK_LEFT, FUZZY_BLOCKCHECK_DOWN
	.byte FUZZY_BLOCKCHECK_RIGHT, FUZZY_BLOCKCHECK_UP, FUZZY_BLOCKCHECK_DOWN, FUZZY_BLOCKCHECK_LEFT
	.byte FUZZY_BLOCKCHECK_DOWN, FUZZY_BLOCKCHECK_LEFT, FUZZY_BLOCKCHECK_RIGHT, FUZZY_BLOCKCHECK_UP
	.byte FUZZY_BLOCKCHECK_LEFT, FUZZY_BLOCKCHECK_UP, FUZZY_BLOCKCHECK_DOWN, FUZZY_BLOCKCHECK_RIGHT

Fuzzy_SpeedOffset:
	.byte 00, 04, 08

Fuzzy_FindBlock:
	LDA Fuzzy_BlockCheck, X
	ASL A
	ASL A
	STA Fuzzy_BlockCheckIndex, X

	LDA #$00
	STA Fuzzy_BlockCheckCount, X

Fuzzy_FindNextBlock:
	LDA Fuzzy_BlockCheckCount, X
	ADD Fuzzy_BlockCheckIndex, X
	TAY
	LDA Fuzzy_BlockChecks, Y
	TAY 

	LDA <Objects_XZ, X
	ADD Fuzzy_BlockChecksX, Y
	STA Block_DetectX

	LDA <Objects_XHiZ, X
	ADC Fuzzy_BlockChecksXHi, Y
	STA Block_DetectXHi

	LDA <Objects_YZ, X
	ADD Fuzzy_BlockChecksY, Y
	STA Block_DetectY

	LDA <Objects_YHiZ, X
	ADC Fuzzy_BlockChecksYHi, Y
	STA Block_DetectYHi

	JSR Object_DetectTile
	CMP #TILE_PROP_OBJECTINTERACT
	BNE Fuzzy_NextBlockCheck

	LDA Fuzzy_BlockCheckCount, X
	ADD Fuzzy_BlockCheckIndex, X
	TAY
	
	LDA Fuzzy_BlockChecks, Y
	STA Fuzzy_BlockCheck, X
	STA <Temp_Var1

	LDY Objects_Property, X
	LDA Fuzzy_SpeedOffset, Y

	ADD <Temp_Var1
	TAY

Fuzzy_NormalSpeed:	
	LDA Fuzzy_BlockXVelocities, Y
	STA <Objects_XVelZ, X

	LDA Fuzzy_BlockYVelocities, Y
	STA <Objects_YVelZ, X

	JMP Fuzzy_Animate

Fuzzy_NextBlockCheck:
	INC Fuzzy_BlockCheckCount, X
	LDA Fuzzy_BlockCheckCount, X
	CMP #$04
	BEQ Fuzzy_Animate

	JMP Fuzzy_FindNextBlock

Fuzzy_FrameOffset:
	.byte $00, $00, $02

Fuzzy_Animate:
	LDY Objects_Property, X

	INC Fuzzy_AnimTicks, X
	LDA Fuzzy_AnimTicks, X
	LSR A
	LSR A
	AND #$01
	ADD Fuzzy_FrameOffset, Y
	STA Objects_Frame, X

Fuzzy_Draw:
	LDA #$00
	STA Objects_Orientation, X

	JSR Object_Draw

	LDA Sprite_RAMAttr + 4, Y
	ORA #SPR_HFLIP
	STA Sprite_RAMAttr + 4, Y
	RTS

ObjInit_IceWall:
	JSR Object_NoInteractions

	LDA #BOUND16X48TALL
	STA Objects_BoundBox, X

	LDA #$06
	STA Objects_SpritesRequested, X

	LDA Objects_BehaviorAttr, X
	ORA #ATTR_WINDAFFECTS
	STA Objects_BehaviorAttr, X
	RTS

ObjNorm_IceWall:
	LDA <Player_HaltGameZ
	BNE IceWall_Draw

	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles

	LDA Objects_TilesDetectZ, X
	AND #(HIT_LEFTWALL | HIT_RIGHTWALL)
	BEQ IceWall_Draw

	JMP Object_BurstIce

IceWall_Draw:
	LDA #$00
	STA Objects_Orientation, X

	JSR Object_Draw16x48
	LDY Object_SpriteRAMOffset, X
	
	LDA Sprite_RAMAttr + 4, Y
	ORA #(SPR_HFLIP | SPR_VFLIP)
	STA Sprite_RAMAttr + 4, Y
	
	LDA Sprite_RAMAttr + 12, Y
	ORA #(SPR_HFLIP | SPR_VFLIP)
	STA Sprite_RAMAttr + 12, Y

	LDA Sprite_RAMAttr + 20, Y
	ORA #(SPR_HFLIP | SPR_VFLIP)
	STA Sprite_RAMAttr + 20, Y
	RTS

ObjInit_Meteor:
	JSR Object_NoInteractions
	LDA Sound_QMap
	ORA #SND_MAPENTERWORLD
	STA Sound_QMap
	RTS

Meteor_FrameTicks = Objects_Data1
Meteor_Action = Objects_Data2
Meteor_NoSmash = Objects_Data3
Meteor_Kicked = Objects_Data4

Meteor_XVel:
	.byte $20, $E0, $00

Meteor_YVel:
	.byte $20, $20, $60

Meteor_Orientation:
	.byte $00, SPR_HFLIP

ObjNorm_Meteor:
	LDA <Player_HaltGameZ
	BEQ Meteor_Norm

	JMP Meteor_Draw


Meteor_Norm:
	LDA Meteor_Action, X

	JSR DynJump

	.word Meteor_Fall
	.word Meteor_Carry

Meteor_Fall:
	LDY Objects_Property, X
	
	LDA Meteor_XVel, Y
	STA <Objects_XVelZ, X

	LDA Meteor_YVel, Y
	STA <Objects_YVelZ, X

	JSR Object_ApplyXVel
	JSR Object_ApplyYVel_NoGravity
	JSR Object_CalcBoundBoxForced
	JSR Object_DetectTiles
	JSR Object_InteractWithPlayer

	LDA Objects_Timer, X
	BNE Meteor_CheckHit

	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesHorizontallyOffScreen, X
	BNE Meteor_Animate

	LDA #$20
	STA Objects_Timer, X

	LDA <Objects_XZ, X
	STA <Poof_X

	LDA <Objects_YZ, X
	STA <Poof_Y

	JSR Common_MakePoof

Meteor_CheckHit:
	LDA Objects_TilesDetectZ, X
	CMP #HIT_GROUND
	BNE Meteor_Animate

	LDA Meteor_NoSmash, X
	BEQ Meteor_BreakApart

	INC Meteor_Action, X
	JMP Meteor_Draw

Meteor_BreakApart:	

	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesHorizontallyOffScreen, X
	BNE Meteor_Delete

	LDA <Objects_XZ, X
	STA <Debris_X

	LDA <Objects_YZ, X
	STA <Debris_Y

	JSR Common_MakeDebris

	LDA #STAR_DEBRIS
	STA BrickBust_Tile, Y

	LDA #SPR_PAL3
	STA BrickBust_Pal, Y	

Meteor_Delete:	
	JMP Object_Delete

Meteor_Animate:
	INC Meteor_FrameTicks, X
	LDA Meteor_FrameTicks, X
	LSR A
	AND #$01

	TAY
	LDA Meteor_Orientation, Y
	STA Objects_Orientation, X

Meteor_Draw:
	JSR Object_Draw
	RTS

Meteor_Carry:
	JSR Object_DeleteOffScreen

	LDA Meteor_Kicked, X
	BEQ Meteor_NotKicked

	JSR Object_ApplyXVel
	JSR Object_ApplyYVel_NoGravity
	JMP Meteor_Interact

Meteor_NotKicked:
	JSR Object_Move
	JSR Object_DetectTiles
	JSR Object_DampenVelocity
	JSR Object_InteractWithTiles
	JMP Meteor_Interact

	JSR Object_ApplyXVel
	JSR Object_ApplyYVel_NoGravity

Meteor_Interact:	
	JSR Object_CalcBoundBoxForced
	
	LDA Meteor_Kicked, X
	BEQ Meteor_Hold

	JSR Explosion_KillOthers
	BCC Meteor_NotKilled

	LDA <Objects_XZ, X
	STA <Debris_X

	LDA <Objects_YZ, X
	STA <Debris_Y

	JSR Common_MakeDebris

	LDA #STAR_DEBRIS
	STA BrickBust_Tile, Y

	LDA #SPR_PAL3
	STA BrickBust_Pal, Y	

	JMP Object_Delete

Meteor_NotKilled:	
	JMP Meteor_CarryDraw

Meteor_Hold:	
	JSR Object_DetectPlayer
	BCC Meteor_CarryDraw

	JSR Object_Hold
	
	LDA Objects_Kicked, X
	STA Meteor_Kicked, X
	BEQ Meteor_CarryDraw

	LDA Sound_QMap
	ORA #SND_MAPENTERWORLD
	STA Sound_QMap

Meteor_CarryDraw:
	LDA Objects_BeingHeld, X
	BNE Meteor_CarryDrawStatic

	LDA <Objects_YVelZ, X
	BEQ Meteor_CarryDrawStatic

	JMP Meteor_Animate

Meteor_CarryDrawStatic:
	JMP Meteor_Draw	

SunBeam_OriginY = Objects_Data1
SunBeam_OriginYHi = Objects_Data2
SunBeam_DrawLoops = Objects_Data3
SunBeam_Firing = Objects_Data4

ObjInit_SunBeam:
	LDA #$08
	STA Objects_SpritesRequested, X

	LDA #BOUND32x32
	STA Objects_BoundBox, X

	JSR Object_NoInteractions

	LDA <Objects_YZ, X
	STA SunBeam_OriginY, X

	LDA <Objects_YHiZ, X
	STA SunBeam_OriginYHi, X

SunBeam_InitRTS:
	RTS

ObjNorm_SunBeam:
	LDA SunBeam_Firing, X
	BEQ SunBeam_InitRTS

	LDA <Player_HaltGameZ
	BEQ SunBeam_Norm

	JMP SunBeam_Draw

SunBeam_Norm:
	DEC SunBeam_Firing, X

	LDA <Objects_YZ, X
	ADD #$20
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	ADC #$00
	STA <Objects_YHiZ, X

	JSR Object_CalcBoundBox
	JSR Object_DeleteOffScreen
	JSR Object_InteractWithPlayer
	JSR Object_DetectTiles
	JSR SunBeam_Draw

	LDA Objects_TilesDetectZ, X
	BEQ SunBeam_RTS

	LDA Sound_QPlayer
	ORA #SND_PLAYERBUMP
	STA Sound_QPlayer

	LDA Objects_Timer, X
	BNE SunBeam_Reset

	LDA <Objects_XZ, X
	STA <Poof_X

	LDA <Objects_YZ, X
	ADD #$10
	STA <Poof_Y

	JSR Common_MakePoof

	LDA <Objects_XZ, X
	ADD #$10
	STA <Poof_X

	JSR Common_MakePoof

	LDA #$20
	STA Objects_Timer, X


SunBeam_Reset:
	LDA SunBeam_OriginY, X
	STA <Objects_YZ, X

	LDA SunBeam_OriginYHi, X
	STA <Objects_YHiZ, X
	RTS

SunBeam_Draw:
	LDA #LOW(ObjP77)
	STA <Giant_TilesLow

	LDA #HIGH(ObjP77)
	STA <Giant_TilesHi

	LDA #SPR_PAL3 | SPR_BEHINDBG
	STA Objects_SpriteAttributes, X
	
	LDA #$01
	STA SunBeam_DrawLoops, X

	LDA <Objects_YZ, X
	PHA 

SunBeam_DrawLoop:
	JSR Object_DrawGiant
	JSR SunBeam_Mirror

	LDA Object_SpriteRAMOffset, X
	ADD #$20
	STA Object_SpriteRAMOffset, X

	LDA <Objects_YZ, X
	ADD #$20
	STA <Objects_YZ, X

	LSR Objects_SpritesHorizontallyOffScreen, X
	LSR Objects_SpritesHorizontallyOffScreen, X

	LSR Objects_SpritesVerticallyOffScreen, X
	LSR Objects_SpritesVerticallyOffScreen, X

	DEC SunBeam_DrawLoops, X
	BNE SunBeam_DrawLoop

	PLA
	STA <Objects_YZ, X

SunBeam_RTS:	
	RTS


SunBeam_Mirror:
	LDY Object_SpriteRAMOffset, X
	LDA Sprite_RAMAttr + 8, Y
	ORA #SPR_HFLIP
	STA Sprite_RAMAttr + 8, Y

	LDA Sprite_RAMAttr + 12, Y
	ORA #SPR_HFLIP
	STA Sprite_RAMAttr + 12, Y

	LDA Sprite_RAMAttr + 24, Y
	ORA #SPR_HFLIP
	STA Sprite_RAMAttr + 24, Y

	LDA Sprite_RAMAttr + 28, Y
	ORA #SPR_HFLIP
	STA Sprite_RAMAttr + 28, Y
	RTS	
	