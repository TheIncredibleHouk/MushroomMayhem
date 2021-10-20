	.org $A000

ObjGiant_Mirror:
	LDY Object_SpriteRAMOffset, X
	LDA Sprite_RAMAttr + 8, Y
	ORA #SPR_HFLIP
	STA Sprite_RAMAttr + 8, Y
	STA Sprite_RAMAttr + 12, Y
	STA Sprite_RAMAttr + 24, Y
	STA Sprite_RAMAttr + 28, Y
	RTS

ObjNorm_Boss:
	
	LDA Objects_Property, X
	JSR DynJump

	.word Boss_Cheep
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
	CMP #(TILE_PROP_SOLID_TOP | TILE_PROP_ENEMYSOLID)
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
	CMP #(TILE_PROP_SOLID_TOP | TILE_PROP_ENEMYSOLID)
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

Boss_CheepNextStage:
	
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