    .org ObjectGroup_InitJumpTable
;****************************** OBJECT INITIALIZATION ******************************
    .word ObjInit_DoNothing	; Object $64 - OBJ_CHEEPCHEEPHOPPER
	.word ObjInit_DoNothing	; Object $65 - OBJ_WATERCURRENTUPWARD
	.word ObjInit_DoNothing	; Object $66 - OBJ_WATERCURRENTDOWNARD
	.word ObjInit_ShyGuy		; Object $67 - OBJ_SNOWGUY
	.word ObjInit_DoNothing		; Object $68 - OBJ_TWIRLINGBUZZY
	.word ObjInit_DoNothing		; Object $69 - OBJ_TWIRLINGSPINY
	.word ObjInit_VeggieGuy	; Object $6A - OBJ_VEGGIEGUY
	.word ObjInit_SnowGuy	; Object $6B - OBJ_SHYGUY
	.word ObjInit_Troopa	; Object $6C - OBJ_GREENTROOPA
	.word ObjInit_Troopa	; Object $6D - OBJ_REDTROOPA
	.word ObjInit_BouncyTroopa	; Object $6E - OBJ_PARATROOPAGREENHOP
	.word ObjInit_ParaTroopa	; Object $6F - OBJ_FLYINGREDPARATROOPA
	.word ObjInit_BuzzyBeetle	; Object $70 - OBJ_BUZZYBEATLE
	.word ObjInit_Spiny	; Object $71 - OBJ_SPINY
	.word ObjInit_Goomba	; Object $72 - OBJ_GOOMBA
	.word ObjInit_ParaGoomba	; Object $73 - OBJ_PARAGOOMBA
	.word ObjInit_ZombieGoomba	; Object $74 - OBJ_ZOMBIEGOOMBA
	.word ObjInit_DoNothing	; Object $75 - OBJ_WATERFILLER
	.word ObjInit_PoisonMushroom	; Object $76 - OBJ_POISONMUSHROOM
	.word ObjInit_SwimmingCheep	; Object $77 - OBJ_GREENCHEEP

    .org ObjectGroup_NormalJumpTable
;****************************** OBJECT GAME LOOP ******************************
	.word ObjNorm_DoNothing	; Object $64 - OBJ_CHEEPCHEEPHOPPER
	.word ObjNorm_DoNothing	; Object $65 - OBJ_WATERCURRENTUPWARD
	.word ObjNorm_DoNothing	; Object $66 - OBJ_WATERCURRENTDOWNARD
	.word ObjNorm_SnowGuy	; Object $67 - OBJ_SNOWGUY
	.word ObjNorm_DoNothing	; Object $68 - OBJ_TWIRLINGBUZZY
	.word ObjNorm_DoNothing	; Object $69 - OBJ_TWIRLINGSPINY
	.word ObjNorm_VeggieGuy		; Object $6A - OBJ_VEGGIEGUY
	.word ObjNorm_ShyGuy	; Object $6B - OBJ_SHYGUY
	.word ObjNorm_Troopa	; Object $6C - OBJ_GREENTROOPA
	.word ObjNorm_RedTroopa		; Object $6D - OBJ_REDTROOPA
	.word ObjNorm_BouncyTroopa	; Object $6E - OBJ_PARATROOPAGREENHOP
	.word ObjNorm_ParaTroopa	; Object $6F - OBJ_FLYINGREDPARATROOPA
	.word ObjNorm_BuzzyBeetle	; Object $70 - OBJ_BUZZYBEATLE
	.word ObjNorm_Spiny	; Object $71 - OBJ_SPINY
	.word ObjNorm_Goomba	; Object $72 - OBJ_GOOMBA
	.word ObjNorm_ParaGoomba	; Object $73 - OBJ_PARAGOOMBA
	.word ObjNorm_ZombieGoomba	; Object $74 - OBJ_ZOMBIEGOOMBA
	.word ObjNorm_DoNothing	; Object $75 - OBJ_WATERFILLER
	.word ObjNorm_PoisonMushroom	; Object $76 - OBJ_POISONMUSHROOM
	.word ObjNorm_SwimmingCheep	; Object $77 - OBJ_GREENCHEEP

    .org ObjectGroup_CollideJumpTable
;****************************** OBJECT PLAYER INTERACTION ******************************
	.word ObjHit_DoNothing	; Object $64 - OBJ_CHEEPCHEEPHOPPER
	.word ObjHit_DoNothing	; Object $65 - OBJ_WATERCURRENTUPWARD
	.word ObjHit_DoNothing	; Object $66 - OBJ_WATERCURRENTDOWNARD
	.word ObjHit_DoNothing	; Object $67 - OBJ_SNOWGUY
	.word OCSPECIAL_KILLCHANGETO | OBJ_BUZZYBEATLE	; Object $68 - OBJ_TWIRLINGBUZZY
	.word OCSPECIAL_KILLCHANGETO | OBJ_SPINY	; Object $69 - OBJ_TWIRLINGSPINY
	.word ObjHit_DoNothing	; Object $6A - OBJ_VEGGIEGUY
	.word ObjHit_DoNothing	; Object $6B - OBJ_SHYGUY
	.word Object_Hold					; Object $6C - OBJ_GREENTROOPA
	.word Object_Hold					; Object $6D - OBJ_REDTROOPA
	.word OCSPECIAL_KILLCHANGETO |OBJ_GREENTROOPA	; Object $6E - OBJ_PARATROOPAGREENHOP
	.word OCSPECIAL_KILLCHANGETO |OBJ_REDTROOPA	; Object $6F - OBJ_FLYINGREDPARATROOPA
	.word Object_Hold					; Object $70 - OBJ_BUZZYBEATLE
	.word Object_Hold					; Object $71 - OBJ_SPINY
	.word $0000					; Object $72 - OBJ_GOOMBA
	.word OCSPECIAL_KILLCHANGETO | OBJ_GOOMBA	; Object $73 - OBJ_PARAGOOMBA
	.word ZombieGoomba_Infect	; Object $74 - OBJ_ZOMBIEGOOMBA
	.word $0000	; Object $75 -  (OCSPECIAL_KILLCHANGETO must be a mistake, but interesting!)
	.word $0000					; Object $76 - OBJ_POISONMUSHROOM
	.word $0000					; Object $77 - OBJ_GREENCHEEP

    .org ObjectGroup_PatTableSel
;****************************** OBJECT PALETTE/SIZE ******************************
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $64 - OBJ_CHEEPCHEEPHOPPER
	.byte OA1_PAL0 | OA1_HEIGHT16 | OA1_WIDTH32	; Object $65 - OBJ_WATERCURRENTUPWARD
	.byte OA1_PAL0 | OA1_HEIGHT16 | OA1_WIDTH32	; Object $66 - OBJ_WATERCURRENTDOWNARD
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $67 - OBJ_SNOWGUY
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $68 - OBJ_TWIRLINGBUZZY
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $69 - OBJ_TWIRLINGSPINY
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $6A - OBJ_VEGGIEGUY
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $6B - OBJ_SHYGUY
	.byte OA1_PAL2 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $6C - OBJ_GREENTROOPA
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $6D - OBJ_REDTROOPA
	.byte OA1_PAL2 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $6E - OBJ_PARATROOPAGREENHOP
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $6F - OBJ_FLYINGREDPARATROOPA
	.byte OA1_PAL3 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $70 - OBJ_BUZZYBEATLE
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $71 - OBJ_SPINY
	.byte OA1_PAL3 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $72 - OBJ_GOOMBA
	.byte OA1_PAL3 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $73 - OBJ_PARAGOOMBA
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $74 - OBJ_ZOMBIEGOOMBA
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $75 - 
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $76 - OBJ_POISONMUSHROOM
	.byte OA1_PAL2  | OA1_HEIGHT32 | OA1_WIDTH16	; Object $77 - OBJ_GREENCHEEP

    .org ObjectGroup_PatTableSel
;****************************** OBJECT PATTERN TABLE ******************************
	.byte OPTS_SETPT6 | $4F	; Object $64 - OBJ_CHEEPCHEEPHOPPER
	.byte OPTS_NOCHANGE	; Object $65 - OBJ_WATERCURRENTUPWARD
	.byte OPTS_NOCHANGE	; Object $66 - OBJ_WATERCURRENTDOWNARD
	.byte OPTS_SETPT5 | $0F	; Object $67 - OBJ_SNOWGUY
	.byte OPTS_SETPT5 | $0B	; Object $68 - OBJ_TWIRLINGBUZZY
	.byte OPTS_SETPT5 | $0B	; Object $69 - OBJ_TWIRLINGSPINY
	.byte OPTS_SETPT5 | $0F	; Object $6A - OBJ_VEGGIEGUY
	.byte OPTS_SETPT5 | $0F	; Object $6B - OBJ_SHYGUY
	.byte OPTS_SETPT6 | $4F	; Object $6C - OBJ_GREENTROOPA
	.byte OPTS_SETPT6 | $4F	; Object $6D - OBJ_REDTROOPA
	.byte OPTS_SETPT6 | $4F	; Object $6E - OBJ_PARATROOPAGREENHOP
	.byte OPTS_SETPT6 | $4F	; Object $6F - OBJ_FLYINGREDPARATROOPA
	.byte OPTS_SETPT5 | $0B	; Object $70 - OBJ_BUZZYBEATLE
	.byte OPTS_SETPT5 | $0B	; Object $71 - OBJ_SPINY
	.byte OPTS_SETPT6 | $4F	; Object $72 - OBJ_GOOMBA
	.byte OPTS_SETPT6 | $4F	; Object $73 - OBJ_PARAGOOMBA
	.byte OPTS_SETPT6 | $13	; Object $74 - OBJ_ZOMBIEGOOMBA
	.byte OPTS_SETPT5 | $12	; Object $75 - 
	.byte OPTS_NOCHANGE; Object $76 - OBJ_POISONMUSHROOM
	.byte OPTS_SETPT6 | $4F	; Object $77 - OBJ_GREENCHEEP

	.org ObjectGroup_KillAction	
;****************************** OBJECT DEATH ROUTINE ******************************
	.byte KILLACT_POOFDEATH	; Object $64 - OBJ_CHEEPCHEEPHOPPER
	.byte KILLACT_STANDARD	; Object $65 - OBJ_WATERCURRENTUPWARD
	.byte KILLACT_STANDARD	; Object $66 - OBJ_WATERCURRENTDOWNARD
	.byte KILLACT_POOFDEATH	; Object $67 - OBJ_SNOWGUY
	.byte KILLACT_POOFDEATH	; Object $68 - OBJ_TWIRLINGBUZZY
	.byte KILLACT_POOFDEATH	; Object $69 - OBJ_TWIRLINGSPINY
	.byte KILLACT_POOFDEATH	; Object $6A - OBJ_VEGGIEGUY
	.byte KILLACT_POOFDEATH	; Object $6B - OBJ_SHYGUY
	.byte KILLACT_POOFDEATH	; Object $6C - OBJ_GREENTROOPA
	.byte KILLACT_POOFDEATH	; Object $6D - OBJ_REDTROOPA
	.byte KILLACT_POOFDEATH	; Object $6E - OBJ_PARATROOPAGREENHOP
	.byte KILLACT_POOFDEATH	; Object $6F - OBJ_FLYINGREDPARATROOPA
	.byte KILLACT_POOFDEATH	; Object $70 - OBJ_BUZZYBEATLE
	.byte KILLACT_POOFDEATH	; Object $71 - OBJ_SPINY
	.byte KILLACT_POOFDEATH	; Object $72 - OBJ_GOOMBA
	.byte KILLACT_POOFDEATH	; Object $73 - OBJ_PARAGOOMBA
	.byte KILLACT_POOFDEATH	; Object $74 - OBJ_ZOMBIEGOOMBA
	.byte KILLACT_JUSTDRAW16X16	; Object $75 - OBJ_WATERFILLER
	.byte KILLACT_NORMALANDKILLED	; Object $76 - OBJ_POISONMUSHROOM
	.byte KILLACT_POOFDEATH	; Object $77 - OBJ_GREENCHEEP


OG6_POff .func (\1 - ObjectGroup06_PatternSets)

	.org ObjectGroup_PatternStarts	; <-- help enforce this table *here*
;****************************** OBJECT FRAME TABLE ******************************
	.byte OG6_POff(ObjP64), OG6_POff(ObjP65), OG6_POff(ObjP66), OG6_POff(ObjP67)
	.byte OG6_POff(ObjP68), OG6_POff(ObjP69), OG6_POff(ObjP6A), OG6_POff(ObjP6B)
	.byte OG6_POff(ObjP6C), OG6_POff(ObjP6D), OG6_POff(ObjP6E), OG6_POff(ObjP6F)
	.byte OG6_POff(ObjP70), OG6_POff(ObjP71), OG6_POff(ObjP72), OG6_POff(ObjP73)
	.byte OG6_POff(ObjP74), OG6_POff(ObjP75), OG6_POff(ObjP76), OG6_POff(ObjP77)



	.org ObjectGroup_PatternSets	; <-- help enforce this table *here*
;****************************** OBJECT FRAMES DEFINITION ******************************    
ObjectGroup06_PatternSets:

ObjP64:
ObjP65:
	.byte $E7, $E9, $E7, $EF, $E7, $EF

ObjP66:
	.byte $91, $93, $9D, $9F, $9D, $9F

ObjP67:
	.byte $85, $87
	.byte $81, $83
	.byte $85, $B7
	.byte $81, $B5
	.byte $BB, $BB
	.byte $B1, $B1
	.byte $91, $93    

ObjP68:
	.byte $95, $97, $91, $93, $A1, $A1
ObjP69:
	.byte $81, $83, $85, $87, $89, $89

ObjP6A:
	.byte $85, $87
	.byte $81, $83
	.byte $85, $B7
	.byte $81, $B5
	.byte $BB, $BB
	.byte $B1, $B1

ObjP6B:
	.byte $85, $87
	.byte $81, $83
	.byte $85, $B7
	.byte $81, $B5
	.byte $B1, $B1

ObjP6C:
ObjP6D:
ObjP6E:
ObjP6F:
	.byte $C3, $C5, $C7, $C9
	.byte $FD, $FD, $FD, $FD
	.byte $FD, $FD, $D1, $D1
	.byte $D3, $D5, $D5, $D3
	.byte $CB, $C5, $F9, $FB
	

ObjP70:
	.byte $95, $97, $91, $93, $9B, $9B, $9B, $9B, $A1, $A1, $9B, $9B, $A3, $A5
ObjP71:
	.byte $81, $83, $85, $87, $89, $89, $89, $89, $89, $89, $8F, $8F, $8B, $8D
ObjP72:
ObjP73:
	.byte $D9, $DB, $DB, $D9, $D9, $DB, $EB, $EB

ObjP74:

ObjP75:
	.byte $81, $83

ObjP76:
	.byte $79, $79, $79, $79, $79, $79
ObjP77:
	.byte $E7, $E9, $E7, $EF, $E7, $EF, $AD, $AF, $B9, $BB, $B9, $BB


ShyGuy_Frame = Objects_Data1
ShyGuy_Holding = Objects_Data2

ObjInit_ShyGuy:
	LDA #$04
	STA Objects_SpritesRequested, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_STOMPKICKSOUND | ATTR_WINDAFFECTS | ATTR_CARRYANDBUMP)
	STA Objects_BehaviorAttr, X

	JSR Object_CalcBoundBox
	JSR Object_MoveTowardsPlayer

	LDA #$01
	STA Objects_Health, X
	RTS		 ; Return

ObjNorm_ShyGuy:
	LDA <Player_HaltGameZ
	BEQ ShyGuy_Norm
	
	JMP ShyGuy_Draw

ShyGuy_Norm:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE ShGuy_Alive

	LDA ShyGuy_Holding, X
	BEQ ShyGuy_DeadRTS

	JSR ShyGuy_ThrowBlockForced
	LDA #$00
	STA Objects_XVelZ, Y

ShyGuy_DeadRTS:
	JMP Object_Draw

ShGuy_Alive:
	JSR Object_DeleteOffScreen
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	JSR Object_FacePlayerOnLanding
	JSR ShyGuy_FindBlock
	JSR ShyGuy_GrabBlock
	JSR ShyGuy_ThrowBlock
	JSR Object_AttackOrDefeat

ShyGuy_Animate:
	INC ShyGuy_Frame, X
	LDY #$00

	LDA ShyGuy_Holding, X
	BEQ ShyGuy_NoArms

	INY

ShyGuy_NoArms:
	TYA
	ASL A
	STA <Temp_Var1

	LDA ShyGuy_Frame, X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA <Temp_Var16
	ORA <Temp_Var1
	STA Objects_Frame, X

ShyGuy_Draw:
	LDA <Objects_YVelZ, X
	BPL ShyGuy_GroundAnim

	LDA #$04
	STA Objects_Frame, X
	JMP Object_DrawMirrored

ShyGuy_GroundAnim:
	JSR Object_Draw
	LDA ShyGuy_Holding, X
	BEQ ShyGuy_DrawDone

	
	LDA #$0E
	ADD <Temp_Var16
	STA <Temp_Var16

	LDA Objects_SpritesVerticallyOffScreen, X
	AND #SPRITE_0_VINVISIBLE
	BNE ShyGuy_DrawDone

	LDA Objects_SpritesHorizontallyOffScreen, X
	AND #SPRITE_0_HINVISIBLE
	BNE ShyGuy_DrawRight


	LDA #$67
	STA Sprite_RAMTile + 8, Y

	LDA Objects_SpriteX, X
	STA Sprite_RAMX + 8, Y

	LDA Objects_SpriteY, X
	SUB <Temp_Var16
	STA Sprite_RAMY + 8, Y

	LDA #SPR_PAL3
	STA Sprite_RAMAttr + 8, Y

ShyGuy_DrawRight:
	LDA Objects_SpritesHorizontallyOffScreen, X
	AND #SPRITE_1_INVISIBLE
	BNE ShyGuy_DrawDone

	LDA #$67
	STA Sprite_RAMTile + 12, Y

	LDA Objects_SpriteX, X
	ADD #$08
	STA Sprite_RAMX + 12, Y

	LDA Objects_SpriteY, X
	SUB <Temp_Var16
	STA Sprite_RAMY + 12, Y

	LDA #(SPR_PAL3 | SPR_HFLIP)
	STA Sprite_RAMAttr + 12, Y

ShyGuy_DrawDone:
	RTS

ShyGuy_ScanAbove:
	.byte $48, $38, $28, $18, $08

ShyGuy_FindBlock:
	LDA ShyGuy_Holding, X
	BNE ShyGuy_FindBlockDone

	LDA <Objects_XZ, X
	AND #$0F
	BNE ShyGuy_FindBlockDone

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ ShyGuy_FindBlockDone

	LDY #$04
	LDA <Objects_XZ, X
	ADD #$08
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	STA Tile_DetectionXHi

ShyGuy_FindLoop:
	STY TempY
	LDA <Objects_YZ, X
	SUB ShyGuy_ScanAbove, Y
	STA Tile_DetectionY

	LDA <Objects_YHiZ, X
	SBC #$00
	STA Tile_DetectionYHi

	JSR Object_DetectTile

	LDA Tile_LastProp
	CMP #TILE_PROP_ITEM
	BCS ShyGuy_JumpForBlock

	LDY TempY
	DEY
	BPL ShyGuy_FindLoop

ShyGuy_FindBlockDone:
	RTS

ShyGuy_JumpForBlock:
	LDA #$B8
	STA <Objects_YVelZ, X

	LDA #$00
	STA <Objects_XVelZ, X
	RTS

ShyGuy_GrabBlock:
	LDA <Objects_TilesDetectZ, X
	AND #HIT_CEILING
	BEQ ShyGuy_GrabBlockDone 

	LDA Object_VertTileProp, X
	CMP #TILE_PROP_ITEM
	BCC ShyGuy_GrabBlockDone

	LDY Block_NeedsUpdate
	BNE ShyGuy_GrabBlockDone

	AND #$0F
	ADD #$01
	STA ShyGuy_Holding, X

	LDA <Objects_XZ, X
	ADD #$08
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Tile_DetectionXHi

	LDA <Objects_YZ, X
	SUB #$08
	STA Tile_DetectionY

	LDA <Objects_YHiZ, X
	SBC #$00
	STA Tile_DetectionYHi

	LDA Tile_LastValue
	AND #$C0
	ORA #$01

	JSR Object_ChangeBlock

ShyGuy_GrabBlockDone:
	RTS

ShyGuy_ThrowBlock:
	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ ShyGuy_ThrowBlockDone

	LDA ShyGuy_Holding, X
	BEQ ShyGuy_ThrowBlockDone

	JSR Object_XDistanceFromPlayer
	LDA <XDiff
	CMP #$40
	BCS ShyGuy_ThrowBlockDone

ShyGuy_ThrowBlockForced:
	JSR Object_FindEmptyY
	BCC ShyGuy_ThrowBlockDone

	LDA #OBJ_BRICK
	STA Objects_ID, Y

	LDA #SPR_PAL3
	STA Objects_SpriteAttributes, Y

	LDA ShyGuy_Holding, X
	STA Brick_PowerUp, Y

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

	LDA #$D8
	STA Objects_YVelZ, Y

	LDA #$E0
	STA Objects_XVelZ, Y

	LDA Objects_Orientation, X
	AND #SPR_HFLIP
	BEQ ShyGuy_ClearHolding

	LDA Objects_XVelZ, Y
	EOR #$FF
	ADD #$01
	STA Objects_XVelZ, Y

ShyGuy_ClearHolding:
	LDA #$00
	STA ShyGuy_Holding, X

ShyGuy_ThrowBlockDone:
	RTS



VeggieGuy_Frame = Objects_Data1
VeggieGuy_Holding = Objects_Data2
VeggieGuy_PullingVeggie = Objects_Data3

ObjInit_VeggieGuy:
	LDA #$04
	STA Objects_SpritesRequested, X
	
	JSR Object_CalcBoundBox
	JSR Object_MoveTowardsPlayer

	LDA #$01
	STA Objects_Health, X
	RTS		 ; Return

ObjNorm_VeggieGuy:
	LDA <Player_HaltGameZ
	BEQ VeggieGuy_Norm
	
	JMP VeggieGuy_Draw

VeggieGuy_Norm:
	JSR Object_DeleteOffScreen
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	JSR Object_FacePlayerOnLanding
	JSR VeggieGuy_FindVeggie
	JSR VeggieGuy_GrabVeggie
	JSR VeggieGuy_ThrowVeggie
	JSR Object_AttackOrDefeat

VeggieGuy_Animate:
	INC VeggieGuy_Frame, X

VeggieGuy_Draw:
	LDY #$00

	LDA VeggieGuy_PullingVeggie, X
	BNE VeggieGuy_DoDraw
	
	LDA VeggieGuy_Holding, X
	BEQ VeggieGuy_NoArms

	INY

VeggieGuy_NoArms:
	TYA
	ASL A
	STA <Temp_Var1

	LDA VeggieGuy_Frame, X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA <Temp_Var16
	ORA <Temp_Var1
	STA Objects_Frame, X

VeggieGuy_DoDraw:
	LDA <Objects_YVelZ, X
	BPL VeggieGuy_GroundAnim

	LDA #$05
	STA Objects_Frame, X
	JSR Object_DrawMirrored
	JMP VeggieGuy_DrawVeggie

VeggieGuy_GroundAnim:
	LDA Objects_Frame, X
	SUB #$04
	CMP #$02
	BCS VeggieGuy_DrawNorm

	JSR Object_DrawMirrored
	JMP VeggieGuy_DrawVeggie

VeggieGuy_DrawNorm:
	JSR Object_Draw

VeggieGuy_DrawVeggie:

	LDA VeggieGuy_Holding, X
	BEQ VeggieGuy_DrawDone

VeggieGuy_VeggieSprites:
	LDA #$0E
	ADD <Temp_Var16
	STA <Temp_Var16

	LDA Objects_SpritesVerticallyOffScreen, X
	AND #SPRITE_0_VINVISIBLE
	BNE VeggieGuy_DrawDone

	LDA Objects_SpritesHorizontallyOffScreen, X
	AND #SPRITE_0_HINVISIBLE
	BNE VeggieGuy_DrawRight

	LDA #$B3
	STA Sprite_RAMTile + 8, Y

	LDA Objects_SpriteX, X
	STA Sprite_RAMX + 8, Y

	LDA Objects_SpriteY, X
	SUB <Temp_Var16
	STA Sprite_RAMY + 8, Y

	LDA #SPR_PAL2
	STA Sprite_RAMAttr + 8, Y

VeggieGuy_DrawRight:
	LDA Objects_SpritesHorizontallyOffScreen, X
	AND #SPRITE_1_INVISIBLE
	BNE VeggieGuy_DrawDone

	LDA #$B3
	STA Sprite_RAMTile + 12, Y

	LDA Objects_SpriteX, X
	ADD #$08
	STA Sprite_RAMX + 12, Y

	LDA Objects_SpriteY, X
	SUB <Temp_Var16
	STA Sprite_RAMY + 12, Y

	LDA #(SPR_PAL2 | SPR_HFLIP)
	STA Sprite_RAMAttr + 12, Y

VeggieGuy_DrawDone:
	RTS

VeggieGuy_FindVeggie:
	LDA VeggieGuy_Holding, X
	BNE VeggieGuy_FindVeggieDone

	LDA VeggieGuy_PullingVeggie, X
	BNE VeggieGuy_FindVeggieDone

	LDA <Objects_XZ, X
	AND #$0F
	BNE VeggieGuy_FindVeggieDone

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ VeggieGuy_FindVeggieDone

	LDA Object_BodyTileProp, X
	CMP #TILE_PROP_SOLID_TOP
	BCS VeggieGuy_FindVeggieDone

	AND #$0F
	CMP #TILE_PROP_ENEMY
	BNE VeggieGuy_FindVeggieDone

	LDA #$20
	STA VeggieGuy_PullingVeggie, X
	
VeggieGuy_FindVeggieDone:
	RTS

VeggieGuy_GrabVeggie:
	LDA VeggieGuy_PullingVeggie, X
	BEQ VeggieGuy_GrabVeggieDone
	
	LDA #$00
	STA <Objects_XVelZ, X
	
	DEC VeggieGuy_PullingVeggie, X
	BNE VeggieGuy_KeepPulling

	LDA Block_NeedsUpdate
	BEQ VeggieGuy_Pluck

	INC VeggieGuy_PullingVeggie, X
	RTS

VeggieGuy_Pluck:
	
	LDA #$01
	STA VeggieGuy_Holding, X
	
	LDA #$E0
	STA <Objects_YVelZ, X

	LDA <Objects_XZ, X
	ADD #$08
	STA Block_DetectX

	LDA <Objects_XHiZ, X
	STA Block_DetectXHi

	LDA <Objects_YZ, X
	ADD #$08
	STA Block_DetectY

	LDA <Objects_YHiZ, X
	STA Block_DetectYHi

	LDA Object_BodyTileValue, X
	AND #$C0
	ORA #$01
	JSR Object_ChangeBlock
	RTS
	
VeggieGuy_KeepPulling:
	LDA #$04
	STA Objects_Frame, X
	RTS

VeggieGuy_GrabVeggieDone:
	RTS

VeggieGuy_ThrowVeggie:
	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ VeggieGuy_ThrowVeggieDone

	LDA <Objects_YVelZ, X
	BNE VeggieGuy_ThrowVeggieDone

	LDA VeggieGuy_Holding, X
	BEQ VeggieGuy_ThrowVeggieDone

	JSR Object_XDistanceFromPlayer
	LDA <XDiff
	CMP #$30
	BCS VeggieGuy_ThrowVeggieDone

	JSR Object_YDistanceFromPlayer

	LDA <YDiff
	CMP #$20
	BCS VeggieGuy_ThrowVeggieDone

	JSR Object_PrepProjectile
	BCC VeggieGuy_ThrowVeggieDone
	
	
	LDA #SOBJ_VEGGIE
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

	LDA #$E8
	STA SpecialObj_YVel, Y

	LDA #$E0
	STA SpecialObj_XVel, Y

	LDA <Objects_XVelZ, X
	BMI VeggieGuy_ClearHolding
	
	LDA #$20
	STA SpecialObj_XVel, Y

VeggieGuy_ClearHolding:
	LDA #$00
	STA VeggieGuy_Holding, X

VeggieGuy_ThrowVeggieDone:
	RTS



SnowGuy_Frame = Objects_Data1
SnowGuy_Holding = Objects_Data2
SnowGuy_DiggingSnow = Objects_Data3
SnowGuy_ForceDrawSnow =  Objects_Data4

ObjInit_SnowGuy:
	LDA #$04
	STA Objects_SpritesRequested, X

	JSR Object_CalcBoundBox
	JSR Object_MoveTowardsPlayer

	LDA Objects_Property, X
	STA SnowGuy_Holding, X

	LDA #$01
	STA Objects_Health, X
	RTS		 ; Return

ObjNorm_SnowGuy:
	LDA <Player_HaltGameZ
	BEQ SnowGuy_Norm
	
	JMP SnowGuy_Draw

SnowGuy_Norm:
	JSR Object_DeleteOffScreen
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	JSR Object_FacePlayerOnLanding
	JSR SnowGuy_FindSnow
	JSR SnowGuy_GrabSnow
	JSR SnowGuy_ThrowSnow
	JSR Object_AttackOrDefeat

SnowGuy_Animate:
	INC SnowGuy_Frame, X
	LDY #$00

	LDA SnowGuy_DiggingSnow, X
	BNE SnowGuy_Draw
	
	LDA SnowGuy_Holding, X
	BEQ SnowGuy_NoArms

	INY

SnowGuy_NoArms:
	TYA
	ASL A
	STA <Temp_Var1

	LDA SnowGuy_Frame, X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA <Temp_Var16
	ORA <Temp_Var1
	STA Objects_Frame, X

SnowGuy_Draw:
	LDA <Objects_YVelZ, X
	BPL SnowGuy_GroundAnim

	LDA #$05
	STA Objects_Frame, X
	JSR Object_DrawMirrored
	JMP SnowGuy_DrawSnow

SnowGuy_GroundAnim:
	LDA Objects_Frame, X
	SUB #$04
	CMP #$02
	BCS SnowGuy_DrawNorm

	JSR Object_DrawMirrored
	JMP SnowGuy_DrawSnow

SnowGuy_DrawNorm:
	JSR Object_Draw

SnowGuy_DrawSnow:
	LDA SnowGuy_ForceDrawSnow, X
	BEQ SnowGuy_SnowNotForced 

	LDA #$00
	STA SnowGuy_ForceDrawSnow, X
	BEQ SnowGuy_SnowSprites

SnowGuy_SnowNotForced:
	LDA SnowGuy_Holding, X
	BEQ SnowGuy_DrawDone

SnowGuy_SnowSprites:
	LDA #$0E
	ADD <Temp_Var16
	STA <Temp_Var16

	LDA Objects_SpritesHorizontallyOffScreen, X
	AND #SPRITE_0_HINVISIBLE
	BNE SnowGuy_DrawRight


	LDA #$8D
	STA Sprite_RAMTile + 8, Y

	LDA Objects_SpriteX, X
	STA Sprite_RAMX + 8, Y

	LDA Sprite_RAMY, Y
	SUB <Temp_Var16
	STA Sprite_RAMY + 8, Y

	LDA Sprite_RAMAttr, Y
	AND #SPR_BEHINDBG
	ORA #SPR_PAL2
	STA Sprite_RAMAttr + 8, Y

SnowGuy_DrawRight:
	LDA Objects_SpritesHorizontallyOffScreen, X
	AND #SPRITE_1_INVISIBLE
	BNE SnowGuy_DrawDone

	LDA #$8F
	STA Sprite_RAMTile + 12, Y

	LDA Objects_SpriteX, X
	ADD #$08
	STA Sprite_RAMX + 12, Y

	LDA Sprite_RAMY, Y
	SUB <Temp_Var16
	STA Sprite_RAMY + 12, Y

	LDA Sprite_RAMAttr, Y
	AND #SPR_BEHINDBG
	ORA #SPR_PAL2
	STA Sprite_RAMAttr + 12, Y

SnowGuy_DrawDone:
	RTS

SnowGuy_FindSnow:
	LDA SnowGuy_Holding, X
	BNE SnowGuy_FindSnowDone

	LDA SnowGuy_DiggingSnow, X
	BNE SnowGuy_FindSnowDone

	LDA <Objects_XZ, X
	AND #$0F
	BNE SnowGuy_FindSnowDone

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ SnowGuy_FindSnowDone

	LDA Object_VertTileProp, X
	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_ENEMYSOLID)
	BNE SnowGuy_FindSnowDone

	LDA #$40
	STA SnowGuy_DiggingSnow, X
	
SnowGuy_FindSnowDone:
	RTS

SnowGuy_GrabSnow:
	LDA SnowGuy_DiggingSnow, X
	BEQ SnowGuy_GrabSnowDone
	
	LDA #$00
	STA <Objects_XVelZ, X
	DEC SnowGuy_DiggingSnow, X
	BNE SnowGuy_KeepDigging
	
	LDA #$01
	STA SnowGuy_Holding, X
	
	LDA #$E0
	STA <Objects_YVelZ, X
	RTS
	
SnowGuy_KeepDigging:
	LDA SnowGuy_DiggingSnow, X
	CMP #$20
	BCS ShyGuy_DigAnimate
	
	LDA #$06
	STA Objects_Frame, X
	RTS
	
ShyGuy_DigAnimate:
	LSR A
	LSR A
	LSR A
	AND #$01
	ADD #$04
	STA Objects_Frame, X
	
SnowGuy_GrabSnowDone:
	RTS

SnowGuy_ThrowSnow:
	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ SnowGuy_ThrowSnowDone

	LDA <Objects_YVelZ, X
	BNE SnowGuy_ThrowSnowDone

	LDA SnowGuy_Holding, X
	BEQ SnowGuy_ThrowSnowDone

	JSR Object_XDistanceFromPlayer
	LDA <XDiff
	CMP #$50
	BCS SnowGuy_ThrowSnowDone

	JSR Object_FindEmptyY
	BCC SnowGuy_ThrowSnowDone
	
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

	LDA #$E8
	STA Objects_YVelZ, Y

	LDA #OBJ_SNOWBALL
	STA Objects_ID, Y

	LDA #SPR_PAL2
	STA Objects_SpriteAttributes, Y
	
	LDA #$E8
	STA Objects_XVelZ, Y

	LDA Objects_Orientation, X
	AND #SPR_HFLIP
	BEQ SnowGuy_ClearHolding

	LDA Objects_XVelZ, Y
	EOR #$FF
	ADD #$01
	STA Objects_XVelZ, Y

SnowGuy_ClearHolding:
	LDA #$00
	STA SnowGuy_Holding, X

	INC SnowGuy_ForceDrawSnow, X

SnowGuy_ThrowSnowDone:
	RTS    

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


ObjNorm_Troopa:
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


ObjInit_BuzzyBeetle:
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

Spiny_Frame = Objects_Data1

ObjInit_Spiny:
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

PoisonMushroom_Action = Objects_Data1

ObjInit_PoisonMushroom:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_NOICE | ATTR_STOMPKICKSOUND |ATTR_WINDAFFECTS  | ATTR_BUMPNOKILL)
	STA Objects_BehaviorAttr, X

	JSR Object_MoveTowardsPlayer
	RTS

ObjNorm_PoisonMushroom:

	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE ObjNorm_PoisonMushroom0

	LDA #$80
	STA CompleteLevelTimer

	JSR DestroyAllEnemies

	JMP Object_PoofDie

ObjNorm_PoisonMushroom0:
	JSR Object_DeleteOffScreen

	LDA Objects_Property, X
	JSR DynJump

	.word PoisonMushroom_Normal
	.word PoisonMushroom_InsideBlock

PoisonMushroom_Normal:
	LDA <Player_HaltGameZ
	BNE PoisonMushroom_Draw

	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	
	LDA Objects_Orientation, X
	AND #~SPR_VFLIP
	STA Objects_Orientation, X

	JSR Object_InteractWithObjects

PoisonMushroom_Draw:
	JMP Object_DrawMirrored

PoisonMushroom_InsideBlock:
	LDA #ATTR_ALLWEAPONPROOF
	STA Objects_WeaponAttr, X

	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	
	LDA Object_BodyTileProp, X
	CMP #TILE_PROP_ITEM
	BCS PoisonMushroom_InsideBlockRTS

	JSR Object_MoveTowardsPlayer	

	LDA #$00
	STA Objects_Property, X

	LDA <Objects_YZ, X
	SUB #$02
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	SBC #$00
	STA <Objects_YHiZ, X

	LDA #SND_LEVELRISE
	STA Sound_QLevel1

	LDA #$C0
	STA <Objects_YVelZ, X

	LDA #$00
	STA Objects_WeaponAttr, X

PoisonMushroom_InsideBlockRTS:
	LDA #$04
	STA Objects_Timer2, X
	RTS

SwimCheep_CurrentFrame = Objects_Data1
SwimCheep_StartX = Objects_Data2
SwimCheep_StartXHi = Objects_Data3
SwimCheep_StartY = Objects_Data4
SwimCheep_StartYHi = Objects_Data5

ObjInit_SwimmingCheep:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #$02
	STA Objects_ExpPoints, X

	LDA #(ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	JSR InitPatrol

	LDA <Objects_XZ, X
	STA SwimCheep_StartX, X


	LDA Objects_Property, X
	CMP #$06
	BNE ObjInit_SwimmingCheepRTS

	LDA #$F8
	STA ChaseVel_LimitLo, X

	LDA #$08
	STA ChaseVel_LimitHi, X

ObjInit_SwimmingCheepRTS:
	RTS

ObjNorm_SwimmingCheep:
	LDA <Player_HaltGameZ
	BNE Cheep_Draw

	LDA Objects_Property, X
	CMP #$06
	BEQ SwimmingCheep_CheckDelete

	LDA <Objects_XZ, X
	CMP SwimCheep_StartX, X
	BNE SwimmingCheep_NoDelete

SwimmingCheep_CheckDelete:
	JSR Object_DeleteOffScreen

SwimmingCheep_NoDelete:
	JSR DoPatrol
	JSR Object_FaceDirectionMoving
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_InteractWithTilesWallStops
	JSR Object_AttackOrDefeat

	LDA Objects_Property, X
	CMP #$06
	BNE ObjNorm_SwimmingCheep2

ObjNorm_SwimmingCheep1:
	LDA Object_VertTileProp, X
	BNE ObjNorm_SwimmingCheep2

	JSR Object_HitCeiling

ObjNorm_SwimmingCheep2:
	LDA Object_HorzTileProp, X
	BNE ObjNorm_SwimmingCheep3

	JSR Object_HitWall

ObjNorm_SwimmingCheep3:
	INC SwimCheep_CurrentFrame,X	 ; Var5++

	; Toggle frame 0/1
	LDA SwimCheep_CurrentFrame,X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame,X

Cheep_Draw:
	JMP Object_Draw