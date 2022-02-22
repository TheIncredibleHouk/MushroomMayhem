ObjGiant_Mirror:
	LDY Object_SpriteRAMOffset, X
	LDA Sprite_RAMAttr + 8, Y
	ORA #SPR_HFLIP
	STA Sprite_RAMAttr + 8, Y
	LDA Sprite_RAMAttr + 12, Y
	ORA #SPR_HFLIP
	STA Sprite_RAMAttr + 12, Y
	LDA Sprite_RAMAttr + 24, Y
	ORA #SPR_HFLIP
	STA Sprite_RAMAttr + 24, Y
	LDA Sprite_RAMAttr + 28, Y
	ORA #SPR_HFLIP
	STA Sprite_RAMAttr + 28, Y
	RTS

ObjNorm_Boss:
	
	LDA Objects_Property, X
	JSR DynJump

	.word Boss_Cheep
	.word Boss_Fwoosh
	.word Boss_Bully
	.word Giant_Piranha


Boss_CheepAction = Objects_Data1
Boss_CheepAnimTicks = Objects_Data2
Boss_CheepTopLeftProp = Objects_Data3
Boss_CheepTopRightProp = Objects_Data4
Boss_CheepBounces = Objects_Data5
Boss_CheepHits = Objects_Data6
Boss_CheepYLine = Objects_Data7

Boss_Cheep:
	LDA <Player_HaltGameZ
	BEQ Boss_CheepDoAction

	JMP Boss_CheepDraw

Boss_CheepDoAction:
	LDA Boss_CheepAction, X
	JSR DynJump

	.word Boss_CheepInit
	.word Boss_CheepPatrolLeft
	.word Boss_CheepPatrolRight
	.word Boss_CheepWait
	.word Boss_CheepJump
	.word Boss_CheepAir
	.word Boss_CheepBreakBridgeLeft
	.word Boss_CheepBreakBridgeRight
	.word Colossal_FallIntoWater
	.word Boss_CheepDie
	.word Boss_CheepExplode

Boss_CheepTimers:
	.byte $80, $90, $A0, $B0

Boss_CheepInit:

	LDA #$00
	STA Objects_ExpPoints, X

	LDA #$04
	STA Objects_Health, X

	INC Boss_CheepAction, X

	LDA #$08
	STA Objects_SpritesRequested, X

	LDA #$9C
	LDA <Objects_YZ, X
	SUB #$04
	STA Boss_CheepYLine, X
	STA <Objects_YZ, X

	LDA #ATTR_NOICE
	STA Objects_BehaviorAttr, X

	LDA #BOUND32x32
	STA Objects_BoundBox, X

Boss_CheepReset:
	LDA RandomN
	AND #$03
	TAY

	LDA Boss_CheepTimers, Y
	STA Objects_SlowTimer, X

	LDA #$00
	STA Boss_CheepBounces, X

	LDA #$01
	STA Boss_CheepAction, X

	LDA #ATTR_ALLWEAPONPROOF
	STA Objects_WeaponAttr, X

	LDA #ATTR_SHELLPROOF
	STA Objects_BehaviorAttr, X

	RTS

Boss_CheepNorm:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE Boss_CheepNotKilled

	LDA #$40
	STA Objects_Timer2, X

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X
	
	LDA #ATTR_ALLWEAPONPROOF
	STA Objects_WeaponAttr, X
	
	LDA #ATTR_SHELLPROOF
	STA Objects_BehaviorAttr, X

	LDA #$03
	STA Boss_CheepBounces, X

	LDA #$04
	STA Objects_Health, X

	INC Boss_CheepHits, X

	LDA Boss_CheepHits, X
	CMP #$05
	BCC Boss_CheepNotDead

	LDA #$09
	STA Boss_CheepAction, X
	JMP Boss_CheepDie

Boss_CheepNotDead:	
	JSR Boss_CheepMakeFish

Boss_CheepNotKilled:	

	LDA Objects_InWater, X
	PHA

	LDA #$00
	STA Objects_InWater, X

	JSR Object_Move

	PLA
	STA Objects_InWater, X

	JSR Object_CalcBoundBox
	JSR Object_FaceDirectionMoving
	JSR Object_DetectTiles

	LDA Objects_Health, X
	PHA

	JSR Object_AttackOrDefeat

	PLA

	LDY Objects_PlayerProjHit, X
	CPY #HIT_STOMPED
	BNE Boss_CheepNotStomped

	STA Objects_Health, X

	LDA #$00
	STA Objects_PlayerProjHit, X

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	LDA #SND_PLAYERBUMP
	STA Sound_QPlayer


Boss_CheepNotStomped:
	LDA <Objects_XZ, X
	ADD #$08
	STA Block_DetectX

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Block_DetectXHi

	LDA <Objects_YZ, X
	ADD #$20
	STA Block_DetectY
	
	LDA <Objects_YHiZ, X
	ADC #$00
	STA Block_DetectYHi
	
	JSR Object_DetectTile
	STA Boss_CheepTopLeftProp, X

	LDA Block_DetectX
	ADD #$10
	STA Block_DetectX

	LDA Block_DetectXHi
	ADC #$00
	STA Block_DetectXHi

	JSR Object_DetectTile
	STA Boss_CheepTopRightProp, X
	RTS

Boss_CheepPatrolLeft:
	LDA Objects_SlowTimer, X
	BNE Boss_CheepKeepLeft

	LDA #$03
	STA Boss_CheepAction, X

	LDA #$20
	STA Objects_Timer, X

Boss_CheepKeepLeft:	
	LDA #$00
	STA Objects_YVelZ, X

	JSR Boss_CheepNorm

	LDA <Objects_XZ, X
	SUB #$30

	LDA <Objects_XHiZ, X
	BNE Boss_SwitchDirectionRight

	SBC #$00
	BEQ Boss_CheepMoveLeft

Boss_SwitchDirectionRight:
	INC Boss_CheepAction, X

Boss_CheepMoveLeft:
	LDA <Objects_XVelZ, X
	BEQ Boss_CheepForceLeft
	BPL Boss_CheepForceLeft

	CMP #$E0
	BCC Boss_CheepLeftDraw

Boss_CheepForceLeft:
	DEC <Objects_XVelZ, X

Boss_CheepLeftDraw:	
	JMP Boss_CheepAnimate

Boss_CheepPatrolRight:
	LDA Objects_SlowTimer, X
	BNE Boss_CheepKeepRight

	LDA #$03
	STA Boss_CheepAction, X

	LDA #$20
	STA Objects_Timer, X

Boss_CheepKeepRight:
	LDA #$00
	STA Objects_YVelZ, X

	JSR Boss_CheepNorm
	
	LDA <Objects_XZ, X
	ADD #$44

	LDA <Objects_XHiZ, X
	BNE Boss_SwitchDirectionLeft

	ADC #$00
	BEQ Boss_CheepMoveRight

Boss_SwitchDirectionLeft:
	DEC Boss_CheepAction, X

Boss_CheepMoveRight:
	LDA <Objects_XVelZ, X
	BMI Boss_CheepForceRight
	BEQ Boss_CheepForceRight

	CMP #$20
	BCS Boss_CheepRightDraw

Boss_CheepForceRight:
	INC <Objects_XVelZ, X

Boss_CheepRightDraw:	
	JMP Boss_CheepAnimate
		
Boss_CheepJumpX:
	.byte $F0, $10
	.byte $F0, $10
	.byte $E8, $18
	.byte $E8, $18
	.byte $E0, $20
	.byte $E0, $20

Boss_CheepJump:
	LDA #$90
	STA <Objects_YVelZ, X

	JSR Boss_CheepNorm
	JSR Object_XDistanceFromPlayer

	LDA Boss_CheepHits, X
	ASL A
	STA <Temp_Var1

	TYA
	ORA <Temp_Var1
	TAY

	LDA Boss_CheepJumpX, Y
	STA <Objects_XVelZ, X

	LDA #(ATTR_TAILPROOF)
	STA Objects_WeaponAttr, X

	LDA #ATTR_NOICE
	STA Objects_BehaviorAttr, X

Boss_CheepCharge:
	INC Boss_CheepAction, X
	JMP Boss_CheepDraw

Boss_CheepAir:
	JSR Boss_CheepNorm
	JSR Object_InteractWithTiles
	
	LDA <Objects_TilesDetectZ,X
	AND #HIT_GROUND
	BEQ Boss_CheepAirAnimate

	INC Boss_CheepBounces, X
	LDA Boss_CheepBounces, X
	CMP #$03
	BCC Boss_CheepBounce

	LDA #OBJECT_MAXFALL
	STA <Objects_YVelZ, X

	INC Boss_CheepAction, X
	JMP Boss_CheepAnimate

Boss_CheepBounce:
	LDA #$B0
	STA <Objects_YVelZ, X

	LDA #$10
	STA Level_Vibration

	LDA Sound_QLevel1
	ORA #SND_LEVELBABOOM
	STA Sound_QLevel1


Boss_CheepAirAnimate:
	JMP Boss_CheepCheckWater

Boss_CheepBreakBridgeLeft:
	JSR Boss_CheepNorm
	
	LDA Boss_CheepTopLeftProp, X
	CMP #(TILE_PROP_SOLID_TOP | TILE_PROP_SOLID_OBJECTINTERACT)
	BNE Boss_CheepNoBreak

	LDA <Objects_XZ, X
	ADD #$08
	STA Block_DetectX
	STA Debris_X

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Block_DetectXHi

	JMP Boss_CheepBreak

Boss_CheepBreakBridgeRight:
	LDA Boss_CheepTopRightProp, X
	CMP #(TILE_PROP_SOLID_TOP | TILE_PROP_SOLID_OBJECTINTERACT)
	BNE Boss_CheepNoBreak

	LDA <Objects_XZ, X
	ADD #$18
	STA Block_DetectX
	STA Debris_X

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Block_DetectXHi

Boss_CheepBreak:
	LDA <Objects_YZ, X
	ADD #$18
	STA Block_DetectY
	STA Debris_Y

	LDA <Objects_YHiZ, X
	ADC #$00
	STA Block_DetectYHi

	LDA #$50
	JSR Object_ChangeBlock
	JSR Common_MakeBricks

Boss_CheepNoBreak:
	INC Boss_CheepAction, X

	JMP Boss_CheepAnimate

Colossal_FallIntoWater:
	JSR Boss_CheepNorm

Boss_CheepCheckWater:
	LDA <Objects_YZ, X
	CMP Boss_CheepYLine, X
	BCC Boss_CheepFallDraw

	LDA <Objects_YHiZ, X
	BNE Boss_CheepFallDraw

	LDA Boss_CheepYLine, X
	STA <Objects_YZ, X
	JSR Boss_CheepReset

Boss_CheepFallDraw:	
	JMP Boss_CheepAnimate

Boss_CheepDie:
	LDA #$40
	STA Objects_Timer2, X

	LDA #$00
	STA Objects_ID, X
	
	JSR DestroyAllEnemies
	
	LDA #OBJ_BOSS
	STA Objects_ID, X

	INC Boss_CheepAction, X
	JMP Boss_CheepDraw


Boss_CheepExplode:	
	LDA Objects_Timer2, X
	BNE Boss_CheepDieDraw

	JSR Object_Explode

	LDA #$FF
	STA Objects_Timer2, X

	LDA #$80
	STA CompleteLevelTimer

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	LDA #$18
	STA Objects_Timer,X

	LDA Sound_QLevel1
	ORA #SND_LEVELBABOOM
	STA Sound_QLevel1

	LDA #$10
	STA RotatingColor_Cnt

	LDA #$64
	STA Exp_Earned

Boss_CheepDieDraw:
	JMP Boss_CheepDraw

Boss_CheepSprites:
	.byte $95, $97, $99, $9B, $B5, $B7, $B9, $BB
	.byte $95, $97, $9D, $9F, $B5, $B7, $BD, $BF

Boss_CheepPals:
	.byte SPR_PAL1, SPR_PAL3

Boss_CheepWait:
	LDA Objects_Timer, X
	BNE Boss_CheepDraw

	INC Boss_CheepAction, X

Boss_CheepAnimate:
	INC Boss_CheepAnimTicks, X
	
	LDA Boss_CheepAnimTicks, X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame, X

Boss_CheepDraw:
	LDA Objects_Timer2, X
	BEQ Boss_CheepDrawNorm

	LSR A
	LSR A
	AND #$01
	TAY

	LDA Boss_CheepPals, Y
	STA Objects_SpriteAttributes, X

Boss_CheepDrawNorm:	
	LDA Objects_Orientation, X
	ORA #SPR_BEHINDBG
	STA Objects_Orientation, X

	LDA #LOW(Boss_CheepSprites)
	STA <Giant_TilesLow

	LDA #HIGH(Boss_CheepSprites)
	STA <Giant_TilesHi

	LDA #$1B
	STA PatTable_BankSel + 4

	LDA Objects_Orientation, X
	AND #~SPR_VFLIP
	STA Objects_Orientation, X

	JSR Object_CheckForeground
	JMP Object_DrawGiant

Boss_CheepFishX:
	.byte $28, $40, $C0, $A8

Boss_CheepMakeFish:
	JSR Object_FindEmptyY
	BCS Boss_CheepFirstFish
	JMP Boss_CheepMakeFishRTS

Boss_CheepFirstFish:
	LDA #OBJ_JUMPINGCHEEP
	STA Objects_ID, Y

	LDA #$00
	STA Objects_ExpPoints, Y

	LDA #OBJSTATE_FRESH
	STA Objects_State, Y

	LDA RandomN, Y
	AND #$03
	TAX

	LDA Boss_CheepFishX, X
	STA <Temp_Var16
	STA Objects_XZ, Y
	STA <Poof_X

	LDX <CurrentObjectIndexZ
	LDA <Objects_XHiZ, X
	STA Objects_XHiZ, Y

	LDA Boss_CheepYLine, X
	STA Objects_YZ, Y
	STA <Poof_Y

	LDA #$00
	STA Objects_YHiZ, Y
	STA Objects_Property, Y

	LDA #$40
	STA Objects_Timer, Y
	STA Objects_InWater, Y

	LDA #SPR_BEHINDBG
	STA Objects_Orientation, Y
	
	JSR Common_MakePoof

	LDA Boss_CheepHits, X
	CMP #$02
	BCS Boss_CheepSecondFish

	JMP Boss_CheepMakeFishRTS

Boss_CheepSecondFish:
	JSR Object_FindEmptyY
	BCS Boss_CheepSecondFishDo

	JMP Boss_CheepMakeFishRTS

Boss_CheepSecondFishDo:
	LDA #OBJ_JUMPINGCHEEP
	STA Objects_ID, Y

	LDA #$00
	STA Objects_ExpPoints, Y

	LDA #OBJSTATE_FRESH
	STA Objects_State, Y

	LDA <Temp_Var16
	ADD #$80
	STA Objects_XZ, Y
	STA <Poof_X

	LDX <CurrentObjectIndexZ
	LDA <Objects_XHiZ, X
	STA Objects_XHiZ, Y

	LDA Boss_CheepYLine, X
	STA Objects_YZ, Y
	STA <Poof_Y

	LDA #$00
	STA Objects_YHiZ, Y
	STA Objects_Property, Y
	
	LDA #$80
	STA Objects_Timer, Y
	STA Objects_InWater, Y

	LDA #SPR_BEHINDBG
	STA Objects_Orientation, Y

	JSR Common_MakePoof

	LDA Boss_CheepHits, X
	CMP #$04
	BCC Boss_CheepMakeFishRTS

	JSR Object_FindEmptyY
	BCC Boss_CheepMakeFishRTS

	LDA #OBJ_JUMPINGCHEEP
	STA Objects_ID, Y

	LDA #$00
	STA Objects_ExpPoints, Y

	LDA #OBJSTATE_FRESH
	STA Objects_State, Y

	LDA <Temp_Var16
	ADD #$40
	STA Objects_XZ, Y
	STA <Poof_X

	LDX <CurrentObjectIndexZ
	LDA <Objects_XHiZ, X
	STA Objects_XHiZ, Y

	LDA Boss_CheepYLine, X
	STA Objects_YZ, Y
	STA <Poof_Y

	LDA #$00
	STA Objects_YHiZ, Y
	STA Objects_Property, Y
	
	LDA #$80
	STA Objects_Timer, Y
	STA Objects_InWater, Y

	LDA #SPR_BEHINDBG
	STA Objects_Orientation, Y

	JSR Common_MakePoof

Boss_CheepMakeFishRTS:
	RTS	


Boss_FwooshAction = Objects_Data1
Boss_FwooshPoofTimer = Objects_Data2
Boss_FwooshPoofOffset = Objects_Data3
Boss_FwooshAccelerate = Objects_Data4
Boss_FwooshBreatheState = Objects_Data5
Boss_FwooshStage = Objects_Data6
Boss_FwooshPlatformState = Objects_Data7
Boss_FwooshHealth = Objects_Data8

Boss_FwooshSprites:
	.byte $FF, $C1, $C1, $FF, $FF, $C3, $C3, $FF
	.byte $FF, $C1, $C1, $FF, $FF, $E1, $E1, $FF
	.byte $FF, $C1, $C1, $FF, $FF, $E3, $E3, $FF	

Boss_Fwoosh:
	LDA <Player_HaltGameZ
	BEQ Boss_Fwoosh1

	JMP Boss_FwooshDraw

Boss_Fwoosh1:	
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE Boss_Fwoosh2

	JSR Boss_FwooshHit
	JSR Object_CalcBoundBox
	RTS

Boss_Fwoosh2:	
	JSR Giant_FwooshMakeThwomp

	LDA Boss_FwooshAction, X
	JSR DynJump

	.word Boss_FwooshInit			; 0
	.word Boss_FwooshWait			; 1
	.word Boss_FwooshSwitchSides	; 2
	.word Boss_FwooshMove			; 3
	.word Boss_FwooshWait			; 4
	.word Boss_FwooshDeepBreath		; 5
	.word Boss_FwooshBlow			; 6
	.word Boss_FwooshWait			; 7
	.word Boss_FwooshRecover		; 8
	.word Boss_FwooshDeath			; 9

Boss_UpdatePlatforms:
	LDA Wind
	BEQ Boss_UpdatePlatformsDraw
	BMI Boss_UpdatePlatformsLeft

	LDA Boss_FwooshPlatformState, X
	CMP #$10
	BCS Boss_UpdatePlatformsDraw
	INC Boss_FwooshPlatformState, X
	JMP Boss_UpdatePlatformsDraw

Boss_UpdatePlatformsLeft:	
	LDA Boss_FwooshPlatformState, X
	BEQ Boss_UpdatePlatformsDraw
	
	DEC Boss_FwooshPlatformState, X

Boss_UpdatePlatformsDraw:
	LDY Object_SpriteRAMOffset, X
	
	LDA Boss_FwooshPlatformState, X
	STA Sprite_RAMX + (4 * 8), Y
	ADD #$08
	STA Sprite_RAMX + (4 * 9), Y

	LDA Boss_FwooshPlatformState, X
	ADD #$E0
	STA Sprite_RAMX + (4 * 10), Y
	ADD #$08
	STA Sprite_RAMX + (4 * 11), Y

	LDA #$20
	STA Sprite_RAMY + (4 * 8), Y
	STA Sprite_RAMY + (4 * 9), Y
	STA Sprite_RAMY + (4 * 10), Y
	STA Sprite_RAMY + (4 * 11), Y

	LDA #SPR_PAL3
	STA Sprite_RAMAttr + (4 * 8), Y
	STA Sprite_RAMAttr + (4 * 9), Y
	STA Sprite_RAMAttr + (4 * 10), Y
	STA Sprite_RAMAttr + (4 * 11), Y

	LDA #$E5
	STA Sprite_RAMTile + (4 * 8), Y
	STA Sprite_RAMTile + (4 * 9), Y
	STA Sprite_RAMTile + (4 * 10), Y
	STA Sprite_RAMTile + (4 * 11), Y
	RTS

Boss_FwooshInit:
	LDA #SPR_PAL3
	STA Objects_SpriteAttributes, X

	LDA #$11
	STA Boss_FwooshHealth, X

	LDA #$0C
	STA Objects_SpritesRequested, X

	LDA #$10
	STA ChaseVel_LimitHi, X
	STA Boss_FwooshPlatformState, X

	LDA #$F0
	STA ChaseVel_LimitLo, X

	LDA #BOUND16x32
	STA Objects_BoundBox, X

	LDA #ATTR_ALLWEAPONPROOF
	STA Objects_WeaponAttr, X

	LDA #(ATTR_BUMPNOKILL | ATTR_WINDAFFECTS)
	STA Objects_BehaviorAttr, X

	LDA #$08
	STA Boss_FwooshPoofTimer, X

	INC Boss_FwooshAction, X

	LDA #$80
	STA Objects_Timer, X
	RTS

Boss_FwooshSideAccels:
	.byte $01, $FF

Boss_FwooshSwitchSides:
	LDY #$00
	LDA <Objects_XZ, X
	BPL Boss_FwooshSwitchSides1

	INY

Boss_FwooshSwitchSides1:	
	LDA Boss_FwooshSideAccels, Y
	STA Boss_FwooshAccelerate, X
	ADD <Objects_XZ, X
	STA <Objects_XZ, X

	INC Boss_FwooshAction, X
	JMP Boss_FwooshAnimate

Boss_FwooshMove:
	LDA Boss_FwooshAccelerate, X
	ADD <Objects_XVelZ, X
	CMP #$08
	BEQ Boss_FwooshMoveCapped

	CMP #$F8
	BEQ Boss_FwooshMoveCapped

	STA <Objects_XVelZ, X

Boss_FwooshMoveCapped:
	JSR Object_ApplyXVel
	
	JSR Object_ChasePlayerY
	JSR Boss_FwooshCalcBoundBox	
	JSR Object_AttackOrDefeat

	LDA <Objects_XZ, X
	CMP #$20
	BEQ Boss_FwooshMove1

	CMP #$C0
	BEQ Boss_FwooshMove1
	JMP Boss_FwooshAnimate

Boss_FwooshMove1:
	LDA #$00
	STA <Objects_XVelZ, X
	STA Boss_FwooshAccelerate, X

	LDA #$60
	STA Objects_Timer, X

	INC Boss_FwooshAction, X
	
	JMP Boss_FwooshAnimate

Boss_FwooshWait:
	LDA Wind
	BEQ Boss_FwooshWait0

	BPL Boss_FwooshWindDec

	INC Wind
	JMP Boss_FwooshWait0

Boss_FwooshWindDec:	
	DEC Wind

Boss_FwooshWait0:
	LDA Objects_Timer, X
	BNE Boss_FwooshWait1

	INC Boss_FwooshAction, X

	LDA #$80
	STA Objects_Timer, X

Boss_FwooshWait1:	
	JSR Object_CalcBoundBox
	JSR Object_ChasePlayerY
	JSR Boss_FwooshCalcBoundBox	
	JSR Object_AttackOrDefeat
	
	JMP Boss_FwooshAnimate	

Boss_FwooshBreatheInFrames:
	.byte $00, $01, $02, $02

Boss_FwooshBreatheInWind:
	.byte $F0, $10

Boss_FwooshBreatheOutWind:	
	.byte $18, $E8

Boss_FwooshDeepBreath:
	JSR Boss_FwooshCalcBoundBox	
	JSR Object_AttackOrDefeat

	LDA Objects_Timer, X
	BNE Boss_FwooshDeepBreath1
	
	INC Boss_FwooshAction, X

	LDA #$FF
	STA Objects_Timer, X

Boss_FwooshDeepBreath1:	
	LDA Boss_FwooshBreatheState, X
	CMP #$0F
	BCS Boss_FwooshDeepBreath2

	INC Boss_FwooshBreatheState, X
	LDA Boss_FwooshBreatheState, X
	LSR A
	LSR A
	TAY

	LDA Boss_FwooshBreatheInFrames, Y
	STA Objects_Frame, X
	
Boss_FwooshDeepBreath2:		
	JSR Boss_FwooshCalcBoundBox	
	JSR Object_AttackOrDefeat

	LDY #$00
	LDA <Objects_XZ, X
	BPL Boss_FwooshDeepBreath3

	INY

Boss_FwooshDeepBreath3:
	LDA Boss_FwooshBreatheInWind, Y
	STA Wind

	JMP Boss_FwooshAnimate

Boss_FwooshBlow:
	LDA Player_FlashInv
	BNE Fwoosh_StopBlowing

Boss_NoStopBlowing:	
	LDA Boss_FwooshStage, X
	BNE Fwoosh_TryStage2
	
	JSR Giant_FwooshMakeStage1Enemies
	JMP Boss_FwooshKeepBlowing

Fwoosh_TryStage2:
	CMP #$01
	BNE Fwoosh_TryStage3
	
	JSR Giant_FwooshMakeStage2Enemies
	JMP Boss_FwooshKeepBlowing

Fwoosh_TryStage3:
	JSR Giant_FwooshMakeStage3Enemies

Boss_FwooshKeepBlowing:
	LDA Sound_QLevel2
	ORA #SND_LEVELAIRSHIP
	STA Sound_QLevel2

	LDA Objects_Timer, X
	BNE Boss_FwooshBlow1

Fwoosh_StopBlowing:
	LDA #$01
	STA Boss_FwooshAction, X

	LDA #$20
	STA Objects_Timer, X
	
Boss_FwooshBlow1:
	LDA Boss_FwooshBreatheState, X
	BEQ Boss_FwooshBlow2

	DEC Boss_FwooshBreatheState, X
	LDA Boss_FwooshBreatheState, X
	LSR A
	LSR A
	TAY

	LDA Boss_FwooshBreatheInFrames, Y
	STA Objects_Frame, X

Boss_FwooshBlow2:	
	STA Objects_Frame, X

	JSR Boss_FwooshCalcBoundBox	
	JSR Object_AttackOrDefeat

	LDY #$00
	LDA <Objects_XZ, X
	BPL Boss_FwooshBlow3

	INY

Boss_FwooshBlow3:
	LDA Boss_FwooshBreatheOutWind, Y
	STA Wind

	JMP Boss_FwooshAnimate

Boss_FwooshCalcBoundBox:
	JSR Object_CalcBoundBox

	LDA Objects_BoundLeft, X
	ADD #$08
	STA Objects_BoundLeft, X

	LDA Objects_BoundRight, X
	ADD #$08
	STA Objects_BoundRight, X

	LDA Objects_BoundTop, X
	ADD #$06
	STA Objects_BoundTop, X

	LDA Objects_BoundBottom, X
	SUB #$06
	STA Objects_BoundBottom, X
	RTS

Boss_FwooshPoofX:
	.byte $00, $10, $00, $10

Boss_FwooshPoofY:
	.byte $00, $10, $10, $00

Boss_FwooshSpriteMask:
	.byte SPRITE_0_HINVISIBLE | SPRITE_3_HINVISIBLE, SPRITE_0_HINVISIBLE | SPRITE_3_HINVISIBLE

Boss_FwooshAnimate:
	LDA <Objects_YHiZ, X
	BNE Boss_FwooshDraw

	DEC Boss_FwooshPoofTimer, X
	BNE Boss_FwooshDraw

	INC Boss_FwooshPoofOffset, X
	LDA Boss_FwooshPoofOffset, X
	AND #$03
	TAY

	LDA Boss_FwooshPoofX, Y
	ADD <Objects_XZ, X
	STA Poof_X

	LDA Boss_FwooshPoofY, Y
	ADD <Objects_YZ, X
	STA Poof_Y

	JSR Common_MakePoof

	LDA #$08
	STA Boss_FwooshPoofTimer, X

Boss_FwooshDraw:
	LDY #$00
	LDA Objects_Orientation, X
	BEQ Boss_FwooshDraw1

	INY

Boss_FwooshDraw1:
	LDA Boss_FwooshSpriteMask, Y
	ORA Objects_SpritesHorizontallyOffScreen, X
	STA Objects_SpritesHorizontallyOffScreen, X

	LDA #LOW(Boss_FwooshSprites)
	STA <Giant_TilesLow

	LDA #HIGH(Boss_FwooshSprites)
	STA <Giant_TilesHi

	LDA #$12
	STA PatTable_BankSel + 5

	LDA Objects_Orientation, X
	AND #~SPR_VFLIP
	STA Objects_Orientation, X

	JSR Object_CheckForeground
	JSR Object_DrawGiant
	JSR ObjGiant_Mirror
	RTS

Giant_FwooshMakeThwomp:
	LDY #$02

Giant_FwooshCheckThwomp:	
	LDA Objects_ID + 5, Y
	CMP #OBJ_THWOMP
	BEQ Giant_FwooshMakeThwompRTS

	DEY
	BPL Giant_FwooshCheckThwomp

	LDY #$02

Giant_FwooshFindThwompSlot:	
	LDA Objects_State + 5, Y
	BEQ Giant_FwooshProduceThwomp

	DEY
	BPL Giant_FwooshFindThwompSlot
	BMI Giant_FwooshMakeThwompRTS

Giant_FwooshProduceThwomp:
	LDA #$70
	STA Objects_XZ + 5, Y

	LDA #$00
	STA Objects_XHiZ + 5, Y

	LDA #$C0
	STA Objects_YZ + 5, Y

	LDA #$FF
	STA Objects_YHiZ + 5, Y

	LDA #OBJSTATE_INIT
	STA Objects_State + 5, Y

	LDA #$02
	STA Objects_Property + 5, Y

	LDA #OBJ_THWOMP
	STA Objects_ID + 5, Y

Giant_FwooshMakeThwompRTS:
	RTS	

Giant_FwooshMakeStage1Enemies:
	LDA Objects_Timer, X
	CMP #$FE
	BNE Giant_FwooshMakeStage1Enemies1

	JSR Giant_FwooshMakeFreezie
	RTS

Giant_FwooshMakeStage1Enemies1:
	CMP #$A0
	BNE Giant_FwooshMakeStage1Enemies2

	JSR Giant_FwooshMakeFuzzy
	RTS

Giant_FwooshMakeStage1Enemies2:
	CMP #$20
	BNE Giant_FwooshMakeStage1EnemiesRTS

	JSR Giant_FwooshMakeFreezie

Giant_FwooshMakeStage1EnemiesRTS:	
	RTS

Giant_FwooshMakeStage2Enemies:	
	LDA Objects_Timer, X
	CMP #$F0
	BNE Giant_FwooshMakeStage2Enemies1

	JSR Giant_FwooshMakeIceWall
	RTS

Giant_FwooshMakeStage2Enemies1:
	CMP #$A0
	BNE Giant_FwooshMakeStage2Enemies2

	JSR Giant_FwooshMakeIceWall
	RTS

Giant_FwooshMakeStage2Enemies2:	
	CMP #$80
	BNE Giant_FwooshMakeStage2Enemies3

	JSR Giant_FwooshMakeFuzzy
	RTS

Giant_FwooshMakeStage2Enemies3:	
	CMP #$40
	BNE Giant_FwooshMakeStage2EnemiesRTS

	JSR Giant_FwooshMakeIceWall

Giant_FwooshMakeStage2EnemiesRTS:
	RTS	

Giant_FwooshMakeStage3Enemies:	
	LDA Objects_Timer, X
	CMP #$FE
	BNE Giant_FwooshMakeStage3Enemies1

	JSR Giant_FwooshMakeIceWall
	RTS

Giant_FwooshMakeStage3Enemies1:	
	CMP #$B0
	BNE Giant_FwooshMakeStage3Enemies2

	JSR Giant_FwooshMakeFreezie
	RTS

Giant_FwooshMakeStage3Enemies2:
	CMP #$90
	BNE Giant_FwooshMakeStage3Enemies3
	
	JSR Giant_FwooshMakeIceWall
	RTS

Giant_FwooshMakeStage3Enemies3:
	CMP #$40
	BNE Giant_FwooshMakeStage3Enemies4

	JSR Giant_FwooshMakeFreezie
	RTS

Giant_FwooshMakeStage3Enemies4
	CMP #$20
	BNE Giant_FwooshMakeStage3Enemies5

	JSR Giant_FwooshMakeFuzzy

Giant_FwooshMakeStage3Enemies5:	
	RTS	

Giant_FwooshMakeFreezie:
	JSR Object_FindEmptyY
	BCC Giant_FwooshMakeFreezieRTS

Giant_FwooshProduceFreezie:
	LDA <Objects_XZ, X
	BMI Fwoosh_FreezieOtherSide

	LDA #$18
	STA Objects_XZ, Y
	BNE Fwoosh_FreezieXHi

Fwoosh_FreezieOtherSide:
	LDA #$D8
	STA Objects_XZ, Y

Fwoosh_FreezieXHi:
	LDA #$00
	STA Objects_XHiZ, Y

	LDA #$A0
	STA Objects_YZ, Y

	LDA #$00
	STA Objects_YHiZ, Y

	LDA #OBJSTATE_INIT
	STA Objects_State, Y

	LDA #$00
	STA Objects_Property, Y

	LDA #OBJ_FREEZIE
	STA Objects_ID , Y

Giant_FwooshMakeFreezieRTS:
	RTS	


Giant_FwooshMakeIceWall:
	JSR Object_FindEmptyY
	BCC Giant_FwooshMakeIceWallRTS

Giant_FwooshProduceIceWall:
	LDA <Objects_XZ, X
	BMI Fwoosh_IceWallOtherSide

	LDA #$18
	STA Objects_XZ, Y

	LDA #$18
	STA Objects_XVelZ, Y
	BNE Fwoosh_IceWallXHi

Fwoosh_IceWallOtherSide:
	LDA #$D8
	STA Objects_XZ, Y

	LDA #$E8
	STA Objects_XVelZ, Y

Fwoosh_IceWallXHi:
	LDA #$00
	STA Objects_XHiZ, Y

	LDA #$80
	STA Objects_YZ, Y

	LDA #$00
	STA Objects_YHiZ, Y

	LDA #OBJSTATE_FRESH
	STA Objects_State, Y

	LDA #$00
	STA Objects_Property, Y

	LDA #OBJ_ICEWALL
	STA Objects_ID , Y

Giant_FwooshMakeIceWallRTS:
	RTS	


Giant_FwooshMakeFuzzy:
	LDY #$04

Giant_FwooshMakeFuzzyLoop:
	LDA Objects_ID, Y
	CMP #OBJ_FUZZY
	BEQ Giant_FwooshMakeFuzzyRTS

	LDA Objects_State, Y
	BEQ Giant_FwooshProduceFuzzy

Fwoosh_NotFuzzy:
	DEY
	BPL Giant_FwooshMakeFuzzyLoop
	RTS

Giant_FwooshProduceFuzzy:
	TYA
	TAX

	JSR Object_New

	LDX <CurrentObjectIndexZ

	LDA <Objects_XZ, X
	BMI Fwoosh_FuzzyOtherSide

	LDA #$18
	STA Objects_XZ, Y

	BNE Fwoosh_FuzzyXHi

Fwoosh_FuzzyOtherSide:
	LDA #$D8
	STA Objects_XZ, Y

Fwoosh_FuzzyXHi:
	LDA #$00
	STA Objects_XHiZ, Y

	LDA #$A0
	STA Objects_YZ, Y

	LDA #$00
	STA Objects_YHiZ, Y

	LDA #OBJSTATE_FROZENSOLID
	STA Objects_State, Y

	LDA #OBJ_FUZZY
	STA Objects_ID , Y

	LDA #BOUND16x16
	STA Objects_BoundBox, Y

Giant_FwooshMakeFuzzyRTS:
	RTS	

Poof_XVel:
	.byte $E0, $20, $20, $E0	

Poof_YVel:
	.byte $E0, $E0, $20, $20

Fwoosh_HealthStage:
	.byte $02, $02, $02, $02, $02, $02
	.byte $01, $01, $01, $01, $01, $01
	.byte $00, $00, $00, $00, $00, $00

Boss_FwooshHit:
	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	DEC Boss_FwooshHealth, X

	LDA Objects_PlayerProjHit, X
	CMP #HIT_EXPLOSION
	BNE Boss_FwooshHit1

	LDA #$00
	STA Objects_PlayerProjHit, X

	LDA Boss_FwooshHealth, X
	SUB #$06
	STA Boss_FwooshHealth, X

Boss_FwooshHit1:
	LDY Boss_FwooshHealth, X
	BPL Boss_FwooshSetStage

	LDA #$80
	STA Objects_Timer, X

	LDA #$09
	STA Boss_FwooshAction, X
	JMP Boss_FwooshDraw

Boss_FwooshSetStage:	
	LDA Fwoosh_HealthStage, Y
	STA Boss_FwooshStage, X

	LDA #$40
	STA Objects_Timer, X
	STA Objects_Timer2, X

	LDA #$07
	STA Boss_FwooshAction, X

	LDA #$01
	STA <Objects_YHiZ, X

	LDA #$00
	STA <Objects_YVelZ, X
	STA <Objects_XVelZ, X
	STA Boss_FwooshBreatheState, X
	STA Objects_Frame, X

	LDX #$03
	LDY #$05

Hit_LoopPoofs:
	LDA SpecialObj_ID, Y
	CMP #SOBJ_POOF
	BNE Hit_NotAPoof

	LDA Poof_XVel, X
	STA SpecialObj_XVel, Y
	
	LDA Poof_YVel, X
	STA SpecialObj_YVel, Y

	LDA #$20
	STA SpecialObj_Timer, X
	DEX

Hit_NotAPoof:
	DEY
	BPL Hit_LoopPoofs

	LDX <CurrentObjectIndexZ

	LDA Boss_FwooshAccelerate, X
	BEQ FwooshHit_Relocate
	BMI FwooshHit_RelocateLeft
	BPL FwooshHit_RelocateRight

FwooshHit_Relocate:
	LDA <Objects_XZ, X
	BPL FwooshHit_RelocateRight

FwooshHit_RelocateLeft:
	LDA #$20
	STA <Objects_XZ, X
	RTS

FwooshHit_RelocateRight:
	LDA #$C0
	STA <Objects_XZ, X
	RTS	

Boss_FwooshRecover:
	LDA #$04
	STA Boss_FwooshAction, X

	LDA #$00
	STA <Objects_YHiZ, X
	RTS	

Boss_FwooshFlash:
	.byte SPR_PAL1, SPR_PAL3

Boss_FwooshDeath:
	LDA Objects_Timer, X
	BEQ Boss_FwooshDeathExplode

	LSR A
	LSR A
	AND #$01
	TAY

	LDA Boss_FwooshFlash, Y
	STA Objects_SpriteAttributes, X
	JSR Boss_FwooshDraw
	RTS

Boss_FwooshDeathExplode:
	LDA #$FF
	STA Objects_Timer2, X

	LDA #$80
	STA CompleteLevelTimer

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	LDA #$18
	STA Objects_Timer,X

	LDA Sound_QLevel1
	ORA #SND_LEVELBABOOM
	STA Sound_QLevel1

	LDA #$10
	STA RotatingColor_Cnt

	LDA #$64
	STA Exp_Earned
	JMP Object_Explode

Giant_PiranhaSprites:
	.byte $C1, $C3, $C3, $C1, $E1, $E3, $E3, $E1
	.byte $C5, $C7, $C7, $C5, $E5, $E7, $E7, $E5
	

Giant_PiranhaStemSprites:
	.byte $C9, $CB, $CB, $C9, $C9, $CB, $CB, $C9
	.byte $C9, $CB, $CB, $C9, $C9, $CB, $CB, $C9

Giant_PiranhaAction = Objects_Data1
Giant_PiranhaFrames = Objects_Data2
Giant_PiranhaTicker = Objects_Data3
Giant_PiranhaSnowAttack = Objects_Data4
Giant_PiranhaTopLeftProp = Objects_Data5
Giant_PiranhaTopRightProp = Objects_Data6
Giant_PiranhaChompGrab = Objects_Data7
Giant_PiranhaChompIndex = Objects_Data8
Giant_PiranhaSpawnTimer = Objects_Data10
Giant_PiranhaHits = Objects_Data11
Giant_PiranhaFreezeBlocks = Objects_Data12
Giant_PiranhaBlocksBroken = Objects_Data13

Giant_Piranha:
	LDA <Player_HaltGameZ
	BEQ Giant_PiranhaNorm

	JMP Giant_PiranhaDraw

Giant_PiranhaRTS:	
	RTS

Giant_PiranhaNorm:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE Giant_PiranhaNorm1

	LDA #$80
	STA Objects_Timer2, X

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	INC Giant_PiranhaHits, X

Giant_PiranhaNorm1:
	JSR Giant_PiranhaSpawnChomp

	LDA Giant_PiranhaAction, X
	JSR DynJump

	.word Giant_PiranhaInit
	.word Giant_WaitUnder
	.word Giant_PiranhaAttackUp
	.word Giant_PiranhaWait
	.word Giant_PiranhaAttackDown
	.word Giant_PiranhaFreezeBridge
	.word Giant_PiranhaDie

Giant_PiranhaInit:	
	LDA #SPR_PAL1
	STA Objects_SpriteAttributes, X

	LDA #ATTR_STOMPPROOF
	STA Objects_WeaponAttr, X
	
	LDA #$E0
	STA <Objects_YZ, X

	LDA #$00
	STA <Objects_YHiZ, X

	LDA #$04
	STA Objects_Health, X

	INC Giant_PiranhaAction, X

	LDA #$C0
	STA Objects_Timer, X

	LDA #$10
	STA Objects_SpritesRequested, X

	LDA #$20
	STA Giant_PiranhaSpawnTimer, X

	LDA #BOUND32X64
	STA Objects_BoundBox, X
	RTS


Giant_WaitUnder:
	LDA Objects_Timer, X
	BNE Giant_WaitUnder1

	INC Giant_PiranhaAction, X

	LDA Player_X
	AND #$F0
	STA <Objects_XZ, X

Giant_WaitUnder1:
	JSR Giant_PiranhaDetectChomps
	BCC Giant_WaitUnder2

	LDA Objects_Timer, X
	CMP #$20
	BCS Giant_WaitUnder2

	LDA Objects_SpriteX, Y
	ADD #$04
	STA <Temp_Var1

	LDA Objects_SpriteY, Y
	SUB #$10
	STA <Temp_Var2

	JSR Object_GetUnusedSprite

	LDA #$E9
	STA Sprite_RAMTile, Y

	LDA #SPR_PAL1
	STA Sprite_RAMAttr, Y

	LDA <Temp_Var1
	STA Sprite_RAMX, Y

	LDA <Temp_Var2
	STA Sprite_RAMY, Y

Giant_WaitUnder2:	
	JMP Giant_PiranhaDraw

Giant_PiranhaAttackUp:
	LDA #$C0
	STA <Objects_YVelZ, X

	JSR Object_ApplyYVel_NoGravity
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

	LDA Giant_PiranhaHits, X
	CMP #$02
	BCC Giant_PiranhaAttackUp0
	
	JSR Giant_PiranhaBreakBlocks

Giant_PiranhaAttackUp0:
	LDA <Objects_YZ, X
	CMP #$88
	BCS Giant_PiranhaAttackUpRTS

	LDA #$20
	STA Objects_Timer, X

	LDA #$00
	STA <Objects_YVelZ, X
	
	INC Giant_PiranhaAction, X

Giant_PiranhaAttackUpRTS:
	JMP Giant_PiranhaAnimate

Giant_PiranhaWait:	
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Giant_ParaChompInteract

	LDA Objects_Timer, X
	BNE Giant_PiranhaWaitDraw

	INC Giant_PiranhaAction, X
	
	LDA Giant_PiranhaHits, X
	CMP #$04
	BCC Giant_PiranhaWait1

	LDA #$06
	STA Giant_PiranhaAction, X
	
	LDA #$40
	STA Objects_Timer2, X
	
Giant_PiranhaWait1:	
	LDA #$20
	STA Objects_Timer, X

Giant_PiranhaWaitDraw:	
	JMP Giant_PiranhaAnimate

Giant_PiranhaAttackDown:
	JSR Object_ApplyYVel_NoGravity
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

	LDA Giant_PiranhaChompGrab, X
	BEQ Giant_PiranhaNoPull

	LDY Giant_PiranhaChompIndex, X
	LDA Objects_YZ, Y
	ADD #$02
	STA Objects_YZ, Y

	LDA Objects_YHiZ, Y
	ADC #$00
	STA Objects_YHiZ, Y

	DEC Giant_PiranhaChompGrab, X

Giant_PiranhaNoPull:	
	LDA #$20
	STA <Objects_YVelZ, X

	LDA <Objects_YZ, X
	CMP #$E0
	BCC Giant_PiranhaAttackDownRTS

	LDA Objects_Timer2, X
	BNE Giant_PiranhaHitAction

Giant_Stage3:
	LDA #$01
	STA Giant_PiranhaAction, X

	LDA #$80
	STA Objects_Timer, X

	LDA #$00
	STA Giant_PiranhaChompGrab, X

	JSR Giant_PiranhaReverseSnow

Giant_PiranhaAttackDownRTS:
	JMP Giant_PiranhaAnimate
	
Giant_PiranhaHitAction:	
	LDA #$04
	STA Objects_Health, X

	LDA Giant_PiranhaHits, X

	JSR DynJump

	.word Giant_Stage1
	.word Giant_Stage2
	.word Giant_Stage3
	.word Giant_Stage4

Giant_Stage1:
Giant_Stage2:
	LDA #$0F
	STA Giant_PiranhaFreezeBlocks, X
	
	LDA #$05
	STA Giant_PiranhaAction, X
	RTS

Giant_Stage4:
	JSR Giant_PiranhaSpawnWeather

	LDA #$05
	STA Giant_PiranhaAction, X
	RTS

Giant_PiranhaPalettes:
	.byte SPR_PAL2, SPR_PAL3

Giant_PiranhaAnimate:
	LDA Giant_PiranhaChompGrab, X
	BNE Giant_PiranhaPaletteFlash

	INC Giant_PiranhaFrames, X
	LDA Giant_PiranhaFrames, X
	AND #$08
	LSR A
	LSR A
	LSR A
	STA Objects_Frame, X

Giant_PiranhaPaletteFlash:
	LDA Objects_Timer2, X
	LSR A
	LSR A
	AND #$01
	TAY

	LDA Giant_PiranhaPalettes, Y
	STA Objects_SpriteAttributes, X

Giant_PiranhaDraw:
	LDA #LOW(Giant_PiranhaSprites)
	STA <Giant_TilesLow

	LDA #HIGH(Giant_PiranhaSprites)
	STA <Giant_TilesHi

	LDA #$58
	STA PatTable_BankSel + 5

	LDA Objects_Orientation, X
	AND #~SPR_VFLIP
	STA Objects_Orientation, X

	JSR Object_DrawGiant
	JSR ObjGiant_Mirror

	LDA #LOW(Giant_PiranhaStemSprites)
	STA <Giant_TilesLow

	LDA #HIGH(Giant_PiranhaStemSprites)
	STA <Giant_TilesHi

	LDA <Objects_YZ, X
	ADD #$20
	STA <Objects_YZ, X

	LDA Object_SpriteRAMOffset, X
	ADD #$20
	STA Object_SpriteRAMOffset, X

	JSR Object_DrawGiant
	JSR ObjGiant_Mirror


	LDA <Objects_YZ, X
	SUB #$20
	STA <Objects_YZ, X
	RTS

Giant_PiranhaDetectChomps:
	LDY #$04

Giant_PiranhaDetectChomps1:
	CPY CurrentObjectIndexZ
	BEQ Giant_PiranhaDetectChomps2
	
	LDA Objects_State, Y
	CMP #OBJSTATE_NORMAL
	BNE Giant_PiranhaDetectChomps2

	LDA Objects_ID, Y
	CMP #OBJ_PARACHOMP
	SEC
	RTS

Giant_PiranhaDetectChomps2:
	DEY
	BPL Giant_PiranhaDetectChomps1
	CLC
	RTS

Giant_ParaChompInteract:	
	JSR Giant_PiranhaDetectChomps
	BCC Giant_ParaChompDetectRTS

	JSR Object_DetectObjects
	BCC Giant_ParaChompDetectRTS

	LDA ParaChomp_HitDetection, Y
	BEQ Giant_ParaChompKilled

	LDA #$00
	STA Objects_YVelZ, Y
	STA ParaChomp_Frame, Y
	STA Objects_Frame, X

	LDA #$20
	STA Giant_PiranhaChompGrab, X

	TYA
	STA Giant_PiranhaChompIndex, X

Giant_ParaChompDetectRTS:	
	RTS	

Giant_ParaChompKilled:
	TYA
	TAX

	JSR Object_GetKilled

	LDA Sound_QPlayer
	ORA #SND_PLAYERKICK
	STA Sound_QPlayer

	LDX <CurrentObjectIndexZ

	LDA #$60
	STA Objects_Timer2, X

	INC Giant_PiranhaHits, X

	LDA #$00
	STA Player_IsClimbingObject
	RTS
	
Giant_PiranhaSpawnPoints:
	.byte $30, $50, $70, $90, $B0, $40, $60, $80

Giant_PiranhaSpawnChomp:
	LDA Giant_PiranhaSpawnTimer, X
	BEQ Giant_PiranhaCheckChomps

	CMP #$01
	BNE Giant_PiranhaNoSpawn

	JSR Object_FindEmptyY
	BCC Giant_PiranhaSpawnChompRTS

	LDA #OBJ_PARACHOMP
	STA Objects_ID, Y

	LDA #$00
	STA Objects_ExpPoints, Y

	LDA #OBJSTATE_FRESH
	STA Objects_State, Y

	LDA RandomN, Y
	AND #$07
	TAX

	LDA Giant_PiranhaSpawnPoints, X
	STA Objects_XZ, Y
	STA <Poof_X

	LDA #$40
	STA Objects_YZ, Y
	STA <Poof_Y

	LDA #$00
	STA Objects_XHiZ, Y
	STA Objects_YHiZ, Y

	JSR Common_MakePoof

	LDA <Poof_Y
	ADD #$18
	STA <Poof_Y

	JSR Common_MakePoof

	LDA <Poof_Y
	ADD #$18
	STA <Poof_Y
	
	JSR Common_MakePoof

	LDX <CurrentObjectIndexZ

Giant_PiranhaNoSpawn:
	DEC Giant_PiranhaSpawnTimer, X

Giant_PiranhaSpawnChompRTS:	
	RTS	

Giant_PiranhaCheckChomps:
	LDY #$04

Giant_PiranhaCheckChomps0:
	LDA Objects_State, Y
	BEQ Giant_PiranhaCheckChomps1

	LDA Objects_ID, Y
	CMP #OBJ_PARACHOMP
	BEQ Giant_PiranhaCheckChompsRTS
	
Giant_PiranhaCheckChomps1:
	DEY
	BPL Giant_PiranhaCheckChomps0

Giant_PiranhaCheckChomps2:
	LDA #$80
	STA Giant_PiranhaSpawnTimer, X

Giant_PiranhaCheckChompsRTS:
	RTS	

Giant_PiranhaFreezeBridge:
	LDA Objects_Timer, X
	BNE Giant_PiranhaFreezeBridgeRTS

	LDA #$52
	STA Block_UpdateValue
	STA Block_NeedsUpdate	 ; Store type of block change!

	LDA Giant_PiranhaFreezeBlocks, X
	ASL A
	ASL A
	ASL A
	ASL A
	STA Block_ChangeX
	STA <Poof_X

	LDA #$B0		; Align to nearest grid coordinate
	STA Block_ChangeY
	STA <Poof_Y

	LDA #$00
	STA Block_ChangeXHi
	STA Block_ChangeYHi

	JSR Common_MakePoof

	LDA #$08
	STA Objects_Timer, X 

	DEC Giant_PiranhaFreezeBlocks, X
	BPL Giant_PiranhaFreezeBridgeRTS

	LDA #$01
	STA Giant_PiranhaAction, X

	LDA #$80
	STA Objects_Timer, X 

Giant_PiranhaFreezeBridgeRTS:	
	RTS

Giant_PiranhaBreakBlocks:
	LDA <Objects_XZ, X
	ADD #$08
	STA Block_DetectX

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Block_DetectXHi

	LDA <Objects_YZ, X
	ADD #$20
	STA Block_DetectY
	
	LDA <Objects_YHiZ, X
	ADC #$00
	STA Block_DetectYHi
	
	JSR Object_DetectTile
	CMP #(TILE_PROP_SOLID_TOP | TILE_PROP_SLICK)
	BEQ Giant_PiranhaBreakBlock

Giant_PiranhaBreakBlocks1:
	LDA Block_DetectX
	ADD #$10
	STA Block_DetectX

	LDA Block_DetectXHi
	ADC #$00
	STA Block_DetectXHi

	JSR Object_DetectTile
	CMP #(TILE_PROP_SOLID_TOP | TILE_PROP_SLICK)
	BEQ Giant_PiranhaBreakBlock

Giant_PiranhaBreakBlocks2:	
	RTS

Giant_PiranhaBreakBlock:
	LDA Giant_PiranhaBlocksBroken, X
	CMP #$04
	BCS Giant_PiranhaBreakBlockRTS

	INC Giant_PiranhaBlocksBroken, X
	LDA #$41
	JSR Object_ChangeBlock

	LDA Tile_DetectionX
	STA Debris_X
	
	LDA Tile_DetectionY
	STA Debris_Y

	JSR Common_MakeIce

Giant_PiranhaBreakBlockRTS:	
	RTS	

Giant_PiranhaSpawnWeather:
	JSR Object_FindEmptyY
	BCC Giant_PiranhaSpawnWeatherRTS

	LDA #OBJ_WEATHER
	STA Objects_ID, Y

	LDA #$01
	STA Objects_Property, Y

	LDA #OBJSTATE_FRESH
	STA Objects_State, Y

	LDA #$C0
	STA Objects_YZ, Y

	LDA #$00
	STA Objects_YHiZ, Y
	STA Objects_XHiZ, Y

Giant_PiranhaSpawnWeatherRTS:
	RTS	

Giant_PiranhaReverseSnow:
	LDY #$04

Giant_PiranhaReverseSnow1:	
	LDA Objects_ID, Y
	CMP #OBJ_WEATHER
	BEQ Giant_PiranhaReverseSnow2

	DEY
	BPL Giant_PiranhaReverseSnow1
	RTS	

Giant_PiranhaReverseSnow2:	
	LDA Wind_Speed, Y
	JSR Negate
	STA Wind_Speed, Y

	LDA Wind_ExtraVel, Y
	JSR Negate
	STA Wind_ExtraVel, Y
	RTS

Giant_PiranhaDie:
	LDA Objects_Timer2, X
	BNE Giant_PiranhaDieRTS

	LDA #$80
	STA CompleteLevelTimer

	LDA #$18
	STA Objects_Timer,X

	LDA Sound_QLevel1
	ORA #SND_LEVELBABOOM
	STA Sound_QLevel1

	LDA #$64
	STA Exp_Earned

	JSR Object_Explode
	
	LDA #$FF
	STA Objects_Timer2, X
	RTS

Giant_PiranhaDieRTS:
	LDA #$80
	STA Giant_PiranhaSpawnTimer, X
	JMP Giant_PiranhaAnimate

Boss_BullyAction = Objects_Data1
Boss_BullyAnimTicks = Objects_Data2
Boss_BullyBounces = Objects_Data3

Boss_BullyPals:
	.byte SPR_PAL1, SPR_PAL3

Boss_BullySprites:
	.byte $C1, $C3, $C5, $C7, $E1, $E3, $E5, $E7
	.byte $C1, $C3, $C5, $C7, $C9, $CB, $E9, $EB
	.byte $CD, $CF, $CF, $CD, $ED, $EF, $EF, $ED
	.byte $CD, $CF, $CF, $CD, $C9, $CB, $CB, $C9
	
Boss_Bully:
	LDA <Player_HaltGameZ
	BEQ Boss_BullyDoAction

	LDA Boss_BullyAction, X
	JSR DynJump

Boss_BullyDrawOnly:
	.word Boss_BullyDraw
	.word Boss_BullyDraw
	.word Boss_BullyDraw
	.word Boss_BullyDraw
	.word Boss_BullyDraw
	.word Boss_BullyDraw
	.word Boss_BullyDrawJump
	.word Boss_BullyDrawJump
	.word Boss_BullyDrawJump
	.word Boss_BullyDraw

Boss_BullyDoAction:
	LDA <Objects_XHiZ, X
	CMP <Player_XHi
	BEQ Boss_BullyDoAction2

	LDA #$05
	STA Boss_BullyAction, X

	LDA #$70
	STA Objects_Timer, X

	LDA #$E0
	STA <Objects_YZ, X

	LDA #$FF
	STA <Objects_YHiZ, X

	LDA #$00
	STA Objects_Frame, X

	LDA <Player_X
	ADD #$80
	CMP #$D0
	BCS Boss_BullyDoAction1

	CMP #$30
	BCC Boss_BullyDoAction1
	
	STA <Objects_XZ, X

	SEC

	LDA <Objects_XHiZ, X
	CMP <Player_XHi
	BCC Boss_BullyDoAction1

	SUB #$01
	STA <Objects_XHiZ, X

Boss_BullyDoAction1:
	RTS

Boss_BullyDoAction2:	
	LDA Boss_BullyAction, X
	JSR DynJump

	.word Boss_BullyInit 		; $00
	.word Boss_BullyMarch		; $01
	.word Boss_BullyCharging	; $02
	.word Boss_BullyCharge		; $03
	.word Boss_BullyBounceBack	; $04
	.word Boss_BullyWait		; $05
	.word Boss_BullyJumpPrep	; $06
	.word Boss_BullyJump		; $07
	.word Boss_BullyBounce		; $08
	.word Boss_BullyBounceWait	; $09
	.word Boss_BullyDie			; $0A

Boss_BullyInit:
	LDA #$F0
	STA Objects_XVelZ, X

	LDA #$00
	STA Objects_ExpPoints, X

	LDA #$03
	STA Objects_Health, X

	INC Boss_BullyAction, X

	LDA #$08
	STA Objects_SpritesRequested, X

	LDA #ATTR_ALLWEAPONPROOF
	STA Objects_WeaponAttr, X

	LDA #(ATTR_EXPLOSIONPROOF | ATTR_SHELLPROOF | ATTR_BUMPNOKILL)
	STA Objects_BehaviorAttr, X

	LDA #BOUND32x32
	STA Objects_BoundBox, X

	LDA #$20
	STA Objects_Timer, X
	STA Objects_Global, X
	RTS


Boss_BullyBounceCounts:
	.byte $02, $01, $04, $03

Boss_BullyActionTypes:
	.byte $02, $01, $06, $01

Boss_BullyActionTimers:
	.byte $20, $40, $30, $40

Boss_BullyMarch:
	JSR Object_FaceDirectionMoving
	JSR Boss_BullyMove
	
	LDA Objects_Timer, X
	BNE Boss_BullyMarch1

	LDA RandomN
	AND #$03
	TAY

	LDA Boss_BullyActionTypes, Y
	STA Boss_BullyAction, X
	CMP #$06
	BNE Boss_BullyMarch0

Boss_BullyMarch0:	

	LDA Boss_BullyActionTimers, Y
	STA Objects_Timer, X

Boss_BullyMarch1:
	JMP Boss_BullyAnimate


Boss_BullyMove:
	LDA Objects_SpritesVerticallyOffScreen, X
	BEQ Boss_BullyMoveNotOffScreen

	LDA <Objects_YHiZ, X
	BEQ Boss_BullyMoveNotOffScreen
	BMI Boss_BullyMoveNotOffScreen

	LDA <Objects_YZ, X
	CMP #$C0
	BCC Boss_BullyMoveNotOffScreen

	DEC <Objects_XHiZ, X

Boss_BullyMoveNotOffScreen:
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles

	LDA Object_HorzTileProp, X
	CMP #(TILE_PROP_LAVA)
	BNE Boss_BullyMoveRTS

	LDA #$0A
	STA Boss_BullyAction, X

	LDA #$80
	STA Objects_Timer, X

Boss_BullyMoveRTS:
	RTS	

Boss_BullyCharging:
	LDA #$00
	STA	<Objects_XVelZ, X
	
	JSR Object_FacePlayer
	JSR Boss_BullyMove

	LDA Objects_Timer, X
	BNE Boss_BullyCharging1

	JSR Object_MoveDirectionFacing
	
	LDA <Objects_XVelZ, X
	JSR Double_Value
	JSR Double_Value
	JSR Double_Value
	STA <Objects_XVelZ, X

	LDA #$03
	STA Boss_BullyAction, X

Boss_BullyCharging1:	
	JMP Boss_BullyAnimateFast

Boss_BullyCharge:
	JSR Object_FaceDirectionMoving
	JSR Boss_BullyMove
	JSR Shell_KillOthers
	BCC Boss_BullyCharge0

	TYA
	TAX
	JSR Object_StarBurstDeath

	LDX <CurrentObjectIndexZ

Boss_BullyCharge0:	
	LDA Object_HorzTileProp, X
	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_STONE)
	BNE Boss_Bully_Charge3

	LDA #TILE_ITEM_BRICK
	STA Tile_LastProp

	JSR Object_Reverse

	LDA <Objects_TilesDetectZ, X
	AND #HIT_LEFTWALL
	BNE Boss_BullyCharge1

	LDA Objects_BoundRight, X
	STA Tile_DetectionX

	LDA Objects_BoundRightHi, X
	STA Tile_DetectionXHi
	JMP Boss_BullyCharge2

Boss_BullyCharge1:
	LDA Objects_BoundLeft, X
	STA Tile_DetectionX

	LDA Objects_BoundLeftHi, X
	STA Tile_DetectionXHi

Boss_BullyCharge2:	
	LDA Objects_BoundBottom, X
	SUB #$08
	STA Tile_DetectionY

	LDA Objects_BoundBottomHi, X
	SBC #$00
	STA Tile_DetectionYHi

	JSR Object_DirectBumpBlocks
	JMP Boss_Bully_Charge4
	
Boss_Bully_Charge3:
	CMP #(TILE_PROP_SOLID_ALL)
	BNE Boss_Bully_Charge4

	LDA <Objects_XVelZ, X
	JSR Half_Value
	JSR Half_Value
	STA <Objects_XVelZ, X

	LDA #$10
	STA Level_Vibration

	LDA Sound_QLevel1
	ORA #SND_LEVELBABOOM
	STA Sound_QLevel1

	JSR Object_FlipFace

	LDA #$E0
	STA <Objects_YVelZ, X

	LDA #$04
	STA Boss_BullyAction, X 

	JSR BossBully_MakeBobomb

Boss_Bully_Charge4:	
	JMP Boss_BullyAnimateFast

Boss_BullyBounceBack:
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_DetectTiles

	LDA <Objects_YVelZ, X
	BEQ Boss_BullyBounceBack1

	JSR Object_DampenVelocity
	JSR Object_InteractWithTiles
	JMP Boss_BullyDraw

Boss_BullyBounceBack1:
	LDA #$05
	STA Boss_BullyAction, X

	LDA #$20
	STA Objects_Timer, X

Boss_BullyBounceBack2:
	JMP Boss_BullyDraw

Boss_BullyWait:
	LDA #$00
	STA <Objects_XVelZ, X
	
	JSR Boss_BullyMove

	LDA Objects_Timer, X
	BNE Boss_BullyWait1

	LDA #$01
	STA Boss_BullyAction, X

	LDA #$40
	STA Objects_Timer, X

	JSR Object_MoveTowardsPlayerFast

Boss_BullyWait1:
	JMP Boss_BullyDraw

Boss_BullyJumpPrep:
	LDA #$00
	STA <Objects_XVelZ, X

	JSR Boss_BullyMove

	LDA Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ Boss_BullyJumpPrep1

	LDA #$F0
	STA <Objects_YVelZ, X

Boss_BullyJumpPrep1:
	LDA #$01
	STA Objects_Frame, x

	LDA Objects_Timer, X
	BNE Boss_BullyJumpPrep2

	INC Boss_BullyAction, X

Boss_BullyJumpPrep2:
	JMP Boss_BullyDraw

Boss_BullyJump:
	JSR Object_MoveTowardsPlayerFast
	
	LDA #$A0
	STA Objects_YVelZ, X

	JSR Boss_BullyMove

	LDA RandomN + 1
	AND #$03
	TAY

	LDA Boss_BullyBounceCounts, Y
	STA Boss_BullyBounces, X

	INC Boss_BullyAction, X
	JMP Boss_BullyDrawJump

Boss_BullyBounce:
	JSR Boss_BullyMove
	JSR Shell_KillOthers
	BCC Boss_BullyBounceA

	TYA
	TAX
	JSR Object_StarBurstDeath

	LDX <CurrentObjectIndexZ

Boss_BullyBounceA:
	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ Boss_BullyBounce2

	LDA #$10
	STA Level_Vibration

	LDA Sound_QLevel1
	ORA #SND_LEVELBABOOM
	STA Sound_QLevel1

	LDA Player_InAir
	BNE Boss_BullyBounce0

	LDA #$20
	STA Player_VibeDisable

Boss_BullyBounce0:
	LDA Boss_BullyBounces, X
	BNE Boss_BullyBounce1

	INC Boss_BullyAction, X

	LDA #$20
	STA Objects_Timer, X

	JSR BossBully_MakeBobomb
	JMP Boss_BullyBounce2

Boss_BullyBounce1:
	DEC Boss_BullyBounces, X

	LDA #$A0
	STA <Objects_YVelZ, X

Boss_BullyBounce2:
	JMP Boss_BullyDrawJump

Boss_BullyBounceWait:
	LDA #$00
	STA <Objects_XVelZ, X

	JSR Boss_BullyMove

	LDA Objects_Timer, X
	BNE Boss_BullyBounceWait1

	LDA #$01
	STA Boss_BullyAction, X

	LDA #$40
	STA Objects_Timer, X
	
	JSR Object_MoveTowardsPlayerFast


Boss_BullyBounceWait1:
	JMP Boss_BullyDrawJump

Boss_BullyAnimateFast:
	INC Boss_BullyAnimTicks, X

Boss_BullyAnimate:
	INC Boss_BullyAnimTicks, X
	
	LDA Boss_BullyAnimTicks, X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame, X

Boss_BullyDraw:
	LDA #SPR_PAL2
	STA Objects_SpriteAttributes, X

	LDA #LOW(Boss_BullySprites)
	STA <Giant_TilesLow

	LDA #HIGH(Boss_BullySprites)
	STA <Giant_TilesHi

	LDA #$1B
	STA PatTable_BankSel + 5

	LDA Objects_Orientation, X
	AND #~SPR_VFLIP
	STA Objects_Orientation, X

	JSR Object_CheckForeground
	JSR Object_DrawGiant

	LDY Object_SpriteRAMOffset, X
	
	LDA Sprite_RAMAttr, Y
	AND #(SPR_HFLIP)
	ORA #SPR_PAL3
	STA Sprite_RAMAttr, Y
	STA Sprite_RAMAttr + 4, Y
	STA Sprite_RAMAttr + 8, Y
	STA Sprite_RAMAttr + 12, Y
	RTS

Boss_BullyDrawJump:
	LDY #$02

	LDA <Objects_YVelZ, X
	BMI Boss_BullyDrawJump1

	INY

Boss_BullyDrawJump1:
	TYA
	STA Objects_Frame, X

	LDA Objects_Orientation, X
	AND #~SPR_HFLIP
	STA Objects_Orientation, X

	JSR Boss_BullyDraw
	JSR ObjGiant_Mirror
	RTS

BossBully_MakeBobomb:
	JSR Object_FindEmptyX
	BCC Boss_BullyBounceWait1
	
	LDA #OBJ_BOBOMB
	STA Objects_ID,X
	
	LDA #$01
	STA Objects_Property, X

	LDA #$00
	STA BobOmb_Action, X

	LDA #SPR_PAL1
	STA Objects_SpriteAttributes, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA <Player_X
	STA <Objects_XZ, X

	LDA Player_XHi
	STA <Objects_XHiZ, X

	LDA #$80
	STA <Objects_YZ, X

	LDA #$00
	STA <Objects_YHiZ, X

	JSR Object_MoveAwayFromPlayer

	JSR Object_CalcBoundBox
	JSR Object_FacePlayer

	LDX <CurrentObjectIndexZ	 ; X = Cannon Fire slot index
	RTS

Boss_BullyDie:
	LDA Objects_Timer, X
	BEQ Boss_BullyExplode

	AND #$0F
	BNE Boss_BullyDieRTS

	LDA RandomN
	AND #$0F
	ADD <Objects_XZ, X
	STA Poof_X

	LDA <Objects_YZ, X
	ADD #$08
	STA Poof_Y

	JSR Common_MakePoof

	LDA #$E0
	STA SpecialObj_YVel, Y

	LDA Sound_QLevel1
	ORA #SND_LEVELBABOOM
	STA Sound_QLevel1
	RTS

Boss_BullyDieRTS:
	LDA #$00
	STA Objects_Frame, X

	JMP Boss_BullyDraw

Boss_BullyExplode:	
	JSR Object_Explode

	LDA #$FF
	STA Objects_Timer2, X

	LDA #$80
	STA CompleteLevelTimer

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	LDA #$18
	STA Objects_Timer,X

	LDA Sound_QLevel1
	ORA #SND_LEVELBABOOM
	STA Sound_QLevel1

	LDA #$10
	STA RotatingColor_Cnt

	LDA #$64
	STA Exp_Earned
	JMP DestroyAllEnemies
	