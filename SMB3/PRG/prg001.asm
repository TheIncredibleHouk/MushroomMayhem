    .org ObjectGroup_InitJumpTable
;****************************** OBJECT INITIALIZATION ******************************
ObjectGroup00_InitJumpTable:
	.word $FFF0	; Object $00
	.word ObjInit_DoNothing	; Object $01
	.word ObjInit_SnowBall	; Object $02
	.word ObjInit_EaterBlock	; Object $03 
	.word ObjInit_CoinLock	; Object $04
	.word ObjInit_SpikeBall	; Object $05
	.word ObjInit_BounceDU	; Object $06 - OBJ_BOUNCEDOWNUP
	.word ObjInit_Brick	; Object $07 - OBJ_BRICK
	.word ObjInit_DoNothing	; Object $08 - OBJ_COIN
	.word ObjInit_Bubble	; Object $09 - OBJ_BUBBLE
	.word ObjInit_ModifyPointers	; Object $0A - OBJ_BULLY
	.word ObjInit_PowerUp	; Object $0B - OBJ_POWERUP
	.word ObjInit_PUp1; Object $0C - OBJ_POWERUP_INIT1
	.word ObjInit_PUp2	; Object $0D - OBJ_POWERUP_MUSHROOM
	.word ObjInit_HardIce	; Object $0E - OBJ_HARDICE
	.word ObjInit_Weather	; Object $0F - OBJ_RAIN
	.word ObjInit_IceFireFly; Object $10 - OBJ_PIXIE
	.word ObjInit_Key	; Object $11 OBJ_KEY
	.word ObjInit_Spring	; Object $12 OBJ_SPRING
	.word ObjInit_KeyPieceCollection	; Object $13 OBJ_KEYPIECES

	.org ObjectGroup_NormalJumpTable	; <-- help enforce this table *here*
;****************************** OBJECT GAME LOOP ******************************
	.word $FFF1	; Object $00
	.word ObjNorm_DoNothing	; Object $01
	.word ObjNorm_SnowBall	; Object $02
	.word ObjNorm_EaterBlock	; Object $03
	.word ObjNorm_CoinLock	; Object $04
	.word ObjNorm_SpikeBall	; Object $05
	.word ObjNorm_BounceDU	; Object $06 - OBJ_BOUNCEDOWNUP
	.word ObjNorm_Brick	; Object $07 - OBJ_BRICK
	.word ObjNorm_DoNothing	; Object $08 - OBJ_COIN
	.word ObjNorm_Bubble	; Object $09 - OBJ_BUBBLE
	.word ObjNorm_DoNothing	; Object $0A OBJ_BULLY
	.word ObjNorm_PowerUp; Object $0B - OBJ_POWERUP
	.word ObjNorm_DoNothing ; Object $0C - OBJ_ESWITCH
	.word ObjNorm_DoNothing	; Object $0D - OBJ_POWERUP_MUSHROOM
	.word ObjNorm_HardIce	; Object $0E - OBJ_HARDICE
	.word ObjNorm_Weather	; Object $0F
	.word ObjNorm_IceFireFly	; Object $10 - OBJ_PIXIE
	.word ObjNorm_Key	; Object $11
	.word ObjNorm_Spring	; Object $12
	.word ObjNorm_KeyPieceCollection	; Object $13 

	.org ObjectGroup_CollideJumpTable	; <-- help enforce this table *here*
;****************************** OBJECT PLAYER INTERACTION ******************************
	.word $FFF2	; Object $00
	.word ObjHit_DoNothing	; Object $01
	.word SnowBall_Hit	; Object $02
	.word ObjHit_SolidBlock	; Object $03
	.word ObjHit_DoNothing	; Object $04
	.word Player_GetHurt	; Object $05
	.word ObjHit_DoNothing	; Object $06 - OBJ_BOUNCEDOWNUP
	.word Player_GetHurt	; Object $07 - OBJ_BRICK
	.word ObjHit_DoNothing	; Object $08 - OBJ_COIN
	.word Bubble_Hit	; Object $09 - OBJ_BUBBLE
	.word ObjHit_DoNothing	; Object $0A
	.word PUp_Collect	; Object $0B - OBJ_POWERUP
	.word ObjHit_DoNothing	; Object $0C - OBJ_ESWITCH
	.word ObjInit_DoNothing	; Object $0D - OBJ_POWERUP_MUSHROOM
	.word ObjHit_HardIce	; Object $0E - OBJ_HARDICE
	.word ObjHit_DoNothing	; Object $0F
	.word Player_GetHurt	; Object $10 OBJ_PIXIE
	.word Object_Hold	; Object $11
	.word Object_Hold	; Object $12
	.word ObjHit_DoNothing	; Object $13

	.org ObjectGroup_Attributes	; <-- help enforce this table *here*
;****************************** OBJECT PALETTE/SIZE ******************************
	.byte $F3	; Object $00
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $01
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $02
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $03
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $04
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $05
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $06 - OBJ_BOUNCEDOWNUP
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $07 - OBJ_BRICK
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH8	; Object $08 - OBJ_COIN
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $09 - OBJ_BUBBLE
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $0A- OBJ_BULLY
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $0B - OBJ_POWERUP
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $0C - OBJ_ESWITCH
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $0D - OBJ_POWERUP_MUSHROOM
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $0E - OBJ_HARDICE
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $0F - 
	.byte OA1_PAL0 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $10 OBJ_PIXIE
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $11 OBJ_KEY
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $12 OBJ_REDPRING
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $13 OBJ_GREENSPRING

	.org ObjectGroup_PatTableSel	; <-- help enforce this table *here*
;****************************** OBJECT PATTERN TABLE ******************************
	.byte $F4	; Object $00
	.byte OPTS_NOCHANGE; Object $01
	.byte OPTS_NOCHANGE	; Object $02
	.byte OPTS_NOCHANGE	; Object $03
	.byte OPTS_NOCHANGE	; Object $04
	.byte OPTS_SETPT5 | $0E	; Object $05
	.byte OPTS_NOCHANGE	; Object $06 - OBJ_BOUNCEDOWNUP
	.byte OPTS_NOCHANGE	; Object $07 - OBJ_BRICK
	.byte OPTS_NOCHANGE	; Object $08 - OBJ_COIN
	.byte OPTS_NOCHANGE	; Object $09 - OBJ_BUBBLE
	.byte OPTS_NOCHANGE	; Object $0A - OBJ_BULLY
	.byte OPTS_NOCHANGE	; Object $0B - OBJ_POWERUP
	.byte OPTS_NOCHANGE	; Object $0C - OBJ_ESWITCH
	.byte OPTS_NOCHANGE	; Object $0D - OBJ_POWERUP_MUSHROOM
	.byte OPTS_SETPT5 | $0F	; Object $0E - OBJ_HARDICE
	.byte OPTS_NOCHANGE	; Object $0F
	.byte OPTS_SETPT5 | $33	; Object $10 OBJ_PIXIE
	.byte OPTS_NOCHANGE	; Object $11
	.byte OPTS_SETPT6 | $4F		; Object $12
	.byte OPTS_NOCHANGE	; Object $13
	
	.org ObjectGroup_KillAction	; <-- help enforce this table *here*
;****************************** OBJECT DEATH ROUTINE ******************************
	.byte $F5	; Object $00
	.byte KILLACT_STANDARD	; Object $01
	.byte KILLACT_NORMALANDKILLED	; Object $02
	.byte KILLACT_STANDARD	; Object $03
	.byte KILLACT_POOFDEATH	; Object $04
	.byte KILLACT_NORMALANDKILLED	; Object $05
	.byte KILLACT_STANDARD	; Object $06 - OBJ_BOUNCEDOWNUP
	.byte KILLACT_NORMALANDKILLED	; Object $07 - OBJ_BRICK
	.byte KILLACT_STANDARD	; Object $08 - OBJ_COIN
	.byte KILLACT_STANDARD	; Object $09 - OBJ_BUBBLE
	.byte KILLACT_STANDARD	; Object $0A
	.byte KILLACT_JUSTDRAWMIRROR	; Object $0B - OBJ_POWERUP
	.byte KILLACT_STANDARD	; Object $0C - OBJ_ESWITCH
	.byte KILLACT_JUSTDRAWMIRROR	; Object $0D - OBJ_POWERUP_MUSHROOM
	.byte KILLACT_NORMALANDKILLED	; Object $0E - OBJ_HARDICE
	.byte KILLACT_STANDARD	; Object $0F
	.byte KILLACT_NORMALANDKILLED	; Object $10
	.byte KILLACT_STANDARD	; Object $11
	.byte KILLACT_STANDARD	; Object $12
	.byte KILLACT_STANDARD	; Object $13

OG1_POff .func (\1 - ObjectGroup01_PatternSets)

	.org ObjectGroup_PatternStarts	; <-- help enforce this table *here*

	; Index by object group relative index (ObjGroupRel_Idx)
	.byte $F6, OG1_POff(ObjP01), OG1_POff(ObjP02), OG1_POff(ObjP03)
	.byte OG1_POff(ObjP04), OG1_POff(ObjP05), OG1_POff(ObjP06), OG1_POff(ObjP07)
	.byte OG1_POff(ObjP08), OG1_POff(ObjP09), OG1_POff(ObjP0A), OG1_POff(ObjP0B)
	.byte OG1_POff(ObjP0C), OG1_POff(ObjP0D), OG1_POff(ObjP0E), OG1_POff(ObjP0F)
	.byte OG1_POff(ObjP10), OG1_POff(ObjP11), OG1_POff(ObjP12), OG1_POff(ObjP13)

	.org ObjectGroup_PatternSets	; <-- help enforce this table *here*

ObjectGroup01_PatternSets:
	; (End restricted alignment space)
ObjP00:
	.byte $F7
	
ObjP01:
	.byte $F3, $F5, $F3, $F5, $BB, $BD, $BB, $BF

ObjP02:
	.byte $95, $97
	.byte $8D, $8F

ObjP03:
	.byte $77, $77

ObjP04:
	.byte $F5, $F7, $B5, $B7

ObjP05:
	.byte $95, $95, $97, $97

ObjP06:
	.byte $6B, $6B, $67, $67, $77, $77

ObjP07:
	.byte $67, $67, $97, $99

ObjP08:
	.byte $BB, $BB, $FB, $F9, $FB, $F9, $FF, $FD, $DA, $DA	

ObjP09:	
	.byte $A7, $A7, $A9, $A9, $AB, $AB, $8D, $8D, $8F, $8F, $91, $91

ObjP0A:
	.byte $A9, $AB, $BD, $BF

ObjP0B:
	.byte $51, $53	
	.byte $73, $73

ObjP0C:
	.byte $81, $83

ObjP0D:
	.byte $51, $53

ObjP0E:
	.byte $99, $9B

ObjP0F:
ObjP10:
	.byte $91, $93, $95, $97, $99, $9B, $95, $97

ObjP11:
	.byte $69, $7D

ObjP12:
	.byte $D7, $D7, $ED, $ED, $FF, $FF, $ED, $ED

ObjP13:
	.byte $81, $83, $85, $87, $89, $89, $87, $85, $C1, $C3, $C5, $C7, $C9, $C9, $C7, $C5



;***********************************************************************************
; SNOW BALL
;***********************************************************************************
; IMMUNITIES:
;		ICE
;***********************************************************************************
; Rolls along the ground until it hits a wall, then bursts away with ice particle effects.
; Hitting Mario will freeze the player.
;***********************************************************************************
SnowBall_Frame = Objects_Data1

ObjInit_SnowBall:
	LDA #(ATTR_ICEPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X
	
	JMP Object_MoveTowardsPlayer

ObjNorm_SnowBall:
	LDA <Player_HaltGameZ
	BEQ SnowBall_Norm

	JMP SnowBall_Draw

SnowBall_Norm:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE SnowBall_Move

	JSR SnowBall_Burst
	JMP Object_Delete

SnowBall_Move:
	JSR Object_DeleteOffScreen
	
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BEQ SnowBall_Burst

	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_FaceDirectionMoving
	JSR Object_InteractWithPlayer
	JSR Shell_KillOthers
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles

	LDA <Objects_TilesDetectZ, X
	AND #(HIT_LEFTWALL | HIT_RIGHTWALL)
	BNE SnowBall_Burst

SnowBall_Animate:
	INC SnowBall_Frame, X
	LDA SnowBall_Frame, X
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame, X

SnowBall_Draw:
	JMP Object_Draw

SnowBall_Hit:
	
	JSR Player_Freeze

	LDA <Objects_XVelZ, X
	STA <Player_XVel

	LDA #$D0
	STA <Player_YVel
	STA <Player_InAir

SnowBall_Burst:
	LDA Objects_SpritesHorizontallyOffScreen,X
	ORA Objects_SpritesVerticallyOffScreen,X
	BNE SnowBall_NoBurst

	LDA <Objects_XZ, X
	STA Debris_X

	LDA <Objects_YZ, X
	STA Debris_Y
	
	JSR Common_MakeDebris

	LDA #$BF
	STA BrickBust_Tile, Y

SnowBall_NoBurst:
	LDA #SPR_PAL2
	STA BrickBust_Pal, Y
	JMP Object_Delete

SpringPals: .byte SPR_PAL1, SPR_PAL2, SPR_PAL3



;***********************************************************************************
; BLOCK EATER/MAKER
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

BlockEater_StartX = Objects_Data1
BlockEater_StartXHi = Objects_Data2
BlockEater_StartY = Objects_Data3
BlockEater_StartYHi = Objects_Data4
BlockEater_DirectionIndex = Objects_Data5
BlockEater_TileDetectValue = Objects_Data6
BlockEater_BlockIndexCheck = Objects_Data7
BlockEater_Init = Objects_Data8

BlockEater_XVelocity: .byte $00, $08, $00, $F8
BlockEater_YVelocity: .byte $F8, $00, $08, $00

BlockCheck_XOffsets:
	.byte $08, $18, $08, $F8
	.byte $00, $00, $00, $FF
	

BlockCheck_YOffsets:
	.byte $F8, $08, $18, $08
	.byte $FF, $00, $00, $00
	
ObjInit_EaterBlock:
	JSR Object_NoInteractions

	LDA #BOUND16x16BLOCK
	STA Objects_BoundBox, X

	JSR Object_CalcBoundBox
	JSR Object_DetectTileCenter
	
	LDA Tile_LastValue
	STA BlockEater_TileDetectValue, X

	LDA <Objects_YZ, X
	STA BlockEater_StartY, X

	LDA <Objects_YHiZ, X
	STA BlockEater_StartYHi, X

	LDA <Objects_XZ, X
	STA BlockEater_StartX, X

	LDA <Objects_XHiZ, X
	STA BlockEater_StartXHi, X

	LDA #$FF
	STA BlockEater_BlockIndexCheck, X

	JMP EaterMaker_CheckBlockToggle

ObjNorm_EaterBlock:
	LDA <Player_HaltGameZ
	BEQ EaterMaker_Normal

	JSR EaterMaker_Draw

EaterMaker_RTS1:
	RTS

EaterMaker_Normal:
	LDA <Objects_XZ, X
	CMP BlockEater_StartX, X
	BNE EaterMaker1

	LDA <Objects_XHiZ, X
	CMP BlockEater_StartXHi, X
	BNE EaterMaker1

	LDA <Objects_YZ, X
	CMP BlockEater_StartY, X
	BNE EaterMaker1

	LDA <Objects_YHiZ, X
	CMP BlockEater_StartYHi, X
	BNE EaterMaker1

	JSR Object_DeleteOffScreen

EaterMaker1:
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

	JSR Object_ApplyXVel
	JSR Object_ApplyYVel_NoGravity
	JSR Object_InteractWithPlayer
	JSR EaterMaker_Draw

	LDA <Objects_XVelZ, X
	ORA <Objects_YVelZ, X
	BNE EaterMaker_CheckBlockToggle

	JSR EaterMaker_SetVel

EaterMaker_CheckBlockToggle:

	LDA <Objects_XZ, X
	AND #$0F
	BNE EaterMaker_RTS1

	LDA <Objects_YZ, X
	AND #$0F
	BNE EaterMaker_RTS1

	LDA Block_NeedsUpdate
	BNE EaterMaker_RTS1

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

	LDA BlockEater_TileDetectValue, X
	EOR #$01
	JSR Object_ChangeBlock
	
	LDA #$03
	STA BlockEater_BlockIndexCheck, X

EaterMaker_CheckBlocks:
	LDA BlockEater_BlockIndexCheck, X
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
	CMP BlockEater_TileDetectValue, X
	BEQ EaterMaker_SetVel

	DEC BlockEater_BlockIndexCheck, X
	BPL EaterMaker_CheckBlocks

	LDA Objects_Property, X
	AND #$01
	BNE EaterMark_Reverse

	JMP Object_PoofDie

EaterMark_Reverse:
	LDA BlockEater_TileDetectValue, X
	EOR #$01
	STA BlockEater_TileDetectValue, X

	LDA #$00
	STA <Objects_XVelZ, X
	STA <Objects_YVelZ, X

	JMP EaterMaker_RTS1

EaterMaker_SetVel:
	TYA
	STA BlockEater_BlockIndexCheck, X

	LDY BlockEater_BlockIndexCheck, X
	BMI EaterMaker_NormalSpeed

	LDA BlockEater_XVelocity, Y
	STA <Objects_XVelZ, X

	LDA BlockEater_YVelocity, Y
	STA <Objects_YVelZ, X

	LDA Objects_Property, X
	AND #$02
	BEQ EaterMaker_NormalSpeed

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

EaterMaker_NormalSpeed:
	RTS

EaterMaker_Draw:
	JSR Object_DrawMirrored

	TYA
	TAX

	DEC Sprite_RAMY, X
	DEC Sprite_RAMY + 4, X
	LDX <CurrentObjectIndexZ
	RTS

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
	.byte $0A, $19, $32, $32, $32, $32, $32, $63

Lock_NumOffset:
	.byte $00, $40	

ObjInit_CoinLock:
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
	AND #$C0
	ORA #$01
	JSR Object_ChangeBlock
	
	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE Coin_Unlock0

	LDA <Objects_XZ, X
	STA <Poof_X

	LDA <Objects_YZ, X
	STA <Poof_Y

	LDA <Objects_YHiZ, X
	STA <Poof_YHi
	JSR Common_MakePoof

Coin_Unlock0:
	LDA Sound_QLevel1
	ORA #SND_LEVELPOOF
	STA Sound_QLevel1

	LDA Objects_YZ, X
	AND #$F0
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

	LDA #$08
	STA Sprite_RAM, Y
	STA Sprite_RAM+3, Y
	STA Sprite_RAM+4, Y
	LDA #$10
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


ObjInit_SpikeBall:
	LDA #(ATTR_FIREPROOF | ATTR_ICEPROOF | ATTR_DASHPROOF | ATTR_NINJAPROOF | ATTR_TAILPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	LDA #(ATTR_SHELLPROOF | ATTR_WINDAFFECTS | ATTR_BUMPNOKILL)
	STA Objects_BehaviorAttr, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X
	RTS

SpikeBall_Frame  = Objects_Data1

ObjNorm_SpikeBall:

	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE SpikeBallNotKilled

	JMP SpikeBall_Burst

SpikeBallNotKilled:
	LDA <Player_HaltGameZ
	BNE SpikeBall_Draw
	
	JSR Object_DeleteOffScreen
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Shell_KillOthers
	JSR Object_DetectTiles
	JSR Object_CheckForeground

	LDA <Objects_YVelZ, X
	
	BMI Spike_BumpBottom

	JSR Object_TestBottomBumpBlocks
	JMP Spike_BumpSides

Spike_BumpBottom:
	JSR Object_TestTopBumpBlocks

Spike_BumpSides:
	JSR Object_TestSideBumpBlocks

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ SpikeNoBounce

	LDA Object_VertTileProp, X
	CMP #TILE_ITEM_BRICK
	BEQ SpikeNoBounce

	LDA #$E0
	STA <Objects_YVelZ, X

	LDA Sound_QLevel1
	ORA #SND_LEVELBABOOM
	STA Sound_QLevel1

SpikeNoBounce:
	LDA <Objects_TilesDetectZ, X
	AND #(HIT_LEFTWALL | HIT_RIGHTWALL)
	BEQ SpikeBall_Animate

	LDA Object_HorzTileProp, X
	CMP #TILE_ITEM_BRICK
	BEQ SpikeBall_KeepGoing

	JMP SpikeBall_Burst

SpikeBall_KeepGoing:
	LDA <Objects_XVelZ, X
	EOR #$FF
	ADD #$01
	STA <Objects_XVelZ, X
	JMP SpikeBall_Animate

SpikeBall_Animate:
	INC SpikeBall_Frame, X
	LDA SpikeBall_Frame, X
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame, X

SpikeBall_Draw:
	JMP Object_DrawMirrored

SpikeBall_Burst:
	LDA #$99
	STA Object_BurstTile

	LDA #SPR_PAL1
	STA Object_BurstPalette
	JMP Object_Burst


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
ObjInit_BounceDU: 
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA Block_NeedsUpdate
	BEQ Bouncer_Initialize

	RTS

Bouncer_Initialize:
	JSR Object_NoInteractions
	JSR Object_CalcBoundBox
	JSR Object_DetectTileCenter

	LDA Tile_LastValue
	AND #$C0
	
	JSR Object_ChangeBlock

	LDA #$06
	STA Bouncer_UpTimer, X

	LDA #$05
	STA Bouncer_DownTimer, X

	INC Bouncer_Initialized, X

	LDA Bouncer_PowerUp, X
	BEQ ObjInit_BounceDU2

	CMP #POWERUP_MUSHROOM
	BCS ObjInit_BounceDU2

	LDA Objects_YZ, X
	ADD #$08
	STA <Temp_Var1

	LDA Objects_XZ, X
	ADD #$04
	STA <Temp_Var2

	JMP Produce_Coin

ObjInit_BounceDU2:
	RTS

Bouncer_UpTimer = Objects_Data1
Bouncer_DownTimer = Objects_Data2
Bouncer_PowerUp = Objects_Data3
Bouncer_Frame = Objects_Data4
Bouncer_ReplaceTile = Objects_Data5
Bouncer_Initialized = Objects_Data6

ObjNorm_BounceDU:
	LDA Bouncer_Initialized, X
	BNE Bouncer_IsInitialized

	JMP Bouncer_Initialize

Bouncer_IsInitialized:
	LDA <Player_HaltGameZ
	BEQ Bouncer_Normal

	JMP Bouncer_Draw

Bouncer_Normal:
	LDA Bouncer_UpTimer, X
	BNE Bouncer_Up

	LDA Bouncer_DownTimer, X
	BNE Bouncer_Down

	LDA Block_NeedsUpdate
	BEQ Produce_Item
	RTS

Produce_Item:
	JSR Object_CalcBoundBox
	JSR Object_DetectTileCenter

	LDA Bouncer_ReplaceTile, X
	BNE Block_SwitchTile	

	LDA Tile_LastValue
	AND #$C0
	ORA #$3F

Block_SwitchTile:
	JSR Object_ChangeBlock

Block_MakteItemAppear:
	LDA Bouncer_PowerUp, X
	BMI Produce_Key
	BNE Block_MakteItemAppear1

Block_MakteItemAppear1:
	CMP #POWERUP_MUSHROOM
	BCC Bouncer_Delete
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

	LDA #$00
	STA Objects_Property, X
	JMP ObjInit_Key

Do_PowerUp:

	LDA Bouncer_PowerUp, X
	PHA

	JSR Object_New

	PLA
	STA PowerUp_Type, X

	LDA #OBJ_POWERUP
	STA Objects_ID, X

	INC PowerUp_Raise, X

	JMP ObjInit_PowerUp

Bouncer_Delete:
	JMP Object_Delete

Bouncer_Down:
	DEC Bouncer_DownTimer, X
	LDA #$20
	STA <Objects_YVelZ, X
	JSR Object_ApplyYVel_NoGravity
	JMP Bouncer_Draw

Bouncer_Up:
	DEC Bouncer_UpTimer, X
	LDA #$E0
	STA <Objects_YVelZ, X
	JSR Object_ApplyYVel_NoGravity

Bouncer_Draw:
	LDA Bouncer_Frame, X
	STA Objects_Frame, X
	JMP Object_DrawMirrored

ObjInit_Brick:
	LDA #(ATTR_FIREPROOF | ATTR_ICEPROOF | ATTR_NINJAPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X
	RTS

Brick_PowerUp = Objects_Data1
Brick_PowerUpMap:
	.byte $00, POWERUP_COIN, POWERUP_FIREFLOWER, POWERUP_SUPERLEAF, POWERUP_ICEFLOWER, POWERUP_FROGSUIT, POWERUP_FOXLEAF, POWERUP_SHELL, POWERUP_MUSHROOM, POWERUP_HAMMERSUIT, POWERUP_NINJASHROOM, POWERUP_STAR, POWERUP_VINE, $00, $00, $00, $FF

ObjNorm_Brick:
	LDA <Player_HaltGameZ
	BEQ Brick_Norm

	JMP Brick_Draw

Brick_Norm:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BEQ Brick_MakeItem

	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_AttackOrDefeat
	JSR Shell_KillOthers
	BCS Brick_MakeItem

	LDA <Objects_TilesDetectZ, X
	BNE Brick_MakeItem

Brick_Draw:
	JMP Object_DrawMirrored

Brick_MakeItem:
	LDA Objects_SpritesHorizontallyOffScreen,X
	ORA Objects_SpritesVerticallyOffScreen,X
	BNE Brick_NoBurst

	LDA <Objects_XZ, X
	STA Debris_X

	LDA <Objects_YZ, X
	STA Debris_Y

	JSR Common_MakeBricks

Brick_NoBurst:
	LDY Brick_PowerUp, X
	LDA Brick_PowerUpMap, Y
	BEQ Brick_Burst
	BPL Brick_MakePower

	JMP Produce_Key

Brick_MakePower:

	CMP #POWERUP_COIN
	BEQ Brick_Coin

	STA PowerUp_Type, X

	LDA #OBJ_POWERUP
	STA Objects_ID, X

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X
	
	LDA #$00
	STA Objects_Orientation, X

	JMP ObjInit_PowerUp

Brick_Burst:
	JMP Object_Delete

Brick_Coin:
	LDA <Objects_XZ, X
	ADD #$08
	STA <Coin_X

	LDA <Objects_YZ, X
	ADD #$08
	STA <Coin_Y
	JSR Produce_Coin
	JMP Object_Delete

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

	LDA Objects_Property, X
	BEQ Bubble_NoGraphics


Bubble_NoRegen:
	LDA #$1A
	STA PatTable_BankSel + 4

	LDA #$00
	STA LastPatTab_Sel

Bubble_NoGraphics:
	LDA <Objects_XZ, X
	STA Bubble_RegenX, X

	LDA <Objects_XHiZ, X
	STA Bubble_RegenXHi, X

	LDA <Objects_YZ, X
	STA Bubble_RegenY, X

	LDA <Objects_YHiZ, X
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
	INC Bubble_PopTimer, X
	LDA Bubble_PopTimer, X
	CMP #$0C
	BNE Bubble_PopDraw

	LDA Objects_Property, X
	CMP #$02
	BNE Bubble_PopDelete
	
	INC Bubble_Action, X
	
	LDA #$80
	STA Objects_Timer, X

	LDA #$00
	STA Bubble_PopTimer, X
	RTS

Bubble_PopDelete:
	JMP Object_Delete

Bubble_PopDraw:
	LSR A
	LSR A
	AND #$03
	STA Objects_Frame, X
	JMP Draw_Bubble

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
	INC Bubble_GeneratorTimer, X
	LDA Bubble_GeneratorTimer, X
	CMP #$18
	BNE Bubble_RegenerateDraw

	LDA #$00
	STA Bubble_Action, X
	STA Bubble_GeneratorTimer, X
	STA Objects_Frame, X
	
	JMP Draw_Bubble

Bubble_RegenerateDraw:
	LSR A
	LSR A
	LSR A
	AND #$03
	ADD #$03
	STA Objects_Frame, X
	JMP Object_DrawMirrored


PointerDataOffset:
	.byte 0, 6, 12, 18, 24

ObjInit_ModifyPointers:
	JSR Object_NoInteractions

	LDA Objects_Property, X
	TAY

	LDA BossLevelData, Y
	TAY

	LDA PointerDataOffset, Y
	TAY

	LDA Pointers, Y
	STA Pointers
	RTS	


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

PowerUp_Palette:
	.byte SPR_PAL0, SPR_PAL0, SPR_PAL1, SPR_PAL2, SPR_PAL1, SPR_PAL2, SPR_PAL2, SPR_PAL3, SPR_PAL2, SPR_PAL3, SPR_PAL1, SPR_PAL1, SPR_PAL2, SPR_PAL3

PowerUp_YVelocities:
	.byte $00, $00, $D0, $D0, $C0, $D0, $D0, $D0, $D0, $C0, $B0, $D0, $D0, $D0

PowerUp_AnimOff:
	.byte $00, $00, $00, $04, $08, $0C, $10, $14, $18, $24, $20, $28, $FF, $2C

PowerUp_Timers:
	.byte $00, $00, $06, $06, $1C, $1C, $06, $1C, $06, $1C, $08, $1C, $0A, $06


ObjInit_PUp1:
	
	LDA #OBJ_POWERUP
	STA Objects_ID, X

	LDA Objects_Property, X
	STA PowerUp_Type, X
	JMP ObjInit_PowerUp

ObjInit_PUp2:
	LDA Objects_Property, X
	ADD #$07
	STA PowerUp_Type, X
	JMP ObjInit_PowerUp

ObjInit_PowerUp:
	JSR Object_NoInteractions

	LDA #$04
	STA Objects_SpritesRequested, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDY PowerUp_Type, X

	CPY #POWERUP_VINE
	BEQ PowerUp_VineSndFX


	LDA Sound_QLevel1
	ORA #SND_LEVELRISE
	STA Sound_QLevel1
	BEQ PowerUp_Init

PowerUp_VineSndFX:
	LDA Sound_QLevel1
	ORA #SND_LEVELVINE
	STA Sound_QLevel1

PowerUp_Init:
	LDA PowerUp_Palette, Y
	STA Objects_SpriteAttributes, X

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
	JSR Object_MoveAwayFromPlayer

	LDA <Objects_XZ, X
	STA PowerUp_StartX, X

	LDA <Objects_YZ, X
	STA PowerUp_StartY, X
	RTS

PowerUp_Type = Objects_Data1
PowerUp_Raise = Objects_Data2
PowerUp_StartX = Objects_Data3
PowerUp_StartY = Objects_Data4

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

	LDA Objects_Timer, X
	BEQ ObjNorm_PowerUp1

	JSR Object_ApplyY_With_Gravity
	JSR PUp_DrawMaskSprite

	LDA Object_SpriteRAMOffset, X
	ADD #$08
	STA Object_SpriteRAMOffset, X

ObjNorm_PowerUp0:
	LDA PowerUp_Type, X
	CMP #POWERUP_VINE

	BNE PowerUp_NotVine2

	JMP PUp_VineDraw

PowerUp_NotVine2:
	JMP Object_Draw

ObjNorm_PowerUp1:

	LDA PowerUp_Type, X
	JSR DynJump

	.word ObjNorm_DoNothing
	.word ObjNorm_DoNothing
	.word PUp_Mushroom
	.word PUp_Flower
	.word PUp_Leaf
	.word PUp_Bouncer
	.word PUp_Mushroom
	.word PUp_Bouncer
	.word PUp_Flower
	.word PUp_Leaf
	.word PUp_Mushroom
	.word PUp_Bouncer
	.word PUp_Vine
	.word Pup_PWing


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
	STA Sprite_RAM,Y
	STA Sprite_RAM+4,Y

	; Masking tile
	LDA #$67
	STA Sprite_RAM+1,Y
	STA Sprite_RAM+5,Y

	; Set sprite priority
	LDA #%00100000
	STA Sprite_RAM+2,Y
	STA Sprite_RAM+6,Y

	; Set sprite X's side by side
	LDA Objects_SpriteX,X
	STA Sprite_RAM+3,Y
	ADD #$08
	STA Sprite_RAM+7,Y

PUp_DrawMaskSprite1:
	RTS

PUp_Compare:
	.byte $00, $00, $01, $02, $03, $04, $05, $06, $07, $08, $0B, $FF, $FF, $FF

PUp_Queue:
	.byte $00, $00, $02, $03, $04, $05, $06, $07, $08, $09, $0C, $00, $FF, $FF

PUp_Collect:
	LDA #OBJSTATE_DEADEMPTY
	STA Objects_State, X

	LDA PowerUp_Type, X
	CMP #$01
	BNE PUp_Collect2

	LDY Player_EffectiveSuit
	BEQ PUp_Collect2

PUp_Collect1:
	
	LDA Sound_QLevel1
	ORA #SND_LEVELPOWER
	STA Sound_QLevel1
	RTS

PUp_Collect2:
	TAY

	LDA Player_EffectiveSuit
	CMP PUp_Compare, Y
	BEQ PUp_Collect1

PUp_Collect3:
	LDA PUp_Queue, Y
	STA Player_QueueSuit

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

PUp_Grow:
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

PUp_Bouncer:
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer
	BCS PUp_Bouncer1

	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	
	LDA Objects_Orientation, X
	AND #~SPR_VFLIP
	STA Objects_Orientation, X

	LDA <Objects_TilesDetectZ,X
	AND #HITTEST_BOTTOM
	BEQ PUp_Bouncer1

	LDA #$C0
	STA <Objects_YVelZ, X

PUp_Bouncer1:
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

PUp_Star:
	JSR Object_DeleteOffScreen
	LDA Level_PSwitchCnt
	BNE PRG001_A810	 ; If P-Switch is active, jump to PRG001_A810

	; Otherwise, play invincibility theme!
	LDA Sound_QMusic2
	ORA #MUS2A_INVINCIBILITY
	STA Sound_QMusic2

PRG001_A810:

	; Player_StarInv = $E0
	LDA #$e0
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
	CMP #$0F
	BNE PUp_VineDraw

	LDA <Objects_YHiZ, X
	BPL Vine_NoDelete

	LDA <Objects_YZ, X
	CMP #$F0
	BCC PUp_Delete

Vine_NoDelete:
	JSR Object_CalcBoundBox
	JSR Object_DetectTileCenter

	LDA Tile_LastProp
	CMP #TILE_PROP_SOLID_TOP
	BCC PUp_VineBlock

PUp_Delete:
	LDA #OBJSTATE_DEADEMPTY
	STA Objects_State, X
	RTS

PUp_VineBlock:
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

;***********************************************************************************
; HARD ICE
;***********************************************************************************
; IMMUNITIES:
;		ALL
;***********************************************************************************
; 	This block will bounce when hitting the ground for a short bit. Once settled, it should
; 	write a solid block to the tile it's occupying and it should delete itself. If Mario hits
;  	the block from underneath, it should shatter.
;***********************************************************************************


ObjInit_HardIce:

	LDA #$20
	STA Objects_Timer, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_ICEPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	RTS

HardIce_HitCount = Objects_Data1
HardIce_CanHitTimer = Objects_Data2

ObjNorm_HardIce:
	LDA <Player_HaltGameZ
	BEQ HardIce_NoXVel
	
	JMP Object_Draw

HardIce_NoXVel:
	LDA #$00
	STA Objects_XVelZ, X
	STA Objects_Orientation, X
	
	LDA Objects_XZ, X
	ADD #$08
	AND #$F0
	STA Objects_XZ, X

	JSR Object_DeleteOffScreen
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer
	JSR Object_DetectTiles

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ HardIce_Draw

	LDA Object_BodyTileProp, X
	CMP #(TILE_PROP_ENEMY)
	BNE HardIce_Burst

	JSR Object_HitGround

	LDA HardIce_HitCount, X
	BNE HardIce_ChangeBlock 

	INC HardIce_HitCount, X
	
	LDA #$F0
	STA <Objects_YVelZ, X
	BNE HardIce_Draw


HardIce_ChangeBlock:

	LDA Object_BodyTileValue, X
	EOR #$01

	JSR Object_ChangeBlock
	JSR Object_Delete

HardIce_Draw:
	JMP Object_Draw 
	
HardIce_Burst:
	JMP Object_BurstIce

ObjHit_HardIce:
	LDA HitTest_Result
	CMP #$0A
	BNE HardIce_HitBlock

	JSR Object_XDistanceFromPlayer
	LDA <XDiff
	CMP #$0A
	BCC HardIce_Burst

HardIce_HitBlock:
	JMP ObjHit_SolidBlock

;***********************************************************************************
; WEATHER
;***********************************************************************************
; IMMUNITIES:
;		ALL
;***********************************************************************************
; PROPERTIES
;	0 - Rain
;	1 - Snow
;	2 - Sand
;***********************************************************************************
; 	This produces weather effects for the stage. The Y position of the object determines how
;   strong the wind effect is (0 is no wind). An even X position causes the wind to blow left.
;	An odd X position causes the wind to blow right.
;***********************************************************************************

Weather_Patterns: .byte $7B, $7B, $55, $5F, $5D, $5D 
Rain_XVel: .byte $04, $05, $06, $07, $04, $05, $06, $06
Snow_XVel: .byte $01, $01, $01, $01, $01, $01, $01, $01
Sand_XVel: .byte $06, $07, $0A, $09, $06, $08, $08, $08
Rain_YVel: .byte $03, $04, $03, $04, $03, $04, $03, $04
Snow_YVel: .byte $01, $01, $01, $01, $02, $02, $02, $02
Sand_YVel: .byte $03, $04, $03, $04, $03, $04, $03, $04

Weather_Type = Objects_Data4
Weather_Ticker = Objects_Data5

DeleteWeather:
	LDA Objects_State, Y
	CMP #OBJSTATE_NORMAL
	BNE ObjInit_Weather2

	JMP Object_SetDeadAndNotSpawned

ObjInit_Weather:
	LDA #$06
	STA Objects_SpritesRequested, X

	JSR Object_NoInteractions

	LDA Objects_Property, X
	STA Weather_Type, X
	LDY #$04

ObjInit_Weather1:
	CPY <CurrentObjectIndexZ
	BEQ ObjInit_Weather2

	LDA Objects_ID, Y
	CMP #$0F
	BEQ DeleteWeather

ObjInit_Weather2:
	DEY
	BPL ObjInit_Weather1

	LDY #$05

	LDA Objects_YZ, X
	LSR A
	LSR A
	LSR A
	LSR A
	STA <Temp_Var2

	LDA Objects_XZ, X
	AND #$10
	BNE DontReverseWind

	LDA <Temp_Var2
	EOR #$FF
	ADD #$01
	STA <Temp_Var2
	
DontReverseWind:
	LDA <Temp_Var2
	STA Wind_Speed, X
	
	JSR Half_Value
	JSR Half_Value
	
	STA Wind_ExtraVel, X

	LDA #$01
	STA WeatherActive

KeepRandomizing:
	JSR Randomize_Weather

	LDA RandomN
	STA Weather_YPos, Y
	DEY
	BPL KeepRandomizing

DontReverseWind1:
	RTS

Wind_Speed = Objects_Data1
Wind_ExtraVel = Objects_Data10
Wind_ExtraVelCarry = Objects_Data11

ObjNorm_Weather:
	LDA Weather_Disabled
	BNE DontReverseWind1

	LDA #$00
	STA Wind

	LDA Player_IsClimbing
	BNE No_Wind

	LDA Wind_Speed, X
	STA Wind

No_Wind:
	LDA <Vert_Scroll
	STA <Temp_Var7

	LDA <Horz_Scroll
	STA <Temp_Var8

	LDA Objects_Property, X 
	CMP #$02
	BNE DoNextParticle0

	INC Weather_Ticker, X

	LDA Weather_Ticker, X
	AND #$01
	BNE DoNextParticle0

	LDA <Temp_Var7
	ADD #$80
	STA <Temp_Var7

	LDA <Temp_Var8
	ADD #$80
	STA <Temp_Var8


DoNextParticle0:
	LDA Object_SpriteRAMOffset, X
	STA TempX
	LDY #$05

DoNextParticle:
	LDX <CurrentObjectIndexZ
	JSR MoveSingleParticle

	LDX TempX

	JSR DrawSingleParticle
	LDA TempX
	ADD #$04
	STA TempX
	DEY
	BPL DoNextParticle
	RTS

MoveSingleParticle:	

	LDA Weather_XPos, Y
	ADD Weather_XVel, Y
	ADD Wind_ExtraVel, X
	STA Weather_XPos, Y

	LDA Weather_YPos, Y
	ADD Weather_YVel, Y
	STA Weather_YPos, Y

	CMP #$F8
	BCC MoveSingleParticle1

	JSR Randomize_Weather

MoveSingleParticle1:
	RTS

Randomize_Weather:
	STY TempY
	JSR Randomize

	LDY TempY
	LDX <CurrentObjectIndexZ
	LDA RandomN
	STA Weather_XPos, Y

	LDA #$00
	STA Weather_YPos, Y

	LDA RandomN + 1
	AND #$07
	STA TempA

	LDA Weather_Type, X
	ASL A
	ASL A
	ASL A
	ORA TempA
	TAY

	LDY TempY

	LDA Rain_XVel, Y
	STA Weather_XVel, Y

	LDA RandomN + 2
	AND #$07
	STA TempA

	LDA Weather_Type, X
	ASL A
	ASL A
	ASL A
	ORA TempA

	TAY

	LDA Rain_YVel, Y
	LDY TempY
	STA Weather_YVel, Y

	LDA Objects_XZ, X
	AND #$10
	BNE DoNotReverse

	LDA Weather_XVel, Y
	EOR #$FF
	ADD #$01
	STA Weather_XVel, Y

DoNotReverse: 

	LDA RandomN + 3
	AND #$01
	STA TempA

	LDA Weather_Type, X
	ASL A
	ORA TempA

RainPattern:
	TAY
	LDA Weather_Patterns, Y
	LDY TempY
	STA Weather_Pattern, Y
	RTS

DrawSingleParticle:

	LDA Weather_YPos, Y
	STA Sprite_RAM, X

	LDA Weather_XPos, Y
	SUB <Temp_Var8
	STA Sprite_RAM + 3, X

	LDA Weather_Pattern, Y
	STA Sprite_RAM + 1, X

	LDA #$02
	STA TempA

	LDA Weather_XVel, Y
	BMI DontFlipParticle

	LDA #SPR_HFLIP
	ORA TempA
	STA TempA

DontFlipParticle:
	LDA TempA
	STA Sprite_RAM + 2, X
	RTS

;***********************************************************************************
; Pyro/Frost Fairies
;***********************************************************************************
; IMMUNITIES:
;	Pyro - Fireballs
;	Frost - Iceballs
;***********************************************************************************
; PROPERTIES
;	0 - Pyro (fire)
;	1 - Ice (ice)
;***********************************************************************************
;	These fairires float around towards Mario with either ice or fire balls rotating around
;   them. 
;***********************************************************************************


IceFireFlyProjectiles:
	.byte SOBJ_FIREBALL, SOBJ_ICEBALL

IceFlyRotationX:
	.byte 0, 2, 5, 7, 9, 11, 13, 15, 17, 19, 20, 21, 22, 23, 24, 24
	.byte 24, 24, 24, 23, 22, 21, 20, 19, 17, 15, 13, 11, 9, 7, 5, 2
	.byte 0, -2, -5, -7, -9, -11, -13, -15, -17, -19, -20, -21, -22, -23, -24, -24
	.byte -24, -24, -24, -23, -22, -21, -20, -19, -17, -15, -13, -11, -9, -7, -5, -2

IceFlyRotationY:
	.byte 24, 24, 24, 23, 22, 21, 20, 19, 17, 15, 13, 11, 9, 7, 5, 2
	.byte 0, -2, -5, -7, -9, -11, -13, -15, -17, -19, -20, -21, -22, -23, -24, -24
	.byte -24, -24, -24, -23, -22, -21, -20, -19, -17, -15, -13, -11, -9, -7, -5, -2
	.byte 0, 2, 5, 7, 9, 11, 13, 15, 17, 19, 20, 21, 22, 23, 24, 24

IceFlyRotationVel:
   .byte -$20, $20

IceFireFly_Frame = Objects_Data3
IceFireFly_ProjectileSlot = Objects_Data1
IceFireFly_ProjectileTicks = Objects_Data4
IceFireFly_ProjectileID = Objects_Data5

IceFireFly_Palettes:
	.byte SPR_PAL1, SPR_PAL2

IceFireFly_WeaponAttr:
	.byte ATTR_FIREPROOF, ATTR_ICEPROOF

ObjInit_IceFireFly:
	LDA #$04
	STA Objects_SpritesRequested,X
	
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #$FF
	STA IceFireFly_ProjectileSlot, X

	LDA #ATTR_STOMPKICKSOUND
	STA Objects_BehaviorAttr, X
	
	LDY Objects_Property, X
	LDA IceFireFlyProjectiles, Y
	STA IceFireFly_ProjectileID, X

	LDA IceFireFly_WeaponAttr, Y
	STA Objects_WeaponAttr, X
	
	LDA IceFireFly_Palettes, Y
	STA Objects_SpriteAttributes, X

	JSR InitPatrol_Chase

	JSR Object_PrepProjectile
	BCC ObjInit_IceFireFlyRTS

	TYA
	STA IceFireFly_ProjectileSlot, X

	LDA #SOBJ_PLACEHOLDER
	STA SpecialObj_ID, Y
	STA SpecialObj_Data1, Y
	STA SpecialObj_Data3, Y
	
	LDX <CurrentObjectIndexZ

ObjInit_IceFireFlyRTS:
	RTS


ObjNorm_IceFireFly:

	LDA <Player_HaltGameZ
	BEQ IceFireFly_Normal
		
	JMP IceFireFly_Draw

IceFireFly_Normal:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE IceFireFly_DoNormal

	JSR IceFireFly_DestroyProjectiles
	JSR Object_SetDeadAndNotSpawned

	JMP Object_PoofDie

IceFireFly_DoNormal:
	JSR Object_DeleteOffScreen
	
	JSR Object_ChasePlayer
	JSR Object_CalcBoundBox
	JSR Object_FaceDirectionMoving
	JSR Object_AttackOrDefeat
	JSR IceFireFly_Animate
	JSR IceFireFly_MoveProjectiles
	RTS

IceFireFly_Animate:
	INC IceFireFly_Frame, X
	LDA IceFireFly_Frame, X
	AND #$0C
	LSR A
	LSR A
	STA Objects_Frame, X

IceFireFly_Draw:
	JSR Object_Draw
	RTS

IceFireFly_MoveProjectiles:
	INC IceFireFly_ProjectileTicks, X

	LDY IceFireFly_ProjectileSlot, X
	BMI IceFireFly_MoveProjectilesRTS
 
	LDA #$00
	STA SpecialObj_HurtEnemies, Y

	LDA IceFireFly_ProjectileTicks, X
	AND #$3F

	TAY
	
	LDA Object_SpriteRAMOffset,X
	TAX

	JSR IceFireFly_DetermineProjectileVisibility
	BCC IceFireFly_ClearFirstProjectile

	JSR IceFireFly_CalcXYPosition

	LDY IceFireFly_ProjectileSlot, X
	JSR IceFireFly_SetXYPosition

	RTS

IceFireFly_ClearFirstProjectile:
	LDX <CurrentObjectIndexZ

	LDY IceFireFly_ProjectileSlot, X
	JSR IceFireFly_ClearProjectile

IceFireFly_MoveProjectilesRTS:
	RTS

IceFireFly_DetermineProjectileVisibility:

	LDA IceFlyRotationX, Y
	STA <Temp_Var1
	BMI Projectile_NegativeXOffset

	LDA Sprite_RAMX, X
	ADD #$04
	BCS IceFireFly_NotVisible

	ADC IceFlyRotationX, Y
	BCS IceFireFly_NotVisible
	BCC Projectile_DetermineYVisibility

Projectile_NegativeXOffset:
	EOR #$FF
	ADD #$01
	STA <Temp_Var1

	LDA Sprite_RAMX, X
	ADD #$04
	SUB <Temp_Var1
	BCC IceFireFly_NotVisible

Projectile_DetermineYVisibility:
	LDA IceFlyRotationY, Y
	STA <Temp_Var1
	BMI Projectile_NegativeYOffset

	LDA Sprite_RAMY, X
	CMP #$F8
	BEQ IceFireFly_NotVisible

	ADD #$08
	BCS IceFireFly_NotVisible

	ADC IceFlyRotationY, Y
	BCS IceFireFly_NotVisible
	BCC IceFireFly_Visible

Projectile_NegativeYOffset:
	EOR #$FF
	ADD #$01
	STA <Temp_Var1

	LDA Sprite_RAMY, X
	CMP #$F8
	BEQ IceFireFly_NotVisible

	SUB <Temp_Var1
	BCC IceFireFly_NotVisible
	
IceFireFly_Visible
	LDX <CurrentObjectIndexZ
	SEC
	RTS

IceFireFly_NotVisible:
	LDX <CurrentObjectIndexZ
	CLC
	RTS

IceFireFly_ClearProjectile:
	LDA #$FF
	STA SpecialObj_XHi, Y
	STA SpecialObj_YHi, Y

	LDA #SOBJ_PLACEHOLDER
	STA SpecialObj_ID, Y
	RTs

IceFireFly_CalcXYPosition:
	LDX <CurrentObjectIndexZ

	LDA IceFlyRotationX, Y
	STA <Temp_Var1
	BMI IceFireFly_CalcXNegative

	LDA <Objects_XZ, X
	ADD #$04
	ADC IceFlyRotationX, Y
	STA <Temp_Var1

	LDA <Objects_XHiZ, X
	ADC #$00
	STA <Temp_Var2
	JMP IceFireFly_CalcY

IceFireFly_CalcXNegative:
	EOR #$FF
	ADD #$01
	STA <Temp_Var1

	LDA <Objects_XZ, X
	ADD #$04
	SUB <Temp_Var1
	STA <Temp_Var1

	LDA <Objects_XHiZ, X
	SBC #$00
	STA <Temp_Var2
	
IceFireFly_CalcY:
	LDA IceFlyRotationY, Y
	STA <Temp_Var3
	BMI IceFireFly_CalcYNegative

	LDA <Objects_YZ, X
	ADC IceFlyRotationY, Y
	STA <Temp_Var3

	LDA <Objects_YHiZ, X
	ADC #$00
	STA <Temp_Var4
	RTS

IceFireFly_CalcYNegative:
	EOR #$FF
	ADD #$01
	STA <Temp_Var3

	LDA <Objects_YZ, X
	SUB <Temp_Var3
	STA <Temp_Var3

	LDA <Objects_YHiZ, X
	SBC #$00
	STA <Temp_Var4
	RTS

IceFireFly_SetXYPosition:

	LDA <Temp_Var1
	STA SpecialObj_X, Y
	
	LDA <Temp_Var2
	STA SpecialObj_XHi, Y

	LDA <Temp_Var3
	STA SpecialObj_Y, Y
	
	LDA <Temp_Var4
	STA SpecialObj_YHi, Y

	LDA IceFireFly_ProjectileID, X
	STA SpecialObj_ID, Y
	STA SpecialObj_Data3, Y
	STA SpecialObj_AllowOffScreen, Y
	RTS


IceFireFly_DestroyProjectiles:
	LDY IceFireFly_ProjectileSlot, X
	BMI IceFireFly_DestroyProjectilesRTS

	LDA #PLAYER_POOF
	STA SpecialObj_ID, Y

	LDA #$10
	STA SpecialObj_Timer, Y

	LDA #$00
	STA SpecialObj_Data1, Y

	LDA #$FF
	STA IceFireFly_ProjectileSlot, X

IceFireFly_DestroyProjectilesRTS:
	RTS

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
	.byte SPR_PAL3, SPR_PAL1, SPR_PAL2, SPR_PAL3

ObjInit_Key:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #ATTR_ALLWEAPONPROOF
	STA Objects_WeaponAttr, X

	LDA #(ATTR_SHELLPROOF | ATTR_EXPLOSIONPROOF | ATTR_BUMPNOKILL)
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
	LDA Key_Reappear, X
	BNE Key_NoOffscreenDelete

	JSR Object_DeleteOffScreen
	
Key_NoOffscreenDelete:
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
	
	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	LDY Objects_SpawnIdx,X	 ; Get the spawn index of this object
	
	LDA Level_ObjectsSpawned,Y
	ORA #$80
	STA Level_ObjectsSpawned,Y

	LDA #OBJ_KEY
	STA Objects_ID, X

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
	JSR Object_CheckForeground
	JSR Key_DoUnlocks
	BCS ObjNorm_KeyHeldRTS

	LDA Objects_BeingHeld, X
	BNE ObjNorm_KeyHeld
	
	JSR Object_DampenVelocity
	JSR Object_InteractWithTiles
	JMP Object_Draw

ObjNorm_KeyHeld:
	JSR Object_CheckForeground

ObjNorm_KeyHeldRTS:	
	JMP Object_Draw

Key_CheckUnlockSection:
	JMP Key_DoUnlocks

Key_UnlockCheckX:
	.byte $08, $18, $08, $F8
	.byte $00, $00, $00, $FF

Key_UnlockCheckY:
	.byte $F8, $08, $18, $08
	.byte $FF, $00, $00, $00

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
	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_ENEMYSOLID)
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
	BCC Key_DoUnlocksRTS

Key_DoUnlocksRTS:
	RTS

Key_CheckUnlock:
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
	BEQ Key_UnlockBlock

Key_NoUnlocks:
	CLC
	RTS

Key_UnlockBlock:
	LDA #$00
	STA Objects_BeingHeld, X

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

ObjInit_Spring:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_INVINCIBLE)
	STA Objects_WeaponAttr, X

	LDA #(ATTR_BUMPNOKILL | ATTR_WINDAFFECTS | ATTR_EXPLOSIONPROOF | ATTR_SHELLPROOF)
	STA Objects_BehaviorAttr, X

	LDY Objects_Property, X
	
	LDA SpringPals, Y
	STA Objects_SpriteAttributes,X

	LDA #ATTR_ALLWEAPONPROOF
	STA Objects_WeaponAttr, X
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

ObjNorm_Spring:
	LDA <Player_HaltGameZ
	BNE Spring_RTS

	LDA #$40
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

	LDA <Player_YVel
	BEQ Spring_2
	BMI Spring_2

	JSR Spring_PositionRestore

	LDA #$00
	STA Objects_BeingHeld, X
	STA <Objects_YVelZ, X
	STA <Objects_XVelZ, X

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
	JSR Object_InteractWithTiles

Spring_RTS:
	JMP Object_DrawMirrored

SpringAnim:
	LDY Spring_CurrentFrame, X

	LDA Objects_YZ, X
	SUB Spring_Player_YOffsets, Y
	STA <Player_Y
	
	LDA <Objects_YHiZ, X
	SBC #$00
	STA <Player_YHi
	
	LDA #$00
	STA <Player_YVel


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
	STA <Player_YVel
	STA <Player_InAir

	
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



KeyPieceGet:
	.byte $01, $02, $04, $08, $10

KeyPieceXOffset:
	.byte $10, $18, $20, $28, $30

ObjInit_KeyPieceCollection:
	LDA #$05
	STA Objects_SpritesRequested,X

	LDA #$FF
	STA Objects_YHiZ, X
	INC Objects_Global, X
	RTS

ObjNorm_KeyPieceCollection:
	LDA #$93
	STA <Temp_Var1

	LDA #$95
	STA <Temp_Var2

	LDA LastPatTab_Sel
	EOR #$01
	TAY

	LDA #$4D
	STA PatTable_BankSel + 4, Y
	CPY #$00
	BEQ ObjNorm_KeyPieceCollection1

	LDA <Temp_Var1
	ADD #$40
	STA <Temp_Var1

	LDA <Temp_Var2
	ADD #$40
	STA <Temp_Var2

ObjNorm_KeyPieceCollection1:
	LDY Object_SpriteRAMOffset, X
	LDA Objects_Data4, X
	STA <Temp_Var5

	LDA Objects_Property, X
	STA <Temp_Var6
	TAX

CheckNextPiece:
	
	LDA #$08
	STA Sprite_RAM, Y
	LDA #SPR_PAL3
	STA Sprite_RAM + 2, Y
	LDA <Temp_Var5
	AND KeyPieceGet, X
	BNE UseFilledKey

	LDA <Temp_Var2
	BNE DrawKeyPiece

UseFilledKey:
	DEC <Temp_Var6

UseFilledKey1:
	LDA <Temp_Var1

DrawKeyPiece:
	STA Sprite_RAM + 1, Y
	LDA KeyPieceXOffset, X

	STA Sprite_RAM + 3, Y
	INY
	INY
	INY
	INY

NextCheck:
	DEX
	BPL CheckNextPiece

	LDA <Temp_Var6
	BPL KeyPieceRTS

	LDX <CurrentObjectIndexZ

	LDA #OBJ_KEY
	STA Objects_ID, X
	INC Objects_Global, X

	LDA #$00
	STA Objects_Property, X

	LDA <Player_X
	STA <Objects_XZ, X
	STA Key_ReappearX, X
	STA <Poof_X

	LDA <Player_XHi
	STA <Objects_XHiZ, X
	STA Key_ReappearXHi, X

	LDA <Player_Y
	ADD #$10
	STA <Objects_YZ, X
	STA Key_ReappearY, X
	STA <Poof_Y

	LDA <Player_YHi
	ADC #$00
	STA <Objects_YHiZ, X
	STA Key_ReappearYHi, X

	LDA #$01
	STA Key_Reappear, X

	JMP Common_MakePoof

KeyPieceRTS:
	RTS

KPFrames:
	.byte $00, $04

KPFlips1:
	.byte $00, $00, $00, SPR_HFLIP

KPFlips2:
	.byte $00, $00, SPR_HFLIP, SPR_HFLIP
