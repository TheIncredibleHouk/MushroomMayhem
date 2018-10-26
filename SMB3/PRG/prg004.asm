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
	.word ; Object $44
	.word ; Object $45
	.word ; Object $46
	.word ; Object $47
	.word ; Object $48
	.word ; Object $49
	.word ; Object $4A
	.word ; Object $4B
	.word ; Object $4C
	.word ; Object $4D
	.word ; Object $4E
	.word ; Object $4F


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
	.word ; Object $44
	.word ; Object $45
	.word ; Object $46
	.word ; Object $47
	.word ; Object $48
	.word ; Object $49
	.word ; Object $4A
	.word ; Object $4B
	.word ; Object $4C
	.word ; Object $4D
	.word ; Object $4E
	.word ; Object $4F

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
	.word ; Object $44
	.word ; Object $45
	.word ; Object $46
	.word ; Object $47
	.word ; Object $48
	.word ; Object $49
	.word ; Object $4A
	.word ; Object $4B
	.word ; Object $4C
	.word ; Object $4D
	.word ; Object $4E
	.word ; Object $4F

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
	.byte ; Object $44
	.byte ; Object $45
	.byte ; Object $46
	.byte ; Object $47
	.byte ; Object $48
	.byte ; Object $49
	.byte ; Object $4A
	.byte ; Object $4B
	.byte ; Object $4C
	.byte ; Object $4D
	.byte ; Object $4E
	.byte ; Object $4F

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
	.byte ; Object $44
	.byte ; Object $45
	.byte ; Object $46
	.byte ; Object $47
	.byte ; Object $48
	.byte ; Object $49
	.byte ; Object $4A
	.byte ; Object $4B
	.byte ; Object $4C
	.byte ; Object $4D
	.byte ; Object $4E
	.byte ; Object $4F

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
	.byte KILLACT_POOFDEATH 	; Object $49
	.byte KILLACT_POOFDEATH 	; Object $4A
	.byte KILLACT_POOFDEATH 	; Object $4B
	.byte KILLACT_POOFDEATH 	; Object $4C
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
ObjP45:
ObjP46:
ObjP47:
ObjP48:
ObjP49:
ObjP4A:
ObjP4B:
ObjP4C:
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