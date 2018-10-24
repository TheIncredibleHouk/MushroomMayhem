    .org ObjectGroup_InitJumpTable
;****************************** OBJECT INITIALIZATION ******************************
	; 

OBJ_WATERSPLASH     = $14    
OBJ_WATERFILL 		= $15

    .word ObjInit_WaterSplash   ; Object $14
	.word ObjInit_Waterfill	; Object $15
	
	.org ObjectGroup_NormalJumpTable	; <-- help enforce this table *here*
;****************************** OBJECT GAME LOOP ******************************
    .word ObjNorm_WaterSplash   ; Object $14
	.word ObjNorm_Waterfill	    ; Object $15	1

	.org ObjectGroup_CollideJumpTable	; <-- help enforce this table *here*
;****************************** OBJECT PLAYER INTERACTION ******************************
    .word ObjHit_DoNothing	    ; Object $14
	.word ObjHit_DoNothing	    ; Object $15

	.org ObjectGroup_Attributes	; <-- help enforce this table *here*
;****************************** OBJECT PALETTE/SIZE ******************************
    .byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $14
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $15

	.org ObjectGroup_PatTableSel	; <-- help enforce this table *here*
;****************************** OBJECT PATTERN TABLE ******************************
    .byte OPTS_NOCHANGE         ; Object $14
	.byte OPTS_SETPT5 | $12		; Object $15

	
	.org ObjectGroup_KillAction	; <-- help enforce this table *here*
;****************************** OBJECT DEATH ROUTINE ******************************
	.byte KILLACT_POOFDEATH		; Object $14
    .byte KILLACT_POOFDEATH		; Object $15


OG2_POff .func (\1 - ObjectGroup02_PatternSets)

	.org ObjectGroup_PatternStarts	; <-- help enforce this table *here*

	; Index by object group relative index (ObjGroupRel_Idx)
	.byte OG2_POff(ObjP14), OG2_POff(ObjP15), OG2_POff(ObjP16), OG2_POff(Obj17)
    .byte OG2_POff(ObjP18), OG2_POff(ObjP19), OG2_POff(ObjP1A), OG2_POff(Obj1B)
    .byte OG2_POff(ObjP1C), OG2_POff(ObjP1D), OG2_POff(ObjP1E), OG2_POff(Obj1F)
    .byte OG2_POff(ObjP20), OG2_POff(ObjP21), OG2_POff(ObjP22), OG2_POff(Obj21)
    .byte OG2_POff(ObjP22), OG2_POff(ObjP23), OG2_POff(ObjP24), OG2_POff(Obj25)

ObjectGroup02_PatternSets:

ObjP14:
    .byte $15, $15
	.byte $13, $13
	.byte $11, $11
    
ObjP15:
    .byte $81, $83

ObjP16:
ObjP17:
ObjP18:
ObjP19:
ObjP1A:
ObjP1B:
ObjP1C:
ObjP1D:
ObjP1E:
ObjP1F:
ObjP20:
ObjP21:
ObjP22:
ObjP23:
ObjP24:
ObjP25:


;***********************************************************************************
; Water Splash
;***********************************************************************************
; IMMUNITIES:
;		All
;***********************************************************************************
; 	An oject that just represents the splash animation when an object goes in and out of water
;***********************************************************************************	
ObjInit_WaterSplash:
	JMP Object_NoInteractions
	
WaterSplash_Frame = Objects_Data1

ObjNorm_WaterSplash:
	LDA <Player_HaltGameZ
	BEQ WaterSplash_Norm

	JMP WaterSplash_Draw

WaterSplash_Norm:
	LDA <Objects_YZ, X
	AND #$F0
	STA <Objects_YZ, X

	LDA Objects_Timer, X
	BNE WaterSplash_Animate

	JMP Object_Delete
	
WaterSplash_Animate:
	LDA Objects_Timer, X
	LSR A
	LSR A

	AND #$03
	STA Objects_Frame, X

WaterSplash_Draw:
	JMP Object_DrawMirrored



;***********************************************************************************
; Water Filler
;***********************************************************************************
; IMMUNITIES:
;		All
;***********************************************************************************
;	This object moves quickly to the right, toggling the tile it's currently on every 16 pixels.
;***********************************************************************************	

ObjInit_Waterfill:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #$40
	STA Objects_XVelZ, X
	
	JMP Object_NoInteractions

WaterFill_Ticks = Objects_Data1

WaterFill_Flip:
	.byte $00, SPR_VFLIP

ObjNorm_Waterfill:
	LDA <Player_HaltGameZ
	BNE FillWater_Draw

WaterFill_Norm:
	
	JSR Object_DeleteOffScreen
	JSR Object_FaceDirectionMoving
	JSR Object_ApplyXVel
	JSR Object_CalcBoundBoxForced
	JSR Object_DetectTileCenter

	STY <Temp_Var1

	CMP #TILE_PROP_SOLID_ALL
	BCC FillWater_DrawWater

	LDA <Objects_XZ, X
	AND #$0F
	BNE FillWater_Animate

	LDA Objects_XZ, X
	AND #$F0
	STA Debris_X

	LDA Objects_YZ, X
	AND #$F0
	STA Debris_Y

	JSR Common_MakeBricks

	LDA #SPR_PAL2
	STA BrickBust_Pal, Y
	
	LDA <Temp_Var1
	SUB #$01

	JSR Object_ChangeBlock

	JMP FillWater_Animate

FillWater_DrawWater:
	LDA <Objects_XZ, X
	AND #$0F
	BNE FillWater_Animate

	LDA <Temp_Var1
	EOR #$01

	JSR Object_ChangeBlock

FillWater_Animate:
	INC WaterFill_Ticks, X
	
	LDA WaterFill_Ticks, X
	AND #$03
	
	LSR A

	TAY
	
	LDA Objects_Orientation, X
	ORA WaterFill_Flip, Y
	STA Objects_Orientation, X

FillWater_Draw:
	JMP Object_Draw
