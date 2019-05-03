    .org ObjectGroup_InitJumpTable
;****************************** OBJECT INITIALIZATION ******************************
    
OBJ_PLATFORMHORZ    = $28
OBJ_PLATFORMVERT    = $29
OBJ_PLATFORMDIAG1   = $2A
OBJ_PLATFORMDIAG2   = $2B
OBJ_PLATFORMCW      = $2C
OBJ_PLATFORMCCW     = $2D
OBJ_PLATFORMPATH    = $2E
OBJ_PLATFORMUNSTABLE = $2F
OBJ_PLATFORMPULLEY = $30
OBJ_SNAKEBLOCK      = $31
OBJ_PIPEBLOCK       = $32
OBJ_PLATFORMSWING   = $33


    .word ObjInit_WoodenPlatHorz    ; Object $28
	.word ObjInit_WoodenPlatVert    ; Object $29
    .word ObjInit_WoodenPlatDiagonal1   ; Object $2A
    .word ObjInit_WoodenPlatDiagonal2   ; Object $2B
    .word ObjInit_WoodenPlatCW      ; Object $2C
    .word ObjInit_WoodenPlatCCW     ; Object $2D
    .word ObjInit_PlatformFollow    ; Object $2E
    .word ObjInit_PlatformUnstable  ; Object $2F
    .word ObjInit_PlatformCommon ; Object $30
    .word ObjInit_SnakeBlock        ; Object $31
    .word ObjInit_PipeBlock         ; Object $32
	.word ObjInit_PlatformSwing			; Object $33
	.word ObjInit_DoNothing			; Object $34
	.word ObjInit_DoNothing			; Object $35
	.word ObjInit_DoNothing			; Object $36
	.word ObjInit_DoNothing			; Object $37
	.word ObjInit_DoNothing			; Object $38
	.word ObjInit_DoNothing			; Object $39
	.word ObjInit_DoNothing			; Object $3A
	.word ObjInit_DoNothing			; Object $3B

	.org ObjectGroup_NormalJumpTable	; <-- help enforce this table *here*
;****************************** OBJECT GAME LOOP ******************************
    .word ObjNorm_PlatformOscillate   ; Object $28
    .word ObjNorm_PlatformOscillate   ; Object $29
    .word ObjNorm_PlatformOscillate   ; Object $2A
    .word ObjNorm_PlatformOscillate   ; Object $2B
    .word ObjNorm_PlatformOscillate   ; Object $2C
    .word ObjNorm_PlatformOscillate   ; Object $2D
    .word ObjNorm_PlatformFollow   ; Object $2E
    .word ObjNorm_PlatformUnstable  ; Object $2F
    .word ObjNorm_PlatformPulley ; Object $30
    .word ObjNorm_SnakeBlock        ; Object $31
    .word ObjNorm_PipeBlock         ; Object $32
	.word ObjNorm_PlatformSwing			; Object $33
	.word ObjNorm_DoNothing			; Object $34
	.word ObjNorm_DoNothing			; Object $35
	.word ObjNorm_DoNothing			; Object $36
	.word ObjNorm_DoNothing			; Object $37
	.word ObjNorm_DoNothing			; Object $38
	.word ObjNorm_DoNothing			; Object $39
	.word ObjNorm_DoNothing			; Object $3A
	.word ObjNorm_DoNothing			; Object $3B

	.org ObjectGroup_CollideJumpTable	; <-- help enforce this table *here*
;****************************** OBJECT PLAYER INTERACTION ******************************
    .word Platform_PlayerStand	    ; Object $28
    .word Platform_PlayerStand	    ; Object $29
    .word Platform_PlayerStand	    ; Object $2A
    .word Platform_PlayerStand	    ; Object $2B
    .word Platform_PlayerStand	    ; Object $2C
    .word Platform_PlayerStand	    ; Object $2D
    .word Platform_PlayerStand	    ; Object $2E
    .word Platform_PlayerStand	    ; Object $2F
    .word Platform_PlayerStand	    ; Object $30
    .word ObjHit_SolidBlock          ; Object $31
    .word ObjHit_SolidBlock         ; Object $32
    .word Platform_PlayerStand	        ; Object $33
	.word ObjHit_DoNothing	        ; Object $34
	.word ObjHit_DoNothing	        ; Object $35
	.word ObjHit_DoNothing	        ; Object $36
	.word ObjHit_DoNothing	        ; Object $37
	.word ObjHit_DoNothing	        ; Object $38
	.word ObjHit_DoNothing	        ; Object $39
	.word ObjHit_DoNothing	        ; Object $3A
	.word ObjHit_DoNothing	        ; Object $3B


	.org ObjectGroup_Attributes	; <-- help enforce this table *here*
;****************************** OBJECT PALETTE/SIZE ******************************
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH48	 ; Object $28
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH48	 ; Object $29
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH48	 ; Object $2A
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH48	 ; Object $2B
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH48	 ; Object $2C
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH48	 ; Object $2D
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH48	 ; Object $2E
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH48	 ; Object $2F
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH48	 ; Object $30
    .byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16  ; Object $31
    .byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH32  ; Object $32
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH48	 ; Object $33
	.byte $00									 ; Object $34
	.byte $00									 ; Object $35
	.byte $00									 ; Object $36
	.byte $00									 ; Object $37
	.byte $00									 ; Object $38
	.byte $00									 ; Object $39
	.byte $00									 ; Object $3A
	.byte $00									 ; Object $3B

	.org ObjectGroup_PatTableSel	; <-- help enforce this table *here*
;****************************** OBJECT PATTERN TABLE ******************************
    .byte OPTS_NOCHANGE         ; Object $28
    .byte OPTS_NOCHANGE         ; Object $29
    .byte OPTS_NOCHANGE         ; Object $2A
    .byte OPTS_NOCHANGE         ; Object $2B
    .byte OPTS_NOCHANGE         ; Object $2C
    .byte OPTS_NOCHANGE         ; Object $2D
    .byte OPTS_NOCHANGE         ; Object $2E
    .byte OPTS_NOCHANGE         ; Object $2F
    .byte OPTS_NOCHANGE         ; Object $30
    .byte OPTS_NOCHANGE         ; Object $31
    .byte OPTS_SETPT5 | $0B	    ; Object $32
	.byte OPTS_SETPT5 | $36	    ; Object $33
	.byte OPTS_NOCHANGE         ; Object $34
	.byte OPTS_NOCHANGE         ; Object $35
	.byte OPTS_NOCHANGE         ; Object $36
	.byte OPTS_NOCHANGE         ; Object $37
	.byte OPTS_NOCHANGE         ; Object $38
	.byte OPTS_NOCHANGE         ; Object $39
	.byte OPTS_NOCHANGE         ; Object $3A
	.byte OPTS_NOCHANGE         ; Object $3B

	
	.org ObjectGroup_KillAction	; <-- help enforce this table *here*
;****************************** OBJECT DEATH ROUTINE ******************************
	.byte KILLACT_STARDEATH		; Object $28
    .byte KILLACT_STARDEATH		; Object $29
    .byte KILLACT_STARDEATH		; Object $2A
    .byte KILLACT_STARDEATH		; Object $2B
    .byte KILLACT_STARDEATH		; Object $2C
    .byte KILLACT_STARDEATH		; Object $2D
    .byte KILLACT_STARDEATH		; Object $2E
    .byte KILLACT_STARDEATH		; Object $2F
    .byte KILLACT_STARDEATH		; Object $30
    .byte KILLACT_STARDEATH		; Object $31
    .byte KILLACT_NORMALANDKILLED ; Object $32
	.byte KILLACT_STARDEATH		; Object $33
	.byte KILLACT_STARDEATH		; Object $34
	.byte KILLACT_STARDEATH		; Object $35
	.byte KILLACT_STARDEATH		; Object $36
	.byte KILLACT_STARDEATH		; Object $37
	.byte KILLACT_STARDEATH		; Object $38
	.byte KILLACT_STARDEATH		; Object $39
	.byte KILLACT_STARDEATH		; Object $3A
	.byte KILLACT_STARDEATH		; Object $3B

OG3_POff .func (\1 - ObjectGroup03_PatternSets)

	.org ObjectGroup_PatternStarts	; <-- help enforce this table *here*

	; Index by object group relative index (ObjGroupRel_Idx)
	.byte OG3_POff(ObjP28), OG3_POff(ObjP29), OG3_POff(ObjP2A), OG3_POff(ObjP2B)
    .byte OG3_POff(ObjP2C), OG3_POff(ObjP2D), OG3_POff(ObjP2E), OG3_POff(ObjP2F)
    .byte OG3_POff(ObjP30), OG3_POff(ObjP31), OG3_POff(ObjP32), OG3_POff(ObjP33)
    .byte OG3_POff(ObjP34), OG3_POff(ObjP35), OG3_POff(ObjP36), OG3_POff(ObjP37)
    .byte OG3_POff(ObjP38), OG3_POff(ObjP39), OG3_POff(ObjP3A), OG3_POff(ObjP3B)

ObjectGroup03_PatternSets:

ObjP28:
ObjP29:
ObjP2A:
ObjP2B:
ObjP2C:
ObjP2D:    
ObjP2E:
ObjP2F:
ObjP30:
ObjP33:
    .byte $61, $61, $61, $61, $61, $61

ObjP31:
    .byte $77, $77

ObjP32:
    .byte $AF, $B1, $B3, $B5

ObjP34:
ObjP35:
ObjP36:
ObjP37:
ObjP38:
ObjP39:
ObjP3A:
ObjP3B:


Platform_Index = Objects_Data1
Platform_Ticker = Objects_Data2
Platform_Regen = Objects_Data6
Platform_NotBehind = Objects_Data7
Platform_MaxFall = Objects_Data8
Platform_StartY = Objects_Data9
Platform_StartYHi = Objects_Data10
PlatformUnstable_MoveTimer = Objects_Data11
PlatformUnstable_NoRegen = Objects_Data12

Platform_StartX = Objects_Data3
Platform_StartXHi = Objects_Data4
Platform_SteppedOn = Objects_Data5
Platform_MadeContact = Objects_Data6
Platform_Fall = Objects_Data7

PlatformTimers:
	.byte $01, $11, $21, $31, $41, $51, $61, $71

ObjInit_PlatformCommon:
	LDA #$06
	STA Objects_SpritesRequested, X

	LDA #BOUND48x16
	STA Objects_BoundBox, X

	JSR Object_NoInteractions

	LDA <Objects_XZ, X
	STA Platform_StartX, X

	LDA <Objects_XHiZ, X
	STA Platform_StartXHi, X

	LDA <Objects_YZ, X
	SUB #$02
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	SBC #$00
	STA <Objects_YHiZ, X

	LDY Objects_Property, X
	LDA PlatformTimers, Y
	STA Patrol_ResetTimer, X
	RTS

ObjInit_WoodenPlatHorz:
	JSR ObjInit_PlatformCommon
	
	LDA #$00
	STA Objects_Property, X

	JMP InitPatrol_NoTimers

ObjInit_WoodenPlatVert:
	JSR ObjInit_PlatformCommon
	LDA #$01
	STA Objects_Property, X
	JMP InitPatrol_NoTimers    

ObjInit_WoodenPlatDiagonal1:
	JSR ObjInit_PlatformCommon
	LDA #$02
	STA Objects_Property, X
	JMP InitPatrol_NoTimers    

ObjInit_WoodenPlatDiagonal2:
	JSR ObjInit_PlatformCommon
	LDA #$03
	STA Objects_Property, X
	JMP InitPatrol_NoTimers        

ObjInit_WoodenPlatCW:
	JSR ObjInit_PlatformCommon
	LDA #$05
	STA Objects_Property, X
	JMP InitPatrol_NoTimers

ObjInit_WoodenPlatCCW:
	JSR ObjInit_PlatformCommon
	LDA #$04
	STA Objects_Property, X
	JMP InitPatrol_NoTimers   


ObjNorm_PlatformOscillate:
	LDA <Player_HaltGameZ
	BNE ObjNorm_PlatformOscillate1	 ; If gameplay halted, Delete if off-screen, otherwise draw wide 48x16 sprite

	JSR Object_CalcBoundBoxForced
	
	LDA #$00
	STA Platform_MadeContact, X

	JSR Object_InteractWithPlayer
	JSR Object_MovePattern
	JSR Platform_ContactCheck

	LDA <Objects_XZ, X
	CMP Platform_StartX, X
	BNE ObjNorm_PlatformOscillate1

	LDA <Objects_XHiZ, X
	CMP Platform_StartXHi, X

	BNE ObjNorm_PlatformOscillate1


	JSR Object_DeleteOffScreen

ObjNorm_PlatformOscillate1:
	JMP Platform_Draw


Platform_Draw:
	LDA #$00
	STA Objects_Orientation, X
	
	LDA Objects_SpritesVerticallyOffScreen,X
	BEQ Platform_DoDraw
	RTS

Platform_DoDraw:
	
	JSR Object_DrawMirrored

	LDA Objects_SpritesHorizontallyOffScreen,X
	AND #SPRITE_2_HINVISIBLE
	BNE Platform_Draw1

	LDA <Objects_SpriteX, X
	ADD #$10
	STA Sprite_RAMX + 8, Y

	LDA <Objects_SpriteY, X
	STA Sprite_RAMY + 8, Y

	LDA Sprite_RAMAttr, Y
	STA Sprite_RAMAttr + 8, Y

	LDA Sprite_RAMTile, Y
	STA Sprite_RAMTile + 8, Y

Platform_Draw1:
	LDA Objects_SpritesHorizontallyOffScreen,X
	AND #SPRITE_3_HINVISIBLE
	BNE Platform_Draw2

	LDA <Objects_SpriteX, X
	ADD #$18
	STA Sprite_RAMX + 12, Y

	LDA <Objects_SpriteY, X
	STA Sprite_RAMY + 12, Y

	LDA Sprite_RAMAttr + 4, Y
	STA Sprite_RAMAttr + 12, Y

	LDA Sprite_RAMTile + 4, Y
	STA Sprite_RAMTile + 12, Y

Platform_Draw2:
	LDA Objects_SpritesHorizontallyOffScreen,X
	AND #SPRITE_4_HINVISIBLE
	BNE Platform_Draw3

	LDA <Objects_SpriteX, X
	ADD #$20
	STA Sprite_RAMX + 16, Y

	LDA <Objects_SpriteY, X
	STA Sprite_RAMY + 16, Y

	LDA Sprite_RAMAttr, Y
	STA Sprite_RAMAttr + 16, Y

	LDA Sprite_RAMTile, Y
	STA Sprite_RAMTile + 16, Y

Platform_Draw3:
	
	LDA Objects_SpritesHorizontallyOffScreen,X
	AND #SPRITE_5_HINVISIBLE
	BNE Platform_Draw4

	LDA <Objects_SpriteX, X
	ADD #$28
	STA Sprite_RAMX + 20, Y

	LDA <Objects_SpriteY, X
	STA Sprite_RAMY + 20, Y

	LDA Sprite_RAMAttr + 4, Y
	STA Sprite_RAMAttr + 20, Y

	LDA Sprite_RAMTile + 4, Y
	STA Sprite_RAMTile + 20, Y

Platform_Draw4:
	RTS		 ; Return    

Platform_PlayerOffset:
	.byte $01, $00
	.byte $00, $00

Platform_PlayerStand:
	LDA <Player_YVel
	BMI Platform_PlayerStand1

	LDA HitTest_Result
	AND #HITTEST_BOTTOM
	BEQ Platform_PlayerStand1

	LDA Player_BoundBottom
	SUB Objects_BoundTop, X
	CMP #$06
	BCS Platform_PlayerStand1

	LDA #$01
	STA Player_OnPlatform
	STA Platform_SteppedOn, X
	STA Platform_MadeContact, X

Platform_PlayerStand1:	
	RTS	

Platform_ContactCheck:
	LDA Platform_MadeContact, X
	BEQ Platform_CheckRTS
	
	LDA <Objects_YZ,X	 
	SUB #30
	STA <Player_Y

	LDA <Objects_YHiZ,X
	SBC #$00
	STA <Player_YHi

	LDA #$00
	STA <Player_YVel
	STA Player_InAir

	LDA <Objects_XVelZ, X
	STA Player_CarryXVel
	
Platform_CheckRTS:
	RTS    


ObjInit_PlatformFollow:
	JMP ObjInit_PlatformCommon    


ObjNorm_PlatformFollow:
	LDA <Player_HaltGameZ
	BNE ObjNorm_PlatformFollow1	 ; If gameplay halted, Delete if off-screen, otherwise draw wide 48x16 sprite

	JSR PlatformFollow_CheckOffScreen

	LDA #$00
	STA Platform_MadeContact, X

	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer

	LDA Platform_SteppedOn, X
	BEQ PlatformFollow_NoMove

	LDA Platform_Fall, X
	BEQ PlatformFollow_MoveNormal

	JSR Object_ApplyY_With_Gravity
	JMP PlatformFollow_NoMove

PlatformFollow_MoveNormal:
	JSR Object_ApplyXVel
	JSR Object_ApplyYVel_NoGravity	

PlatformFollow_NoMove:
	JSR Platform_ContactCheck

	LDA Platform_SteppedOn, X
	BEQ ObjNorm_PlatformFollow1
	
	LDA <Objects_XZ, X
	AND #$0F
	BNE ObjNorm_PlatformFollow1

	LDA <Objects_YZ, X
	AND #$0F
	CMP #$0E
	BNE ObjNorm_PlatformFollow1

	LDA Objects_XVelFrac, X
	ORA Objects_YVelFrac, X
	BNE ObjNorm_PlatformFollow1

	JSR Platform_FollowBlocks

ObjNorm_PlatformFollow1:

	JMP Platform_Draw

PlatformFollow_CheckOffScreen:
	JSR Object_DeleteOffScreen
	
	LDY Objects_SpawnIdx,X
	LDA Level_ObjectsSpawned,Y
	ORA #$80
	STA Level_ObjectsSpawned,Y
	RTS

Platform_FollowBlocks:
	LDA #$00
	STA Platform_Fall, X

	LDA #$03
	STA Platform_Index, X

Platform_CheckBlocks:
	LDY Platform_Index, X
	LDA Platform_XOffsets, Y
	ADD <Objects_XZ, X
	STA Block_DetectX

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Block_DetectXHi

	LDA Platform_YOffsets, Y
	ADD <Objects_YZ, X
	STA Block_DetectY

	LDA Platform_YOffsets + 4, Y
	ADC <Objects_YHiZ, X
	STA Block_DetectYHi

	JSR Object_DetectTile
	CMP #TILE_PROP_ENEMY
	BEQ Platform_SetVel

	DEC Platform_Index, X
	BPL Platform_CheckBlocks
	
	LDA #$01
	STA Platform_Fall, X

	LDA #$00
	STA <Objects_XVelZ, X
	RTS

Platform_SetVel:
	LDA Tile_LastValue
	AND #$C0
	ORA #$01
	JSR Object_ChangeBlock

	LDY Platform_Index, X
	LDA Platform_XVel, Y
	STA <Objects_XVelZ, X

	LDA Platform_YVel, Y
	STA <Objects_YVelZ, X
	RTS    	

Platform_XOffsets:
	.byte $28, $18, $08, $18

Platform_YOffsets:
	.byte $08, $18, $08, $F8
	.byte $00, $00, $00, $FF

Platform_XVel:
	.byte $08, $00, $F8, $00

Platform_YVel:
	.byte $00, $08, $00, $F8    


ObjInit_PlatformUnstable:
	LDA #BOUND48x16
	STA Objects_BoundBox, X

	LDA #$06
	STA Objects_SpritesRequested, X

	JSR Object_NoInteractions

	LDA #$20
	STA Platform_MaxFall, X
	STA Platform_Regen, X
	STA Platform_NotBehind, X

	LDA <Objects_YZ, X
	STA Platform_StartY, X

	LDA <Objects_YHiZ, X
	STA Platform_StartYHi, X
	RTS

ObjNorm_PlatformUnstable:
	LDA <Player_HaltGameZ
	BNE Unstable_Draw

	JSR Object_DeleteOffScreen
	JSR Unstable_CheckRegen
	JSR Object_CalcBoundBox
	
	LDA #$00
	STA Platform_MadeContact, X

	JSR Object_InteractWithPlayer
	JSR Unstable_Move
	JSR Platform_ContactCheck

Unstable_Draw:
	LDA Objects_Timer, X  
	BEQ Unstable_DrawNorm
	RTS

Unstable_DrawNorm:
	LDA Platform_NotBehind, X
	BNE Unstable_Draw1

Unstable_Draw1:
	JMP Platform_Draw

Unstable_Move:
	LDA PlatformUnstable_MoveTimer, X
	BEQ Unstable_MoveNormal

	DEC PlatformUnstable_MoveTimer, X
	BNE Unstable_MoveContant

	INC Platform_SteppedOn, X
	
	LDA Objects_SpriteAttributes, X
	AND #~SPR_BEHINDBG
	STA Objects_SpriteAttributes, X
	
	JSR Object_ApplyYVel_NoGravity
	RTS

Unstable_MoveContant:
	JSR Object_ApplyYVel_NoGravity

	LDA Objects_SpriteAttributes, X
	ORA #SPR_BEHINDBG
	STA Objects_SpriteAttributes, X
	RTS

Unstable_MoveNormal:

	LDA Platform_SteppedOn, X
	BEQ Unstable_MoveRTS

	JSR Object_Move

	LDA <Objects_YVelZ,X
	BMI Unstable_MoveRTS
	CMP #$20
	BCC Unstable_MoveRTS

	LDA #$20
	STA <Objects_YVelZ,X

Unstable_MoveRTS:
	RTS

Unstable_CheckRegen:
	LDA Objects_Timer, X  
	BEQ Unstable_CheckFallTooFar

	LDA #$00
	STA Platform_SteppedOn, X
	STA <Objects_YVelZ, X
	
	LDA Platform_StartY, X
	STA <Objects_YZ, X

	LDA Platform_StartYHi, X
	STA <Objects_YHiZ, X
	PLA
	PLA
	RTS

Unstable_CheckFallTooFar:
	LDA PlatformUnstable_NoRegen, X
	BNE Unstable_CheckFallTooFarRTS

	LDA <Objects_YHiZ, X
	BEQ Unstable_CheckFallTooFarRTS
	BMI Unstable_CheckFallTooFarRTS

	LDA <Objects_YZ, X
	CMP #$B0
	BCC Unstable_CheckFallTooFarRTS

	LDA #$60
	STA Objects_Timer, X

Unstable_CheckFallTooFarRTS:
	RTS

Unstable_CheckContact:
	LDA Platform_MadeContact, X
	BEQ Unstable_CheckContactRTS

Unstable_CheckContactRTS:
	RTS     


;***********************************************************************************
; BLOCK SnakeBlock/MAKER
;***********************************************************************************
; IMMUNITIES:
;		ALL
;***********************************************************************************
; PROPERTIES:
;		0 - Moves at a slow speed, disappears when its path ends
;		1 - Moves at a slow speed, will reverse when its path ends
;		2 - Moves at a fast speed, disappears when its path ends
;		3 - Moves at a fast speed, will reverse when its path ends
;***********************************************************************************
; Depend on the property set, the block will look for either a hollow or sollid enemy interaction block
; and move in the direction of what it founds. Once it moves over it, it toggles that block using EOR #$01
; then continues to look for more blocks like it. If it cannot find any more blocks of that time, it changes what
; it's looking for (it was solid enemy interaction, it now looks for hollow, and vice versa) and moves in the opposite
; direction. These will only try deleting themselves once they hit their originaly starting point.
;
; These objects can be set to disappear once they can no longer find the block they are looking for.
;***********************************************************************************

SnakeBlock_StartX = Objects_Data1
SnakeBlock_StartXHi = Objects_Data2
SnakeBlock_StartY = Objects_Data3
SnakeBlock_StartYHi = Objects_Data4
SnakeBlock_DirectionIndex = Objects_Data5
SnakeBlock_TileDetectValue = Objects_Data6
SnakeBlock_BlockIndexCheck = Objects_Data7
SnakeBlock_Init = Objects_Data8

SnakeBlock_XVelocity: .byte $00, $08, $00, $F8
SnakeBlock_YVelocity: .byte $F8, $00, $08, $00

BlockCheck_XOffsets:
	.byte $08, $18, $08, $F8
	.byte $00, $00, $00, $FF
	

BlockCheck_YOffsets:
	.byte $F8, $08, $18, $08
	.byte $FF, $00, $00, $00
	
ObjInit_SnakeBlock:
	JSR Object_NoInteractions

	LDA #BOUND16x16BLOCK
	STA Objects_BoundBox, X

	JSR Object_CalcBoundBox
	JSR Object_DetectTileCenter
	
	LDA Tile_LastValue
	STA SnakeBlock_TileDetectValue, X

	LDA <Objects_YZ, X
	STA SnakeBlock_StartY, X

	LDA <Objects_YHiZ, X
	STA SnakeBlock_StartYHi, X

	LDA <Objects_XZ, X
	STA SnakeBlock_StartX, X

	LDA <Objects_XHiZ, X
	STA SnakeBlock_StartXHi, X

	LDA #$FF
	STA SnakeBlock_BlockIndexCheck, X

	LDA #SPR_BEHINDBG
	STA Objects_Orientation, X

	JMP SnakeBlock_CheckBlockToggle

ObjNorm_SnakeBlock:
	LDA <Player_HaltGameZ
	BEQ SnakeBlock_Normal

	JSR SnakeBlock_Draw

SnakeBlock_RTS1:
	RTS

SnakeBlock_Normal:
	LDA <Objects_XZ, X
	CMP SnakeBlock_StartX, X
	BNE SnakeBlock1

	LDA <Objects_XHiZ, X
	CMP SnakeBlock_StartXHi, X
	BNE SnakeBlock1

	LDA <Objects_YZ, X
	CMP SnakeBlock_StartY, X
	BNE SnakeBlock1

	LDA <Objects_YHiZ, X
	CMP SnakeBlock_StartYHi, X
	BNE SnakeBlock1

	JSR Object_DeleteOffScreen

SnakeBlock1:
	JSR Object_ApplyXVel
	JSR Object_ApplyYVel_NoGravity

	JSR Object_CalcBoundBox


	LDA Objects_BoundLeft, X
	SUB #$01
	STA Objects_BoundLeft, X

	LDA Objects_BoundLeftHi, X
	SBC #$00
	STA Objects_BoundLeftHi, X

	LDA Objects_BoundTop, X
	SUB #$02
	STA Objects_BoundTop, X

	LDA Objects_BoundTopHi, X
	SBC #$00
	STA Objects_BoundTopHi, X

	JSR Object_InteractWithPlayer
	JSR SnakeBlock_Draw

	LDA <Objects_XVelZ, X
	ORA <Objects_YVelZ, X
	BNE SnakeBlock_CheckBlockToggle

	JSR SnakeBlock_SetVel

SnakeBlock_CheckBlockToggle:

	LDA <Objects_XZ, X
	AND #$0F
	BNE SnakeBlock_RTS1

	LDA <Objects_YZ, X
	AND #$0F
	BNE SnakeBlock_RTS1

	LDA Block_NeedsUpdate
	BNE SnakeBlock_RTS1

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

	LDA SnakeBlock_TileDetectValue, X
	EOR #$01
	JSR Object_ChangeBlock
	
	LDA #$03
	STA SnakeBlock_BlockIndexCheck, X

SnakeBlock_CheckBlocks:
	LDA SnakeBlock_BlockIndexCheck, X
	TAY

	LDA BlockCheck_XOffsets, Y
	ADD <Objects_XZ, X
	STA Block_DetectX

	LDA BlockCheck_XOffsets + 4, Y
	ADC <Objects_XHiZ, X
	STA Block_DetectXHi

	LDA BlockCheck_YOffsets, Y
	ADD <Objects_YZ, X
	STA Block_DetectY

	LDA BlockCheck_YOffsets + 4, Y
	ADC <Objects_YHiZ, X
	STA Block_DetectYHi
	
	TYA
	PHA

	JSR Object_DetectTile
	
	PLA
	TAY

	LDA Tile_LastValue
	CMP SnakeBlock_TileDetectValue, X
	BEQ SnakeBlock_SetVel

	DEC SnakeBlock_BlockIndexCheck, X
	BPL SnakeBlock_CheckBlocks

	LDA Objects_Property, X
	AND #$01
	BNE SnakeBlockMark_Reverse

	JMP Object_PoofDie

SnakeBlockMark_Reverse:
	LDA SnakeBlock_TileDetectValue, X
	EOR #$01
	STA SnakeBlock_TileDetectValue, X

	LDA #$00
	STA <Objects_XVelZ, X
	STA <Objects_YVelZ, X

	JMP SnakeBlock_RTS1

SnakeBlock_SetVel:
	TYA
	STA SnakeBlock_BlockIndexCheck, X

	LDY SnakeBlock_BlockIndexCheck, X
	BMI SnakeBlock_NormalSpeed

	LDA SnakeBlock_XVelocity, Y
	STA <Objects_XVelZ, X

	LDA SnakeBlock_YVelocity, Y
	STA <Objects_YVelZ, X

	LDA Objects_Property, X
	AND #$02
	BEQ SnakeBlock_NormalSpeed

	LDA <Objects_XVelZ, X
	AND #$80
	STA TempA

	LDA <Objects_XVelZ, X
	ASL A
	ORA TempA
	STA <Objects_XVelZ, X

	LDA <Objects_YVelZ, X
	AND #$80
	STA TempA

	LDA <Objects_YVelZ, X
	ASL A
	ORA TempA
	STA <Objects_YVelZ, X

SnakeBlock_NormalSpeed:
	RTS

SnakeBlock_Draw:
	JSR Object_DrawMirrored

	TYA
	TAX

	DEC Sprite_RAMY, X
	DEC Sprite_RAMY + 4, X
	LDX <CurrentObjectIndexZ
	RTS    


ObjInit_PipeBlock:
	LDA #BOUND32x16BLOCK
	STA Objects_BoundBox, X
	
	LDA #$04
	STA Objects_SpritesRequested, X

	LDA <Objects_YZ, X
	SUB #$01
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	SBC #$00
	STA <Objects_YHiZ, X

	LDA #$10
	STA Objects_Timer, X

	LDA Objects_Property, X
	STA PipeBlock_State, X
	TAY

	LDA PipeBlock_YVelFrac, Y
	STA Objects_YVelFrac, X

	LDA <Objects_YZ, X
	STA PipeBlock_StartY, X

	LDA <Objects_YHiZ, X
	STA PipeBlock_StartYHi, X
	
	JMP Object_NoInteractions

PipeBlock_State = Objects_Data1
PipeBlock_ChangeRightQueue = Objects_Data2
PipeBlock_DisableMove = Objects_Data3
PipeBlock_StartY = Objects_Data4
PipeBlock_StartYHi = Objects_Data5

PipeBlock_YVel:
	.byte $08, $F8, $08, $F8

ObjNorm_PipeBlock:
	LDA <Player_HaltGameZ
	BEQ PipeBlock_Norm

	JMP PipeBlock_Draw

PipeBlock_Norm:

	LDA <Objects_YZ, X
	CMP PipeBlock_StartY, X
	BNE PipeBlock_NoDelete

	LDA <Objects_YHiZ, X
	CMP PipeBlock_StartYHi, X
	BNE PipeBlock_NoDelete

	JSR Object_DeleteOffScreen	

PipeBlock_NoDelete:
	JSR PipeBlock_MatchPalette
	JSR Object_CalcBoundBox
	JSR Object_KillOthers
	JSR Object_InteractWithPlayer

	LDA Objects_Timer, X
	ORA PipeBlock_DisableMove, X
	BNE PipeBlock_Stall

	LDY PipeBlock_State, X

	LDA PipeBlock_YVel, Y
	STA Objects_YVelZ, X

	JSR Object_ApplyYVel_NoGravity

PipeBlock_Stall:	
	LDA PipeBlock_ChangeRightQueue, X
	BNE PipeBlock_CheckByPass

	LDA Objects_Timer, X
	BNE PipeBlock_DoDraw
	
PipeBlock_CheckByPass:	
	JSR PipeBlock_CheckBlocks

PipeBlock_DoDraw:
	JMP PipeBlock_Draw

PipeBlock_YCheck:
	.byte $18, $F8, $18, $F8
	.byte $00, $FF, $00, $FF

PipeBlock_YVelFrac:
	.byte $00, $80, $00, $80

PipeBlock_PropCheck:
	.byte TILE_PROP_SOLID_ALL | TILE_PROP_ENEMYSOLID
	.byte TILE_PROP_ENEMY
	.byte TILE_PROP_ENEMY
	.byte TILE_PROP_SOLID_ALL | TILE_PROP_ENEMYSOLID

PipeBlock_CheckBlocks:
	LDA Block_NeedsUpdate
	BEQ PipeBlock_DoCheck

	LDA #$01
	STA PipeBlock_DisableMove, X

	LDA #$00
	STA <Objects_YVelZ, X
	RTS

PipeBlock_DoCheck:
	STA PipeBlock_DisableMove, X

	LDA PipeBlock_ChangeRightQueue, X
	BEQ PipeBlock_NotQueued
	JMP PipeBlock_ChangeBlockRight

PipeBlock_NotQueued:
	LDY PipeBlock_State, X
	
	LDA <Objects_YZ, X
	AND #$0F
	CMP #$0F
	BNE PipeBlock_CheckBlocksRTS

	LDA <Objects_YZ, X
	ADD PipeBlock_YCheck, Y
	STA Tile_DetectionY

	LDA <Objects_YHiZ, X
	ADC PipeBlock_YCheck + 4, Y
	STA Tile_DetectionYHi

	LDA <Objects_XZ, X
	ADD #$08
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	STA Tile_DetectionXHi	

	JSR Object_DetectTile
	LDY PipeBlock_State, X
	CMP PipeBlock_PropCheck, Y
	BNE PipeBlock_ChangeDirection

	JSR PipeBlock_ChangeBlockLeft
	INC PipeBlock_ChangeRightQueue, X
	JMP PipeBlock_CheckBlocksRTS

PipeBlock_ChangeDirection:
	LDA PipeBlock_State, X
	EOR #$01
	STA PipeBlock_State, X

	LDA #$20
	STA Objects_Timer, X

	LDA #$00
	STA <Objects_YVelZ, X

	JSR PipeBlock_ChangeBlockLeft
	INC PipeBlock_ChangeRightQueue, X

	LDY PipeBlock_State, X
	LDA PipeBlock_YVelFrac, Y
	STA Objects_YVelFrac, X 

PipeBlock_CheckBlocksRTS:
	RTS

PipeBlock_ChangeBlockLeft:
	LDA <Objects_XZ, X
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	STA Tile_DetectionXHi

PipeBlock_ChangeBlock:
	LDA <Objects_YZ, X
	ADD #$08
	STA Tile_DetectionY

	LDA <Objects_YHiZ, X
	ADC #$00
	STA Tile_DetectionYHi

	JSR Object_DetectTile
	TYA
	EOR #$01
	JSR Object_ChangeBlock
	
	RTS

PipeBlock_ChangeBlockRight:
	LDA #$00
	STA PipeBlock_ChangeRightQueue, X

	LDA <Objects_XZ, X
	ADD #$10
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Tile_DetectionXHi

	JMP PipeBlock_ChangeBlock


PipeBlock_Draw:
	JSR Object_Draw

	LDA ObjP32 + 2
	STA Sprite_RAMTile + 8, Y

	LDA ObjP32 + 3
	STA Sprite_RAMTile + 12, Y

	LDA Sprite_RAMAttr , Y
	STA Sprite_RAMAttr + 8, Y
	STA Sprite_RAMAttr + 12, Y

	LDA Objects_SpritesHorizontallyOffScreen, X
	AND #SPRITE_2_HINVISIBLE
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE PipeBlock_Draw1

	LDA Objects_SpriteX , X
	ADD #$10
	STA Sprite_RAMX + 8, Y

	LDA Objects_SpriteY, X
	STA Sprite_RAMY + 8, Y
	

PipeBlock_Draw1:
	LDA Objects_SpritesHorizontallyOffScreen, X
	AND #SPRITE_3_HINVISIBLE
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE PipeBlock_DrawRTS
	
	LDA Objects_SpriteX , X
	ADD #$18
	STA Sprite_RAMX + 12, Y

	LDA Objects_SpriteY, X 
	STA Sprite_RAMY + 12, Y

PipeBlock_DrawRTS:	
	RTS

PipeBlock_MatchPalette:
	LDA Pal_Data + 10
	STA Pal_Data + 26
	STA Palette_Buffer + 26

	LDA Pal_Data + 11
	STA Pal_Data + 27
	STA Palette_Buffer + 27
	RTS    

ObjInit_PlatformPulley:
	

ObjNorm_PlatformPulley:

	LDA <Player_HaltGameZ
	BEQ Pulley_Norm
	
	JMP Pulley_Draw

Pulley_Norm:
	JSR Object_DeleteOffScreen

	LDA Objects_Property, X
	BEQ Pulley_Weight

	JSR Object_Move
	JMP Pulley_NoMove

Pulley_Weight:
	LDA <Objects_YZ, X
	AND #$0F
	CMP #$0F
	BNE Pulley_Move

	LDA Block_NeedsUpdate
	BNE Pulley_NoMove

	JSR Object_DetectTileCenter
	
	LDA Tile_LastProp
	CMP #TILE_PROP_ENEMY
	BNE Pulley_Fall

	LDA <Objects_YVelZ, X
	BMI Pulley_MovingUp

	LDA Tile_LastValue
	ORA #$01
	JMP Pulley_UpdateBlock

Pulley_Fall:
	INC Objects_Property, X
	JMP Pulley_Move

Pulley_MovingUp:
	LDA Tile_LastValue
	AND #$FE

Pulley_UpdateBlock:
	JSR Object_ChangeBlock

Pulley_Move:
	JSR Object_ApplyYVel_NoGravity

Pulley_NoMove:	
	JSR Object_CalcBoundBox
	
	LDA Objects_Property, X
	BNE Pulley_NoYVel

	LDA #$00
	STA <Objects_YVelZ, X

Pulley_NoYVel:
	LDA #$00
	STA Platform_MadeContact, X

	JSR Object_InteractWithPlayer
	JSR Platform_ContactCheck

	LDA Platform_MadeContact, X
	BEQ Pulley_Draw

	LDA Objects_Property, X
	BNE Pulley_FindSibling

	LDA #$08
	STA <Objects_YVelZ, X

Pulley_FindSibling:
	LDY #$04

Pulley_FindBuddy:
	CPY <CurrentObjectIndexZ
	BEQ Pulley_NextObject

	LDA Objects_ID, Y
	CMP #OBJ_PLATFORMPULLEY
	BNE Pulley_NextObject

	LDA Objects_Property, X
	BEQ Pully_SiblingUp

	LDA Objects_Property, Y
	BNE Pulley_Draw

	
	LDA #$01
	STA Objects_Property, Y

Pully_SiblingUp:	
	LDA #$F8
	STA Objects_YVelZ, Y

Pulley_NextObject:
	DEY
	BPL Pulley_FindBuddy

Pulley_Draw:
	JMP Platform_Draw

PlatformSwing_Ticker = Objects_Data8
SwingAnchor_X = Objects_Data9
SwingAnchor_XHi = Objects_Data10
SwingAnchor_Y = Objects_Data11
SwingAnchor_YHi = Objects_Data12

PlatformSwing_YVel:
	.byte $01, $02, $04, $08, $10, $14, $18, $1A
	.byte $1A, $18, $14, $10, $08, $04, $02, $01
	.byte -$01, -$02, -$04, -$08, -$10, -$14, -$18, -$1A
	.byte -$1A, -$18, -$14, -$10, -$08, -$04, -$02, -$01

PlatformSwing_XVel:	
	.byte   $00, -$00, -$00, -$04, -$08, -$0A, -$0C, -$0E
	.byte  -$10, -$12, -$14, -$16, -$18, -$1A, -$1C, -$1E
	.byte  -$20, -$1E, -$1C, -$1A, -$18, -$16, -$14, -$12
	.byte  -$10, -$0E, -$0C, -$0A, -$08, -$04, -$00, -$00
	.byte  $00, $00, $00, $04, $08, $0A, $0C, $0E
	.byte  $10, $12, $14, $16, $18, $1A, $1C, $1E
	.byte  $20, $1E, $1C, $1A, $18, $16, $14, $12
	.byte  $10, $0E, $0C, $0A, $08, $04, $00, $00

PlatformSwing_Timers:
	.byte $00, $00
	
PlatformSwing_TickerType:
	.byte $FF, $7F

PlatformSwing_AnchorXOff:
	.byte -$28, $58
	.byte $FF, $00

ObjInit_PlatformSwing:
	JSR ObjInit_PlatformCommon

	LDA #$08
	STA Objects_SpritesRequested, X

	STA Debug_Snap
	LDY Objects_Property, X
	
	LDA PlatformSwing_TickerType, Y
	STA PlatformSwing_Ticker, X

	LDA <Objects_XZ, X
	ADD PlatformSwing_AnchorXOff, Y
	STA SwingAnchor_X, X

	LDA <Objects_XHiZ, X
	ADC PlatformSwing_AnchorXOff + 2, Y
	STA SwingAnchor_XHi, X

	LDA <Objects_YZ, X
	SUB #$20
	STA SwingAnchor_Y, X

	LDA <Objects_YHiZ, X
	SBC #$00
	STA SwingAnchor_YHi, X	

	LDA PlatformSwing_Timers, Y
	STA Objects_Timer, X
	RTS

ObjNorm_PlatformSwing:
	LDA <Player_HaltGameZ
	BEQ Swing_Normal
	JMP Swing_Draw

Swing_Normal:
	LDA <Objects_XZ, X
	CMP Platform_StartX, X
	BNE Swing_Move

	LDA <Objects_XHiZ, X
	CMP Platform_StartXHi, X
	BNE Swing_Move

	JSR Object_DeleteOffScreen

Swing_Move:
	LDA Objects_Timer, X
	BNE Swing_Interact

	INC PlatformSwing_Ticker, X
	LDA PlatformSwing_Ticker, X	

	LSR A
	LSR A
	AND #$1F
	TAY

	LDA PlatformSwing_YVel, Y
	STA <Objects_YVelZ, X

	
	LDA PlatformSwing_Ticker, X
	LSR A
	LSR A
	AND #$3F
	TAY

	LDA PlatformSwing_XVel, Y
	STA <Objects_XVelZ, X

	LDA PlatformSwing_XVel, Y
	STA <Objects_XVelZ, X

Swing_Interact:
	JSR Object_CalcBoundBoxForced

	LDA #$00
	STA Platform_MadeContact, X

	JSR Object_InteractWithPlayer
	JSR Object_ApplyXVel
	JSR Object_ApplyYVel
	JSR Platform_ContactCheck

Swing_Draw:
	JSR Platform_Draw

	LDY Object_SpriteRAMOffset, X

	LDA <Objects_XZ, X
	ADD #$18
	STA <Point_MidX

	LDA <Objects_XHiZ, X
	ADC #$00
	STA <Point_MidXHi

	LDA <Point_MidX
	SUB SwingAnchor_X, X
	
	PHA

	LDA <Point_MidXHi
	SBC SwingAnchor_XHi, X
	STA <Temp_Var2

	PLA
	JSR Half_Value

	ADD SwingAnchor_X, X
	STA <Point_X

	LDA SwingAnchor_XHi, X
	ADC <Temp_Var2
	STA <Point_XHi

	LDA <Objects_YZ, X
	SUB SwingAnchor_Y, X
	
	PHA

	LDA <Objects_YHiZ, X
	SBC SwingAnchor_YHi, X
	STA <Temp_Var2

	PLA
	JSR Half_Value

	ADD SwingAnchor_Y, X
	STA <Point_Y

	LDA <Temp_Var2
	ADC SwingAnchor_YHi, X
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
	BCC Swing_DrawAttach

	LDA <Point_RelativeX
	STA Sprite_RAMX + 28, Y

	LDA <Point_RelativeY
	STA Sprite_RAMY + 28, Y

	LDA #$A5
	STA Sprite_RAMTile + 28, Y

	LDA #SPR_PAL1
	STA Sprite_RAMAttr + 28, Y

Swing_DrawAttach:
	LDA <Point_MidX
	SUB #$04
	STA <Point_X

	LDA <Point_MidXHi
	SBC #$00
	STA <Point_XHi

	LDA <Objects_YZ, X
	SUB #$10
	STA <Point_Y

	LDA <Objects_YHiZ, X
	SBC #$00
	STA <Point_YHi

	JSR CheckPoint_OffScreen
	BCC Swing_DrawRTS

	LDA <Point_RelativeX
	STA Sprite_RAMX + 32, Y

	LDA <Point_RelativeY
	STA Sprite_RAMY + 32, Y

	LDA #$A7
	STA Sprite_RAMTile + 32, Y

	LDA #SPR_PAL1
	STA Sprite_RAMAttr + 32, Y

Swing_DrawRTS:	
	RTS

Point_MidX = Temp_Var8
Point_MidXHi = Temp_Var9
Point_X = Temp_Var10
Point_XHi = Temp_Var11
Point_Y = Temp_Var12
Point_YHi = Temp_Var13
Point_RelativeX = Temp_Var14
Point_RelativeY = Temp_Var15

CheckPoint_OffScreen:
	LDA <Point_X
	SUB <Horz_Scroll
	STA <Point_RelativeX

	LDA <Point_XHi
	SBC <Horz_Scroll_Hi
	BNE Point_OffScreen

	LDA <Point_Y
	SUB <Vert_Scroll
	STA <Point_RelativeY

	LDA <Point_YHi
	SBC <Vert_Scroll_Hi
	BNE Point_OffScreen

	SEC
	RTS

Point_OffScreen:
	CLC
	RTS	