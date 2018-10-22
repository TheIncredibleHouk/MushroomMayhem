    .org ObjectGroup_InitJumpTable
;****************************** OBJECT INITIALIZATION ******************************
    .word ObjInit_WoodenPlatCopyDiagonal2	; Object $28 - OBJ_PLATFORM_DIAG2OSC
	.word ObjInit_Spike	; Object $29 - OBJ_SPIKE
	.word ObjInit_Spark		; Object $2A - OBJ_SPARK
	.word ObjInit_DiagonalPodobo		; Object $2B - OBJ_RICOCHET_PODOBO
	.word ObjInit_WoodenPlatCopyCCW	; Object $2C - OBJ_PLATFORM_CLOCKOSC
	.word ObjInit_WoodenPlatCopyCW	; Object $2D - OBJ_PLATFORM_CCLOCKOSC
	.word ObjInit_PirateBoo	; Object $2E - OBJ_PIRATEBOO
	.word ObjInit_Boo		; Object $2F - OBJ_BOO
	.word ObjInit_DoNothing	; Object $30 - OBJ_PACBOO
	.word ObjInit_Phanto		; Object $31 - OBJ_PHANTO
	.word ObjInit_PhantoFlip	; Object $32 - OBJ_PHANTO_FLIP
	.word ObjInit_DoNothing		; Object $33 - OBJ_NIPPER
	.word ObjInit_Toad		; Object $34 - OBJ_TOAD
	.word ObjInit_Lightning		; Object $35 - OBJ_LIGHTNINGBOLT
	.word ObjInit_PlatformCopyFollow	; Object $36 - OBJ_PLATFORM_PATH
	.word ObjInit_DoNothing	; Object $37 - OBJ_PLATFORM_DIAG1OSCS
	.word ObjInit_DoNothing	; Object $38 - OBJ_PLATFORM_DIAG2OSCS
	.word ObjInit_DoNothing	; Object $39 - OBJ_PACBOOHOME
	.word ObjInit_DoNothing	; Object $3A - OBJ_JUMPCONTROL
	.word ObjInit_DoNothing	; Object $3B - OBJ_SPECTERCHEEP

    .org ObjectGroup_NormalJumpTable
;****************************** OBJECT GAME LOOP ******************************
	.word ObjNorm_PlatformCopyOscillate	; Object $28 - OBJ_PLATFORM_DIAG2OSC
	.word ObjNorm_Spike		; Object $29 - OBJ_SPIKE
	.word ObjNorm_Spark		; Object $2A - OBJ_SPARK
	.word ObjNorm_DiagonalPodobo	; Object $2B - OBJ_RICOCHET_PODOBO
	.word ObjNorm_PlatformCopyOscillate		; Object $2C - OBJ_PLATFORM_CLOCKOSC
	.word ObjNorm_PlatformCopyOscillate		; Object $2D - OBJ_PLATFORM_CCLOCKOSC
	.word ObjNorm_PirateBoo	; Object $2E - OBJ_PIRATEBOO
	.word ObjNorm_Boo		; Object $2F - OBJ_BOO
	.word ObjNorm_DoNothing	; Object $30 - OBJ_PACBOO
	.word ObjNorm_Phanto		; Object $31 - OBJ_PHANTO
	.word ObjNorm_Phanto		; Object $32 - OBJ_PHANTO_FLIP
	.word ObjNorm_DoNothing		; Object $33 - OBJ_NIPPER
	.word ObjNorm_Toad		; Object $34 - OBJ_TOAD
	.word ObjNorm_Lightning	; Object $35 - OBJ_LIGHTNINGBOLT
	.word ObjNorm_PlatformCopyFollow	; Object $36 - OBJ_PLATFORM_PATH
	.word ObjNorm_DoNothing	; Object $37 - OBJ_PLATFORM_DIAG1OSCS
	.word ObjNorm_DoNothing	; Object $38 - OBJ_PLATFORM_DIAG2OSCS
	.word ObjNorm_DoNothing		; Object $39 - OBJ_PACBOOHOME
	.word ObjNorm_DoNothing	; Object $3A - OBJ_JUMPCONTROL
	.word ObjNorm_DoNothing	; Object $3B - OBJ_SPECTERCHEEP

    .org ObjectGroup_CollideJumpTable
;****************************** OBJECT PLAYER INTERACTION ******************************
	.word Platform_PlayerStand		; Object $28 - OBJ_PLATFORM_DIAG2OSC
	.word ObjHit_DoNothing		; Object $29 - OBJ_SPIKE
	.word Player_GetHurt		; Object $2A - OBJ_SPARK
	.word Player_GetHurt	; Object $2B - OBJ_RICOCHET_PODOBO
	.word Platform_PlayerStand		; Object $2C - OBJ_PLATFORM_CLOCKOSC
	.word Platform_PlayerStand		; Object $2D - OBJ_PLATFORM_CCLOCKOSC
	.word PirateBoo_TakeCoins		; Object $2E - OBJ_PIRATEBOO
	.word Player_GetHurt		; Object $2F - OBJ_BOO
	.word Player_GetHurt		; Object $30 - OBJ_PACBOO
	.word Player_GetHurt		; Object $31 - OBJ_PHANTO
	.word Player_GetHurt		; Object $32 - OBJ_PHANTO_FLIP
	.word Player_GetHurt		; Object $33 - OBJ_NIPPER
	.word ObjHit_DoNothing		; Object $34 - OBJ_TOAD
	.word Player_GetHurt		; Object $35 - OBJ_LIGHTNINGBOLT
	.word Platform_PlayerStand		; Object $36 - OBJ_PLATFORM_PATH
	.word Platform_PlayerStand		; Object $37 - OBJ_PLATFORM_DIAG1OSCS
	.word Platform_PlayerStand		; Object $38 - OBJ_PLATFORM_DIAG2OSCS
	.word ObjHit_DoNothing		; Object $39 - OBJ_PACBOOHOME
	.word ObjHit_DoNothing		; Object $3A - OBJ_JUMPCONTROL
	.word Player_GetHurt		; Object $3B - OBJ_SPECTERCHEEP

    .org ObjectGroup_PatTableSel
;****************************** OBJECT PALETTE/SIZE ******************************
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH48	; Object $28 - OBJ_PLATFORM_DIAG2OSC
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $29 - OBJ_SPIKE
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $2A - OBJ_SPARK
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $2B - OBJ_RICOCHET_PODOBO
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH48	; Object $2C - OBJ_PLATFORM_CLOCKOSC
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH48	; Object $2D - OBJ_PLATFORM_CCLOCKOSC
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $2E - OBJ_PIRATEBOO
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $2F - OBJ_BOO
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $30 - OBJ_PACBOO
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $31 - OBJ_PHANTO
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $32 - OBJ_PHANTO_FLIP
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $33 - OBJ_NIPPER
	.byte OA1_PAL3 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $34 - OBJ_TOAD
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH8	; Object $35 - OBJ_LIGHTNINGBOLT
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH48	; Object $36 - OBJ_PLATFORM_PATH
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH48	; Object $37 - OBJ_PLATFORM_DIAG1OSCS
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH48	; Object $38 - OBJ_PLATFORM_DIAG2OSCS
	.byte OA1_PAL0 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $39 - OBJ_PACBOOHOME
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH48	; Object $3A - OBJ_JUMPCONTROL
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $3B - OBJ_SPECTERCHEEP

    .org ObjectGroup_PatTableSel
;****************************** OBJECT PATTERN TABLE ******************************
	.byte OPTS_NOCHANGE	; Object $28 - OBJ_PLATFORM_DIAG2OSC
	.byte OPTS_SETPT5 | $0E	; Object $29 - OBJ_SPIKE
	.byte OPTS_SETPT5 | $0A	; Object $2A - OBJ_SPARK
	.byte OPTS_SETPT5 | $0A	; Object $2B - OBJ_RICOCHET_PODOBO
	.byte OPTS_NOCHANGE	; Object $2C - OBJ_PLATFORM_CLOCKOSC
	.byte OPTS_NOCHANGE	; Object $2D - OBJ_PLATFORM_CCLOCKOSC
	.byte OPTS_SETPT5 | $37	; Object $2E - OBJ_PIRATEBOO
	.byte OPTS_SETPT5 | $37	; Object $2F - OBJ_BOO
	.byte OPTS_SETPT5 | $37	; Object $30 - OBJ_PACBOO
	.byte OPTS_SETPT5 | $37	; Object $31 - OBJ_PHANTO
	.byte OPTS_SETPT5 | $12	; Object $32 - OBJ_PHANTO_FLIP
	.byte OPTS_SETPT5 | $37	; Object $33 - OBJ_NIPPER
	.byte OPTS_SETPT5 | $37	; Object $34 - OBJ_TOAD
	.byte OPTS_SETPT5 | $1A	; Object $35 - OBJ_LIGHTNINGBOLT
	.byte OPTS_NOCHANGE	; Object $36 - OBJ_PLATFORM_PATH
	.byte OPTS_NOCHANGE	; Object $37 - OBJ_PLATFORM_DIAG1OSCS
	.byte OPTS_NOCHANGE	; Object $38 - OBJ_PLATFORM_DIAG2OSCS
	.byte OPTS_NOCHANGE; Object $39 - OBJ_PACBOOHOME
	.byte OPTS_SETPT6 | $13	; Object $3A - OBJ_JUMPCONTROL
	.byte OPTS_SETPT6 | $13	; Object $3B - OBJ_SPECTERCHEEP

	.org ObjectGroup_KillAction	
;****************************** OBJECT DEATH ROUTINE ******************************
	.byte KILLACT_STANDARD	; Object $28 - OBJ_PLATFORM_DIAG2OSC
	.byte KILLACT_NORMALSTATE	; Object $29 - OBJ_SPIKE
	.byte KILLACT_POOFDEATH	; Object $2A - OBJ_SPARK
	.byte KILLACT_POOFDEATH	; Object $2B - OBJ_RICOCHET_PODOBO
	.byte KILLACT_STANDARD	; Object $2C - OBJ_PLATFORM_CLOCKOSC
	.byte KILLACT_STANDARD	; Object $2D - OBJ_PLATFORM_CCLOCKOSC
	.byte KILLACT_POOFDEATH	; Object $2E - OBJ_PIRATEBOO
	.byte KILLACT_POOFDEATH	; Object $2F - OBJ_BOO
	.byte KILLACT_NORMALSTATE	; Object $30 - OBJ_PACBOO
	.byte KILLACT_NORMALSTATE	; Object $31 - OBJ_PHANTO
	.byte KILLACT_POOFDEATH	; Object $32 - OBJ_PHANTO_FLIP
	.byte KILLACT_STANDARD	; Object $33 - OBJ_NIPPER
	.byte KILLACT_STANDARD	; Object $34 - OBJ_TOAD
	.byte KILLACT_POOFDEATH	; Object $35 - OBJ_LIGHTNINGBOLT
	.byte KILLACT_STANDARD	; Object $36 - OBJ_PLATFORM_PATH
	.byte KILLACT_STANDARD	; Object $37 - OBJ_PLATFORM_DIAG1OSCS
	.byte KILLACT_STANDARD	; Object $38 - OBJ_PLATFORM_DIAG2OSCS
	.byte KILLACT_POOFDEATH	; Object $39 - OBJ_PACBOOHOME
	.byte KILLACT_STANDARD	; Object $3A - OBJ_JUMPCONTROL
	.byte KILLACT_POOFDEATH	; Object $3B - OBJ_SPECTERCHEEP


OG3_POff .func (\1 - ObjectGroup03_PatternSets)

	.org ObjectGroup_PatternStarts	; <-- help enforce this table *here*
;****************************** OBJECT FRAME TABLE ******************************
	.byte OG3_POff(ObjP28), OG3_POff(ObjP29), OG3_POff(ObjP2A), OG3_POff(ObjP2B)
	.byte OG3_POff(ObjP2C), OG3_POff(ObjP2D), OG3_POff(ObjP2E), OG3_POff(ObjP2F)
	.byte OG3_POff(ObjP30), OG3_POff(ObjP31), OG3_POff(ObjP32), OG3_POff(ObjP33)
	.byte OG3_POff(ObjP34), OG3_POff(ObjP35), OG3_POff(ObjP36), OG3_POff(ObjP37)
	.byte OG3_POff(ObjP38), OG3_POff(ObjP39), OG3_POff(ObjP3A), OG3_POff(ObjP3B)


	.org ObjectGroup_PatternSets	; <-- help enforce this table *here*

ObjectGroup03_PatternSets:

ObjP28:
ObjP29:
ObjP2C:
ObjP2D:
	.byte $B1, $B3, $B5, $B7, $B9, $BB, $B1, $BF, $B1, $B3

ObjP2A:
	.byte $AF, $AF, $BF, $BF

ObjP2B:
	.byte $B1, $B3, $B5, $B7, $B9, $BB    


ObjP2E:
	.byte $B5, $B7

ObjP2F:
	.byte $B1, $B3, $91, $93

ObjP30:
	.byte $91, $93, $B1, $B3, $95, $97

ObjP31:
ObjP32:
	.byte $BD, $BF

ObjP33:
	.byte $95, $97, $B5, $B7, $9D, $9F, $BD, $BF, $99, $9B, $B9, $BB

ObjP34:
	.byte $8D, $8F, $89, $8B 

ObjP35:
	.byte $99, $9B
	.byte $95, $97, $AD, $AF, $95, $97

ObjP36:
ObjP37:
ObjP38:    
ObjP39:
ObjP3A:
	.byte $71, $E1, $E3, $E1, $E3, $71
	
ObjP3B:
	.byte $FB, $FD, $71, $71, $FB, $FD, $71, $71, $FB, $FF, $71, $71, $FB, $FF, $71, $71
	
Spike_Frames:
	.byte $04, $04, $04, $04, $04, $02, $02, $03, $03, $03, $03, $02, $02, $02, $02

Spike_XOff:
	.byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	.byte $00, $00, $01, $02, $03, $04

Spike_YOff:
	.byte $00, $00, $00, $FE, $FE, $FC, $FA, $F8, $F6, $F4, $F2
	.byte $F0, $EE, $F0, $F0, $F0, $F0

ObjInit_Spike:
	LDA #$04
	STA Objects_SpritesRequested, X

	LDA #ATTR_ICEPROOF
	STA Objects_WeaponAttr, X
	
	LDA #(ATTR_STOMPKICKSOUND)
	STA Objects_BehaviorAttr, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #$40
	STA Objects_Timer, X
	STA Objects_Regen, X

	LDA #$02
	STA Objects_ExpPoints, X
	RTS

Spike_Action = Objects_Data3
Spike_Frame = Objects_Data4
Spike_BallOffset = Objects_Data5

ObjNorm_Spike:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE Spike_Norm1
	
	LDA Spike_Action, X
	BEQ Spike_Die

	LDA <Objects_XZ, X
	STA Debris_X

	LDA <Objects_YZ, X
	STA Debris_Y

	JSR Common_MakeDebris

	LDA #$99
	STA BrickBust_Tile, Y

	LDA #SPR_PAL1
	STA BrickBust_Pal, Y
	
Spike_Die:
	JMP ObjState_PoofDying

Spike_Norm1:
	LDA <Player_HaltGameZ
	BEQ Spike_Norm
	JMP Spike_Draw

Spike_Norm:
	JSR Object_DeleteOffScreen
	JSR Object_CalcBoundBox
	JSR Object_FacePlayer
	JSR Object_AttackOrDefeat

	LDA Spike_Action, X
	JSR DynJump

	.word SpikeWait
	.word SpikeOpenMouth
	.word SpikeThrowSpike

SpikeWait:
	LDA #$00
	STA Objects_Frame, X

	LDA Objects_Timer, X
	BNE SpikeWait1

	INC Spike_Action, X

	LDA #$60
	STA Objects_Timer, X

SpikeWait1:
	LDA Object_SpriteRAMOffset,X
	JMP Spike_Draw

SpikeOpenMouth:
	INC Spike_Frame, X
	INC Spike_BallOffset, X

	LDA Spike_BallOffset, X
	CMP #$20
	BCC SpikeOpenMouth0

	LDA #$20
	STA Spike_BallOffset, X

	LDA Objects_Timer, X
	BNE SpikeOpenMouth0

	INC Spike_Action, X

SpikeOpenMouth0:
	LDA Spike_Frame, X
	CMP #$20
	BCS SpikeOpenMouth1

	LSR A
	LSR A
	LSR A
	AND #$03
	STA Objects_Frame, X

SpikeOpenMouth1:
	JMP Spike_Draw
	
SpikeThrow_XVel:
	.byte $10, $18

SpikeThrow_YVel:
	.byte $D0, $C0

SpikeThrowSpike:
	LDA Objects_SpritesHorizontallyOffScreen,X
	ORA Objects_SpritesHorizontallyOffScreen,X
	BNE Spike_Draw

	JSR Object_FindEmptyX
	BCC Spike_Draw

	LDY <CurrentObjectIndexZ

	LDA #OBJ_SPIKEBALL
	STA Objects_ID, X

	LDA #OBJSTATE_FRESH
	STA Objects_State, X

	LDA Objects_YZ, Y
	SUB #$12
	STA <Objects_YZ, X

	LDA Objects_YHiZ, Y
	SBC #$00
	STA <Objects_YHiZ, X

	LDA Objects_XZ, Y
	STA <Objects_XZ, X

	LDA Objects_XHiZ, Y
	STA <Objects_XHiZ, X

	
	LDA RandomN, X
	AND #$01
	TAY

	LDA SpikeThrow_XVel, Y
	STA <Objects_XVelZ, X

	LDY CurrentObjectIndexZ

	LDA Objects_Orientation, Y
	AND #SPR_HFLIP
	BNE Spike_BallNoFlip

	LDA <Objects_XVelZ, X
	EOR #$FF
	ADD #$01
	STA <Objects_XVelZ, X

Spike_BallNoFlip:
	LDA RandomN, X
	AND #$10
	LSR A
	LSR A
	LSR A
	LSR A
	TAY

	LDA SpikeThrow_YVel, Y
	STA <Objects_YVelZ, X

	JSR Object_CalcBoundBox

	LDX <CurrentObjectIndexZ
	LDA #$00
	STA Spike_Action, X
	STA Spike_BallOffset, X
	STA Spike_Frame, X

	LDA #$40
	STA Objects_Timer, X

Spike_Draw:
	JSR Object_Draw
	
	LDA Spike_Action, X
	BEQ Spike_Draw1

	LDY Object_SpriteRAMOffset, X

	LDA #$95
	STA Sprite_RAMTile + 8, Y
	STA Sprite_RAMTile + 12, Y

	LDA #SPR_PAL1
	STA Sprite_RAMAttr + 8, Y

	LDA #(SPR_PAL1 | SPR_HFLIP)
	STA Sprite_RAMAttr + 12, Y

	LDA Spike_BallOffset, X
	LSR A
	STA <Temp_Var1

	LDX <CurrentObjectIndexZ
	LDA Objects_Orientation, X
	BEQ Spike_BallRight

	LDX <Temp_Var1

	LDA Sprite_RAMX, Y
	SUB Spike_XOff, X
 	BCC Spike_BallUnderflow2

	STA Sprite_RAMX + 8, Y
	
	LDA Sprite_RAMY, Y
	ADD Spike_YOff, X
	STA Sprite_RAMY + 8, Y

	LDA Sprite_RAMX + 8, Y
	ADD #$08
	BCS Spike_BallUnderflow2
	
	STA Sprite_RAMX + 12, Y

	LDA Sprite_RAMY, Y
	ADD Spike_YOff, X
	STA Sprite_RAMY + 12, Y

Spike_BallUnderflow2:
	RTS

Spike_BallRight:
	LDX <Temp_Var1

	LDA Sprite_RAMX, Y
	ADD Spike_XOff, X
	BCS Spike_Draw1
	STA Sprite_RAMX + 8, Y

	LDA Sprite_RAMY, Y
	ADD Spike_YOff, X
	STA Sprite_RAMY + 8, Y

	LDA Sprite_RAMX + 8, Y
	ADD #$08
	BCS Spike_Draw1
	
	STA Sprite_RAMX + 12, Y

	LDA Sprite_RAMY, Y
	ADD Spike_YOff, X
	STA Sprite_RAMY + 12, Y
Spike_Draw1:
	RTS


Spark_Direction = Objects_Data2
Spark_Speed = Objects_Data3
Spark_HitDetect = Objects_Data4

ObjInit_Spark:
	LDA #BOUND16x16BLOCK
	STA Objects_BoundBox, X

	LDA #(ATTR_FIREPROOF | ATTR_ICEPROOF | ATTR_HAMMERPROOF | ATTR_TAILPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	LDA #$02
	STA Objects_Health, X

	LDA Objects_Property, X
	AND #$01
	STA Spark_Direction, X

	LDA Objects_Property, X
	AND #$FE
	LSR A
	STA Spark_Speed, X

	LDA #$00
	STA Spark_HitDetect, X
	RTS

; this basically detects certain corners based on current movement direction
SparkDetects:
	.byte (HIT_RIGHTWALL | HIT_GROUND), (HIT_LEFTWALL | HIT_GROUND), (HIT_CEILING | HIT_LEFTWALL), (HIT_RIGHTWALL | HIT_CEILING)
	.byte (HIT_LEFTWALL | HIT_GROUND), (HIT_RIGHTWALL | HIT_GROUND), (HIT_CEILING | HIT_RIGHTWALL), (HIT_LEFTWALL | HIT_CEILING)

SparkYVel:
	.byte $10, $10, $F0, $F0
	.byte $10, $10, $F0, $F0

SparkXVel:
	.byte $10, $F0, $F0, $10
	.byte $F0, $10, $10, $F0

ObjNorm_Spark:
	LDA <Player_HaltGameZ
	BEQ SparkNorm

	JMP Spark_Draw

SparkNorm:
	JSR Object_DeleteOffScreen

	LDA Spark_Speed, X
	STA TempA

ObjNorm_Spark1:
	JSR Spark_Move
	DEC TempA
	BPL ObjNorm_Spark1

	JSR Object_AttackOrDefeat
	JMP Spark_Animate

Spark_Move:
	LDA Spark_Direction, X
	ASL A
	ASL A
	ORA Spark_HitDetect, X
	TAY

	LDA SparkXVel, Y
	STA <Objects_XVelZ, X
	STA Objects_EffectiveXVel,X

	LDA SparkYVel, Y
	STA <Objects_YVelZ, X

	TYA
	AND #$01			; only odd numbered states move vertically, even move horzontally
	BNE NoSparkXVel

	LDA <Objects_YZ, X
	AND #$0F
	BNE ApplySparkX

	JSR Object_ApplyYVel_NoGravity

ApplySparkX:
	JSR Object_ApplyXVel
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles

	LDA Objects_TilesDetectZ, X
	JSR Object_CheckForeground

	LDA <Objects_XZ, X
	AND #$0F
	CMP #$0F
	BEQ SparkHitDetection

	CMP #$01
	BEQ SparkHitDetection
	BNE KeepGoing

NoSparkXVel:
	LDA <Objects_XZ, X
	AND #$0F
	BNE ApplySparkY

	JSR Object_ApplyXVel

ApplySparkY:
	JSR Object_ApplyYVel_NoGravity
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles

	LDA Objects_TilesDetectZ, X
	JSR Object_CheckForeground

	LDA <Objects_YZ, X
	AND #$0F
	CMP #$0E
	BEQ SparkHitDetection

	CMP #$01
	BEQ SparkHitDetection
	BNE KeepGoing

SparkHitDetection:
	LDA Spark_Direction, X		; var1 = 0 -> clockwise movement, var1 = 1 -> counter clockwise
	ASL A
	ASL A
	ORA Spark_HitDetect, X
	TAY

	LDA <Objects_TilesDetectZ, X
	AND SparkDetects, Y  
	BNE WallCeilGrndDet

	LDA Spark_HitDetect, X	; neither corner was detected (no ground or wall) so we need to wrap around the tile
	ADD #$01
	AND #$03
	STA Spark_HitDetect, X
	RTS

WallCeilGrndDet:
	CMP SparkDetects, Y
	BNE KeepGoing
	
	LDA Spark_HitDetect, X		; both corners were detected, we need to crawl against the tile
	SUB #$01
	AND #$03
	STA Spark_HitDetect, X

KeepGoing:						; if we only detected one ground or wall we keep going in the same direction
	RTS

Spark_Animate:
	LDA <Counter_1
	AND #$04
	LSR A
	LSR A
	STA Objects_Frame, X

Spark_Draw:
	LDA Object_SpriteRAMOffset, X
	JMP Object_DrawMirrored    


Ricochet_Direction = Objects_Data4

Diagonal_PodoboInitXVel:
	.byte $F0, $F0, $10, $10

Diagonal_PodoboInitYVel:
	.byte $10, $F0, $F0, $10

Diagonal_PodoboSpriteFlips:
	.byte SPR_VFLIP, $00, SPR_HFLIP, SPR_VFLIP | SPR_HFLIP

ObjInit_DiagonalPodobo:
	LDA #(ATTR_FIREPROOF | ATTR_HAMMERPROOF | ATTR_NINJAPROOF | ATTR_TAILPROOF | ATTR_DASHPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	LDA #(ATTR_SHELLPROOF | ATTR_NOICE )
	STA Objects_BehaviorAttr, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA Objects_Property, X
	TAY

	LDA Diagonal_PodoboInitXVel, Y
	STA Objects_XVelZ, X

	LDA Diagonal_PodoboInitYVel, Y
	STA Objects_YVelZ, X

	LDA Diagonal_PodoboSpriteFlips, Y
	STA Objects_Orientation, X

	LDA #$01
	STA Objects_Health, X
	RTS

ObjNorm_DiagonalPodobo:
	LDA <Player_HaltGameZ
	BNE ObjNorm_DiagonalPodoboEnd

	JSR Object_DeleteOffScreen
	
	LDA Ricochet_Direction, X
	CMP #$0A
	BCS ObjNorm_DiagonalPodobo0

	INC Ricochet_Direction, X
	BNE ObjNorm_DiagonalPodobo01

ObjNorm_DiagonalPodobo0
	LDA #$00
	STA Ricochet_Direction, X
	
ObjNorm_DiagonalPodobo01:
	LDA Ricochet_Direction, X
	LSR A
	LSR A
	STA Objects_Frame, X

	INC Object_DisableWater
	JSR Object_ApplyXVel
	JSR Object_ApplyYVel_NoGravity
	
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_CheckForeground

	LDA <Objects_YZ, X
	AND #$0F
	BNE Podobo_RichocetCheck

	LDA Object_BodyTileProp, X
	AND #TILE_PROP_WATER
	BNE Podobo_Richocet

Podobo_RichocetCheck:
	LDA <Objects_TilesDetectZ,X
	AND #(HIT_GROUND | HIT_CEILING)
	BEQ ObjNorm_DiagonalPodobo1
	

Podobo_Richocet:
	LDA <Objects_YVelZ,X	 
	
	EOR #$FF
	ADD #$01
	
	STA <Objects_YVelZ,X
	
	LDA Objects_Orientation, X
	EOR #SPR_VFLIP
	STA Objects_Orientation, X

ObjNorm_DiagonalPodobo1:
	LDA <Objects_TilesDetectZ,X
	AND #(HIT_LEFTWALL | HIT_RIGHTWALL)
	BEQ ObjNorm_DiagonalPodobo2
	
	LDA <Objects_XVelZ,X	 
	
	EOR #$FF
	ADD #$01
	
	STA <Objects_XVelZ, X

	LDA Objects_Orientation, X
	EOR #SPR_HFLIP
	STA Objects_Orientation, X

ObjNorm_DiagonalPodobo2:
	JSR Object_AttackOrDefeat

ObjNorm_DiagonalPodoboEnd:
	JMP Object_Draw

ObjInit_WoodenPlatCopyDiagonal2:
	JSR ObjInit_PlatformCommon
	LDA #$03
	STA Objects_Property, X
	JMP InitPatrol_NoTimers

ObjInit_WoodenPlatCopyCCW:
	JSR ObjInit_PlatformCommon
	LDA #$04
	STA Objects_Property, X
	JMP InitPatrol_NoTimers

ObjInit_WoodenPlatCopyCW:
	JSR ObjInit_PlatformCommon
	LDA #$05
	STA Objects_Property, X
	JMP InitPatrol_NoTimers
    

ObjInit_PlatformCopyFollow:
	JMP ObjInit_PlatformCopyCommon    


ObjNorm_PlatformCopyFollow:
	LDA <Player_HaltGameZ
	BNE ObjNorm_PlatformCopyFollow1	 ; If gameplay halted, Delete if off-screen, otherwise draw wide 48x16 sprite

	JSR PlatformCopyFollow_CheckOffScreen

	LDA #$00
	STA PlatformCopy_MadeContact, X

	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer

	LDA PlatformCopy_SteppedOn, X
	BEQ PlatformCopyFollow_NoMove

	LDA PlatformCopy_Fall, X
	BEQ PlatformCopyFollow_MoveNormal

	JSR Object_ApplyY_With_Gravity
	JMP PlatformCopyFollow_NoMove

PlatformCopyFollow_MoveNormal:
	JSR Object_ApplyXVel
	JSR Object_ApplyYVel_NoGravity	

PlatformCopyFollow_NoMove:
	JSR PlatformCopy_ContactCheck

	LDA PlatformCopy_SteppedOn, X
	BEQ ObjNorm_PlatformCopyFollow1
	
	LDA <Objects_XZ, X
	AND #$0F
	BNE ObjNorm_PlatformCopyFollow1

	LDA <Objects_YZ, X
	AND #$0F
	CMP #$0E
	BNE ObjNorm_PlatformCopyFollow1

	LDA Objects_XVelFrac, X
	ORA Objects_YVelFrac, X
	BNE ObjNorm_PlatformCopyFollow1

	JSR PlatformCopy_FollowBlocks

ObjNorm_PlatformCopyFollow1:
	LDA Objects_SpriteAttributes, X
	ORA #SPR_BEHINDBG
	STA Objects_SpriteAttributes, X

	JMP PlatformCopy_Draw

PlatformCopyFollow_CheckOffScreen:
	JSR Object_DeleteOffScreen
	
	LDY Objects_SpawnIdx,X
	LDA Level_ObjectsSpawned,Y
	ORA #$80
	STA Level_ObjectsSpawned,Y
	RTS

PlatformCopyTimers:
	.byte $01, $11, $21, $31, $41, $51, $61, $71


PlatformCopy_XOffsets:
	.byte $28, $18, $08, $18

PlatformCopy_YOffsets:
	.byte $08, $18, $08, $F8
	.byte $00, $00, $00, $FF

PlatformCopy_XVel:
	.byte $08, $00, $F8, $00

PlatformCopy_YVel:
	.byte $00, $08, $00, $F8

PlatformCopy_Index = Objects_Data1
PlatformCopy_Ticker = Objects_Data2
PlatformCopy_Regen = Objects_Data6
PlatformCopy_NotBehind = Objects_Data7
PlatformCopy_MaxFall = Objects_Data8
PlatformCopy_StartY = Objects_Data9
PlatformCopy_StartYHi = Objects_Data10    

PlatformCopy_FollowBlocks:
	LDA #$00
	STA PlatformCopy_Fall, X

	LDA #$03
	STA PlatformCopy_Index, X

PlatformCopy_CheckBlocks:
	LDY PlatformCopy_Index, X
	LDA PlatformCopy_XOffsets, Y
	ADD <Objects_XZ, X
	STA Block_DetectX

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Block_DetectXHi

	LDA PlatformCopy_YOffsets, Y
	ADD <Objects_YZ, X
	STA Block_DetectY

	LDA PlatformCopy_YOffsets + 4, Y
	ADC <Objects_YHiZ, X
	STA Block_DetectYHi

	JSR Object_DetectTile
	CMP #TILE_PROP_ENEMY
	BEQ PlatformCopy_SetVel

	DEC PlatformCopy_Index, X
	BPL PlatformCopy_CheckBlocks
	
	LDA #$01
	STA PlatformCopy_Fall, X

	LDA #$00
	STA <Objects_XVelZ, X
	RTS

PlatformCopy_SetVel:
	LDA Tile_LastValue
	AND #$C0
	ORA #$01
	JSR Object_ChangeBlock

	LDY PlatformCopy_Index, X
	LDA PlatformCopy_XVel, Y
	STA <Objects_XVelZ, X

	LDA PlatformCopy_YVel, Y
	STA <Objects_YVelZ, X
	RTS    

PlatformCopy_StartX = Objects_Data3
PlatformCopy_StartXHi = Objects_Data4
PlatformCopy_SteppedOn = Objects_Data5
PlatformCopy_MadeContact = Objects_Data6
PlatformCopy_Fall = Objects_Data7

ObjInit_PlatformCopyCommon:
	LDA #$06
	STA Objects_SpritesRequested, X

	LDA #BOUND48x16
	STA Objects_BoundBox, X

	JSR Object_NoInteractions

	LDA <Objects_XZ, X
	STA PlatformCopy_StartX, X

	LDA <Objects_XHiZ, X
	STA PlatformCopy_StartXHi, X

	LDA <Objects_YZ, X
	SUB #$02
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	SBC #$00
	STA <Objects_YHiZ, X

	LDY Objects_Property, X
	LDA PlatformCopyTimers, Y
	STA Patrol_ResetTimer, X
	RTS    


ObjNorm_PlatformCopyOscillate:
	LDA <Player_HaltGameZ
	BNE ObjNorm_PlatformCopyOscillate1	 ; If gameplay halted, Delete if off-screen, otherwise draw wide 48x16 sprite

	JSR Object_CalcBoundBoxForced
	
	LDA #$00
	STA PlatformCopy_MadeContact, X

	JSR Object_InteractWithPlayer
	JSR DoPatrol
	JSR PlatformCopy_ContactCheck

	LDA <Objects_XZ, X
	CMP PlatformCopy_StartX, X
	BNE ObjNorm_PlatformCopyOscillate1

	LDA <Objects_XHiZ, X
	CMP PlatformCopy_StartXHi, X

	BNE ObjNorm_PlatformCopyOscillate1


	JSR Object_DeleteOffScreen

ObjNorm_PlatformCopyOscillate1:
	LDA Objects_SpriteAttributes, X
	ORA #SPR_BEHINDBG
	STA Objects_SpriteAttributes, X
	JMP PlatformCopy_Draw
	
ObjInit_WoodenPlatCopy:
	RTS		 ; Return    


PlatformCopy_Draw:
	LDA #$00
	STA Objects_Orientation, X
	
	LDA Objects_SpritesVerticallyOffScreen,X
	BEQ PlatformCopy_DoDraw

	RTS

PlatformCopy_DoDraw:
	INC <Objects_YZ, X
	JSR Object_DrawMirrored

	DEC <Objects_YZ, X

	LDA Objects_SpritesHorizontallyOffScreen,X
	AND #SPRITE_2_HINVISIBLE
	BNE PlatformCopy_Draw1

	LDA <Objects_SpriteX, X
	ADD #$10
	STA Sprite_RAMX + 8, Y

	LDA <Objects_SpriteY, X
	STA Sprite_RAMY + 8, Y

	LDA Sprite_RAMAttr, Y
	STA Sprite_RAMAttr + 8, Y

	LDA Sprite_RAMTile, Y
	STA Sprite_RAMTile + 8, Y

PlatformCopy_Draw1:
	LDA Objects_SpritesHorizontallyOffScreen,X
	AND #SPRITE_3_HINVISIBLE
	BNE PlatformCopy_Draw2

	LDA <Objects_SpriteX, X
	ADD #$18
	STA Sprite_RAMX + 12, Y

	LDA <Objects_SpriteY, X
	STA Sprite_RAMY + 12, Y

	LDA Sprite_RAMAttr + 4, Y
	STA Sprite_RAMAttr + 12, Y

	LDA Sprite_RAMTile + 4, Y
	STA Sprite_RAMTile + 12, Y

PlatformCopy_Draw2:
	LDA Objects_SpritesHorizontallyOffScreen,X
	AND #SPRITE_4_HINVISIBLE
	BNE PlatformCopy_Draw3

	LDA <Objects_SpriteX, X
	ADD #$20
	STA Sprite_RAMX + 16, Y

	LDA <Objects_SpriteY, X
	STA Sprite_RAMY + 16, Y

	LDA Sprite_RAMAttr, Y
	STA Sprite_RAMAttr + 16, Y

	LDA Sprite_RAMTile, Y
	STA Sprite_RAMTile + 16, Y

PlatformCopy_Draw3:
	
	LDA Objects_SpritesHorizontallyOffScreen,X
	AND #SPRITE_5_HINVISIBLE
	BNE PlatformCopy_Draw4

	LDA <Objects_SpriteX, X
	ADD #$28
	STA Sprite_RAMX + 20, Y

	LDA <Objects_SpriteY, X
	STA Sprite_RAMY + 20, Y

	LDA Sprite_RAMAttr + 4, Y
	STA Sprite_RAMAttr + 20, Y

	LDA Sprite_RAMTile + 4, Y
	STA Sprite_RAMTile + 20, Y

PlatformCopy_Draw4:
	RTS		 ; Return    


PlatformCopy_PlayerOffset:
	.byte $01, $00
	.byte $00, $00

PlatformCopy_ContactCheck:
	LDA Platform_MadeContact, X
	BEQ PlatformCopy_CheckRTS
	
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
	
PlatformCopy_CheckRTS:
	RTS

PirateBoo_CoinTimer = Objects_Data1

ObjInit_PirateBoo:
	LDA #(ATTR_FIREPROOF | ATTR_ICEPROOF | ATTR_HAMMERPROOF | ATTR_TAILPROOF | ATTR_DASHPROOF | ATTR_STOMPPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	LDA #(ATTR_EXPLOSIONPROOF | ATTR_SHELLPROOF)
	STA Objects_BehaviorAttr, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #$E8
	STA ChaseVel_LimitLo, X

	LDA #$18
	STA ChaseVel_LimitHi, X

	LDA Objects_Property, X
	BEQ PriateBoo_InitRTS

	LDA #SPR_BEHINDBG
	STA Objects_SpriteAttributes, X
PriateBoo_InitRTS:
	RTS

ObjNorm_PirateBoo:
	LDA <Player_HaltGameZ
	BNE PirateBoo_Draw

	JSR Object_CalcBoundBox
	JSR Object_ChasePlayer
	JSR Object_FaceDirectionMoving
	JSR Object_InteractWithPlayer	

PirateBoo_Draw:
	JMP Object_Draw 	

PirateBoo_TakeCoins:
	INC PirateBoo_CoinTimer, X
	LDA PirateBoo_CoinTimer, X
	AND #$03
	BNE PirateBoo_Draw

	INC Coins_Lost

	LDA Sound_QLevel1
	ORA #SND_LEVELCOIN
	STA Sound_QLevel1
	STA Force_Coin_Update
	BNE PirateBoo_Draw
	
Boo_PlayerCheck:
	.byte $00, SPR_HFLIP

Boo_Speeds:
	.byte $F0, $E0
	.byte $10, $20

ObjNorm_Boo:
	LDA <Player_HaltGameZ
	BNE Boo_Draw

	JSR Object_DeleteOffScreen

	LDY #$00
	LDA DayNight
	BEQ Boo_SetLimits

	INY

Boo_SetLimits:
	LDA Boo_Speeds, Y
	STA ChaseVel_LimitLo, X

	LDA Boo_Speeds + 2, Y
	STA ChaseVel_LimitHi, X

	JSR Object_FacePlayer
	JSR Object_CalcBoundBox	
	JSR Object_AttackOrDefeat
	
	LDA DayNight
	BNE Boo_Chase

	LDA Boo_PlayerCheck, Y
	CMP <Player_FlipBits
	BNE Boo_Still

Boo_Chase:
	JSR Object_ChasePlayer

	LDA #$01
	STA Objects_Frame, X
	BNE Boo_Draw

Boo_Still:
	LDA #$00
	STA Objects_Frame, X
	STA <Objects_XVelZ, X
	STA <Objects_YVelZ, X

Boo_Draw:
	JMP Object_Draw

    
ObjInit_Boo:
	LDA #(ATTR_FIREPROOF | ATTR_ICEPROOF | ATTR_HAMMERPROOF | ATTR_TAILPROOF | ATTR_DASHPROOF | ATTR_STOMPPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	LDA #(ATTR_EXPLOSIONPROOF | ATTR_SHELLPROOF)
	STA Objects_BehaviorAttr, X

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	RTS

Boo_CheckPlayerSight:
	LDA DayNight
	BNE PRG002_A8CC
	JSR Object_FacePlayer
	CLC
	RTS

PRG002_A8CC:
	SEC
	RTS		 ; Return


ObjInit_Phanto:

	LDA #BOUND16x16
	STA Objects_BoundBox, X

	JMP Object_NoInteractions

ObjInit_PhantoFlip:

	RTS		 ; Return    


Phanto_ChaseTimer = Objects_Data3
Phanto_Action = Objects_Data4
Phanto_Shaker = Objects_Data5

ObjNorm_Phanto:
	LDA <Player_HaltGameZ
	BEQ ObjNorm_Phanto1
	
	JMP Phanto_Draw

ObjNorm_Phanto1:
	LDA Phanto_Action, X
	JSR DynJump

	.word Phanto_Wait
	.word Phanto_Wake
	.word Phanto_Chase
	.word Phanto_Hover

Phanto_FindKey:
	LDY #07

Phanto_KeyLooking:
	LDA Objects_ID, Y
	CMP #OBJ_KEY
	BEQ Phanto_KeyFound

	DEY
	BPL Phanto_KeyLooking

Phanto_KeyNotFound:
	CLC
	RTS

Phanto_KeyFound:
	LDA Objects_BeingHeld, Y
	BEQ Phanto_KeyNotFound

	SEC
	RTS

Phanto_Wait:
	JSR Phanto_FindKey
	BCC Phanto_Wait_End

	INC Phanto_Action, X

	LDA #$40
	STA Objects_Timer, X

Phanto_Wait_End:
	JMP Object_Draw

Phanto_Wake:
	LDA Objects_Timer, X
	BNE Phanto_Wake1

	INC Phanto_Action, X
	
	LDA #(ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

Phanto_Wake1:
	JSR Object_Draw

	INC Phanto_Shaker, X
	LDA Phanto_Shaker, X
	AND #$08
	BNE Phanto_Wake2

	LDA #SND_LEVELCRUMBLE
	STA Sound_QLevel2

Phanto_Wake2:
	LDA Phanto_Shaker, X
	AND #$01
	BNE Phanto_Wake_End
	
	TYA
	TAX
	
	INC  Sprite_RAMX, X
	INC  Sprite_RAMX + 4,X

Phanto_Wake_End:
	RTS

Phanto_Chase:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE Phanto_ChaseNormal

	JSR Phanto_Poof
	
	LDA #$FF
	STA Objects_Timer, X
	
	LDA #OBJSTATE_NORMAL
	STA Objects_State, X
	RTS

Phanto_ChaseNormal:	
	JSR Phanto_FindKey
	BCS Phanto_ChaseHover

	JMP Phanto_Poof

Phanto_ChaseHover:
	LDA #$D0
	STA ChaseVel_LimitLo, X

	LDA #$30
	STA ChaseVel_LimitHi, X

	JSR Object_ChasePlayerX

	LDA #$F0
	STA ChaseVel_LimitLo, X

	LDA #$10
	STA ChaseVel_LimitHi, X
	
	JSR Object_ChasePlayerY

	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

Phanto_Draw:
	LDA #$00
	STA Objects_Frame, X

	JMP Object_Draw

Phanto_Poof:
	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE Phanto_SetHover

	LDA <Objects_XZ, X
	STA Poof_X

	LDA <Objects_YZ, X
	STA Poof_Y

	LDA #$FF
	STA <Objects_YHiZ, X
	
	JSR Common_MakePoof

Phanto_SetHover:
	LDA #$03
	STA Phanto_Action, X
	RTS

Phanto_HoverStartX:
	.byte $20, $E0

Phanto_Hover:
	LDA Objects_Timer, X
	BNE Phanto_HoverRTS

	JSR Phanto_FindKey
	BCC Phanto_HoverRTS

	LDY Player_Direction

	LDA <Horz_Scroll
	ADD Phanto_HoverStartX, Y
	STA <Objects_XZ, X
	STA <Poof_X

	LDA <Horz_Scroll_Hi
	ADC #$00
	STA <Objects_XHiZ, X

	LDA <Vert_Scroll
	ADD #$80
	STA <Objects_YZ, X
	STA <Poof_Y

	LDA <Vert_Scroll_Hi
	ADC #$00
	STA <Objects_YHiZ, X

	LDA #$00
	STA <Objects_XVelZ, X
	STA <Objects_YVelZ, X

	LDA #$02
	STA Phanto_Action, X
	JMP Common_MakePoof

Phanto_HoverRTS:
	RTS
    

ObjInit_Toad:

ObjNorm_Toad:
 
;	; Returns 'Y' as offset to Mario's or Luigi's inventory memory



Lightning_Action = Objects_Data1
Lightning_WaterColor = Objects_Data2


ObjInit_Lightning:
	JSR Object_NoInteractions
	LDA #BOUND16x16
	STA Objects_BoundBox, X
	RTS

ObjNorm_Lightning;
	LDA Lightning_Action, X
	JSR DynJump

	.word Lightning_Fall
	.word Lightning_Electricuting
	
Lightning_Fall:
	LDA <Player_HaltGameZ
	BEQ Lightning_Normal
	JMP Lightning_Draw

Lightning_Normal:
	JSR Object_DeleteOffScreen

	LDA #$00
	STA <Objects_XVelZ, X

	LDA #$30
	STA <Objects_YVelZ, X

	JSR Object_CalcBoundBox
	JSR Object_Move
	JSR Object_DetectTiles
	JSR Object_InteractWithPlayer

	LDA Objects_SpritesHorizontallyOffScreen,X
	ORA Objects_SpritesVerticallyOffScreen,X
	BNE Lightning_GroundCheck

	LDA Object_VertTileProp, X
	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_ENEMYSOLID)
	BNE Lightning_GroundCheck

	LDA Objects_BoundBottom, X
	STA Block_DetectY
	AND #$F0
	STA Debris_Y

	LDA Objects_BoundBottomHi, X
	STA Block_DetectYHi

	LDA <Objects_XZ, X
	ADD #$08
	STA Block_DetectX
	AND #$F0
	STA Debris_X

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Block_DetectXHi

	LDA Object_VertTileValue, X
	ADD #$01
	JSR Object_ChangeBlock

	JSR Common_MakeBricks
	JMP Lightning_Draw

Lightning_GroundCheck:
	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ Lightning_CheckWater

	LDA Objects_SpritesHorizontallyOffScreen,X
	ORA Objects_SpritesVerticallyOffScreen,X
	BNE Lightning_Poof

	LDA <Objects_YZ, X
	AND #$F0
	ORA #$06
	STA <Objects_YZ, X

	JSR Object_PrepProjectile
	
	LDA #SOBJ_LIGHTNINGBOLT
	STA SpecialObj_ID, Y

	LDA #$C0
	STA SpecialObj_XVel,Y

	LDA <Objects_XZ, X
	STA SpecialObj_X,Y

	LDA <Objects_XHiZ, X
	STA SpecialObj_XHi,Y

	LDA <Objects_YZ, X
	STA SpecialObj_Y,Y

	LDA <Objects_YHiZ, X
	STA SpecialObj_YHi,Y

	JSR Object_PrepProjectile
	
	LDA #SOBJ_LIGHTNINGBOLT
	STA SpecialObj_ID, Y

	LDA #$30
	STA SpecialObj_XVel,Y

	LDA <Objects_XZ, X
	STA SpecialObj_X,Y

	LDA <Objects_XHiZ, X
	STA SpecialObj_XHi,Y

	LDA <Objects_YZ, X
	STA SpecialObj_Y,Y

	LDA <Objects_YHiZ, X
	STA SpecialObj_YHi,Y

	LDA #$02
	STA SpecialObj_Data1, Y

Lightning_Poof:
	JMP Object_PoofDie

Lightning_CheckWater:
	LDA Object_VertTileProp, X
	CMP #TILE_PROP_WATER
	BEQ Lightning_Electricute

	CMP #(TILE_PROP_WATER | TILE_PROP_FOREGROUND)
	BNE Lightning_Draw

Lightning_Electricute:
	LDA #$01
	STA Lightning_Action, X
	
	LDA #$20
	STA Objects_Timer, X

	LDA Palette_Buffer + $0F
	STA Lightning_WaterColor, X
	
Lightning_Draw:
	JSR Object_Draw

Lightning_RTS:
	RTS

Lightning_Electricuting:
	LDA Objects_Timer, X
	BNE Lightning_Flash

	JMP Object_Delete

Lightning_Flash:
	AND #$02
	BNE Lightning_FlashWhite

	LDA Lightning_WaterColor, X
	STA Palette_Buffer + $0F
	BNE Lightning_PlayerHurt

Lightning_FlashWhite:
	LDA #$30
	STA Palette_Buffer + $0F

Lightning_PlayerHurt:
	LDA Player_InWater
	BEQ Lightning_RTS

	JSR Player_GetHurt
	RTS 