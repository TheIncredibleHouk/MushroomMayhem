    .org ObjectGroup_InitJumpTable
;****************************** OBJECT INITIALIZATION ******************************
	.word ObjInit_GiantChomp	; Object $14 OBJ_GIANTCHOMP
	.word ObjInit_Waterfill	; Object $15 OBJ_WATERFILL
	.word ObjInit_KeyPiece	; Object $16 OBJ_KEYPIECE
	.word ObjInit_NegaStar; Object $17 - OBJ_NEGASTAR
	.word ObjInit_DoNothing	; Object $18 - OBJ_BOSS_BOWSER
	.word ObjInit_WaterSplash; Object $19 - OBJ_POWERUP_FIREFLOWER
	.word ObjInit_DoNothing	; Object $1A that is a l
	.word ObjInit_StarPiece	; Object $1B - OBJ_BOUNCELEFTRIGHT
	.word ObjInit_SendBack	; Object $1C
	.word ObjInit_Timer	; Object $1D
	.word ObjInit_ESwitch	; Object $1E - OBJ_ESWITCH
	.word ObjInit_DoNothing	; Object $1F - OBJ_GROWINGVINE
	.word ObjInit_Clock	; Object $20
	.word ObjInit_IceSpike	; Object $21 - OBJECT_ICESPIKE
	.word ObjInit_DoNothing	; Object $22 - OBJ_POWERUP_PUMPKIN
	.word ObjInit_DoNothing	; Object $23 - OBJ_POWERUP_FOXLEAF
	.word ObjInit_WoodenPlatHorz	; Object $24 - OBJ_PLATFORM_HORZOSC
	.word ObjInit_WoodenPlatVert	; Object $25 - OBJ_PLATFORM_VERTOSC
	.word ObjInit_WoodenPlatFallGen	; Object $26 - OBJ_WOODENPLAT_RIDER
	.word ObjInit_WoodenPlatDiagonal1	; Object $27 - OBJ_PLATFORM_DIAG1OSC

    .org ObjectGroup_NormalJumpTable
;****************************** OBJECT GAME LOOP ******************************
	.word ObjNorm_GiantChomp	; Object $14 OBJ_GIANTCHOMP
	.word ObjNorm_Waterfill	; Object $15 OBJ_BOSS
	.word ObjNormal_KeyPiece	; Object $16 OBJ_KEYPIECE
	.word ObjNorm_NegaStar; Object $17 - OBJ_NEGASTAR
	.word ObjInit_DoNothing	; Object $18 - OBJ_BOSS_BOWSER
	.word ObjNorm_WaterSplash; Object $19 - OBJ_POWERUP_FIREFLOWER
	.word ObjInit_DoNothing	; Object $1A
	.word ObjNorm_StarPiece	; Object $1B - OBJ_BOUNCELEFTRIGHT
	.word ObjNorm_SendBack	; Object $1C
	.word ObjNorm_Timer	; Object $1D
	.word ObjNorm_ESwitch	; Object $1E - OBJ_ESWITCH
	.word ObjInit_DoNothing	; Object $1F - OBJ_GROWINGVINE
	.word ObjNorm_Clock	; Object $20
	.word ObjNorm_IceSpike	; Object $21 - OBJECT_ICESPIKE
	.word ObjInit_DoNothing	; Object $22 - OBJ_POWERUP_PUMPKIN
	.word ObjInit_DoNothing	; Object $23 - OBJ_POWERUP_FOXLEAF
    .word ObjNorm_PlatformOscillate		; Object $24 - OBJ_PLATFORM_HORZOSC
	.word ObjNorm_PlatformOscillate	; Object $25 - OBJ_PLATFORM_VERTOSC
	.word ObjNorm_WoodenPlatFallGen	; Object $26 - OBJ_WOODENPLAT_RIDER
	.word ObjNorm_PlatformOscillate	; Object $27 - OBJ_PLATFORM_DIAG1OSC

    .org ObjectGroup_CollideJumpTable
;****************************** OBJECT PLAYER INTERACTION ******************************
	.word ObjHit_DoNothing	; Object $14 OBJ_GIANTCHOMP
	.word ObjHit_DoNothing	; Object $15 OBJ_WATERFILLER
	.word ObjHit_KeyPiece	; Object $16
	.word ObjHit_DoNothing	; Object $17 - OBJ_NEGASTAR
	.word ObjHit_DoNothing; Object $18 - OBJ_BOSS_BOWSER
	.word ObjHit_DoNothing	; Object $19 - OBJ_POWERUP_FIREFLOWER
	.word ObjHit_DoNothing	; Object $1A
	.word Object_SetDeadEmpty	; Object $1B - OBJ_BOUNCELEFTRIGHT
	.word ObjHit_DoNothing	; Object $1C
	.word ObjHit_DoNothing	; Object $1D
	.word ObjHit_DoNothing	; Object $1E - OBJ_ESWITCH
	.word ObjHit_DoNothing	; Object $1F - OBJ_GROWINGVINE
	.word ObjHit_Clock	; Object $20
	.word Player_GetHurt	; Object $21 - OBJECT_ICESPIKE
	.word ObjHit_DoNothing	; Object $22 - OBJ_POWERUP_PUMPKIN
	.word ObjHit_DoNothing    ; Object $23 - OBJ_POWERUP_FOXLEAF
	.word Platform_PlayerStand		; Object $24 - OBJ_PLATFORM_HORZOSC
	.word Platform_PlayerStand		; Object $25 - OBJ_PLATFORM_VERTOSC
	.word ObjHit_DoNothing		; Object $26 - OBJ_WOODENPLAT_RIDER
	.word Platform_PlayerStand		; Object $27 - OBJ_PLATFORM_DIAG1OSC

    .org ObjectGroup_PatTableSel
;****************************** OBJECT PALETTE/SIZE ******************************
	.byte OA1_PAL2 | OA1_HEIGHT32 | OA1_WIDTH32	; Object $14 OBJ_GIANTCHOMP
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $15 OBJ_WATERFILLER
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $16
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $17 - OBJ_NEGASTAR
	.byte OA1_PAL1 | OA1_HEIGHT48 | OA1_WIDTH32	; Object $18 - OBJ_BOSS_BOWSER
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $19 - OBJ_POWERUP_FIREFLOWER
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $1A
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $1B - OBJ_BOUNCELEFTRIGHT
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $1C
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_HEIGHT16	; Object $1D
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $1E - OBJ_ESWITCH
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $1F - OBJ_GROWINGVINE
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $20
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $21 - OBJECT_ICESPIKE #DAHRKDAIZ
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $22 - OBJ_POWERUP_PUMPKIN
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $23 - OBJ_POWERUP_FOXLEAF
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH48		; Object $24 - OBJ_PLATFORM_HORZOSC
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH48		; Object $25
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH48	; Object $26 - OBJ_WOODENPLAT_RIDER
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH48	; Object $27 - OBJ_PLATFORM_DIAG1OSC

    .org ObjectGroup_PatTableSel
;****************************** OBJECT PATTERN TABLE ******************************
    .byte OPTS_SETPT5 | $0E	; Object $14
	.byte OPTS_SETPT5 | $12	; Object $15 OBJ_WATERFILLER
	.byte OPTS_NOCHANGE	; Object $16
	.byte OPTS_SETPT5 | $4D	; Object $17 - OBJ_NEGASTAR
	.byte OPTS_SETPT5 | $3A	; Object $18 - OBJ_BOSS_BOWSER
	.byte OPTS_NOCHANGE	; Object $19 - OBJ_POWERUP_FIREFLOWER
	.byte OPTS_SETPT5 | $1A	; Object $1A
	.byte OPTS_NOCHANGE	; Object $1B - OBJ_BOUNCELEFTRIGHT
	.byte OPTS_NOCHANGE	; Object $1C
	.byte OPTS_NOCHANGE	; Object $1D
	.byte OPTS_NOCHANGE	; Object $1E - OBJ_ESWITCH
	.byte OPTS_NOCHANGE	; Object $1F - OBJ_GROWINGVINE
	.byte OPTS_NOCHANGE 	; Object $20
	.byte OPTS_SETPT5 | $12	; Object $21 - OBJECT_ICESPIKE
	.byte OPTS_NOCHANGE	; Object $22 - OBJ_POWERUP_PUMPKIN
	.byte OPTS_NOCHANGE	; Object $23 - OBJ_POWERUP_FOXLEAF
	.byte OPTS_NOCHANGE	; Object $24 - OBJ_PLATFORM_HORZOSC
	.byte OPTS_NOCHANGE	; Object $25
	.byte OPTS_NOCHANGE	; Object $26 - OBJ_WOODENPLAT_RIDER
	.byte OPTS_NOCHANGE	; Object $27 - OBJ_PLATFORM_DIAG1OSC

	.org ObjectGroup_KillAction	
;****************************** OBJECT DEATH ROUTINE ******************************
	.byte KILLACT_STANDARD	; Object $14
	.byte KILLACT_JUSTDRAW16X16	; Object $15
	.byte KILLACT_STANDARD	; Object $16
	.byte KILLACT_POOFDEATH	; Object $17 - OBJ_NEGASTAR
	.byte KILLACT_NORMALSTATE	; Object $18 - OBJ_BOSS_BOWSER
	.byte KILLACT_JUSTDRAWMIRROR	; Object $19 - OBJ_POWERUP_FIREFLOWER
	.byte KILLACT_STANDARD	; Object $1A
	.byte KILLACT_STANDARD	; Object $1B - OBJ_BOUNCELEFTRIGHT
	.byte KILLACT_STANDARD	; Object $1C
	.byte KILLACT_STANDARD	; Object $1D
	.byte KILLACT_STANDARD	; Object $1E - OBJ_ESWITCH
	.byte KILLACT_STANDARD	; Object $1F - OBJ_GROWINGVINE
	.byte KILLACT_STANDARD	; Object $20
	.byte KILLACT_NORMALSTATE	; Object $21 - OBJECT_ICESPIKE
	.byte KILLACT_STANDARD	; Object $22 - OBJ_POWERUP_PUMPKIN
	.byte KILLACT_STANDARD	; Object $23 - OBJ_POWERUP_FOXLEAF
	.byte KILLACT_STANDARD	; Object $24 - OBJ_PLATFORM_HORZOSC
	.byte KILLACT_STANDARD	; Object $25
	.byte KILLACT_STANDARD	; Object $26 - OBJ_WOODENPLAT_RIDER
	.byte KILLACT_STANDARD	; Object $27 - OBJ_PLATFORM_DIAG1OSC


OG2_POff .func (\1 - ObjectGroup02_PatternSets)

	.org ObjectGroup_PatternStarts	; <-- help enforce this table *here*
;****************************** OBJECT FRAME TABLE ******************************
    .org ObjectGroup_PatternSets	; <-- help enforce this table *here*
    .byte OG2_POff(ObjP14), OG2_POff(ObjP15), OG2_POff(ObjP16), OG2_POff(ObjP17)
	.byte OG2_POff(ObjP18), OG2_POff(ObjP19), OG2_POff(ObjP1A), OG2_POff(ObjP1B)
	.byte OG2_POff(ObjP1C), OG2_POff(ObjP1D), OG2_POff(ObjP1E), OG2_POff(ObjP1F)
	.byte OG2_POff(ObjP20), OG2_POff(ObjP21), OG2_POff(ObjP22), OG2_POff(ObjP23)
    .byte OG2_POff(ObjP24), OG2_POff(ObjP25), OG2_POff(ObjP26), OG2_POff(ObjP27)

ObjectGroup02_PatternSets:

ObjP14:
	.byte $99, $5C, $9B, $5C
  
ObjP16:	
    .byte $81, $83, $85, $87, $89, $89, $87, $85, $C1, $C3, $C5, $C7, $C9, $C9, $C7, $C5

ObjP15:
	.byte $81, $83

ObjP17:
	.byte $9F, $9F

ObjP18:	
	.byte $97, $99, $9B, $9D, $A1, $AB, $A3, $A1, $A3, $AB, $A5, $A1, $A5, $AB, $A7, $A1
	.byte $D7, $D9, $DB, $DD, $E1, $EB, $E3, $E1, $E3, $EB, $E5, $E1, $E5, $EB, $E7, $E1    

ObjP19:
	.byte $15, $15
	.byte $13, $13
	.byte $11, $11

ObjP1A:
    .byte $8D, $8D, $8F, $8F, $91, $91, $A7, $A7, $A9, $A9, $AB, $AB    

ObjP1B:
    .byte $8B, $8D, $8F, $91, $89, $89, $91, $8F, $CB, $CD, $CF, $D1, $C9, $C9, $D1, $CF	; RAS: Not actually used, see BounceBlock_Tile
    
ObjP1C:	
	.byte $B9, $BB    

ObjP1D:
	.byte $97, $99, $9B, $9D, $A1, $AB, $A3, $A1, $A3, $AB, $A5, $A1, $A5, $AB, $A7, $A1
	.byte $D7, $D9, $DB, $DD, $E1, $EB, $E3, $E1, $E3, $EB, $E5, $E1, $E5, $EB, $E7, $E1    

ObjP1E:	
	.byte $B9, $BB
	.byte $F9, $FB

ObjP1F:
    .byte $51, $53      

ObjP20:
ObjP21:
    .byte $AF, $AF

ObjP22:	
ObjP23:	
ObjP24:
ObjP25:
ObjP26:
ObjP27:
	.byte $A1, $A3, $AD, $AF, $A5, $A7, $A9, $AB

	
GiantChomp_Palette:
	.byte SPR_PAL1, SPR_PAL0

GiantChomp_Action = Objects_Data1
GiantChomp_AnimTicks = Objects_Data2

GiantChomp_Offsets:
	.byte $E0, $C0
	.byte $FF, $00

ObjInit_GiantChomp:
	LDA #$08
	STA Objects_SpritesRequested,X 
	
	LDA #BOUND32x32
	STA Objects_BoundBox, X

	LDA #ATT_ATTACKPROOF
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
	BEQ GiantChomp_Attack1
	JMP GiantChomp_Draw

GiantChomp_Attack1:
	LDA <Player_HaltGameZ
	BEQ GiantChomp_Attack2
	
	JMP GiantChomp_Draw

GiantChomp_Attack2:

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

GiantChompFrames:
	.byte $81, $83, $85, $87, $A1, $A3, $A5, $A7
	.byte $89, $8B, $8D, $8F, $A9, $AB, $AD, $A

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

ObjInit_KeyPiece:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	JSR Object_NoInteractions
	RTS

ObjNormal_KeyPiece:
	LDA <Player_HaltGameZ
	BNE DrawKeyPieceAnim

	LDA LastPatTab_Sel
	EOR #$01
	TAY

	LDA #$4D
	STA PatTable_BankSel + 4, Y

	LDA KPFrames, Y
	STA Objects_Frame, X

	JSR Object_DeleteOffScreen
	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer

	INC Objects_Data2, X

	LDA Objects_Data2, X
	LSR A
	LSR A 
	LSR A
	AND #$03
	ORA Objects_Frame, X
	STA Objects_Frame, X

DrawKeyPieceAnim:
	JSR Object_Draw

	LDA Objects_Frame, X
	AND #$03
	TAX

	LDA KPFlips1, X
	ORA Sprite_RAM + 2, Y
	STA Sprite_RAM + 2, Y

	LDA KPFlips2, X
	ORA Sprite_RAM + 6, Y
	STA Sprite_RAM + 6, Y
	RTS

ObjHit_KeyPiece:
	LDY #$04

FindKeyTracker:
	LDA Objects_ID,Y
	CMP #OBJ_KEYPIECES
	BEQ SetKeyField

	DEY
	BPL FindKeyTracker
	RTS

SetKeyField:
	LDA Objects_Property, X
	TAX

	LDA Objects_Data4, Y
	ORA KeyPieceGet, X
	STA Objects_Data4, Y

	LDA #SND_MAPINVENTORYFLIP	 
	STA Sound_QMap	

	LDX <CurrentObjectIndexZ
	JMP Object_SetDeadEmpty

ObjInit_NegaStar:
	; Objects_Data4 is just a timer for taking stars
	LDA #$FF
	STA Objects_Data4,X

	LDA #ATTR_ALLWEAPONPROOF
	STA Objects_WeaponAttr, X

	LDA #(ATTR_SHELLPROOF | ATTR_EXPLOSIONPROOF | ATTR_BUMPNOKILL )
	STA Objects_BehaviorAttr, X
	RTS

ObjNorm_NegaStar:

	; Up to 8 Negastars are possible, each with different star costs, the NegaStars are prefilled at game initialization
	; see GAME START comment
	LDY Objects_Property, X
	LDA NegaStars, Y
	BNE ObjNorm_NegaStar0
	JMP Coin_Unlock

ObjNorm_NegaStar0:
	JSR Object_DeleteOffScreen
	LDA <Player_HaltGameZ
	BNE ObjNorm_NegaStar01
	LDA #$91
	BEQ ObjNorm_NegaStar01
	JSR TakeMagic_Star

ObjNorm_NegaStar01:
	JSR Object_DrawMirrored

	LDA Objects_SpritesHorizontallyOffScreen,X 
	ORA Objects_SpritesVerticallyOffScreen,X
	BNE NegaStarRTS

	LDY Objects_Property, X

	LDA NegaStars, Y
	STA DigitsParam

	JSR BytesTo2Digits

	LDY Object_SpriteRAMOffset, X

	LDA Sprite_RAM, Y
	ADD #$10
	STA Sprite_RAM+8, Y
	STA Sprite_RAM+12, Y

	LDA Sprite_RAM+3, Y
	STA Sprite_RAM+11, Y
	ADD #$08
	STA Sprite_RAM+15, Y

	LDA #SPR_PAL1
	STA Sprite_RAM+10,Y
	STA Sprite_RAM+14,Y

	LDA <DigitsResult
	ASL A
	ADD #$A1
	STA Sprite_RAM + 9, Y

	LDA <DigitsResult + 1
	ASL A
	ADD #$A1
	STA Sprite_RAM + 13, Y

NegaStarRTS:
	RTS

TakeMagic_Star:
	LDA Objects_Data4, X
	BEQ TakeMagic_Star0
	DEC Objects_Data4, X
	RTS

TakeMagic_Star0:
	INC Objects_Data5, X
	LDA Objects_Data5, X
	CMP #$20
	BEQ TakeMagic_Star1

	LDY Objects_Property, X
	LDA <Player_SpriteX
	STA Sprite_RAM+11,Y
	ADD #$08
	STA Sprite_RAM+15,Y

	LDA <Player_SpriteY
	SUB Objects_Data5, X
	STA Sprite_RAM+8,Y
	STA Sprite_RAM+12,Y

	LDA #$7F
	STA Sprite_RAM+9,Y
	STA Sprite_RAM+13,Y

	LDA #SPR_PAL1
	STA Sprite_RAM+10,Y
	ORA #SPR_HFLIP
	STA Sprite_RAM+14,Y
	RTS

TakeMagic_Star1:
	DEC Magic_Stars
	LDY Objects_Property, X
	LDA NegaStars, Y
	SUB #$01
	STA NegaStars, Y
	LDA Sound_QLevel1
	ORA #SND_MAPBONUSAPPEAR
	STA Sound_QMap
	LDA #40
	STA Objects_Data4,X
	LDA #$00
	STA Objects_Data5,X
	RTS


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

ObjInit_StarPiece:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	JMP Object_NoInteractions

ObjNorm_StarPiece:
	LDA <Player_HaltGameZ
	BNE DrawStarPieceAnim

	LDA LastPatTab_Sel
	EOR #$01
	TAY
	LDA #$4D
	STA PatTable_BankSel + 4, Y
	LDA KPFrames, Y
	STA Objects_Frame, X

	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_CheckForeground
	JSR Object_InteractWithPlayer

	INC Objects_Data2, X
	LDA Objects_Data2, X
	LSR A
	LSR A 
	LSR A
	AND #$03
	ORA Objects_Frame, X
	STA Objects_Frame, X

DrawStarPieceAnim:
	JSR Object_Draw
	LDA Objects_Frame, X
	AND #$03
	TAX

	LDA KPFlips1, X
	ORA Sprite_RAM + 2, Y
	STA Sprite_RAM + 2, Y

	LDA KPFlips2, X
	ORA Sprite_RAM + 6, Y
	STA Sprite_RAM + 6, Y
	RTS

ObjInit_SendBack:
	LDA #$C0
	STA Objects_SlowTimer, X
	
	JMP Object_NoInteractions

ObjNorm_SendBack:
	LDA Objects_SlowTimer, X
	BNE ObjNorm_SendBackRTS

	INC Level_JctCtl
	INC Level_Redraw
	INC ForcedSwitch
	
	LDA #$00
	STA Level_HorzScrollLock

	LDA #$F0
	SUB <Player_X
	STA <Player_X

	LDA PreviousLevel
	STA LevelLoadPointer

ObjNorm_SendBackRTS:
	RTS

TimerStartTimes:
	.byte 30, 100

ObjInit_Timer:
	LDA #$03
	STA Objects_SpritesRequested, X

	LDA Objects_Property, X
	TAY

	LDA TimerStartTimes, Y
	STA Objects_Data4, X

	LDA #$B0
	STA Objects_Data5, X

	INC Objects_Global, X
	
	JMP Object_NoInteractions

ObjNorm_Timer:
	LDA Objects_Data2, X
	BNE ObjNorm_Timer0

	LDA #MUS1_TIMEWARNING	 
	STA Sound_QMusic1
	INC Objects_Data2, X

ObjNorm_Timer0:
	LDA <Player_HaltGameZ
	BNE ObjNorm_Timer1

	LDA Objects_Data4, X
	BEQ ObjNorm_Timer2

	DEC Objects_Data5, X
	BNE ObjNorm_Timer1

	DEC Objects_Data4, X
	LDA #$2D
	STA Objects_Data5, X

ObjNorm_Timer1:
	JSR DrawTimer
	RTS

ObjNorm_Timer2:
	JSR Player_Die
	RTS

Timer_XOffset:
	.byte $20, $18, $10

DrawTimer:
	LDA LastPatTab_Sel
	EOR #$01
	TAY

	LDA #$4D
	STA PatTable_BankSel + 4, Y

	LDA Objects_Data4, X
	STA DigitsParam

	LDA #$00
	STA DigitsParam + 1

	JSR BytesTo3Digits

	LDA LastPatTab_Sel
	EOR #$01
	TAX

	LDA Lock_NumOffset, X
	STA <Temp_Var1

	LDX <CurrentObjectIndexZ
	LDY Object_SpriteRAMOffset, X

	LDX #$02

DrawTimer1:
	LDA #$10
	STA Sprite_RAMY, Y

	LDA #SPR_PAL2
	STA Sprite_RAMAttr, Y

	LDA Timer_XOffset, X
	STA Sprite_RAMX, Y

	LDA <DigitsResult, X
	ASL A
	ADD #$A1
	ADD <Temp_Var1
	STA Sprite_RAMTile, Y

	INY
	INY
	INY
	INY

	DEX
	BPL DrawTimer1

	LDX <CurrentObjectIndexZ
	RTS

ObjInit_ESwitch:
	LDA #$05
	STA Objects_SpritesRequested, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X
	JMP Object_NoInteractions

ObjNorm_ESwitch:
	LDA Objects_Property, Y
	JSR DynJump

	.word ESwitch_Lock

ESwitch_Lock:
	LDA EventSwitch
	BEQ ESwitch_LockDraw

	LDA <Player_HaltGameZ
	BNE ESwitch_LockDraw

	LDA CoinLock_BlocksRemaining, X
	CMP #$02
	BNE ESwitch_NoResetLock

	LDA #$00
	STA EventSwitch
	
ESwitch_NoResetLock:
	JMP Coin_Unlock

ESwitch_LockDraw:
	LDA LastPatTab_Sel
	EOR #$01
	TAY

	LDA #$4D
	STA PatTable_BankSel + 4, Y

	TYA
	STA Objects_Frame, X

	JMP Object_Draw

ESwitch_NoUnlock:
	RTS


Clock_Collected = Objects_Data3
Clock_Frame = Objects_Data4

Clock_FrameOffsets:
	.byte $00, $08

ObjInit_Clock:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	JMP Object_NoInteractions

ObjNorm_Clock:
	JSR Object_DeleteOffScreen
	
	LDA #$00
	STA <Temp_Var10

	LDA LastPatTab_Sel
	EOR #$01
	TAY

	LDA #$4D
	STA PatTable_BankSel + 4, Y

ObjNorm_Clock0:
	LDA <Player_HaltGameZ
	BNE ObjNorm_Clock1

	LDA Clock_Collected, X
	BNE ObjNorm_Clock2

	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer

	LDA LastPatTab_Sel
	EOR #$01
	TAY

	INC Clock_Frame, X
	LDA Clock_Frame, X
	LSR A
	LSR A
	LSR A
	AND #$01
	ADD Clock_FrameOffsets, Y
	STA Objects_Frame, X
	
ObjNorm_Clock1:
	JMP Object_Draw

ObjNorm_Clock2:
	LDA <Player_HaltGameZ
	BNE ObjNorm_Clock3

	LDA LastPatTab_Sel
	EOR #$01
	TAY

	LDA Objects_Property, X
	ADD #$02
	ADD <Temp_Var10
	ADD Clock_FrameOffsets, Y
	STA Objects_Frame, X

	JSR Object_ApplyYVel_NoGravity

	LDA Objects_Timer, X
	BEQ ObjNorm_Clock4

ObjNorm_Clock3:
	JMP Object_Draw

ObjNorm_Clock4:
	JMP Object_Delete

ClockTimes:
	.byte 5, 10, 15, 20, 25, 30

ObjHit_Clock:
	LDY #$04

ObjHit_Clock1:
	LDA Objects_ID, Y
	CMP #$1D
	BEQ ObjHit_Clock2

	DEY
	BPL ObjHit_Clock1
	RTS

ObjHit_Clock2:
	LDA Objects_Property, X
	TAX
	LDA ClockTimes, X
	ADD Objects_Data4, Y
	STA Objects_Data4, Y

	LDX <CurrentObjectIndexZ

	INC Clock_Collected, X

	LDA #$20
	STA Objects_Timer, X

	LDA #$F8
	STA Objects_YVelZ, X

	LDA #SPR_PAL2
	STA Objects_SpriteAttributes, X

	LDA Sound_QLevel1
	ORA #SND_MAPBONUSAPPEAR
	STA Sound_QMap
	RTS

ObjInit_IceSpike:
	LDA #(ATTR_ICEPROOF | ATTR_TAILPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	LDA #ATTR_SHELLPROOF
	STA Objects_BehaviorAttr, X

	LDA #BOUND8x16
	STA Objects_BoundBox, X
	RTS

IceSpike_Action = Objects_Data1

ObjNorm_IceSpike:
	
	LDA <Player_HaltGameZ
	BEQ IceSpike_Normal

	JMP Object_DrawAligned
	
IceSpike_Normal:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE IceSpike_NotDead

	JMP Object_BurstIce

IceSpike_NotDead:
	JSR Object_DeleteOffScreen

	LDA IceSpike_Action, X
	JSR DynJump

	.word IceSpike_Wait
	.word IceSpike_Shake
	.word IceSpike_Fall

IceSpike_Wait:
	JSR Object_CalcBoundBox
	JSR Object_XDistanceFromPlayer
	LDA <XDiff
	CMP #$31
	BCS IceSpike_NoShake

	JSR Object_YDistanceFromPlayer
	LDA <YDiffAboveBelow
	BEQ IceSpike_NoShake

	INC IceSpike_Action, X

	LDA #$20
	STA Objects_Timer, X

IceSpike_NoShake:
	JSR Object_InteractWithPlayer
	JMP Object_DrawAligned

IceSpike_Shake:
	LDA Objects_Timer, X
	BNE IceSpike_KeepShaking

	INC IceSpike_Action, X

IceSpike_KeepShaking:
	AND #$01
	STA <Temp_Var1

	LDA <Objects_XZ, X
	AND #$FE
	ORA <Temp_Var1
	STA <Objects_XZ, X
	STA <Objects_XZ, X

	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer
	JMP Object_DrawAligned

IceSpike_Fall:
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer
	JSR Object_DetectTiles

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ IceSpike_NoBurst

	JSR Object_BurstIce

IceSpike_NoBurst:
	JMP Object_DrawAligned

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


PlatformGenDelay:
	.byte $00, $20  

ObjInit_WoodenPlatFallGen:
	LDY Objects_Property, X
	
    LDA PlatformGenDelay, Y
	STA Objects_Timer, X
	
    LDA #$FC
	STA <Objects_YVelZ, X
	
    LDA Objects_SpriteAttributes,X
	ORA #SPR_BEHINDBG
	STA Objects_SpriteAttributes,X

ObjInit_WoodenPlatFallGen1:
	LDA <Objects_YZ, X
	STA Objects_Data4, X
	
    LDA <Objects_YHiZ, X
	STA Objects_Data5, X
	RTS

Reset_WoodenPlatFallGen:
	LDA #$60
	STA Objects_Timer, X

	LDA Objects_Data4, X
	STA <Objects_YZ, X

	LDA Objects_Data5, X
	STA <Objects_YHiZ, X

	LDA #00
	STA Objects_Data3, X
	RTS

ObjNorm_WoodenPlatFallGen:
	RTS		 ; Return    



ObjInit_WoodenPlatDiagonal1:
	JSR ObjInit_PlatformCommon
	LDA #$02
	STA Objects_Property, X
	JMP InitPatrol_NoTimers
    


PlatformTimers:
	.byte $01, $11, $21, $31, $41, $51, $61, $71

Platform_StartX = Objects_Data3
Platform_StartXHi = Objects_Data4
Platform_SteppedOn = Objects_Data5
Platform_MadeContact = Objects_Data6
Platform_Fall = Objects_Data7

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


ObjNorm_PlatformOscillate:
	LDA <Player_HaltGameZ
	BNE ObjNorm_PlatformOscillate1	 ; If gameplay halted, Delete if off-screen, otherwise draw wide 48x16 sprite

	JSR Object_CalcBoundBoxForced
	
	LDA #$00
	STA Platform_MadeContact, X

	JSR Object_InteractWithPlayer
	JSR DoPatrol
	JSR Platform_ContactCheck

	LDA <Objects_XZ, X
	CMP Platform_StartX, X
	BNE ObjNorm_PlatformOscillate1

	LDA <Objects_XHiZ, X
	CMP Platform_StartXHi, X

	BNE ObjNorm_PlatformOscillate1


	JSR Object_DeleteOffScreen

ObjNorm_PlatformOscillate1:
	LDA Objects_SpriteAttributes, X
	ORA #SPR_BEHINDBG
	STA Objects_SpriteAttributes, X
	JMP Platform_Draw
	
ObjInit_WoodenPlat:
	RTS		 ; Return
    

Platform_Draw:
	LDA #$00
	STA Objects_Orientation, X
	
	LDA Objects_SpritesVerticallyOffScreen,X
	BEQ Platform_DoDraw

	RTS

Platform_DoDraw:
	INC <Objects_YZ, X
	JSR Object_DrawMirrored

	DEC <Objects_YZ, X

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

Platform_PlayerStand:
	LDA <Player_YVel
	BMI Platform_PlayerStand1

	LDA HitTest_Result
	AND #HITTEST_BOTTOM
	BEQ Platform_PlayerStand1

	LDA Player_BoundBottom
	SUB Objects_BoundTop, X
	CMP #$04
	BCS Platform_PlayerStand1

	LDA #$01
	STA Platform_SteppedOn, X
	STA Platform_MadeContact, X

Platform_PlayerStand1:	
	RTS

Platform_PlayerOffset:
	.byte $01, $00
	.byte $00, $00

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
    