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
	.word Boss_Blooper
	.word Boss_Piranha
	.word Boss_Sun
	.word Boss_Moon
	.word Boss_MegaMalice


Boss_CheepAction = Objects_Data1
Boss_CheepAnimTicks = Objects_Data2
Boss_CheepTopLeftProp = Objects_Data3
Boss_CheepTopRightProp = Objects_Data4
Boss_CheepBounces = Objects_Data5
Boss_CheepHits = Objects_Data6
Boss_CheepYLine = Objects_Data7
Boss_CheepHealth = Objects_Data8

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

Boss_CheepHitScale:
	.byte 21, 16, 11, 6, 1

Boss_CheepInit:
	LDA #25
	STA Boss_CheepHealth, X

	LDA #$01
	STA Enemy_Health_Mode

	LDA #50
	STA Enemy_Health

	LDA #$00
	STA Objects_ExpPoints, X
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

	LDA #(ATTR_TAILPROOF)
	STA Objects_WeaponAttr, X

	LDA #(ATTR_NOICE)
	STA Objects_BehaviorAttr, X
	RTS

Boss_CheepNorm:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE Boss_CheepNotKilled

	LDA Objects_Timer2, X
	BNE Boss_CheepResetNorm

Boss_CheepNormHit:
	LDA Objects_PlayerProjHit, X
	CMP #HIT_INVULNERABLE
	BEQ CheepFrogAttack

	CMP #HIT_SHELL
	BNE Boss_ShortFlash

CheepFrogAttack:
	LDA #$40
	STA Objects_Timer2, X

	LDA Boss_CheepHealth, X
	SUB #$05
	STA Boss_CheepHealth, X
	JMP Boss_CheepResetNorm

Boss_ShortFlash:
	DEC Boss_CheepHealth, X
	DEC Boss_CheepHealth, X

Boss_CheepResetNorm:
	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	LDA Boss_CheepHealth, X
	ASL A
	STA Enemy_Health
	
	LDA #$00
	STA Objects_Health, X

Boss_CheepNoRefill:
	LDY #$00
	LDA Boss_CheepHealth, X
	BEQ Boss_CheepDoDeath
	BMI Boss_CheepDoDeath

Boss_CheepFindHits:	
	CMP Boss_CheepHitScale, Y
	BCS Boss_CheepSetHits

	INY
	BNE Boss_CheepFindHits

Boss_CheepSetHits:
	TYA
	CMP Boss_CheepHits, X
	BEQ Boss_CheepNotKilled
	
	STA Boss_CheepHits, X
	JMP Boss_CheepNotDead

Boss_CheepDoDeath:
	LDA #$00
	STA Enemy_Health

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
	
	LDA Objects_Timer2, X
	BEQ	Boss_CheepNoKills

	JSR Object_KillOthers

Boss_CheepNoKills:

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
	BMI Boss_SwitchDirectionRight

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
	BMI Boss_KeepRight
	BNE Boss_SwitchDirectionLeft

Boss_KeepRight:
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
	ADD #$28
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
	CMP #$03
	BCS Boss_CheepSecondFish

	JMP Boss_CheepMakeFishRTS

Boss_CheepSecondFish:
	JSR Object_FindEmptyY
	BCS Boss_CheepSecondFishDo

	JMP Boss_CheepMakeFishRTS

Boss_CheepSecondFishDo:
	LDA #OBJ_JUMPINGCHEEP
	STA Objects_ID, Y

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

	; LDA Boss_CheepHits, X
	; CMP #$04
	; BCC Boss_CheepMakeFishRTS

	; JSR Object_FindEmptyY
	; BCC Boss_CheepMakeFishRTS

	; LDA #OBJ_JUMPINGCHEEP
	; STA Objects_ID, Y

	; LDA #$00
	; STA Objects_ExpPoints, Y

	; LDA #OBJSTATE_FRESH
	; STA Objects_State, Y

	; LDA <Temp_Var16
	; ADD #$40
	; STA Objects_XZ, Y
	; STA <Poof_X

	; LDX <CurrentObjectIndexZ
	; LDA <Objects_XHiZ, X
	; STA Objects_XHiZ, Y

	; LDA Boss_CheepYLine, X
	; STA Objects_YZ, Y
	; STA <Poof_Y

	; LDA #$00
	; STA Objects_YHiZ, Y
	; STA Objects_Property, Y
	
	; LDA #$80
	; STA Objects_Timer, Y
	; STA Objects_InWater, Y

	; LDA #SPR_BEHINDBG
	; STA Objects_Orientation, Y

	; JSR Common_MakePoof

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

	LDA #$09
	STA Boss_FwooshHealth, X
	STA Enemy_Health_Mode

	LDA #48
	STA Enemy_Health

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
	
	JSR Giant_FwooshMakeThwomp

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
	LDA Player_Invulnerable
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
	LDA #$A0
	STA Objects_YZ, Y

	LDA #$00
	STA Objects_XHiZ, Y
	STA Objects_YHiZ, Y
	STA Objects_Property, Y	

	LDA #OBJSTATE_INIT
	STA Objects_State, Y

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
	LDA #$80
	STA Objects_YZ, Y

	LDA #$00
	STA Objects_XHiZ, Y
	STA Objects_YHiZ, Y
	STA Objects_Property, Y

	LDA #OBJSTATE_FRESH
	STA Objects_State, Y

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
	LDA #$A0
	STA Objects_YZ, Y

	LDA #$00
	STA Objects_XHiZ, Y
	STA Objects_YHiZ, Y
	STA Objects_Property, Y

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
	.byte $02, $02, $02
	.byte $01, $01, $01
	.byte $00, $00, $00

Fwoosh_HealthMeter:
	.byte 5, 10, 14, 19, 24, 29, 34, 38, 43

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
	SUB #$05
	STA Boss_FwooshHealth, X

Boss_FwooshHit1:

	LDY Boss_FwooshHealth, X
	BPL Boss_FwooshSetStage

	LDA #$80
	STA Objects_Timer, X

	LDA #$00
	STA Enemy_Health

	LDA #$09
	STA Boss_FwooshAction, X
	JMP Boss_FwooshDraw

Boss_FwooshSetStage:	
	LDA Fwoosh_HealthMeter, Y
	STA Enemy_Health

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
	LDA #$28
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

	LDA #$64
	STA Exp_Earned

	LDA <Objects_XZ, X
	ADD #$08
	STA <Objects_XZ, X

	LDA <Objects_YZ, X
	ADD #$08
	STA <Objects_YZ, X
	JMP Object_Explode

Boss_BlooperAction = Objects_Data1
Boss_BlooperHealth = Objects_Data2
Boss_BlooperNewTentacle = Objects_Data3
Boss_BlooperDeathTicks	= Objects_Data4
Boss_BlooperCanSecondTentacle = Objects_Data5

Boss_BlooperSprites:
	.byte $8D, $8D, $FF, $FF, $FF, $FF, $FF, $FF
	.byte $8F, $8F, $FF, $FF, $FF, $FF, $FF, $FF

Boss_Blooper:
	LDA #$01
	STA Enemy_Health_Mode

	LDA Boss_BlooperHealth, X
	STA Enemy_Health

	JSR Boss_BlooperHurt

	LDA Boss_BlooperAction, X
	JSR DynJump

	.word Boss_BlooperInit
	.word Boss_BlooperNorm
	.word Boss_BlooperDeath
	.word Boss_BlooperDying

Boss_BlooperInit:
	LDA #$01
	STA Boss_BlooperCanSecondTentacle, X
	LDA Boss_BlooperStartHealth
	STA Boss_BlooperHealth, X

	INC Boss_BlooperAction, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA SecondQuest
	CMP #SECOND_QUEST
	BNE Boss_BlooperInitRTS

	INC Boss_BlooperNewTentacle, X

Boss_BlooperInitRTS:
	RTS

Boss_BlooperNorm:
	JSR Boss_BlooperEnemyGen_HitCheck
	JSR Boss_MakeBlooperNewTentacle
	JSR Object_CalcBoundBox
	JMP Boss_BlooperAnimate

Boss_MakeBlooperNewTentacle:
	LDA Boss_BlooperNewTentacle, X
	BEQ Boss_MakeBlooperNewTentacleRTS

	JSR Object_FindEmptyY
	BCC Boss_WaitTentacle

	LDA #OBJ_TENTACLE
	STA Objects_ID, Y

	LDA #OBJSTATE_INIT
	STA Objects_State, Y

	LDA #$80
	STA Objects_XZ, Y

	LDA #$C0
	STA Objects_YZ, Y

	LDA #$00
	STA Objects_XHiZ, Y
	STA Objects_YHiZ, Y
	STA Boss_BlooperNewTentacle, X

Boss_MakeBlooperNewTentacleRTS:
	RTS	

Boss_WaitTentacle:
	LDA #$01
	STA Objects_Timer2, X
	RTS


Boss_BlooperStartHealth:
Boss_BlooperGenThresholds:
	.byte 49, 44
	.byte 42, 37
	.byte 35, 30
	.byte 28, 25
	.byte 23, 18
	.byte 16, 11
Boss_BlooperSecondTentacle:	
	.byte 9

Boss_BlooperEnemyGens:
	.byte 00
	.byte GEN_GOLDCHEEPS, GEN_MINES
	.byte GEN_GOLDCHEEPS, GEN_MINES
	.byte GEN_BLOOPERS, GEN_MINES
	.byte GEN_BLOOPERS, GEN_MINES
	.byte GEN_GOLDYURARIN, GEN_MINES
	.byte GEN_GOLDYURARIN, GEN_MINES
	.byte GEN_MINES

Boss_BlooperEnemyGen_HitCheck:
	LDY #$01

Boss_CheckThreshold:
	LDA Boss_BlooperHealth, X
	CMP Boss_BlooperGenThresholds, Y
	BCS Boss_BlooperEnemyGen_HitCheckSet

	INY
	JMP Boss_CheckThreshold

Boss_BlooperEnemyGen_HitCheckSet:
	LDA Boss_BlooperEnemyGens, Y
	STA Level_Event
	RTS

Boss_BlooperHurt:
	LDA Objects_Timer2, X
	BNE Boss_BlooperHurtRTS

	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE Boss_BlooperHurtRTS

	LDA Objects_PlayerProjHit, X
	CMP #HIT_EXPLOSION
	BNE Boss_BlooperHitLow

	LDA Boss_BlooperHealth, X
	SUB #10
	STA Boss_BlooperHealth, X

Boss_BlooperHitLow:
	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	LDA #$40
	STA Objects_Timer2, X

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	LDA #$00
	STA Objects_Health, X

	LDA Boss_BlooperCanSecondTentacle, X
	BEQ Blooper_NoNewTentacle

	LDA Boss_BlooperHealth, X
	CMP Boss_BlooperSecondTentacle
	BCS Blooper_NoNewTentacle

	STA Boss_BlooperNewTentacle, X
	
	LDA #$00
	STA Boss_BlooperCanSecondTentacle, X

Blooper_NoNewTentacle:	
	DEC Boss_BlooperHealth, X
	DEC Boss_BlooperHealth, X
	BPL Boss_BlooperHurtRTS

	INC Boss_BlooperAction, X

Boss_BlooperHurtRTS:	
	RTS

Boss_BlooperColors:
	.byte $30, $16

Boss_BlooperAnimate:
	LDA Objects_Timer2, X
	BEQ Boss_BlooperDrawNorm

	LSR A
	LSR A
	AND #$01
	TAY

	LDA Boss_BlooperColors, Y
	STA Pal_Data + 10
	STA Palette_Buffer + 10

	LDA #$01
	STA Objects_Frame, X
	BNE Boss_BlooperDraw

Boss_BlooperDrawNorm:
	LDA #$00
	STA Objects_Frame, X

Boss_BlooperDraw:
	LDA #$00
	STA Objects_Orientation, X

	LDA #SPR_PAL3
	STA Objects_SpriteAttributes, X
	
	LDA #$1A
	STA PatTable_BankSel + 4

	LDA #(SPRITE_2_HINVISIBLE | SPRITE_3_HINVISIBLE)
	STA Objects_SpritesHorizontallyOffScreen, X

	LDA #(SPRITE_1_VINVISIBLE)
	STA Objects_SpritesVerticallyOffScreen, X

	LDA #LOW(Boss_BlooperSprites)
	STA <Giant_TilesLow

	LDA #HIGH(Boss_BlooperSprites)
	STA <Giant_TilesHi

	LDA <Objects_YZ, X
	ADD #$03
	STA <Objects_YZ, X
	
	JSR Object_DrawGiant

	LDA <Objects_YZ, X
	SUB #$03
	STA <Objects_YZ, X

	LDY Object_SpriteRAMOffset, X
	LDA Sprite_RAMAttr + 4, Y
	ORA #SPR_HFLIP
	STA Sprite_RAMAttr + 4, Y
	
	LDA #$00
	STA Objects_SpritesHorizontallyOffScreen, X
	STA Objects_SpritesVerticallyOffScreen, X
	RTS

Boss_BlooperDeath:
	JSR DestroyAllEnemies
	JSR Destroy_Projectiles

	LDX <CurrentObjectIndexZ

	LDA #GEN_CANCEL
	STA Level_Event
	
	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	LDA #OBJ_BOSS
	STA Objects_ID, X

	LDA #$03
	STA Boss_BlooperAction, X

	LDA #$01
	STA Objects_Frame, X

	LDA #$0F
	STA Boss_BlooperDeathTicks, X
	JMP Boss_BlooperDraw

Boss_BlooperExplosionsY:
	.byte $10, $70, $40, $A0, $28, $88, $58, $C8
	.byte $20, $80, $50, $90, $18, $78, $48, $B8

Boss_BlooperDying:
	LDA Objects_Timer, X
	BNE Boss_BlooperDyingDraw

	DEC Boss_BlooperDeathTicks, X
	BEQ Boss_BlooperDyingFinal

	JSR Object_FindEmptyY

	LDA RandomN
	AND #$07
	TAX
	LDA Boss_BlooperExplosionsY, X
	STA Objects_YZ, Y

	LDA #$D0
	STA Objects_XZ, Y

	LDA #$00
	STA Objects_YHiZ, Y
	STA Objects_XHiZ, Y

	TYA
	TAX
	JSR Object_Explode

	LDX <CurrentObjectIndexZ

	LDA #$10
	STA Objects_Timer, X
	
Boss_BlooperDyingDraw:	
	JMP Boss_BlooperDraw

Boss_BlooperDyingFinal:
	
	LDA #$FF
	STA Objects_Timer2, X

	LDA #$01
	STA Player_OnObject

	LDA #$00
	STA <Player_InAir

	LDA #$80
	STA CompleteLevelTimer

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	LDA #$18
	STA Objects_Timer,X

	LDA Sound_QLevel1
	ORA #SND_LEVELBABOOM
	STA Sound_QLevel1

	LDA #$64
	STA Exp_Earned
	JMP Object_Explode	

Boss_PiranhaSprites:
	.byte $C1, $C3, $C3, $C1, $E1, $E3, $E3, $E1
	.byte $C5, $C7, $C7, $C5, $E5, $E7, $E7, $E5
	

Boss_PiranhaStemSprites:
	.byte $C9, $CB, $CB, $C9, $C9, $CB, $CB, $C9
	.byte $C9, $CB, $CB, $C9, $C9, $CB, $CB, $C9

Boss_PiranhaAction = Objects_Data1
Boss_PiranhaFrames = Objects_Data2
Boss_PiranhaTicker = Objects_Data3
Boss_PiranhaSnowAttack = Objects_Data4
Boss_PiranhaTopLeftProp = Objects_Data5
Boss_PiranhaTopRightProp = Objects_Data6
Boss_PiranhaChompGrab = Objects_Data7
Boss_PiranhaChompIndex = Objects_Data8
Boss_PiranhaSpawnTimer = Objects_Data10
Boss_PiranhaHits= Objects_Data11
Boss_PiranhaFreezeBlocks = Objects_Data12
Boss_PiranhaHealth = Objects_Data13

	
Piranha_HitTable:
	.byte 240
	.byte 19
	.byte 13
	.byte 7
	.byte 0

Boss_Piranha:
	LDA <Player_HaltGameZ
	BEQ Boss_PiranhaNorm

	JMP Boss_PiranhaDraw

Boss_PiranhaRTS:	
	RTS

Boss_PiranhaNorm:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE Boss_PiranhaNorm1

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	LDA Objects_PlayerProjHit, X
	CMP #HIT_EXPLOSION
	BNE Piranha_NormHit
	
	LDA Boss_PiranhaHealth, X
	SUB #$05
	STA Boss_PiranhaHealth, X

Piranha_NormHit:
	DEC Boss_PiranhaHealth, X

Piranha_NotDead:
	LDA Boss_PiranhaHealth, X
	ASL A
	STA Enemy_Health
	
	LDA #$00
	STA Objects_PlayerProjHit, X
	STA Objects_Health, X

	LDY #$00

	LDA Boss_PiranhaHealth, X

Piranha_HitTableLoop:		
	CMP Piranha_HitTable, Y
	BCS Piranha_SetHits

	INY
	BNE Piranha_HitTableLoop

Piranha_SetHits:	
	TYA
	CMP Boss_PiranhaHits, X
	BEQ Boss_PiranhaNorm1

	STA Boss_PiranhaHits, X

	LDA #$80
	STA Objects_Timer2, X

	JSR Boss_PiranhaDetectChomps
	BCC Boss_PiranhaNorm1

	TYA
	TAX

	JSR Object_GetKilled
	LDX <CurrentObjectIndexZ

Boss_PiranhaNorm1:
	JSR Boss_PiranhaSpawnChomp
	JSR Boss_PiranhaMoveMuncher

	LDA Boss_PiranhaAction, X
	JSR DynJump

	.word Boss_PiranhaInit
	.word Boss_PiranhaWaitUnder
	.word Boss_PiranhaAttackUp
	.word Boss_PiranhaWait
	.word Boss_PiranhaAttackDown
	.word Boss_PiranhaDie

Boss_PiranhaInit:
	INC Enemy_Health_Mode
	
	LDA #48
	STA Enemy_Health

	LDA #SPR_PAL1
	STA Objects_SpriteAttributes, X

	LDA #ATTR_STOMPPROOF
	STA Objects_WeaponAttr, X

	LDA #ATTR_NOICE
	STA Objects_BehaviorAttr, X
	
	LDA #$E0
	STA <Objects_YZ, X

	LDA #$00
	STA <Objects_YHiZ, X
	INC Boss_PiranhaHits, X


	LDA #24
	STA Boss_PiranhaHealth, X

	INC Boss_PiranhaAction, X

	LDA #$FF
	STA Objects_Timer, X

	LDA #$10
	STA Objects_SpritesRequested, X

	LDA #$20
	STA Boss_PiranhaSpawnTimer, X

	LDA #BOUND32X64
	STA Objects_BoundBox, X
	RTS


Boss_PiranhaWaitUnder:
	JSR Boss_PiranhaDetectSeasonSlot
	BCC Boss_PiranhaWaitUnder2

	LDA SeasonSlot_Pause, Y
	BNE Boss_PiranhaWaitUnder0

	INC Objects_Timer, X

	LDA Boss_PiranhaSpawnTimer, X
	BEQ Boss_PiranhaWaitUnder0

	INC Boss_PiranhaSpawnTimer, X

Boss_PiranhaWaitUnder0:
	LDA Objects_Timer, X
	BNE Boss_PiranhaWaitUnder1

	INC Boss_PiranhaAction, X

	LDA Player_X
	AND #$F0
	STA <Objects_XZ, X

Boss_PiranhaWaitUnder1:
	LDA Objects_Timer, X
	CMP #$20
	BCS Boss_PiranhaWaitUnder2

	JSR Boss_PiranhaDetectChomps
	BCC Boss_PiranhaWaitUnder2

	LDA Objects_SpriteX, Y
	ADD #$04
	STA <Temp_Var1

	LDA Objects_SpriteY, Y
	SUB #$10
	STA <Temp_Var2

	JSR Object_GetUnusedSprite

	LDA #$E9
	STA Sprite_RAMTile, Y

	LDA #SPR_PAL2
	STA Sprite_RAMAttr, Y

	LDA <Temp_Var1
	STA Sprite_RAMX, Y

	LDA <Temp_Var2
	STA Sprite_RAMY, Y

Boss_PiranhaWaitUnder2:	
	JMP Boss_PiranhaDraw

Boss_PiranhaAttackUp:
	LDA #$C0
	STA <Objects_YVelZ, X

	JSR Object_ApplyYVel_NoGravity
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

	LDA <Objects_YZ, X
	CMP #$84
	BCS Boss_PiranhaAttackUpRTS

	LDA #$20
	STA Objects_Timer, X

	LDA #$00
	STA <Objects_YVelZ, X
	
	INC Boss_PiranhaAction, X

Boss_PiranhaAttackUpRTS:
	JMP Boss_PiranhaAnimate

Boss_PiranhaWait:	
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Giant_ParaChompInteract

	LDA Objects_Timer, X
	BNE Boss_PiranhaWaitDraw

	INC Boss_PiranhaAction, X
	
	LDA Boss_PiranhaHits, X
	BNE Boss_PiranhaWait1

	LDA #$05
	STA Boss_PiranhaAction, X
	
	LDA #$40
	STA Objects_Timer2, X
	
Boss_PiranhaWait1:	
	LDA #$20
	STA Objects_Timer, X

Boss_PiranhaWaitDraw:	
	JMP Boss_PiranhaAnimate

Boss_PiranhaAttackDown:
	JSR Object_ApplyYVel_NoGravity
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

	LDA Boss_PiranhaChompGrab, X
	BEQ Boss_PiranhaNoPull

	LDY Boss_PiranhaChompIndex, X
	LDA Objects_YZ, Y
	ADD #$02
	STA Objects_YZ, Y

	LDA Objects_YHiZ, Y
	ADC #$00
	STA Objects_YHiZ, Y

	DEC Boss_PiranhaChompGrab, X

Boss_PiranhaNoPull:	
	LDA #$20
	STA <Objects_YVelZ, X

	LDA <Objects_YZ, X
	CMP #$E0
	BCC Boss_PiranhaAttackDownRTS

	LDA Objects_Timer2, X
	BNE Boss_PiranhaHitAction

	LDA #$01
	STA Boss_PiranhaAction, X

	LDA #$80
	STA Objects_Timer, X

	LDA #$00
	;STA Boss_PiranhaChompGrab, X

Boss_PiranhaAttackDownRTS:
	JMP Boss_PiranhaAnimate
	
Boss_PiranhaHitAction:
	LDA Boss_PiranhaHits, X
	BEQ Boss_PiranhaAttackDownRTS
	SUB #$01

	JSR DynJump

	.word Giant_Stage1
	.word Giant_Stage2
	.word Giant_Stage3
	.word Giant_Stage4

Giant_Stage1:
Giant_Stage2:
	JSR Boss_PiranhaUpdateWeather

	LDA #$01
	STA Boss_PiranhaAction, X

	LDA #$80
	STA Objects_Timer, X

	JSR Object_FindEmptyY
	BCC Giant_Stage2RTS

	LDA #OBJ_ICESPAWN
	STA Objects_ID, Y

	LDA #$C0
	STA IceSpawn_Timer, Y

	LDA #OBJSTATE_NORMAL
	STA Objects_State, Y
	
	LDA #$E0
	STA Objects_XZ, Y

	LDA #$20
	STA Objects_YZ, Y	

	LDA #$00
	STA Objects_XHiZ, Y
	STA Objects_YHiZ, Y

	LDA #$01
	STA Objects_Property, Y
	
Giant_Stage2RTS:	
	RTS

Giant_Stage3:
	JSR Boss_PiranhaUpdateWeather

	LDA #$01
	STA Boss_PiranhaAction, X

	LDA #$80
	STA Objects_Timer, X

	LDY #$04

Giant_Stage3_1:
	LDA Objects_ID, Y
	CMP #OBJ_ICESPAWN
	BEQ Giant_Stage3_2
	
	DEY
	BPL Giant_Stage3_1

Giant_Stage3_2:

	LDA #OBJSTATE_DEADEMPTY
	STA Objects_State, Y

	JSR Object_FindEmptyY
	
	LDA #OBJSTATE_FRESH
	STA Objects_State, Y

	LDA #$1C
	STA Objects_XZ, Y

	LDA #$90
	STA Objects_YZ, Y

	LDA #$00
	STA Objects_Property, Y
	
	LDA #OBJ_EVENTFILLER
	STA Objects_ID, Y

	LDA #$98
	STA WaterFill_Wait, Y

	JSR Object_FindEmptyY

	LDA #OBJSTATE_FRESH
	STA Objects_State, Y

	LDA #$14
	STA Objects_XZ, Y

	LDA #$80
	STA Objects_YZ, Y
	
	LDA #OBJ_EVENTFILLER
	STA Objects_ID, Y

	LDA #$98
	STA WaterFill_Wait, Y
	RTS

Giant_Stage4:
	JSR Giant_Stage3
	JSR Boss_PiranhaSpawnMuncher
	RTS

Boss_PiranhaPalettes:
	.byte SPR_PAL1, SPR_PAL3

Boss_PiranhaAnimate:
	LDA Boss_PiranhaChompGrab, X
	BNE Boss_PiranhaDraw

	INC Boss_PiranhaFrames, X
	LDA Boss_PiranhaFrames, X
	AND #$08
	LSR A
	LSR A
	LSR A
	STA Objects_Frame, X

Boss_PiranhaDraw:
	LDA Objects_Timer2, X
	LSR A
	LSR A
	AND #$01
	TAY

	LDA Boss_PiranhaPalettes, Y
	STA Objects_SpriteAttributes, X

	LDA #LOW(Boss_PiranhaSprites)
	STA <Giant_TilesLow

	LDA #HIGH(Boss_PiranhaSprites)
	STA <Giant_TilesHi

	LDA #$58
	STA PatTable_BankSel + 5

	LDA Objects_Orientation, X
	AND #~SPR_VFLIP
	STA Objects_Orientation, X

	JSR Object_DrawGiant
	JSR ObjGiant_Mirror

	LDA #LOW(Boss_PiranhaStemSprites)
	STA <Giant_TilesLow

	LDA #HIGH(Boss_PiranhaStemSprites)
	STA <Giant_TilesHi

	LDA <Objects_YZ, X
	ADD #$20
	STA <Objects_YZ, X

	LDA Object_SpriteRAMOffset, X
	ADD #$20
	STA Object_SpriteRAMOffset, X

	LSR Objects_SpritesHorizontallyOffScreen, X
	LSR Objects_SpritesHorizontallyOffScreen, X

	LSR Objects_SpritesVerticallyOffScreen, X
	LSR Objects_SpritesVerticallyOffScreen, X

	LDA #SPR_PAL3
	STA Objects_SpriteAttributes, X

	JSR Object_DrawGiant
	JSR ObjGiant_Mirror


	LDA <Objects_YZ, X
	SUB #$20
	STA <Objects_YZ, X
	RTS

Boss_PiranhaSpawnMuncher:
	LDY #$07

Boss_PiranhaSpawnMuncher1:
	LDA Objects_State, Y
	CMP #OBJSTATE_DEADEMPTY
	BEQ Boss_PiranhaSpawnMuncher2

	DEY
	CPY #$04
	BNE Boss_PiranhaSpawnMuncher1
	RTS

Boss_PiranhaSpawnMuncher2:
	LDA #OBJ_MUNCHER
	STA Objects_ID, Y

	LDA #OBJSTATE_FRESH
	STA Objects_State, Y

	LDA #$C0
	STA Muncher_Wait, Y

	LDA RandomN
	AND #$0F
	TAX

	LDA <Player_X
	AND #$F0
	STA Objects_XZ, Y

	LDA #$B0
	STA Objects_YZ, Y

	LDA #$00
	STA Objects_XHiZ, Y
	STA Objects_YHiZ, Y

	LDX <CurrentObjectIndexZ
	RTS	

Muncher_Positions:
	.byte $20, $30, $40, $50, $60, $70, $80, $90
	.byte $A0, $B0, $C0, $D0, $E0, $30, $70, $B0

Boss_PiranhaMoveMuncher:
	LDA Boss_PiranhaHits, X
	CMP #$04
	BNE Boss_PiranhaMoveMuncherRTS

	LDY #$07

Boss_PiranhaMoveMuncher1:
	LDA Objects_ID, Y
	CMP #OBJ_MUNCHER
	BEQ Boss_PiranhaMoveMuncher2

	DEY
	CPY #$04
	BNE Boss_PiranhaMoveMuncher1
	RTS

Boss_PiranhaMoveMuncher2:

	LDA Objects_Timer, Y
	CMP #$10
	BNE Boss_PiranhaMoveMuncherRTS

	LDA <Player_X
	AND #$F0
	STA Objects_XZ, Y

Boss_PiranhaMoveMuncherRTS:	
	RTS	

Boss_PiranhaDetectSeasonSlot:
	LDY #$04

Boss_PiranhaDetectSeasonSlot1:
	CPY CurrentObjectIndexZ
	BEQ Boss_PiranhaDetectSeasonSlot2
	
	LDA Objects_State, Y
	CMP #OBJSTATE_NORMAL
	BNE Boss_PiranhaDetectSeasonSlot2

	LDA Objects_ID, Y
	CMP #OBJ_SEASONSLOT
	BNE Boss_PiranhaDetectSeasonSlot2

	SEC
	RTS

Boss_PiranhaDetectSeasonSlot2:
	DEY
	BPL Boss_PiranhaDetectSeasonSlot1
	CLC
	RTS

Boss_PiranhaDetectChomps:
	LDY #$04

Boss_PiranhaDetectChomps1:
	CPY CurrentObjectIndexZ
	BEQ Boss_PiranhaDetectChomps2
	
	LDA Objects_State, Y
	CMP #OBJSTATE_NORMAL
	BNE Boss_PiranhaDetectChomps2

	LDA Objects_ID, Y
	CMP #OBJ_PARACHOMP
	BNE Boss_PiranhaDetectChomps2

	SEC
	RTS

Boss_PiranhaDetectChomps2:
	DEY
	BPL Boss_PiranhaDetectChomps1
	CLC
	RTS

Giant_ParaChompInteract:
	JSR Boss_PiranhaDetectChomps
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
	STA Boss_PiranhaChompGrab, X

	TYA
	STA Boss_PiranhaChompIndex, X

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

	LDA #HIT_EXPLOSION
	STA Objects_PlayerProjHit, X

	LDA #OBJSTATE_KILLED
	STA Objects_State, X

	LDA #$00
	STA Player_IsClimbingObject
	RTS
	
Boss_PiranhaSpawnPoints:
	.byte $30, $50, $70, $90, $B0, $40, $60, $80

Boss_PiranhaSpawnChomp:
	LDA Boss_PiranhaSpawnTimer, X
	BEQ Boss_PiranhaCheckChomps

	CMP #$01
	BNE Boss_PiranhaNoSpawn

	JSR Object_FindEmptyY
	BCC Boss_PiranhaSpawnChompRTS

	LDA #OBJ_PARACHOMP
	STA Objects_ID, Y

	LDA #$00
	STA Objects_ExpPoints, Y
	STA Objects_Property, Y

	LDA #OBJSTATE_FRESH
	STA Objects_State, Y

	LDA RandomN, Y
	AND #$07
	TAX

	LDA Boss_PiranhaSpawnPoints, X
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

Boss_PiranhaNoSpawn:
	DEC Boss_PiranhaSpawnTimer, X

Boss_PiranhaSpawnChompRTS:	
	RTS	

Boss_PiranhaCheckChomps:
	LDY #$04

Boss_PiranhaCheckChomps0:
	LDA Objects_State, Y
	BEQ Boss_PiranhaCheckChomps1

	LDA Objects_ID, Y
	CMP #OBJ_PARACHOMP
	BEQ Boss_PiranhaCheckChompsRTS
	
Boss_PiranhaCheckChomps1:
	DEY
	BPL Boss_PiranhaCheckChomps0

Boss_PiranhaCheckChomps2:
	LDA #$80
	STA Boss_PiranhaSpawnTimer, X

Boss_PiranhaCheckChompsRTS:
	RTS	

Boss_PiranhaUpdateWeather:
	JSR Boss_PiranhaDetectSeasonSlot
	BCC Boss_PiranhaUpdateWeatherRTS

	LDA Boss_PiranhaHits, X
	SUB #$02
	STA Objects_Property, Y

	LDA #OBJSTATE_INIT
	STA Objects_State, Y

Boss_PiranhaUpdateWeatherRTS:
	RTS	

Boss_PiranhaDie:
	LDX #$07

Boss_PiranhaDie1:
	CPX CurrentObjectIndexZ
	BEQ Boss_PiranhaDie2

	LDA Objects_State, X
	CMP #OBJSTATE_NORMAL
	BNE Boss_PiranhaDie2

	JSR Object_PoofDie

Boss_PiranhaDie2:
	DEX
	BPL Boss_PiranhaDie1

	LDX <CurrentObjectIndexZ

	LDA Objects_Timer2, X
	BNE Boss_PiranhaDieRTS

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

Boss_PiranhaDieRTS:
	LDA #$80
	STA Boss_PiranhaSpawnTimer, X
	JMP Boss_PiranhaAnimate

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
	.word Boss_BullyDraw      ; $00       
	.word Boss_BullyDraw      ; $01 
	.word Boss_BullyDraw      ; $02 
	.word Boss_BullyDraw      ; $03 
	.word Boss_BullyDraw      ; $04 
	.word Boss_BullyDraw      ; $05 
	.word Boss_BullyDraw      ; $06
	.word Boss_BullyDrawJump  ; $07     
	.word Boss_BullyDrawJump  ; $08     
	.word Boss_BullyDrawJump  ; $09     
	.word Boss_BullyDraw      ; $0A 
        
Boss_BullyDoAction:
	LDA <Objects_XHiZ, X
	CMP <Player_XHi
	BEQ Boss_BullyDoAction2

	LDA #$05
	STA Boss_BullyAction, X

	LDA #$70
	STA Objects_Timer, X

	LDA #$C0
	STA <Objects_YZ, X

	LDA #$FF
	STA <Objects_YHiZ, X

	LDA #$00
	STA Objects_Frame, X
	STA Object_HorzTileProp, X

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
	LDA Object_HorzTileProp, X
	CMP #(TILE_PROP_LAVA)
	BNE Boss_BullAlive

	LDA #$0A
	STA Boss_BullyAction, X

	LDA #$80
	STA Objects_Timer, X

Boss_BullAlive:
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
	LDA #$01
	STA Enemy_Health_Mode

	LDA #48
	STA Enemy_Health

	LDA #$F0
	STA Objects_XVelZ, X

	LDA #$00
	STA Objects_ExpPoints, X

	LDA #$03
	STA Objects_Health, X

	INC Boss_BullyAction, X

	LDA #$08
	STA Objects_SpritesRequested, X

	LDA #ATTR_PROJECTILEPROOF | (ATTR_PROJECTILEPROOF | ATTR_TAILPROOF | ATTR_DASHPROOF)
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

Boss_BullyInteract:
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_DetectTiles
	RTS

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
	JSR Boss_BullyInteract
	JSR Object_InteractWithTiles
	RTS	

Boss_BullyCharging:
	LDA #$00
	STA	<Objects_XVelZ, X
	
	;JSR Object_FacePlayer
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
	JSR Boss_BullyInteract

	LDA <Objects_YVelZ, X
	BEQ Boss_BullyBounceBack1
	
	LDA <Objects_TilesDetectZ, X
	AND #HIT_CEILING
	BNE Boss_BullyBounceBack1

	JSR Object_DampenVelocity
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

BossBully_BobombSide:
	.byte $20, $E0

BossBully_MakeBobomb:
	JSR Object_FindEmptyY
	BCC Boss_BullyBounceWait1
	
	LDA #OBJ_BOBOMB
	STA Objects_ID,Y

	LDA #OBJSTATE_FRESH
	STA Objects_State, Y
	
	LDA #$01
	STA Objects_Property, Y

	LDA #$00
	STA BobOmb_Action, Y

	LDA <Objects_XZ, X
	AND #$80
	ROL A
	ROL A
	AND #$01
	TAX

	LDA BossBully_BobombSide, X
	STA Objects_XZ, Y

	LDX <CurrentObjectIndexZ

	LDA <Objects_XHiZ, X
	STA Objects_XHiZ, Y

	LDA #$80
	STA Objects_YZ, Y

	LDA #$00
	STA Objects_YHiZ, Y

	LDX <CurrentObjectIndexZ	 ; X = Cannon Fire slot index
	RTS

Boss_BullyDie:
	LDA #$00
	STA Enemy_Health
	STA Object_HorzTileProp, X
	
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

	LDA #$64
	STA Exp_Earned
	JMP DestroyAllEnemies
	
Boss_SunSprites:
	.byte $81, $83, $83, $81
	.byte $A1, $A3, $A3, $A1

Sun_Action 		= Objects_Data1
Sun_MoonLink	= Objects_Data2
Sun_BeamLink	= Objects_Data3
Sun_BeamMeteor  = Objects_Data4
Sun_Health		= Objects_Data5

Boss_Sun:
	LDA <Player_HaltGameZ
	BEQ Sun_Norm

	JMP Sun_Draw

Sun_Norm:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE Sun_NotDead

	LDA Sun_Health, X
	BNE Sun_KeepFighting

	LDA #$00
	STA Enemy_Health, X

	LDA Sun_Action, X
	CMP #$05
	BEQ Sun_NotDead

	LDY Sun_MoonLink, X

	LDA #$06
	STA Sun_Action, X
	STA Moon_Action, Y

	LDA #$80
	STA Objects_Timer2, X
	STA Objects_Timer2, Y

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X
	STA Objects_State, Y
	JMP Sun_NotDead

Sun_KeepFighting:
	DEC Sun_Health, X

	LDY Sun_MoonLink, X

	LDA Sun_Health, X
	STA Moon_Health, Y

	LDA #$20
	STA Objects_Timer2, X
	STA Objects_Timer2, Y

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	JSR SunMoon_CalcHealth

Sun_NotDead:	
	LDA Sun_Action, X
	JSR DynJump

	.word Sun_Init 	; $00
	.word Sun_Rise 	; $01
	.word Sun_Sky  	; $02
	.word Sun_Set  	; $03
	.Word Sun_Attack; $04
	.word Sun_Wait	; $05
	.word Sun_Death	; $06

Sun_Init:
	LDA #50
	STA Enemy_Health

	LDA #$01
	STA Enemy_Health_Mode

	LDA #$08
	STA Objects_SpritesRequested, X

	LDA #$05
	STA Sun_Health, X

	LDY #$04

Sun_LinkLoop:	
	CPY CurrentObjectIndexZ
	BEQ Sun_LinkNext

	LDA Objects_ID, X
	CMP #OBJ_BOSS
	BEQ Sun_Link

Sun_LinkNext:
	DEY
	BPL Sun_LinkLoop

Sun_Link:
	TYA
	STA Sun_MoonLink, X	
	
	INC Sun_Action, X

	LDA DayNight
	BEQ Sun_InitRTS

	JSR SunMoon_SetDay

Sun_InitRTS:
	LDA #$03
	STA Sun_Action, X

	LDA #ATTR_ALLWEAPONPROOF
	STA Objects_WeaponAttr, X

	LDA #(ATTR_SHELLPROOF | ATTR_BUMPNOKILL)
	STA Objects_BehaviorAttr, X

	JSR Object_FindEmptyY

	LDA #OBJ_SUNBEAM
	STA Objects_ID, Y

	LDA #OBJSTATE_INIT
	STA Objects_State, Y

	LDA <Objects_XZ, X
	STA Objects_XZ, Y

	LDA <Objects_XHiZ, X
	STA Objects_XHiZ, Y	

	LDA #$F4
	STA Objects_YZ, Y

	LDA #$00
	STA Objects_YHiZ, Y	

	TYA
	STA Sun_BeamLink, X
	RTS	

Sun_Rise:
	LDA #$F0
	STA <Objects_YVelZ, X
	
	JSR Object_ApplyYVel_NoGravity
	JSR SunMoon_CalcBoundBox
	JSR Object_AttackOrDefeat

	LDA <Objects_YZ, X
	BNE Sun_RiseDraw

	LDY Sun_MoonLink, X

	LDA #$04
	STA Moon_Action, Y

	LDA #$02
	STA Sun_Action, X
	
	JSR SunMoon_SetDay

	LDA RandomN
	AND #$07
	STA Sun_BeamMeteor, X

Sun_RiseDraw:
	JMP Sun_Draw

Sun_Sky:
	LDA Objects_Timer, X
	BNE Sun_SkyMove

	LDA #$30
	STA Objects_Timer, X

	LDA Sun_BeamLink, X
	TAY

	LDA #$10
	STA SunBeam_Firing, Y

	LDA Sun_BeamMeteor, X
	BNE Sky_NoMeteor

	JSR Object_FindEmptyY
	BCC Sky_NoMeteor

	LDA #OBJ_METEOR
	STA Objects_ID, Y

	LDA #OBJSTATE_FRESH
	STA Objects_State, Y
	STA Moon_MeteorNoSmash, Y

	LDA <Objects_XZ, X
	ADD #$08
	STA Objects_XZ, Y

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Objects_XHiZ, Y

	LDA #$10
	STA Objects_YZ, Y

	LDA #$01
	STA Objects_YHiZ, Y	

	LDA #$02
	STA Objects_Property, Y

Sky_NoMeteor:
	DEC Sun_BeamMeteor, X

Sun_SkyMove:
	LDA Sun_BeamLink, X
	TAY
	
	LDA <Objects_XZ, X
	STA Objects_XZ, Y
	CMP #$08
	BCC Sun_AtEdge

	LDA #$F8
	STA <Objects_XVelZ, X

	JSR Object_ApplyXVel
	JSR SunMoon_CalcBoundBox
	JSR Object_AttackOrDefeat

	JMP Sun_Draw

Sun_AtEdge:
	LDA #10
	STA Objects_Timer, X 
	JMP	Sun_Draw

Sun_Wait:

	JSR SunMoon_CalcBoundBox
	JSR Object_AttackOrDefeat
	JMP Sun_Draw 

Sun_Set:
	LDA Sun_Health, X
	CMP #$03
	BCC Sun_AttackSet

	LDA <Objects_YZ, X
	CMP #$A0
	BCS Sun_AtBottom

	JMP Sun_KeepSetting

Sun_AttackSet:
	LDA <Objects_YZ, X
	CMP #$70
	BCS Sun_AtBottom

Sun_KeepSetting:
	LDA #$10
	STA <Objects_YVelZ, X

	JSR Object_ApplyYVel_NoGravity

Sun_AtBottom:	
	JSR SunMoon_CalcBoundBox
	JSR Object_AttackOrDefeat

	JMP Sun_Draw

Sun_AttackVelocity:
	.byte $30, $D0

Sun_AttackX:
	.byte $E0, $20

Sun_AttackXHi:
	.byte $FF, $01

Sun_Attack:
	BCS Sun_DoAttack

Sun_DoAttack:	
	LDA Objects_Timer, X
	BNE Sun_KeepAttacking

	LDY Sun_MoonLink, X
	LDA Objects_XZ, Y
	CMP #$08
	BCC Sun_DoneAttack

	LDY #$00

	LDA <Objects_XHiZ, X
	BEQ Sun_ChargeAttack
	BMI Sun_ChargeAttack

	INY

Sun_ChargeAttack:
	LDA <Objects_XHiZ, X
	BEQ Sun_NoXPos

	LDA Sun_AttackX, Y
	STA <Objects_XZ, X

	LDA Sun_AttackXHi, Y
	STA <Objects_XHiZ, X

Sun_NoXPos:	
	LDA Sun_AttackVelocity, Y
	STA <Objects_XVelZ, X

	LDA #$A0
	STA Objects_Timer, X

Sun_KeepAttacking:
	JSR Object_ApplyXVel
	JSR SunMoon_CalcBoundBox
	JSR Object_AttackOrDefeat

	JMP Sun_Draw

Sun_DoneAttack:
	LDA #$E0
	STA <Objects_XZ, X

	LDA #$00
	STA <Objects_XHiZ, X

	LDA #$A0
	STA <Objects_YZ, X

	LDA #$01
	STA Sun_Action, X

	LDA Sun_MoonLink, X
	TAY

	LDA #$03
	STA Moon_Action, Y
	JMP Sun_Draw

Sun_DrawPalette:
	.byte SPR_PAL3, SPR_PAL1

Sun_Draw:
	LDA Objects_Timer2, X
	LSR A
	LSR A
	AND #$01
	TAY

	LDA Sun_DrawPalette, Y
	STA Objects_SpriteAttributes, X

	LDA #SPR_BEHINDBG
	STA Objects_Orientation, X

	LDA #LOW(Boss_SunSprites)
	STA <Giant_TilesLow

	LDA #HIGH(Boss_SunSprites)
	STA <Giant_TilesHi

	LDA #$37
	STA PatTable_BankSel + 4

	JSR Object_DrawGiant
	JMP ObjGiant_Mirror
	
Sun_Death:
	LDA Objects_Timer2, X
	BNE Sun_NotDeath

	LDA <Objects_XZ, X
	ADD #$08
	STA <Objects_XZ, X

	LDA <Objects_YZ, X
	ADD #$08
	STA <Objects_YZ, X
	
	LDA <Objects_YHiZ, X
	ADC #$00
	STA <Objects_YHiZ, X

	JMP Object_Explode

Sun_NotDeath:
	LDA #$00
	STA Enemy_Health
	
	JMP Sun_Draw	
	
Boss_MoonSprites:
	.byte $85, $87, $87, $85
	.byte $A5, $A7, $A7, $A5

Moon_Action 	= Objects_Data1
Moon_SunLink	= Objects_Data2
Moon_MeteorNoSmash = Objects_Data3
Moon_AttackDone = Objects_Data4
Moon_Health		= Objects_Data5

Boss_Moon:
	LDA <Player_HaltGameZ
	BEQ Moon_Norm

	JMP Moon_Draw

Moon_Norm:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE Moon_NotDead

	LDA Moon_Health, X
	BNE Moon_KeepFighting

	LDA #$00
	STA Enemy_Health, X

	LDA Moon_Action, X
	CMP #$05
	BEQ Moon_NotDead

	LDY Moon_SunLink, X

	LDA #$06
	STA Moon_Action, X
	STA Sun_Action, Y

	LDA #$80
	STA Objects_Timer2, X
	STA Objects_Timer2, Y

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X
	STA Objects_State, Y
	JMP Moon_NotDead

Moon_KeepFighting:
	DEC Moon_Health, X
	LDY Moon_SunLink, X

	LDA Moon_Health, X
	STA Sun_Health, Y

	LDA #$20
	STA Objects_Timer2, X
	STA Objects_Timer2, Y

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	JSR SunMoon_CalcHealth

Moon_NotDead:	
	LDA Moon_Action, X
	
	JSR DynJump

	.word Moon_Init 	; $00
	.word Moon_Rise 	; $01
	.word Moon_Sky  	; $02
	.word Moon_Set  	; $03
	.Word Moon_Attack	; $04
	.word Moon_Wait		; $05
	.word Moon_Death	; $06

Moon_Init:
	LDA #$08
	STA Objects_SpritesRequested, X

	LDA #$05
	STA Moon_Health, X

	LDY #$04

Moon_LinkLoop:	
	CPY CurrentObjectIndexZ
	BEQ Moon_LinkNext

	LDA Objects_ID, X
	CMP #OBJ_BOSS
	BEQ Moon_Link

Moon_LinkNext:
	DEY
	BPL Moon_LinkLoop

Moon_Link:
	TYA
	STA Moon_SunLink, X	
	
	LDA #$01
	STA Moon_Action, X

	LDA #ATTR_ALLWEAPONPROOF
	STA Objects_WeaponAttr, X

	LDA #(ATTR_SHELLPROOF | ATTR_BUMPNOKILL)
	STA Objects_BehaviorAttr, X	
	RTS

Moon_Rise:
	LDA #$F0
	STA <Objects_YVelZ, X
	
	JSR Object_ApplyYVel_NoGravity
	JSR SunMoon_CalcBoundBox
	JSR Object_AttackOrDefeat

	LDA <Objects_YZ, X
	BNE Moon_RiseDraw

	LDY Moon_SunLink, X
	
	LDA #$04
	STA Sun_Action, Y

	LDA #$02
	STA Moon_Action, X

	LDA #$00
	STA <Objects_YZ, X

	LDA #$01
	STA <Objects_YHiZ, X

	JSR SunMoon_SetNight

	LDA RandomN
	AND #$07
	STA Moon_MeteorNoSmash, X

Moon_RiseDraw:
	JMP Moon_Draw

Moon_MeteorX:
	.byte $C0, $E0, $00, $20, $E0, $00, $20, $40

Moon_MeteorXHi:
	.byte $FF, $FF, $00, $00, $00, $01, $01, $01

Moon_MeteorProperty:
	.byte $00, $00, $00, $00, $01, $01, $01, $01

Moon_Sky:
	LDA <Objects_XZ, X
	CMP #$08
	BCC Moon_AtEdge

	LDA #$F8
	STA <Objects_XVelZ, X

	LDA #$00
	STA <Objects_YVelZ, X

	JSR Object_ApplyXVel
	JSR SunMoon_CalcBoundBox
	JSR Object_AttackOrDefeat

	LDA Objects_Timer, X
	BNE Moon_NoStars

	JSR Object_FindEmptyY
	BCC Moon_NoStars

	LDA #OBJ_METEOR
	STA Objects_ID, Y

	LDA #OBJSTATE_FRESH
	STA Objects_State, Y

	LDA Moon_MeteorNoSmash, X
	BNE Moon_NoMeteorSmash

	LDA #$01
	STA Meteor_NoSmash, Y

Moon_NoMeteorSmash:
	DEC Moon_MeteorNoSmash, X

	LDA RandomN
	AND #$07
	TAX

	LDA Moon_MeteorX, X
	STA Objects_XZ, Y

	LDA Moon_MeteorXHi, X
	STA Objects_XHiZ, Y

	LDA Moon_MeteorProperty, X
	STA Objects_Property, Y	

	LDA #$F0
	STA Objects_YZ, Y

	LDA #$00
	STA Objects_YHiZ, Y

	LDX <CurrentObjectIndexZ

	LDA #$30
	STA Objects_Timer, X

Moon_NoStars:
	JMP Moon_Draw

Moon_AtEdge:
	LDA #$05
	STA Moon_Action, X
	JMP	Moon_Draw

Moon_Wait:
	JSR SunMoon_CalcBoundBox
	JSR Object_AttackOrDefeat
	JMP Moon_Draw 

Moon_Set:
	LDA #$00
	STA <Objects_XVelZ, X
	STA Moon_AttackDone, X

	LDA Moon_Health, X
	CMP #$03
	BCC Moon_FastSet

	LDA <Objects_YZ, X
	CMP #$A0
	BCS Moon_AtBottom


Moon_KeepSetting:	
	LDA #$10
	STA <Objects_YVelZ, X

	JSR Object_ApplyYVel_NoGravity
	JSR SunMoon_CalcBoundBox
	JSR Object_AttackOrDefeat
	JMP Moon_Draw

Moon_FastSet:
	JSR Object_Move
	JSR SunMoon_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	JSR Moon_DetectGround

Moon_AtBottom:
	JMP Moon_Draw

Moon_AttackDirection:
	.byte $F8, $08

Moon_Attack:
	LDA Moon_AttackDone, X
	BEQ Moon_DoAttack

	JMP Moon_GoRight

Moon_DoAttack:
	LDA Moon_Health, X
	CMP #$03
	BCC Moon_BounceAttacks

	LDY Moon_SunLink, X
	LDA Objects_XZ, Y
	CMP #$08
	BCC Moon_Fall
	JMP Moon_Draw

Moon_BounceAttacks:	

	JSR Object_Move
	JSR SunMoon_CalcBoundBox
	JSR Object_AttackOrDefeat

	LDY Moon_SunLink, X
	LDA Objects_XZ, Y
	CMP #$08
	BCC Moon_Fall

	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	JSR Moon_DetectGround

	LDA <Objects_TilesDetectZ, X
	BEQ Moon_NoBounce

	JSR Object_XDistanceFromPlayer

	LDA Moon_AttackDirection, Y
	STA <Objects_XVelZ, X

	LDA #$A0
	STA <Objects_YVelZ, X

Moon_NoBounce:
	JMP Moon_Draw

Moon_Fall:
	LDA <Objects_YZ, X
	BEQ  Moon_NoBounce

	LDA <Objects_YZ, X
	CMP #$A0
	BCC Moon_NoBounce

	INC Moon_AttackDone, X

	LDA #$A0
	STA <Objects_YVelZ, X

	JMP Moon_NoBounce

Moon_GoRight:	
	LDA #$20
	STA <Objects_XVelZ, X

	JSR Object_ApplyXVel
	JSR SunMoon_CalcBoundBox
	JSR Object_AttackOrDefeat

	LDA <Objects_XZ, X
	CMP #$E0
	BCS	Moon_DoneAttack

	JMP Moon_Draw

Moon_DoneAttack:
	LDA #$01
	STA Moon_Action, X

	LDA #$E0
	STA <Objects_XZ, X

	LDA Moon_SunLink, X
	TAY

	LDA #$03
	STA Sun_Action, Y
	JMP Moon_Draw

Moon_DrawPalette:
	.byte SPR_PAL2, SPR_PAL1

Moon_Draw:
	LDA Objects_Timer2, X
	LSR A
	LSR A
	AND #$01
	TAY

	LDA Moon_DrawPalette, Y
	STA Objects_SpriteAttributes, X

	LDA #SPR_BEHINDBG
	STA Objects_Orientation, X

	LDA #LOW(Boss_MoonSprites)
	STA <Giant_TilesLow

	LDA #HIGH(Boss_MoonSprites)
	STA <Giant_TilesHi

	LDA #$37
	STA PatTable_BankSel + 4

	JSR Object_DrawGiant
	JMP ObjGiant_Mirror

Moon_DetectGround:
	LDA <Objects_TilesDetectZ, X
	BEQ Moon_NoGround

	CMP Objects_PreviousTilesDetect, X
	BEQ Moon_NoGround

	LDA #$20
	STA Level_Vibration

	LDA Sound_QLevel1
	ORA #SND_LEVELBABOOM
	STA Sound_QLevel1
	SEC
	RTS

Moon_NoGround:
	CLC
	RTS	

Moon_Death:
	LDA Objects_Timer2, X
	BNE Moon_NotDeath

	LDA #$80
	STA CompleteLevelTimer

	LDA <Objects_XZ, X
	ADD #$08
	STA <Objects_XZ, X

	LDA <Objects_YZ, X
	ADD #$08
	STA <Objects_YZ, X
	
	LDA <Objects_YHiZ, X
	ADC #$00
	STA <Objects_YHiZ, X

	JMP Object_Explode

Moon_NotDeath:
	JMP Moon_Draw

SunMoon_CalcBoundBox:
	LDA <Objects_XZ, X
	ADD #$06
	STA Objects_BoundLeft, X

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Objects_BoundLeftHi, X

	LDA Objects_BoundLeft, X
	ADD #20
	STA Objects_BoundRight, X

	LDA Objects_BoundLeftHi, X
	ADC #$00
	STA Objects_BoundRightHi, X

	LDA <Objects_YZ, X
	ADD #$06
	STA Objects_BoundTop, X

	LDA <Objects_YHiZ, X
	ADC #$00
	STA Objects_BoundTopHi, X

	LDA Objects_BoundTop, X
	ADD #20
	STA Objects_BoundBottom, X

	LDA Objects_BoundTopHi, X
	ADC #$00
	STA Objects_BoundBottomHi, X
	RTS

SunMoon_SetDay:
	LDA #$00
	STA Game_Timer_Tick
	STA DayNightMicroTicker
	STA DayNightTicker
	STA DayNight

	LDA #$03
	STA DayTransition
	RTS

SunMoon_SetNight:
	LDA #$00
	STA Game_Timer_Tick
	STA DayNightMicroTicker
	STA DayNightTicker

	LDA #$01
	STA DayNight

	LDA #$03
	STA NightTransition
	RTS	

SunMoon_HealthPoints:
	.byte 8, 16, 24, 33, 41

SunMoon_CalcHealth:
	LDY Sun_Health, X
	LDA SunMoon_HealthPoints, Y
	STA Enemy_Health
	RTS

MegaMalice_Action = Objects_Data1
MegaMalice_PlayerATB = Objects_Data2
MegaMalice_EnemyATB = Objects_Data3
MegaMalice_PlayerATBTicks = Objects_Data4
MegaMalice_EnemyATBTicks = Objects_Data5
MegaMalice_EnemyATBRate = Objects_Data6
MegaMalice_PlayerATBState = Objects_Data7
MegaMalice_PausePlayer = Objects_Data8
MegaMalice_Health = Objects_Data9
MegaMalice_HealTimer = Objects_Data10
MegaMalice_PauseEnemyATB = Objects_Data11
MegaMalice_PauseEnemy = Objects_Data12
MegaMalice_PlayerAboveTicker = Objects_Data13
MegaMalice_Charging = Object_BufferX

PLAYER_ATB_MOVEABLE = 00
PLAYER_ATB_HALT = 01

Boss_MegaMalice:
	LDA <Player_HaltGameZ
	BEQ MegaMalice_Norm

	JMP MegaMalice_Draw

MegaMalice_Norm:
	LDA MegaMalice_Action, X
	CMP #$06
	BCS MegaMalice_Dying

	JSR MegaMalice_ProcessATB
	JSR MegaMalice_IncreaseATB
	JSR MegaMalice_ProcessHealth
	JSR MegaMalice_Interact
	JSR MegaMalice_Heal
	JSR MegaMalice_CheckAbove

MegaMalice_Dying:
	LDA MegaMalice_Action, X
	JSR DynJump

	.word MegaMalice_Init
	.word MegaMalice_Stage1
	.word MegaMalice_Stage2
	.word MegaMalice_Stage3
	.word MegaMalice_Stage4
	.word MegaMalice_Stage5
	.word MegaMalice_Die
	.word MegaMalice_Death
	.word MegaMalice_FanFare
	.word MegaMalice_WaitEnding
	.word MegaMalice_Credits
	.word Credits_FadeOut
	.word Credits_ClearGfx1
	.word Credits_ClearGfx2
	.word Credits_FixPalette
	.word Credits_Roll

MegaMalice_ProcessATB:
	LDA MegaMalice_PausePlayer, X
	STA Player_VibeDisable
	BNE MegaMalice_ProcessATBRTS
	
	LDA <Pad_Input
	AND #(PAD_SELECT | PAD_B | PAD_A)
	BEQ MegaMalice_Movement

	LDA MegaMalice_PlayerATB, X
	SUB #$04
	STA MegaMalice_PlayerATB, X
	BMI MegaMalice_HaltPlayer

MegaMalice_Movement:
	LDA <Pad_Holding
	AND #(PAD_LEFT | PAD_RIGHT)
	BEQ MegaMalice_ProcessATBRTS

MegaMalice_DrainPlayerATB:
	DEC MegaMalice_PlayerATBTicks, X
	BMI MegaMalice_DecPlayerATB
	BNE MegaMalice_ProcessATBRTS

MegaMalice_DecPlayerATB:
	LDA #$04
	STA MegaMalice_PlayerATBTicks, X

MegaMalice_FastDec:
	DEC MegaMalice_PlayerATB, X
	BEQ MegaMalice_HaltPlayer
	BPL MegaMalice_ProcessATBRTS

MegaMalice_HaltPlayer:
	INC MegaMalice_PausePlayer, X

	LDA #$00
	STA MegaMalice_PlayerATB, X
	STA MegaMalice_PlayerATBTicks, X

MegaMalice_ProcessATBRTS:
	RTS

MegaMalice_Init:
	LDA #48
	STA MegaMalice_Health, X
	STA Enemy_Health_Mode

	LDA #$00
	STA Objects_ExpPoints, X

	LDA #$00
	STA Objects_Health, X

	INC MegaMalice_Action, X

	LDA #$08
	STA Objects_SpritesRequested, X

	LDA #SPR_PAL1
	STA Objects_SpriteAttributes, X

	LDA #$08
	STA MegaMalice_EnemyATBRate, X

	LDA #ATTR_NOICE
	STA Objects_BehaviorAttr, X

	LDA #BOUND32x32
	STA Objects_BoundBox, X

	LDA #$20
	STA MegaMalice_EnemyATB, X
	STA MegaMalice_PlayerATB, X

	JSR Object_MoveTowardsPlayer
	JMP MegaMalice_Draw

MegaMalice_DamageValues:
	.byte $00
	.byte $01 ;HIT_FIREBALL	= $01
	.byte $01 ;HIT_ICEBALL		= $02
	.byte $03 ;HIT_HAMMER		= $04
	.byte $02 ;HIT_NINJASTAR	= $08
	.byte $08 ;HIT_TAIL		= $10
	.byte $04 ;HIT_STOMPED		= $20
	.byte $03 ;HIT_SHELL		= $40
	.byte $03 ;HIT_EXPLOSION	= $80

MegaMalice_ProcessHealth:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE MegaMalice_ProcessHealthRTS

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	LDA #$40
	STA Objects_Timer2, X

	DEC MegaMalice_Health, X

	LDY #$00
	CLC

	LDA Objects_PlayerProjHit, X

MegaMalice_DamageLoop:	
	INY
	ROR A
	BCC MegaMalice_DamageLoop
	
	LDA MegaMalice_Health, X
	SUB MegaMalice_DamageValues, Y
	STA MegaMalice_Health, X

	LDA #$00
	STA Objects_PlayerProjHit, X

MegaMalice_ProcessHealthRTS:
	LDA MegaMalice_Health, X
	STA Enemy_Health
	RTS

MegaMalice_Interact:
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles

	LDA MegaMalice_Charging, X
	BEQ MegaMalice_InteractRTS
	LDA <Objects_TilesDetectZ, X
	AND #(HIT_LEFTWALL | HIT_RIGHTWALL)
	BEQ MegaMalice_InteractRTS

	LDA #$00
	STA MegaMalice_Charging, X

	LDA #SND_LEVELBABOOM
	STA Sound_QLevel1

	LDA #$10
	STA Level_Vibration

MegaMalice_InteractRTS:	
	RTS

MegaMalice_Sprites:
	.byte $D1, $D3, $D3, $D1
	.byte $F1, $F3, $F3, $F1

MegaMalice_Palettes:
	.byte SPR_PAL1, SPR_PAL3

MegaMalice_Draw:
	LDA #$00
	STA Objects_Orientation, X

	LDY #$00
	LDA Objects_Timer2, X
	BEQ MegaMalice_SetPal

	LSR A
	AND #$01
	TAY

MegaMalice_SetPal:
	LDA MegaMalice_Palettes, Y
	STA Objects_SpriteAttributes, X

	LDA #$23
	STA PatTable_BankSel + 4

	LDA #$1B
	STA PatTable_BankSel + 5
	
	LDA #LOW(MegaMalice_Sprites)
	STA <Giant_TilesLow

	LDA #HIGH(MegaMalice_Sprites)
	STA <Giant_TilesHi

	LDA #$1B
	STA PatTable_BankSel + 5

	JSR Object_CheckForeground
	JSR Object_DrawGiant
	JSR ObjGiant_Mirror

	LDA Objects_Timer, X
	BEQ MegaMalice_DrawRTS

	LSR A
	AND #$01
	BEQ MegaMalice_DrawRTS

	TYA
	TAX

	INC Sprite_RAMY, X
	INC Sprite_RAMY + 4, X
	INC Sprite_RAMY + 8, X
	INC Sprite_RAMY + 12, X
	INC Sprite_RAMY + 16, X
	INC Sprite_RAMY + 20, X
	INC Sprite_RAMY + 24, X
	INC Sprite_RAMY + 28, X

	LDX <CurrentObjectIndexZ

MegaMalice_DrawRTS:
	RTS

MegaMalice_IncreaseATB:
	LDA <Player_XVelZ
	ORA <Player_YVelZ
	BNE MegaMalice_EnemyATBCalc

	LDA SpecialObj_ID + 8
	ORA SpecialObj_ID + 9
	BNE MegaMalice_EnemyATBCalc

	LDA <Pad_Input
	ORA <Pad_Holding
	AND #(PAD_SELECT |PAD_LEFT | PAD_RIGHT | PAD_UP | PAD_DOWN | PAD_A | PAD_B)
	BNE MegaMalice_EnemyATBCalc

	LDA MegaMalice_PlayerATB, X
	CMP #$20
	BCS MegaMalice_FreePlayer

	INC MegaMalice_PlayerATBTicks, X

	LDA MegaMalice_PlayerATBTicks, X
	CMP #$02
	BCC MegaMalice_EnemyATBCalc	

	INC MegaMalice_PlayerATB, X
	
	LDA #$00
	STA MegaMalice_PlayerATBTicks, X
	BEQ MegaMalice_EnemyATBCalc

MegaMalice_FreePlayer:
	LDA #$00
	STA MegaMalice_PausePlayer, X

MegaMalice_EnemyATBCalc:
	LDA MegaMalice_PauseEnemyATB, X
	BNE MegaMalice_ATBDraw

	LDA MegaMalice_EnemyATB, X
	CMP #$20
	BCS MegaMalice_FreeEnemy

	INC MegaMalice_EnemyATBTicks, X

	LDA MegaMalice_EnemyATBTicks, X
	CMP MegaMalice_EnemyATBRate, X
	BCC MegaMalice_ATBDraw	

	INC MegaMalice_EnemyATB, X
	
	LDA #$00
	STA MegaMalice_EnemyATBTicks, X
	BEQ MegaMalice_ATBDraw

MegaMalice_FreeEnemy:
	LDA #$00
	STA MegaMalice_PauseEnemy, X
	STA MegaMalice_Charging, X

MegaMalice_ATBDraw:
	LDA Game_Counter
	AND #03
	BNE MegaMalice_ATBDrawRTS

	LDY Graphics_BufCnt

	LDA #$29
	STA Graphics_Buffer, Y
	INY

	LDA #$64
	STA Graphics_Buffer , Y
	INY

	LDA #$04
	STA Graphics_Buffer, Y
	INY

	LDA MegaMalice_PlayerATB, X
	STA <Temp_Var1

	LDA #$03
	STA <Temp_Var2

	JSR MegaMalice_FillATB

	LDA #$29
	STA Graphics_Buffer, Y
	INY

	LDA #$78
	STA Graphics_Buffer, Y
	INY

	LDA #$04
	STA Graphics_Buffer, Y
	INY

	LDA MegaMalice_EnemyATB, X
	STA <Temp_Var1

	LDA #$03
	STA <Temp_Var2

	JSR MegaMalice_FillATB
	LDA #$00
	STA Graphics_Buffer, Y

	TYA
	STA Graphics_BufCnt
	RTS

MegaMalice_FillATB:
	LDA <Temp_Var1
	BPL MegaMalice_TestATBBar

	LDA #$00
	BEQ MegaMalice_ATBTile

MegaMalice_TestATBBar:
	CMP #$08
	BCS MegaMalice_FullATBar

MegaMalice_ATBTile:
	ADD #$E1
	BNE MegaMalice_DrawATBar

MegaMalice_FullATBar:

	LDA #$E9

MegaMalice_DrawATBar:
	STA Graphics_Buffer, Y

	INY

	LDA <Temp_Var1
	SUB #$08
	STA <Temp_Var1

	DEC <Temp_Var2
	BPL MegaMalice_FillATB

MegaMalice_ATBDrawRTS:	
	RTS	

MegaMalice_Stage1:
	LDA MegaMalice_PauseEnemy, X
	BNE MegaMalice_Stage1NoAttack

	LDA MegaMalice_EnemyATB, X
	BNE MegaMalice_Stage1Attack

	INC MegaMalice_PauseEnemy, X
	
	LDA #$00
	STA MegaMalice_PauseEnemyATB, X
	BEQ MegaMalice_Stage1NoAttack

MegaMalice_Stage1Attack:
	LDA #$01
	STA MegaMalice_PauseEnemyATB, X

	DEC MegaMalice_EnemyATBTicks, X
	BPL MegaMalice_Stage1Move

	DEC MegaMalice_EnemyATB, X
	LDA MegaMalice_EnemyATBRate, X
	STA MegaMalice_EnemyATBTicks, X

MegaMalice_Stage1Move:
	JSR Object_Move	

MegaMalice_Stage1NoAttack:	
	LDA MegaMalice_Health, X
	CMP #24
	BCS MegaMalice_Stage1_End

	LDA #$40
	STA MegaMalice_HealTimer, X

	LDA #SND_LEVELPOWER
	STA Sound_QLevel1

	LDA #48
	STA MegaMalice_Health, X

	INC MegaMalice_Action, X

	LDA <Objects_XVelZ, X
	JSR Double_Value
	STA <Objects_XVelZ, X

MegaMalice_Stage1_End:
	JMP MegaMalice_Draw	

MegaMalice_Stage2:
	LDA MegaMalice_PauseEnemy, X
	BNE MegaMalice_Stage2NoAttack

	LDA MegaMalice_EnemyATB, X
	BNE MegaMalice_Stage2Attack

	INC MegaMalice_PauseEnemy, X
	
	LDA #$00
	STA MegaMalice_PauseEnemyATB, X
	BEQ MegaMalice_Stage2NoAttack

MegaMalice_Stage2Attack:
	LDA #$01
	STA MegaMalice_PauseEnemyATB, X

	DEC MegaMalice_EnemyATBTicks, X
	BPL MegaMalice_Stage2Move

	DEC MegaMalice_EnemyATB, X
	LDA MegaMalice_EnemyATBRate, X
	STA MegaMalice_EnemyATBTicks, X
	
MegaMalice_Stage2Move:
	JSR MegaMalice_JumpAttack

MegaMalice_Stage2NoJump:
	JSR Object_ApplyXVel	

MegaMalice_Stage2NoAttack:	
	JSR Object_ApplyY_With_Gravity
	LDA MegaMalice_Health, X
	CMP #24
	BCS MegaMalice_Stage2_End

	LDA #$40
	STA MegaMalice_HealTimer, X

	LDA #SND_LEVELPOWER
	STA Sound_QLevel1

	LDA #48
	STA MegaMalice_Health, X

	INC MegaMalice_Action, X

	LDA #$00
	STA MegaMalice_PauseEnemyATB, X

	LDA #$04
	STA MegaMalice_EnemyATBRate, X

MegaMalice_Stage2_End:
	JMP MegaMalice_Draw	

MegaMalice_Stage3:
	LDA MegaMalice_PauseEnemy, X
	BEQ MegaMalice_Stage3ATBCheck

	JMP MegaMalice_Stage3NoAttack

MegaMalice_Stage3ATBCheck:
	LDA MegaMalice_EnemyATBTicks, X
	BNE MegaMalice_Stage3NoMalice

	LDA MegaMalice_EnemyATB, X
	CMP #$08
	BNE MegaMalice_Stage3NoMalice
	
	JSR MegaMalice_MakeMalice

MegaMalice_Stage3NoMalice:
	LDA MegaMalice_EnemyATB, X
	BNE MegaMalice_Stage3Attack

	INC MegaMalice_PauseEnemy, X
	
	LDA #$00
	STA MegaMalice_PauseEnemyATB, X
	BEQ MegaMalice_Stage3NoAttack

MegaMalice_Stage3Attack:
	LDA #$01
	STA MegaMalice_PauseEnemyATB, X

	DEC MegaMalice_EnemyATBTicks, X
	BPL MegaMalice_Stage3Move

	DEC MegaMalice_EnemyATB, X
	LDA MegaMalice_EnemyATBRate, X
	STA MegaMalice_EnemyATBTicks, X

MegaMalice_Stage3Move:
	JSR MegaMalice_JumpAttack

MegaMalice_Stage3NoJump:
	JSR Object_ApplyXVel

MegaMalice_Stage3NoAttack:	
	JSR Object_ApplyY_With_Gravity

	LDA MegaMalice_Health, X
	CMP #12
	BCS MegaMalice_Stage3_End

	LDA #$40
	STA MegaMalice_HealTimer, X

	LDA #SND_LEVELPOWER
	STA Sound_QLevel1

	LDA #48
	STA MegaMalice_Health, X

	INC MegaMalice_Action, X

	LDA #$00
	STA MegaMalice_PauseEnemyATB, X

	LDA #$04
	STA MegaMalice_EnemyATBRate, X

MegaMalice_Stage3_End:
	JMP MegaMalice_Draw	

MegaMalice_Stage4:
	LDA MegaMalice_PauseEnemy, X
	BEQ MegaMalice_Stage4CheckCharge

	JMP MegaMalice_Stage4NoAttack

MegaMalice_Stage4CheckCharge:
	JSR MegaMalice_Charge

	LDA MegaMalice_Charging, X
	BNE MegaMalice_Stage4ATBCheck

	LDA MegaMalice_EnemyATB, X
	CMP #$20
	BNE MegaMalice_Stage4ATBCheck

	LDA #$20
	STA Objects_Timer, X

MegaMalice_Stage4ATBCheck:
	LDA MegaMalice_EnemyATBTicks, X
	BNE MegaMalice_Stage4NoMalice

	LDA MegaMalice_EnemyATB, X
	CMP #$08
	BNE MegaMalice_Stage4NoMalice
	
	JSR MegaMalice_MakeMalice

MegaMalice_Stage4NoMalice:
	LDA MegaMalice_EnemyATB, X
	BNE MegaMalice_Stage4Attack

	INC MegaMalice_PauseEnemy, X
	
	LDA #$00
	STA MegaMalice_PauseEnemyATB, X
	BEQ MegaMalice_Stage4NoAttack

MegaMalice_Stage4Attack:
	LDA #$01
	STA MegaMalice_PauseEnemyATB, X

	DEC MegaMalice_EnemyATBTicks, X
	BPL MegaMalice_Stage4Move

	DEC MegaMalice_EnemyATB, X
	LDA MegaMalice_EnemyATBRate, X
	STA MegaMalice_EnemyATBTicks, X

MegaMalice_Stage4Move:
	JSR MegaMalice_JumpAttack

MegaMalice_Stage4NoJump:
	LDA Objects_Timer, X
	BNE MegaMalice_Stage4NoAttack

	JSR Object_ApplyXVel

	LDA MegaMalice_Charging, X
	BEQ MegaMalice_Stage4NoAttack

	JSR Object_ApplyXVel
	JSR Object_ApplyXVel

MegaMalice_Stage4NoAttack:	
	JSR Object_ApplyY_With_Gravity

	LDA MegaMalice_Health, X
	CMP #12
	BCS MegaMalice_Stage4_End

	LDA #$40
	STA MegaMalice_HealTimer, X

	LDA #SND_LEVELPOWER
	STA Sound_QLevel1

	LDA #48
	STA MegaMalice_Health, X

	INC MegaMalice_Action, X

	LDA #$00
	STA MegaMalice_PauseEnemyATB, X

	LDA #$04
	STA MegaMalice_EnemyATBRate, X

MegaMalice_Stage4_End:
	JMP MegaMalice_Draw	

MegaMalice_Stage5:
	LDA MegaMalice_PauseEnemy, X
	BEQ MegaMalice_Stage5CheckCharge

	JSR MegaMalice_MakeSpore
	JMP MegaMalice_Stage5NoAttack

MegaMalice_Stage5CheckCharge:
	JSR MegaMalice_Charge

	LDA MegaMalice_Charging, X
	BNE MegaMalice_Stage5ATBCheck

	LDA MegaMalice_EnemyATB, X
	CMP #$20
	BNE MegaMalice_Stage5ATBCheck

	LDA #$20
	STA Objects_Timer, X

MegaMalice_Stage5ATBCheck:
	LDA MegaMalice_EnemyATB, X
	CMP #$08
	BCC MegaMalice_Stage5NoMalice
	
	JSR MegaMalice_MakeMalice

MegaMalice_Stage5NoMalice:
	LDA MegaMalice_EnemyATB, X
	BNE MegaMalice_Stage5Attack

	INC MegaMalice_PauseEnemy, X
	
	LDA #$00
	STA MegaMalice_PauseEnemyATB, X
	BEQ MegaMalice_Stage5NoAttack

MegaMalice_Stage5Attack:
	LDA #$01
	STA MegaMalice_PauseEnemyATB, X

	DEC MegaMalice_EnemyATBTicks, X
	BPL MegaMalice_Stage5Move

	DEC MegaMalice_EnemyATB, X
	LDA MegaMalice_EnemyATBRate, X
	STA MegaMalice_EnemyATBTicks, X

MegaMalice_Stage5Move:
	JSR MegaMalice_JumpAttack

MegaMalice_Stage5NoJump:
	LDA Objects_Timer, X
	BNE MegaMalice_Stage5NoAttack

	JSR Object_ApplyXVel

	LDA MegaMalice_Charging, X
	BEQ MegaMalice_Stage5NoAttack

	JSR Object_ApplyXVel
	JSR Object_ApplyXVel

MegaMalice_Stage5NoAttack:	
	JSR Object_ApplyY_With_Gravity

	LDA MegaMalice_Health, X
	BEQ MegaMalice_NoHealth
	BPL MegaMalice_Stage5_End

MegaMalice_NoHealth:
	INC MegaMalice_Action, X

MegaMalice_Stage5_End:
	JMP MegaMalice_Draw	

MegaMalice_SparkleX:
	.byte 00, $18, $14, $04

MegaMalice_SparkleY:
	.byte $00, $FC, $00, $FC

MegaMalice_Heal:
	LDA MegaMalice_HealTimer, X
	BEQ MegaMalice_HealRTS

	DEC MegaMalice_HealTimer, X
	LDA MegaMalice_HealTimer, X
	AND #$0F
	BNE MegaMalice_HealRTS

	LDA <Objects_XZ, X
	STA <Temp_Var1

	LDA <Objects_YZ, X
	STA <Temp_Var2

	LDA MegaMalice_HealTimer, X
	LSR A
	LSR A
	LSR A
	LSR A
	AND #$03
	TAX

	JSR SpecialObject_FindEmpty

	LDA #$10 
	STA SpecialObj_Timer, Y
	
	LDA #SOBJ_COINSPARKLE
	STA SpecialObj_ID, Y

	LDA <Temp_Var1
	ADD MegaMalice_SparkleX, X
	STA SpecialObj_X, Y

	LDA <Temp_Var2
	ADD MegaMalice_SparkleY, X
	STA SpecialObj_Y, Y

MegaMalice_HealRTS:
	LDX #$07

MegaMalice_SparkleUp:
	LDA SpecialObj_ID, X
	CMP #SOBJ_COINSPARKLE
	BNE MegaMalice_NoSparkle

	DEC SpecialObj_Y, X
	DEC SpecialObj_Y, X

MegaMalice_NoSparkle:
	DEX
	BPL MegaMalice_SparkleUp

	LDX <CurrentObjectIndexZ
	RTS	

MegaMalice_CheckAbove:
	LDA <Player_YHiZ
	BEQ MegaMalice_IncreaseAbove

	LDA <Player_YZ
	CMP #$11
	BCS MegaMalice_ClearAbove

MegaMalice_IncreaseAbove:
	LDA MegaMalice_PlayerAboveTicker, X
	CMP #$80
	BCS MegaMalice_CheckAboveRTS

	INC MegaMalice_PlayerAboveTicker, X
	BNE MegaMalice_CheckAboveRTS

MegaMalice_ClearAbove:
	LDA #$00
	STA MegaMalice_PlayerAboveTicker, X

MegaMalice_CheckAboveRTS:
	RTS

MegaMalice_JumpAttack:
	LDA Objects_Timer, X
	BNE MegaMalice_JumpAttackRTS
	
	LDA MegaMalice_PlayerAboveTicker, X
	CMP #$80
	BCC MegaMalice_JumpAttackRTS

	LDA <Objects_YZ, X
	CMP #$70
	BNE MegaMalice_JumpAttackRTS

	LDA #$00
	STA MegaMalice_PlayerAboveTicker, X

	LDA #$A0
	STA <Objects_YVelZ, X

MegaMalice_JumpAttackRTS:
	RTS	

MegaMalice_MakeMalice:
	LDA MegaMalice_PauseEnemy, X
	BNE MegaMalice_MakeMaliceRTS

	LDA Object_Count
	CMP #$04
	BCS MegaMalice_MakeMaliceRTS

	JSR Object_FindEmptyY
	BCC MegaMalice_MakeMaliceRTS

	LDA #OBJ_MALICEMUSHROOM
	STA Objects_ID, Y

	LDA <Objects_XZ, X
	ADD #$08
	STA Objects_XZ, Y

	LDA <Objects_YZ, X
	STA Objects_YZ, Y

	LDA <Objects_YHiZ, X
	STA Objects_YHiZ, Y

	LDA #$03
	STA Objects_Property, Y

	LDA #$E0
	STA Objects_YVelZ, Y

	LDA <Objects_XVelZ, X
	JSR Half_Value
	JSR Negate
	STA Objects_XVelZ, Y

	LDA #OBJSTATE_NORMAL
	STA Objects_State, Y

	LDA #SPR_PAL1
	STA Objects_SpriteAttributes, Y

	LDA #$00
	STA Objects_WeaponAttr, Y

	LDA #ATTR_NOICE
	STA Objects_BehaviorAttr, Y

	LDA #BOUND16x16
	STA Objects_BoundBox, Y 

MegaMalice_MakeMaliceRTS:
	RTS

MegaMalice_ChargeRandomATB:
	.byte $18, $18, $18, $18

MegaMalice_Charge:
	LDA Objects_Timer, X
	BEQ MegaMalice_ChargeRTS

	CMP #$01
	BNE MegaMalice_ChargeRTS

MegaMalice_ChargeAttack:
	INC MegaMalice_Charging, X

MegaMalice_ChargeRTS:
	RTS

MegaMalice_MakeSpore:
	LDA MegaMalice_EnemyATBTicks, X
	BNE MegaMalice_MakeSporeRTS

	LDA MegaMalice_EnemyATB, X
	CMP #$0C
	BNE MegaMalice_MakeSporeRTS

MegaMalice_ProduceSpore:
	JSR Object_FindEmptyY
	BCC MegaMalice_MakeSporeRTS

	LDA #OBJ_POWERUP
	STA Objects_ID, Y

	LDA #POWERUP_SPORE
	STA PowerUp_Type, Y

	LDA #$B0
	STA Objects_YVelZ, Y

	LDA <Objects_XZ, X
	ADD #$08
	STA Objects_XZ, Y

	LDA <Objects_YZ, X
	STA Objects_YZ, Y

	LDA <Objects_YHiZ, X
	STA Objects_YHiZ, Y
	
MegaMalice_MakeSporeRTS:
	RTS

MegaMalice_Die:
	LDA #$00
	STA Enemy_Health
	STA Objects_ID, X

	LDA #$40
	STA Objects_Timer2, X


	JSR DestroyAllEnemies
	
	LDA #OBJ_BOSS
	STA Objects_ID, X

	INC MegaMalice_Action, X
	JMP MegaMalice_Draw

MegaMalice_Death:
	LDA Objects_Timer2, X
	BNE MegaMalice_DeathRTS

	LDX #$00
	JSR Object_Explode

	LDX <CurrentObjectIndexZ

	LDA <Objects_XZ, X
	ADD #$08
	STA <Objects_XZ

	LDA <Objects_YZ, X
	ADD #$04
	STA <Objects_YZ

	LDA <Objects_YHiZ, X
	ADC #$00
	STA <Objects_YHiZ

	LDA #$20
	STA Objects_Timer2 

	INC MegaMalice_Action, X

	LDA #MUS1_STOPMUSIC
	STA Sound_QMusic1

	LDA #$40
	STA Objects_Timer, X

MegaMalice_DeathRTS:
	JMP MegaMalice_Draw

MegaMalice_FanFare:
	LDA Objects_Timer, X
	BNE MegaMalice_FanFareRTS

	LDA #MUS1_WORLDVICTORY
	STA Sound_QMusic1

	INC MegaMalice_Action, X

	LDA #$02
	STA CreditsWait, X

	LDA #$FF
	STA CreditsWaitTicks, X

MegaMalice_FanFareRTS:
	RTS

CreditsWait = Objects_Data3
CreditsWaitTicks = Objects_Data4

MegaMalice_WaitEnding:
	LDA CreditsWait, X
	BNE MegaMalice_WaitEndingEnd

	INC Credits_Action, X

MegaMalice_WaitEndingEnd:
	DEC CreditsWaitTicks, X
	BNE MegaMalice_WaitEndingRTS

	DEC CreditsWait, X

MegaMalice_WaitEndingRTS:
	RTS

Credits_Action = Objects_Data1
CreditsFade_Tick = Objects_Data2
CreditsFade_Index = Objects_Data3

MegaMalice_Credits:
	LDA #MUS2A_ENDING
	STA Level_MusicQueue

	INC Credits_Action, X

	LDA #$07
	STA CreditsFade_Tick, X

	LDA #$00
	STA CreditsFade_Index, X
	RTS	

Credits_FadeOut:
	LDA CreditsFade_Tick, X
	BNE Credits_FadeTickDecrease

	LDY #$0F

	LDA #$06
	STA <Graphics_Queue
	
Credits_FadeOutLoop:
	LDA MasterPal_Data, Y
	SUB CreditsFade_Index, X
	BPL Credits_FadeOutStore

	LDA #$0F

Credits_FadeOutStore:
	STA Palette_Buffer, Y
	DEY
	BPL Credits_FadeOutLoop

	LDA CreditsFade_Index, X
	ADD #$10
	CMP #$50
	BCC Credits_Reset

	INC Credits_Action, X

	LDY #$0A

	LDA #$01

Credits_ClearBlocks:	
	STA $6132, Y
	STA $60F2, Y
	DEY
	BNE Credits_ClearBlocks
	RTS

Credits_Reset:
	STA CreditsFade_Index, X

	LDA #$07
	STA CreditsFade_Tick, X

Credits_FadeTickDecrease:
	DEC CreditsFade_Tick, X

MegaMalice_FadeOutRTS:
	RTS

Credits_ClearGfx1:
	LDY #$00
	LDX Graphics_BufCnt
	BNE Credits_ClearGfx1RTS

Credits_ClearGfxLoop1:
	LDA Credits_Clear1, Y
	STA Graphics_Buffer, X

	INX
	INY
	CPY #(Credits_ClearEnd1 - Credits_Clear1)
	BCC Credits_ClearGfxLoop1

	STX Graphics_BufCnt
	
	LDX <CurrentObjectIndexZ
	INC Credits_Action, X

Credits_ClearGfx1RTS:
	RTS

Credits_Clear1:
	.word $2808
	.byte VU_REPEAT | $10, $FF
	
	vaddr $2828
	.byte VU_REPEAT | $10, $FF

	vaddr $2906
	.byte VU_REPEAT | $14, $FF

	.byte $00
Credits_ClearEnd1:

Credits_ClearGfx2:
	LDY #$00
	LDX Graphics_BufCnt
	BNE Credits_ClearGfx1RTS

Credits_ClearGfxLoop2:
	LDA Credits_Clear2, Y
	STA Graphics_Buffer, X

	INX
	INY
	CPY #(Credits_ClearEnd2 - Credits_Clear2)
	BCC Credits_ClearGfxLoop2

	STX Graphics_BufCnt
	
	LDX <CurrentObjectIndexZ
	INC Credits_Action, X

Credits_ClearGfx2RTS:
	RTS

Credits_Clear2:
	vaddr $2943
	.byte VU_REPEAT | $6, $FF

	vaddr $2957
	.byte VU_REPEAT | $6, $FF

	vaddr $2963
	.byte VU_REPEAT | $6, $FF

	vaddr $2977
	.byte VU_REPEAT | $6, $FF

	vaddr $2983
	.byte VU_REPEAT | $6, $FF

	vaddr $2997
	.byte VU_REPEAT | $6, $FF
	
	.byte $00
Credits_ClearEnd2:	

Credits_FixPalette:
	LDA Graphics_BufCnt
	BNE Credits_FixPaletteRTS

	LDA #$30
	STA Palette_Buffer + 1

	LDA #$06
	STA Graphics_Queue
	
	LDA #$01
	STA Credits_Triggered
	STA Credits_LineWriteToggle, X


	LDA #$00
	STA Credits_LineTimerHi, X
	STA Credits_LineTimerLow, X
	STA Credits_LineWriteColumn, X
	STA Credits_LineWriteIndex, X

	LDA #$02
	STA Credits_LineWriteTimer, X

Credits_FixPaletteRTS:	
	RTS