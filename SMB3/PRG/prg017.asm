    .org ObjectGroup_InitJumpTable
;****************************** OBJECT INITIALIZATION ******************************
	.word ObjInit_ProjBar	; Object $90 - OBJ_FIREICEBAR
	.word ObjInit_Freezie	; Object $91 - OBJ_FREEZIE
	.word ObjInit_Swoosh	; Object $92 - OBJ_SWOOSH
	.word ObjInit_IntroSequence	; Object $93 - OBJ_INTRO
	.word ObjInit_Dimmer		; Object $94 - OBJ_DIMMER
	.word ObjInit_DoNothing		; Object $95 - OBJ_BIGQBLOCK_MUSHROOM
	.word ObjInit_DoNothing		; Object $96 - OBJ_BIGQBLOCK_FIREFLOWER
	.word ObjInit_DoNothing		; Object $97 - OBJ_BIGQBLOCK_SUPERLEAF
	.word ObjInit_DoNothing		; Object $98 - OBJ_BIGQBLOCK_TANOOKI
	.word ObjInit_DoNothing		; Object $99 - OBJ_BIGQBLOCK_FROG
	.word ObjInit_DoNothing		; Object $9A - OBJ_BIGQBLOCK_HAMMER
	.word ObjInit_DoNothing		; Object $9B
	.word ObjInit_DoNothing		; Object $9C
	.word ObjInit_DoNothing	; Object $9D - OBJ_FIREJET_UPWARD
	.word ObjInit_Podobo		; Object $9E - OBJ_Podobo
	.word ObjInit_DoNothing	; Object $9F - OBJ_PARABEETLE


    .org ObjectGroup_NormalJumpTable
;****************************** OBJECT GAME LOOP ******************************
	.word ObjNorm_ProjectileBar	; Object $90 - OBJ_FIREICEBAR
	.word ObjNorm_Freezie	; Object $91 - OBJ_FREEZIE
	.word ObjNorm_Swoosh	; Object $92 - OBJ_SWOOSH
	.word ObjNorm_IntroSequence	; Object $93 - OBJ_INTRO
	.word ObjNorm_Dimmer		; Object $94 - OBJ_DIMMER
	.word ObjNorm_DoNothing		; Object $95 - OBJ_BIGQBLOCK_MUSHROOM
	.word ObjNorm_DoNothing		; Object $96 - OBJ_BIGQBLOCK_FIREFLOWER
	.word ObjNorm_DoNothing		; Object $97 - OBJ_BIGQBLOCK_SUPERLEAF
	.word ObjNorm_DoNothing		; Object $98 - OBJ_BIGQBLOCK_TANOOKI
	.word ObjNorm_DoNothing		; Object $99 - OBJ_BIGQBLOCK_FROG
	.word ObjNorm_DoNothing		; Object $9A - OBJ_BIGQBLOCK_HAMMER
	.word ObjNorm_DoNothing		; Object $9B
	.word ObjNorm_DoNothing		; Object $9C
	.word ObjNorm_FireJet		; Object $9D - OBJ_FIREJET_UPWARD
	.word ObjNorm_Podobo		; Object $9E - OBJ_Podobo
	.word ObjNorm_DoNothing	; Object $9F - OBJ_PARABEETLE

    .org ObjectGroup_CollideJumpTable
;****************************** OBJECT PLAYER INTERACTION ******************************
	.word ObjHit_DoNothing	; Object $90 - OBJ_FIREICEBAR
	.word ObjHit_Freezie	; Object $91 - OBJ_FREEZIE
	.word ObjHit_DoNothing	; Object $92 - OBJ_SWOOSH
	.word ObjHit_DoNothing	; Object $93 - OBJ_INTRO
	.word ObjHit_DoNothing	; Object $94 - OBJ_BIGQBLOCK_3UP
	.word ObjHit_DoNothing	; Object $95 - OBJ_BIGQBLOCK_MUSHROOM
	.word ObjHit_DoNothing	; Object $96 - OBJ_BIGQBLOCK_FIREFLOWER
	.word ObjHit_DoNothing	; Object $97 - OBJ_BIGQBLOCK_SUPERLEAF
	.word ObjHit_DoNothing	; Object $98 - OBJ_BIGQBLOCK_TANOOKI
	.word ObjHit_DoNothing	; Object $99 - OBJ_BIGQBLOCK_FROG
	.word ObjHit_DoNothing	; Object $9A - OBJ_BIGQBLOCK_HAMMER
	.word ObjHit_DoNothing	; Object $9B
	.word ObjHit_DoNothing	; Object $9C
	.word ObjHit_DoNothing	; Object $9D - OBJ_FIREJET_UPWARD
	.word ObjHit_DoNothing	; Object $9E - OBJ_Podobo
	.word ObjHit_DoNothing	; Object $9F - OBJ_PARABEETLE

    .org ObjectGroup_PatTableSel
;****************************** OBJECT PALETTE/SIZE ******************************
.byte OA1_PAL1 | OA1_WIDTH8 | OA1_WIDTH8	; Object $90 - OBJ_FIREICEBAR
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $91 - OBJ_FREEZIE
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $92 - OBJ_SWOOSH
	.byte OA1_PAL3 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $93 - OBJ_INTRO
	.byte OA1_PAL0 | OA1_HEIGHT32 | OA1_WIDTH32	; Object $94 - OBJ_BIGQBLOCK_3UP
	.byte OA1_PAL0 | OA1_HEIGHT32 | OA1_WIDTH32	; Object $95 - OBJ_BIGQBLOCK_MUSHROOM
	.byte OA1_PAL0 | OA1_HEIGHT32 | OA1_WIDTH32	; Object $96 - OBJ_BIGQBLOCK_FIREFLOWER
	.byte OA1_PAL0 | OA1_HEIGHT32 | OA1_WIDTH32	; Object $97 - OBJ_BIGQBLOCK_SUPERLEAF
	.byte OA1_PAL0 | OA1_HEIGHT32 | OA1_WIDTH32	; Object $98 - OBJ_BIGQBLOCK_TANOOKI
	.byte OA1_PAL0 | OA1_HEIGHT32 | OA1_WIDTH32	; Object $99 - OBJ_BIGQBLOCK_FROG
	.byte OA1_PAL0 | OA1_HEIGHT32 | OA1_WIDTH32	; Object $9A - OBJ_BIGQBLOCK_HAMMER
	.byte OA1_PAL0 | OA1_HEIGHT16 | OA1_WIDTH8	; Object $9B
	.byte OA1_PAL0 | OA1_HEIGHT16 | OA1_WIDTH8	; Object $9C
	.byte OA1_PAL1 | OA1_HEIGHT48 | OA1_WIDTH16	; Object $9D - OBJ_FIREJET_UPWARD
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $9E - OBJ_Podobo
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $9F - OBJ_PARABEETLE

    .org ObjectGroup_PatTableSel
;****************************** OBJECT PATTERN TABLE ******************************
    .byte OPTS_NOCHANGE	; Object $90 - OBJ_FIREICEBAR
	.byte OPTS_SETPT5 | $33	; Object $91 - OBJ_FREEZIE
	.byte OPTS_SETPT5 | $33	; Object $92 - OBJ_SWOOSH
	.byte OPTS_SETPT5 | $36	; Object $93 - OBJ_INTRO
	.byte OPTS_NOCHANGE ; Object $94 - OBJ_BIGQBLOCK_3UP
	.byte OPTS_SETPT5 | $4C	; Object $95 - OBJ_BIGQBLOCK_MUSHROOM
	.byte OPTS_SETPT5 | $4C	; Object $96 - OBJ_BIGQBLOCK_FIREFLOWER
	.byte OPTS_SETPT5 | $4C	; Object $97 - OBJ_BIGQBLOCK_SUPERLEAF
	.byte OPTS_SETPT5 | $4C	; Object $98 - OBJ_BIGQBLOCK_TANOOKI
	.byte OPTS_SETPT5 | $4C	; Object $99 - OBJ_BIGQBLOCK_FROG
	.byte OPTS_SETPT5 | $4C	; Object $9A - OBJ_BIGQBLOCK_HAMMER
	.byte OPTS_NOCHANGE	; Object $9B
	.byte OPTS_NOCHANGE	; Object $9C
	.byte OPTS_SETPT6 | $37	; Object $9D - OBJ_FIREJET_UPWARD
	.byte OPTS_NOCHANGE	; Object $9E - OBJ_Podobo
	.byte OPTS_SETPT5 | $0E	; Object $9F - OBJ_PARABEETLE


	.org ObjectGroup_KillAction	
;****************************** OBJECT DEATH ROUTINE ******************************
.byte KILLACT_STANDARD	; Object $90 - OBJ_FIREICEBAR
	.byte KILLACT_NORMALSTATE	; Object $91 - OBJ_FREEZIE
	.byte KILLACT_POOFDEATH	; Object $92 - OBJ_SWOOSH
	.byte KILLACT_STANDARD	; Object $93 - OBJ_INTRO
	.byte KILLACT_STANDARD	; Object $94 - OBJ_BIGQBLOCK_3UP
	.byte KILLACT_STANDARD	; Object $95 - OBJ_BIGQBLOCK_MUSHROOM
	.byte KILLACT_STANDARD	; Object $96 - OBJ_BIGQBLOCK_FIREFLOWER
	.byte KILLACT_STANDARD	; Object $97 - OBJ_BIGQBLOCK_SUPERLEAF
	.byte KILLACT_STANDARD	; Object $98 - OBJ_BIGQBLOCK_TANOOKI
	.byte KILLACT_STANDARD	; Object $99 - OBJ_BIGQBLOCK_FROG
	.byte KILLACT_STANDARD	; Object $9A - OBJ_BIGQBLOCK_HAMMER
	.byte KILLACT_STANDARD	; Object $9B
	.byte KILLACT_STANDARD	; Object $9C
	.byte KILLACT_STANDARD	; Object $9D - OBJ_FIREJET_UPWARD
	.byte KILLACT_POOFDEATH	; Object $9E - OBJ_Podobo
	.byte KILLACT_STANDARD	; Object $9F - OBJ_PARABEETLE



OG8_POff .func (\1 - ObjectGroup08_PatternSets)

	.org ObjectGroup_PatternStarts	; <-- help enforce this table *here*
;****************************** OBJECT FRAME TABLE ******************************
.byte OG4_POff(ObjP90), OG4_POff(ObjP91), OG4_POff(ObjP92), OG4_POff(ObjP93)
	.byte OG4_POff(ObjP94), OG4_POff(ObjP95), OG4_POff(ObjP96), OG4_POff(ObjP97)
	.byte OG4_POff(ObjP98), OG4_POff(ObjP99), OG4_POff(ObjP9A), OG4_POff(ObjP9B)
	.byte OG4_POff(ObjP9C), OG4_POff(ObjP9D), OG4_POff(ObjP9E), OG4_POff(ObjP9F)
	


	.org ObjectGroup_PatternSets	; <-- help enforce this table *here*
;****************************** OBJECT FRAMES DEFINITION ******************************    
ObjectGroup08_PatternSets:

ObjP90:
ObjP91:
	.byte $AD, $AF, $B1, $AF, $B5, $B7, $AD, $B3
ObjP92:
	.byte $A1, $A3
	.byte $A5, $A7
	.byte $81, $83
	.byte $85, $87
	.byte $85, $87
	.byte $81, $83
	.byte $A1, $A3
	.byte $A9, $AB

ObjP93:
	.byte $81, $83, $A1, $A3, $85, $87, $A5, $A7

ObjP94:
ObjP95:
ObjP96:
ObjP97:
ObjP98:
ObjP99:
ObjP9A:
ObjP9B:
ObjP9C:
ObjP9E:
ObjP9D:
ObjP9F:
	.byte $B1, $B3, $B5, $B7, $B1, $B3


ObjInit_ProjBar:
	LDA #BOUND8x16
	STA Objects_BoundBox, X
	
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
	SUB <Player_Y			; Subtract Player Y
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
	STA <Player_XVel
	JSR Object_XDistanceFromPlayer
	TYA
	ASL A
	ADD Objects_Data5, X
	TAY
	LDA YKnockBacks, Y
	STA <Player_YVel 
	STA <Player_InAir
	JSR Player_Freeze
	LDX <CurrentObjectIndexZ
	PLA
	PLA
	RTS

P_PRG007_B828:
	JMP Player_GetHurt	 ; Hurt Player and don't come back!
 

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
	LDA Freezie_NoImpact, X
	BEQ Freezie_NoBehindBg

	LDA Objects_SpriteAttributes, X
	ORA #SPR_BEHINDBG
	STA Objects_SpriteAttributes, X

Freezie_NoBehindBg:
	JMP Object_Draw

FreezieThrowPlayerX:
	.byte $E0, $20

ObjHit_Freezie:
	JSR Player_Freeze
	JSR Object_XDistanceFromPlayer
	
	LDA FreezieThrowPlayerX, Y
	STA <Player_XVel
	
	LDA #$A0
	STA <Player_YVel
	STA <Player_InAir

Freezie_Die:
	LDY Objects_SpawnIdx,X
	
	LDA Level_ObjectsSpawned,Y
	AND #$7F
	STA Level_ObjectsSpawned,Y
	
	LDA #SND_LEVELCRUMBLE
	STA Sound_QLevel2

	JMP Object_BurstIce
ObjInit_Swoosh:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_PROJECTILEPROOF)
	STA Objects_WeaponAttr

	LDA #ATTR_BUMPNOKILL
	STA Objects_BoundBox, X

	LDA #$60
	STA Objects_Timer, X
	RTS


Swoosh_Pull:
	.byte $01, $FF

Swoosh_Push:
	.byte $FD, $03

Swoosh_Particles1:
	.byte $89, $8B, $8D, $8F

Swoosh_Particles2:
	.byte $8F, $8D, $8B, $89

Swoosh_Times:
	.byte $40, $60, $80, $A0

Swoosh_Frame = Objects_Data1
Swoosh_Action = Objects_Data2
Swoosh_Ticker = Objects_Data3
Swoosh_Direction = Objects_Data4

ObjNorm_Swoosh:
	LDA <Player_HaltGameZ
	BEQ Swoosh_Normal

	JMP Object_Draw

Swoosh_Normal:
	INC Swoosh_Ticker, X

	JSR Object_CalcBoundBox
	JSR Object_DeleteOffScreen
	JSR Object_RespondToTailAttack
	JSR Object_DetectPlayer

	BCC Swoosh_Normal1	 ; If collision occurred, jump to PRG000_D1C5

	JSR Object_DetermineContactKill

Swoosh_Normal1:

	LDA Swoosh_Action, X
	CMP #$03
	BEQ Swoosh_NoChase

	JSR Object_FacePlayer
	
	LDY #$00
	
	LDA Objects_Orientation, X
	BEQ Swoosh_StoreDirection

	INY

Swoosh_StoreDirection:
	TYA
	STA Swoosh_Direction, X

	LDA Objects_Property, X
	AND #$01
	BEQ Swoosh_NoChase
	
Swoosh_NoChase:

	LDA Swoosh_Action, X
	JSR DynJump

	.word Swoosh_Idle
	.word Swoosh_BreathIn
	.word Swoosh_Hold
	.word Swoosh_BreatheOut

Swoosh_Idle:
	INC Swoosh_Frame, X

	LDA Swoosh_Frame, X
	AND #$08
	LSR A
	LSR A
	LSR A
	STA Objects_Frame, X

	LDA Objects_Timer, X
	BNE Swoosh_IdleDone

	LDA #$00
	STA Objects_Frame, X
	INC Swoosh_Action, X

	LDA #$40
	STA Objects_Timer, X

Swoosh_IdleDone:
	JMP Object_Draw

Swoosh_BreathIn:
	
	JSR Object_YDistanceFromPlayer
	CMP #$30
	BCS Swoosh_SuckTimer

Swoosh_SuckIn2:
	JSR Object_XDistanceFromPlayer
	
	CMP #$10
	BCC Swoosh_SuckTimer

	CMP #$50
	BCS Swoosh_SuckTimer

	TYA
	CMP Swoosh_Direction, X
	BNE Swoosh_SuckTimer

	LDA <Player_XVel
	ADD Swoosh_Pull, Y
	STA <Player_XVel

Swoosh_SuckTimer:
	LDA Objects_Timer, X
	BNE Swoosh_SuckDraw
	
	INC Swoosh_Action, X
	
	LDA #$20
	STA Objects_Timer, X
	JMP Object_Draw

Swoosh_SuckDraw:
	LDA #$40
	SUB Objects_Timer, X
	
	LSR A
	LSR A
	LSR A
	LSR A
	LSR A

	ORA #$02
	STA Objects_Frame, X

	JSR Object_Draw

	LDA #$F8
	STA <Temp_Var1

	LDA Objects_Orientation, X
	BEQ Swoosh_SuckDraw1

	LDA #$10
	STA <Temp_Var1

Swoosh_SuckDraw1:
	LDA Sprite_RAMX, Y
	ADD <Temp_Var1
	STA Sprite_RAMX + 8, Y

	LDA #SPR_PAL1
	ORA Objects_Orientation, X
	STA Sprite_RAMAttr + 8, Y

	LDA Swoosh_Ticker, X
	AND #$0C
	
	LSR A
	LSR A
	TAX

	LDA Swoosh_Particles1, X
	STA Sprite_RAMTile + 8, Y
	
	LDA Sprite_RAMY, Y
	STA Sprite_RAMY + 8, Y

	RTS

Swoosh_Hold:
	LDA Objects_Timer, X
	BNE Swoosh_HoldDone
	
	LDA #$20
	STA Objects_Timer, X

	LDA #SND_LEVELAIRSHIP
	STA Sound_QLevel2

	INC Swoosh_Action, X

Swoosh_HoldDone:
	JMP Object_Draw


Swoosh_BreatheOut:
	LDA Swoosh_Ticker, X
	AND #$01
	BEQ Swoosh_BlowTimer

	JSR Object_YDistanceFromPlayer
	CMP #$30
	BCS Swoosh_BlowTimer

	JSR Object_XDistanceFromPlayer

	CMP #$70
	BCS Swoosh_BlowTimer

	TYA
	CMP Swoosh_Direction, X
	BNE Swoosh_BlowTimer
	
	LDA <Player_XVel
	CMP #$3C
	BCC Swoos_AddPush

	CMP #$C4
	BCC Swoosh_BlowTimer

Swoos_AddPush:
	ADD Swoosh_Push, Y
	STA <Player_XVel

Swoosh_BlowTimer:
	LDA Objects_Timer, X
	BNE Swoosh_BlowDraw
	
	LDA #$00
	STA Swoosh_Action, X
	
	LDA RandomN
	AND #$03
	TAY
	
	LDA Swoosh_Times, Y
	STA Objects_Timer, X

	JMP Object_Draw

Swoosh_BlowDraw:
	LDA #$40
	SUB Objects_Timer, X
	
	LSR A
	LSR A
	LSR A
	LSR A

	ORA #$04
	STA Objects_Frame, X

	JSR Object_Draw

	LDA #$F8
	STA <Temp_Var1

	LDA Objects_Orientation, X
	BEQ Swoosh_BlowDraw1

	LDA #$10
	STA <Temp_Var1

Swoosh_BlowDraw1:
	LDA Sprite_RAMX, Y
	ADD <Temp_Var1
	STA Sprite_RAMX + 8, Y

	LDA #SPR_PAL1
	ORA Objects_Orientation, X
	STA Sprite_RAMAttr + 8, Y

	LDA Swoosh_Ticker, X
	AND #$0C
	
	LSR A
	LSR A
	TAX

	LDA Swoosh_Particles2, X
	STA Sprite_RAMTile + 8, Y
	
	LDA Sprite_RAMY, Y
	STA Sprite_RAMY + 8, Y
	RTS

ObjInit_IntroSequence:
	LDA #$FF
	STA <Objects_XHiZ, X
	LDA #$F0
	STA <Objects_XZ, X
	LDA #$FF
	STA Objects_Timer, X
	LDA #$08
	STA <Objects_XVelZ, X
	LDA #$01
	STA Player_QueueSuit
	RTS

ObjNorm_IntroSequence:
	LDA Objects_Data4, X

	JSR DynJump

Messages:
	.word DrawBowserMessage
	.word IntroWalkToad
	.word ToadTalk
	.word ToadFollow
	.word ToadBye


DrawToad:
	LDA <Objects_XZ, X
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame, X
	
	JSR Object_FaceMovement
	JSR Object_ShakeAndCalcSprite
	LDX <CurrentObjectIndexZ
	LDA #SPR_BEHINDBG
	ORA Objects_SpriteAttributes, X
	STA Objects_SpriteAttributes, X
	JSR Object_Draw16x32
	RTS

BowserMessage1:
	.byte $8E, $8F
	.byte " TRICKED YOU, MARIO! YOU  "

BowserMessage2:
	.byte $9E, $9F
	.byte " WILL NEVER ESCAPE ME NOW!"

DrawBowserMessage:
	LDA #$01
	STA Player_HaltTick
	LDA Objects_Timer, X
	BNE DrawBowserMessage1
	INC Objects_Data4, X

DrawBowserMessage1:
	LDA #$80
	STA StatusBar_Mode
	STA Last_StatusBar_Mode
	LDA Objects_Data5, X
	TAX

DrawBowserMessage2:
	LDA BowserMessage1, X
	STA Status_Bar_Top , X
	LDA BowserMessage2, X
	STA Status_Bar_Bottom , X
	INX
	CPX #28
	BNE DrawBowserMessage2

	RTS

IntroWalkToad:
	LDA #$00
	STA StatusBar_Mode
	LDA #$01
	STA Player_HaltTick
	LDA <Objects_XZ, X
	CMP #$30
	BNE IntroWalkToad1

	INC Objects_Data4, X
	LDA #$FF
	STA Objects_Timer, X

IntroWalkToad1:
	LDA #$08
	INC NoGravity
	JSR Object_ApplyXVel
	JSR DrawToad
	RTS

ToadMessage1:
	.byte $8A, $8B
	.byte " MARIO! IT IS A TRAP! OH  "
	.byte $8A, $8B
	.byte " BOWSER FORCED ME TO BUILD"
	.byte $8A, $8B
	.byte " HE DOES NOT KNOW I BUILT "
	.byte $8A, $8B
	.byte " I WILL HELP YOU ESCAPE.  "

ToadMessage2:
	.byte $9A, $9B
	.byte " I GUESS I WAS TOO LATE..."
	.byte $9A, $9B
	.byte " THIS PART OF THE CASTLE. "
	.byte $9A, $9B
	.byte " A WAY FOR YOU TO ESCAPE  "
	.byte $9A, $9B
	.byte " GO THROUGH THE RIGHT WALL"

ToadTalkOffsets:
	.byte $00, $1C, $38, $54

ToadTalk:
	LDA #$01
	STA Player_HaltTick
	LDA #$80
	STA StatusBar_Mode
	STA Last_StatusBar_Mode

	LDA Objects_Data5, X
	TAX
	LDA ToadTalkOffsets, X
	TAX
	LDY #$00

ToadTalk1:
	LDA ToadMessage1, X
	STA Status_Bar_Top , Y
	LDA ToadMessage2, X
	STA Status_Bar_Bottom , Y
	INX
	INY
	CPY #$1C
	BNE ToadTalk1
	LDX <CurrentObjectIndexZ
	LDA Objects_Timer, X
	BNE ToadTalk2
	LDA #$FF
	STA Objects_Timer, X
	INC Objects_Data5, X
	LDA Objects_Data5, X
	CMP #$04
	BNE ToadTalk2
	
	INC Objects_Data4, X
	LDA #$00
	STA Objects_Data5, X

ToadTalk2:
	JMP DrawToad

ToadFollow:
	LDA <Player_HaltGameZ
	BNE ToadFollow2
	LDA #$40
	STA Air_Time
	LDA <Objects_XHiZ, X
	CMP #$0C
	BNE ToadFollow0
	LDA #$FF
	STA Objects_Timer, X
	INC Objects_Data4, X

ToadFollow0:
	LDA #$00
	STA StatusBar_Mode
	LDA <Player_XVel
	STA <Objects_XVelZ, X
	JSR Object_ApplyXVel
	LDA Player_EffectiveSuit
	BEQ ToadFollow2

	LDA Player_EffectiveSuit
	CMP #$0B
	BEQ ToadFollow3

	SUB #$02
	CMP Objects_Data5, X
	BNE ToadFollow1

	INC Objects_Data5, X

ToadFollow1:
	JSR ToadExplainText

ToadFollow2:
	LDX <CurrentObjectIndexZ
	JMP DrawToad

ToadFollow3:
	LDA #$08
	STA Objects_Data5, X
	BNE ToadFollow1

ToadExplain1:
	.byte $8A, $8B
	.byte " THE SUPER MUSHROOM SHOULD"
	.byte $8A, $8B
	.byte " USE B TO THROW FIREBALLS "
	.byte $8A, $8B
	.byte " USE B TO BREAK BRICKS AND"
	.byte $8A, $8B
	.byte " HOLD DOWN AND PRESS B TO "
	.byte $8A, $8B
	.byte " DUCK WHEN MOVING TO GO IN"
	.byte $8A, $8B
	.byte " USE B TO THROW HAMMERS   "
	.byte $8A, $8B
	.byte " USE B TO THROW ICEBALLS  "
	.byte $8A, $8B
	.byte " DOUBLE TAP B TO DASH AND "
	.byte $8A, $8B
	.byte " PRESS AGAINST A WALL MID "
	

ToadExplain2:
	.byte $9A, $9B
	.byte " BE FAMILIAR TO YOU.      "
	.byte $9A, $9B
	.byte " THAT CAN MELT ICE.       "
	.byte $9A, $9B
	.byte " DEFLECT PROJECTILES.     "
	.byte $9A, $9B
	.byte " BE INVINCIBLE TEMPORARILY"
	.byte $9A, $9B
	.byte " YOUR SHELL TO BUST BRICKS"
	.byte $9A, $9B
	.byte " TO BREAK BIRCKS AND STONE"
	.byte $9A, $9B
	.byte " TO FREEZE WATER AND FOES."
	.byte $9A, $9B
	.byte " BREAK TURN BLOCKS.       "
	.byte $9A, $9B
	.byte " AIR AND TAP A TO WALLJUMP"

ToadExplainOffsets:
	.byte $00, $1C, $38, $54, $70, $8C, $A8, $C4, $E0

ToadExplainText:
	LDA #$80
	STA StatusBar_Mode
	STA Last_StatusBar_Mode
	LDA Objects_Data5, X
	TAX
	LDA ToadExplainOffsets, X
	TAX
	LDY #$00

ToadExplainText1:
	LDA ToadExplain1, X
	STA Status_Bar_Top , Y
	LDA ToadExplain2, X
	STA Status_Bar_Bottom , Y
	INX
	INY
	CPY #$1C
	BNE ToadExplainText1
	RTS


ToadByeMsg1:
	.byte $8A, $8B
	.byte " USE THE PIPE TO ESCAPE. I"

ToadByeMsg2:
	.byte $9A, $9B
	.byte " MUST STAY BEHIND FOR NOW."

ToadBye:
	LDA Objects_Timer, X
	BNE ToadBye0
	LDA #$00
	STA StatusBar_Mode
	RTS


ToadBye0:
	LDA #$01
	STA Player_HaltTick 
	LDA #$80
	STA StatusBar_Mode
	STA Last_StatusBar_Mode
	LDX #$00

ToadBye1:
	LDA ToadByeMsg1, X
	STA Status_Bar_Top , X
	LDA ToadByeMsg2, X
	STA Status_Bar_Bottom , X
	INX
	CPX #$1C
	BNE ToadBye1
	RTS

ObjInit_Dimmer:
	LDA #$00
	STA Objects_Data4, X

	JMP Object_NoInteractions

ObjNorm_Dimmer:
	LDA <Counter_1
	AND #$03
	BNE FadeOutDone
	LDY #$07

DimmerFindBlocks:
	LDA SpinnerBlocksActive, Y
	BNE Dimmer_FadeIn
	DEY
	BPL DimmerFindBlocks
	JMP Dimmer_FadeOut

Dimmer_FadeOut:
	LDA Objects_Data4, X
	CMP #$04
	BEQ FadeOutDone
	INC Objects_Data4, X

	JMP Dimmer_Fade
FadeOutDone:
	RTS

Dimmer_FadeIn:
	LDA Objects_Data4, X
	BEQ FadeInDone
	DEC Objects_Data4, X
	JMP Dimmer_Fade

FadeInDone:
	RTS

Dimmer_Fade:
	LDA Objects_Data4, X
	ASL A
	ASL A
	ASL A
	ASL A
	STA TempA
	LDY #$0F

Dimmer_Fade2:
	LDA MasterPal_Data,Y	; Get this color
	SUB TempA	 	; Subtract 16 from it
	BPL Dimmer_Fade3	 	; If we didn't go below zero, jump to PRG026_AC55

	LDA #$0f	 	; Otherwise, set it to safe minimum

Dimmer_Fade3:
	STA Palette_Buffer,Y	; Update palette color
	DEY		 	; Y--
	BPL Dimmer_Fade2	 	; While Y >= 0, loop!

	STA Palette_Buffer + 16
	STA Palette_Buffer + 20
	STA Palette_Buffer + 24
	STA Palette_Buffer + 28
	; Commit palette fade
	LDA #$06
	STA <Graphics_Queue
	
	RTS

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
	
	JSR Object_DeleteOffScreenRange

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
	CMP #(TILE_PROP_SOLID_TOP | TILE_PROP_ENEMYSOLID)
	BEQ Podobo_DoBridgeBreak

	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_ENEMYSOLID)
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
	CMP #(TILE_PROP_SOLID_TOP | TILE_PROP_ENEMYSOLID)
	BNE Podobo_BreakBridgesRTS

	TYA
	AND #$C0
	ORA #$3F
	
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
