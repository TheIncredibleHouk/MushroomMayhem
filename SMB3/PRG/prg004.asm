    .org ObjectGroup_InitJumpTable
;****************************** OBJECT INITIALIZATION ******************************
    
OBJ_GOOMBA    		= $3C
OBJ_PARAGOOMBA 		= $3D
OBJ_GREENTROOPA 	= $3E
OBJ_REDTROOPA		= $3F
OBJ_PURPLETROOPA	= $40
OBJ_BOUNCYTROOPA	= $41
OBJ_PARATROOPA		= $42
OBJ_JUMPINGCHEEP	= $43
OBJ_SWIMMINGCHEEP	= $44
OBJ_PIRANHAPLANT	= $45
OBJ_PIRANHAPLANTGOLD = $46
OBJ_ZOOMBA			= $47
OBJ_DRYBONES		= $48
OBJ_PIRUMPKIN		= $49
OBJ_PIRUMPKINHEAD	= $4A
OBJ_DRYCHEEP		= $4B
OBJ_GREENPIRANHA	= $4C

    .word ObjInit_Goomba    ; Object $3C
	.word ObjInit_ParaGoomba ; Object $3D
	.word ObjInit_Troopa ; Object $3E
	.word ObjInit_Troopa ; Object $3F
	.word ObjInit_PurpleTroopa ; Object $40
	.word ObjInit_BouncyTroopa ; Object $41
	.word ObjInit_ParaTroopa ; Object $42
	.word ObjInit_BeachedCheep  Object $43
	.word ObjInit_SwimmingCheep ; Object $44
	.word ObjInit_Piranha ; Object $45
	.word ObjInit_Piranha_Aggressive; Object $46
	.word ObjInit_ZombieGoomba ; Object $47
	.word ObjInit_DryBones ; Object $48
	.word ObjInit_Pumpkin ; Object $49
	.word ObjInit_PumpkinFree ; Object $4A
	.word ObjInit_DryCheep ; Object $4B
	.word ObjInit_PiranhaGrower ; Object $4C
	.word ObjInit_DoNothing ; Object $4D
	.word ObjInit_DoNothing ; Object $4E
	.word ObjInit_DoNothing ; Object $4F


	.org ObjectGroup_NormalJumpTable	; <-- help enforce this table *here*
;****************************** OBJECT GAME LOOP ******************************
    .word ObjNorm_Goomba   ; Object $3C
	.word ObjNorm_ParaGoomba ; Object $3D
	.word ObjNorm_GreenTroopa ; Object $3E
	.word ObjNorm_RedTroopa ; Object $3F
	.word ObjNorm_PurpleTroopa ; Object $40
	.word ObjNorm_BouncyTroopa ; Object $41
	.word ObjNorm_ParaTroopa ; Object $42
	.word ObjNorm_BeachedCheep ; Object $43
	.word ObjNorm_SwimmingCheep ; Object $44
	.word ObjNorm_Piranha ; Object $45
	.word ObjNorm_Piranha; Object $46
	.word ObjNorm_ZombieGoomba ; Object $47
	.word ObjNorm_DryBones ; Object $48
	.word ObjNorm_Pumpkin; Object $49
	.word ObjNorm_PumpkinFree ; Object $4A
	.word ObjNorm_DryCheep ; Object $4B
	.word ObjNorm_PiranhaGrower ; Object $4C
	.word ObjNorm_DoNothing ; Object $4D
	.word ObjNorm_DoNothing ; Object $4E
	.word ObjNorm_DoNothing ; Object $4F

	.org ObjectGroup_CollideJumpTable	; <-- help enforce this table *here*
;****************************** OBJECT PLAYER INTERACTION ******************************
    .word Player_GetHurt	    ; Object $3C
	.word OCSPECIAL_KILLCHANGETO | OBJ_GOOMBA ; Object $3D
	.word Object_Hold ; Object $3E
	.word Object_Hold ; Object $3F
	.word Object_Hold ; Object $40
	.word OCSPECIAL_KILLCHANGETO | OBJ_GREENTROOPA ; Object $41
	.word OCSPECIAL_KILLCHANGETO | OBJ_REDTROOPA ; Object $42
	.word Player_GetHurt ; Object $43
	.word Player_GetHurt ; Object $44
	.word Player_GetHurt ; Object $45
	.word Player_GetHurt; Object $46
	.word ZombieGoomba_Infect ; Object $47
	.word Player_GetHurt ; Object $48
	.word Player_GetHurt ; Object $49
	.word Player_GetHurt ; Object $4A
	.word Player_GetHurt ; Object $4B
	.word Player_GetHurt ; Object $4C
	.word ObjHit_DoNothing ; Object $4D
	.word ObjHit_DoNothing ; Object $4E
	.word ObjHit_DoNothing ; Object $4F

	.org ObjectGroup_Attributes	; <-- help enforce this table *here*
;****************************** OBJECT PALETTE/SIZE ******************************
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $3C
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $3D
	.byte OA1_PAL2 | OA1_HEIGHT32 | OA1_WIDTH16	 ; Object $3E
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16 ; Object $3F
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16 ; Object $40
	.byte OA1_PAL2 | OA1_HEIGHT32 | OA1_WIDTH16 ; Object $41
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16 ; Object $42
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $43
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $44
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16 ; Object $45
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16; Object $46
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $47
	.byte OA1_PAL2 | OA1_HEIGHT32 | OA1_WIDTH16; Object $48
	.byte OA1_PAL2 | OA1_HEIGHT32 | OA1_WIDTH16 ; Object $49
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $4A
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $4B
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $4C
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $4D
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $4E
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $4F

	.org ObjectGroup_PatTableSel	; <-- help enforce this table *here*
;****************************** OBJECT PATTERN TABLE ******************************
    .byte OPTS_SETPT6 | $4F	      ; Object $3C
	.byte OPTS_SETPT6 | $4F	; Object $3D
	.byte OPTS_SETPT6 | $4F	; Object $3E
	.byte OPTS_SETPT6 | $4F	 ; Object $3F
	.byte OPTS_SETPT6 | $4F	; Object $40
	.byte OPTS_SETPT6 | $4F ; Object $41
	.byte OPTS_SETPT6 | $4F	; Object $42
	.byte OPTS_SETPT6 | $4F ; Object $43
	.byte OPTS_SETPT6 | $4F ; Object $44
	.byte OPTS_SETPT6 | $4F ; Object $45
	.byte OPTS_SETPT6 | $4F ; Object $46
	.byte OPTS_SETPT6 | $13 ; Object $47
	.byte OPTS_SETPT6 | $13 ; Object $48
	.byte OPTS_SETPT6 | $13 ; Object $49
	.byte OPTS_SETPT6 | $13 ; Object $4A
	.byte OPTS_SETPT5 | $0A ; Object $4B
	.byte OPTS_SETPT5 | $0B ; Object $4C
	.byte OPTS_NOCHANGE ; Object $4D
	.byte OPTS_NOCHANGE ; Object $4E
	.byte OPTS_NOCHANGE ; Object $4F

	.org ObjectGroup_KillAction	; <-- help enforce this table *here*
;****************************** OBJECT DEATH ROUTINE ******************************
	.byte KILLACT_POOFDEATH		; Object $3C
	.byte KILLACT_POOFDEATH 	; Object $3D
	.byte KILLACT_POOFDEATH 	; Object $3E
	.byte KILLACT_POOFDEATH 	; Object $3F
	.byte KILLACT_POOFDEATH 	; Object $40
	.byte KILLACT_POOFDEATH 	; Object $41
	.byte KILLACT_POOFDEATH 	; Object $42
	.byte KILLACT_POOFDEATH 	; Object $43
	.byte KILLACT_POOFDEATH 	; Object $44
	.byte KILLACT_POOFDEATH 	; Object $45
	.byte KILLACT_POOFDEATH 	; Object $46
	.byte KILLACT_POOFDEATH 	; Object $47
	.byte KILLACT_POOFDEATH 	; Object $48
	.byte KILLACT_NORMALANDKILLED 	; Object $49
	.byte KILLACT_POOFDEATH 	; Object $4A
	.byte KILLACT_POOFDEATH 	; Object $4B
	.byte KILLACT_NORMALANDKILLED 	; Object $4C
	.byte KILLACT_POOFDEATH 	; Object $4D
	.byte KILLACT_POOFDEATH 	; Object $4E
	.byte KILLACT_POOFDEATH 	; Object $4F

OG4_POff .func (\1 - ObjectGroup04_PatternSets)

	.org ObjectGroup_PatternStarts	; <-- help enforce this table *here*

	; Index by object group relative index (ObjGroupRel_Idx)
	.byte OG4_POff(ObjP3C), OG4_POff(ObjP3D), OG4_POff(ObjP3E), OG4_POff(Obj3F)
	.byte OG4_POff(ObjP40), OG4_POff(ObjP41), OG4_POff(ObjP42), OG4_POff(Obj41)
	.byte OG4_POff(ObjP44), OG4_POff(ObjP45), OG4_POff(ObjP46), OG4_POff(Obj47)
	.byte OG4_POff(ObjP48), OG4_POff(ObjP49), OG4_POff(ObjP4A), OG4_POff(Obj4B)
	.byte OG4_POff(ObjP4C), OG4_POff(ObjP4D), OG4_POff(ObjP4E), OG4_POff(Obj4F)

ObjectGroup04_PatternSets:

ObjP3C:
ObjP3D:
	.byte $D9, $DB, $DB, $D9

ObjP3E:
ObjP3F:
ObjP40:
ObjP41:
ObjP42:
	.byte $C3, $C5, $C7, $C9
	.byte $FD, $FD, $FD, $FD
	.byte $FD, $FD, $D1, $D1
	.byte $D3, $D5, $D5, $D3
	.byte $CB, $C5, $F9, $FB

ObjP43:
	.byte $E7, $E9, $E7, $EF

ObjP44:
	.byte $E7, $E9, $E7, $EF

ObjP45:
ObjP46:
	.byte $E1, $E1, $E3, $E3, $E5, $E5, $E3, $E3
	.byte $F1, $F3, $E3, $E3, $F5, $F7, $E3, $E3

ObjP47:
	.byte $81, $83

ObjP48:
	.byte $C1, $C3, $C5, $C7
	.byte $C9, $CB, $CD, $CF
	.byte $71, $D1, $D3, $D5
	.byte $71, $71, $DD, $DF

ObjP49:
	.byte $E5, $E7, $E3, $E3, $E9, $EB, $E3, $E3
	.byte $F1, $F3, $E3, $E3, $F5, $F7, $E3, $E3

ObjP4A:
	.byte $F1, $F3, $F5, $F7, $E5, $E7, $E9, $EB

ObjP4B:
	.byte $91, $93, $91, $9B, $91, $9B 

ObjP4C:
	.byte $E1, $E1, $E5, $E5, $B9, $B7, $BF, $BB, $B3, $B3, $B5, $B5, $B7, $B9, $BB, $BF   

ObjP4D:
ObjP4E:
ObjP4F:



ObjInit_Goomba:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_WINDAFFECTS | ATTR_CARRYANDBUMP)
	STA Objects_BehaviorAttr, X

	JSR Object_CalcBoundBox

	LDA <Objects_XVelZ, X
	BNE GoombaInit_NoMove

	JSR Object_MoveTowardsPlayer

GoombaInit_NoMove:
	LDA Objects_Property, X
	BEQ ObjInit_Goomba1

	LDA #SPR_VFLIP
	STA Objects_Orientation, X

ObjInit_Goomba1:
	RTS

Goomba_Action = Objects_Data1
Goomba_CurrentFrame = Objects_Data2
Goomba_DeathTimer = Objects_Data3
Goomba_BehindTimer = Objects_Data4

Goomba_CappedMovement:
	.byte $08, $F8

ObjNorm_Goomba:
	LDA <Player_HaltGameZ
	BEQ Goomba_DoAction
	JMP Goomba_Draw

Goomba_DoAction:

	LDA Goomba_Action, X
	JSR DynJump

	.word Goomba_Norm
	.word Goomba_Left
	.word Goomba_Right
	.word Goomba_Raise
	.word Goomba_Drop

Goomba_Raise:
	LDA Objects_Timer, X
	BEQ Goomba_PopOut

	CMP #$20
	BCC Goomba_RaiseDone

	LDA #$F0
	STA <Objects_YVelZ, X

	JSR Object_ApplyYVel_NoGravity
	JMP Goomba_Animate

Goomba_PopOut:
	JSR Object_CalcBoundBox
	JSR Object_MoveTowardsPlayer
	
	LDA #$D0
	STA <Objects_YVelZ, X

	LDA #$00
	STA Goomba_Action, X

	LDA #$08
	STA Goomba_BehindTimer, X

Goomba_RaiseDone:
	JMP Goomba_Animate

Goomba_Drop:
	LDA Objects_Timer, X
	BEQ Goomba_DropDown

	CMP #$20
	BCC Goomba_DropDone

	LDA #$10
	STA <Objects_YVelZ, X
	JSR Object_ApplyYVel_NoGravity
	JMP Goomba_Animate

Goomba_DropDown:
	JSR Object_CalcBoundBox
	
	LDA #$01
	STA <Objects_YVelZ, X

	LDA #$00
	STA Goomba_Action, X

	LDA #$08
	STA Goomba_BehindTimer, X

Goomba_DropDone:
	JMP Goomba_Animate

Goomba_Left:
	LDA Objects_Timer, X
	CMP #$10
	BEQ Goomba_Out

	LDA #$F8
	STA <Objects_XVelZ, X
	JSR Object_ApplyXVel

	LDA #$00
	STA Objects_Orientation, X

	JMP Goomba_Animate

Goomba_Right:
	LDA Objects_Timer, X
	CMP #$0A
	BEQ Goomba_Out

	LDA #$08
	STA <Objects_XVelZ, X
	JSR Object_ApplyXVel

	LDA #SPR_HFLIP
	STA Objects_Orientation, X

	JMP Goomba_Animate

Goomba_Out:
	LDA #$00
	STA Goomba_Action, X

	LDA #$08
	STA Goomba_BehindTimer, X
	JMP Goomba_Animate

Goomba_Norm:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED

	BNE ObjNorm_Goomba0
	JMP Goomba_Death
	
ObjNorm_Goomba0:
	JSR Object_DeleteOffScreen

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ Goomba_MovementCapped

	LDY #$00
	
	LDA <Objects_XVelZ, X
	BPL Goomba_CheckSpeed

	INY

Goomba_CheckSpeed:	
	CMP #$08
	BCC Goomba_MovementCapped

	CMP #$F8
	BCS Goomba_MovementCapped

	LDA Goomba_CappedMovement, Y
	STA <Objects_YVelZ, X

Goomba_MovementCapped:
	LDA DayNight
	BNE ObjNorm_Goomba1

	JSR Object_FacePlayerOnLanding

ObjNorm_Goomba1:
	LDA Objects_Property, X
	BEQ ObjNorm_Goomba02

	STA Reverse_Gravity

ObjNorm_Goomba02:

	JSR Object_Move
	JSR Object_CalcBoundBox	
	JSR Object_AttackOrDefeat
	JSR Object_InteractWithObjects
	BCS Goomba_Draw

	JSR Object_DetectTiles
	JSR Object_InteractWithTiles

Goomba_Animate:
	INC Goomba_CurrentFrame, X
	LDA Goomba_CurrentFrame, X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame,X

Goomba_Draw:
	LDA Goomba_Action, X
	ORA Goomba_BehindTimer, X
	BEQ Goomba_NotBehind

	LDA Objects_SpriteAttributes, X
	ORA #SPR_BEHINDBG
	STA Objects_SpriteAttributes, X

	LDA Goomba_BehindTimer, X
	BEQ Goomba_NotBehind

	DEC Goomba_BehindTimer, X

Goomba_NotBehind:
	LDA Objects_Orientation, X
	ORA #SPR_HFLIP
	EOR #SPR_HFLIP
	STA Objects_Orientation, X

	JSR Object_Draw
	LDA Sprite_RAM + 2, Y
	EOR #SPR_HFLIP
	STA Sprite_RAM + 6, Y

	RTS

Goomba_Death:
	LDA Objects_Health, X
	BPL Goomba_Death1
	JMP Goomba_Draw
	 
Goomba_Death1:
	INC Goomba_DeathTimer, X
	LDA Goomba_DeathTimer, X
	CMP #20
	BNE Goomba_Death2

	JMP Object_SetDeadEmpty

Goomba_Death2:
	LDA #$03
	STA Objects_Frame, X
	
	LDA #$00
	STA <Objects_YVelZ, X

	LDA #$00
	STA Objects_Orientation, X
	JMP Object_DrawMirrored


ObjInit_ParaGoomba:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #$02
	STA Objects_ExpPoints, X

	LDA #(ATTR_WINDAFFECTS | ATTR_CARRYANDBUMP)
	STA Objects_BehaviorAttr, X

	LDA #$04
	STA Objects_SpritesRequested, X

	JSR Object_CalcBoundBox
	JSR Object_MoveTowardsPlayer
	LDA #$80
	STA Objects_Timer, X
	RTS

ObjNorm_ParaGoomba:
	JSR ObjNorm_Goomba

	LDA Objects_State, X
	CMP #OBJSTATE_NORMAL
	BEQ ObjNorm_ParaGoomba1
	RTS

ObjNorm_ParaGoomba1:
	LDA <Player_HaltGameZ
	BNE ObjNorm_ParaGoomba2

	LDA Objects_Data5, X
	BNE ObjNorm_ParaGoomba4

	LDA Objects_Timer, X
	BNE ObjNorm_ParaGoomba2

	LDA  <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ ObjNorm_ParaGoomba3

	LDA #$00
	STA Objects_Data3, X
	INC Objects_Data5, X
	BNE ObjNorm_ParaGoomba2

ObjNorm_ParaGoomba2:
	CMP #$10
	BCS ObjNorm_ParaGoomba3

	LDA #$04
	STA Objects_Data3, X
	JMP ParaGoomba_Animate

ObjNorm_ParaGoomba3:
	LDA #$00
	STA Objects_Data3, X

	LDA  <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BNE ObjNorm_ParaGoomba31

	LDA #$04
	STA Objects_Data3, X

ObjNorm_ParaGoomba31:
	JMP ParaGoomba_Animate

ObjNorm_ParaGoomba4:
	INC Objects_Data3, X
	LDA Objects_Data3, X
	CMP #$30
	BCS ObjNorm_ParaGoomba5

ObjNorm_ParaGoomba41:

	LDA #$F0
	STA <Objects_YVelZ, X

	JMP ParaGoomba_Animate

ObjNorm_ParaGoomba5:
	LDY DayNight
	BPL ObjNorm_ParaGoomba51

	CMP #$40
	BCS ObjNorm_ParaGoomba51

	LDA #$00
	STA <Objects_YVelZ, X
	JMP ParaGoomba_Animate

ObjNorm_ParaGoomba51:
	LDA #$00
	STA Objects_Data5, X
	STA Objects_Data3, X
	LDA #$80
	STA Objects_Timer, X

ObjNorm_ParaGoomba6:
	JMP ParaGoomba_Animate

ObjNorm_ParaGoomba7:
	JMP ParaGoomba_Animate

ParaGoomba_Animate:
	LDY Object_SpriteRAMOffset,X	 ; Y = Sprite_RAM offset

	; Left wing
	LDA Sprite_RAM+$00,Y
	CMP #$f8
	BEQ PRG004_AF31	 ; If this sprite is vertically off-screen, jump to PRG004_AF31

	SUB #10
	STA Sprite_RAM+$08,Y

PRG004_AF31:

	; Right wing
	LDA Sprite_RAM+$04,Y
	CMP #$f8
	BEQ PRG004_AF3E	 ; If this sprite is vertically off-screen, jump to PRG004_AF3E

	SUB #10
	STA Sprite_RAM+$0C,Y

PRG004_AF3E:

	; Left wing sprite X
	LDA Sprite_RAM+$03,Y
	SUB #$02
	STA Sprite_RAM+$0B,Y

	; Right wing sprite X
	LDA Sprite_RAM+$07,Y
	ADD #$02
	STA Sprite_RAM+$0F,Y

	; Left wing attribute
	LDA Objects_SpriteAttributes, X
	AND #SPR_BEHINDBG
	ORA #SPR_PAL1
	STA Sprite_RAM+$0E,Y

	ORA #SPR_HFLIP
	STA Sprite_RAM+$0A,Y

	; Right wing attribute
	
	

	LDA Objects_Data3,X

	LDX #$cd	 ; X = $CD (Wing up pattern)
	AND #$04	 
	BNE PRG004_AF65	 ; 8 ticks on, 8 ticks off; jump to PRG004_AF65

	LDX #$cf	 ; X = $CF (Wing down pattern)

PRG004_AF65:
	TXA		 
	STA Sprite_RAM+$09,Y	 ; Store left wing pattern
	STA Sprite_RAM+$0D,Y	 ; Store right wing pattern

	LDX <CurrentObjectIndexZ		 ; X = object slot index

	RTS		 ; Return


ObjInit_Troopa:
	LDA #$05
	STA Objects_SpritesRequested, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_WINDAFFECTS | ATTR_HASSHELL | ATTR_CARRYANDBUMP)
	STA Objects_BehaviorAttr, X

	JSR Object_CalcBoundBox
	JSR Object_MoveTowardsPlayer
	LDA <Objects_YZ, X
	ADD #$10
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	ADC #$00
	STA <Objects_YHiZ, X

	LDA #$01
	STA Objects_Health, X

	LDA #$02
	STA Objects_ExpPoints, X
	RTS


Troopa_CurrentFrame = Objects_Data1
Troopa_FrameOffset = Objects_Data2
ParaTroopa_WingFrame = Objects_Data3


ObjNorm_GreenTroopa:
	LDA <Player_HaltGameZ
	BEQ Troopa_Norm
	JMP Troopa_Draw

Troopa_Norm:
	JSR Object_DeleteOffScreen
	JSR Object_Move
	JSR Object_FaceDirectionMoving
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_InteractWithObjects
	BCS Troopa_Animate

	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	JSR Object_EdgeMarch
	JMP Troopa_Animate

Troopa_Frames:
	.byte $00, $04

Troopa_WingFrames:
	.byte $CD, $CF

Troopa_YOffset:
	.byte $06, $05		

Troopa_Animate:
	INC Troopa_CurrentFrame, X
	
	LDA Troopa_CurrentFrame, X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA ParaTroopa_WingFrame, X
	TAY	

	LDA Troopa_Frames, Y
	STA Objects_Frame,X

	LDA Troopa_YOffset, Y
	STA Troopa_FrameOffset, X
	

Troopa_Draw:
	LDA <Objects_YZ, X
	SUB Troopa_FrameOffset, X	
	STA <Objects_YZ, X

	JSR Object_Draw16x32

	LDA <Objects_YZ, X
	ADD Troopa_FrameOffset, X	
	STA <Objects_YZ, X

	LDY Object_SpriteRAMOffset, X

	LDA #$C1
	STA Sprite_RAMTile + 16, Y

	LDA Objects_Orientation, X
	AND #SPR_HFLIP
	BNE Troopa_ColorFixFlip

	LDA Sprite_RAMX, Y
	STA Sprite_RAMX + 16, Y

	LDA Sprite_RAMY, Y
	SUB #$10
	STA Sprite_RAMY + 16, Y

	LDA Sprite_RAMAttr, Y
	ORA #SPR_PAL3
	STA Sprite_RAMAttr, Y
	STA Sprite_RAMAttr+8, Y
	STA Sprite_RAMAttr+12, Y
	STA Sprite_RAMAttr+16, Y
	RTS
	
Troopa_ColorFixFlip:	
	LDA Sprite_RAMY + 4, Y
	SUB #$10
	STA Sprite_RAMY + 16, Y

	LDA Sprite_RAMX + 4, Y
	STA Sprite_RAMX + 16, Y

	LDA Sprite_RAMAttr + 4, Y
	ORA #SPR_PAL3
	STA Sprite_RAMAttr + 4, Y
	STA Sprite_RAMAttr+8, Y
	STA Sprite_RAMAttr+12, Y
	STA Sprite_RAMAttr+16, Y
	RTS	


ObjNorm_RedTroopa:
	LDA <Player_HaltGameZ
	BEQ RedTroopa_Norm
	JMP Troopa_Draw

RedTroopa_Norm:
	JSR Object_DeleteOffScreen
	JSR Object_Move
	JSR Object_FaceDirectionMoving
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_InteractWithObjects
	BCS RedTroopa_Animate

	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	JSR Object_EdgeMarch

RedTroopa_Animate:
	JMP Troopa_Animate


ObjInit_PurpleTroopa:
	LDA #$05
	STA Objects_SpritesRequested, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_WINDAFFECTS | ATTR_HASSHELL | ATTR_CARRYANDBUMP)
	STA Objects_BehaviorAttr, X

	JSR Object_CalcBoundBox
	JSR Object_MoveTowardsPlayer
	LDA <Objects_YZ, X
	ADD #$10
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	ADC #$00
	STA <Objects_YHiZ, X

	LDA #$01
	STA Objects_Health, X

	LDA #$02
	STA Objects_ExpPoints, X
	RTS


PurpleKoopa_CurrentFrame = Objects_Data1
PurpleTroopa_FrameOffset = Objects_Data2

ObjNorm_PurpleTroopa:
	LDA <Player_HaltGameZ
	BEQ PurpleTroopa_Norm
	JMP PurpleTroopa_Draw

PurpleTroopa_Norm:
	JSR Object_DeleteOffScreen
	JSR Object_Move
	JSR Object_FaceDirectionMoving
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_InteractWithObjects
	BCS PurpleTroopa_Animate

	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	JSR Object_EdgeMarch

PurpleTroopa_Animate:
	INC PurpleKoopa_CurrentFrame, X
	
	LDA PurpleKoopa_CurrentFrame, X
	LSR A
	LSR A
	LSR A
	AND #$01
	TAY	

	LDA Troopa_Frames, Y
	STA Objects_Frame,X

	LDA Troopa_YOffset, Y
	STA PurpleTroopa_FrameOffset, X
	

PurpleTroopa_Draw:
	LDA <Objects_YZ, X
	SUB PurpleTroopa_FrameOffset, X	
	STA <Objects_YZ, X

	JSR Object_Draw16x32

	LDA <Objects_YZ, X
	ADD PurpleTroopa_FrameOffset, X	
	STA <Objects_YZ, X

	LDY Object_SpriteRAMOffset, X

	LDA #$C1
	STA Sprite_RAMTile + 16, Y

	LDA Objects_Orientation, X
	AND #SPR_HFLIP
	BNE PurpleTroopa_ColorFixFlip

	LDA Sprite_RAMX, Y
	STA Sprite_RAMX + 16, Y

	LDA Sprite_RAMY, Y
	SUB #$10
	STA Sprite_RAMY + 16, Y

	LDA Sprite_RAMAttr, Y
	ORA #SPR_PAL3
	STA Sprite_RAMAttr, Y
	STA Sprite_RAMAttr+8, Y
	STA Sprite_RAMAttr+12, Y
	STA Sprite_RAMAttr+16, Y
	RTS
	
PurpleTroopa_ColorFixFlip:	
	LDA Sprite_RAMY + 4, Y
	SUB #$10
	STA Sprite_RAMY + 16, Y

	LDA Sprite_RAMX + 4, Y
	STA Sprite_RAMX + 16, Y

	LDA Sprite_RAMAttr + 4, Y
	ORA #SPR_PAL3
	STA Sprite_RAMAttr + 4, Y
	STA Sprite_RAMAttr+8, Y
	STA Sprite_RAMAttr+12, Y
	STA Sprite_RAMAttr+16, Y
	RTS	


ObjInit_BouncyTroopa:
	JSR ObjInit_Troopa
	
	LDA #$06
	STA Objects_SpritesRequested, X
	RTS

Bouncey_FlutterTime: = Objects_Data9

ObjNorm_BouncyTroopa:
	LDA <Player_HaltGameZ
	BEQ ObjNorm_BouncyTroopa0

	JMP ParaTroopa_Draw

ObjNorm_BouncyTroopa0:
	LDA Objects_InWater, X
	BEQ Bouncy_NotWater

	LDA #$00
	STA <Objects_YVelZ, X

Bouncy_NotWater:
	LDA  <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ ObjNorm_BouncyTroopa1

	LDA Objects_PreviousTilesDetect, X
	AND #HIT_GROUND
	BNE ObjNorm_BouncyTroopa1

	LDA #$00
	STA Bouncey_FlutterTime, X

	LDA #$C0
	STA Objects_YVelZ, X
	BNE ObjNorm_BouncyTroopa2

ObjNorm_BouncyTroopa1:
	LDA DayNight
	BPL ObjNorm_BouncyTroopa2

	LDA <Objects_YVelZ, X
	BMI ObjNorm_BouncyTroopa2

	LDA Bouncey_FlutterTime, X
	CMP #$10
	BCS ObjNorm_BouncyTroopa2

	INC Bouncey_FlutterTime, X
	LDA #$00
	STA Objects_YVelZ, X

ObjNorm_BouncyTroopa2:
	
	JSR Object_DeleteOffScreen
	JSR Object_Move
	JSR Object_FaceDirectionMoving
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_InteractWithObjects
	BCS ObjNorm_BouncyTroopa3

	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	
ObjNorm_BouncyTroopa3:
	JMP ParaTroopa_Animate



ParaTroopa_StartX = Objects_Data6

ObjInit_ParaTroopa:
	LDA #$06
	STA Objects_SpritesRequested, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #$01
	STA Objects_Health, X

	LDA #$02
	STA Objects_ExpPoints, X

	LDA #(ATTR_WINDAFFECTS | ATTR_HASSHELL | ATTR_CARRYANDBUMP)
	STA Objects_BehaviorAttr, X

	LDA <Objects_YZ, X
	ADD #$10
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	ADC #$00
	STA <Objects_YHiZ, X

	LDA Objects_Property, X
	AND #$FE
	CMP #$04
	BNE ObjInit_ParaTroopa1

	LDA <Objects_YZ, X
	SUB #$40
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	SBC #$00
	STA <Objects_YHiZ, X

ObjInit_ParaTroopa1:
	LDA <Objects_XZ, X
	STA ParaTroopa_StartX, X

	JMP InitPatrol

ObjNorm_ParaTroopa:
	LDA <Player_HaltGameZ
	BEQ ParaTroopa_Norm
	
	JMP ParaTroopa_Draw

ParaTroopa_Norm:
	LDA Objects_Property, X
	CMP #$06
	BEQ ParaTroopa_CheckDelete

	LDA <Objects_XZ, X
	CMP ParaTroopa_StartX, X
	BNE ObjNorm_ParaTroopa0

ParaTroopa_CheckDelete:
	JSR Object_DeleteOffScreen

ObjNorm_ParaTroopa0:
	JSR DoPatrol
	JSR Object_FaceDirectionMoving
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	JSR Object_AttackOrDefeat

ObjNorm_ParaTroopa2:
	JMP ParaTroopa_Animate

Troopa_WingYOffset:
	.byte $07, $06

ParaTroopa_WingFrames:
	.byte $CD, $CF    

ParaTroopa_Animate:
	LDA Object_SpriteRAMOffset, X
	ADD #$04
	STA Object_SpriteRAMOffset, X
	
	JMP ParaTroopa_DrawWing

ParaTroopa_Draw:
	LDA Object_SpriteRAMOffset, X
	ADD #$04
	STA Object_SpriteRAMOffset, X
	JSR Troopa_Animate
	JMP ParaTroopa_DrawWing

ParaTroopa_DrawWing:	
	LDA ParaTroopa_WingFrame, X
	TAX

	LDA ParaTroopa_WingFrames, X
	STA Sprite_RAMTile-4, Y

	LDA Sprite_RAMAttr, Y
	AND #~SPR_PAL3
	ORA #SPR_PAL1
	STA Sprite_RAMAttr - 4, Y

	CMP #SPR_HFLIP
	BCS ParaTroopa_WingFlipped

	LDA Sprite_RAMY + 4, Y
	SUB Troopa_WingYOffset, X
	STA Sprite_RAMY - 4, Y

	LDA Sprite_RAMX , Y
	ADD #$08
	STA Sprite_RAMX - 4, Y
	RTS

ParaTroopa_WingFlipped:
	LDA Sprite_RAMY, Y
	SUB Troopa_WingYOffset, X
	STA Sprite_RAMY - 4, Y

	LDA Sprite_RAMX, Y
	STA Sprite_RAMX - 4, Y
	RTS


ObjInit_BeachedCheep:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_STOMPKICKSOUND)
	STA Objects_BehaviorAttr, X

	LDA <Objects_YVelZ, X
	BNE BeachedCheep_Prop

	LDA #(ATTR_CARRYANDBUMP | ATTR_STOMPKICKSOUND)
	STA Objects_BehaviorAttr, X

	JSR Object_MoveTowardsPlayerFast

BeachedCheep_Prop:
	LDY Objects_Property, X
	CPY #$02
	BNE ObjInit_BeachedCheep1

	LDA #$10
	STA <Objects_YVelZ, X

ObjInit_BeachedCheep1:
	LDA BeachedCheep_VFlip, Y
	ORA Objects_Orientation, X
	STA Objects_Orientation, X
	RTS
	
BeachedCheep_XVel: .byte $10, $F0
BeachedCheep_YVel: .byte $A0, $60
BeachedCheep_VFlip: .byte $00, SPR_VFLIP, $00, $00

BeachedCheep_IsWaiting = Objects_Data3
BeachedCheep_CurrentFrame = Objects_Data4
BeachedCheep_NoWaterTimer = Objects_Data5

BeachedCheep_GroundBounce: 
	.byte $D0, $F8, $D0

BeachedCheep_CeilingBounce: 
	.byte $08, $30, $30

ObjNorm_BeachedCheep:
	LDA <Player_HaltGameZ
	BEQ ObjNorm_BeachedCheep0
	JMP Beached_DrawNoAnimate

ObjNorm_BeachedCheep0:
	JSR Object_DeleteOffScreen
	
	LDA Objects_Timer, X
	BEQ Beached_NoTimer
	JMP Beached_InWater
	
Beached_NoTimer:
	LDA Objects_InWater, X
	BEQ Beached_Move

	JSR Object_MoveTowardsPlayerFast
	
	LDY Objects_Property, X

	LDA BeachedCheep_YVel, Y
	STA <Objects_YVelZ, X

	LDA #$10
	STA BeachedCheep_NoWaterTimer, X

Beached_Move:
	
	LDY Objects_Property, X
	BEQ Beached_Move1

	CPY #$03
	BEQ Beached_Move1

	CPY #$01
	BEQ Beached_ReveseGravity

	INC NoGravity
	BNE Beached_Move1

Beached_ReveseGravity:
	INC Reverse_Gravity

Beached_Move1:
	JSR Object_Move
	JSR Object_FaceDirectionMoving
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_DetectTiles

	LDA Objects_Property, X
	CMP #$03
	BNE Beached_InteractTiles

	LDA <Objects_YVelZ, X
	BMI Beached_NoDetect

	LDA #$00
	STA Objects_Property, X

	LDA Object_BodyTileProp, X
	CMP #TILE_PROP_SOLID_ALL
	BCC Beached_InteractTiles

	JMP Object_PoofDie

Beached_InteractTiles:
	JSR Object_InteractWithTiles
	JSR Beached_DoBounce

Beached_NoDetect:
	LDA BeachedCheep_NoWaterTimer, X
	BEQ Beached_WaterOk

	DEC BeachedCheep_NoWaterTimer, X
	JMP Beached_Draw

Beached_WaterOk:
	LDA Objects_InWater, X
	BEQ Beached_Draw
	
Beached_SetTimer:
	LDA #$20
	STA Objects_Timer, X
	JSR Object_FacePlayer

Beached_Draw:
	INC BeachedCheep_CurrentFrame,X
	LDA BeachedCheep_CurrentFrame,X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame,X

Beached_DrawNoAnimate:
	JMP Object_Draw

Beached_InWater:
	JSR Object_FacePlayer
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JMP Object_Draw

Beached_DoBounce:
	LDY Objects_Property, X
	LDA <Objects_TilesDetectZ, X
	AND #$04
	BEQ Beached_DoBounce1

	LDA BeachedCheep_GroundBounce, Y
	STA <Objects_YVelZ, X

Beached_DoBounce1:
	LDA  <Objects_TilesDetectZ, X
	AND #$08
	BEQ Beached_DoBounce2

	LDA BeachedCheep_CeilingBounce, Y
	STA <Objects_YVelZ, X

Beached_DoBounce2:
	RTS	



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
	


ZombieGoomba_CurrentFrame  = Objects_Data1

ObjInit_ZombieGoomba:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_BUMPNOKILL | ATTR_WINDAFFECTS | ATTR_CARRYANDBUMP)
	STA Objects_BehaviorAttr, X

	LDA #$02
	STA Objects_Health, X


	LDA #$F0
	STA ChaseVel_LimitLo, X

	LDA #$10
	STA ChaseVel_LimitHi, X

ObjInit_ZombieGoombaRTS:
	RTS

ObjNorm_ZombieGoomba:
	LDA Objects_Property, X
	JSR DynJump

	.word ZombieGoomba_Norm
	.word ZombieGoomba_Hide

ZombieGoomba_Norm:
	LDA <Player_HaltGameZ
	BEQ ZombieGoomba_DoNorm

	JMP Object_DrawMirrored

ZombieGoomba_DoNorm:
	JSR Object_DeleteOffScreen
	JSR Object_ChasePlayerX
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer
	JSR Object_InteractWithObjects

	LDA Objects_Timer, X
	BNE ZombieGoomba_Chase

	JSR Object_DetectTiles
	JSR Object_InteractWithTilesWallStops

ZombieGoomba_Chase:	
	JSR Object_YDistanceFromPlayer
	
	LDA <YDiffAboveBelow
	ORA <Objects_YVelZ, X
	BNE ZombieGoomba_CheckWater

	LDA <Objects_TilesDetectZ, X
	AND #(HIT_LEFTWALL | HIT_RIGHTWALL)
	BEQ ZombieGoomba_CheckLanding

	LDA #$DE
	STA <Objects_YVelZ, X
	BNE ZombieGoomba_CheckWater

ZombieGoomba_CheckLanding:
	LDA <Objects_TilesDetectZ, X
	AND #(HIT_GROUND)
	BEQ ZombieGoomba_CheckWater

	JSR Object_MoveTowardsPlayerFast

ZombieGoomba_CheckWater:
	LDA Objects_InWater,X
	BEQ ZombieGoomba_Animate

	JMP Object_PoofDie

ZombieGoomba_Animate:
	INC ZombieGoomba_CurrentFrame, X
	LDA ZombieGoomba_CurrentFrame, X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame,X

ZombieGoomba_Draw:
	JMP Object_DrawMirrored

ZombieGoomba_JumpBlocks:
	LDA <Objects_TilesDetectZ, X
	AND Objects_PreviousTilesDetect, X
	AND #$04
	BNE ZombieGoomba_JumpBlocksRTS

ZombieGoomba_JumpBlocksRTS:
	RTS	

ZombieGoomba_Infect:
	LDA Player_FlashInv
	ORA Player_StarInv
	BNE ZombieGoomba_HurtRTS

	LDA LeftRightInfection
	BNE ZombieGoomba_Hurt

	LDA #$17
	STA Player_SuitLost

	LDA #$80
	STA Player_QueueSuit

	LDA #$01
	STA LeftRightInfection
	
	LDA #$71
	STA Player_FlashInv
	RTS

ZombieGoomba_Hurt:
	JSR Player_GetHurt

ZombieGoomba_HurtRTS:
	RTS

ZombieGoomba_Hide:
	JSR Object_DeleteOffScreen
	JSR Object_CalcBoundBox
	JSR Object_DetectTileCenter
	AND #$F0
	BEQ ZombieGoomba_PopOut
	
	JSR Object_XDistanceFromPlayer
	CMP #$30
	BCS ZombieGoomba_HideRTS

	LDA Block_NeedsUpdate
	BNE ZombieGoomba_HideRTS

	LDA <Objects_XZ, X
	STA <Debris_X

	LDA <Objects_YZ, X
	STA <Debris_Y
	
	JSR Common_MakeBricks

	
	LDA Tile_LastValue
	ADD #$01
	
	JSR Object_ChangeBlock

ZombieGoomba_PopOut:
	LDA #$00
	STA Objects_Property, X

	LDA #$C0
	STA <Objects_YVelZ, X

	LDA #$20
	STA Objects_Timer, X

ZombieGoomba_HideRTS:
	RTS	


ObjInit_DryBones:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA <Objects_YZ, X
	ADD #$10
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	ADC #$00
	STA <Objects_YHiZ, X

	LDA #$08
	STA Objects_Timer, X

	JSR Object_CalcBoundBox
	JSR Object_MoveTowardsPlayer

	LDA #(ATTR_BUMPNOKILL | ATTR_CARRYANDBUMP)
	STA Objects_BehaviorAttr, X

	LDA #(ATTR_FIREPROOF | ATTR_TAILPROOF)
	STA Objects_WeaponAttr, X

	LDA #$04
	STA Objects_SpritesRequested, X
	RTS

DryBones_Frames = Objects_Data1

DryBones_CrumbleFrames:
	.byte $02, $03, $03, $03, $03, $03, $03, $03
	.byte $03, $03, $03, $03, $03, $03, $03, $02

DryBones_PoofX:
	.byte $F8, $10

ObjNorm_DryBones:
	LDA <Player_HaltGameZ
	BEQ DryBones_Norm

	JMP DryBones_Draw

DryBones_Norm:	
	JSR Object_DeleteOffScreen

	LDA Objects_Timer2, X
	CMP #$0F
	BNE DryBones_NoPoof

	LDY #$00

	LDA Objects_Orientation, X
	BEQ DryBones_MakePoof

	INY

DryBones_MakePoof:
	LDA <Objects_XZ, X
	ADD DryBones_PoofX, Y
	STA <Poof_X

	LDA <Objects_YZ, X
	STA Poof_Y
	JSR Common_MakePoof

DryBones_NoPoof:
	LDA Objects_Timer2, X
	CMP #$01
	BNE DryBones_DoMove

	JSR Object_MoveTowardsPlayer

	LDA #(ATTR_BUMPNOKILL | ATTR_CARRYANDBUMP)
	STA Objects_BehaviorAttr, X

DryBones_DoMove:	
	JSR Object_Move
	JSR Object_FaceDirectionMoving
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	JSR Object_InteractWithObjects
	JSR Object_AttackOrDefeat

	LDA Objects_Timer, X
	BNE DryBones_Animate

	LDA Objects_PreviousTilesDetect, X
	AND #HIT_GROUND
	BNE DryBones_CheckStomped

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BNE DryBones_Fall

DryBones_CheckStomped:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE DryBones_Animate

DryBones_Fall:
	JSR DryBones_Crumble
	
DryBones_Animate:
	LDA Objects_Timer2, X
	BEQ DryBones_AnimateWalk

	LSR A
	LSR A
	LSR A
	LSR A
	TAY

	LDA DryBones_CrumbleFrames, Y
	STA Objects_Frame,X

	BNE DryBones_Draw

DryBones_AnimateWalk:
	INC DryBones_Frames,X
	LDA DryBones_Frames,X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame,X
	JMP DryBones_Draw

DryBones_Draw:
	LDA Objects_Frame, X
	CMP #$02
	BCC DryBones_DrawStanding

	LDA #$00
	STA <Temp_Var9
	
	LDA Objects_Timer2, X
	CMP #$30
	BCS DryBones_CheckDirection

	CMP #$10
	BCC DryBones_CheckDirection

	LSR A
	AND #$01
	STA <Temp_Var9

DryBones_CheckDirection:
	LDA Objects_Orientation, X
	BNE DryBones_LyingRight
	
	LDA #$10
	ORA <Temp_Var9
	STA <Temp_Var9
	
DryBones_LyingRight:
	LDA <Objects_XZ, X
	SUB <Temp_Var9
	STA <Objects_XZ, X

	JSR Object_Draw32x16

	LDA <Objects_XZ, X
	ADD <Temp_Var9
	STA <Objects_XZ, X
	RTS

DryBones_DrawStanding:
	LDA <Objects_YZ, X
	SUB #$10
	STA <Objects_YZ, X
	
	JSR Object_Draw16x32
	
	LDA <Objects_YZ, X
	ADD #$10
	STA <Objects_YZ, X
	RTS

DryBones_SkullOff:
	.byte $F4, $0C
	.byte $FF, $00

DryBones_SkullXVel:
	.byte $F0, $10

DryBones_Crumble:
	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesVerticallyOffScreen, X
	ORA Objects_Timer2, X
	BNE DryBones_CrumbleRTS

	LDA #$F2
	STA Objects_Timer2, X

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	LDA #$00
	STA <Objects_XVelZ, X

	LDA #ATTR_BUMPNOKILL
	STA Objects_BehaviorAttr, X

	LDY #$00

	LDA Objects_Orientation, X
	BEQ DryBones_SkullPrep

	INY

DryBones_SkullPrep:
	LDA DryBones_SkullXVel, Y
	STA <Temp_Var14

	LDA DryBones_SkullOff, Y
	STA <Temp_Var15

	LDA DryBones_SkullOff + 2, Y
	STA <Temp_Var16

	JSR Object_PrepProjectile
	
	LDA #SOBJ_SKULL
	STA SpecialObj_ID, Y

	LDA <Objects_XZ, X
	ADD <Temp_Var15
	STA SpecialObj_X, Y

	LDA <Objects_XHiZ, X
	ADC <Temp_Var16
	STA SpecialObj_XHi, Y

	LDA <Temp_Var14
	STA SpecialObj_XVel, Y

	LDA <Objects_YZ, X
	ADD #$04
	STA SpecialObj_Y, Y

	LDA <Objects_YHiZ, X
	ADC #$00
	STA SpecialObj_YHi, Y

	LDA #$E2
	STA SpecialObj_Timer, Y

	LDA #$00
	STA SpecialObj_YVel, Y

DryBones_CrumbleRTS:
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
	


ObjInit_DryCheep:
	LDA #$04
	STA Objects_SpritesRequested,X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #ATTR_STOMPKICKSOUND
	STA Objects_BehaviorAttr, X

	JSR Object_MoveTowardsPlayerFast
	
	LDA <Objects_XZ, X
	STA DryCheep_PoofX, X

	LDA <Objects_YZ, X
	STA DryCheep_PoofY, X

	LDA <Objects_YHiZ, X
	STA DryCheep_PoofYHi, X

	LDA Objects_Property, X
	STA DryCheep_Burning, X

	LDA #$01
	STA Objects_Health, X
	RTS

DryCheep_Burning = Objects_Data2
DryCheep_PoofX = Objects_Data3
DryCheep_PoofY = Objects_Data4
DryCheep_PoofYHi = Objects_Data5
DryCheep_FlameFrame = Objects_Data6
DryCheep_PoofTimer = Objects_Data7

DryCheep_PoofTime:
	.byte $13

Flame_Frames:
	.byte $81, $83, $85, $87	

ObjNorm_DryCheep:
	LDA <Player_HaltGameZ
	BNE Dry_DrawNoAnimate

ObjNorm_DryCheep0:
	JSR Object_DeleteOffScreen
	
	LDA DryCheep_Burning, X
	BNE Dry_WeaponAttr

	LDA #(ATTR_FIREPROOF)
	STA Objects_WeaponAttr, X
	BEQ Dry_CheckIce

Dry_WeaponAttr:
	LDA #(ATTR_FIREPROOF | ATTR_TAILPROOF | ATTR_STOMPPROOF | ATTR_NOICE)
	STA Objects_WeaponAttr, X

Dry_CheckIce:
	LDA Objects_PlayerProjHit, X
	BEQ Dry_NotHit

	CMP #HIT_ICEBALL
	BNE Dry_NotHit

	LDA DryCheep_Burning, X
	BEQ Dry_NotHit

Dry_RemoveBurn:
	LDA #$00
	STA DryCheep_Burning, X
	STA Objects_PlayerProjHit, X
	
	INC Objects_Health, X

Dry_NotHit:
	LDA Objects_Timer, X
	BNE Dry_InWater
	
	LDA Objects_InWater, X
	BEQ Dry_Move

	JSR Object_MoveTowardsPlayerFast

	LDA BeachedCheep_YVel
	STA <Objects_YVelZ, X

Dry_Move:
	JSR Object_Move
	JSR Object_FaceDirectionMoving
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

Dry_Normal:
	JSR Object_DetectTiles

	LDA Objects_Property, X
	CMP #$03
	BNE DryCheep_Tiles

	LDA <Objects_TilesDetectZ,X
	AND #~HIT_GROUND
	STA <Objects_TilesDetectZ,X

DryCheep_Tiles:	
	JSR Object_InteractWithTiles
	JSR Dry_DoBounce
	LDA Objects_InWater, X
	BEQ Dry_Draw
	
Dry_SetTimer:
	LDA #$20
	STA Objects_Timer, X
	JSR Dry_CheckLava
	JSR Object_FacePlayer

Dry_Draw:
	INC BeachedCheep_CurrentFrame,X
	LDA BeachedCheep_CurrentFrame,X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame,X

Dry_DrawNoAnimate:
	JMP DryCheep_DrawFlamesAndSmoke

Dry_InWater:
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JMP DryCheep_DrawFlamesAndSmoke

Dry_DoBounce:
	LDA <Objects_TilesDetectZ, X
	AND #$04
	BEQ Dry_DoBounce1

	LDA BeachedCheep_GroundBounce
	STA <Objects_YVelZ, X

Dry_DoBounce1:
	RTS

Dry_CheckLava:
	LDA Object_BodyTileProp, X
	AND #$0F
	CMP #(TILE_PROP_HARMFUL)
	BEQ Dry_MakeBurn

	LDA #$00
	STA DryCheep_Burning, X
	RTS

Dry_MakeBurn:
	LDA #$01
	STA DryCheep_Burning, X

	LDA DryCheep_PoofTime
	STA DryCheep_PoofTimer, X
	RTS

DryCheep_DrawFlamesAndSmoke:
	JSR Object_Draw
	
	LDA DryCheep_Burning, X
	BNE DryCheep_MakeFlamePoof
	RTS

DryCheep_MakeFlamePoof:
	LDA Sprite_RAM,Y
	SUB #$08
	STA Sprite_RAM+8,Y

	LDA Sprite_RAM + 4,Y
	SUB #$08
	STA Sprite_RAM+12,Y

	LDA Sprite_RAM+3,Y
	STA Sprite_RAM+11,Y

	LDA Sprite_RAM+7,Y
	STA Sprite_RAM+15,Y

	LDA Sprite_RAM+2,Y
	AND #$BF
	STA Sprite_RAM+10,Y
	STA Sprite_RAM+14,Y

	INC DryCheep_FlameFrame, X
	LDA DryCheep_FlameFrame, X
	LSR A
	LSR A
	AND #$02
	TAX 
	LDA Flame_Frames, X
	STA Sprite_RAM+9,Y

	LDA Flame_Frames + 1, X
	STA Sprite_RAM+13,Y

	LDA <Player_HaltGameZ
	BNE DryCheep_DrawFlamesAndSmoke2

	LDX <CurrentObjectIndexZ


	LDA Objects_XVelZ, X
	ORA Objects_YVelZ, X
	BEQ DryCheep_DrawFlamesAndSmoke2

	LDA DryCheep_PoofTimer, X
	BNE DryCheep_DrawFlamesAndSmoke1

	LDA Objects_InWater, X
	BNE DryCheep_DrawFlamesAndSmoke2

	LDA Objects_SpritesHorizontallyOffScreen,X
	ORA Objects_SpritesVerticallyOffScreen,X
	BNE DryCheep_SkipPoof

	LDA <Objects_XZ, X
	STA <Poof_X

	LDA <Objects_YZ, X
	STA <Poof_Y

	LDA <Objects_YHiZ, X
	STA <Poof_YHi

	JSR Common_MakePoof

DryCheep_SkipPoof:
	LDA DryCheep_PoofTime
	STA DryCheep_PoofTimer, X

	LDA <Objects_XZ, X
	STA DryCheep_PoofX, X

	LDA <Objects_YZ, X
	STA DryCheep_PoofY, X

	LDA <Objects_YHiZ, X
	STA DryCheep_PoofYHi, X
	
DryCheep_DrawFlamesAndSmoke1:
	DEC DryCheep_PoofTimer, X

DryCheep_DrawFlamesAndSmoke2:
	RTS	


Grower_DrawAttributes:
	.byte $00, SPR_HFLIP, SPR_HFLIP, SPR_HFLIP, SPR_VFLIP, SPR_HFLIP | SPR_VFLIP, $00, $00


Grower_DrawFlip:
	.byte $02, $03, $00, $01

Grower_XVel:
	.byte $00, $20, $00, $E0

Grower_YVel:
	.byte $E0, $00, $20, $00


Grower_Frame = Objects_Data1
Grower_Direction = Objects_Data2
Grower_StartX = Objects_Data3
Grower_StartXHi = Objects_Data4
Grower_StartY = Objects_Data5
Grower_StartYHi = Objects_Data6
Grower_TilePropDetect = Objects_Data7
Grower_ReverseDraw = Objects_Data8

Grower_WeaponAttributes:
	.byte ATTR_STOMPPROOF, ATTR_ALLWEAPONPROOF

Grower_BehaviorAttributes:
	.byte 0, ATTR_EXPLOSIONPROOF | ATTR_SHELLPROOF

ObjInit_PiranhaGrower:
	LDA #ATTR_STOMPPROOF
	STA Objects_WeaponAttr, X

ObjInit_PiranhaGrowerCommon:	
	; which direction to start in 0 = up, 1 = right, 2 = down, 3 = left

	LDA #ATTR_NOICE
	STA Objects_BehaviorAttr, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA Objects_Property, X
	STA Grower_Direction, X

	 ; Grower_StartYHi = current tile to check for (Toggle sbeten #TILE_PROP_ENEMY and #TILE_PROP_HARMFUL)
	LDA #TILE_PROP_ENEMY
	STA Grower_TilePropDetect, X

	; back up original position
	LDA Objects_XZ, X
	STA Grower_StartX, X
	
	LDA Objects_XHiZ, X
	STA Grower_StartXHi, X
	
	LDA Objects_YZ, X
	STA Grower_StartY, X
	
	LDA Objects_YHiZ, X
	STA Grower_StartYHi, X
	RTS

ObjNorm_PiranhaGrower:
	LDA <Player_HaltGameZ
	BEQ Grower_Norm
	
	JMP Grower_Draw

Grower_Norm:
	LDA Objects_PlayerProjHit, X
	BEQ Grower_NotHit

	LDA #$00
	STA Objects_Timer2, X
	STA Objects_PlayerProjHit, X

Grower_NotHit:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE Grower_Normal

	JMP Grower_Retract
	
Grower_Normal:
	LDA Objects_Timer, X
	BEQ Grower_Move
	
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Grower_Animate
	JSR Grower_TimerToggle
	RTS

Grower_Move:
	JSR Object_ApplyXVel
	JSR Object_ApplyYVel
	JSR Object_CalcBoundBox
	
	LDA <Objects_XZ, X
	ORA <Objects_YZ, X
	AND #$0F
	BNE Grower_Animate
	
	JSR Grower_AtStart
	BCC Grower_NoDelete

	JSR Grower_CheckOffScreen
	
Grower_NoDelete:

	JSR Object_DetectTiles	
	JSR Grower_InteractWithTiles
	JSR Object_AttackOrDefeat

Grower_Animate:
	INC Grower_Frame, X
	
	LDA Grower_Frame, X
	AND #$08
	LSR A
	LSR A
	LSR A
	STA <Temp_Var1
	LDA Grower_Direction, X
	EOR Grower_ReverseDraw, X
	ASL A
	STA <Temp_Var2
	ORA <Temp_Var1
	STA Objects_Frame, X

Grower_Draw:
	JSR Object_DrawAligned

	LDA Grower_Direction, X
	EOR Grower_ReverseDraw, X
	ASL A
	TAX
	LDA Grower_DrawAttributes, X
	ORA Sprite_RAM + 2, Y
	STA Sprite_RAM + 2, Y
	
	LDA Grower_DrawAttributes + 1, X
	ORA Sprite_RAM + 6, Y
	STA Sprite_RAM + 6, Y
	RTS

Grower_AtStart:
	LDA Grower_StartX, X
	CMP Objects_XZ, X
	BNE Grower_NotBeginning

	LDA Grower_StartXHi, X
	CMP Objects_XHiZ, X
	BNE Grower_NotBeginning

	LDA Grower_StartY, X
	CMP Objects_YZ, X
	BNE Grower_NotBeginning

	LDA Grower_StartYHi, X
	CMP Objects_YHiZ, X
	BNE Grower_NotBeginning
	SEC
	RTS
	
Grower_NotBeginning:
	CLC
	RTS

Grower_CheckOffScreen:
	LDA #$01
	STA TempA
	
	JSR Grower_DeleteOffScreen

	LDA TempA
	BEQ Grower_CheckOffScreen1
	JSR Object_DetectTileCenter

	LDA Block_NeedsUpdate
	BNE Grower_CheckOffScreen1
	
	LDA Tile_LastValue
	EOR #$01

	JSR Object_ChangeBlock
	PLA
	PLA

Grower_CheckOffScreen1:
	RTS

Grower_DeleteOffScreen:
	JSR Object_DeleteOffScreen
	LDA #$00
	STA TempA
	RTS

Grower_TimerToggle:
	LDX <CurrentObjectIndexZ

	LDA Objects_Timer, X
	BEQ Grower_TimerToggle1

	LDA Objects_Timer, X
	CMP #$01
	BNE Grower_TimerToggle1

	LDA Grower_ReverseDraw, X
	EOR #$02
	STA Grower_ReverseDraw, X

	LDA Grower_TilePropDetect, X
	CMP #TILE_PROP_ENEMY
	BEQ Grower_TimerToggle0

	LDA #TILE_PROP_ENEMY
	STA Grower_TilePropDetect, X
	RTS

Grower_TimerToggle0:
	LDA #(TILE_PROP_SOLID_ALL | TILE_PROP_HARMFUL)
	STA Grower_TilePropDetect, X

Grower_TimerToggle1:
	RTS

Grower_InteractWithTiles:
	LDA Block_NeedsUpdate
	BEQ Grower_InteractWithTiles2

Grower_InteractWithTiles1:
	LDA #$00
	STA <Objects_XVelZ, X
	STA <Objects_YVelZ, X
	RTS

Grower_InteractWithTiles2:
	JSR Object_DetectTileCenter

	LDA Tile_LastValue
	EOR #$01
	JSR Object_ChangeBlock

	LDA #$00
	STA <Temp_Var13
	JSR Grower_DetectBlockAbove
	CMP Grower_TilePropDetect, X
	BEQ Grower_SetVelocity

	INC <Temp_Var13
	JSR Grower_DetectBlockRight
	CMP Grower_TilePropDetect, X
	BEQ Grower_SetVelocity

	INC <Temp_Var13
	JSR Grower_DetectBlockBelow
	CMP Grower_TilePropDetect, X
	BEQ Grower_SetVelocity
	
	INC <Temp_Var13
	JSR Grower_DetectBlockLeft
	CMP Grower_TilePropDetect, X
	BEQ Grower_SetVelocity
	
	LDA #$00
	STA <Objects_XVelZ, X
	STA <Objects_YVelZ, X

	LDA #$80
	STA Objects_Timer, X

	RTS

Grower_SetVelocity:
	LDY <Temp_Var13
	LDA Grower_XVel, Y
	STA <Objects_XVelZ, X
	
	LDA Grower_YVel, Y
	STA <Objects_YVelZ, X
	
	TYA
	STA Grower_Direction, X
	LDY Grower_StartYHi, X
	CPY #(TILE_PROP_SOLID_ALL | TILE_PROP_HARMFUL)
	BNE DrawPiranhaGrow1

	TAY
	LDA Grower_DrawFlip, Y 
	STA Grower_Direction, X

DrawPiranhaGrow1:
	LDA #$00
	RTS

Grower_DetectBlockAbove:
	LDA <Objects_YZ, X
	SUB #$08
	STA Tile_DetectionY

	LDA <Objects_YHiZ, X
	SBC #$00
	STA Tile_DetectionYHi

	LDA <Objects_XZ, X
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	STA Tile_DetectionXHi

	JSR Object_DetectTile

	LDA Tile_LastProp
	RTS

Grower_DetectBlockBelow:
	LDA <Objects_YZ, X
	ADD #$18
	STA Tile_DetectionY

	LDA <Objects_YHiZ, X
	ADC #$00
	STA Tile_DetectionYHi

	LDA <Objects_XZ, X
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	STA Tile_DetectionXHi

	JSR Object_DetectTile
	LDA Tile_LastProp
	RTS

Grower_DetectBlockRight:
	LDA <Objects_YZ, X
	STA Tile_DetectionY

	LDA <Objects_YHiZ, X
	STA Tile_DetectionYHi

	LDA <Objects_XZ, X
	ADD #$18
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Tile_DetectionXHi

	JSR Object_DetectTile
	LDA Tile_LastProp
	RTS

Grower_DetectBlockLeft:
	LDA <Objects_YZ, X
	STA Tile_DetectionY

	LDA <Objects_YHiZ, X
	STA Tile_DetectionYHi

	LDA <Objects_XZ, X
	SUB #$08
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	SBC #$00
	STA Tile_DetectionXHi

	JSR Object_DetectTile
	LDA Tile_LastProp
	RTS

Grower_Retract:

	JSR Object_CalcBoundBox

Grower_KeepRetracting:
	LDA Block_NeedsUpdate
	BNE Grower_RetractRTS

	LDA Objects_Timer2, X
	BNE Grower_RetractRTS
	
	JSR Object_DetectTileCenter

	LDA Tile_LastValue
	AND #$FE
	JSR Object_ChangeBlock
	
	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE Grower_NoPoof

	LDA <Objects_XZ, X
	AND #$F0
	STA <Poof_X

	LDA <Objects_YZ, X
	AND #$F0
	STA <Poof_Y
	JSR Common_MakePoof

Grower_NoPoof:	
	JSR Grower_DetectBlockAbove
	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_HARMFUL)
	BEQ Grower_SetPosition

	JSR Grower_DetectBlockRight
	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_HARMFUL)
	BEQ Grower_SetPosition

	JSR Grower_DetectBlockBelow
	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_HARMFUL)
	BEQ Grower_SetPosition

	JSR Grower_DetectBlockLeft
	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_HARMFUL)
	BEQ Grower_SetPosition

	JMP Object_Delete

Grower_SetPosition:	
	LDA Tile_DetectionX
	STA <Objects_XZ, X

	LDA Tile_DetectionXHi
	STA <Objects_XHiZ, X

	LDA Tile_DetectionY
	STA <Objects_YZ, X

	LDA Tile_DetectionYHi
	STA <Objects_YHiZ, X

	LDA #$08
	STA Objects_Timer2, X
	
Grower_RetractRTS:
	RTS	
	