    .org ObjectGroup_InitJumpTable
;****************************** OBJECT INITIALIZATION ******************************
    .word ObjInit_PumpkinFree	; Object $A0 - OBJ_PUMPKINFREE
	.word ObjInit_DoNothing	; Object $A1 - OBJ_PUMPKINFREE_FLIPPED
	.word ObjInit_Piranha	; Object $A2 - OBJ_PIRANHA
	.word ObjInit_Piranha_Aggressive	; Object $A3 - OBJ_PIRANHA_AGGRESSIVE
	.word ObjInit_Pumpkin	; Object $A4 - OBJ_PUMPKINPLANT
	.word ObjInit_DoNothing	; Object $A5 - OBJ_PUMPKINPLANT_HOPPER
	.word ObjInit_DoNothing	; Object $A6 - OBJ_VENUSFIRETRAP
	.word ObjInit_DoNothing	; Object $A7 - OBJ_VENUSFIRETRAP_CEIL
	.word ObjInit_DoNothing		; Object $A8 - OBJ_OilTRAP
	.word ObjInit_DoNothing		; Object $A9 - OBJ_OilTRAP_CEIL
	.word ObjInit_DoNothing		; Object $AA - OBJ_AIRSHIPPROP
	.word ObjInit_DoNothing	; Object $AB (doesn't really work, and the "normal" routine is even weirder)
	.word ObjInit_DoNothing	; Object $AC - OBJ_FIREJET_LEFT
	.word ObjInit_DoNothing	; Object $AD - OBJ_ROCKYWRENCH
	.word ObjInit_DoNothing		; Object $AE - OBJ_BOLTLIFT
	.word ObjInit_Sun		; Object $AF - OBJ_ENEMYSUN
	.word ObjInit_DoNothing	; Object $B0 - OBJ_BIGCANNONBALL
	.word ObjInit_DoNothing	; Object $B1 - OBJ_FIREJET_RIGHT
	.word ObjInit_DoNothing	; Object $B2 - OBJ_FIREJET_UPSIDEDOWN
	.word ObjInit_Stars		; Object $B3 

    .org ObjectGroup_NormalJumpTable
;****************************** OBJECT GAME LOOP ******************************
    .word ObjNorm_PumpkinFree		; Object $A0 - OBJ_PUMPKINFREE
	.word ObjNorm_PumpkinFree		; Object $A1 - OBJ_PUMPKINFREE_FLIPPED
	.word ObjNorm_Piranha		; Object $A2 - OBJ_REDPIRANHA
	.word ObjNorm_Piranha		; Object $A3 - OBJ_PIRANHA_AGGRESSIVE
	.word ObjNorm_Pumpkin		; Object $A4 - OBJ_PUMPKINPLANT
	.word ObjNorm_DoNothing		; Object $A5 - OBJ_PUMPKINPLANT_HOPPER
	.word ObjNorm_DoNothing		; Object $A6 - OBJ_VENUSFIRETRAP
	.word ObjNorm_DoNothing		; Object $A7 - OBJ_VENUSFIRETRAP_CEIL
	.word ObjNorm_DoNothing	; Object $A8 - OBJ_OilTRAP
	.word ObjNorm_DoNothing	; Object $A9 - OBJ_OilTRAP_CEIL
	.word ObjNorm_DoNothing	; Object $AA - OBJ_AIRSHIPPROP
	.word ObjNorm_DoNothing	; Object $AB (this call doesn't make any sense!!)
	.word ObjNorm_DoNothing		; Object $AC - OBJ_FIREJET_LEFT
	.word ObjNorm_RockyWrench	; Object $AD - OBJ_ROCKYWRENCH
	.word ObjNorm_DoNothing		; Object $AE - OBJ_BOLTLIFT
	.word ObjNorm_Sun		; Object $AF - OBJ_ENEMYSUN
	.word ObjNorm_DoNothing	; Object $B0 - OBJ_BIGCANNONBALL
	.word ObjNorm_DoNothing		; Object $B1 - OBJ_FIREJET_RIGHT
	.word ObjNorm_DoNothing		; Object $B2 - OBJ_FIREJET_UPSIDEDOWN
	.word ObjNorm_Stars		; Object $B3

    .org ObjectGroup_CollideJumpTable
;****************************** OBJECT PLAYER INTERACTION ******************************
	.word Player_GetHurt	; Object $A0 - OBJ_PUMPKINFREE
	.word ObjHit_DoNothing	; Object $A1 - OBJ_PUMPKINFREE_FLIPPED
	.word ObjHit_DoNothing	; Object $A2 - OBJ_REDPIRANHA
	.word ObjHit_DoNothing	; Object $A3 - OBJ_PIRANHA_AGGRESSIVE
	.word ObjHit_DoNothing	; Object $A4 - OBJ_PUMPKINPLANT
	.word ObjHit_DoNothing	; Object $A5 - OBJ_PUMPKINPLANT_HOPPER
	.word ObjHit_DoNothing	; Object $A6 - OBJ_VENUSFIRETRAP
	.word ObjHit_DoNothing	; Object $A7 - OBJ_VENUSFIRETRAP_CEIL
	.word ObjHit_DoNothing	; Object $A8 - OBJ_OilTRAP
	.word ObjHit_DoNothing	; Object $A9 - OBJ_OilTRAP_CEIL
	.word ObjHit_DoNothing	; Object $AA - OBJ_AIRSHIPPROP
	.word ObjHit_DoNothing	; Object $AB
	.word ObjHit_DoNothing	; Object $AC - OBJ_FIREJET_LEFT
	.word ObjHit_DoNothing	; Object $AD - OBJ_ROCKYWRENCH
	.word ObjHit_DoNothing	; Object $AE - OBJ_BOLTLIFT
	.word Player_GetHurt	; Object $AF - OBJ_ENEMYSUN
	.word $0000	; Object $B0 - OBJ_BIGCANNONBALL
	.word $0000	; Object $B1 - OBJ_FIREJET_RIGHT
	.word $0000	; Object $B2 - OBJ_FIREJET_UPSIDEDOWN
	.word $0000	; Object $B3 

    .org ObjectGroup_PatTableSel
;****************************** OBJECT PALETTE/SIZE ******************************
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $A0 - OBJ_PUMPKINFREE
	.byte OA1_PAL2 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $A1 - OBJ_PUMPKINFREE_FLIPPED
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $A2 - OBJ_REDPIRANHA
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $A3 - OBJ_PIRANHA_AGGRESSIVE
	.byte OA1_PAL2 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $A4 - OBJ_PUMPKINPLANT
	.byte OA1_PAL2 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $A5 - OBJ_PUMPKINPLANT_HOPPER
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $A6 - OBJ_VENUSFIRETRAP
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $A7 - OBJ_VENUSFIRETRAP_CEIL
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $A8 - OBJ_OilTRAP
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $A9 - OBJ_OilTRAP_CEIL
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH8	; Object $AA - OBJ_AIRSHIPPROP
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH32	; Object $AB
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH48	; Object $AC - OBJ_FIREJET_LEFT
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $AD - OBJ_ROCKYWRENCH
	.byte OA1_PAL2 | OA1_HEIGHT32 | OA1_WIDTH32	; Object $AE - OBJ_BOLTLIFT
	.byte OA1_PAL3 | OA1_HEIGHT32 | OA1_WIDTH32	; Object $AF - OBJ_ENEMYSUN
	.byte OA1_PAL3 | OA1_HEIGHT32 | OA1_WIDTH32	; Object $B0 - OBJ_BIGCANNONBALL
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH48	; Object $B1 - OBJ_FIREJET_RIGHT
	.byte OA1_PAL1 | OA1_HEIGHT48 | OA1_WIDTH16	; Object $B2 - OBJ_FIREJET_UPSIDEDOWN
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $B3

    .org ObjectGroup_PatTableSel
;****************************** OBJECT PATTERN TABLE ******************************
    .byte OPTS_SETPT6 | $13	; Object $A0 - OBJ_PUMPKINFREE
	.byte OPTS_SETPT5 | $13	; Object $A1 - OBJ_PUMPKINFREE_FLIPPED
	.byte OPTS_SETPT6 | $4F	; Object $A2 - OBJ_REDPIRANHA
	.byte OPTS_SETPT6 | $4F	; Object $A3 - OBJ_PIRANHA_AGGRESSIVE
	.byte OPTS_SETPT6 | $13	; Object $A4 - OBJ_PUMPKINPLANT
	.byte OPTS_SETPT6 | $4F	; Object $A5 - OBJ_PUMPKINPLANT_HOPPER
	.byte OPTS_SETPT6 | $4F	; Object $A6 - OBJ_VENUSFIRETRAP
	.byte OPTS_SETPT6 | $4F	; Object $A7 - OBJ_VENUSFIRETRAP_CEIL
	.byte OPTS_SETPT6 | $4F	; Object $A8 - OBJ_OilTRAP
	.byte OPTS_SETPT6 | $4F	; Object $A9 - OBJ_OilTRAP_CEIL
	.byte OPTS_SETPT5 | $36	; Object $AA - OBJ_AIRSHIPPROP
	.byte OPTS_SETPT5 | $36	; Object $AB
	.byte OPTS_SETPT6 | $37	; Object $AC - OBJ_FIREJET_LEFT
	.byte OPTS_SETPT5 | $36	; Object $AD - OBJ_ROCKYWRENCH
	.byte OPTS_SETPT5 | $36	; Object $AE - OBJ_BOLTLIFT
	.byte OPTS_SETPT5 | $37	; Object $AF - OBJ_ENEMYSUN
	.byte OPTS_SETPT5 | $36	; Object $B0 - OBJ_BIGCANNONBALL
	.byte OPTS_SETPT6 | $37	; Object $B1 - OBJ_FIREJET_RIGHT
	.byte OPTS_SETPT6 | $37	; Object $B2 - OBJ_FIREJET_UPSIDEDOWN
	.byte OPTS_SETPT5 | $00	; Object $B3

	.org ObjectGroup_KillAction	
;****************************** OBJECT DEATH ROUTINE ******************************
	.byte KILLACT_POOFDEATH	; Object $A0 - OBJ_PUMPKINFREE
	.byte KILLACT_POOFDEATH	; Object $A1 - OBJ_PUMPKINFREE_FLIPPED
	.byte KILLACT_POOFDEATH	; Object $A2 - OBJ_REDPIRANHA
	.byte KILLACT_POOFDEATH	; Object $A3 - OBJ_PIRANHA_AGGRESSIVE
	.byte KILLACT_NORMALANDKILLED	; Object $A4 - OBJ_PUMPKINPLANT
	.byte KILLACT_POOFDEATH	; Object $A5 - OBJ_PUMPKINPLANT_HOPPER
	.byte KILLACT_POOFDEATH	; Object $A6 - OBJ_VENUSFIRETRAP
	.byte KILLACT_POOFDEATH	; Object $A7 - OBJ_VENUSFIRETRAP_CEIL
	.byte KILLACT_POOFDEATH	; Object $A8 - OBJ_OilTRAP
	.byte KILLACT_POOFDEATH	; Object $A9 - OBJ_OilTRAP_CEIL
	.byte KILLACT_STANDARD	; Object $AA - OBJ_AIRSHIPPROP
	.byte KILLACT_STANDARD	; Object $AB
	.byte KILLACT_STANDARD	; Object $AC - OBJ_FIREJET_LEFT
	.byte KILLACT_NORMALANDKILLED	; Object $AD - OBJ_ROCKYWRENCH
	.byte KILLACT_STANDARD	; Object $AE - OBJ_BOLTLIFT
	.byte KILLACT_NORMALANDKILLED	; Object $AF - OBJ_ENEMYSUN
	.byte KILLACT_NORMALANDKILLED	; Object $B0 - OBJ_BIGCANNONBALL
	.byte KILLACT_STANDARD	; Object $B1 - OBJ_FIREJET_RIGHT
	.byte KILLACT_STANDARD	; Object $B2 - OBJ_FIREJET_UPSIDEDOWN
	.byte KILLACT_NORMALSTATE	; Object $B3


OG9_POff .func (\1 - ObjectGroup09_PatternSets)

	.org ObjectGroup_PatternStarts	; <-- help enforce this table *here*
;****************************** OBJECT FRAME TABLE ******************************
    .byte OG4_POff(ObjPA0), OG4_POff(ObjPA1), OG4_POff(ObjPA2), OG4_POff(ObjPA3)
	.byte OG4_POff(ObjPA4), OG4_POff(ObjPA5), OG4_POff(ObjPA6), OG4_POff(ObjPA7)
	.byte OG4_POff(ObjPA8), OG4_POff(ObjPA9), OG4_POff(ObjPAA), OG4_POff(ObjPAB)
	.byte OG4_POff(ObjPAC), OG4_POff(ObjPAD), OG4_POff(ObjPAE), OG4_POff(ObjPAF)
	.byte OG4_POff(ObjPB0), OG4_POff(ObjPB1), OG4_POff(ObjPB2), OG4_POff(ObjPB3)


	.org ObjectGroup_PatternSets	; <-- help enforce this table *here*
;****************************** OBJECT FRAMES DEFINITION ******************************    
ObjectGroup09_PatternSets:
ObjPA0:
	.byte $F1, $F3, $F5, $F7, $E5, $E7, $E9, $EB

ObjPA1:
ObjPA2:
ObjPA3:
	.byte $E1, $E1, $E3, $E3, $E5, $E5, $E3, $E3
	.byte $F1, $F3, $E3, $E3, $F5, $F7, $E3, $E3

ObjPA4:
	.byte $E5, $E7, $E3, $E3, $E9, $EB, $E3, $E3
	.byte $F1, $F3, $E3, $E3, $F5, $F7, $E3, $E3

ObjPA5:
ObjPA6:
ObjPA7:
ObjPA8:
ObjPA9:
ObjPAA:
	.byte $A9, $71
ObjPAB:
	.byte $A5, $A7
ObjPAC:

ObjPAD:
	.byte $91, $93, $8D, $8F, $89, $8B, $B3, $B5, $97, $9B, $99, $99, $9B, $97, $99, $99

ObjPAE:
	.byte $81, $81, $83, $83, $85, $85, $87, $87	

ObjPAF:
	.byte $81, $83, $83, $81, $A1, $A3, $A3, $A1
	.byte $85, $87, $87, $85, $A5, $A7, $A7, $A5

ObjPB0:
	.byte $A5, $A7, $A5, $A7
	
ObjPB1:
	.byte $8D, $8D, $8F, $8F, $95, $95
ObjPB2:
	.byte $DD, $71, $DF, $71, $D9, $71, $DB, $71, $CD, $D3, $CF, $D5, $71, $71, $71, $71, $CB, $D1
	
ObjPB3:
	.byte $BD, $BD, $BB, $BB, $BD, $BD, $99, $99


PumpkinFree_Action = Objects_Data1
PumpkinFree_Frames = Objects_Data2

ObjInit_PumpkinFree:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_WINDAFFECTS)
	STA Objects_BehaviorAttr, X

	LDA <Objects_XZ, X
	ADD #$08
	STA <Objects_XZ, X

	JMP Object_CalcBoundBox

ObjNorm_PumpkinFree:
	LDA <Player_HaltGameZ
	BEQ PumpkinFree_Norm
	
	JMP PumpkinFree_Draw

PumpkinFree_Norm:

	LDA PumpkinFree_Action, X
	JSR DynJump

	.word PumpkinFree_Wait
	.word PumpkinFree_Attack

PumpkinFree_Wait:
	JSR Object_DeleteOffScreen
	JSR Object_XDistanceFromPlayer
	
	CMP #$28
	BCS PumpkinFree_WaitRTS

	LDA #$20
	STA Objects_Timer, X

	LDA #$C0
	STA <Objects_YVelZ, X

	INC PumpkinFree_Action, X

PumpkinFree_WaitRTS:
	RTS

PumpkinFree_Attack:
	JSR Object_DeleteOffScreen
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

	LDA Objects_Timer, X
	BNE PumpkinFree_Animate

	JSR Object_DetectTiles
	JSR Object_InteractWithTiles

	LDA Objects_PreviousTilesDetect, X
	AND #HIT_GROUND
	BNE PumpkinFree_Animate

	LDA Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ PumpkinFree_Animate

	JSR Object_MoveTowardsPlayerFast

	LDA #$C0
	STA <Objects_YVelZ, X
	
PumpkinFree_Animate:
	INC PumpkinFree_Frames, X
	LDA PumpkinFree_Frames, X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame, X

PumpkinFree_Draw:
	LDA <Objects_XVelZ, X
	BNE PumpkinFree_DrawNorm

	LDA Objects_Frame, X
	ORA #$02
	STA Objects_Frame, X

	LDA Objects_Orientation, X
	ORA #SPR_BEHINDBG
	STA Objects_Orientation, X

	JMP Object_Draw

PumpkinFree_DrawNorm:
	LDA Objects_Orientation, X
	AND #~SPR_BEHINDBG
	STA Objects_Orientation, X

	JMP Object_Draw    


ObjInit_Piranha:
	LDA #$06
	STA Objects_SpritesRequested,X

	LDA #ATTR_STOMPPROOF
	STA Objects_WeaponAttr, X

	LDA #BOUND16x32
	STA Objects_BoundBox, X

	LDA #$03
	STA Piranha_CurrentState, X

	LDA #$02
	STA Piranha_AttackData, X
	STA Objects_ExpPoints, X

	LDA Objects_Property, X
	LSR A
	TAY

	LDA Objects_Property, X
	AND #$01
	TAY
	LDA Piranha_Velocities, Y
	STA <Objects_YVelZ, X

	LDA Piranha_Orientation, Y
	STA Objects_Orientation, X

ObjInit_Piranha1:
	LDA Objects_Property, X
	LSR A
	TAY
	LDA Piranha_Palettes, Y
	STA Objects_SpriteAttributes, X

	LDA #$20
	STA Objects_Timer, X


	LDA <Objects_XZ, X
	ADD #$08
	STA <Objects_XZ, X

	LDA <Objects_YZ, X
	SUB #$01
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	SBC #$00
	STA <Objects_YHiZ, X
	STA Piranha_YHiBackup, X

	INC Piranha_CurrentFrame, X
	RTS

ObjInit_Piranha_Aggressive:
	JMP ObjInit_Piranha


Piranha_CurrentFrame = Objects_Data1
Piranha_CurrentState = Objects_Data3
Piranha_AttacksLeft	= Objects_Data5
Piranha_AttackData = Objects_Data6
Piranha_StateTimer = Objects_Timer
Piranha_YHiBackup = Objects_Data7
Plant_DrawStem = Objects_Data2

Piranha_YVel:
	.byte $F8, $08
	
Piranha_Orientation:
	.byte SPR_BEHINDBG, SPR_VFLIP | SPR_BEHINDBG

Piranha_Palettes:
	.byte SPR_PAL1, SPR_PAL1, SPR_PAL2, SPR_PAL1
	.byte SPR_PAL3, SPR_PAL3, SPR_PAL3, SPR_PAL3

Piranha_Facing:
	.byte $00, SPR_HFLIP

Piranha_Velocities:
	.byte $F0, $10

Piranha_AttackProjectiles:
	.byte $00, SOBJ_FIREBALL, SOBJ_ICEBALL, SOBJ_OIL
	.byte $00, SOBJ_FIREBALL, SOBJ_ICEBALL, SOBJ_OIL

Piranah_AttackNumbers:
	.byte $00, $00, $01, $01, $01, $01, $01, $01
	.byte $00, $00, $03, $03

ObjNorm_Piranha:
	
	LDA <Player_HaltGameZ
	BEQ ObjNorm_Piranha1

	JMP Plant_Draw

ObjNorm_Piranha1:
	JSR Object_DeleteOffScreen
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	
	JSR Object_YDistanceFromPlayer

	JSR Piranha_DoState

	LDA Objects_Property, X
	CMP #$02
	BCC Piranha_Animate

	JSR Object_XDistanceFromPlayer
	
	LDA Objects_Orientation, X
	AND #~SPR_HFLIP
	ORA Piranha_Facing, Y
	STA Objects_Orientation, X

	LDA Piranha_CurrentState, X
	CMP #$01
	BNE Piranha_Animate

	LDA #$03
	STA Piranha_CurrentFrame, X
	BNE Plant_Draw1

Piranha_Animate:
	INC Piranha_CurrentFrame, X
	LDA Piranha_CurrentFrame, X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame,X

Plant_Draw:
	LDA Objects_Property, X
	AND #$0F
	CMP #$02
	BCC Plant_Draw1

	LDA Objects_Frame,X
	ORA #$02
	STA Objects_Frame,X

Plant_Draw1:

	JSR Object_Draw16x32

	LDA #SPR_PAL2
	STA <Temp_Var1

	LDA Objects_ID, X
	CMP #OBJ_PIRANHA_AGGRESSIVE
	BNE Piranha_GreenVine

	LDA #SPR_PAL3
	STA <Temp_Var1

Piranha_GreenVine:
	LDY Object_SpriteRAMOffset, X

	LDA Sprite_RAM + 10, Y
	AND #(SPR_VFLIP | SPR_BEHINDBG)

	ORA <Temp_Var1
	STA Sprite_RAM + 10, Y
	
	ORA #SPR_HFLIP
	STA Sprite_RAM + 14, Y

	LDA Objects_Property, X
	CMP #$02
	BCS Plant_DrawUpsideDown

	LDA Sprite_RAM + 6, Y
	ORA #SPR_HFLIP
	STA Sprite_RAM + 6, Y

	LDA Objects_Orientation, X
	AND #SPR_HFLIP
	BEQ Plant_DrawRTS

	LDA Sprite_RAM + 6, Y
	EOR #SPR_HFLIP
	STA Sprite_RAM + 6, Y

	LDA Sprite_RAMX, Y
	PHA

	LDA Sprite_RAMX+4, Y
	STA Sprite_RAMX, Y

	PLA
	STA Sprite_RAMX+4, Y

Plant_DrawRTS:
	RTS

Piranha_HeadFlips:
	.byte SPR_VFLIP, $00

Plant_DrawUpsideDown:
	LDA Objects_State, X
	CMP #OBJSTATE_FROZEN
	BEQ Plant_DrawRTS

	LDA Objects_ID, X
	CMP #OBJ_PUMPKINPLANT
	BEQ Plant_DrawRTS

	JSR Object_YDistanceFromPlayer
	LDA Piranha_HeadFlips, Y
	STA TempA

	LDY Object_SpriteRAMOffset, X

	LDA Sprite_RAM + 2, Y
	AND #~SPR_VFLIP
	ORA TempA
	STA Sprite_RAM + 2, Y

	LDA Sprite_RAM + 6, Y
	AND #~SPR_VFLIP
	ORA TempA
	STA Sprite_RAM + 6, Y

Plant_DrawUpsideDown1:
	RTS

Piranha_DoState:
	LDA Piranha_CurrentState, X
	JSR DynJump

	.word Piranha_Move
	.word Piranha_Attack
	.word Piranha_Move
	.word Piranha_Wait

Piranha_Wait:
	LDA Piranha_YHiBackup, X
	BPL Piranha_NoDisplace


	LDA <Objects_YHiZ, X
	STA Piranha_YHiBackup, X

	LDA #$FE
	STA <Objects_YHiZ, X

Piranha_NoDisplace:
	LDA Objects_Timer, X
	BNE Piranha_Wait2

	LDA Objects_Property, X
	AND #$01
	BNE Piranha_Wait1  

	JSR Object_XDistanceFromPlayer
	CMP #$18
	BCC Piranha_Wait2

Piranha_Wait1:
	LDA #$00
	STA Piranha_CurrentState, X

	LDA #$00
	STA Plant_DrawStem, X

	LDA #$20
	STA Objects_Timer, X

	LDA Piranha_YHiBackup, X
	STA <Objects_YHiZ, X

	LDA #$FF
	STA Piranha_YHiBackup, X

Piranha_Wait2:
	RTS

Piranha_Move:
	JSR Object_ApplyYVel_NoGravity

	LDA Objects_Timer, X
	BNE Piranha_Move1

	INC Piranha_CurrentState, X

	LDA <Objects_YVelZ, X
	EOR #$FF
	ADD #$01
	STA <Objects_YVelZ, X

	LDA #$40
	STA Objects_Timer, X

	LDA Objects_ID, X
	CMP #OBJ_PIRANHA_AGGRESSIVE
	BNE Piranha_GetAttacks

	LDA #$FF
	BNE Piranha_SetAttacks

Piranha_GetAttacks:
	LDY Objects_Property, X
	LDA Piranah_AttackNumbers, Y

Piranha_SetAttacks:	
	STA Piranha_AttacksLeft, X

	RTS

Piranha_Move1:
	LDA <Objects_YVelZ, X
	BPL Piranha_Move3

	LDA <Objects_YZ, X
	AND #$0E
	CMP #$0E
	BNE Piranha_Move2

	LDA Plant_DrawStem, X
	EOR #$01
	STA Plant_DrawStem, X

Piranha_Move2:
	RTS

Piranha_Move3:
	LDA <Objects_YZ, X
	AND #$0F
	CMP #$0F
	BNE Piranha_Move4

	LDA Plant_DrawStem, X
	EOR #$01
	STA Plant_DrawStem, X

Piranha_Move4:
	RTS


Piranha_Attack:
	LDA Objects_Timer, X
	BEQ Piranha_Attack1

	CMP #$20
	BNE Piranha_Attack2

	LDA Piranha_AttacksLeft, X
	BEQ Piranha_Attack2

	LDA Objects_Property, X
	LSR A
	STA <Temp_Var15
	TAY

	LDA Piranha_AttackProjectiles, Y
	BEQ Piranha_Attack1

	LDA Objects_SpritesVerticallyOffScreen, X
	ORA Objects_SpritesHorizontallyOffScreen, X
	BNE Piranha_AttackReset

	LDA #$08
	STA <Proj_YOff

	LDA Objects_Orientation, X
	AND #SPR_VFLIP
	BEQ Piranha_NoYOff

	LDA #$18
	STA <Proj_YOff

Piranha_NoYOff:

	LDA #$08
	STA <Proj_XOff

	JSR Object_PrepProjectile
	BCC Piranha_Attack1

	JSR Piranha_Projectile
	DEC Piranha_AttacksLeft, X
	BEQ Piranha_NoMoreAttacks

Piranha_AttackReset:	
	LDA #$50
	STA Objects_Timer, X
	RTS

Piranha_NoMoreAttacks:
	LDA #$20
	STA Objects_Timer, X

	LDA #$01
	STA Plant_DrawStem, X
	RTS

Piranha_Attack1:
	LDA Objects_ID, X
	CMP #OBJ_PIRANHA_AGGRESSIVE
	BEQ Piranha_Attack2

	LDA #$20
	STA Objects_Timer, X
	
	INC Piranha_CurrentState, X

Piranha_Attack2:
	RTS

Pumpkin_AttackXVeloc:
	.byte  $20, $E0

Piranha_Projectile:
	LDX <Temp_Var15
	LDA Piranha_AttackProjectiles, X
	STA SpecialObj_ID, Y

	LDX <CurrentObjectIndexZ

	LDA Piranha_AttackData, X
	STA SpecialObj_Data1,Y

	LDA #SND_PLAYERFIRE
	ORA Sound_QPlayer
	STA Sound_QPlayer

	LDA Objects_Property, X
	CMP #$08
	BCC Piranha_FireStraight

	TYA
	PHA

	LDY #$00

	LDA Objects_Orientation, X
	AND #SPR_HFLIP
	BNE Pumpkin_FireRight

	INY

Pumpkin_FireRight:
	PLA
	TAX
	LDA Pumpkin_AttackXVeloc, Y
	STA SpecialObj_XVel, X

	LDA #$E0
	STA SpecialObj_YVel, X
	LDX <CurrentObjectIndexZ
	RTS

Piranha_FireStraight:	
	JSR Object_AimProjectile

Piranha_ProjectileRTS:
	RTS


ObjInit_Pumpkin:
	LDA Objects_Property, X
	ORA #$08
	STA Objects_Property, X

	JSR ObjInit_Piranha

	LDA #SPR_PAL3
	STA Objects_SpriteAttributes, X

	LDA #$00
	STA Piranha_AttackData, X
	RTS


ObjNorm_Pumpkin:
	JSR ObjNorm_Piranha
	
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE ObjNorm_PumpkinRTS

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #$00
	STA Objects_Orientation, X

	LDA #OBJ_PUMPKINFREE
	STA Objects_ID, X

	LDA #$01
	STA PumpkinFree_Action, X

	LDA #$00
	STA Objects_Timer, X
	STA <Objects_XVelZ, X

	LDA #$E0
	STA <Objects_YVelZ, X

ObjNorm_PumpkinRTS:
	RTS	

ObjInit_Sun:
	LDA DayNight
	EOR #$FF
	STA Objects_Data4, X
	RTS		 ; Return

SunMoonPalette:
	.byte SPR_PAL3, SPR_PAL1

SunMoonDayEnemies:
	.byte OBJ_GOOMBA, OBJ_PARAGOOMBA, OBJ_PIRANHA, OBJ_GREENTROOPA,  OBJ_BEACHEDCHEEP, OBJ_PUMPKINFREE

SunMoonDayEnemyPals:
	.byte SPR_PAL3, SPR_PAL3, SPR_PAL1, SPR_PAL2, SPR_PAL1, SPR_PAL2

SunMoonDayEnemyStates:
	.byte OBJSTATE_INIT, OBJSTATE_NORMAL, OBJSTATE_NORMAL, OBJSTATE_INIT, OBJSTATE_INIT,  OBJSTATE_POOFDEATH

SunMoonNightEnemies:
	.byte OBJ_ZOMBIEGOOMBA, OBJ_PARAZOMBIEGOOMBA, OBJ_PUMPKINPLANT, OBJ_DRYBONES, OBJ_SPECTERCHEEP, OBJ_PUMPKINFREE

SunMoonNightEnemyPals:
	.byte SPR_PAL2, SPR_PAL3, SPR_PAL3, SPR_PAL2, SPR_PAL2, SPR_PAL2

SunMoonNightEnemyStates:
	.byte OBJSTATE_NORMAL, OBJSTATE_NORMAL, OBJSTATE_NORMAL, OBJSTATE_INIT, OBJSTATE_NORMAL, OBJSTATE_POOFDEATH

SunMoonGraphics:
	.byte $7C, $00, $7E
	
ObjNorm_Sun:
	
	LDA <Player_HaltGameZ
	BEQ ObjNorm_Sun0
	JMP DrawSunMoon

ObjNorm_Sun0:
	LDA DayNight
	BMI ObjNorm_Sun0_1

	JSR ToDayEnemies
	JMP ObjNorm_Sun0_2

ObjNorm_Sun0_1:
	JSR ToNightEnemies

ObjNorm_Sun0_2:
	JSR Object_InteractWithPlayer
	INC Game_Timer_Tick
	INC Game_Timer_Tick
	INC Game_Timer_Tick
	INC Game_Timer_Tick
	INC Game_Timer_Tick
	CLC
	LDA #$00
	STA TempA
	LDY DayNightTicker
	BEQ ObjNorm_Sun3

ObjNorm_Sun2:
	LDA #$14
	ADC TempA
	STA TempA
	DEY
	BNE ObjNorm_Sun2

ObjNorm_Sun3:
	LDY DayNightMicroTicker
	BEQ ObjNorm_Sun5

ObjNorm_Sun4:
	LDA #$02
	ADC TempA
	STA TempA
	DEY
	BNE ObjNorm_Sun4

ObjNorm_Sun5:
	LDA Game_Timer_Tick
	CMP #$1E
	BCC ObjNorm_Sun6

	INC TempA

ObjNorm_Sun6:
	LDA <Horz_Scroll
	SUB #$04
	STA <Temp_Var1
	LDA <Horz_Scroll_Hi
	SBC #$00
	STA <Temp_Var2
	LDA <Temp_Var1
	ADC TempA
	STA <Objects_XZ,X
	LDA #$00
	ADC <Temp_Var2
	STA <Objects_XHiZ, X

	LDA <Vert_Scroll
	ADD #$00
	STA <Objects_YZ, X
	LDA <Vert_Scroll_Hi
	ADC #$00
	STA <Objects_YHiZ, X

DrawSunMoon:
	LDY #$00
	LDA DayNight
	BEQ DrawSunMoon1

	INY

DrawSunMoon1:
	LDA SunMoonPalette, Y
	ORA #SPR_BEHINDBG
	STA Objects_SpriteAttributes, X
	TYA
	STA Objects_Frame, X

	LDA #LOW(ObjPAF)
	STA <Temp_Var10
	LDA #HIGH(ObjPAF)
	STA <Temp_Var11

	JMP Object_DrawGiantMirrored

ToNightEnemies:
	LDX #$04

ToNightEnemies1:
	LDA Objects_State, X
	BEQ ToNightEnemies4

	CMP #OBJSTATE_NORMAL
	BCC ToNightEnemies2

	CMP #OBJSTATE_KILLED
	BCS ToNightEnemies4


ToNightEnemies2:
	LDA #OBJSTATE_POOFDEATH
	STA Objects_State, X

	LDA #$1f
	STA Objects_Timer,X
	BNE ToNightEnemies4

ToNightEnemies3:
	LDY #$04

ToNightEnemies3_0:
	LDA Objects_ID, X
	CMP SunMoonDayEnemies, Y
	BNE ToNightEnemies3_1

	LDA SunMoonNightEnemies, Y
	STA Objects_ID, X

	LDA SunMoonNightEnemyStates, Y
	STA Objects_State, X

	LDA SunMoonNightEnemyPals, Y
	STA Objects_SpriteAttributes, X
	BNE ToNightEnemies4

ToNightEnemies3_1:
	DEY
	BPL ToNightEnemies3_0

ToNightEnemies4:
	DEX
	BPL ToNightEnemies1
	LDX <CurrentObjectIndexZ
	RTS

ToDayEnemies:
	LDX #$04

ToDayEnemies1:
	LDA Objects_State, X
	BEQ ToDayEnemies4

	CMP #OBJSTATE_NORMAL
	BCC ToDayEnemies2

	CMP #OBJSTATE_KILLED
	BCS ToDayEnemies4

ToDayEnemies2:
ToDayEnemies3:
	LDY #$05

ToDayEnemies3_0:
	LDA Objects_ID, X
	CMP SunMoonNightEnemies, Y
	BNE ToDayEnemies3_1

	LDA SunMoonDayEnemies, Y
	STA Objects_ID, X

	LDA SunMoonDayEnemyStates, Y
	STA Objects_State, X

	CMP #OBJSTATE_POOFDEATH
	BNE ToDayEnemies3_1_1

	LDA #$1F
	STA Objects_Timer, X

ToDayEnemies3_1_1:

	LDA SunMoonDayEnemyPals, Y
	STA Objects_SpriteAttributes, X 
	BNE ToDayEnemies4

ToDayEnemies3_1:
	DEY
	BPL ToDayEnemies3_0

ToDayEnemies4:
	DEX
	BPL ToDayEnemies1
	LDX <CurrentObjectIndexZ
	RTS    