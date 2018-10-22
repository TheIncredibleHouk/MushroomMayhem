    .org ObjectGroup_InitJumpTable
;****************************** OBJECT INITIALIZATION ******************************
    .word ObjInit_Explosion	; Object $50 - OBJ_EXPLOSION
	.word ObjInit_DoNothing	; Object $51 - OBJ_ROTODISCDUAL
	.word ObjInit_Spintula	; Object $52 - OBJ_SPINTULA
	.word ObjInit_PipePodobo	; Object $53 - OBJ_PIPEPODOBO
	.word ObjInit_DoNothing		; Object $54 - OBJ_DONUTLIFTSHAKEFALL
	.word ObjInit_BobOmb		; Object $55 - OBJ_BOBOMB
	.word ObjInit_DoNothing	; Object $56 - OBJ_PIRANHASIDEWAYSLEFT
	.word ObjInit_DoNothing	; Object $57 - OBJ_PIRANHASIDEWAYSRIGHT
	.word ObjInit_Pyrantula		; Object $58 - OBJ_PYRANTULA
	.word ObjInit_FireSnake		; Object $59 - OBJ_FIRESNAKE
	.word ObjInit_DoNothing	; Object $5A - OBJ_ROTODISCCLOCKWISE
	.word ObjInit_DoNothing	; Object $5B - OBJ_ROTODISCCCLOCKWISE
	.word ObjInit_IceBlock		; Object $5C - OBJ_ICEBLOCK
	.word ObjInit_DoNothing		; Object $5D - OBJ_STONEBLOCK
	.word ObjInit_DoNothing	; Object $5E - OBJ_ROTODISCDUALOPPOSE
	.word ObjInit_DoNothing	; Object $5F - OBJ_ROTODISCDUALOPPOSE2
	.word ObjInit_DoNothing	; Object $60 - OBJ_ROTODISCDUALCCLOCK
	.word ObjInit_PhantomBlooper	; Object $61 - OBJ_SKULLBLOOPER
	.word ObjInit_Blooper		; Object $62 - OBJ_BLOOPER
	.word ObjInit_FloatMine	; Object $63 - OBJ_FLOATMINE

    .org ObjectGroup_NormalJumpTable
;****************************** OBJECT GAME LOOP ******************************
	.word ObjNorm_Explosion		; Object $50 - OBJ_EXPLOSION
	.word ObjNorm_DoNothing	; Object $51 - OBJ_ROTODISCDUAL
	.word ObjNorm_Spintula	; Object $52 - OBJ_SPINTULA
	.word ObjNorm_PipePodobo	; Object $53 - OBJ_PIPEPODOBO
	.word ObjNorm_DoNothing		; Object $54 - OBJ_DONUTLIFTSHAKEFALL
	.word ObjNorm_BobOmb		; Object $55 - OBJ_BOBOMB
	.word ObjNorm_DoNothing	; Object $56 - OBJ_PIRANHASIDEWAYSLEFT
	.word ObjNorm_DoNothing	; Object $57 - OBJ_PIRANHASIDEWAYSRIGHT
	.word ObjNorm_Pyrantula		; Object $58 - OBJ_PYRANTULA
	.word ObjNorm_FireSnake		; Object $59 - OBJ_FIRESNAKE
	.word ObjNorm_DoNothing		; Object $5A - OBJ_ROTODISCCLOCKWISE
	.word ObjNorm_DoNothing		; Object $5B - OBJ_ROTODISCCCLOCKWISE
	.word ObjNorm_IceBlock		; Object $5C - OBJ_ICEBLOCK
	.word ObjNorm_IceBlock		; Object $5D - OBJ_STONEBLOCK
	.word ObjNorm_DoNothing	; Object $5E - OBJ_ROTODISCDUALOPPOSE
	.word ObjNorm_DoNothing	; Object $5F - OBJ_ROTODISCDUALOPPOSE2
	.word ObjNorm_DoNothing	; Object $60 - OBJ_ROTODISCDUALCCLOCK
	.word ObjNorm_PhantomBlooper		; Object $61 - OBJ_SKULLBLOOPER
	.word ObjNorm_Blooper		; Object $62 - OBJ_BLOOPER
	.word ObjNorm_FloatMine	; Object $63 - OBJ_FLOATMINE

    .org ObjectGroup_CollideJumpTable
;****************************** OBJECT PLAYER INTERACTION ******************************
	.word Object_HurtPlayer	; Object $50 - OBJ_EXPLOSION
	.word ObjHit_DoNothing	; Object $51 - OBJ_ROTODISCDUAL
	.word ObjHit_DoNothing	; Object $52 - OBJ_SPINTULA
	.word ObjHit_DoNothing	; Object $53 - OBJ_PIPEPODOBO
	.word ObjHit_DoNothing	; Object $54 - OBJ_DONUTLIFTSHAKEFALL
	.word Object_Hold	; Object $55 - OBJ_BOBOMB
	.word ObjHit_DoNothing	; Object $56 - OBJ_PIRANHASIDEWAYSLEFT
	.word ObjHit_DoNothing	; Object $57 - OBJ_PIRANHASIDEWAYSRIGHT
	.word ObjHit_DoNothing	; Object $58 - OBJ_PYRANTULA
	.word ObjHit_DoNothing	; Object $59 - OBJ_FIRESNAKE
	.word ObjHit_DoNothing	; Object $5A - OBJ_ROTODISCCLOCKWISE
	.word ObjHit_DoNothing	; Object $5B - OBJ_ROTODISCCCLOCKWISE
	.word Object_Hold	; Object $5C - OBJ_ICEBLOCK
	.word ObjHit_DoNothing	; Object $5D - OBJ_STONEBLOCK
	.word ObjHit_DoNothing	; Object $5E - OBJ_ROTODISCDUALOPPOSE
	.word ObjHit_DoNothing	; Object $5F - OBJ_ROTODISCDUALOPPOSE2
	.word ObjHit_DoNothing	; Object $60 - OBJ_ROTODISCDUALCCLOCK
	.word ObjHit_DoNothing	; Object $61 - OBJ_SKULLBLOOPER
	.word ObjHit_DoNothing	; Object $62 - OBJ_BLOOPER
	.word FloatMine_Expload	; Object $63 - OBJ_FLOATMINE

    .org ObjectGroup_PatTableSel
;****************************** OBJECT PALETTE/SIZE ******************************
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $50 - OBJ_EXPLOSION
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $51 - OBJ_ROTODISCDUAL
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $52 - OBJ_SPINTULA
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $53 - OBJ_PIPEPODOBO
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $54 - OBJ_DONUTLIFTSHAKEFALL
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $55 - OBJ_BOBOMB
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH24	; Object $56 - OBJ_PIRANHASIDEWAYSLEFT
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH24	; Object $57 - OBJ_PIRANHASIDEWAYSRIGHT
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $58 - OBJ_PYRANTULA
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $59 - OBJ_FIRESNAKE
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $5A - OBJ_ROTODISCCLOCKWISE
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $5B - OBJ_ROTODISCCCLOCKWISE
	.byte OA1_PAL2 | OA1_WIDTH16 | OA1_WIDTH16	; Object $5C - OBJ_ICEBLOCK
	.byte OA1_PAL1 | OA1_WIDTH16 | OA1_WIDTH16	; Object $5D - OBJ_STONEBLOCK
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $5E - OBJ_ROTODISCDUALOPPOSE
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $5F - OBJ_ROTODISCDUALOPPOSE2
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $60 - OBJ_ROTODISCDUALCCLOCK
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $61 - OBJ_SKULLBLOOPER
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $62 - OBJ_BLOOPER
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH48	; Object $63 - OBJ_FLOATMINE

    .org ObjectGroup_PatTableSel
;****************************** OBJECT PATTERN TABLE ******************************
	.byte OPTS_NOCHANGE	; Object $50 - OBJ_EXPLOSION
	.byte OPTS_SETPT5 | $12	; Object $51 - OBJ_ROTODISCDUAL
	.byte OPTS_SETPT5 | $0A	; Object $52 - OBJ_SPINTULA
	.byte OPTS_NOCHANGE	; Object $53 - OBJ_PIPEPODOBO
	.byte OPTS_SETPT5 | $0E	; Object $54 - OBJ_DONUTLIFTSHAKEFALL
	.byte OPTS_SETPT5 | $0A	; Object $55 - OBJ_BOBOMB
	.byte OPTS_SETPT5 | $5A	; Object $56 - OBJ_PIRANHASIDEWAYSLEFT
	.byte OPTS_SETPT5 | $5A	; Object $57 - OBJ_PIRANHASIDEWAYSRIGHT
	.byte OPTS_SETPT5 | $0A	; Object $58 - OBJ_PYRANTULA
	.byte OPTS_SETPT5 | $0A	; Object $59 - OBJ_FIRESNAKE
	.byte OPTS_SETPT5 | $12	; Object $5A - OBJ_ROTODISCCLOCKWISE
	.byte OPTS_SETPT5 | $12	; Object $5B - OBJ_ROTODISCCCLOCKWISE
	.byte OPTS_NOCHANGE	; Object $5C - OBJ_ICEBLOCK
	.byte OPTS_NOCHANGE	; Object $5D - OBJ_STONEBLOCK
	.byte OPTS_SETPT5 | $12	; Object $5E - OBJ_ROTODISCDUALOPPOSE
	.byte OPTS_SETPT5 | $12	; Object $5F - OBJ_ROTODISCDUALOPPOSE2
	.byte OPTS_SETPT5 | $12	; Object $60 - OBJ_ROTODISCDUALCCLOCK
	.byte OPTS_SETPT5 | $1A	; Object $61 - OBJ_SKULLBLOOPER
	.byte OPTS_SETPT5 | $1A	; Object $62 - OBJ_BLOOPER
	.byte OPTS_SETPT5 | $1A	; Object $63 - OBJ_FLOATMINE

	.org ObjectGroup_KillAction	
;****************************** OBJECT DEATH ROUTINE ******************************
	.byte KILLACT_JUSTDRAW16X16	; Object $50 - OBJ_EXPLOSION
	.byte KILLACT_STANDARD	; Object $51 - OBJ_ROTODISCDUAL
	.byte KILLACT_POOFDEATH	; Object $52 - OBJ_SPINTULA
	.byte KILLACT_POOFDEATH	; Object $53 - OBJ_PIPEPODOBO
	.byte KILLACT_STANDARD	; Object $54 - OBJ_DONUTLIFTSHAKEFALL
	.byte KILLACT_POOFDEATH	; Object $55 - OBJ_BOBOMB
	.byte KILLACT_POOFDEATH	; Object $56 - OBJ_PIRANHASIDEWAYSLEFT
	.byte KILLACT_POOFDEATH	; Object $57 - OBJ_PIRANHASIDEWAYSRIGHT
	.byte KILLACT_POOFDEATH	; Object $58 - OBJ_PYRANTULA
	.byte KILLACT_POOFDEATH	; Object $59 - OBJ_FIRESNAKE
	.byte KILLACT_STANDARD	; Object $5A - OBJ_ROTODISCCLOCKWISE
	.byte KILLACT_STANDARD	; Object $5B - OBJ_ROTODISCCCLOCKWISE
	.byte KILLACT_NORMALSTATE	; Object $5C - OBJ_ICEBLOCK
	.byte KILLACT_NORMALSTATE	; Object $5D - OBJ_STONEBLOCK
	.byte KILLACT_STANDARD	; Object $5E - OBJ_ROTODISCDUALOPPOSE
	.byte KILLACT_STANDARD	; Object $5F - OBJ_ROTODISCDUALOPPOSE2
	.byte KILLACT_STANDARD	; Object $60 - OBJ_ROTODISCDUALCCLOCK
	.byte KILLACT_JUSTDRAWMIRROR	; Object $61 - OBJ_SKULLBLOOPER
	.byte KILLACT_POOFDEATH	; Object $62 - OBJ_BLOOPER
	.byte KILLACT_NORMALSTATE	; Object $63 - OBJ_FLOATMINE


OG5_POff .func (\1 - ObjectGroup05_PatternSets)

	.org ObjectGroup_PatternStarts	; <-- help enforce this table *here*
;****************************** OBJECT FRAME TABLE ******************************
	.byte OG5_POff(ObjP50), OG5_POff(ObjP51), OG5_POff(ObjP52), OG5_POff(ObjP53)
	.byte OG5_POff(ObjP54), OG5_POff(ObjP55), OG5_POff(ObjP56), OG5_POff(ObjP57)
	.byte OG5_POff(ObjP58), OG5_POff(ObjP59), OG5_POff(ObjP5A), OG5_POff(ObjP5B)
	.byte OG5_POff(ObjP5C), OG5_POff(ObjP5D), OG5_POff(ObjP5E), OG5_POff(ObjP5F)
	.byte OG5_POff(ObjP60), OG5_POff(ObjP61), OG5_POff(ObjP62), OG5_POff(ObjP63)


	.org ObjectGroup_PatternSets	; <-- help enforce this table *here*
;****************************** OBJECT FRAMES DEFINITION ******************************    
ObjectGroup05_PatternSets:

ObjP50:
ObjP51:
ObjP52:
ObjP53:
	.byte $8D, $8D, $8F, $8F, $95, $95

ObjP54:
	.byte $91, $93, $91, $93    

ObjP55:
	.byte $A7, $A9, $AB, $AD, $97, $99, $97, $99

ObjP56:
ObjP57:
	.byte $81, $83, $87, $89    

ObjP58:
	.byte $A1, $A1, $A3, $A3, $A5, $A5

ObjP59:
	.byte $81, $83, $85, $87, $85, $87

ObjP5A:
ObjP5B:
	.byte $A1, $A1, $A3, $A3, $A5 ,$A5

ObjP5C:
	.byte $61, $61

ObjP5D:
	.byte $97, $99, $97, $99, $61, $63

ObjP5E:
ObjP5F:
ObjP60:
	.byte $99, $9B, $9D, $9F

ObjP61:
	.byte $B5, $B5, $B7, $B7, $B5, $B5

ObjP62:

	.byte $B1, $B1, $B3, $B3, $B1, $B1
ObjP63:
	.byte $81, $83, $A1, $A3    

	; X and Y offsets for the exploding Bob-omb stars
BombStars_XOff:	.byte -$04, $04, $08, $04, -$04, -$08, $00, $08, $08, $00, -$08, -$08
BombStars_YOff:	.byte -$08, -$08, $00, $08, $08, $00, $08, $04, -$04, -$08, -$04, $04

Explosion_Offset = Objects_Data1

ObjInit_Explosion:
	LDA #$06
	STA Objects_SpritesRequested, X

	LDA #BOUND48x48
	STA Objects_BoundBox, X

	JSR Object_NoInteractions

	LDA #$18
	STA Objects_Timer,X

	LDA Sound_QLevel1
	ORA #SND_LEVELBABOOM
	STA Sound_QLevel1

	LDA #$10
	STA RotatingColor_Cnt
	RTS		 ; Return

ObjNorm_Explosion:
	
	LDA <Player_HaltGameZ
	BNE DrawEx	 ; If gameplay is halted, jump to PRG003_A82E

	INC Explosion_Offset,X	 ; Otherwise, Var4++

DrawEx:
	LDA Objects_Timer,X
	BNE PRG003_A836	 ; If timer has not expired, jump to PRG003_A836

	JMP Object_SetDeadEmpty	 ; Otherwise, mark Bob-omb as Dead/Empty and don't come back!

PRG003_A836:

	JSR Explosion_CalcBoundBox
	JSR Explosion_KillOthers
	JSR Object_InteractWithPlayer

Explosion_NoKill:
	JSR Object_CalcSpriteXY_NoHi

	; Temp_Var16 = 5
	LDA #$05
	STA <Temp_Var16

PRG003_A83D:
	; Temp_Var1 = Bob-omb's sprite Y
	LDA <Objects_SpriteY,X
	STA <Temp_Var1	

	; Temp_Var2 = Bob-omb's sprite X + 4
	LDA <Objects_SpriteX,X
	ADD #$04
	STA <Temp_Var2

	LDA Objects_Data1,X
	LSR A		 ; Var4 / 2
	PHA		 ; Save value

	; Temp_Var3 = 0 to 3, depending on Var4 / 2
	AND #$03
	STA <Temp_Var3

	LDX <Temp_Var16	 ; X = Temp_Var16

	PLA		 ; Restore Var4 / 2

	AND #$04	 ; Mask 0-3
	BEQ PRG003_A85C	 ; If result is zero, jump to PRG003_A85C

	; Otherwise, X += 6
	TXA
	ADD #$06
	TAX

PRG003_A85C:
	LDA <Temp_Var1
	ADD BombStars_YOff,X
	STA <Temp_Var1

	LDA <Temp_Var2
	ADD BombStars_XOff,X
	STA <Temp_Var2

	DEC <Temp_Var3	 ; Temp_Var3--
	BPL PRG003_A85C	 ; While Temp_Var3 >= 0, loop!

	LDX <CurrentObjectIndexZ		 ; X = object slot index

	JSR Sprite_NoCarryIfVisible
	BCS PRG003_A89D	 ; If this star is not visible, jump to PRG003_A89D

	LDA <Temp_Var16
	ASL A
	ASL A		; A = Temp_Var16 * 4 (one sprite per star)
	ADC Object_SpriteRAMOffset,X	 ; Add the base Sprite_RAM offset
	TAY		 ; -> 'Y'

	; Star Y
	LDA <Temp_Var1
	STA Sprite_RAM+$00,Y

	; Star X
	LDA <Temp_Var2
	STA Sprite_RAM+$03,Y

	; Star pattern
	LDA #$17
	STA Sprite_RAM+$01,Y

	LDA <Counter_1
	LSR A	
	LSR A	
	ADD <CurrentObjectIndexZ
	AND #$03	 ; Palette select 0 to 3
	STA Sprite_RAM+$02,Y	 ; Set attributes

PRG003_A89D:
	DEC <Temp_Var16	 ; Temp_Var16--
	BPL PRG003_A83D	 ; While Temp_Var16 >= 0, loop!

Explosion_BumpBlocks:
	LDA Objects_Timer,X
	AND #$07
	TAY

	LDA <Objects_XZ, X
	ADD ExplodeXOffsets + 8, Y
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	ADC ExplodeXOffsets, Y
	STA Tile_DetectionXHi

	LDA <Objects_YZ, X
	ADD ExplodeYOffsets + 8, Y
	STA Tile_DetectionY

	LDA <Objects_YHiZ, X
	ADC ExplodeYOffsets, Y
	STA Tile_DetectionYHi

	JSR Object_DetectTile

	LDA Tile_LastProp
	CMP #(TILE_PROP_SOLID_TOP | TILE_PROP_STONE)
	BEQ Explosion_Bust

	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_STONE)
	BEQ Explosion_Bust 

	CMP #(TILE_PROP_SOLID_TOP | TILE_PROP_ENEMYSOLID)
	BEQ Explosion_Bust

	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_ENEMYSOLID)
	BEQ Explosion_Bust

	CMP #(TILE_PROP_ITEM)
	BCS Explosion_Bump

Explosion_BumpRTS:
	RTS

Explosion_Bust:
	LDA #TILE_ITEM_BRICK
	STA Tile_LastProp

Explosion_Bump:
	JSR Object_DirectBumpBlocks
	RTS

Explosion_CalcBoundBox:
	LDA <Objects_XZ, X
	SUB #$18
	STA Objects_BoundLeft, X

	LDA <Objects_XHiZ, X
	SBC #$00
	STA Objects_BoundLeftHi, X

	LDA Objects_BoundLeft, X
	ADD #$30
	STA Objects_BoundRight, X

	LDA Objects_BoundLeftHi, X
	ADC #$00
	STA Objects_BoundRightHi, X
	
	LDA <Objects_YZ, X
	SUB #$18
	STA Objects_BoundTop, X

	LDA <Objects_YHiZ, X
	SBC #$00
	STA Objects_BoundTopHi, X

	LDA Objects_BoundTop, X
	ADD #$30
	STA Objects_BoundBottom, X

	LDA Objects_BoundTopHi, X
	ADC #$00
	STA Objects_BoundBottomHi, X
	RTS

ExplodeXOffsets:
	.byte $FF, $00, $00, $FF, $00, $FF, $00, $00
	.byte $F8, $08, $18, $F8, $18, $F8, $08, $18

ExplodeYOffsets
	.byte $FF, $FF, $FF, $00, $00, $00, $00, $00
	.byte $F8, $F8, $F8, $08, $08, $18, $18, $18

Sprite_NoCarryIfVisible:
	LDA Objects_SpritesVerticallyOffScreen,X	 
	BNE PRG003_B8E7	 ; If any of the sprites are vertically off-screen, jump to PRG003_B8E7

	LDA <Objects_SpriteY,X
	CMP #208
	BGE PRG003_B8E7	 ; If sprite Y >= 208, jump to PRG003_B8E7

	LDY #$40	 ; Y = $40

	LDA <Objects_SpriteX,X
	BMI PRG003_B8DA	 ; If sprite X >= $80, jump to PRG003_B8DA

	LDY #$C0	 ; Y = $C0

PRG003_B8DA:
	CPY <Temp_Var2	 ; Compare $40 or $C0 to input X value

	EOR Objects_SpritesVerticallyOffScreen,X

	BMI PRG003_B8E5	 ; If there are inappropriate horizontally off-screen sprites (??) jump to PRG003_B8E5

	BLT PRG003_B8E7	 ; If input X value < 'Y', jump to PRG003_B8E7 (carry clear, but will set carry)
	BGE PRG003_B8E9	 ; If input X value >= 'Y', jump to PRG003_B8E9 (carry set, but will be clear)

PRG003_B8E5:
	BLT PRG003_B8E9	 ; If input X value < 'Y', jump to PRG003_B8E9 (carry clear)

PRG003_B8E7:
	SEC		 ; Set carry
	RTS		 ; Return

PRG003_B8E9:
	CLC		 ; Clear carry
	RTS		 ; Return

ObjInit_Spintula:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_STOMPKICKSOUND)
	STA Objects_BehaviorAttr, X

	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	
	LDA Object_BodyTileValue, X
	STA Spintula_DetectTile, X

	EOR #$01
	STA Spintula_DetectTile2, X
	RTS		 ; Return

Spintula_DetectTile = Objects_Data3
Spintula_DetectTile2 = Objects_Data4
Spintula_Action = Objects_Data5
Spintula_Frame = Objects_Data6
Spintula_Pause = Objects_Data7

ObjNorm_Spintula:
	LDA <Player_HaltGameZ
	BEQ ObjNorm_Spintula1
	
	JMP Object_DrawMirrored	

ObjNorm_Spintula1:
	JSR Object_DeleteOffScreen
	LDA Spintula_Pause, X
	BNE ObjNorm_Spintula2

	JSR Object_ApplyYVel_NoGravity

ObjNorm_Spintula2:
	LDA #$00
	STA Spintula_Pause, X
	
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_DetectTiles

	LDA Spintula_Action, X
	JSR DynJump
	
	.word Spintula_Wait
	.word Spintula_SpinDown
	.word Spintula_Wait2
	.word Spintula_SpinUp

Spintula_Wait:
	LDA Objects_Timer,X
	BNE Spintula_WaitRTS
	
	JSR Object_XDistanceFromPlayer
	CMP #$28
	
	BCS Spintula_WaitRTS
	INC Spintula_Action, X
	
	LDA #$20
	STA <Objects_YVelZ, X
	STA Spintula_Pause, X

Spintula_WaitRTS:
	JMP Object_DrawMirrored

Spintula_SpinDown:
	LDA <Objects_YHiZ, X
	BEQ Spintula_GoDown

	LDA <Objects_YZ, X
	CMP #$A0
	BCS Spintula_SpinDownStop

Spintula_GoDown:
	LDA Object_VertTileValue, X
	CMP Spintula_DetectTile, X
	BEQ Spintula_DrawWeb

	CMP Spintula_DetectTile2, X
	BNE Spintula_SpinDownStop

Spintula_DrawWeb:
	LDA <Objects_YZ, X
	AND #$0F
	BNE Spintual_DownDraw

	LDA Block_NeedsUpdate
	BEQ Spintual_DoDrawWeb
	
	INC Spintula_Pause, X
	BNE Spintula_SpinDownRTS

Spintual_DoDrawWeb:
	LDA Object_BodyTileValue, X
	ORA #$01
	JSR Object_ChangeBlock
	
Spintual_DownDraw:
	INC Spintula_Frame, X
	LDA Spintula_Frame, X
	LSR A
	AND #$01
	STA Objects_Frame, X
	
Spintula_SpinDownRTS:
	JMP Object_DrawMirrored

Spintula_SpinDownStop:
	INC Spintula_Action, X

	LDA #$20
	STA Objects_Timer,X

	LDA #$00
	STA <Objects_YVelZ, X
	JMP Object_DrawMirrored

Spintula_Wait2:
	LDA Objects_Timer, X
	BNE Spintula_Wait2Draw

	INC Spintula_Action, X
	LDA #$F0
	STA <Objects_YVelZ, X

Spintula_Wait2Draw:
	JMP Object_DrawMirrored

Spintula_SpinUp:

	LDA Object_VertTileValue, X
	CMP Spintula_DetectTile, X
	BEQ Spintula_DeleteWeb

	CMP Spintula_DetectTile2, X
	BNE Spintula_SpinUpStop

Spintula_DeleteWeb:
	LDA <Objects_YZ, X
	AND #$0F
	BNE Spintual_UpDraw

	LDA Block_NeedsUpdate
	BEQ Spintula_DoDeleteWeb

	INC Spintula_Pause, X
	BNE Spintula_SpinUpRTS

Spintula_DoDeleteWeb:
	LDA Object_BodyTileValue, X
	AND #$FE

	JSR Object_ChangeBlock
	
Spintual_UpDraw:
	INC Spintula_Frame, X
	LDA Spintula_Frame, X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame, X
	
Spintula_SpinUpRTS:
	JMP Object_DrawMirrored

Spintula_SpinUpStop:
	LDA #$00
	STA Spintula_Action, X

	LDA #$20
	STA Objects_Timer,X

	LDA #$00
	STA <Objects_YVelZ, X
	JMP Object_DrawMirrored


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

ObjInit_BobOmb:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_FIREPROOF | ATTR_ICEPROOF | ATTR_NINJAPROOF)
	STA Objects_WeaponAttr, X

	LDA #(ATTR_STOMPKICKSOUND | ATTR_WINDAFFECTS | ATTR_BUMPNOKILL | ATTR_CARRYANDBUMP)
	STA Objects_BehaviorAttr, X

	JSR Object_MoveTowardsPlayer
	RTS		 ; Return

BobOmb_Action = Objects_Data1
BobOmb_BehindTimer = Objects_Data2
BobOmb_Frame = Objects_Data3
BobOmb_Activated = Objects_Data4
BobOmb_Unstable = Objects_Data5

ObjNorm_BobOmb:
	LDA <Player_HaltGameZ
	BEQ BobOmb_DoAction

	JMP Object_Draw

BobOmb_DoAction:
	
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED

	BEQ BobOmb_Death

	LDA BobOmb_Action, X
	JSR DynJump

	.word BobOmb_Norm
	.word BobOmb_Left
	.word BobOmb_Right
	.word BobOmb_Raise
	.word BobOmb_Drop

BobOmb_Death:

	LDA Objects_PlayerProjHit, X
	CMP #HIT_FIREBALL
	BNE BobOmb_Death1

	LDA #$01
	STA Explosion_Timer, X

	LDA #OBJSTATE_NORMAL
	STA  Objects_State, X

BobOmb_Death1:
	JMP BobOmb_Draw

BobOmb_Raise:
	LDA Objects_Timer, X
	BEQ BobOmb_PopOut

	CMP #$20
	BCC BobOmb_RaiseDone

	LDA #$F0
	STA <Objects_YVelZ, X
	JSR Object_ApplyYVel_NoGravity
	JMP BobOmb_Draw

BobOmb_PopOut:
	JSR Object_CalcBoundBox
	JSR Object_MoveDirectionFacing
	
	LDA #$D0
	STA <Objects_YVelZ, X

	LDA #$00
	STA BobOmb_Action, X

	LDA #$08
	STA BobOmb_BehindTimer, X

BobOmb_RaiseDone:
	JMP BobOmb_Draw

BobOmb_Drop:
	LDA Objects_Timer, X
	BEQ BobOmb_DropDown

	CMP #$20
	BCC BobOmb_DropDone

	LDA #$10
	STA <Objects_YVelZ, X
	JSR Object_ApplyYVel_NoGravity
	JMP BobOmb_Draw

BobOmb_DropDown:
	JSR Object_CalcBoundBox
	
	LDA #$01
	STA <Objects_YVelZ, X

	LDA #$00
	STA BobOmb_Action, X

	LDA #$08
	STA BobOmb_BehindTimer, X

BobOmb_DropDone:
	JMP BobOmb_Draw

BobOmb_Left:
	LDA Objects_Timer, X
	CMP #$10
	BEQ BobOmb_Out

	LDA #$F8
	STA <Objects_XVelZ, X
	JSR Object_ApplyXVel

	LDA #$00
	STA Objects_Orientation, X

	JMP BobOmb_Animate

BobOmb_Right:
	LDA Objects_Timer, X
	BEQ BobOmb_Out

	LDA #$08
	STA <Objects_XVelZ, X
	JSR Object_ApplyXVel

	LDA #SPR_HFLIP
	STA Objects_Orientation, X

	JMP BobOmb_Animate

BobOmb_Out:
	LDA #$00
	STA BobOmb_Action, X

	LDA #$08
	STA BobOmb_BehindTimer, X
	JMP BobOmb_Animate

BobOmb_Norm:

	JSR Object_DeleteOffScreen	 
	JSR Object_Move
	JSR Object_FaceDirectionMoving
	JSR Object_CalcBoundBox

	LDA <Objects_XVelZ, X
	BNE BobOmb_Norm1

	JSR Object_FacePlayerOnLanding

BobOmb_Norm1:

	LDA Explosion_Timer, X
	ORA BobOmb_Unstable, X
	BEQ BobOmb_Attack

	JSR Object_DetectTiles
	
	LDA BobOmb_Unstable, X
	BNE BobOmb_UnstableCheck

	JSR Object_DampenVelocity
	JSR Object_InteractWithTiles
	JSR Object_InteractWithPlayer
	JSR Object_InteractWithObjects
	
	LDA #$02
	STA Objects_Frame, X
	JMP Object_Draw

BobOmb_UnstableCheck:
	JSR Object_InteractWithTiles
	JSR Object_InteractWithPlayer
	JSR Object_RespondToTailAttack

	LDA Objects_BeingHeld, X
	BEQ BobOmb_Normal
	
	JMP BobOmb_ShakeDraw

BobOmb_Normal:
	LDA Objects_PreviousTilesDetect,X
	BNE BobOmb_ShakeDraw

	LDA <Objects_TilesDetectZ,X
	BEQ BobOmb_ShakeDraw

	LDA #$01
	STA Explosion_Timer, X
	BNE BobOmb_ShakeDraw

BobOmb_Attack:
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	JSR Object_AttackOrDefeat
	
	LDA Objects_PlayerProjHit, X
	AND #HIT_STOMPED
	BEQ BobOmb_InteractOthers

	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE BobOmb_InteractOthers

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	LDA Objects_Orientation, X
	AND #~SPR_VFLIP
	STA Objects_Orientation, X

	LDA Objects_Property, X
	BNE BobOmb_Unstabilize

	LDA #$A0
	STA Explosion_Timer, X
	BNE BobOmb_InteractOthers

BobOmb_Unstabilize:
	LDA #$02
	STA Objects_Frame,X
	INC BobOmb_Unstable, X
	BNE BobOmb_Draw

BobOmb_InteractOthers:
BobOmb_Animate:
	INC BobOmb_Frame, X
	LDA BobOmb_Frame, X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame,X

BobOmb_Draw:

	LDA BobOmb_Action, X
	ORA BobOmb_BehindTimer, X
	BEQ BobOmb_NotBehind

	LDA Objects_SpriteAttributes, X
	ORA #SPR_BEHINDBG
	STA Objects_SpriteAttributes, X

	LDA BobOmb_BehindTimer, X
	BEQ BobOmb_NotBehind

	DEC BobOmb_BehindTimer, X

BobOmb_NotBehind:
	JMP Object_Draw

BobOmb_ShakeDraw:
	INC BobOmb_Frame, X
	JSR Object_Draw

	LDA BobOmb_Frame, X
	AND #$02
	BEQ BobOmb_ShakeDraw1

	LDA Object_SpriteRAMOffset, X
	TAX
	DEC Sprite_RAMY, X
	DEC Sprite_RAMY + 4, X

BobOmb_ShakeDraw1:
	RTS    

ObjInit_Pyrantula:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_STOMPKICKSOUND)
	STA Objects_BehaviorAttr, X

	JSR InitPatrol_Chase
	LDA #$40
	STA Objects_Timer, X
	RTS		

Pyrantula_Frame = Objects_Data1
Pyrantula_FireTimer = Objects_Data2

ObjNorm_Pyrantula:
	LDA <Player_HaltGameZ
	BEQ Pyrantula_Normal
	JMP Pyrantula_Draw	 ; If gameplay is not halted, jump to PRG003_B9D4

Pyrantula_Normal:
	LDA Pyrantula_FireTimer, X
	BNE Pyrantula_Shoot

	LDA Objects_Timer, X
	BNE Pyrantula_Move

	LDA #$20
	STA Pyrantula_FireTimer, X

Pyrantula_Move:
	JSR Object_ChasePlayer
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	
	LDA Object_VertTileProp, X
	CMP #TILE_PROP_CLIMBABLE
	BEQ Pyrantula_VGo

	LDA #$00
	STA <Objects_YVelZ, X
	STA Objects_YVelFrac,X	

Pyrantula_VGo:

	LDA  Object_HorzTileProp, X
	CMP #TILE_PROP_CLIMBABLE
	BEQ Pyrantula_Animate

	JSR Object_WallStop
	JMP Pyrantula_Animate

Pyrantula_Shoot:
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

	LDA Pyrantula_FireTimer, X
	CMP #$10
	BNE Pyrantula_ShootDraw

	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE Pyrantula_ShootDraw

	LDA #$06
	STA <Proj_XOff 

	LDA #$0C
	STA <Proj_YOff

	JSR Object_ShootFireBallStraight
	JSR Object_AimProjectile

	LDA SpecialObj_XVel, Y
	JSR Double_Value
	STA SpecialObj_XVel, Y

	LDA SpecialObj_YVel, Y
	JSR Double_Value
	STA SpecialObj_YVel, Y

Pyrantula_ShootDraw:
	DEC Pyrantula_FireTimer, X
	BEQ Pyrantual_Reset

	LDA #$02
	STA Objects_Frame, X
	BNE Pyrantula_Draw

Pyrantual_Reset:
	LDA #$40
	STA Objects_Timer, X
	BNE Pyrantula_Draw

Pyrantula_Animate:
	INC Pyrantula_Frame, X

	LDA Pyrantula_Frame, X
	LSR A
	LSR A
	AND #$01

	STA Objects_Frame, X

Pyrantula_Draw:
	JMP Object_DrawMirrored	 ; Jump (indirectly) to PRG003_BB17 (draws enemy) and don't come back!    


FireSnake_Frame = Objects_Data1
FireSnake_CanJump = Objects_Data3
FireSnake_BufferOffset = Objects_Data4
FireSnake_Ticker = Objects_Data5
FireSnake_MakeFire = Objects_Data6

FireSnakeFlips:
	.byte $00, SPR_HFLIP

FireSnake_Jumps:
	.byte $E0, $E0, $D8, $C8, $BA, $B2, $A8, $A0, $98, $90, $8A, $8A, $8A, $8A, $8A, $8A

FireSnake_BufferOffsets:
	.byte 00, 16

ObjInit_FireSnake:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_FIREPROOF | ATTR_DASHPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	LDA #(ATTR_NOICE | ATTR_WINDAFFECTS)
	STA Objects_BehaviorAttr, X

	JSR Object_InitBuffer

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

	LDY FireSnake_BufferOffset, X
	
	LDA #$00
	STA Buffer_Occupied, Y

	LDY Objects_SpawnIdx, X

	LDA Level_ObjectsSpawned, Y
	AND #$7f
	STA Level_ObjectsSpawned, Y

	JMP Object_PoofDie

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

	LDA #$00
	STA Buffer_Occupied, Y

FireSnake_Move:
	JSR Object_Move

	LDA <Objects_YVelZ, X
	CMP #$18
	BMI FireSnake_Move1
	BCC FireSnake_Move1

	LDA #$20
	STA <Objects_YVelZ, X

FireSnake_Move1:
	JSR FireSnake_MoveTail
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_DetectTiles

	LDA Objects_Timer3, X
	BEQ FireSnake_InteractTiles

	LDA <Objects_YVelZ, X
	BMI FireSnake_InteractTiles

	LDA Object_VertTileProp, X
	CMP #TILE_PROP_SOLID_TOP
	BNE FireSnake_InteractTiles

	LDA <Objects_TilesDetectZ, X
	AND #~HITTEST_BOTTOM
	STA <Objects_TilesDetectZ, X

FireSnake_InteractTiles:
	JSR Object_InteractWithTiles
	JSR FireSnake_MeltIce

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ FireSnake_NoFire

	LDA <Objects_XVelZ, X
	BEQ FireSnake_NoFire

	LDA Object_BodyTileProp, X
	CMP #TILE_PROP_ENEMY
	BNE FireSnake_NoFire

	LDA <Objects_XZ, X
	ADD #$07
	STA Block_DetectX
	STA Tile_X

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Block_DetectXHi
	STA Tile_XHi

	LDA <Objects_YZ, X
	ADD #$07
	STA Block_DetectY
	STA Tile_Y

	LDA <Objects_YHiZ, X
	ADC #$00
	STA Block_DetectYHi
	STA Tile_YHi

	LDA Object_BodyTileValue, X
	STA Tile_LastValue

	JSR Tile_WriteTempChange
	BCC FireSnake_NoFire

	LDX <CurrentObjectIndexZ

	LDA Tile_LastValue
	EOR #$01
	JSR Object_ChangeBlock

FireSnake_NoFire:
	LDA Object_VertTileProp
	LDA FireSnake_CanJump, X
	BEQ FireSnake_TryCanJump

	LDA Objects_Timer, X
	BNE FireSnake_Animate

	JSR Object_YDistanceFromPlayer
	LDA <YDiffAboveBelow
	BEQ FireSnake_DetermineJump

	LDA #$20
	STA Objects_Timer3, X

	LDY #$00

FireSnake_DetermineJump:
	LDA <YDiff
	LSR A
	LSR A
	LSR A
	LSR A
	TAY

	INY

FireSnake_DoJump:
	INC FireSnake_MakeFire, X

	LDA FireSnake_Jumps, Y
	STA <Objects_YVelZ, X

	CPY #$00
	BNE FireSnake_TowardsPlayer

	LDA #$20
	STA Objects_Timer3, X

FireSnake_TowardsPlayer:

	JSR Object_MoveTowardsPlayerFast

	LDA #$00
	STA FireSnake_CanJump, X

	JMP FireSnake_Animate

FireSnake_TryCanJump:

	LDA <Objects_TilesDetectZ, X
	AND #HITTEST_BOTTOM
	BEQ FireSnake_Animate

	INC FireSnake_CanJump, X
	LDA #$20
	STA Objects_Timer, X

	LDA #$00
	STA <Objects_XVelZ, X

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

FireSnake_Draw:
	JSR Object_Draw

FireSnake_RAMOffset = Temp_Var15
FireSnake_TailPartX = Temp_Var2
FireSnake_TailPartY = Temp_Var1
FireSnake_TailOffset = Temp_Var16

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
	LDA Objects_Frame, X
	AND #$01
	TAX

	LDA FireSnake_TailFlips, X
	STA Sprite_RAMAttr + 8, Y
	STA Sprite_RAMAttr + 16, Y

	TXA
	EOR #$01
	TAX

	LDA FireSnake_TailFlips, X
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
	JSR SpecialObj_DetectPlayer
	BCC TailHit_None

	JSR Player_GetHurt

TailHit_None:
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


ObjInit_IceBlock:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #ATTR_ICEPROOF
	STA Objects_WeaponAttr, X

	LDA #(ATTR_WINDAFFECTS  | ATTR_BUMPNOKILL)
	STA Objects_BehaviorAttr, X
	RTS

IceBlock_Kicked = Objects_Data1
IceBlock_PrevHold = Objects_Data2

ObjNorm_IceBlock:
	LDA <Player_HaltGameZ
	BNE IceBlock_Draw

	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BEQ IceBlock_Burst

	JSR Object_DeleteOffScreen
	JSR Object_Move
	JSR Object_CalcBoundBox

	LDA Objects_BeingHeld, X
	STA IceBlock_PrevHold, X
	
	JSR Object_InteractWithPlayer

	LDA IceBlock_PrevHold, X
	BEQ IceBlock_DetectTiles

	CMP Objects_BeingHeld, X
	BEQ IceBlock_DetectTiles

	LDA <Pad_Holding
	AND #PAD_DOWN
	BNE IceBlock_DetectTiles

	LDA #$01
	STA IceBlock_Kicked, X

IceBlock_DetectTiles:
	JSR Object_DetectTiles
	JSR Object_CheckForeground

	LDA <Objects_XVelZ, X
	ORA <Objects_YVelZ, X
	ORA Objects_BeingHeld, X
	BEQ IceBlock_NoBurst

	JSR Shell_KillOthers
	BCC IceBlock_NoBurst

	; if hit another object an held, it bursts
	LDA Objects_BeingHeld, X
	BEQ IceBlock_Burst

	JMP IceBlock_Burst

IceBlock_NoBurst:
	LDA Objects_BeingHeld, X
	BNE IceBlock_Draw

	LDA IceBlock_Kicked, X
	BNE IceBlock_TestBreak

	JSR Object_DampenVelocity
	JMP IceBlock_TileInteract

IceBlock_TestBreak:
	LDA <Objects_TilesDetectZ, X
	AND #(HIT_LEFTWALL | HIT_RIGHTWALL | HIT_CEILING)
	BEQ IceBlock_TileInteract
	
IceBlock_Burst:
	LDA <Objects_YZ, X
	STA Debris_Y

	LDA <Objects_XZ, X
	STA Debris_X

	JSR Common_MakeIce
	JSR Object_TestTopBumpBlocks
	JSR Object_TestSideBumpBlocks

	JMP Object_SetDeadAndNotSpawned

IceBlock_TileInteract:
	JSR Object_InteractWithTiles

IceBlock_Draw:
	JSR Object_DrawMirrored
	LDA Sprite_RAM+$06, Y
	ORA #SPR_VFLIP
	STA Sprite_RAM+$06, Y
	RTS    


PhantomBlooper_YDetectOverride:
	.byte $04, $08

PhantomBlooper_XDetectOverride:
	.byte $01, $02

PhantomBlooper_XVelPropel:
	.byte $EC, $14

ObjInit_PhantomBlooper:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	RTS		 ; Return

ObjNorm_PhantomBlooper:
	LDA <Player_HaltGameZ
	BEQ PhantomBlooper_Norm

	JMP Object_DrawMirrored

PhantomBlooper_Norm:
	JSR Object_DeleteOffScreen
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles

	LDA #$01
	STA Objects_InWater, X

	LDA #$00
	STA <Objects_TilesDetectZ, X

	LDA Object_VertTileProp, X
	CMP #TILE_PROP_WATER
	BCS PhantomBlooper_InWater

	LDA <Objects_YVelZ, X
	AND #$80
	ROL A
	ROL A
	AND #$01
	TAY

	LDA <Objects_TilesDetectZ, X
	ORA PhantomBlooper_YDetectOverride, Y
	STA <Objects_TilesDetectZ, X

PhantomBlooper_InWater:
	LDA Object_HorzTileProp, X
	CMP #TILE_PROP_WATER
	BCS PhantomBlooper_InWater2

	LDA <Objects_XVelZ, X
	AND #$80
	ROL A
	ROL A
	AND #$01
	TAY

	LDA <Objects_TilesDetectZ, X
	ORA PhantomBlooper_XDetectOverride, Y
	STA <Objects_TilesDetectZ, X

PhantomBlooper_InWater2:
	
	INC Object_CeilingStops
	INC Object_WallStops
	JSR Object_InteractWithTiles
	JSR Object_AttackOrDefeat

	JSR Object_YDistanceFromPlayer
	LDA <YDiffAboveBelow
	BNE PhantomBlooper_SlowFall

	LDA Objects_Timer, X
	BNE PhantomBlooper_SlowFall

	LDA #$DC
	STA <Objects_YVelZ, X

	JSR Object_XDistanceFromPlayer
	LDY <XDiffLeftRight
	LDA PhantomBlooper_XVelPropel, Y
	STA <Objects_XVelZ, X
	
	LDA #$40
	STA Objects_Timer, X
	BNE PhantomBlooper_Animate

PhantomBlooper_SlowFall:
	LDA <Objects_YVelZ, X
	BMI PhantomBlooper_Animate

	CMP #$24
	BCC PhantomBlooper_Animate

	LDA #$24
	STA <Objects_YVelZ, X

PhantomBlooper_Animate:
	AND #$80
	ROL A
	ROL A
	AND #$01
	EOR #$01
	STA Objects_Frame, X

PhantomBlooper_Draw:
	LDA Objects_SpriteAttributes, X
	ORA #SPR_BEHINDBG
	STA Objects_SpriteAttributes, X
	JMP Object_DrawMirrored    


Blooper_YDetectOverride:
	.byte $04, $08

Blooper_XDetectOverride:
	.byte $01, $02

Blooper_XVelPropel:
	.byte $E4, $1C

ObjInit_Blooper:
	LDA #BOUND16x16
	STA Objects_BoundBox, X
	RTS		 ; Return


ObjNorm_Blooper:
	LDA <Player_HaltGameZ
	BEQ Blooper_Norm

	JMP Object_DrawMirrored

Blooper_Norm:
	JSR Object_DeleteOffScreen

	LDA <Objects_YVelZ, X
	BMI Blooper_NoStop

	LDA #$00
	STA <Objects_XVelZ, X

Blooper_NoStop:
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles

	LDA Object_VertTileProp, X
	CMP #TILE_PROP_WATER
	BCS Blooper_InWater

	LDA <Objects_YVelZ, X
	AND #$80
	ROL A
	ROL A
	AND #$01
	TAY

	LDA <Objects_TilesDetectZ, X
	ORA Blooper_YDetectOverride, Y
	STA <Objects_TilesDetectZ, X

Blooper_InWater:
	LDA Object_HorzTileProp, X
	CMP #TILE_PROP_WATER
	BCS Blooper_InWater2

	LDA <Objects_XVelZ, X
	AND #$80
	ROL A
	ROL A
	AND #$01
	TAY

	LDA <Objects_TilesDetectZ, X
	ORA Blooper_XDetectOverride, Y
	STA <Objects_TilesDetectZ, X

Blooper_InWater2:
	INC Object_CeilingStops

	JSR Object_InteractWithTiles
	JSR Object_AttackOrDefeat

	JSR Object_YDistanceFromPlayer
	LDA <YDiffAboveBelow
	BNE Blooper_SlowFall

	LDA Objects_Timer, X
	BNE Blooper_SlowFall

	LDA #$DC
	STA <Objects_YVelZ, X

	JSR Object_XDistanceFromPlayer
	LDY <XDiffLeftRight
	LDA Blooper_XVelPropel, Y
	STA <Objects_XVelZ, X
	
	LDA #$40
	STA Objects_Timer, X
	BNE Blooper_Animate

Blooper_SlowFall:
	LDA <Objects_YVelZ, X
	BMI Blooper_Animate

	CMP #$24
	BCC Blooper_Animate

	LDA #$24
	STA <Objects_YVelZ, X

Blooper_Animate:
	AND #$80
	ROL A
	ROL A
	AND #$01
	EOR #$01
	STA Objects_Frame, X

Blooper_Draw:
	JMP Object_DrawMirrored
    


FloatMine_Action = Objects_Data1

ObjInit_FloatMine:
	LDA #$06
	STA Objects_SpritesRequested, X
	
	LDA #(ATTR_NOICE)
	STA Objects_BehaviorAttr, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #$01
	STA ObjSplash_Disabled, X

	LDA <Objects_XZ, X
	SUB #$04
	STA <Objects_XZ, X

	LDA <Objects_XHiZ, X
	SBC #$00
	STA <Objects_XHiZ, X

	LDA Objects_Property, X
	STA FloatMine_Action, X

	CMP #$02
	BCS InitMineMove_Pattern
	RTS

InitMineMove_Pattern:
	LDA #$10
	STA Patrol_ResetTimer, X

	LDA <Objects_XZ, X
	SUB #$01
	STA <Objects_XZ, X

	LDA <Objects_XHiZ, X
	SBC #$00
	STA <Objects_XHiZ, X

	LDA <Objects_YZ, X
	SUB #$01
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	SBC #$00
	STA <Objects_YHiZ, X

	LDA Objects_Property, X
	SUB #$02
	JSR DynJump

	.word InitPatrolHorizontal
	.word InitPatrolVertical
	.word InitCircleCCW
	.word InitCircleCW

ObjNorm_FloatMine:
	LDA <Player_HaltGameZ
	BEQ FloatMine_Norm

	JMP FloatMine_Draw

FloatMine_Norm:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE FloatMine_NotDead
	JSR FloatMine_Expload

FloatMine_NotDead:
	JSR Object_DeleteOffScreen

	JSR FloatMine_CalcBoundBox
	LDA FloatMine_Action, X
	JSR DynJump
	
	.word FloatMine_Chained
	.word FloatMine_Unchained
	.word FloatMine_PatternMove
	.word FloatMine_PatternMove
	.word FloatMine_PatternMove
	.word FloatMine_PatternMove
	.word FloatMine_PatternMoveOnce

FloatMine_PatternMove:
	JSR FloatMine_DoPatternMove
	JSR FloatMine_DoPatternMove
	JSR FloatMine_DoPatternMove

FloatMine_PatternMoveOnce:
	JSR FloatMine_DoPatternMove
	JMP FloatMine_Chained

FloatMine_DoPatternMove:
	LDA FloatMine_Action, X
	SUB #$02
	JSR DynJump

	.word PatrolBackForth
	.word PatrolUpDown
	.word PatrolDiagonal
	.word PatrolDiagonal
	.word PatrolUpDown

FloatMine_Unchained:

    INC Reverse_Gravity
    JMP FloatMine_Move

FloatMine_Bob:
    LDA <Objects_YVelZ, X
    BPL FloatMine_Move

    LDA #$04
    STA <Objects_YVelZ, X

FloatMine_Move:
	JSR Object_Move

FloatMine_Chained:
	JSR Object_InteractWithPlayer
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles

	LDA FloatMine_Action, X
	CMP #$02
	BCS FloatMine_NormMove

	LDA Objects_InWater, X
	BNE FloatMine_NormMove
	
	LDA #$01
	STA Patrol_YVelocityChange, X

	LDA <Objects_YZ, X
	AND #$F0
	ORA #$04
	STA <Objects_YZ, X

	LDA #$00
	STA <Objects_YVelZ, X

	LDA #$04
	STA Patrol_ResetTimer, X
	STA Patrol_YAccelLimit, X

	LDA #$06
	STA FloatMine_Action, X

FloatMine_NormMove:
	LDA TrapSet
	BNE FloatMine_Explode

	LDA <Objects_TilesDetectZ, X
	BEQ FloatMine_NoExplodeYet

FloatMine_Explode:
	JSR FloatMine_Expload

FloatMine_NoExplodeYet:
	LDA FloatMine_Action, X
	BNE FloatMine_Draw

	JSR Object_XDistanceFromPlayer
	LDA <XDiff
	CMP #$30
	BCS FloatMine_Draw

	JSR Object_YDistanceFromPlayer

	LDA <YDiff
	CMP #$30
	BCS FloatMine_Draw

	INC FloatMine_Action, X

FloatMine_Draw:
	LDA #SPR_BEHINDBG
	STA Objects_Orientation, X

	JSR Object_Draw16x32

	LDY Object_SpriteRAMOffset,X

	LDA Objects_SpritesHorizontallyOffScreen, X
	AND #SPRITE_2_HINVISIBLE
	BNE Mine_BottomTile

	LDA Objects_SpritesVerticallyOffScreen, X
	AND #SPRITE_0_VINVISIBLE
	BNE Mine_BottomTile

	LDA Objects_SpriteX, X
	ADD #$10
	STA Sprite_RAMX + 16, Y

	LDA Sprite_RAMTile, Y
	STA Sprite_RAMTile + 16, Y

	LDA Objects_SpriteY, X
	STA Sprite_RAMY + 16, Y

	LDA Sprite_RAMAttr, Y
	ORA #SPR_HFLIP
	STA Sprite_RAMAttr + 16, Y

Mine_BottomTile:
	LDA Objects_SpritesHorizontallyOffScreen, X
	AND #SPRITE_2_HINVISIBLE
	BNE Mine_DrawRTS

	LDA Objects_SpritesVerticallyOffScreen, X
	AND #SPRITE_1_VINVISIBLE
	BNE Mine_DrawRTS

	LDA Objects_SpriteX, X
	ADD #$10
	STA Sprite_RAMX + 20, Y

	LDA Sprite_RAMTile + 8, Y
	STA Sprite_RAMTile + 20, Y

	LDA Objects_SpriteY, X
	ADD #$10
	STA Sprite_RAMY + 20, Y

	LDA Sprite_RAMAttr + 8, Y
	ORA #SPR_HFLIP
	STA Sprite_RAMAttr + 20, Y

Mine_DrawRTS:
	RTS

FloatMine_CalcBoundBox:
	LDA <Objects_XZ,X
	ADD #$04	
	STA Objects_BoundLeft, X

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Objects_BoundLeftHi, X

	LDA <Objects_XZ, X
	ADD #$14
	STA Objects_BoundRight, X
	
	LDA <Objects_XHiZ, X
	ADC #$00
	STA Objects_BoundRightHi, X

	LDA <Objects_YZ,X
	ADD #$04
	STA Objects_BoundTop, X

	LDA <Objects_YHiZ, X
	ADC #$00
	STA Objects_BoundTopHi, X

	LDA <Objects_YZ,X
	ADD #$14
	STA Objects_BoundBottom, X

	LDA <Objects_YHiZ, X
	ADC #$00
	STA Objects_BoundBottomHi, X
	RTS

FloatMine_Expload:
	LDA #OBJSTATE_NORMAL
	STA Objects_State, X
	INC Explosion_Timer, X
	RTS    