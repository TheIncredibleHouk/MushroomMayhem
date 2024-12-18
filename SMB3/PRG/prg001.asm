    .org ObjectGroup_InitJumpTable
;****************************** OBJECT INITIALIZATION ******************************
	; 
OBJ_POWERUP 		= $01
OBJ_ITEMBLOCK 		= $04
OBJ_COINLOCK	 	= $05
OBJ_ELOCK			= $06
OBJ_BUBBLE			= $07
OBJ_KEY				= $08
OBJ_SPRING			= $09
OBJ_WORLDTRAVEL 	= $0A
OBJ_SENDBACK 		= $0B
OBJ_MAGICSTAR_1		= $0C
OBJ_MAGICSTAR_2		= $0D
OBJ_MAGICSTAR_3		= $0E
OBJ_TRAINING		= $0F
OBJ_STARPIECE		= $10
OBJ_ICEBLOCK		= $11
OBJ_MALICEMUSHROOM 	= $12
OBJ_BOSS			= $13

	.word ObjInit_DoNothing	; Object $00
	.word ObjInit_PowerUp	; Object $01 - OBJ_POWERUP
	.word ObjInit_PUp1		; Object $02 - OBJ_POWERUP_INIT1
	.word ObjInit_PUp2		; Object $03 - OBJ_POWERUP_MUSHROOM
	.word ObjInit_ItemBlock	; Object $04 - OBJ_ITEMBLOCK
	.word ObjInit_CoinLock	; Object $05
	.word ObjInit_ELock	; Object $06
	.word ObjInit_Bubble	; Object $07
	.word ObjInit_Key		; Object $08
	.word ObjInit_Spring	; Object $09
	.word ObjInit_WorldTravel ; Object $0A
	.word ObjInit_SendBack	; Object $0B
	.word ObjInit_MagicStar1 ; Object $0C
	.word ObjInit_MagicStar2 ; Object $0D
	.word ObjInit_MagicStar3 ; Object $0E
	.word ObjInit_Training	; Object $0F
	.word ObjInit_StarPiece	; Object $10
	.word ObjInit_IceBlock	; Object $11
	.word ObjInit_MaliceMushroom ; Object $12
	.word ObjInit_DoNothing	; Object $13
	
	.org ObjectGroup_NormalJumpTable	; <-- help enforce this table *here*
;****************************** OBJECT GAME LOOP ******************************
	.word ObjNorm_DoNothing	; Object $00
	.word ObjNorm_PowerUp	; Object $01
	.word ObjNorm_DoNothing	; Object $02
	.word ObjNorm_DoNothing	; Object $03
	.word ObjNorm_ItemBlock  ; Object $04
	.word ObjNorm_CoinLock	; Object $05
	.word ObjNorm_ELock	; Object $06
	.word ObjNorm_Bubble	; Object $07
	.word ObjNorm_Key		; Object $08
	.word ObjNorm_Spring	; Object $09
	.word ObjNorm_WorldTravel	; Object $0A
	.word ObjNorm_SendBack	; Object $0B
	.word ObjNorm_MagicStar ; Object $0C
	.word ObjNorm_MagicStar ; Object $0D
	.word ObjNorm_MagicStar ; Object $0E
	.word ObjNorm_Training	; Object $0F
	.word ObjNorm_StarPiece ; Object $10
	.word ObjNorm_IceBlock	; Object $11
	.word ObjNorm_MaliceMushroom ; Object $12
	.word Obj_Boss	; Object $13	

	.org ObjectGroup_CollideJumpTable	; <-- help enforce this table *here*
;****************************** OBJECT PLAYER INTERACTION ******************************
	.word ObjHit_DoNothing	; Object $00
	.word PUp_Collect		; Object $01
	.word ObjHit_DoNothing	; Object $02
	.word ObjHit_DoNothing	; Object $03
	.word ObjHit_DoNothing	; Object $04
	.word ObjHit_DoNothing	; Object $05
	.word ObjHit_DoNothing	; Object $06
	.word Bubble_Hit		; Object $07
	.word Object_Hold		; Object $08
	.word Object_Hold		; Object $09
	.word ObjHit_DoNothing	; Object $0A
	.word ObjHit_DoNothing	; Object $0B
	.word Paper_StarCollect	; Object $0C
	.word Paper_StarCollect	; Object $0D
	.word Paper_StarCollect	; Object $0E
	.word ObjHit_DoNothing	; Object $0F
	.word StarCoin_Collect ; Object $10
	.word Object_Hold		; Object $11
	.word Player_GetHurt	; Object $12
	.word ObjHit_DoNothing	; Object $13	

	.org ObjectGroup_Attributes	; <-- help enforce this table *here*
;****************************** OBJECT PALETTE/SIZE ******************************
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $00
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $01
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $02
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $03
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $04
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $05
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $06
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $07
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16 ; Object $08
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $09
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $0A
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $0B
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $0C
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $0D
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $0E
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $0F
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $10
	.byte OA1_PAL2 | OA1_WIDTH16 | OA1_WIDTH16	; Object $11
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $12
	.byte OA1_PAL1 | OA1_HEIGHT64 | OA1_WIDTH32	; Object $13	

	.org ObjectGroup_PatTableSel	; <-- help enforce this table *here*
;****************************** OBJECT PATTERN TABLE ******************************
	.byte OPTS_NOCHANGE		; Object $00
	.byte OPTS_NOCHANGE		; Object $01
	.byte OPTS_NOCHANGE		; Object $02
	.byte OPTS_NOCHANGE		; Object $03
	.byte OPTS_NOCHANGE		; Object $04
	.byte OPTS_NOCHANGE		; Object $05
	.byte OPTS_NOCHANGE		; Object $06
	.byte OPTS_NOCHANGE		; Object $07
	.byte OPTS_NOCHANGE		; Object $08
	.byte OPTS_SETPT6 | $4F	; Object $09
	.byte OPTS_NOCHANGE		; Object $0A
	.byte OPTS_NOCHANGE		; Object $0B
	.byte OPTS_NOCHANGE		; Object $0C
	.byte OPTS_NOCHANGE		; Object $0D
	.byte OPTS_NOCHANGE		; Object $0E
	.byte OPTS_NOCHANGE		; Object $0F
	.byte OPTS_NOCHANGE		; Object $10
	.byte OPTS_NOCHANGE		; Object $11
	.byte OPTS_NOCHANGE		; Object $12
	.byte OPTS_NOCHANGE		; Object $13
	
	.org ObjectGroup_KillAction	; <-- help enforce this table *here*
;****************************** OBJECT DEATH ROUTINE ******************************
	.byte KILLACT_STARDEATH		; Object $00
	.byte KILLACT_STARDEATH		; Object $01
	.byte KILLACT_STARDEATH		; Object $02
	.byte KILLACT_STARDEATH		; Object $03
	.byte KILLACT_STARDEATH		; Object $04
	.byte KILLACT_STARDEATH		; Object $05
	.byte KILLACT_STARDEATH		; Object $06
	.byte KILLACT_STARDEATH		; Object $07
	.byte KILLACT_STARDEATH		; Object $08
	.byte KILLACT_STARDEATH		; Object $09
	.byte KILLACT_STARDEATH		; Object $0A
	.byte KILLACT_NORMALSTATE		; Object $0B
	.byte KILLACT_STARDEATH		; Object $0C
	.byte KILLACT_STARDEATH		; Object $0D
	.byte KILLACT_STARDEATH		; Object $0E
	.byte KILLACT_STARDEATH		; Object $0F
	.byte KILLACT_STARDEATH		; Object $10
	.byte KILLACT_NORMALSTATE	; Object $11
	.byte KILLACT_NORMALSTATE		; Object $12
	.byte KILLACT_NORMALSTATE		; Object $13

OG1_POff .func (\1 - ObjectGroup01_PatternSets)

	.org ObjectGroup_PatternStarts	; <-- help enforce this table *here*

	; Index by object group relative index (ObjGroupRel_Idx)
	.byte OG1_POff(ObjP00), OG1_POff(ObjP01), OG1_POff(ObjP02), OG1_POff(ObjP03)
	.byte OG1_POff(ObjP04), OG1_POff(ObjP05), OG1_POff(ObjP06), OG1_POff(ObjP07)
	.byte OG1_POff(ObjP08), OG1_POff(ObjP09), OG1_POff(ObjP0A), OG1_POff(ObjP0B)
	.byte OG1_POff(ObjP0C), OG1_POff(ObjP0D), OG1_POff(ObjP0E), OG1_POff(ObjP0F)
	.byte OG1_POff(ObjP10), OG1_POff(ObjP11), OG1_POff(ObjP12), OG1_POff(ObjP13)

	.org ObjectGroup_PatternSets

ObjectGroup01_PatternSets:

ObjP00:
ObjP02:
ObjP03:
ObjP0A:
ObjP0B:
ObjP13:

ObjP01:
	.byte $51, $53	
	.byte $73, $73
	.byte $BD, $BD
	.byte $B9, $BB

ObjP04:
	.byte $6B, $6B, $67, $67, $77, $77	

ObjP05:
	.byte $F5, $F7, $B5, $B7	

ObjP06:
	.byte $B9, $BB
	.byte $F9, $FB

ObjP07:
	.byte $AD, $AD, $AF, $AF, $B1, $B1, $B3, $B3, $B5, $B5, $B7, $B7
	.byte $ED, $ED, $EF, $EF, $F1, $F1, $F3, $F3, $F5, $F5, $F7, $F7

ObjP08:
	.byte $69, $7D

ObjP09:
	.byte $D7, $D7, $ED, $ED, $FF, $FF, $ED, $ED

ObjP0C:
ObjP0D:
ObjP0E:
	.byte $7F, $7F

ObjP0F:
	.byte $9F, $9F

ObjP10:
	.byte $8B, $8D, $8F, $91, $89, $89, $91, $8F, $CB, $CD, $CF, $D1, $C9, $C9, $D1, $CF	

ObjP11:
	.byte $61, $61	

ObjP12:
	.byte $79, $79, $79, $79, $79, $79	

;***********************************************************************************
; POWER UP
;***********************************************************************************
; IMMUNITIES:
;		ALL
;***********************************************************************************
; 	This represent all the power ups you can get out of an item box EXCEPT P-Switches and Keys
;***********************************************************************************

POWERUP_COIN		= 1
POWERUP_MUSHROOM	= 2
POWERUP_FIREFLOWER	= 3
POWERUP_SUPERLEAF	= 4
POWERUP_FROGSUIT	= 5
POWERUP_SHELL		= 6
POWERUP_HAMMERSUIT	= 7
POWERUP_ICEFLOWER	= 8
POWERUP_FOXLEAF		= 9
POWERUP_NINJASHROOM = 10
POWERUP_STAR		= 11
POWERUP_VINE		= 12
POWERUP_PWING		= 13
POWERUP_CHECKPOINT	= 14
POWERUP_MEGASTAR	= 15
POWERUP_SPORE		= 16

PowerUp_Palette:
	.byte SPR_PAL0, SPR_PAL0, SPR_PAL1, SPR_PAL2, SPR_PAL1, SPR_PAL2, SPR_PAL2, SPR_PAL3, SPR_PAL2, SPR_PAL3, SPR_PAL1, SPR_PAL1, SPR_PAL2, SPR_PAL3, SPR_PAL0, SPR_PAL2, SPR_PAL1

PowerUp_YVelocities:
	.byte $00, $00, $D0, $D0, $C0, $D0, $D0, $D0, $D0, $C0, $B0, $D0, $D0, $D0, $D0, $00, $A0

PowerUp_AnimOff:
	.byte $00, $00, $00, $04, $08, $0C, $10, $14, $18, $24, $20, $28, $FF, $2C, $1C, $FF, $FF

PowerUp_Timers:
	.byte $00, $00, $08, $08, $1C, $1C, $08, $1C, $08, $1C, $08, $1C, $0A, $08, $08, $00, $00


ObjInit_PUp1:
	LDA #OBJ_POWERUP
	STA Objects_ID, X

	LDA Objects_Property, X
	ADD #$02
	STA PowerUp_Type, X
	
	JSR ObjInit_PowerUp
	
	LDA #$00
	STA <Objects_YVelZ, X
	RTS

ObjInit_PUp2:
	LDA #OBJ_POWERUP
	STA Objects_ID, X

	LDA Objects_Property, X
	ADD #$09
	STA PowerUp_Type, X
	
	JSR ObjInit_PowerUp
	
	LDA #$00
	STA <Objects_YVelZ, X
	RTS

ObjInit_PowerUp:
	JSR Object_NoInteractions

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDY PowerUp_Type, X
	CPY #POWERUP_CHECKPOINT
	BNE PowerUp_CheckVine

	LDA #$20
	STA Objects_Timer2, X
	BNE PowerUp_Sound

PowerUp_CheckVine:
	CPY #POWERUP_VINE
	BEQ PowerUp_VineSndFX

PowerUp_Sound:
	LDA Sound_QLevel1
	ORA #SND_LEVELRISE
	STA Sound_QLevel1
	BNE PowerUp_Init

PowerUp_VineSndFX:
	LDA Sound_QLevel1
	ORA #SND_LEVELVINE
	STA Sound_QLevel1

PowerUp_Init:
	LDA PowerUp_Palette, Y
	STA Objects_SpriteAttributes, X

	LDA #$04
	STA Objects_SpritesRequested, X

	LDA PowerUp_YVelocities, Y
	STA <Objects_YVelZ, X

	LDA PowerUp_AnimOff, Y
	BMI Skip_SprAnimOffset

	STA SprAnimOffset

Skip_SprAnimOffset:
	LDA PowerUp_Raise, X
	BEQ ObjInit_PowerUp2

	LDA PowerUp_Timers, Y
	STA Objects_Timer, X

ObjInit_PowerUp2:
	JSR Object_CalcBoundBox
	LDY #$00

	; LDA DayNight
	; BPL PowerUp_InitSetXVel

	; INY

PowerUp_InitSetXVel:
	LDA PowerUp_XVel, Y
	STA <Objects_XVelZ, X

	LDA <Objects_XZ, X
	STA PowerUp_StartX, X

	LDA <Objects_YZ, X
	SUB #$04
	STA PowerUp_StartY, X
	RTS

PowerUp_XVel:
	.byte $08, $F8

PowerUp_Type = Objects_Data1
PowerUp_Raise = Objects_Data2
PowerUp_StartX = Objects_Data3
PowerUp_StartY = Objects_Data4
PowerUp_NoDraw = Objects_Data5
PowerUp_Property = Objects_Data6

ObjNorm_PowerUp:
	LDA <Player_HaltGameZ
	BEQ PowerUp_Norm

	LDA PowerUp_Type, X
	CMP #POWERUP_VINE

	BNE PowerUp_NotVine

	JMP PUp_VineDraw

PowerUp_NotVine:
	JMP Object_Draw

PowerUp_Norm:
	LDA PowerUp_Type, X
	CMP #POWERUP_VINE
	BEQ PowerUp_NoDelete

	JSR Object_DeleteOffScreen

PowerUp_NoDelete:
	LDA Objects_Timer, X
	BEQ ObjNorm_PowerUp1

	LDA #$01
	STA ObjSplash_Disabled, X

	JSR Object_ApplyY_With_Gravity
	JSR PUp_DrawMaskSprite

ObjNorm_PowerUp0:
	LDA PowerUp_Type, X
	CMP #POWERUP_VINE
	BNE PowerUp_NotVine2

	JMP PUp_Vine

PowerUp_NotVine2:
	CMP #POWERUP_SPORE
	BNE PowerUp_HaltDraw

	JMP PupSpore_JustDraw

PowerUp_HaltDraw:
	JMP Object_Draw

ObjNorm_PowerUp1:

	LDA PowerUp_Type, X
	JSR DynJump

	.word ObjNorm_DoNothing
	.word ObjNorm_DoNothing
	.word PUp_Mushroom
	.word PUp_Flower
	.word PUp_Leaf
	.word PUp_ItemBlock
	.word PUp_Mushroom
	.word PUp_ItemBlock
	.word PUp_Flower
	.word PUp_Leaf
	.word PUp_Mushroom
	.word PUp_ItemBlock
	.word PUp_Vine
	.word Pup_PWing
	.word PUp_Flower
	.word ObjNorm_DoNothing
	.word Pup_Spore


PUp_DrawMaskSprite:
	LDA Objects_SpritesHorizontallyOffScreen,X
	ORA Objects_SpritesVerticallyOffScreen,X
	BNE PUp_DrawMaskSprite1	 ; If any sprite is off-screen, jump to PRG001_A937 (no masking sprite)

	LDA Object_SpriteRAMOffset, X
	TAY

	LDA PowerUp_StartY,X
	AND #$f0	 	; Align object Y to tile
	ADD #$0f	 	; +15
	SUB Level_VertScroll	; Calc relative to vertical scroll

	; Set for both sprite halves Y
	STA Sprite_RAMY,Y
	STA Sprite_RAMY+4,Y

	; Masking tile
	LDA #$67
	STA Sprite_RAMTile,Y
	STA Sprite_RAMTile+4,Y

	; Set sprite priority
	LDA #SPR_BEHINDBG
	STA Sprite_RAMAttr,Y
	STA Sprite_RAMAttr+4,Y

	; Set sprite X's side by side
	LDA Objects_SpriteX,X
	STA Sprite_RAMX,Y
	ADD #$08
	STA Sprite_RAMX+4,Y

	LDA Object_SpriteRAMOffset, X
	ADD #$08
	STA Object_SpriteRAMOffset, X

PUp_DrawMaskSprite1:
	RTS

PUp_Compare:
	.byte $00, $00, $01, $02, $03, $04, $05, $06, $07, $08, $0B, $FF, $FF, $FF, $FF

Mario_AsItem:
	.byte $00
	.byte ITEM_MUSHROOM
	.byte ITEM_FIREFLOWER
	.byte ITEM_SUPERLEAF
	.byte ITEM_FROGSUIT
	.byte ITEM_SHELL
	.byte ITEM_HAMMERSUIT
	.byte ITEM_ICEFLOWER
	.byte ITEM_FOXLEAF
	.byte $00
	.byte $00
	.byte ITEM_NINJASHROOM

PUp_AsItem:
	.byte $00	
	.byte $00
	.byte ITEM_MUSHROOM
	.byte ITEM_FIREFLOWER
	.byte ITEM_SUPERLEAF
	.byte ITEM_FROGSUIT
	.byte ITEM_SHELL
	.byte ITEM_HAMMERSUIT
	.byte ITEM_ICEFLOWER
	.byte ITEM_FOXLEAF
	.byte ITEM_NINJASHROOM	

PUp_Queue:
	.byte $00, $00, $02, $03, $04, $05, $06, $07, $08, $09, $0C, $00, $FF, $FF, $FF

PUp_Collect:
	LDA #OBJSTATE_DEADEMPTY
	STA Objects_State, X

	LDA PowerUp_Type, X
	CMP #POWERUP_MUSHROOM
	BNE PUp_Collect2

	LDY Player_EffectiveSuit
	BEQ PUp_Collect2

PUp_Collect1:
	LDA Player_Badge
	CMP #BADGE_ITEMRESERVE
	BNE PUp_NoReserve

	LDY PowerUp_Type, X
	LDA PUp_AsItem, Y
	STA PowerUp_Reserve

PUp_NoReserve:
	LDA Sound_QLevel1
	ORA #SND_LEVELPOWER
	STA Sound_QLevel1
	RTS

PUp_Collect2:
	TAY

	LDA Player_EffectiveSuit
	CMP PUp_Compare, Y
	BNE PUp_Collect3

	LDA #$10
	STA Exp_Earned
	JMP PUp_Collect1

PUp_Collect3:
	LDA PUp_Queue, Y
	STA Player_QueueSuit

	LDA PowerUp_Type, X
	CMP #POWERUP_CHECKPOINT
	BEQ PUp_CollectNoReserve

	LDA Player_Badge
	CMP #BADGE_ITEMRESERVE
	BNE PUp_CollectNoReserve

	LDY Player_EffectiveSuit

	LDA Mario_AsItem, Y
	BEQ PUp_CollectNoReserve

	STA PowerUp_Reserve

PUp_CollectNoReserve:	
	LDA PowerUp_Type, X

	JSR DynJump

	.word ObjNorm_DoNothing
	.word ObjNorm_DoNothing
	.word PUp_Grow
	.word PUp_Rainbow
	.word PUp_Poof
	.word PUp_Poof
	.word PUp_Poof
	.word PUp_Poof
	.word PUp_Rainbow
	.word PUp_Poof
	.word PUp_Poof
	.word PUp_Star
	.word ObjNorm_DoNothing
	.word PUp_CollectPWing
	.word PUp_CheckPoint

PUp_Grow:
	LDA Player_Vehicle
	BEQ PUp_Grow0

	JMP PUp_Poof

PUp_Grow0:
	LDA Sound_QLevel1
	ORA #SND_LEVELPOWER
	STA Sound_QLevel1

	LDA Player_EffectiveSuit
	BEQ PUp_Grow1
	
	LDA #$00
	STA Player_QueueSuit
	RTS

PUp_Grow1:
	LDA #$2f
	STA Player_Grow
	RTS

PUp_Rainbow:

	LDA Player_Vehicle
	BEQ PUp_Rainbow0

	JMP PUp_Poof
	
PUp_Rainbow0:
	LDA Sound_QLevel1
	ORA #SND_LEVELPOWER
	STA Sound_QLevel1

	LDA #$1f
	STA Player_StarOff
	RTS

PUp_Poof:
	LDA Sound_QLevel1
	ORA #SND_LEVELPOOF
	STA Sound_QLevel1

	LDA #$17
	STA Player_SuitLost
	RTS

PUp_Mushroom:
	JSR Object_DeleteOffScreen
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer
	BCS PUp_Mushroom2

	JSR Object_DetectTiles
	JSR Object_InteractWithTiles

	LDA Objects_Orientation, X
	AND #~SPR_VFLIP
	STA Objects_Orientation, X

PUp_Mushroom2:
	JMP Object_Draw

PUp_Flower:
	JSR Object_DeleteOffScreen
	JSR Object_ApplyY_With_Gravity
	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer
	BCS PUp_Flower2

	JSR Object_DetectTiles
	JSR Object_InteractWithTiles

	LDA Objects_Orientation, X
	AND #~SPR_VFLIP
	STA Objects_Orientation, X

PUp_Flower2:
	JMP Object_Draw

Pup_Spore:
	LDA #$01
	STA ObjSplash_Disabled, X
	STA Objects_InWater, X

	LDA #ATTR_ALLWEAPONPROOF
	STA Objects_WeaponAttr, X

	JSR Object_ApplyY_With_Gravity
	JSR Object_CalcBoundBox

	LDA <Objects_YVelZ, X
	BMI PupSpore_JustDraw

	JSR Object_AttackOrDefeat
	
PupSpore_JustDraw:
	LDA #SPR_PAL1
	STA Objects_SpriteAttributes, X

	LDA <Objects_YVelZ, X
	BPL PUpSpore_NoXMove

	LDA #$02
	STA Objects_Frame, X
	
	LDA <Objects_YHiZ, X
	BNE PupSpore_DrawMirrored

	LDA <Objects_YZ, X
	CMP #$C0
	BCS PupSpore_DrawMirrored

	LDA <Player_X
	STA <Objects_XZ, X

	LDA #$00
	STA <Objects_YVelZ, X
	STA Objects_Timer2, X

PupSpore_DrawMirrored:
	JMP Object_DrawMirrored

PUpSpore_NoXMove:
	LDA #$03
	STA Objects_Frame, X

	JMP Object_Draw

PUp_ItemBlock:
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer
	BCS PUp_ItemBlock1

	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	
	LDA Objects_Orientation, X
	AND #~SPR_VFLIP
	STA Objects_Orientation, X

	LDA <Objects_TilesDetectZ,X
	AND #HITTEST_BOTTOM
	BEQ PUp_ItemBlock1

	LDA #$C0
	STA <Objects_YVelZ, X

PUp_ItemBlock1:
	JMP Object_Draw
	; Values used by the leaf based on bounce direction

Leaf_XVelByOsc:	.byte $02, -$02
Leaf_XVelLimit:	.byte $20, -$20

PRG001_ABD1:
	.byte $0A, -$0A, $08

Leaf_OscData = Objects_Data5

PUp_Leaf:
	JSR Object_DeleteOffScreen
	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer
	BCS PRG001_AC22

	LDA Leaf_OscData,X
	AND #$01
	TAY		 ; Y = 0 or 1 (which oscillation direction)

	; Add appropriate X velocity for oscillation direction
	LDA <Objects_XVelZ,X
	ADD Leaf_XVelByOsc,Y
	STA <Objects_XVelZ,X

	CMP Leaf_XVelLimit,Y
	BNE PRG001_AC02	 ; If leaf has not hit X Vel limit, jump to PRG001_AC02

	INC Leaf_OscData,X	 ; Switch oscillation direction

PRG001_AC02:
	LDA <Objects_XVelZ,X
	BPL PRG001_AC07	 ; If leaf is moving to the right, jump to PRG001_AC07

	INY		 ; Otherwise, Y++ (makes Y = 2)

PRG001_AC07:
	LDA PRG001_ABD1,Y
	ADD #$06	 	; Value +6
	STA <Objects_YVelZ,X	; -> Y Velocity

	JSR Object_ApplyXVel	 ; Apply X Velocity
	JSR Object_ApplyYVel_NoGravity	 ; Apply Y Velocity
	JSR Object_XYCheckSum

PRG001_AC15:
	LDA #SPR_HFLIP	 ; A = SPR_HFLIP (horizontal flip)

	LDY <Objects_XVelZ,X
	BEQ PRG001_AC22	 ; If leaf X Vel = 0, jump to PRG001_AC22 (don't change flip at midpoint)
	BPL PRG001_AC1F	 ; If leaf X Vel > 0, jump to PRG001_AC1F

	LDA #$00	 ; A = 0 (not horizontally flipped)

PRG001_AC1F:
	STA Objects_Orientation,X	 ; Set flip

PRG001_AC22:
	JMP Object_Draw; Draw object and "shake awake" 

Pup_StarLength
	.byte $70, $FF

PUp_Star:
	JSR Object_DeleteOffScreen
	LDA Level_PSwitchCnt
	BNE PRG001_A810	 ; If P-Switch is active, jump to PRG001_A810

	; Otherwise, play invincibility theme!
	LDA Sound_QMusic2
	ORA #MUS2A_INVINCIBILITY
	STA Sound_QMusic2

PRG001_A810:
	LDY PowerUp_Property, X
	; Player_StarInv = $E0
	LDA Pup_StarLength, Y
	STA Player_StarInv
	RTS

Vine_TouchedGround = Objects_Data5

PUp_Vine:
	LDA Vine_TouchedGround, X
	BNE Vine_Grow

	LDA #$00
	STA <Objects_XVelZ, X

	LDA <Objects_XZ, X
	AND #$F0
	STA <Objects_XZ, X

	LDA Block_NeedsUpdate
	BNE PUp_VineDraw

PUp_Move:
	JSR Object_Move

	LDA <Objects_XZ, X
	ADD #$08
	AND #$F0
	STA <Objects_XZ, X

	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	
	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ PUp_VineDraw

	INC Vine_TouchedGround, X
	JMP PUp_VineDraw

Vine_Grow:
	LDA #$F0
	STA <Objects_YVelZ, X
	JSR Object_ApplyYVel_NoGravity

	LDA <Objects_YZ, X
	AND #$0F
	CMP #$0E
	BNE PUp_VineDraw

	LDA <Objects_YHiZ, X
	BPL Vine_NoDelete

	LDA <Objects_YZ, X
	CMP #$F0
	BCC PUp_Delete

Vine_NoDelete:
	JSR Object_CalcBoundBoxForced
	JSR Object_DetectTileCenter

	LDA Tile_LastProp
	CMP #TILE_PROP_SOLID_TOP
	BCC PUp_VineBlock

PUp_Delete:
	LDA #OBJSTATE_DEADEMPTY
	STA Objects_State, X
	RTS

PUp_VineBlock:
	LDA Block_NeedsUpdate
	BEQ Vine_ChangeBlock

	INC <Objects_YZ, X
	RTS

Vine_ChangeBlock:	
	LDA Tile_LastValue
	EOR #$01

	JSR Object_ChangeBlock

	LDA #$F0
	STA <Objects_YVelZ, X

PUp_VineDraw:
	LDA #$01
	STA Objects_Frame, X

	JMP Object_DrawMirrored
	
Pup_PWing:
	LDA #$00
	STA Objects_XVelZ, X
	
	LDA #$00
	STA Objects_Orientation, X

	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	JSR Object_InteractWithPlayer
	JMP Object_Draw

PUp_CollectPWing:
	LDA #$FF
	STA Player_FlyTime

	LDA #$04
	STA Player_QueueSuit

	LDA Sound_QLevel1
	ORA #SND_LEVELPOOF
	STA Sound_QLevel1

	LDA #$17
	STA Player_SuitLost

	LDA #OBJSTATE_DEADEMPTY
	STA Objects_State, X
	RTS


PUp_CheckPoint:
	LDA Sound_QMap
	ORA #SND_MAPENTERWORLD
	STA Sound_QMap
	
	LDA LevelNumber
	STA CheckPoint_Flag

	LDA LevelLoadPointer
	STA CheckPoint_Level

	LDA <Objects_XZ, X
	STA CheckPoint_X

	LDA <Objects_XHiZ, X
	STA CheckPoint_XHi

	LDA <Objects_YZ, X
	SUB #$10
	STA CheckPoint_Y

	LDA <Objects_YHiZ, X
	SBC #$00
	STA CheckPoint_YHi

	LDA Player_Coins
	STA Previous_Coins

	LDA Player_Coins+1
	STA Previous_Coins+1

	LDA Player_Coins+2
	STA Previous_Coins+2

	LDA Player_Cherries
	STA Previous_Cherries

	LDA PowerUp_Reserve
	STA Previous_PowerUp_Reserve
	
	LDA Player_Badge
	STA Previous_Badge

	LDA Paper_Stars
	STA Previous_Stars

	JSR GetLevelBit
	
	LDA Paper_Stars_Collected1, Y
	STA Previous_Stars_Collected1

	LDA Paper_Stars_Collected2, Y
	STA Previous_Stars_Collected2

	LDA Paper_Stars_Collected3, Y
	STA Previous_Stars_Collected3

	LDA Player_EffectiveSuit
	STA World_Map_Power

Checkpoint_Poof:
	JMP Object_PoofDie

;***********************************************************************************
; BLOCK BOUNCE
;***********************************************************************************
; IMMUNITIES:
;		ALL
;***********************************************************************************
;	When hitting an item block, this object is produce, which replace the current tile
;	with a background tile and moves up quickly and back down. Once it comes back down
;	an empty item block tile is replaced and an item is produced.
;***********************************************************************************
ObjInit_ItemBlock: 
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA Block_NeedsUpdate
	BEQ ItemBlock_Initialize

	RTS

ItemBlock_Initialize:
	LDA Block_NeedsUpdate
	BNE ObjInit_ItemBlock2

	JSR Object_NoInteractions
	JSR Object_CalcBoundBox
	JSR Object_DetectTileCenter

	LDA Tile_LastValue
	STA ItemBlock_OriginalTile, X
	AND #$C0
	
	JSR Object_ChangeBlock

	LDA #$06
	STA ItemBlock_UpTimer, X

	LDA #$05
	STA ItemBlock_DownTimer, X

	INC ItemBlock_Initialized, X

	LDA ItemBlock_PowerUp, X
	BEQ ObjInit_ItemBlock2

	CMP #POWERUP_MUSHROOM
	BCS ObjInit_ItemBlock2

	LDA <Objects_YZ, X
	ADD #$08
	STA <Coin_Y

	LDA <Objects_YHiZ, X
	ADC #$00
	STA <Coin_YHi

	LDA <Objects_XZ, X
	ADD #$04
	STA <Coin_X

	LDA <Objects_XHiZ, X
	ADC #$00
	STA <Coin_XHi

	JMP Produce_Coin

ObjInit_ItemBlock2:
	RTS

ItemBlock_UpTimer = Objects_Data1
ItemBlock_DownTimer = Objects_Data2
ItemBlock_Frame = Objects_Data4
ItemBlock_ReplaceTile = Objects_Data5
ItemBlock_Initialized = Objects_Data6
ItemBlock_Reverse = Objects_Data7
ItemBlock_PowerUp = Objects_Data8
ItemBlock_OriginalTile = Objects_Data3

ObjNorm_ItemBlock:
	LDA ItemBlock_Initialized, X
	BNE ItemBlock_IsInitialized

	JMP ItemBlock_Initialize

ItemBlock_IsInitialized:
	LDA <Player_HaltGameZ
	BEQ ItemBlock_Normal

	JMP ItemBlock_Draw

ItemBlock_Normal:
	LDA ItemBlock_UpTimer, X
	BEQ ItemBlock_TryDown
	JMP ItemBlock_Up

ItemBlock_TryDown:
	LDA ItemBlock_DownTimer, X
	BEQ ItemBlock_NoMove
	JMP ItemBlock_Down

ItemBlock_NoMove:
	LDA Block_NeedsUpdate
	BEQ Produce_Item
	RTS

Produce_Item:
	JSR Object_CalcBoundBox
	JSR Object_DetectTileCenter

	LDA Infinite_Item_Blocks
	BEQ No_Infinite_Items
	
	LDA ItemBlock_OriginalTile, X
	BNE Block_SwitchTile

No_Infinite_Items:
	LDA ItemBlock_ReplaceTile, X
	BNE Block_SwitchTile	


Replace_Block:
	LDA Tile_LastValue
	AND #$C0
	ORA #$3F

Block_SwitchTile:
	JSR Object_ChangeBlock

Block_MakteItemAppear:
	LDA ItemBlock_PowerUp, X
	BMI Produce_Key
	BNE Block_MakteItemAppear1

Block_MakteItemAppear1:
	CMP #POWERUP_MUSHROOM
	BCC ItemBlock_Delete
	JMP Do_PowerUp

Produce_Key:

	JSR Object_New
	JSR Object_NoInteractions
	
	LDA <Objects_YZ, X
	SUB #$08
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	SBC #$00
	STA <Objects_YHiZ, X

	LDA #$D0
	STA <Objects_YVelZ, X

	LDA #OBJ_KEY
	STA Objects_ID, X
	STA Objects_Global, X

	LDA #$00
	STA Objects_Property, X
	JMP ObjInit_Key

Do_PowerUp:

	LDA ItemBlock_PowerUp, X
	PHA

	JSR Object_New

	PLA
	STA PowerUp_Type, X
	STA ItemBlock_PowerUp, X

	LDA #OBJ_POWERUP
	STA Objects_ID, X

	INC PowerUp_Raise, X

	JMP ObjInit_PowerUp

ItemBlock_Delete:
	JMP Object_Delete

ItemBlock_Down:
	DEC ItemBlock_DownTimer, X
	
	LDA ItemBlock_Reverse, X
	BNE ItemBlock_MoveUp

ItemBlock_MoveDown:	
	LDA #$20
	STA <Objects_YVelZ, X
	JSR Object_ApplyYVel_NoGravity
	JMP ItemBlock_Draw

ItemBlock_Up:
	DEC ItemBlock_UpTimer, X

	LDA ItemBlock_Reverse, X
	BNE ItemBlock_MoveDown

ItemBlock_MoveUp:
	LDA #$E0
	STA <Objects_YVelZ, X
	JSR Object_ApplyYVel_NoGravity

ItemBlock_Draw:
	LDA ItemBlock_Frame, X
	STA Objects_Frame, X
	JMP Object_DrawMirrored	

;***********************************************************************************
; COIN LOCK
;***********************************************************************************
; IMMUNITIES:
;		ALL
;***********************************************************************************
; PROPERTIES:
;		0 - 10 coins required
;		1 - 25 coins required
;		2 - 50 coins required
;		3 - 50 coins required
;		4 - 50 coins required
;		5 - 50 coins required
;		6 - 50 coins required
;		7 - 99 coins required
;***********************************************************************************
;	Placed on a vertical stack of three blocks, when the player collects the required
;	number of coins, the lock disappears and replaces the 3 blocks. with a background tile. 
;	If the player moves where the lock is off screen, the display moves to the upper left hand corner.
;	
;***********************************************************************************

CoinLock_CoinsRemaining = Objects_Data4
CoinLock_BlocksRemaining = Objects_Data5

CoinLocks:
	.byte $0A, $19, $32, $63, $32, $32, $32, $63

Lock_NumOffset:
	.byte $00, $40	

ObjInit_CoinLock:
	STX <Temp_Var1
	LDY #$04

CoinLock_CheckExist:
	CPY	<Temp_Var1
	BEQ CoinLock_KeepCheck

	LDA Objects_ID, Y
	CMP #OBJ_COINLOCK
	BEQ CoinLock_Delete

CoinLock_KeepCheck:
	DEY
	BPL CoinLock_CheckExist
	BMI CoinLock_Init

CoinLock_Delete:
	LDA #OBJSTATE_DEADEMPTY
	STA Objects_State, Y

CoinLock_Init:
	LDA #$04
	STA Objects_SpritesRequested, X

	LDA <Objects_YZ, X
	ADD #$04
	STA <Objects_YZ, X
	
	LDA <Objects_YHiZ, X
	ADC #$00
	STA <Objects_YHiZ, X
	
	LDY Objects_Property, X
	LDA CoinLocks,  Y
	STA CoinLock_CoinsRemaining, X

	INC Objects_Global, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X
	JMP Object_NoInteractions 

Coin_Unlock:
	LDA Block_NeedsUpdate
	BNE Coin_UnlockRTS 

	JSR Object_CalcBoundBox
	JSR Object_DetectTileCenter
	
	LDA Tile_LastValue
	EOR #$01
	JSR Object_ChangeBlock
	
	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE Coin_Unlock0

	LDA <Objects_XZ, X
	STA <Poof_X

	LDA <Objects_YZ, X
	SUB #$04
	STA <Poof_Y

	JSR Common_MakePoof

Coin_Unlock0:
	LDA Sound_QLevel1
	ORA #SND_LEVELPOOF
	STA Sound_QLevel1

	LDA Objects_YZ, X
	ADD #$10
	STA Objects_YZ, X
	
	LDA Objects_YHiZ, X
	ADC #$00
	STA Objects_YHiZ, X

	INC CoinLock_BlocksRemaining, X
	LDA CoinLock_BlocksRemaining, X
	CMP #$03
	BNE Coin_UnlockRTS

	JMP Object_SetDeadEmpty

Coin_UnlockRTS:	
	RTS
	
ObjNorm_CoinLock:
	LDA CoinLock_CoinsRemaining, X
	BEQ Coin_Unlock

	LDY Objects_Property, X

	LDA CoinLock_CoinsRemaining, X
	SUB Coins_Earned
	ADD Coins_Lost
	CMP CoinLocks, Y
	BEQ ObjNorm_CoinLock0
	BCS ObjNorm_CoinLock1

ObjNorm_CoinLock0:
	STA CoinLock_CoinsRemaining, X

ObjNorm_CoinLock1:
	LDA #$00
	STA Coins_Lost
	STA Coins_Earned

	LDA LastPatTab_Sel
	AND #$01
	STA Objects_Frame, X

	LDA LastPatTab_Sel
	EOR #$01
	TAY

	LDA #$4D
	STA PatTable_BankSel + 4, Y

DrawCoinLock0:
	JSR Object_Draw
	LDA Objects_SpritesHorizontallyOffScreen,X 
	ORA Objects_SpritesVerticallyOffScreen,X
	BEQ DrawCoinLock1

	LDA #$10
	STA Sprite_RAM, Y
	STA Sprite_RAM+4, Y

	LDA #$10
	STA Sprite_RAM+3, Y
	
	LDA #$18
	STA Sprite_RAM+7, Y


DrawCoinLock1:

	LDA CoinLock_CoinsRemaining, X
	STA DigitsParam

	JSR BytesTo2Digits

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

	LDA LastPatTab_Sel
	EOR #$01
	TAX

	LDA <DigitsResult + 1
	ASL A
	ADD #$A1
	ADD Lock_NumOffset, X
	STA Sprite_RAM + 9, Y

	LDA <DigitsResult
	ASL A
	ADD #$A1
	ADD Lock_NumOffset, X
	STA Sprite_RAM + 13, Y
	RTS	


;***********************************************************************************
; Event Lock
;***********************************************************************************
; IMMUNITIES:
;		All

;***********************************************************************************
; 	This object will remove 3 vertical blocks once an event switch has been activated.
;***********************************************************************************	
ObjInit_ELock:
	LDA #$05
	STA Objects_SpritesRequested, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X
	JMP Object_NoInteractions

ObjNorm_ELock:
	LDA Objects_Property, Y
	JSR DynJump

	.word ELock_Lock

ELock_Lock:
	LDA EventSwitch
	BEQ ELock_LockDraw

	LDA <Player_HaltGameZ
	BNE ELock_LockDraw

	LDA CoinLock_BlocksRemaining, X
	CMP #$02
	BNE ELock_NoResetLock

	LDA #$00
	STA EventSwitch
	
ELock_NoResetLock:
	JMP Coin_Unlock

ELock_LockDraw:
	LDA LastPatTab_Sel
	EOR #$01
	TAY

	LDA #$4D
	STA PatTable_BankSel + 4, Y

	TYA
	STA Objects_Frame, X

	JMP Object_Draw

ELock_NoUnlock:
	RTS
	

;***********************************************************************************
; BUBBLE
;***********************************************************************************
; IMMUNITIES:
;		ALL
;***********************************************************************************
; 	0 - The Bubble shares graphics with an existing enemy bank.
;	1 - The Bubble ensures the proper graphics are loaded for the bubble.
;	2 - The Bubble ensures the proper graphics are loaded and the bubble regenerates.
;***********************************************************************************
; 	The buble rises up until it hits a solid object. Mario touching it cuases it to pop,
;	giving Mario a full air meter. 
;***********************************************************************************
ObjInit_Bubble:
	JSR Object_NoInteractions

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA <Objects_XZ, X
	STA Bubble_RegenX, X

	LDA <Objects_XHiZ, X
	STA Bubble_RegenXHi, X

	LDA <Objects_YZ, X
	SUB #$02
	STA <Objects_YZ, X
	STA Bubble_RegenY, X

	LDA <Objects_YHiZ, X
	SBC #$00
	STA <Objects_YHiZ, X
	STA Bubble_RegenYHi, X

	JSR Object_CalcBoundBox
	JSR Object_DetectTiles

	RTS		 ; Return

Bubble_Action = Objects_Data2
Bubble_GeneratorTimer = Objects_Data3
Bubble_PopTimer = Objects_Data4
Bubble_RegenX = Objects_Data5
Bubble_RegenXHi = Objects_Data6
Bubble_RegenY = Objects_Data7
Bubble_RegenYHi = Objects_Data8

ObjNorm_Bubble:
	LDA Objects_Property, X
	CMP #$02
	BCC Bubble_DynamicPatTable

	LDA #$23
	STA PatTable_BankSel + 5

	LDA #$01
	STA LastPatTab_Sel
	BNE Bubble_StaticPatTable

Bubble_DynamicPatTable:
	LDA LastPatTab_Sel
	EOR #$01
	TAY

	LDA #$23
	STA PatTable_BankSel + 4, Y

Bubble_StaticPatTable:	
	INC ObjSplash_Disabled, X
	
	LDA Bubble_Action, X
	JSR DynJump

	.word Bubble_Float
	.word Bubble_Pop
	.word Bubble_Wait
	.word Bubble_Regenerate

Bubble_Float:
	LDA <Player_HaltGameZ
	BEQ Bubble_FloatNormal
	JMP Draw_Bubble

Bubble_FloatNormal:
	JSR Object_DeleteOffScreen

	INC Reverse_Gravity

	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	JSR Object_InteractWithPlayer

	LDA Objects_InWater, X
	BNE Draw_Bubble

	INC Bubble_Action, X

Draw_Bubble:
	LDA Objects_Property, X
	CMP #$02
	BCC Draw_DynamicBubble

	LDY #$01
	BNE Draw_StaticBubble

Draw_DynamicBubble:	
	LDA LastPatTab_Sel
	EOR #$01
	TAY

Draw_StaticBubble:
	LDA Bubble_FrameOffset, Y
	STA Objects_Frame, X

Draw_BubbleGfx:
	JSR Object_DrawMirrored

	LDY Object_SpriteRAMOffset,X

	LDA Sprite_RAMAttr + 4, Y
	ORA #SPR_VFLIP
	STA Sprite_RAMAttr + 4, Y
	RTS		 ; Return

Bubble_Hit:
	LDA #$40
	STA Air_Time
	INC Bubble_Action, X
	RTS

Bubble_Pop:
	LDA Objects_Property, X
	CMP #$02
	BCC Bubble_PopDynamic

	LDY #$01
	BNE Bubble_PopStatic

Bubble_PopDynamic:	
	LDA LastPatTab_Sel
	EOR #$01
	TAY

Bubble_PopStatic:
	INC Bubble_PopTimer, X
	LDA Bubble_PopTimer, X
	CMP #$0C
	BNE Bubble_PopDraw

	LDA Objects_Property, X
	AND #$01
	CMP #$01
	BNE Bubble_PopDelete
	
	INC Bubble_Action, X
	
	LDA #$80
	STA Objects_Timer, X

	LDA #$00
	STA Bubble_PopTimer, X
	RTS

Bubble_PopDelete:
	JMP Object_SetDeadAndNotSpawned

Bubble_FrameOffset:
	.byte $00, $06

Bubble_PopDraw:
	LSR A
	LSR A
	AND #$03
	ADD Bubble_FrameOffset, Y
	STA Objects_Frame, X

	JMP Draw_BubbleGfx

Bubble_Wait:
	LDA Objects_Timer, X
	BNE Bubble_WaitRTS

	INC Bubble_Action, X

	LDA Bubble_RegenX, X
	STA <Objects_XZ, X

	LDA Bubble_RegenXHi, X
	STA <Objects_XHiZ, X

	LDA Bubble_RegenY, X
	STA <Objects_YZ, X

	LDA Bubble_RegenYHi, X
	STA <Objects_YHiZ, X

Bubble_WaitRTS:
	RTS

Bubble_Regenerate:
	LDA Objects_Property, X
	CMP #$02
	BCC Bubble_RegenerateDynamic

	LDY #$01
	BNE Bubble_RegenerateStatic

Bubble_RegenerateDynamic:	
	LDA LastPatTab_Sel
	EOR #$01
	TAY

Bubble_RegenerateStatic:
	INC Bubble_GeneratorTimer, X
	LDA Bubble_GeneratorTimer, X
	CMP #$18
	BNE Bubble_RegenerateDraw

	LDA #$00
	STA Bubble_Action, X
	STA Bubble_GeneratorTimer, X

	LDA LastPatTab_Sel
	AND #$01
	TAY

	LDA Bubble_FrameOffset, Y
	STA Objects_Frame, X
	
	JMP Draw_Bubble

Bubble_RegenerateDraw:
	LSR A
	LSR A
	LSR A
	AND #$03
	ADD #$03

	ADD Bubble_FrameOffset, Y
	STA Objects_Frame, X
	JMP Object_DrawMirrored	


;***********************************************************************************
; Key
;***********************************************************************************
; IMMUNITIES:
;		All
;***********************************************************************************
; PROPERTIES
;	0 - Opens any door/key block
;	1 - Only opens key blocks of the 1st palette
;	2 - Only opens key blocks of the 2nd palette
;	3 - Only opens key blocks of the 3rd palette
;***********************************************************************************
;	A key item that can be carried and toggles a tile that has the "LOCK" property on it.
;   If the key is generated and goes off screen, it will reappear at its spawn point.
;***********************************************************************************


Key_Pals:
	.byte SPR_PAL3, SPR_PAL1, SPR_PAL2, SPR_PAL3, SPR_PAL3

ObjInit_Key:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #ATTR_ALLWEAPONPROOF
	STA Objects_WeaponAttr, X

	LDA #(ATTR_SHELLPROOF | ATTR_EXPLOSIONPROOF | ATTR_BUMPNOKILL | ATTR_WINDAFFECTS)
	STA Objects_BehaviorAttr, X

	LDA <Objects_XZ, X
	STA Key_ReappearX, X

	LDA <Objects_XHiZ, X
	STA Key_ReappearXHi, X

	LDA <Objects_YZ, X
	STA Key_ReappearY, X

	LDA <Objects_YHiZ, X
	STA Key_ReappearYHi, X

	LDA #$FF
	STA Key_AdjacentChecks, X
	STA Objects_Global, X

	LDY Objects_Property, X
	CPY #$04
	BNE Set_KeyColor

	LDA #$00
	STA Objects_Global, X
	STA Objects_Property, X

Set_KeyColor:	
	LDY Objects_Property, X
	BEQ Init_KeyRTS

	LDA Key_Pals, Y
	STA Objects_SpriteAttributes, X

	TYA
	STA Key_UnlockColor, X

Init_KeyRTS:
	RTS

Key_Reappear = Objects_Data1
Key_ReappearX = Objects_Data3
Key_ReappearXHi = Objects_Data4
Key_ReappearY = Objects_Data5
Key_ReappearYHi = Objects_Data6
Key_AdjacentChecks = Objects_Data7
Key_UnlockColor = Objects_Data8

ObjNorm_Key:
	LDA <Player_HaltGameZ
	BEQ Key_Norm

	LDA Key_AdjacentChecks, X
	BPL Key_NormRTS
	
	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer
	JMP Object_Draw

Key_NormRTS:
	RTS

Key_Norm:
	JSR Object_DeleteInPit
	BCC Key_Move

	LDA Key_Reappear, X
	BEQ Key_Move

	LDA Key_ReappearX, X
	STA <Objects_XZ, X

	LDA Key_ReappearXHi, X
	STA <Objects_XHiZ, X

	LDA Key_ReappearY, X
	STA <Objects_YZ, X

	LDA Key_ReappearYHi, X
	STA <Objects_YHiZ, X

	LDA #$00
	STA <Objects_XVelZ, X
	STA <Objects_YVelZ, X
	STA Objects_InWater, X
	
	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	LDY Objects_SpawnIdx,X	 ; Get the spawn index of this object
	
	LDA Level_ObjectsSpawned,Y
	ORA #$80
	STA Level_ObjectsSpawned,Y

	LDA #OBJ_KEY
	STA Objects_ID, X
	STA Objects_Global

	RTS

Key_Move:
	LDA Key_AdjacentChecks, X
	BPL Key_CheckUnlockSection

	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer
	
	LDA Objects_BeingHeld, X
	BNE Key_NoDetecttiles

Key_NoDetecttiles:
	JSR Object_DetectTiles
	JSR Key_DoUnlocks
	BCS ObjNorm_KeyHeldRTS

	LDA Objects_BeingHeld, X
	BNE ObjNorm_KeyHeld
	
	JSR Object_DampenVelocity
	JSR Object_InteractWithTilesWallStops
	JMP Object_Draw

ObjNorm_KeyHeld:
	JSR Object_CheckForeground

ObjNorm_KeyHeldRTS:	
	JMP Object_Draw

Key_CheckUnlockSection:
	JMP Key_DoUnlocks

Key_UnlockCheckX:
	.byte $F8, $08, $18, $08
	.byte $FF, $00, $00, $00

Key_UnlockCheckY:
	.byte $08, $18, $08, $F8
	.byte $00, $00, $00, $FF

Key_Unlock_Pal:
	.byte $00, $00, $80, $40, $00


Key_DoUnlocks:
	LDA Objects_Timer, X
	BNE Key_DoUnlocksRTS

	LDA Key_AdjacentChecks, X
	BMI Key_UnlockBlocks

Key_CheckAdjacents:
	LDY Key_AdjacentChecks, X

	LDA <Objects_XZ, X
	ADD Key_UnlockCheckX, Y
	STA Block_DetectX

	LDA <Objects_XHiZ, X
	ADC Key_UnlockCheckX + 4, Y
	STA Block_DetectXHi

	LDA <Objects_YZ, X
	ADD Key_UnlockCheckY, Y
	STA Block_DetectY

	LDA <Objects_YHiZ, X
	ADC Key_UnlockCheckY + 4, Y
	STA Block_DetectYHi

	JSR Object_DetectTile
	
	LDA Tile_LastProp
	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_SOLID_OBJECTINTERACT)
	BNE Key_NextBlock

	JSR Key_UnlockBlock
	BCC Key_DoUnlocksRTS

	LDY Key_AdjacentChecks, X
	RTS

Key_NextBlock:
	DEC Key_AdjacentChecks, X
	BPL Key_CheckAdjacents

	JMP Object_Delete

Key_UnlockBlocks:
	JSR Key_CheckUnlock

Key_DoUnlocksRTS:
	RTS

Key_CheckUnlock:
	LDA Block_NeedsUpdate
	BNE Key_NoUnlocks

	JSR Object_DetectTileCenter

	LDA Tile_LastProp
	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_LOCKBLOCK)
	BNE Key_CheckDoorLock

	LDY Key_UnlockColor, X
	BEQ Key_UnlockBlock

	LDA Tile_LastValue
	AND #$C0
	CMP Key_Unlock_Pal, Y
	BEQ Key_UnlockBlock

Key_CheckDoorLock:
	CMP #TILE_PROP_LOCK
	BEQ Key_UnlockBlockDelete

Key_NoUnlocks:
	CLC
	RTS

Key_UnlockBlockDelete:
	JSR Object_Delete

Key_UnlockBlock:
	LDA #$00
	STA Objects_BeingHeld, X

	LDA Sound_QLevel2
	ORA #SND_LEVELMARCH
	STA Sound_QLevel2

	LDA Block_NeedsUpdate
	BNE RemainLocked

	LDA Tile_LastValue
	EOR #$01
	JSR Object_ChangeBlock
	
	LDA Block_DetectX
	AND #$F0
	STA <Poof_X
	STA <Objects_XZ, X

	LDA Block_DetectXHi
	STA <Objects_XHiZ, X

	LDA Block_DetectY
	AND #$F0
	STA <Poof_Y
	STA <Objects_YZ, X

	LDA Block_DetectYHi
	STA <Poof_YHi
	STA <Objects_YHiZ, X

	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE Key_UnlockNoPoof

	JSR Common_MakePoof

Key_UnlockNoPoof:
	LDA #$03
	STA Key_AdjacentChecks, X

	LDA #$08
	STA Objects_Timer, X

	SEC
	RTS
	
RemainLocked:
	LDA #$03
	STA Key_AdjacentChecks, X
	CLC
	RTS

Key_FindNewBlock:
	RTS	


;***********************************************************************************
; Spring
;***********************************************************************************
; IMMUNITIES:
;		All
;***********************************************************************************
; PROPERTIES
;	0 - Red spring - small boost
;	1 - Green spring - large boost
;	2 - Gold spring - extra large boost
;***********************************************************************************
;	An object that can be carried. Once Mario lands on it, the spring will send him
;	up in the air.
;***********************************************************************************

SpringPals: .byte SPR_PAL1, SPR_PAL2, SPR_PAL3

ObjInit_Spring:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_INVINCIBLE)
	STA Objects_WeaponAttr, X

	LDA #(ATTR_BUMPNOKILL  | ATTR_WINDAFFECTS | ATTR_EXPLOSIONPROOF | ATTR_SHELLPROOF)
	STA Objects_BehaviorAttr, X

	LDY Objects_Property, X
	
	LDA SpringPals, Y
	STA Objects_SpriteAttributes,X

	LDA #ATTR_ALLWEAPONPROOF
	STA Objects_WeaponAttr, X

	JSR Object_CalcBoundBox
	JSR Object_DetectTileCenter
	CMP #TILE_PROP_SOLID_ALL
	BCC Spring_InitRTS
	
	CMP #TILE_PROP_ITEM
	BCS Spring_PlaceInBlock

	LDA <Objects_YZ, X
	SUB #$10
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	SBC #$00
	STA <Objects_YHiZ, X
	RTS

Spring_PlaceInBlock:
	STA Spring_InItemBlock, X

Spring_InitRTS:
	RTS

Spring_Jump_Height:
	.byte $C0, $B4, $A8

Spring_Player_YOffsets:
	.byte $20, $1C, $17, $1C


Spring_CurrentX = Objects_Data1
Spring_CurrentXHi = Objects_Data2
Spring_CurrentY = Objects_Data3
Spring_CurrentYHi = Objects_Data4
Spring_CurrentFrame = Objects_Data5
Spring_LastInteract = Objects_Data6
Spring_InItemBlock = Objects_Data7

ObjNorm_Spring:
	LDA Spring_InItemBlock, X
	BEQ Spring_Norm

	JSR Object_DeleteOffScreen
	JSR Object_CalcBoundBox
	JSR Object_DetectTileCenter
	CMP #TILE_PROP_ITEM
	BCS Spring_InitRTS

	LDA #$00
	STA Spring_InItemBlock, X

	LDA #$D0
	STA <Objects_YVelZ, X

	JSR Object_ApplyYVel
	JMP Object_DrawMirrored

Spring_Norm:
	LDA <Player_HaltGameZ
	BEQ Spring_NormStuff
	
	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer

	JMP Object_DrawMirrored

Spring_NormStuff:
	LDA #$20
	JSR Object_DeleteOffScreenRange
	JSR Object_Move
	JSR Object_CalcBoundBox
	
	LDA Spring_CurrentFrame, X
	BNE SpringAnim

	JSR Spring_PositionBackup
	JSR Object_InteractWithPlayer
	STA Spring_LastInteract, X
	
	PHP
	
	JSR Object_DetectTiles
	JSR Object_CheckForeground

	PLP

	BCC Spring_2

	LDA Spring_LastInteract, X
	AND #(HITTEST_BOTTOM)
	BEQ Spring_2

	LDA <Player_YVelZ
	BEQ Spring_2
	BMI Spring_2

	JSR Spring_PositionRestore

	LDA #$00
	STA Objects_BeingHeld, X
	STA <Objects_YVelZ, X
	STA <Objects_XVelZ, X
	STA Player_GroundPound
	STA Player_Flip

	LDA <Player_FlipBits
	AND #~SPR_VFLIP
	STA <Player_FlipBits

	LDA #$02
	STA Objects_Timer, X

	LDA #$10
	STA Objects_Timer2, X
	
	LDA #$03
	STA Spring_CurrentFrame, X

Spring_2:
	LDA Objects_BeingHeld, X
	BNE Spring_RTS

	JSR Object_DampenVelocity
	JSR Object_InteractWithTilesWallStops

Spring_RTS:
	JMP Object_DrawMirrored

SpringAnim:
	LDY Spring_CurrentFrame, X

	LDA Objects_YZ, X
	SUB Spring_Player_YOffsets, Y
	STA <Player_YZ
	
	LDA <Objects_YHiZ, X
	SBC #$00
	STA <Player_YHiZ
	
	LDA #$00
	STA <Player_YVelZ


	LDA <Player_FlipBits
	AND #~SPR_VFLIP
	STA <Player_FlipBits

	LDA Objects_Timer, X
	BNE SpringAnimRTS
	
	LDA #$02
	STA Objects_Timer, X
	DEC Spring_CurrentFrame, X
	BNE SpringAnimRTS

	; once the spring's animation is done, throw the player in the air
	LDY Objects_Property, X

	LDA Spring_Jump_Height, Y
	STA <Player_YVelZ
	STA <Player_InAir


	LDA Player_HitCeiling
	BNE SpringAnimRTS

	LDA #$E0
	STA <Objects_YVelZ, X

SpringAnimRTS:
	LDA Spring_CurrentFrame, X
	STA Objects_Frame, X
	JMP Object_DrawMirrored

Spring_PositionBackup:
	LDA <Objects_XZ, X
	STA Spring_CurrentX, X

	LDA <Objects_XHiZ, X
	STA Spring_CurrentXHi, X

	LDA <Objects_YZ, X
	STA Spring_CurrentY, X

	LDA <Objects_YHiZ, X
	STA Spring_CurrentYHi, X
	RTS

Spring_PositionRestore:
	LDA Spring_CurrentX, X
	STA <Objects_XZ, X

	LDA Spring_CurrentXHi, X
	STA <Objects_XHiZ, X

	LDA Spring_CurrentY, X
	STA <Objects_YZ, X

	LDA Spring_CurrentYHi, X
	STA <Objects_YHiZ, X
	RTS

WorldTravel_Timer = Objects_Data1

ObjInit_WorldTravel:
	JSR GetLevelBit
	ORA Levels_Complete, Y
	STA Levels_Complete, Y

	LDA #$08
	STA Objects_SpritesRequested, X
	JMP Object_NoInteractions

World_Numbers:
	.byte $A1, $A3, $A5, $A7, $A9, $AB, $AD, $AF, $B1

Warp_ZoneXOffsets:
	.byte $FF, $1C, $5C, $9C, $DC, $1C, $5C, $9C, $DC

Warp_ZoneYOffsets:
	.byte $F0, $74, $74, $74, $74, $44, $44, $44, $44

ObjNorm_WorldTravel:
	LDA #$4D
	STA PatTable_BankSel + 4

	LDY Object_SpriteRAMOffset, X
	
	LDX #$08

WarpZone_DrawNumbers:
	LDA World_Numbers, X
	STA Sprite_RAMTile, Y

	LDA #SPR_PAL1
	STA Sprite_RAMAttr, Y

	LDA Warp_ZoneXOffsets, X
	STA Sprite_RAMX, Y

	LDA Warp_ZoneYOffsets, X
	STA Sprite_RAMY, Y

	INY
	INY
	INY
	INY

	DEX
	BNE WarpZone_DrawNumbers

	RTS
;***********************************************************************************
; Auto Level Revert
;***********************************************************************************
; IMMUNITIES:
;		All
;***********************************************************************************
; 	This object returns Mario to the previous level after the timer hits 0.
;***********************************************************************************	
ObjInit_SendBack:
	LDA #$E0
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

	CMP #$08
	BCS SetPlayer_X

	LDA #$08

SetPlayer_X:	
	STA <Player_X

	LDA PreviousLevel
	STA LevelLoadPointer

ObjNorm_SendBackRTS:
	RTS	



Paper_StarEnemyAttached = Objects_Data1
Paper_StarSparkle = Objects_Data2
Paper_StarSparkleDirection = Objects_Data3
Paper_StarIndicator = Objects_Data4
Paper_StarRadar = Objects_Data5
Paper_StarCoinsNeeded = Objects_Data7
Paper_StarInvincibility = Objects_Data8

ObjInit_MagicStar1:
	LDA #$00
	STA Paper_StarIndicator, X
	JMP ObjInit_MagicStar

ObjInit_MagicStar2:
	LDA #$01
	STA Paper_StarIndicator, X
	JMP ObjInit_MagicStar

ObjInit_MagicStar3:
	LDA #$02
	STA Paper_StarIndicator, X

ObjInit_MagicStar:
	LDA Objects_Property, X
	CMP #$07
	BNE MagicStar_NoOffset

	LDA <Objects_XZ, X
	ADD #$08
	STA <Objects_XZ, X

MagicStar_NoOffset:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	JSR Object_NoInteractions
	JSR GetLevelBit

	STA <Temp_Var1
	STY <Temp_Var2
	
	LDA Paper_StarIndicator, X
	TAY

	LDA <Temp_Var2
	ADD MagicStarOffset, Y
	TAY

	LDA <Temp_Var1
	AND Paper_Stars_Collected1, Y
	BEQ Dont_Kill_Star

Kill_Star:
	JSR Object_Delete

Dont_Kill_Star:
	LDA #$07
	STA Paper_StarCoinsNeeded, X

	LDA Objects_Property, X
	CMP #$06
	BNE MagicStar_InitRTS

	LDY #$04

MagicStar_FindEnemy:	
	CPY <CurrentObjectIndexZ
	BEQ MagicStar_NoEnemy

	LDA Objects_XZ, Y
	AND #$F0
	CMP <Objects_XZ, X
	BNE MagicStar_NoEnemy

	LDA Objects_XHiZ, Y
	CMP <Objects_XHiZ, X
	BEQ Paper_StarEnemyFound

MagicStar_NoEnemy:
	DEY
	BPL MagicStar_FindEnemy

	JMP Object_Delete

Paper_StarEnemyFound:
	TYA
	STA Paper_StarEnemyAttached, X

MagicStar_InitRTS:
	RTS		 ; Return	

MagicStarOffset:
	.byte $00, $10, $20

ObjNorm_MagicStar:
	LDA #$00
	STA <Objects_XVelZ, X

	LDA Objects_Property, X
	CMP #$06
	BNE MagicStar_NormDelete

	LDY Paper_StarEnemyAttached, X
	LDA Objects_State, Y
	BNE MagicStar_NoDelete

MagicStar_NormDelete:
	JSR Object_DeleteOffScreen
	BCC MagicStar_NoDelete

	JSR MagicStar_ClearRadar
	RTS

MagicStar_NoDelete:
	JSR MagicStar_Radar
	JSR Object_CalcBoundBox
	JSR Paper_Star_Action
	JSR MagicStar_Sparkle
	JSR Object_InteractWithPlayer

	JSR Object_DetectTiles
	JSR Object_CheckForeground

	JMP Object_DrawMirrored

Paper_StarCollect:
	LDA Paper_StarInvincibility, X
	BEQ Paper_StarNormalCollect

	LDA #189
	STA Player_Invincible
	STA Paper_Stars

	LDA #$00
	STA Poison_Mode

	LDA #SND_LEVELPOWER
	STA Sound_QLevel1
	JMP Object_SetDeadEmpty

Paper_StarNormalCollect:
	LDA Sound_QLevel1
	ORA #SND_MAPBONUSAPPEAR
	STA Sound_QMap
	INC Paper_Stars

	JSR GetLevelBit

	STA <Temp_Var1
	STY <Temp_Var2

	LDA Paper_StarIndicator, X
	TAY

	LDA <Temp_Var2
	ADD MagicStarOffset, Y
	TAY

	LDA <Temp_Var1
	ORA Paper_Stars_Collected1, Y
	STA Paper_Stars_Collected1, Y

	JSR MagicStar_ClearRadar
	JMP Object_SetDeadEmpty

Paper_Star_Action:

	LDA Objects_Property, X
	JSR DynJump

	.word ObjNorm_DoNothing
	.word MagicStar_NoFloat
	.word MagicStar_CheckObjects
	.word MagicStar_CheckPSwitch
	.word MagicStar_CheckClearedBlock
	.word MagicStar_CheckCoins
	.word MagicStar_AttachedEnemyDefeated
	.word MagicStar_Indicator

MagicStar_Indicator:
	LDA #$02
	STA Objects_Timer2, X
	PLA
	PLA
	RTS
	
MagicStar_CheckObjects:
	LDY #$04

CheckEnemies:
	CPY <CurrentObjectIndexZ
	BEQ NoCheck

	LDA Objects_State, Y
	BNE Check_Done

NoCheck:
	DEY
	BPL CheckEnemies

Paper_StarPoofAppear:
	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE Paper_StarNoPoof

	LDA <Objects_XZ, X
	STA <Poof_X

	LDA <Objects_YZ, X
	STA <Poof_Y
	
	JSR Common_MakePoof

Paper_StarNoPoof:
	LDA #SND_LEVELPOOF
	STA Sound_QLevel1

	LDA #$01
	STA Objects_Property, X
	JMP MagicStar_NoFloat

Check_Done:
	PLA
	PLA
	RTS

MagicStar_CheckPSwitch:
	LDA Level_PSwitchCnt
	BNE MagicStar_CheckPSwitch1
	PLA
	PLA
	RTS

MagicStar_CheckPSwitch1:
	JMP Object_InteractWithTiles

MagicStar_NoFloat:
	LDA <Player_HaltGameZ
	BNE MagicStar_NoMove

	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles

MagicStar_NoMove:
	JMP Object_InteractWithTiles

MagicStar_CheckClearedBlock:
	JSR Object_DetectTileCenter
	CMP #TILE_PROP_ITEM
	BCS Paper_StarHidden

	CMP #TILE_PROP_STONE | TILE_PROP_SOLID_ALL
	BEQ Paper_StarHidden

	CMP #TILE_PROP_SOLID_OBJECTINTERACT | TILE_PROP_SOLID_ALL
	BEQ Paper_StarHidden

	AND #$F0
	CMP #TILE_PROP_SOLID_BOTTOM
	BEQ Paper_StarHidden

	LDA #$01
	STA Objects_Property, X

	LDA <Objects_YZ, X
	SUB #$08
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	SBC #$00
	STA <Objects_YHiZ, X

	LDA #$E0
	STA <Objects_YVelZ, X
	RTS

Paper_StarHidden:
	PLA
	PLA
	RTS	

MagicStar_CheckCoins:
	LDA Paper_StarCoinsNeeded, X
	SUB Coins_Earned
	STA Paper_StarCoinsNeeded, X

	LDA #$00
	STA Coins_Earned

	LDA Paper_StarCoinsNeeded, X
	BPL MagicStar_CheckCoinsRTS

	JMP Paper_StarPoofAppear

MagicStar_CheckCoinsRTS:
	PLA
	PLA
	RTS	

MagicStar_AttachedEnemyDefeated:
	JSR MagicStar_Sparkle

	LDA Paper_StarEnemyAttached, X
	BMI MagicStar_EnemyDefeatedRTS

	TAY
	LDA Objects_XZ, Y
	STA <Objects_XZ, X
	STA Poof_X

	LDA Objects_XHiZ, Y
	STA <Objects_XHiZ, X

	LDA Objects_YZ, Y
	STA <Objects_YZ, X
	STA Poof_Y

	LDA Objects_YHiZ, Y
	STA <Objects_YHiZ, X
	STA Poof_YHi

	LDA Objects_State, Y
	CMP #OBJSTATE_DEADEMPTY
	BNE MagicStar_EnemyDefeatedRTS

MagicStar_EnemyDead:
	LDA #$01
	STA Objects_Property, X

	LDA #$E0
	STA <Objects_YVelZ, X
	RTS

Sparkle_OffSetX:
	.byte $FC, $0C, $FC, $04, $0C, $FC, $0C, $04

Sparkle_OffSetY:
	.byte $F8, $00, $08, $F8, $08, $00, $F8, $08

MagicStar_EnemyDefeatedRTS:
	PLA
	PLA
	RTS

MagicStar_Sparkle:
	LDA <Player_HaltGameZ
	BEQ MagicStar_DoSparkle
	RTS

MagicStar_DoSparkle:
	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE MagicStar_SparkleRTS

	LDA Paper_StarSparkle, X
	BNE MagicStar_SparkleDec

	LDA <Objects_XZ, X
	STA <Poof_X
	STA <Poof_YHi

	LDA <Objects_YZ, X
	STA <Poof_Y

	JSR Common_MakePoof
	BCC MagicStar_SparkleRTS

	LDA #$10
	STA SpecialObj_Timer, Y
	
	LDA #SOBJ_COINSPARKLE
	STA SpecialObj_ID, Y

	LDA Paper_StarSparkleDirection, X
	INC Paper_StarSparkleDirection, X
	AND #$07
	TAX

	LDA SpecialObj_X, Y
	ADD Sparkle_OffSetX, X
	STA SpecialObj_X, Y

	LDA SpecialObj_Y, Y
	ADD Sparkle_OffSetY, X
	STA SpecialObj_Y, Y

	LDA #SPR_PAL2
	STA SpecialObj_Data3, Y

	LDX <CurrentObjectIndexZ

	LDA #$08
	STA Paper_StarSparkle, X

MagicStar_SparkleDec:
	DEC Paper_StarSparkle, X

MagicStar_SparkleRTS:
	RTS

MagicStar_Radar:
	LDA Player_Badge
	CMP #BADGE_RADAR
	BCC MagicStar_RadarRTS

	LDA #$00
	STA Paper_StarRadar, X
	JSR Object_XDistanceFromPlayer

	CMP #$08
	BCC MagicStar_Radar1

	LDA EWBitMap, Y
	STA Paper_StarRadar, X
	
MagicStar_Radar1:
	JSR Object_YDistanceFromPlayer
	CMP #$08
	BCC MagicStar_Radar2

	LDA NSBitMap, Y
	ORA Paper_StarRadar, X
	STA Paper_StarRadar, X

MagicStar_Radar2:
	LDY Paper_StarRadar, X
	LDA RadarMap, Y
	STA Player_Badge
	RTS

MagicStar_RadarRTS:
	RTS

EWBitMap:
	.byte $02, $01

NSBitMap:
	.byte $04, $08

RadarMap:
	.byte BADGE_RADARN, BADGE_RADARE,  BADGE_RADARW,  BADGE_RADARUNKNOWN
	.byte BADGE_RADARN, BADGE_RADARNE, BADGE_RADARNW, BADGE_RADARUNKNOWN
	.byte BADGE_RADARS, BADGE_RADARSE, BADGE_RADARSW	

Training_Messages:
	MSG_ID Training_1
	MSG_ID Training_2
	MSG_ID Training_3
	MSG_ID Training_4
	MSG_ID Training_5
	MSG_ID Training_6

Training_BackUpItem = Objects_Data5
Training_BackUpBadge = Objects_Data6
Training_BackUpPowerUp = Objects_Data7

ObjInit_Training:
	LDY Objects_Property, X

	LDA Training_Messages, Y
	STA Message_Id

	LDA PowerUp_Reserve
	STA Training_BackUpItem, X

	LDA Player_Badge
	STA Training_BackUpBadge, X

	LDA Player_EffectiveSuit
	STA World_Map_Power
	STA Training_BackUpPowerUp, X

	LDA #$00
	STA Player_Badge
	STA PowerUp_Reserve

	LDA #$01
	STA Player_QueueSuit

	JSR Player_ForceInvulnerable
	JSR Object_NoInteractions
	RTS

Training_Restore:
	LDA Training_BackUpItem, X
	STA PowerUp_Reserve

	LDA Training_BackUpBadge, X
	STA Player_Badge

	LDA PowerUp_Reserve
	

	LDA Training_BackUpPowerUp, X
	ADD #$01
	STA Player_QueueSuit
	
	JSR Player_PoofHurt
	RTS

ObjNorm_Training:
	JSR Training_WatchForDeath

	LDA Objects_Property, X

	JSR DynJump

	.word Training_TakeHits
	.word Training_BreakBricks
	.word Training_DamageBoost
	.word Training_Attack
	.word Training_Jumps
	.word Training_Cherries

Training_Make1Up:
	JSR DestroyAllEnemies

	LDA #OBJ_LEVELUPMUSHROOM
	STA Objects_ID, X

	LDA #OBJSTATE_INIT
	STA Objects_State, X

	LDA <Player_X
	STA <Objects_XZ, X
	STA <Poof_X

	LDA <Player_XHi
	STA <Objects_XHiZ, X

	LDA <Player_YZ
	SUB #$40
	STA <Objects_YZ, X
	STA <Poof_Y

	LDA <Player_YHiZ
	SBC #$00
	STA <Objects_YHiZ, X

	JSR Common_MakePoof

	JMP Training_Restore

Training_WatchForDeath:
	LDA Player_IsDying
	BEQ Training_WatchForDeathRTS

	LDA <Player_SpriteY
	CMP #$B0
	BCC Training_WatchForDeathRTS
	
	LDA Training_BackUpPowerUp, X
	STA Player_EffectiveSuit

Training_WatchForDeathRTS:
	RTS	

Training_MarioHit = Objects_Data1
Training_MarioHitCount = Objects_Data2

Training_NumXOffset:
	.byte $E8, $E0

Training_TakeHits:
	JSR Training_TakeHitsDraw
	LDA Training_MarioHit, X
	BNE Training_WaitMarioVulenerable

	LDA Player_Invulnerable
	BEQ Training_TakeHitsRTS

	INC Training_MarioHitCount, X
	INC Training_MarioHit, X

	LDA Training_MarioHitCount, X
	CMP #$0B
	BNE Training_TakeHitsRTS
	JMP Training_Make1Up

Training_WaitMarioVulenerable:
	LDA Player_Invulnerable
	CMP #$02
	BCS Training_TakeHitsRTS

	LDA #$00
	STA Training_MarioHit, X

Training_TakeHitsRTS:
	RTS

Training_TakeHitsDraw:
	LDA Training_MarioHitCount, X
	SUB #$01
	
Training_DrawNumber:
	STA <DigitsParam

	LDA #$00
	STA <DigitsParam + 1

	JSR BytesTo3Digits

	LDX <CurrentObjectIndexZ
	LDY Object_SpriteRAMOffset, X

	LDX #$01

DrawHits_Counter:
	LDA #$18
	STA Sprite_RAMY, Y

	LDA #SPR_PAL2
	STA Sprite_RAMAttr, Y

	LDA Training_NumXOffset, X
	STA Sprite_RAMX, Y

	LDA <DigitsResult, X
	ASL A
	ADD #$A1
	STA Sprite_RAMTile, Y

	INY
	INY
	INY
	INY

	DEX
	BPL DrawHits_Counter

	LDX <CurrentObjectIndexZ

	LDA #$4D
	STA PatTable_BankSel + 4
	RTS

Training_BricksBroken = Objects_Data1

Training_BreakBricks:
	LDA Training_BricksBroken, X
	
	JSR Training_DrawNumber

	LDA Block_NeedsUpdate
	BEQ Training_BreakBricksRTS

	INC Training_BricksBroken, X

	LDA Training_BricksBroken, X
	CMP #50
	BNE Training_BreakBricksRTS

	JSR Training_Make1Up

Training_BreakBricksRTS:
	RTS

Training_DamageBoost:
	LDA <Player_XHi
	CMP #$0C
	BCC Training_DamageBoostRTS

	JSR Training_Make1Up

Training_DamageBoostRTS:	
	RTS


Training_KillCount = Objects_Data1
Training_AttackStage = Objects_Data2
Training_PowerUpSet = Objects_Data3

Training_SpawnXOffsets:
	.byte $10, $30, $50, $70, $90, $B0, $D0, $70

Training_PowerUp:
	.byte MARIO_FIRE
	.byte MARIO_ICE
	.byte MARIO_RACCOON
	.byte MARIO_FOX
	.byte MARIO_FROG
	.byte MARIO_KOOPA
	.byte MARIO_HAMMER
	.byte MARIO_NINJA

Training_Attack:

	JSR Object_FindEmptyX
	BCC Training_DetectKills

	LDA RandomN, X
	AND #$07
	TAY
	
	LDA Training_SpawnXOffsets, Y
	STA <Objects_XZ, X

	LDA Training_SpawnXOffsets, Y
	STA <Objects_XZ, X
	STA <Poof_X

	LDA #$00
	STA <Objects_XHiZ, X

	LDA #$10
	STA <Objects_YZ, X
	STA <Poof_Y

	LDA #$01
	STA <Objects_YHiZ, X

	LDA #$00
	STA Objects_Property, X

	LDA #OBJSTATE_INIT
	STA Objects_State, X

	LDA #OBJ_SPINY
	STA Objects_ID, X

	JSR Common_MakePoof
	
	LDX <CurrentObjectIndexZ
	INC Training_KillCount, X
	JMP Training_Attack

Training_DetectKills:
	LDX <CurrentObjectIndexZ

	LDA Training_KillCount, X
	CMP #$0A
	BCC Training_SetPowerUp

	LDA #$00
	STA Training_PowerUpSet, X
	INC Training_AttackStage, X

Training_SetPowerUp:
	LDA Training_PowerUpSet, X
	BNE Training_AttackRTS

	LDY Training_AttackStage, X
	CPY #$08
	BNE Training_UpdatePowerUp

	JMP Training_Make1Up

Training_UpdatePowerUp:
	LDA Training_PowerUp, Y
	ADD #$01
	STA Player_QueueSuit

	JSR Player_PoofHurt

	INC Training_PowerUpSet, X

	LDA #$00
	STA Training_KillCount, X

	LDA #OBJSTATE_INIT
	STA Objects_State
	STA Objects_State + 1
	STA Objects_State + 2

	LDA #$00
	STA Objects_Orientation
	STA Objects_Orientation + 1
	STA Objects_Orientation + 2

Training_AttackRTS:	
	RTS

Training_JumpStage = Objects_Data1
Training_WaitTimer = Objects_Data2

Training_SpawnX:
	.byte $F0, $00, $00, $00 ;
	.byte $00, $00, $00, $00 ;
	.byte $F0, $F0, $F0, $00 ;
	.byte $00, $00, $00, $00 ;
	.byte $F0, $F0, $F0, $F0 ;
	.byte $00, $00, $00, $00 ;
	.byte $F0, $F0, $F0, $F0 ;
	.byte $00, $00, $00, $00 ;	
	.byte $F0, $F0, $F0, $F0 ;
	.byte $00, $00, $00, $00 ;
	.byte $F0, $F0, $F0, $F0 ;
	.byte $00, $00, $00, $00 ;
	.byte $F0, $F0, $F0, $F0 ;
	.byte $00, $00, $00, $00 ;
	.byte $F0, $F0, $00, $00 ;
	.byte $00, $00, $00, $00 ;
	.byte $F0, $F0, $F0, $F0 ;
	.byte $00, $00, $00, $00 ;
	.byte $00, $00, $00, $00 ;
	.byte $F0, $F0, $F0, $F0
	.byte $00, $00, $00, $00
	.byte $F0, $F0, $F0, $F0
	.byte $00, $00, $00, $00

Training_SpawnY:
	.byte $90, $F0, $F0, $F0 ;
	.byte $90, $80, $F0, $F0 ;
	.byte $90, $80, $70, $F0 ;
	.byte $90, $80, $70, $60 ;
	.byte $90, $80, $50, $40 ;
	.byte $90, $60, $50, $40 ;
	.byte $90, $90, $90, $90 ;
	.byte $90, $90, $90, $90 ;
	.byte $90, $90, $90, $90 ;
	.byte $90, $90, $90, $90 ;
	.byte $90, $80, $70, $60 ;
	.byte $90, $80, $70, $60 ;
	.byte $90, $90, $90, $90 ;
	.byte $90, $90, $90, $90 ;
	.byte $90, $80, $90, $80 ;
	.byte $90, $90, $90, $90 ;
	.byte $90, $90, $90, $90 ;
	.byte $90, $90, $90, $90 ;
	.byte $90, $90, $90, $90 ;
	.byte $90, $80, $70, $60
	.byte $90, $80, $70, $60
	.byte $90, $80, $70, $60
	.byte $90, $80, $70, $90

Training_SpawnXVel:
	.byte $E0, $00, $00, $00 ;
	.byte $20, $20, $00, $00 ;
	.byte $E0, $E0, $E0, $00 ;
	.byte $20, $20, $20, $20 ;
	.byte $E0, $E0, $E0, $E0 ;
	.byte $20, $20, $20, $20 ;
	.byte $E0, $E0, $E0, $E0 ;
	.byte $20, $20, $20, $20 ;	
	.byte $E0, $E0, $E0, $E0 ;
	.byte $20, $20, $20, $20 ;
	.byte $E0, $E0, $E0, $E0 ;
	.byte $20, $20, $20, $20 ;
	.byte $C0, $C0, $C0, $C0 ;
	.byte $10, $18, $20, $28 ;
	.byte $E0, $E0, $20, $20 ;
	.byte $20, $30, $30, $30 ;
	.byte $E0, $D0, $E0, $D0 ;
	.byte $30, $30, $30, $30 ;
	.byte $40, $40, $40, $40 ;
	.byte $C0, $C0, $C0, $C0 
	.byte $40, $40, $40, $40
	.byte $C0, $C0, $C0, $C0 
	.byte $40, $40, $40, $40

Training_SpawnSpikeTimer:
	.byte $00, $00, $00, $00 ;
	.byte $00, $00, $00, $00 ;
	.byte $00, $00, $00, $00 ;
	.byte $00, $00, $00, $00 ;
	.byte $00, $00, $00, $00 ;
	.byte $00, $00, $00, $00 ;
	.byte $00, $10, $20, $30 ;
	.byte $00, $10, $50, $60 ;
	.byte $00, $30, $60, $90 ;
	.byte $00, $20, $40, $60 ;
	.byte $00, $08, $10, $18 ;
	.byte $00, $10, $20, $30 ;
	.byte $00, $10, $20, $30 ;
	.byte $00, $00, $00, $00 ;
	.byte $00, $00, $00, $00 ;
	.byte $00, $10, $30, $50 ;
	.byte $00, $20, $30, $50 ;
	.byte $00, $40, $80, $C0 ;
	.byte $00, $30, $60, $90 ;
	.byte $00, $00, $00, $00 ;
	.byte $00, $04, $08, $0C ;
	.byte $00, $08, $10, $18 ;
	.byte $00, $0C, $18, $38 ;

Training_SpawnWaitTimers:
	.byte $50 ;
	.byte $50 ;
	.byte $50 ;
	.byte $50 ;
	.byte $50 ;
	.byte $50 ;
	.byte $68 ;
	.byte $80 ;
	.byte $98 ;
	.byte $80 ;
	.byte $5C ;
	.byte $68 ;
	.byte $68 ;
	.byte $A0 ;
	.byte $50 ;
	.byte $78 ;
	.byte $78 ;
	.byte $98 ;
	.byte $98 ;
	.byte $34
	.byte $34
	.byte $34
	.byte $50

Training_Jumps:
	LDA #$00
	STA Player_Invulnerable

	LDA Training_WaitTimer, X
	BNE Training_JumpRTS

	LDA Training_JumpStage, X
	STA <Temp_Var1

	ASL A
	ASL A
	STA <Temp_Var2

Training_ProduceSpikeBall:
	JSR Object_FindEmptyX
	BCC Training_Continue

	LDY <Temp_Var2

	LDA Training_SpawnX, Y
	STA <Objects_XZ, X

	LDA #$00
	STA <Objects_XHiZ, X

	LDA Training_SpawnY, Y
	STA <Objects_YZ, X

	LDA #$01
	STA <Objects_YHiZ, X

	LDA Training_SpawnXVel, Y
	STA <Objects_XVelZ, X

	LDA Training_SpawnSpikeTimer, Y
	STA Objects_Timer, X

	LDA #$01
	STA Objects_Property, X

	LDA #OBJSTATE_FRESH
	STA Objects_State, X

	LDA #OBJ_SPIKEBALL
	STA Objects_ID, X

	INC <Temp_Var2

	JMP Training_ProduceSpikeBall

Training_Continue:
	LDX <CurrentObjectIndexZ
	LDY <Temp_Var1
	
	LDA Training_SpawnWaitTimers, Y
	STA Training_WaitTimer, X

	INC Training_JumpStage, X

	LDA Training_JumpStage, X
	CMP #24
	BNE Training_JumpRTS
	JMP Training_Make1Up

Training_JumpRTS:
	LDA Game_Counter
	AND #$01
	BNE TrainingJumpTimerRTS

	DEC Training_WaitTimer, X

TrainingJumpTimerRTS:
	RTS

Training_CherriesInit = Objects_Data1
Training_OldCherries = Objects_Data2

Training_Cherries:
	LDA Training_CherriesInit, X
	BNE Trainig_CherriesInited

	LDA Player_Cherries
	STA Training_OldCherries, X

	LDA #$00
	STA Player_Cherries

	LDA #SND_PLAYERPOWER
	STA Sound_QPlayer
	
	LDA #SND_LEVELPOWER
	STA Sound_QLevel1
	
	LDA Sound_QMusic2
	ORA #MUS2A_INVINCIBILITY
	STA Sound_QMusic2
	
	LDA #$C8
	STA Player_StarInv
	INC Training_CherriesInit, X

Trainig_CherriesInited:
	LDA <Player_IsDying
	BEQ Training_CherriesNotDying

	LDA Training_OldCherries, X
	STA Player_Cherries
	RTS

Training_CherriesNotDying:
	LDA Player_Cherries
	CMP #50
	BCC Training_CherriesRTS

	LDA Training_OldCherries, X
	CMP #50
	BCS Training_RestoreOldCherries

	LDA #50

Training_RestoreOldCherries:	
	STA Player_Cherries
	
	JSR Training_Make1Up
	RTS

Training_CherriesRTS:
	JSR Training_DrawNumber
	RTS

;***********************************************************************************
; Star Piece
;***********************************************************************************
; IMMUNITIES:
;		All
;***********************************************************************************
; 	0 - Fills key piece collection slot #1
; 	1 - Fills key piece collection slot #2
; 	2 - Fills key piece collection slot #3
; 	3 - Fills key piece collection slot #4
; 	4 - Fills key piece collection slot #5
; 	5 - Fills key piece collection slot #6
; 	6 - Fills key piece collection slot #7
;***********************************************************************************
; 	This object remains stationary and watch for contact with Mario. Once touched,
;	this object searches for the key collection object and fills in it's inidcated slot
; 	in the collection.
;***********************************************************************************	
SPFrames:
	.byte $00, $04

SPFlips1:
	.byte $00, $00, $00, SPR_HFLIP

SPFlips2:
	.byte $00, $00, SPR_HFLIP, SPR_HFLIP

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

	LDA SPFrames, Y
	STA Objects_Frame, X

	JSR Object_DeleteOffScreen
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

	LDA SPFlips1, X
	ORA Sprite_RAM + 2, Y
	STA Sprite_RAM + 2, Y

	LDA SPFlips2, X
	ORA Sprite_RAM + 6, Y
	STA Sprite_RAM + 6, Y
	RTS

StarCoin_Collect:
	LDA #SND_MAPINVENTORYFLIP	 
	STA Sound_QMap

	LDX #$04

Find_StarCollection:
	CPX <CurrentObjectIndexZ
	BEQ NotFound_StarCollection

	LDA Objects_ID, X
	CMP #OBJ_STARCOLLECTION
	BNE NotFound_StarCollection

	INC StarPiecesCollected, X

NotFound_StarCollection:
	DEX
	BPL Find_StarCollection

	LDX <CurrentObjectIndexZ
	JMP Object_SetDeadEmpty	


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

MaliceMushroom_Action = Objects_Data1

ObjInit_MaliceMushroom:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_NOICE | ATTR_STOMPKICKSOUND |ATTR_WINDAFFECTS  | ATTR_BUMPNOKILL)
	STA Objects_BehaviorAttr, X

	JSR Object_CalcBoundBox

	LDA Objects_Property, X
	CMP #$03
	BEQ ObjInit_MaliceMushroomRTS
	
	JSR Object_MoveTowardsPlayer

ObjInit_MaliceMushroomRTS:
	RTS

ObjNorm_MaliceMushroom:

	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE ObjNorm_MaliceMushroom0

	LDA Objects_Property, X
	CMP #$03
	BEQ MaliceMushroom_NoEnd

	LDA #$80
	STA CompleteLevelTimer

	JSR DestroyAllEnemies

MaliceMushroom_NoEnd:
	JMP Object_PoofDie

ObjNorm_MaliceMushroom0:
	JSR Object_DeleteOffScreen

	LDA Objects_Property, X
	JSR DynJump

	.word MaliceMushroom_Normal
	.word MaliceMushroom_InsideItemBlock
	.word MaliceMushroom_InsideBlock
	.word MaliceMushroom_Normal

MaliceMushroom_Normal:
	LDA <Player_HaltGameZ
	BNE MaliceMushroom_Draw

	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	
	LDA Objects_Orientation, X
	AND #~SPR_VFLIP
	STA Objects_Orientation, X

	JSR Object_InteractWithObjects

MaliceMushroom_Draw:
	JMP Object_DrawMirrored

MaliceMushroom_InsideItemBlock:
	LDA #$08
	STA Objects_Timer2, X

	LDA #(ATTR_SHELLPROOF | ATTR_BUMPNOKILL | ATTR_EXPLOSIONPROOF)
	STA Objects_BehaviorAttr, X

	LDA #ATTR_ALLWEAPONPROOF
	STA Objects_WeaponAttr, X

	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	
	LDA Object_BodyTileProp, X
	CMP #TILE_PROP_ITEM
	BCS MaliceMushroom_InsideItemBlockRTS

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

	LDA #(ATTR_NOICE | ATTR_STOMPKICKSOUND |ATTR_WINDAFFECTS  | ATTR_BUMPNOKILL)
	STA Objects_BehaviorAttr, X

MaliceMushroom_InsideItemBlockRTS:
	LDA #$04
	STA Objects_Timer2, X
	RTS

MaliceMushroom_InsideBlock:
	LDA #$08
	STA Objects_Timer2, X

	LDA #(ATTR_SHELLPROOF | ATTR_BUMPNOKILL | ATTR_EXPLOSIONPROOF)
	STA Objects_BehaviorAttr, X

	LDA #ATTR_ALLWEAPONPROOF
	STA Objects_WeaponAttr, X

	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	
	LDA Object_BodyTileProp, X
	CMP #TILE_PROP_SOLID_ALL
	BCS MaliceMushroom_InsideBlockRTS

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

	LDA #$08
	STA <Objects_YVelZ, X

	LDA #$00
	STA Objects_WeaponAttr, X

	LDA #(ATTR_NOICE | ATTR_STOMPKICKSOUND |ATTR_WINDAFFECTS  | ATTR_BUMPNOKILL)
	STA Objects_BehaviorAttr, X

MaliceMushroom_InsideBlockRTS:
	LDA #$04
	STA Objects_Timer2, X
	RTS

MaliceMushroom_AttackOnly:
	LDA <Player_HaltGameZ
	BNE MaliceMushroom_AttackDraw

	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

	LDA Objects_Timer, X
	BNE MaliceMushroom_NoInteract

	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	
MaliceMushroom_NoInteract:
	LDA Objects_Orientation, X
	AND #~SPR_VFLIP
	STA Objects_Orientation, X

	JSR Object_InteractWithObjects

MaliceMushroom_AttackDraw:
	JMP Object_DrawMirrored