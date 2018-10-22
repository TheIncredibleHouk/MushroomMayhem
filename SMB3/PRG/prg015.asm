    .org ObjectGroup_InitJumpTable
;****************************** OBJECT INITIALIZATION ******************************
	.word ObjInit_BulletBill	; Object $78 - OBJ_BULLETBILL
	.word ObjInit_MissileMark	; Object $79 - OBJ_BULLETBILLHOMING
	.word ObjInit_PurpleTroopa	; Object $7A - OBJ_PURPLETROOPA
	.word ObjInit_DoNothing	; Object $7B - OBJ_BLUESHELL
	.word ObjInit_Larry	; Object $7C - OBJ_HELPER
	.word ObjInit_ParaZombieGoomba	; Object $7D - OBJ_PARAZOMBIEGOOMBA
	.word ObjInit_DoNothing	; Object $7E - OBJ_BIGGREENHOPPER
	.word ObjInit_DoNothing	; Object $7F - OBJ_BIGPurplePIRANHA
	.word ObjInit_DoNothing	; Object $80 - OBJ_FLYINGGREENPARATROOPA
	.word ObjInit_HammerBro		; Object $81 - OBJ_HAMMERBRO
	.word ObjInit_NinjaBro	; Object $82 - OBJ_NINJABRO
	.word ObjInit_Lakitu		; Object $83 - OBJ_LAKITU
	.word ObjInit_SpinyEgg	; Object $84 - OBJ_SPINYEGG
	.word ObjInit_DoNothing	; Object $85 - OBJ_BLUESPINY
	.word ObjInit_IceBro		; Object $86 - OBJ_ICEBRO
	.word ObjInit_FireBro		; Object $87 - OBJ_FIREBRO
	.word ObjInit_PirateBro	; Object $88 - OBJ_PIRATEBRO
	.word ObjInit_ChainChomp	; Object $89 - OBJ_CHAINCHOMP
	.word ObjInit_Thwomp		; Object $8A - OBJ_THWOMP
	.word ObjInit_AngryThwomp	; Object $8B - OBJ_AngryTHWOMP


    .org ObjectGroup_NormalJumpTable
;****************************** OBJECT GAME LOOP ******************************
	.word ObjNorm_BulletBill	; Object $78 - OBJ_BULLETBILL
	.word ObjNorm_MissileMark	; Object $79 - OBJ_BULLETBILLHOMING
	.word ObjNorm_PurpleTroopa	; Object $7A - OBJ_PURPLETROOPA
	.word ObjNorm_DoNothing		; Object $7B - OBJ_BLUESHELL
	.word ObjNorm_Larry	; Object $7C - OBJ_HELPER
	.word ObjNorm_ParaZombieGoomba	; Object $7D - OBJ_PARAZOMBIEGOOMBA
	.word ObjNorm_DoNothing	; Object $7E - OBJ_BIGGREENHOPPER
	.word ObjNorm_DoNothing	; Object $7F - OBJ_BIGPurplePIRANHA
	.word ObjNorm_DoNothing	; Object $80 - OBJ_FLYINGGREENPARATROOPA
	.word ObjNorm_HammerBro		; Object $81 - OBJ_HAMMERBRO
	.word ObjNorm_NinjaBro	; Object $82 - OBJ_NINJABRO
	.word ObjNorm_Lakitu		; Object $83 - OBJ_LAKITU
	.word ObjNorm_SpinyEgg		; Object $84 - OBJ_SPINYEGG
	.word ObjNorm_DoNothing	; Object $85 - OBJ_BLUESPINY
	.word ObjNorm_FireIcePirateBro		; Object $86 - OBJ_ICEBRO
	.word ObjNorm_FireIcePirateBro		; Object $87 - OBJ_FIREBRO
	.word ObjNorm_FireIcePirateBro	; Object $88 - OBJ_PIRATEBRO
	.word ObjNorm_ChainChomp	; Object $89 - OBJ_CHAINCHOMP
	.word ObjNorm_Thwomp		; Object $8A - OBJ_THWOMP
	.word ObjNorm_AngryThwomp	; Object $8B - OBJ_AngryTHWOMP

    .org ObjectGroup_CollideJumpTable
;****************************** OBJECT PLAYER INTERACTION ******************************
	.word $0000					; Object $78 - OBJ_BULLETBILL
	.word Object_Explode					; Object $79 - OBJ_BULLETBILLHOMING
	.word Object_Hold					; Object $7A - OBJ_PURPLETROOPA
	.word $0000					; Object $7B - OBJ_BLUESHELL
	.word Larry_InteractWithPlayer		; Object $7C - OBJ_HELPER
	.word $0000					; Object $7D - OBJ_PARAZOMBIEGOOMBA
	.word $0000 | OBJ_PURPLETROOPA	; Object $7E - OBJ_BIGGREENHOPPER
	.word $0000					; Object $7F - OBJ_BIGPurplePIRANHA
	.word $0000 | OBJ_PURPLETROOPA	; Object $80 - OBJ_FLYINGGREENPARATROOPA
	.word $0000			; Object $81 - OBJ_HAMMERBRO
	.word $0000			; Object $82 - OBJ_NINJABRO
	.word $0000			; Object $83 - OBJ_LAKITU
	.word $0000					; Object $84 - OBJ_SPINYEGG
	.word $0000					; Object $85 - OBJ_BLUESPINY
	.word $0000			; Object $86 - OBJ_ICEBRO
	.word $0000			; Object $87 - OBJ_FIREBRO
	.word $0000					; Object $88 - OBJ_PIRATEBRO
	.word $0000					; Object $89 - OBJ_CHAINCHOMP
	.word $0000					; Object $8A - OBJ_THWOMP
	.word $0000					; Object $8B - OBJ_AngryTHWOMP

    .org ObjectGroup_PatTableSel
;****************************** OBJECT PALETTE/SIZE ******************************
	.byte OA1_PAL2 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $78 - OBJ_BULLETBILL
	.byte OA1_PAL2 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $79 - OBJ_BULLETBILLHOMING
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $7A - OBJ_PURPLETROOPA
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $7B - OBJ_BLUESHELL
	.byte OA1_PAL3 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $7C - OBJ_HELPER
	.byte OA1_PAL2 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $7D - OBJ_PARAZOMBIEGOOMBA
	.byte OA1_PAL2 | OA1_HEIGHT48 | OA1_WIDTH24	; Object $7E - OBJ_BIGGREENHOPPER
	.byte OA1_PAL1 | OA1_HEIGHT48 | OA1_WIDTH24	; Object $7F - OBJ_BIGPurplePIRANHA
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $80 - OBJ_FLYINGGREENPARATROOPA
	.byte OA1_PAL3 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $81 - OBJ_HAMMERBRO
	.byte OA1_PAL3 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $82 - OBJ_NINJABRO
	.byte OA1_PAL3 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $83 - OBJ_LAKITU
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $84 - OBJ_SPINYEGG
	.byte OA1_PAL2 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $85 - OBJ_BLUESPINY
	.byte OA1_PAL2 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $86 - OBJ_ICEBRO
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $87 - OBJ_FIREBRO
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH16	; Object $88 - OBJ_PIRATEBRO
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $89 - OBJ_CHAINCHOMP
	.byte OA1_PAL3 | OA1_HEIGHT32 | OA1_WIDTH48	; Object $8A - OBJ_THWOMP
	.byte OA1_PAL1 | OA1_HEIGHT32 | OA1_WIDTH48	; Object $8B - OBJ_AngryTHWOMP



    .org ObjectGroup_PatTableSel
;****************************** OBJECT PATTERN TABLE ******************************
	.byte OPTS_SETPT6 | $4F	; Object $78 - OBJ_BULLETBILL
	.byte OPTS_SETPT6 | $4F	; Object $79 - OBJ_BULLETBILLHOMING
	.byte OPTS_SETPT6 | $4F	; Object $7A - OBJ_PURPLETROOPA
	.byte OPTS_SETPT5 | $0B	; Object $7B - OBJ_BLUESHELL
	.byte OPTS_NOCHANGE	; Object $7C - OBJ_HELPER
	.byte OPTS_SETPT6 | $13	; Object $7D - OBJ_PARAZOMBIEGOOMBA
	.byte OPTS_SETPT5 | $3D	; Object $7E - OBJ_BIGGREENHOPPER
	.byte OPTS_SETPT5 | $3D	; Object $7F - OBJ_BIGPurplePIRANHA
	.byte OPTS_SETPT6 | $4F	; Object $80 - OBJ_FLYINGGREENPARATROOPA
	.byte OPTS_SETPT5 | $4E	; Object $81 - OBJ_HAMMERBRO
	.byte OPTS_SETPT5 | $4E	; Object $82 - OBJ_NINJABRO
	.byte OPTS_NOCHANGE	; Object $83 - OBJ_LAKITU
	.byte OPTS_SETPT5 | $0B	; Object $84 - OBJ_SPINYEGG
	.byte OPTS_SETPT5 | $0B	; Object $85 - OBJ_BLUESPINY
	.byte OPTS_SETPT5 | $4E	; Object $86 - OBJ_ICEBRO
	.byte OPTS_SETPT5 | $4E	; Object $87 - OBJ_FIREBRO
	.byte OPTS_SETPT5 | $4E	; Object $88 - OBJ_PIRATEBRO
	.byte OPTS_SETPT5 | $0E	; Object $89 - OBJ_CHAINCHOMP
	.byte OPTS_SETPT5 | $12	; Object $8A - OBJ_THWOMP
	.byte OPTS_SETPT5 | $12	; Object $8B - OBJ_AngryTHWOMP


	.org ObjectGroup_KillAction	
;****************************** OBJECT DEATH ROUTINE ******************************
	.byte KILLACT_POOFDEATH	; Object $78 - OBJ_BULLETBILL
	.byte KILLACT_POOFDEATH	; Object $79 - OBJ_BULLETBILLHOMING
	.byte KILLACT_POOFDEATH	; Object $7A - OBJ_PURPLETROOPA
	.byte KILLACT_JUSTDRAWMIRROR	; Object $7B - OBJ_BLUESHELL
	.byte KILLACT_JUSTDRAW16X16	; Object $7C - OBJ_HELPER
	.byte KILLACT_POOFDEATH		; Object $7D - OBJ_PARAZOMBIEGOOMBA
	.byte KILLACT_GIANTKILLED	; Object $7E - OBJ_BIGGREENHOPPER
	.byte KILLACT_POOFDEATH		; Object $7F - OBJ_BIGPurplePIRANHA
	.byte KILLACT_POOFDEATH	; Object $80 - OBJ_FLYINGGREENPARATROOPA
	.byte KILLACT_POOFDEATH	; Object $81 - OBJ_HAMMERBRO
	.byte KILLACT_POOFDEATH	; Object $82 - OBJ_NINJABRO
	.byte KILLACT_NORMALSTATE	; Object $83 - OBJ_LAKITU
	.byte KILLACT_POOFDEATH	; Object $84 - OBJ_SPINYEGG
	.byte KILLACT_JUSTDRAWMIRROR	; Object $85 - OBJ_BLUESPINY
	.byte KILLACT_POOFDEATH	; Object $86 - OBJ_ICEBRO
	.byte KILLACT_POOFDEATH	; Object $87 - OBJ_FIREBRO
	.byte KILLACT_POOFDEATH	; Object $88 - OBJ_PIRATEBRO
	.byte KILLACT_POOFDEATH	; Object $89 - OBJ_CHAINCHOMP
	.byte KILLACT_NORMALANDKILLED	; Object $8A - OBJ_THWOMP
	.byte KILLACT_NORMALANDKILLED	; Object $8B - OBJ_AngryTHWOMP



OG7_POff .func (\1 - ObjectGroup07_PatternSets)

	.org ObjectGroup_PatternStarts	; <-- help enforce this table *here*
;****************************** OBJECT FRAME TABLE ******************************
	.byte OG7_POff(ObjP78), OG7_POff(ObjP79), OG7_POff(ObjP7A), OG7_POff(ObjP7B)
	.byte OG7_POff(ObjP7C), OG7_POff(ObjP7D), OG7_POff(ObjP7E), OG7_POff(ObjP7F)
	.byte OG7_POff(ObjP80), OG7_POff(ObjP81), OG7_POff(ObjP82), OG7_POff(ObjP83)
	.byte OG7_POff(ObjP84), OG7_POff(ObjP85), OG7_POff(ObjP86), OG7_POff(ObjP87)
	.byte OG7_POff(ObjP88), OG7_POff(ObjP89), OG7_POff(ObjP8A), OG7_POff(ObjP8B)


	.org ObjectGroup_PatternSets	; <-- help enforce this table *here*
;****************************** OBJECT FRAMES DEFINITION ******************************    
ObjectGroup07_PatternSets:


ObjP78:
ObjP79:
	.byte $DD, $DF
	.byte $00, $00
	.byte $DD, $DF
	.byte $BD, $BF
	.byte $B9, $BB
	.byte $B5, $B7

ObjP7A:
	.byte $C3, $C5, $C7, $C9
	.byte $FD, $FD, $FD, $FD
	.byte $FD, $FD, $D1, $D1
	.byte $D3, $D5, $D5, $D3
	.byte $CB, $C5, $F9, $FB    


ObjP7B:
ObjP7C:
ObjP7E:
	.byte $A9, $A9
	.byte $AB, $AB
	.byte $BD, $BD, $9F, $41 
	.byte $9D, $9D, $9F, $41

ObjP7D:
	.byte $D9, $DB, $DB, $D9, $DB, $DB

ObjP7F:
	.byte $A1, $A3, $A5, $A7, $A9, $AB, $AD, $AF

ObjP80:
	.byte $C3, $C5, $C7, $C9
	.byte $FD, $FD, $FD, $FD
	.byte $FD, $FD, $D1, $D1
	.byte $D3, $D5, $D5, $D3
	.byte $CB, $C5, $F9, $FB

ObjP81:
	.byte $B1, $B3, $B5, $B7, $B1, $B3, $A5, $A7
	.byte $AD, $AF, $B5, $B7, $AD, $AF, $A5, $A7

ObjP82:
	.byte $95, $97, $A1, $A3, $95, $97, $B9, $BB
	.byte $99, $9B, $A1, $A3, $99, $9B, $B9, $BB


ObjP83:
	.byte $9F, $41, $BD, $BD
	.byte $9F, $41, $9D, $9D

ObjP84:
ObjP85:
	.byte $99, $99, $BB, $BB, $81, $83

ObjP86:
ObjP87:
	.byte $81, $83, $B5, $B7, $81, $83, $A5, $A7
	.byte $85, $87, $B5, $B7, $85, $87, $A5, $A7

ObjP88:
	.byte $8D, $8F, $B5, $B7, $8D, $8F, $A5, $A7
	.byte $91, $93, $B5, $B7, $91, $93, $A5, $A7

ObjP89:
	.byte $91, $93, $9D, $9F, $9D, $9F

ObjP8A:
ObjP8B:
	.byte $9D, $9F, $BD, $BF, $91, $93, $B1, $B3,  $91, $93, $B1, $B3


BulletBill_Frame:
	.byte $00, $00, $03, $04, $04, $03, $05, $05

BulletBill_Orientation:
	.byte $00, SPR_HFLIP, $00, $00, SPR_HFLIP, SPR_VFLIP, $00, SPR_HFLIP

ObjInit_BulletBill:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_FIREPROOF | ATTR_ICEPROOF)
	STA Objects_WeaponAttr, X

	LDA #(ATTR_STOMPKICKSOUND)
	STA Objects_BehaviorAttr, X

	LDA #$02
	STA Objects_Frame, X

	RTS

ObjNorm_BulletBill:
	LDA <Player_HaltGameZ
	BEQ BulletBill_Norm
	JMP Bullet_Draw	 ; If gameplay is halted, jump to PRG004_B1C2

BulletBill_Norm:
	JSR Object_DeleteOffScreen	; Delete object if it falls off-screen
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat	 	; Player to Bullet Bill collision
	JSR Object_DetectTiles
	JSR Object_CheckForeground
	JSR Object_ApplyXVel	 	
	JSR Object_ApplyYVel_NoGravity

	JMP Bullet_Animate    


ObjInit_MissileMark:
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_FIREPROOF | ATTR_ICEPROOF)
	STA Objects_WeaponAttr, X

	LDA Sound_QLevel1
	ORA #SND_LEVELBABOOM
	STA Sound_QLevel1

	LDA #$03
	STA Objects_ExpPoints, X
	RTS

Missile_Flash = Objects_Data5
Missile_HomingDisabled = Objects_Data3

ObjNorm_MissileMark:
	LDA <Player_HaltGameZ
	BEQ MissileMark_Norm
	JMP Bullet_Draw	 ; If gameplay is halted, jump to PRG004_B1C2

MissileMark_Norm:
	JSR Object_DeleteOffScreen	; Delete object if it falls off-screen

	LDA Objects_PlayerProjHit, X
	AND #HIT_ICEBALL
	STA Missile_HomingDisabled, X

	LDA Objects_PlayerProjHit, X
	AND #HIT_FIREBALL
	BEQ MissieMark_NotHit

	JSR Object_Explode

MissieMark_NotHit:

	LDA Objects_Timer, X
	BEQ ObjNorm_MissileMarkA
	
	LDA Objects_Timer, X
	
	LDA #$18
	STA ChaseVel_LimitHi, X

	LDA #$E8
	STA ChaseVel_LimitLo, X

	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_DetectTiles
	JSR Object_CheckForeground
	JSR Object_ApplyXVel
	JSR Object_ApplyYVel_NoGravity
	JMP Bullet_Animate
	 
ObjNorm_MissileMarkA:
	LDA Missile_HomingDisabled, X
	BEQ ObjNorm_MissileMarkC

	JSR Object_ApplyXVel
	JSR Object_ApplyYVel_NoGravity
	JMP ObjNorm_MissileMarkA1

ObjNorm_MissileMarkC:
	INC Missile_Flash, X

	LDA Missile_Flash, X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_SpriteAttributes,X

	JSR Object_ChasePlayer

ObjNorm_MissileMarkA1:
	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer
	JSR Object_DetectTiles
	
	LDA <Objects_TilesDetectZ, X
	BEQ Bullet_Animate

	LDA #$01
	STA Explosion_Timer, X

Bullet_Animate:
	LDY #$00
	
	LDA <Objects_YVelZ, X
	BNE Bullet_AnimateVertical

	LDA <Objects_XVelZ, X
	BMI Bullet_FrameOrientation
	
	INY
	BNE Bullet_FrameOrientation

Bullet_AnimateVertical:
	LDA #$4C
	STA PatTable_BankSel + 4

	LDY #$02
	
	LDA <Objects_YVelZ, X
	BMI Bullet_AnimateVerticalAngle
	
	LDY #$05

Bullet_AnimateVerticalAngle:
	LDA <Objects_XVelZ, X
	BEQ Bullet_FrameOrientation

	INY
	LDA <Objects_XVelZ, X
	BMI Bullet_FrameOrientation

	INY

Bullet_FrameOrientation:
	LDA BulletBill_Frame, Y
	STA Objects_Frame, X

	LDA BulletBill_Orientation, Y
	STA Objects_Orientation, X

Bullet_Draw:
	JMP Object_Draw    


ObjInit_PurpleTroopa:
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


PurpleKoopa_CurrentFrame = Objects_Data1
PurpleTroopa_FrameOffset = Objects_Data2

ObjNorm_PurpleTroopa:
	LDA <Player_HaltGameZ
	BEQ PurpleTroopa_Norm
	JMP PurpleTroopa_Draw

PurpleTroopa_Norm:
	JSR Object_DeleteOffScreen
	JSR Object_Move
	JSR Object_FaceDirectionMoving
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_InteractWithObjects
	BCS PurpleTroopa_Animate

	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	JSR Object_EdgeMarch

PurpleTroopa_Animate:
	INC PurpleKoopa_CurrentFrame, X
	
	LDA PurpleKoopa_CurrentFrame, X
	LSR A
	LSR A
	LSR A
	AND #$01
	TAY	

	LDA Troopa_Frames, Y
	STA Objects_Frame,X

	LDA Troopa_YOffset, Y
	STA PurpleTroopa_FrameOffset, X
	

PurpleTroopa_Draw:
	LDA <Objects_YZ, X
	SUB PurpleTroopa_FrameOffset, X	
	STA <Objects_YZ, X

	JSR Object_Draw16x32

	LDA <Objects_YZ, X
	ADD PurpleTroopa_FrameOffset, X	
	STA <Objects_YZ, X

	LDY Object_SpriteRAMOffset, X

	LDA #$C1
	STA Sprite_RAMTile + 16, Y

	LDA Objects_Orientation, X
	AND #SPR_HFLIP
	BNE PurpleTroopa_ColorFixFlip

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
	
PurpleTroopa_ColorFixFlip:	
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

ObjInit_Larry:
	LDA #$07
	STA Objects_SpritesRequested, X

	LDA #BOUND16x32
	STA Objects_BoundBox, X

	JSR Object_NoInteractions

	LDA #$20
	STA ChaseVel_LimitHi, X

	LDA #$E0
	STA ChaseVel_LimitLo, X

	JSR Object_CalcBoundBox

	LDA #$FF
	STA Larry_ItemSlot, X 

	LDA #$01
	STA Objects_Global, X

	LDA #$0B
	STA PatTable_BankSel + 4
	RTS		 ; Return

Larry_Frame = Objects_Data1
Larry_Action = Objects_Data2
Larry_BodyOffset = Objects_Data3
Larry_ItemSlot = Objects_Data4
Larry_ItemOffset = Objects_Data5

ObjNorm_Larry:
	LDA <Player_HaltGameZ
	BEQ Larry_DoAction

	JMP Larry_Draw

Larry_DoAction:
	LDA Larry_Action, X
	JSR DynJump

	.word Larry_InBag
	.word Larry_WaitOffScreen
	.word Larry_FindPlayer
	.word Larry_ThrowItem
	.word Larry_FleePlayer

Larry_ItemToss:
	.byte POWERUP_FIREFLOWER, POWERUP_NINJASHROOM, POWERUP_SHELL, POWERUP_FROGSUIT, POWERUP_PWING

Larry_SuitHelp:
	.byte $02, $0B, $05, $04, $03

Larry_InBag:
	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer

	INC Larry_Frame, X

	LDA Larry_Frame, X
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame, X
	
	JMP Larry_Draw

Larry_RemoveBag:
	LDA <Objects_XZ, X
	STA <Poof_X

	LDA <Objects_YZ, X
	STA <Poof_Y

	LDA <Objects_YHiZ, X
	STA <Poof_YHi
	
	JSR Common_MakePoof

	LDA #$01
	STA Objects_Frame, X

	LDA #SPR_PAL1
	STA Objects_SpriteAttributes, X

	LDA <Objects_YZ, X
	SUB #$10
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	SBC #$00
	STA <Objects_YHiZ, X

	LDA #$00
	STA Objects_SlowTimer, X

	
	LDA #$02
	STA Larry_Action, X


	JSR Larry_Prepare
	RTS

Larry_WaitOffScreen:
	LDY Objects_Property, X

	LDA Player_EffectiveSuit
	CMP Larry_SuitHelp, Y
	BNE Larry_Prepare

	LDA <Player_X
	STA <Objects_XZ, X

	LDA <Player_XHi
	STA <Objects_XHiZ, X

	LDA <Vert_Scroll
	SUB #$20
	STA <Objects_YZ, X

	LDA <Vert_Scroll_Hi
	SBC #$00
	STA <Objects_YHiZ, X

	RTS

Larry_Prepare:
	LDA Objects_Property, X
	TAY

	LDA Larry_ItemToss, Y
	STA <Temp_Var1

	JSR Check_ExistingPowerUps
	BCS Larry_WaitOffScreenRTS

	LDY #$05

Larry_FindSlot:
	
	LDA Objects_State,Y
	BEQ Larry_ItemSlotFound

	INY
	CPY #$08
	BNE Larry_FindSlot
	RTS

Larry_ItemSlotFound:
	TYA
	STA Larry_ItemSlot, X

	LDA #OBJ_POWERUP
	STA Objects_ID, Y	

	LDA <Temp_Var1
	STA PowerUp_Type, Y

	LDA #OBJSTATE_NONE
	STA Objects_State, Y

	LDA #$02
	STA Larry_Action, X

	LDA #$02
	STA Objects_Frame, X
	JMP Larry_Draw

Larry_WaitOffScreenRTS:
	RTS

Larry_FindPlayer:
	JSR Object_ChasePlayer
	JSR Object_CalcBoundBox
	JSR Object_InteractWithPlayer
	
	JMP Larry_Draw

Larry_InteractWithPlayer:
	LDA Larry_Action, X
	BNE Larry_ThrowItem

	JMP Larry_RemoveBag

Larry_ThrowItem:
	LDA <Objects_XZ, X
	ADD #$08
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	STA Tile_DetectionXHi

	LDA <Objects_YZ, X
	SUB #$08
	STA Tile_DetectionY

	LDA <Objects_YHiZ, X
	SBC #$00
	STA Tile_DetectionYHi

	JSR Object_DetectTile

	LDA Tile_LastProp
	CMP #TILE_PROP_SOLID_ALL
	BCS Larry_ThrowItemDone

	LDY Larry_ItemSlot, X
	LDA #OBJSTATE_FRESH
	STA Objects_State, Y

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

	LDA #$00
	STA Objects_YVelZ, Y

	LDA <Objects_XVelZ, X
	STA Objects_XVelZ, Y

	INC Larry_Action, X

	LDA #$FF
	STA Larry_ItemSlot, X

	LDA #$01
	STA Objects_Frame, X

Larry_ThrowItemDone:
	JMP Larry_Draw

Larry_FleePlayer:
	JSR Object_FleePlayer
	JSR Object_CalcBoundBox
	JSR Object_XDistanceFromPlayer
	
	LDA <XDiff
	CMP #$C0
	BCC Larry_FleeDraw

	LDA #$01
	STA Larry_Action, X

Larry_FleeDraw:
	JMP Larry_Draw

Larry_Draw:
	LDA Larry_Action, X
	BNE Larry_DrawFull

	JMP Object_DrawMirrored

Larry_DrawFull:
	JSR Object_Draw16x32Mirrored

	LDY Object_SpriteRAMOffset, X

	LDA Sprite_RAMX + 8, Y
	ADD #$04
	STA Sprite_RAMX + 8, Y

	LDA Sprite_RAMX + 12, Y
	ADD #$04
	STA Sprite_RAMX + 12, Y
	
	LDA Sprite_RAMX, Y
	SUB #$04
	STA Sprite_RAMX + 16, Y
	
	LDA Sprite_RAMAttr, Y
	STA Sprite_RAMAttr + 16, Y

	LDA #$41
	STA Sprite_RAMTile + 16, Y

	LDA Sprite_RAMY + 8, Y
	STA Sprite_RAMY + 16, Y
	
	LDA Larry_ItemSlot, X
	BMI Larry_DrawDone

	JSR Larry_DrawItem

Larry_DrawDone:
	RTS

Larry_ItemFrameLeftAttr:
	.byte SPR_PAL2, SPR_PAL1, SPR_PAL2, SPR_PAL2, SPR_PAL3

Larry_ItemFrameRightAttr:
	.byte SPR_PAL2, SPR_PAL1, SPR_PAL2, SPR_PAL2, SPR_PAL3

Larry_ItemPattern:
	.byte $04, $20, $10, $0C, $2C

Larry_DrawItem:
	
	LDA #$0E
	STA <Temp_Var1

	LDA Objects_Property, X
	TAX
	
	LDA Larry_ItemPattern,X
	STA SprAnimOffset

	LDA Sprite_RAMY, Y
	CMP #$F8
	BEQ Larry_Item1

	SUB <Temp_Var1
	STA Sprite_RAMY + 20, Y

Larry_Item1:
	STA <Temp_Var3

	LDA #$51
	STA Sprite_RAMTile + 20, Y

	LDA Larry_ItemFrameLeftAttr, X
	STA Sprite_RAMAttr + 20, Y

	LDA Sprite_RAMX, Y
	STA Sprite_RAMX + 20, Y
	ADD #$08
	STA <Temp_Var2

	LDX <CurrentObjectIndexZ
	LDA Objects_Property, X
	TAX

	LDA <Temp_Var3
	CMP #$F8
	BEQ Larry_DrawItemDone

	STA Sprite_RAMY + 24, Y

	LDA #$53
	STA Sprite_RAMTile + 24, Y

	LDA Larry_ItemFrameRightAttr, X
	STA Sprite_RAMAttr + 24, Y

	LDA <Temp_Var2
	STA Sprite_RAMX + 24, Y

Larry_DrawItemDone:
	RTS


ObjInit_ParaZombieGoomba:
	
	RTS

ObjNorm_ParaZombieGoomba:
	RTS		 ; Return


HammerBro_JumpYVel:	.byte -$60, -$30
HammerBro_JumpWait: .byte $C0, $FF
HammerBro_WaitTimers: .byte $18, $18, $60, $18
HammerBro_CanFallThrough: .byte $00, $30

HammerBro_Frame = Objects_Data1
HammerBro_Action = Objects_Data2
HammerBro_RangeLeft = Objects_Data3
HammerBro_RangeRight = Objects_Data4
HammerBro_ThrowHammerTimer = Objects_Data5
HammerBro_HoldHammerTimer = Objects_Data6
HammerBro_WalkDirection = Objects_Data7
HammerBro_FallThrough = Objects_Data8


HammerBro_ThrowTimes:
	.byte $18, $18, $18, $30

ObjInit_HammerBro:
	LDA #$06
	STA Objects_SpritesRequested, X

	LDA #BOUND16x24
	STA Objects_BoundBox, X

	JSR Object_CalcBoundBox
	JSR Object_MoveTowardsPlayer

	LDA <Objects_XVelZ, X
	STA HammerBro_WalkDirection, X

	LDA <Objects_XZ, X
	SUB #$10
	STA HammerBro_RangeLeft, X

	LDA <Objects_XZ, X
	ADD #$10
	STA HammerBro_RangeRight, X

	LDA #$02
	STA Objects_Health, X
	RTS		 ; Return
	
ObjNorm_HammerBro:
	LDA <Player_HaltGameZ
	BEQ HammerBro_Norm

	JMP HammerBros_Draw

HammerBro_Norm:

	JSR Object_DeleteOffScreen	 ; Delete object if it falls off-screen

	LDA HammerBro_WalkDirection, X
	STA <Objects_XVelZ, X

	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	
	LDA HammerBro_FallThrough, X
	BEQ HammerBro_DetectTiles

	DEC HammerBro_FallThrough, X
	JMP HammerBro_SkipTiles

HammerBro_DetectTiles:
	LDA <Objects_TilesDetectZ, X
	AND #~HIT_CEILING
	STA <Objects_TilesDetectZ, X

	JSR Object_InteractWithTiles

HammerBro_SkipTiles:
	JSR Object_FacePlayer
	JSR Object_AttackOrDefeat

	LDA HammerBro_HoldHammerTimer, X
	BEQ HammerBro_HotHolding

	DEC HammerBro_HoldHammerTimer, X
	BNE HammerBro_CheckJump

	LDA RandomN + 1, X
	AND #$03
	TAY 
	LDA HammerBro_WaitTimers, Y
	STA HammerBro_ThrowHammerTimer, X
	JSR HammerBro_ThrowHammer
	
HammerBro_HotHolding:
	LDA HammerBro_ThrowHammerTimer, X
	BNE HammerBro_DecHamTimer

	LDA #$18
	STA HammerBro_HoldHammerTimer, X
	BNE HammerBro_CheckJump

HammerBro_DecHamTimer:
	DEC HammerBro_ThrowHammerTimer, X

HammerBro_CheckJump:
	LDA Objects_Timer, X
	BNE HammerBro_NoJump

	JSR Bro_CheckTop

HammerBro_DoJump:
	LDA HammerBro_JumpYVel, Y
	STA <Objects_YVelZ, X

	LDA HammerBro_CanFallThrough, Y
	STA HammerBro_FallThrough, X

	LDA RandomN, X
	AND #$10
	LSR A
	LSR A
	LSR A
	LSR A
	TAY

	LDA HammerBro_JumpWait, Y
	STA Objects_Timer, X


HammerBro_NoJump:

	LDA <Objects_XZ, X
	CMP HammerBro_RangeLeft, X
	BEQ HammerBro_TurnAround

	CMP HammerBro_RangeRight, X
	BNE HammerBro_Animate

HammerBro_TurnAround:
	LDA HammerBro_WalkDirection, X
	EOR #$FF
	ADD #$01
	STA HammerBro_WalkDirection, X

HammerBro_Animate:
	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ HammerBros_NoAnimate

	INC HammerBro_Frame, X

HammerBros_NoAnimate:
	LDA #$00
	STA <Temp_Var2

	LDA HammerBro_Frame, X
	LSR A
	LSR A
	LSR A
	LSR A
	AND #$01
	STA <Temp_Var1

	LDA HammerBro_HoldHammerTimer, X
	BEQ HammerBros_FinishAnimate

	LDA #$02
	STA <Temp_Var2

HammerBros_FinishAnimate:

	LDA <Temp_Var1
	ORA <Temp_Var2
	STA Objects_Frame, X

HammerBros_Draw:
	LDA Object_SpriteRAMOffset, X
	ADD #$08
	STA Object_SpriteRAMOffset, X

	JSR Object_Draw16x32

	LDA HammerBro_HoldHammerTimer, X
	BEQ HammerBros_Done

	JSR HammerBro_DrawHammer

	LDA Object_SpriteRAMOffset, X
	SUB #$08
	STA Object_SpriteRAMOffset, X

HammerBros_Done:
	RTS

Hammer_XVel:	.byte -$12, $12

HammerXOffset:
	.byte $08, $F8
	.byte $00, $FF

HammerTiles:
	.byte $89, $8B, $8B, $89

HammerFlip:
	.byte SPR_PAL3 | $00, SPR_PAL3 | SPR_HFLIP

HammerBro_DrawHammer:

	LDY #$00
	LDA Objects_Orientation, X
	AND #SPR_HFLIP
	BEQ HammerBro_LeftSide

	INY

HammerBro_LeftSide:
	LDA HammerXOffset, Y
	STA <Temp_Var1

	LDA HammerTiles, Y
	STA <Temp_Var2

	LDA HammerTiles + 2, Y
	STA <Temp_Var3

	LDA HammerFlip, Y
	STA <Temp_Var4

	LDY Object_SpriteRAMOffset, X

	LDA Sprite_RAMX, Y
	ADD <Temp_Var1
	STA Sprite_RAMX - 8, Y
	ADD #$08
	STA Sprite_RAMX - 4, Y

	LDA Sprite_RAMY, Y
	SUB #$06
	STA Sprite_RAMY - 8, Y
	STA Sprite_RAMY - 4, Y

	LDA <Temp_Var2
	STA Sprite_RAMTile - 8, Y

	LDA <Temp_Var3
	STA Sprite_RAMTile - 4, Y

	LDA <Temp_Var4
	STA Sprite_RAMAttr - 8, Y
	STA Sprite_RAMAttr - 4, Y

	RTS		 ; Return

HammerBro_ThrowHammer:
	LDA Objects_SpritesHorizontallyOffScreen,X
	ORA Objects_SpritesVerticallyOffScreen,X
	BNE HammerBro_ThrowDone

	LDY #$00
	LDA Objects_Orientation, X
	AND #SPR_HFLIP
	BEQ HammerBro_ThrowToRight

	INY

HammerBro_ThrowToRight:
	
	LDA HammerXOffset, Y
	ADD <Objects_XZ, X
	STA <Temp_Var14

	LDA <Objects_XHiZ, X
	ADC HammerXOffset + 2, Y
	STA <Temp_Var15
	
	LDA Hammer_XVel, Y
	STA <Temp_Var16

	JSR Object_PrepProjectile
	BCC HammerBro_ThrowDone

	LDA #SOBJ_HAMMER
	STA SpecialObj_ID, Y

	LDA <Temp_Var16
	STA SpecialObj_XVel, Y

	LDA #$C0
	STA SpecialObj_YVel, Y

	LDA <Temp_Var14
	STA SpecialObj_X, Y

	LDA <Temp_Var15
	STA SpecialObj_XHi, Y

	LDA <Objects_YZ, X
	SUB #$06
	STA SpecialObj_Y, Y

	LDA <Objects_YHiZ, X
	SBC #$00
	STA SpecialObj_YHi, Y

HammerBro_ThrowDone:
	RTS    


NinjaBro_JumpYVel:	.byte -$60, -$30
NinjaBro_JumpWait: .byte $C0, $FF
NinjaBro_WaitTimers: .byte $30, $48, $18, $60
NinjaBro_CanFallThrough: .byte $00, $30

NinjaBro_Frame = Objects_Data1
NinjaBro_Action = Objects_Data2
NinjaBro_RangeLeft = Objects_Data3
NinjaBro_RangeRight = Objects_Data4
NinjaBro_ThrowStarTimer = Objects_Data5
NinjaBro_HoldStarTimer = Objects_Data6
NinjaBro_WalkDirection = Objects_Data7
NinjaBro_FallThrough = Objects_Data8
NinjaBro_WalkDirectionBackup = Objects_Data9

ObjInit_NinjaBro:
	LDA #$06
	STA Objects_SpritesRequested, X

	LDA #$02
	STA Objects_Health, X

	LDA #BOUND16x24
	STA Objects_BoundBox, X

	JSR Object_CalcBoundBox
	JSR Object_MoveTowardsPlayer

	LDA <Objects_XVelZ, X
	STA NinjaBro_WalkDirection, X

	LDA <Objects_XZ, X
	SUB #$10
	STA NinjaBro_RangeLeft, X

	LDA <Objects_XZ, X
	ADD #$10 
	STA NinjaBro_RangeRight, X

	LDA #$20
	STA NinjaBro_ThrowStarTimer, X

	LDA #$40
	STA Objects_Timer, X
	RTS		 ; Return
	
ObjNorm_NinjaBro:
	LDA <Player_HaltGameZ
	BEQ NinjaBro_Norm

	LDA Objects_State, X
	CMP #OBJSTATE_FROZEN
	BEQ NinjaBros_HaltDraw

	LDA <Objects_TilesDetectZ,X
	AND #HIT_GROUND
	BEQ NinjaBro_HaltNoDraw

NinjaBros_HaltDraw:
	JMP NinjaBros_Draw

NinjaBro_HaltNoDraw:
	RTS

NinjaBro_Norm:

	JSR Object_DeleteOffScreen	 ; Delete object if it falls off-screen

	LDA NinjaBro_WalkDirection, X
	STA <Objects_XVelZ, X

	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	
	LDA NinjaBro_FallThrough, X
	BEQ NinjaBro_DetectTiles

	DEC NinjaBro_FallThrough, X
	JMP NinjaBro_Done

NinjaBro_DetectTiles:
	LDA <Objects_TilesDetectZ, X
	AND #~HIT_CEILING
	STA <Objects_TilesDetectZ, X

	JSR Object_InteractWithTiles

NinjaBro_SkipTiles:
	LDA <Objects_TilesDetectZ,X
	AND #HIT_GROUND
	BNE NinjaBro_OnGround

NinjaBro_Done:
	RTS

NinjaBro_OnGround:
	LDA Objects_PreviousTilesDetect, X
	AND #HIT_GROUND
	BNE NinjaBro_BeenOnGround

	LDA <Objects_YVelZ, X
	BNE NinjaBro_BeenOnGround

	JSR NinjaBro_MakePoof

	LDA NinjaBro_WalkDirectionBackup, X
	BEQ NinjaBro_BeenOnGround

	STA NinjaBro_WalkDirection, X

NinjaBro_BeenOnGround:
	JSR Object_FacePlayer
	JSR Object_AttackOrDefeat

	LDA NinjaBro_HoldStarTimer, X
	BEQ NinjaBro_HotHolding

	DEC NinjaBro_HoldStarTimer, X
	BNE NinjaBro_CheckJump

	LDA RandomN + 1, X
	AND #$03
	TAY 
	
	LDA Objects_Property, X
	BEQ NinjaBrow_StarWait

	LDA #$10
	BEQ NinjaBrow_StarWait1

NinjaBrow_StarWait:
	LDA NinjaBro_WaitTimers, Y

NinjaBrow_StarWait1:
	STA NinjaBro_ThrowStarTimer, X
	JSR NinjaBro_ThrowStar
	
NinjaBro_HotHolding:
	LDA NinjaBro_ThrowStarTimer, X
	BNE NinjaBro_DecHamTimer

	LDA #$18
	STA NinjaBro_HoldStarTimer, X
	BNE NinjaBro_CheckJump

NinjaBro_DecHamTimer:
	DEC NinjaBro_ThrowStarTimer, X

NinjaBro_CheckJump:
	LDA Objects_Timer, X
	BNE NinjaBro_NoJump
	LDA Objects_Property, X
	BNE NinjaBro_NoJump

	JSR Bro_CheckTop

NinjaBro_DoJump:
	LDA NinjaBro_JumpYVel, Y
	STA <Objects_YVelZ, X

	LDA NinjaBro_CanFallThrough, Y
	STA NinjaBro_FallThrough, X

	LDA RandomN, X
	AND #$10
	LSR A
	LSR A
	LSR A
	LSR A
	TAY

	LDA NinjaBro_JumpWait, Y
	STA Objects_Timer, X

	JSR NinjaBro_MakePoof

	LDA NinjaBro_WalkDirection, X
	STA NinjaBro_WalkDirectionBackup, X

	LDA #$00
	STA NinjaBro_WalkDirection, X

NinjaBro_NoJump:
	LDA <Objects_XZ, X
	CMP NinjaBro_RangeLeft, X
	BEQ NinjaBro_TurnAround

	CMP NinjaBro_RangeRight, X
	BNE NinjaBro_Animate

NinjaBro_TurnAround:
	LDA NinjaBro_WalkDirection, X
	EOR #$FF
	ADD #$01
	STA NinjaBro_WalkDirection, X

NinjaBro_Animate:
	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ NinjaBros_NoAnimate

	INC NinjaBro_Frame, X

NinjaBros_NoAnimate:
	LDA #$00
	STA <Temp_Var2

	LDA NinjaBro_Frame, X
	LSR A
	LSR A
	LSR A
	LSR A
	AND #$01
	STA <Temp_Var1

	LDA NinjaBro_HoldStarTimer, X
	BEQ NinjaBros_FinishAnimate

	LDA #$02
	STA <Temp_Var2

NinjaBros_FinishAnimate:

	LDA <Temp_Var1
	ORA <Temp_Var2
	STA Objects_Frame, X

NinjaBros_Draw:
	LDA Object_SpriteRAMOffset, X
	ADD #$08
	STA Object_SpriteRAMOffset, X

	JSR Object_Draw16x32

	LDA NinjaBro_HoldStarTimer, X
	BEQ NinjaBros_DrawDone

	JSR NinjaBro_DrawStar

NinjaBros_DrawDone:
	LDA Object_SpriteRAMOffset, X
	SUB #$08
	STA Object_SpriteRAMOffset, X

NinjaBros_Done:
	RTS

NinjaBro_MakePoof:
	LDA Objects_SpritesHorizontallyOffScreen,X
	ORA Objects_SpritesVerticallyOffScreen,X
	BNE NinjaBro_PoofDone

	LDA <Objects_XZ, X
	STA <Poof_X

	LDA <Objects_YZ, X
	ADD #$08
	STA <Poof_Y

	LDA <Objects_YHiZ, X
	STA <Poof_YHi

	JSR Common_MakePoof

NinjaBro_PoofDone:
	RTS
Ninja_XVel:	.byte -$12, $12

NinjaXOffset:
	.byte $08, $F8
	.byte $00, $FF

NinjaTiles:
	.byte $89, $8B, $8B, $89

NinjaFlip:
	.byte SPR_PAL3 | $00, SPR_PAL3 | SPR_HFLIP

NinjaBro_DrawStar:

	LDY #$00
	LDA Objects_Orientation, X
	AND #(SPR_HFLIP)
	BEQ NinjaBro_LeftSide

	INY

NinjaBro_LeftSide:
	LDA NinjaXOffset, Y
	STA <Temp_Var1

	LDY Object_SpriteRAMOffset, X

	LDA Sprite_RAMX, Y
	ADD <Temp_Var1
	STA Sprite_RAMX - 8, Y

	ADD #$08
	STA Sprite_RAMX - 4, Y

	LDA Sprite_RAMY, Y
	SUB #$06
	STA Sprite_RAMY - 8, Y

	LDA Sprite_RAMY + 4, Y
	SUB #$06
	STA Sprite_RAMY - 4, Y

	LDA #$A9
	STA Sprite_RAMTile - 8, Y
	STA Sprite_RAMTile - 4, Y

	LDA Sprite_RAMAttr, Y
	AND #SPR_BEHINDBG
	ORA #SPR_PAL3
	STA Sprite_RAMAttr - 8, Y

	EOR #(SPR_VFLIP | SPR_HFLIP)
	STA Sprite_RAMAttr - 4, Y

	RTS		 ; Return

NinjaBro_ThrowStar:
	LDA Objects_SpritesHorizontallyOffScreen,X
	ORA Objects_SpritesVerticallyOffScreen,X
	BEQ NinjaBro_ThrowStarDo
	RTS

NinjaBro_ThrowStarDo:
	LDY #$00
	LDA Objects_Orientation, X
	AND #SPR_HFLIP
	BEQ NinjaBro_ThrowLeft

	INY

NinjaBro_ThrowLeft:
	LDA NinjaXOffset, Y
	STA <Temp_Var1

	LDA NinjaXOffset + 2, Y
	STA <Temp_Var2

	JSR Object_PrepProjectile	

	LDA #SOBJ_NINJASTAR
	STA SpecialObj_ID,Y

	LDA <Objects_XZ, X
	ADD <Temp_Var1
	STA SpecialObj_X, Y

	LDA <Objects_XHiZ, X
	ADC <Temp_Var2
	STA SpecialObj_XHi, Y

	LDA <Objects_YZ, X
	SUB #$06
	STA SpecialObj_Y, Y

	LDA <Objects_YHiZ, X
	SBC #$00
	STA SpecialObj_YHi, Y

	JSR Object_AimProjectile

	LDA SpecialObj_XVel, Y
	JSR Double_Value
	STA SpecialObj_XVel, Y

	LDA SpecialObj_YVel, Y
	JSR Double_Value
	STA SpecialObj_YVel, Y
	
NinjaBro_ThrowDone:
	RTS

Bro_CheckTop:
	LDA Objects_BoundBottom, X
	ADD #$14
	STA Tile_DetectionY

	LDA Objects_BoundBottomHi, X
	ADC #$00
	STA Tile_DetectionYHi

	LDA <Objects_XZ, X
	ADD #$07
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Tile_DetectionXHi

	JSR Object_DetectTile
	
	LDY #$00
	CMP #TILE_PROP_SOLID_ALL
	BCS Bro_NotTop

	LDA Objects_SpriteY, X

	CMP #$30
	BCS Bro_NotTop
 
	INY
	BNE Bro_RTS

Bro_NotTop:
	CMP #$70
	BCS Bro_RTS

	LDA RandomN, X
	AND #$08
	LSR A
	LSR A
	LSR A
	TAY
Bro_RTS:
	RTS    

Lakitu_GraphicsTables:
	.byte $0B, $0B, $0B, $1A

ObjInit_Lakitu:
	LDA #$07
	STA Objects_SpritesRequested, X
	
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	STX <Temp_Var1

	LDY #$04

Lakitu_CheckSame:
	CPY <Temp_Var1
	BEQ Lakitu_CheckNextSlot

	LDA Objects_ID, Y
	CMP #OBJ_LAKITU
	BNE Lakitu_CheckNextSlot

	JMP Object_Delete

Lakitu_CheckNextSlot:
	DEY
	BPL Lakitu_CheckSame
	
	LDY Objects_Property, X
	LDA Lakitu_GraphicsTables, Y
	STA PatTable_BankSel + 4

	LDA #$20
	STA ChaseVel_LimitHi, X

	LDA #$E0
	STA ChaseVel_LimitLo, X

	LDA #(ATTR_NOICE)
	STA Objects_BehaviorAttr, X

	JSR Object_CalcBoundBox

	LDA #$FF
	STA Lakitu_EnemySlot, X 
	RTS		 ; Return


Lakitu_Frame = Objects_Data1
Lakitu_Action = Objects_Data2
Lakitu_BodyOffset = Objects_Data3
Lakitu_EnemySlot = Objects_Data4
Lakitu_EnemyOffset = Objects_Data5
Lakitu_MadePoof = Objects_Data6
Lakitu_SleepTime = Objects_Data7

ObjNorm_Lakitu:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE Lakitu_Alive

	JMP Lakitu_Die

Lakitu_Alive:
	LDA Objects_SlowTimer, X
	BEQ Lakitu_Do

	
	LDA <Horz_Scroll
	ADD #$40
	STA <Objects_XZ, X

	LDA <Horz_Scroll_Hi
	ADC #$01
	STA <Objects_XHiZ, X
	RTS

Lakitu_Do:
	LDA <Player_HaltGameZ
	BEQ Lakitu_Norm

	JMP Lakitu_Draw

Lakitu_Norm:
	LDA Game_Counter
	AND #$03
	BNE Lakitu_Chase

	JSR Object_Move
	JMP Lakitu_CalcBoundBox

Lakitu_Chase:
	JSR Object_ChasePlayer

Lakitu_CalcBoundBox:
	JSR Object_CalcBoundBox

	LDA <Vert_Scroll
	ADD #$14
	STA <Objects_YZ, X

	LDA #$00
	ADC #$00
	STA <Objects_YHiZ, X

	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_CheckForeground
	JSR Object_AttackOrDefeat
	JSR Lakitu_DoAction
	JMP Lakitu_Draw

Lakitu_DoAction:
	LDA Lakitu_Action, X
	JSR DynJump

	.word Lakitu_Wait
	.word Lakitu_Lower
	.word Lakitu_GetEnemy
	.word Lakitu_RaiseEnemy
	.word Lakitu_Raise
	.word Lakitu_Aim

Lakitu_Die:
	LDA <Player_HaltGameZ
	BNE Lakitu_DieDone

	LDA Lakitu_MadePoof, X
	BNE Lakitu_NoPoof

	LDA <Objects_XZ, X
	STA Poof_X

	LDA <Objects_YZ, X 
	ADD #$10
	STA Poof_Y

	LDA <Objects_YHiZ, X
	ADC #$00
	STA Poof_YHi
	JSR Common_MakePoof

	INC Lakitu_MadePoof, X

	LDA Lakitu_EnemySlot, X
	BMI Lakitu_NoPoof

	TAY
	LDA #$00
	STA Objects_State, Y

Lakitu_NoPoof:
	JSR Object_Move

	LDA <Objects_YHiZ, X
	BEQ Lakitu_DieDone

	LDA <Objects_YZ, X
	CMP #$B0
	BCC Lakitu_DieDone

	LDA #$FF
	STA Objects_SlowTimer, X

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X


	JSR Lakitu_Reset

	LDA #$00
	STA Objects_Frame, X

	LDA Objects_Orientation, X
	AND #~SPR_VFLIP
	STA Objects_Orientation, X

	RTS

Lakitu_DieDone:
	LDA #$01
	STA Objects_Frame, X

	LDA #SPR_VFLIP
	ORA Objects_Orientation, X
	STA Objects_Orientation, X

	JMP Object_DrawMirrored

Lakitu_Wait:
	LDA Objects_Timer, X
	BNE Lakitu_WaitDone

	INC Lakitu_Action, X

Lakitu_WaitDone:
	RTS

Lakitu_Lower:
	INC Lakitu_BodyOffset, X
	LDY Lakitu_BodyOffset, X
	CPY #$10
	BCC Lakitu_LowerDone

	INC Lakitu_Action, X

Lakitu_LowerDone:
	RTS

Lakitu_GetEnemy:
	LDA Objects_Property, X
	TAY
	LDA Lakitu_EnemyToss, Y
	STA <Temp_Var1

	LDA Lakitu_EnemyProperty, Y
	STA <Temp_Var2

	JSR Object_FindEmptyY
	BCC Lakitu_GetEnemyDone

	TYA
	STA Lakitu_EnemySlot, X

	LDA #OBJSTATE_NONE
	STA Objects_State, Y
	STA Objects_NoExp, Y

	LDA <Temp_Var1
	STA Objects_ID, Y	

	LDA <Temp_Var2
	STA Objects_Property, Y

	INC Lakitu_Action, X

Lakitu_GetEnemyDone:
	RTS

Lakitu_RaiseEnemy:
	INC Lakitu_EnemyOffset, X
	LDA Lakitu_EnemyOffset, X
	CMP #$0C
	BCC Lakitu_RaiseEnemyDone

	INC Lakitu_Action, X
	LDA #$01
	STA Objects_Frame, X

Lakitu_RaiseEnemyDone:
	RTS

Lakitu_Raise:
	DEC Lakitu_BodyOffset, X
	BNE Lakitu_RaiseDone

	INC Lakitu_Action, X

	LDA RandomN, X
	AND #$03
	TAY
	LDA Lakitu_AimTimers, Y
	STA Objects_Timer, X

Lakitu_RaiseDone:
	RTS

Lakitu_AimTimers:
	.byte $20, $40, $40, $10


Lakitu_WaitTimers:
	.byte $40, $40, $60, $30

Lakitu_Aim:
	LDA Objects_Timer, X
	BNE Lakitu_AimDone

	LDA <Objects_XZ, X
	AND #$0F
	BNE Lakitu_AimDone

	LDA <Objects_XZ, X
	ADD #$08
	STA Tile_DetectionX

	LDA <Objects_XHiZ, X
	STA Tile_DetectionXHi

	LDA <Objects_YZ, X
	SUB #$08
	STA Tile_DetectionY

	LDA <Objects_YHiZ, X
	SBC #$00
	STA Tile_DetectionYHi

	JSR Object_DetectTile

	LDA Tile_LastProp
	CMP #TILE_PROP_SOLID_ALL
	BCS Lakitu_AimDone

	LDY Lakitu_EnemySlot, X
	LDA #OBJSTATE_FRESH
	STA Objects_State, Y

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

	LDA #$00
	STA Objects_YVelZ, Y

	LDA <Objects_XVelZ, X
	STA Objects_XVelZ, Y

Lakitu_Reset:

	LDA RandomN, X
	AND #$03
	TAY
	LDA Lakitu_WaitTimers, Y
	STA Objects_Timer, X

	LDA #$00
	STA Lakitu_EnemyOffset, X
	STA Lakitu_BodyOffset, X
	STA Lakitu_MadePoof, X
	STA Lakitu_Action, X
	STA Objects_Frame, X

	LDA #$FF
	STA Lakitu_EnemySlot, X


Lakitu_AimDone:
	RTS

Lakitu_Draw:
	LDA Object_SpriteRAMOffset, X
	ADD #$04
	STA Object_SpriteRAMOffset, X

	LDA <Objects_SpriteY, X
	ADD #$10
	STA <Objects_SpriteY, X

	JSR Object_Draw16x32Mirrored

	LDA Sprite_RAMY, Y
	STA <Temp_Var1

	LDA Sprite_RAMY + 8, Y
	STA Sprite_RAMY, Y

	LDA <Temp_Var1
	ADD Lakitu_BodyOffset, X
	BCS Lakitu_Draw_A
	STA Sprite_RAMY + 8, Y

Lakitu_Draw_A:
	LDA Sprite_RAMY + 4, Y
	STA <Temp_Var1

	LDA Sprite_RAMY + 12, Y
	STA Sprite_RAMY + 4, Y

	LDA <Temp_Var1
	ADD Lakitu_BodyOffset, X
	BCS Lakitu_Draw0
	STA Sprite_RAMY + 12, Y

Lakitu_Draw0:
	LDA Sprite_RAMX, Y
	ADD #$04
	BCS Lakitu_Draw1
	STA Sprite_RAMX, Y

Lakitu_Draw1:
	LDA Sprite_RAMX + 4, Y
	ADD #$04
	BCS Lakitu_Draw2

	STA Sprite_RAMX + 4, Y

Lakitu_Draw2:
	LDA Sprite_RAMAttr, Y
	AND #~SPR_PAL3
	ORA #SPR_PAL1
	STA Sprite_RAMAttr, Y

	LDA Sprite_RAMAttr + 4, Y
	AND #~SPR_PAL3
	ORA #SPR_PAL1
	STA Sprite_RAMAttr+ 4, Y

	TYA
	SUB #$04
	TAY

	LDA #$41
	STA Sprite_RAMTile, Y

	LDA Objects_SpriteX, X
	SUB #$04
	BCC Lakitu_Draw3
	STA Sprite_RAMX, Y
	
	LDA Objects_SpritesHorizontallyOffScreen, X
	AND #SPRITE_0_HINVISIBLE
	BNE Lakitu_Draw3

	LDA Sprite_RAMY + 4, Y
	STA Sprite_RAMY, Y


	LDA Sprite_RAMAttr + 4, Y
	STA Sprite_RAMAttr, Y

Lakitu_Draw3:
	LDA Lakitu_EnemySlot, X
	BMI Lakitu_DrawDone

	JSR Lakitu_DrawEnemy

Lakitu_DrawDone:
	LDA Object_SpriteRAMOffset, X
	SUB #$04
	STA Object_SpriteRAMOffset, X

	RTS

Lakitu_EnemyToss:
	.byte OBJ_SPINYEGG, OBJ_FREEZIE, OBJ_HARDICE, OBJ_LIGHTNINGBOLT

Lakitu_EnemyFrameLeft:
	.byte $99, $B1, $99, $99

Lakitu_EnemyFrameLeftAttr:
	.byte SPR_PAL1, SPR_PAL2, SPR_PAL2, SPR_PAL3

Lakitu_EnemyFrameRight:
	.byte $99, $B3, $9B, $9B

Lakitu_EnemyProperty:
	.byte $00, $00, $00, $00

Lakitu_EnemyFrameRightAttr:
	.byte SPR_PAL1 | SPR_HFLIP | SPR_VFLIP, SPR_PAL2, SPR_PAL2, SPR_PAL3

Lakitu_DrawEnemy:
	LDA Lakitu_EnemyOffset, X
	STA <Temp_Var1

	LDA Objects_Property, X
	TAX

	LDA Sprite_RAMY + 12, Y
	CMP #$F8
	BEQ Lakitu_Enemy1

	SUB <Temp_Var1
	STA Sprite_RAMY + 20, Y

Lakitu_Enemy1:
	STA <Temp_Var3

	LDA Lakitu_EnemyFrameLeft, X
	STA Sprite_RAMTile + 20, Y

	LDA Objects_SpriteAttributes, X
	AND #SPR_BEHINDBG
	ORA Lakitu_EnemyFrameLeftAttr, X
	STA Sprite_RAMAttr + 20, Y

	LDA Sprite_RAMX + 12, Y
	STA Sprite_RAMX + 20, Y
	ADD #$08
	STA <Temp_Var2

	LDA Objects_Property, X
	TAX

	LDA <Temp_Var3
	CMP #$F8
	BEQ Lakitu_DrawEnemyDone
	STA Sprite_RAMY + 24, Y

	LDA Lakitu_EnemyFrameRight, X
	STA Sprite_RAMTile + 24, Y

	LDA Objects_SpriteAttributes, X
	AND #SPR_BEHINDBG
	ORA Lakitu_EnemyFrameRightAttr, X
	STA Sprite_RAMAttr + 24, Y

	LDA <Temp_Var2
	STA Sprite_RAMX + 24, Y

Lakitu_DrawEnemyDone:
	RTS    

SpinyEgg_Frame = Objects_Data1

ObjInit_SpinyEgg:
	LDA #(ATTR_WINDAFFECTS)
	STA Objects_BehaviorAttr, X
	
	LDA #ATTR_STOMPPROOF
	STA Objects_WeaponAttr, X

	LDA #$02
	STA Objects_Health, X


	LDA #BOUND16x16
	STA Objects_BoundBox, X
	RTS

ObjNorm_SpinyEgg:
	LDA <Player_HaltGameZ
	BEQ SpinyEgg_Norm

	JMP SpinyEgg_Draw

SpinyEgg_Norm:
	JSR Object_DeleteOffScreen
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ SpinyEgg_Animate

	LDA Objects_SpritesHorizontallyOffScreen,X
	ORA Objects_SpritesVerticallyOffScreen,X
	BNE SpinEgg_NoBurst

	LDA <Objects_XZ, X
	STA Debris_X

	LDA <Objects_YZ, X
	STA Debris_Y

	JSR Common_MakeDebris
	LDA #$A7
	STA BrickBust_Tile, Y

	LDA #SPR_PAL1
	STA BrickBust_Pal, Y

SpinEgg_NoBurst:
	LDA #OBJ_SPINY
	STA Objects_ID, X

	LDA #(ATTR_HASSHELL | ATTR_WINDAFFECTS | ATTR_CARRYANDBUMP)
	STA Objects_BehaviorAttr, X

	JSR Object_MoveTowardsPlayer

SpinyEgg_Animate:
	INC SpinyEgg_Frame, X

SpinyEgg_Draw:
	JSR Object_DrawMirrored

	LDA SpinyEgg_Frame, X
	LSR A
	LSR A
	LSR A
	AND #$01
	BEQ SpinyEgg_FlipRight

	LDA Sprite_RAMAttr, Y
	ORA #SPR_VFLIP
	STA Sprite_RAMAttr, Y
	RTS		 ; Return

SpinyEgg_FlipRight:
	LDA Sprite_RAMAttr + 4, Y
	ORA #SPR_VFLIP
	STA Sprite_RAMAttr + 4, Y
	RTS    



FireIcePirateBro_JumpWait: .byte $C0, $FF
FireIcePirateBro_WaitTimers: .byte $60, $40, $40, $40

FireIcePirateBro_Frame = Objects_Data1
FireIcePirateBro_Action = Objects_Data2
FireIcePirateBro_RangeLeft = Objects_Data3
FireIcePirateBro_RangeRight = Objects_Data4
FireIcePirateBro_SpitTimer = Objects_Data5
FireIcePirateBro_OpenMouthTimer = Objects_Data6
FireIcePirateBro_WalkDirection = Objects_Data7
FireIcePirateBro_FireIcePirateCount = Objects_Data8
FireIcePirateBro_WalkDirectionBackup = Objects_Data9
FireIcePirateBro_Projectile = Objects_Data10

ObjInit_IceBro:
	LDA #$04
	STA Objects_SpritesRequested, X

	LDA #BOUND16x24
	STA Objects_BoundBox, X

	JSR ObjInit_FireBro

	LDA #SOBJ_ICEBALL
	STA FireIcePirateBro_Projectile, X

	LDA #$02
	STA Objects_Health, X
	RTS		 ; Return    


ObjInit_FireBro:
	LDA #$04
	STA Objects_SpritesRequested, X

	LDA #BOUND16x24
	STA Objects_BoundBox, X

	JSR Object_CalcBoundBox
	JSR Object_MoveTowardsPlayer

	LDA <Objects_XVelZ, X
	STA FireIcePirateBro_WalkDirection, X

	LDA <Objects_XZ, X
	SUB #$10
	STA FireIcePirateBro_RangeLeft, X

	LDA <Objects_XZ, X
	ADD #$10
	STA FireIcePirateBro_RangeRight, X

	LDA #SOBJ_FIREBALL
	STA FireIcePirateBro_Projectile, X

	LDA #$02
	STA Objects_Health, X
	RTS		 ; Return
    


ObjInit_PirateBro:
	LDA #$04
	STA Objects_SpritesRequested, X

	LDA #BOUND16x24
	STA Objects_BoundBox, X

	JSR ObjInit_FireBro

	LDA #SOBJ_CANNONBALL
	STA FireIcePirateBro_Projectile, X
	
	LDA #$02
	STA Objects_Health, X
	RTS		 ; Return    


ObjNorm_FireIcePirateBro:
	LDA <Player_HaltGameZ
	BEQ FireIcePirateBro_Norm

	JMP Object_Draw16x32

FireIcePirateBro_Norm:

	JSR Object_DeleteOffScreen	 ; Delete object if it falls off-screen

	LDA FireIcePirateBro_WalkDirection, X
	STA <Objects_XVelZ, X

	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	JSR Object_FacePlayer
	JSR Object_AttackOrDefeat

	LDA FireIcePirateBro_OpenMouthTimer, X
	BEQ FireIcePirateBro_NotOpen

	DEC FireIcePirateBro_OpenMouthTimer, X
	BNE FireIcePirateBro_CheckJump

	LDA FireIcePirateBro_FireIcePirateCount, X
	BEQ FireIcePirateBro_Reset

	DEC FireIcePirateBro_FireIcePirateCount, X

	JSR FireIcePirateBro_Shoot

	LDA #$18
	STA FireIcePirateBro_OpenMouthTimer, X
	BNE FireIcePirateBro_CheckJump

FireIcePirateBro_Reset:
	LDA RandomN + 1, X
	AND #$03
	TAY 
	LDA FireIcePirateBro_WaitTimers, Y
	STA FireIcePirateBro_SpitTimer, X

	LDA FireIcePirateBro_WalkDirectionBackup, X
	STA FireIcePirateBro_WalkDirection, X
	
FireIcePirateBro_NotOpen:
	LDA FireIcePirateBro_SpitTimer, X
	BNE FireIcePirateBro_DecFireIcePirateTimer

	LDA #$18
	STA FireIcePirateBro_OpenMouthTimer, X

	LDA RandomN, X
	AND #$01
	ADD #$01
	STA FireIcePirateBro_FireIcePirateCount, X

	LDA FireIcePirateBro_WalkDirection, X
	STA FireIcePirateBro_WalkDirectionBackup, X

	LDA #$00
	STA FireIcePirateBro_WalkDirection, X
	BEQ FireIcePirateBro_CheckJump

FireIcePirateBro_DecFireIcePirateTimer:
	DEC FireIcePirateBro_SpitTimer, X

FireIcePirateBro_CheckJump:
	LDA Objects_Timer, X
	BNE FireIcePirateBro_NoJump

	LDA #$C0
	STA <Objects_YVelZ, X

	LDA RandomN, X
	AND #$10
	LSR A
	LSR A
	LSR A
	LSR A
	TAY

	LDA FireIcePirateBro_JumpWait, Y
	STA Objects_Timer, X


FireIcePirateBro_NoJump:

	LDA <Objects_XZ, X
	CMP FireIcePirateBro_RangeLeft, X
	BEQ FireIcePirateBro_TurnAround

	CMP FireIcePirateBro_RangeRight, X
	BNE FireIcePirateBro_Animate

FireIcePirateBro_TurnAround:
	LDA FireIcePirateBro_WalkDirection, X
	EOR #$FF
	ADD #$01
	STA FireIcePirateBro_WalkDirection, X

FireIcePirateBro_Animate:
	LDA FireIcePirateBro_WalkDirection, X
	BEQ FireIcePirateBros_NoAnimate

	INC FireIcePirateBro_Frame, X

FireIcePirateBros_NoAnimate:
	LDA #$00
	STA <Temp_Var2

	LDA FireIcePirateBro_Frame, X
	LSR A
	LSR A
	LSR A
	LSR A
	AND #$01
	STA <Temp_Var1

	LDA FireIcePirateBro_OpenMouthTimer, X
	BEQ FireIcePirateBros_FinishAnimate

	LDA #$02
	STA <Temp_Var2

FireIcePirateBros_FinishAnimate:

	LDA <Temp_Var1
	ORA <Temp_Var2
	STA Objects_Frame, X

FireIcePirateBros_Draw:
	JMP Object_Draw16x32


FireIcePirate_XVel:
	.byte $E0, $20
	
FireIcePirate_XOffset:
	.byte $FE, $08
	.byte $FF, $00

FireIcePirateBro_Shoot:

	LDA Objects_SpritesHorizontallyOffScreen,X
	CMP #(SPRITE_0_INVISIBLE | SPRITE_1_INVISIBLE)
	BCS FireICePriateBro_NoShoot

	LDA Objects_SpritesHorizontallyOffScreen,X
	BEQ FireIcePirateBro_DoShoot

FireICePriateBro_NoShoot:
	RTS

FireIcePirateBro_DoShoot:
	LDY #$00

	LDA Objects_Orientation, X
	AND #SPR_HFLIP
	BEQ FireIcePirateBro_SpitRight

	INY

FireIcePirateBro_SpitRight:
	
	LDA FireIcePirate_XOffset, Y
	STA <Temp_Var14

	LDA FireIcePirate_XOffset + 2, Y
	STA <Temp_Var15

	LDA FireIcePirate_XVel, Y
	STA <Temp_Var16

	JSR Object_PrepProjectile
	BCC FireIcePirateBro_ShootDone

	LDA FireIcePirateBro_Projectile, X
	STA SpecialObj_ID, Y

	CMP #SOBJ_ICEBALL
	BNE FireIcePirateBro_SpitNorm

	LDA <Temp_Var16
	JSR Half_Value
	STA SpecialObj_XVel, Y
	BNE FireIcePirateBro_SetYVel
	
FireIcePirateBro_SpitNorm:
	LDA <Temp_Var16
	STA SpecialObj_XVel, Y

FireIcePirateBro_SetYVel:
	LDA #$FE
	STA SpecialObj_YVel, Y

	LDA <Objects_XZ, X
	ADD <Temp_Var14
	STA SpecialObj_X, Y

	LDA <Objects_XHiZ, X
	ADC <Temp_Var15
	STA SpecialObj_XHi, Y

	LDA <Objects_YZ, X
	ADD #$04
	STA SpecialObj_Y, Y

	LDA <Objects_YHiZ, X
	ADC #$00
	STA SpecialObj_YHi, Y

	LDA FireIcePirateBro_Projectile, X
	CMP #SOBJ_CANNONBALL
	BNE FireIcePirateBro_ShootDone

	LDA #SND_LEVELBABOOM
	ORA Sound_QLevel1
	STA Sound_QLevel1

	LDA #$00
	STA SpecialObj_YVel, Y

	LDA #$01
	STA SpecialObj_Stompable, Y
	
	LDA SpecialObj_Y, Y
	SUB #$02
	STA SpecialObj_Y, Y

	LDA SpecialObj_YHi, Y
	SBC #$00
	STA SpecialObj_YHi, Y
	RTS

FireIcePirateBro_ShootDone:
	LDA #SND_PLAYERFIRE
	ORA Sound_QPlayer
	STA Sound_QPlayer
	RTS    


Chomp_Frame = Objects_Data1
Chomp_Charges = Objects_Data2
Chomp_PinX = Objects_Data3
Chomp_PinY = Objects_Data4
Chomp_Charging = Objects_Data5
Chomp_CanCharge = Objects_Data6
Chomp_XChainMax = Objects_Data7
Chomp_YChainMax = Objects_Data8

ObjInit_ChainChomp:
	LDA #$06
	STA Objects_SpritesRequested, X

	LDA #$03
	STA Objects_ExpPoints, X

	LDA #$04
	STA Objects_Health, X

	LDA Objects_Property, X
	BEQ ChainChomp_NotCharging

	LDA #$02
	STA Chomp_Charging, X

ChainChomp_NotCharging:

	; Fill in all f the following with the Chain Chomp's Pining X coordinate
	LDA #BOUND16x16
	STA Objects_BoundBox, X

	LDA #(ATTR_FIREPROOF | ATTR_ICEPROOF | ATTR_STOMPPROOF | ATTR_TAILPROOF |  ATTR_NINJAPROOF)
	STA Objects_WeaponAttr, X

	LDA #ATTR_BUMPNOKILL
	STA Objects_BehaviorAttr, X

	LDA <Objects_XZ,X
	ADD #$08
	STA Chomp_PinX,X
	SUB #$04
	STA ChainChomp_ChainX1, X
	STA ChainChomp_ChainX2, X
	STA ChainChomp_ChainX3, X
	STA ChainChomp_ChainX4, X
	
	LDA <Objects_YZ,X
	ADD #$08
	STA Chomp_PinY,X
	SUB #$08
	STA ChainChomp_ChainY1, X
	STA ChainChomp_ChainY2, X
	STA ChainChomp_ChainY3, X
	STA ChainChomp_ChainY4, X
	
	LDA <Objects_YZ,X
	SUB #$10
	STA <Objects_YZ,X
	
	LDA <Objects_YHiZ,X
	SBC #$00
	STA <Objects_YHiZ,X
	
	JSR Object_MoveTowardsPlayerFast
	
	LDA #$04
	STA Chomp_Charges, X
	
	RTS		 ; Return


Chomp_ChargeTimers:
	.byte $40, $60, $50, $70, $50, $40, $60, $60

Chomp_ChargeXVel:
	.byte $40, $38, $30, $28, $20, $40, $38, $30

Chomp_ChargeYVel:
	.byte $FF, $F0, $E0, $D0, $C0, $00, $F0, $E0

Chomp_Restrain:
	
	LDA Chomp_XChainMax, X
	BEQ RestrainY

	JSR MaxOutChainsX
	LDA Chomp_Charging, X
	BNE RestrainXCharging

	LDY #$00
	LDA <Objects_XZ, X
	SUB Chomp_PinX, X
	BMI Chomp_Restrain1

	INY

Chomp_Restrain1:
	LDA <Objects_XVelZ, X
	BEQ Chomp_RestrainXRTS

	AND #$80
	CMP MaxChainVelCmp, Y
	BNE Chomp_RestrainXRTS

	LDA <Objects_XVelZ, X
	EOR #$FF
	ADD #$01
	STA <Objects_XVelZ, X

Chomp_RestrainXRTS:
	RTS

RestrainXCharging:
	LDA #$00
	STA <Objects_XVelZ, X
	STA <Objects_YVelZ, X

RestrainY:
	LDA Chomp_YChainMax, X
	BEQ RestraintRTS

	JSR MaxOutChainsY

	LDA <Objects_YVelZ, X
	BPL RestraintRTS

	LDA #$00
	STA <Objects_YVelZ, X
	STA <Objects_XVelZ, X

RestraintRTS:
	RTS

MaxChainVelCmp:
	.byte $80, $00

MaxOutChainsX:
	LDY #$00
	LDA <Objects_XZ, X
	SUB Chomp_PinX, X
	BMI MaxOutChainsX1

	INY

MaxOutChainsX1:
	LDA ChainChomp_ChainX4, X
	ADD ChainOffset, Y

	STA ChainChomp_ChainX3, X
	ADD ChainOffset, Y

	STA ChainChomp_ChainX2, X
	ADD ChainOffset, Y

	STA ChainChomp_ChainX1, X
	JSR EvenOutYChains

MaxOutChainsX2:
	RTS

MaxOutChainsY:
	LDA ChainChomp_ChainY4, X
	ADD ChainOffset
	STA ChainChomp_ChainY3, X
	ADD ChainOffset
	STA ChainChomp_ChainY2, X
	ADD ChainOffset
	STA ChainChomp_ChainY1, X
	JSR EvenOutXChains
	RTS

EvenOutYChains:
	LDA <Objects_YZ, X
	ADD #$08
	STA <Temp_Var2

	LDA ChainChomp_ChainY4, X
	SUB <Temp_Var2
	JSR Half_Value
	JSR Half_Value
	
	STA <Temp_Var3

	LDA <Temp_Var2

	ADD <Temp_Var3
	STA ChainChomp_ChainY1, X

	ADD <Temp_Var3
	STA ChainChomp_ChainY2, X

	ADD <Temp_Var3
	STA ChainChomp_ChainY3, X
	RTS

EvenOutXChains:
	LDA <Objects_XZ, X
	ADD #$08
	STA <Temp_Var2

	LDA ChainChomp_ChainX4, X
	SUB <Temp_Var2
	JSR Half_Value
	JSR Half_Value
	
	STA <Temp_Var3

	LDA <Temp_Var2

	ADD <Temp_Var3
	STA ChainChomp_ChainX1, X

	ADD <Temp_Var3
	STA ChainChomp_ChainX2, X

	ADD <Temp_Var3
	STA ChainChomp_ChainX3, X
	RTS

ObjNorm_ChainChomp:

	LDA <Player_HaltGameZ
	BEQ ChompNorm

	LDA Chomp_Charging, X
	CMP #$02
	BCS NoChainDraw

	JSR Chomp_DrawChains

NoChainDraw:
	JMP Object_Draw

ChompNorm:
	LDA #$60
	JSR Object_DeleteOffScreenRange

	LDA Chomp_Charging, X
	JSR DynJump

	.word Chomp_BounceAround
	.word Chomp_ChargeAtPlayer
	.word Chomp_Free

ChargeSignCheck:
	.byte $00, $80

Chomp_BounceAround:
	JSR Object_Move
	JSR Chomp_MoveChains
	JSR Chomp_Restrain
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat	 
	JSR Object_FaceDirectionMoving
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles
	
	LDA Chomp_CanCharge, X
	BEQ Chomp_NoCharge
	
	JSR Object_XDistanceFromPlayer
	CMP #$20
	BCC Chomp_NoCharge
	
	LDA <Objects_XZ, X
	SUB Chomp_PinX, X
	AND #$80
	CMP ChargeSignCheck, Y
	BNE Chomp_NoCharge
	
	JSR Chomp_Charge
	LDA #$00
	STA Chomp_CanCharge, X
	JMP ChompAnimate

Chomp_NoCharge:
	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ ChompAnimate

	LDA #$01
	STA Chomp_CanCharge, X

	LDA #$E8
	STA <Objects_YVelZ, X

	LDA #$10
	JSR Object_DetectTileAhead
	CMP #TILE_PROP_SOLID_ALL
	BCC NoBounceHigher

	LDA #$D0
	STA <Objects_YVelZ, X

NoBounceHigher:
	LDA <Objects_XVelZ, X
	BNE ChompAnimate

	JSR Object_MoveAwayFromPlayerFast

ChompAnimate:
	INC Chomp_Frame, x
	LDA Chomp_Frame, x
	LSR A
	LSR A

	LDY Chomp_Charging, X
	BNE Chomp_NotFastAnim

	LSR A

Chomp_NotFastAnim:
	AND #$01
	STA Objects_Frame, X
	JSR Chomp_DrawChains
	JMP Object_Draw

Chomp_ChargeAtPlayer:
	JSR Object_ApplyXVel
	JSR Object_ApplyYVel_NoGravity
	JSR Chomp_MoveChains
	JSR Chomp_Restrain
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat	 
	JSR Object_FaceDirectionMoving
	
	LDA Objects_Timer, X
	BNE Chomp_ChargeAtPlayer1

	DEC Chomp_Charges, X
	BEQ Chomp_GetFree

	LDA #$00
	STA Chomp_Charging, X
	STA <Objects_XVelZ, X
	
Chomp_ChargeAtPlayer1:
	JMP ChompAnimate

Chomp_GetFree:
	JSR Object_MoveTowardsPlayerFast

	LDA Chomp_PinX, X
	SUB <Objects_XZ, X

	JSR Half_Value
	ADD <Objects_XZ, X
	STA <Debris_X

	LDA Chomp_PinY,  X
	SUB <Objects_YZ, X

	JSR Half_Value

	ADD <Objects_YZ,X
	STA <Debris_Y
	JSR Common_MakeChains
	LDA #$02
	STA Chomp_Charging, X

	JMP ChompAnimate

Chomp_ChargeSign:
	.byte $80, $00

Chomp_Aim:
	LDA RandomN
	AND #$07
	TAY
	LDA Chomp_ChargeXVel, Y
	STA <Objects_XVelZ, X

	LDA Chomp_ChargeYVel, Y
	STA <Objects_YVelZ, X

	JSR Object_XDistanceFromPlayer
	CPY #$00
	BNE Chomp_Aim1

	LDA <Objects_XVelZ, X
	EOR #$FF
	ADD #$01
	STA <Objects_XVelZ, X

Chomp_Aim1:
	RTS
	
Chomp_Charge:
	JSR Chomp_Aim
	
	LDA #$20
	STA Objects_Timer, X
	INC Chomp_Charging, X
	RTS

ChainOffset:
	.byte $F3, $0D

Chomp_MoveChains:
	LDA #$00
	STA Chomp_XChainMax, X
	STA Chomp_YChainMax, X

	LDA ChainChomp_ChainY4, X
	SUB <Vert_Scroll
	STA <Temp_Var1

	LDA ChainChomp_ChainY1, X
	SUB <Vert_Scroll
	SUB <Temp_Var1
	BPL Chain1OK
	
	INC ChainChomp_ChainY1, X
	INC ChainChomp_ChainY1, X

Chain1OK:
	LDA ChainChomp_ChainY2, X
	SUB <Vert_Scroll
	SUB <Temp_Var1
	BPL Chain2OK

	INC ChainChomp_ChainY2, X
	INC ChainChomp_ChainY2, X

Chain2OK:
	LDA ChainChomp_ChainY3, X
	SUB <Vert_Scroll
	SUB <Temp_Var1
	BPL Chain3OK


	INC ChainChomp_ChainY3, X
	INC ChainChomp_ChainY3, X

Chain3OK:	
	LDA <Objects_XZ, X
	ADD #$08
	STA <Temp_Var1

	LDY #$00
	LDA ChainChomp_ChainX1, X
	ADD #$04
	SUB <Temp_Var1
	BPL CMVC1

	INY

CMVC1:
	CMP ChainOffset + 1
	BCC SetChain_YJumpCC

	CMP ChainOffset
	BCS SetChain_YJumpCS

	ADD ChainOffset, Y
	EOR #$FF
	ADD #$01
	ADD ChainChomp_ChainX1, X
	STA ChainChomp_ChainX1, X
	ADD #$04
	STA <Temp_Var1

	LDY #$00
	LDA ChainChomp_ChainX2, X
	ADD #$04
	SUB <Temp_Var1
	BPL CMVC2

	INY

CMVC2:
	CMP ChainOffset + 1

SetChain_YJumpCC:
	BCC SetChain_Y

	CMP ChainOffset

SetChain_YJumpCS:
	BCS SetChain_Y
	
	ADD ChainOffset, Y
	EOR #$FF
	ADD #$01
	ADD ChainChomp_ChainX2, X
	STA ChainChomp_ChainX2, X
	ADD #$04
	STA <Temp_Var1

	LDY #$00
	LDA ChainChomp_ChainX3, X
	ADD #$04
	SUB <Temp_Var1
	BPL CMVC3

	INY

CMVC3:
	CMP ChainOffset + 1
	BCC SetChain_Y

	CMP ChainOffset
	BCS SetChain_Y
	
	ADD ChainOffset, Y
	EOR #$FF
	ADD #$01
	ADD ChainChomp_ChainX3, X
	STA ChainChomp_ChainX3, X
	ADD #$04
	STA <Temp_Var1

	LDY #$00
	LDA ChainChomp_ChainX4, X
	ADD #$04
	SUB <Temp_Var1
	BPL CMVCMaxX

	INY

CMVCMaxX:
	CMP ChainOffset + 1
	BCC SetChain_Y

	CMP ChainOffset
	BCS SetChain_Y

	ADD ChainOffset, Y

	BEQ SetChain_Y

	INC Chomp_XChainMax, X

SetChain_Y:
	LDA <Objects_YZ, X
	ADD #$08
	STA <Temp_Var1

	LDY #$00
	LDA ChainChomp_ChainY1, X
	ADD #$08
	SUB <Temp_Var1
	BPL CMVC4

	INY

CMVC4:
	CMP ChainOffset + 1
	BCC Chomp_MoveChains1CC

	CMP ChainOffset
	BCS Chomp_MoveChains1CS

	ADD ChainOffset, Y
	EOR #$FF
	ADD #$01
	ADD ChainChomp_ChainY1, X
	STA ChainChomp_ChainY1, X
	ADD #$08
	STA <Temp_Var1

	LDY #$00
	LDA ChainChomp_ChainY2, X
	ADD #$08
	SUB <Temp_Var1
	BPL CMVC5

	INY

CMVC5:

	CMP ChainOffset + 1
Chomp_MoveChains1CC:
	BCC Chomp_MoveChains1

	CMP ChainOffset
Chomp_MoveChains1CS:
	BCS Chomp_MoveChains1
	
	ADD ChainOffset, Y
	EOR #$FF
	ADD #$01
	ADD ChainChomp_ChainY2, X
	STA ChainChomp_ChainY2, X
	ADD #$08
	STA <Temp_Var1

	LDY #$00
	LDA ChainChomp_ChainY3, X
	ADD #$08
	SUB <Temp_Var1
	BPL CMVC6

	INY

CMVC6:
	CMP ChainOffset + 1
	BCC Chomp_MoveChains1

	CMP ChainOffset
	BCS Chomp_MoveChains1
	
	ADD ChainOffset, Y
	EOR #$FF
	ADD #$01
	ADD ChainChomp_ChainY3, X
	STA ChainChomp_ChainY3, X

	ADD #$08
	STA <Temp_Var1

	LDY #$00
	LDA ChainChomp_ChainY4, X
	ADD #$08
	SUB <Temp_Var1
	BPL CMVCMaxY

	INY

CMVCMaxY:
	CMP ChainOffset + 1
	BCC Chomp_MoveChains1

	CMP ChainOffset
	BCS Chomp_MoveChains1
	
	ADD ChainOffset, Y
	BEQ Chomp_MoveChains1

	INC Chomp_YChainMax, X

Chomp_MoveChains1:
	RTS

Chomp_DrawChains:
	LDY Object_SpriteRAMOffset, X
	STY <Temp_Var4

	LDA ChainChomp_ChainX1, X
	SUB <Horz_Scroll
	STA <Temp_Var2
	

	LDA ChainChomp_ChainY1, X
	SUB <Vert_Scroll
	STA <Temp_Var1

	JSR Object_ParticleVisibleTest
	BCS CDC1

	LDY <Temp_Var4
	LDA <Temp_Var2
	STA Sprite_RAMX + 8, Y
	LDA <Temp_Var1
	STA Sprite_RAMY + 8, Y

CDC1:
	LDA ChainChomp_ChainX2, X
	SUB <Horz_Scroll
	STA <Temp_Var2

	LDA ChainChomp_ChainY2, X
	SUB <Vert_Scroll
	STA <Temp_Var1

	JSR Object_ParticleVisibleTest
	BCS CDC2

	LDY <Temp_Var4
	LDA <Temp_Var2
	STA Sprite_RAMX + 12, Y
	LDA <Temp_Var1
	STA Sprite_RAMY + 12, Y

CDC2:
	LDA ChainChomp_ChainX3, X
	SUB <Horz_Scroll
	STA <Temp_Var2

	LDA ChainChomp_ChainY3, X
	SUB <Vert_Scroll
	STA <Temp_Var1

	JSR Object_ParticleVisibleTest
	BCS CDC3
	
	LDY <Temp_Var4
	LDA <Temp_Var2
	STA Sprite_RAMX + 16, Y
	LDA <Temp_Var1
	STA Sprite_RAMY + 16, Y
	
CDC3:
	LDA ChainChomp_ChainX4, X
	SUB <Horz_Scroll
	STA <Temp_Var2

	LDA ChainChomp_ChainY4, X
	SUB <Vert_Scroll
	STA <Temp_Var1

	JSR Object_ParticleVisibleTest
	BCS CDC4

	LDY <Temp_Var4
	LDA <Temp_Var2
	STA Sprite_RAMX + 20, Y
	LDA <Temp_Var1
	STA Sprite_RAMY + 20, Y

CDC4:
	LDY <Temp_Var4
	LDA #$BD
	STA Sprite_RAMTile + 8, Y
	STA Sprite_RAMTile + 12, Y
	STA Sprite_RAMTile + 16, Y
	STA Sprite_RAMTile + 20, Y

	LDA #SPR_PAL1
	STA Sprite_RAMAttr + 8, Y
	STA Sprite_RAMAttr + 12, Y
	STA Sprite_RAMAttr + 16, Y
	STA Sprite_RAMAttr + 20, Y
	RTS

Chomp_Free:
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat	 
	JSR Object_FaceDirectionMoving
	JSR Object_DetectTiles
	JSR Object_InteractWithTiles

	

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ FreeNoBounce

	JSR Object_MoveTowardsPlayerFast

	LDA #$E8
	STA <Objects_YVelZ, X

	LDA #$10
	JSR Object_DetectTileAhead
	CMP #TILE_PROP_SOLID_ALL
	BCC FreeNoBounce

	LDA #$D0
	STA <Objects_YVelZ, X

FreeNoBounce:
	INC Chomp_Frame, x
	LDA Chomp_Frame, x
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame, X
	JMP Object_Draw    


ObjInit_Thwomp:
	LDA #$06
	STA Objects_SpritesRequested, X

	LDA #(ATTR_FIREPROOF | ATTR_ICEPROOF | ATTR_NINJAPROOF | ATTR_TAILPROOF | ATTR_DASHPROOF | ATTR_STOMPPROOF)
	STA Objects_WeaponAttr, X

	LDA #(ATTR_SHELLPROOF | ATTR_BUMPNOKILL)
	STA Objects_BehaviorAttr, X

	LDA #BOUND24x32
	STA Objects_BoundBox, X

	LDA #$10
	STA Objects_Health, X

	; Var4 = origin Y
	LDA <Objects_YZ, X
	STA Thwomp_StartY, X

	LDA <Objects_YHiZ, X
	STA Thwomp_StartYHi, X
	
	; center the X
	LDA <Objects_XZ,X
	ADD #$04
	STA <Objects_XZ,X

	LDA <Objects_XHiZ,X
	ADD #$00
	STA <Objects_XHiZ,X

	LDA #$05
	STA Objects_Health, X

PRG004_A676:
	RTS		 ; Return


Thwomp_Action = Objects_Data1
Thwomp_Ticker = Objects_Data2
Thwomp_StartY = Objects_Data3
Thwomp_StartYHi = Objects_Data4
Thwomp_TilesDetected = Objects_Data5

Thwomp_DetectXOffset:
	.byte $05, $14

ObjNorm_Thwomp:
	LDA <Player_HaltGameZ
	BEQ Thwomp_Normal

	JMP Thwomp_Draw

Thwomp_Normal:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE Thwomp_DoAction

	LDA <Objects_XZ, X
	ADD #$08
	STA <Debris_X

	LDA <Objects_YZ, X
	STA <Debris_Y

	JSR Common_MakeDebris
	LDA #BRICK_DEBRIS
	STA BrickBust_Tile, Y

	LDA Objects_SpriteAttributes, X
	STA BrickBust_Pal, Y
	
	LDA <Objects_XZ, X

	LDA <Objects_YZ, X
	ADD #$10
	STA <Debris_Y

	JSR Common_MakeDebris
	LDA #BRICK_DEBRIS
	STA BrickBust_Tile, Y

	LDA Objects_SpriteAttributes, X
	STA BrickBust_Pal, Y
	JMP Object_SetDeadAndNotSpawned

Thwomp_DoAction:
	JSR Object_DeleteOffScreen
	
	LDA Thwomp_Action, X
	JSR DynJump

	.word Thwomp_WaitForPlayer
	.word Thwomp_FallToGround
	.word Thwomp_ReturnToOrigin

Thwomp_WaitForPlayer:
	LDA Objects_SpritesVerticallyOffScreen,X
	CMP #(SPRITE_0_VINVISIBLE | SPRITE_1_VINVISIBLE)

	BEQ Thwomp_KeepWaiting
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

	JSR Object_XDistanceFromPlayer

	LDY #$00
	LDA <XDiff
	CMP #$50
	BCS Thwomp_KeepFrame

	INY

Thwomp_KeepFrame:
	TYA
	STA Objects_Frame, X

	LDA <XDiff
	CMP #$20
	BCS Thwomp_KeepWaiting

	INC Thwomp_Action, X

	LDA #$00
	STA Thwomp_TilesDetected, X

	LDA #$02
	STA Objects_Frame, X

Thwomp_KeepWaiting:
	JMP Thwomp_Draw

Thwomp_FallToGround:
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

	INC Thwomp_Ticker, X
	LDA Thwomp_Ticker, X
	AND #$01
	TAY

	LDA Objects_BoundLeft, X
	ADD Thwomp_DetectXOffset, Y
	STA Tile_DetectionX

	LDA Objects_BoundLeftHi, X
	ADC #$00
	STA Tile_DetectionXHi

	LDA Objects_BoundBottom, X
	STA Tile_DetectionY

	LDA Objects_BoundBottomHi, X
	STA Tile_DetectionYHi

	JSR Object_DetectTile

	LDA Tile_LastProp
	CMP #TILE_PROP_SOLID_TOP
	BCC Thwomp_NoHit

	JSR Object_HitGround

	INC Thwomp_TilesDetected, X
	LDA Thwomp_TilesDetected, X
	CMP #$03
	BCS Thwomp_DetectGrnd

	LDA #$20
	STA <Objects_YVelZ, X

	LDA Tile_LastProp
	CMP #(TILE_PROP_SOLID_ALL | TILE_PROP_ENEMYSOLID)
	BNE Thwomp_CheckBlock

	LDA #TILE_ITEM_BRICK
	STA Tile_LastProp

Thwomp_CheckBlock:
	CMP #TILE_ITEM_COIN
	BCC Thwomp_NoBump

	JSR Object_DirectBumpBlocks

Thwomp_NoBump:
	JMP Thwomp_Draw

Thwomp_DetectGrnd:
	LDA #$20
	STA Level_Vibration

	LDA #$30
	STA Objects_Timer, X

	LDA #SND_LEVELBABOOM
	STA Sound_QLevel1
	INC Thwomp_Action, X

Thwomp_NoHit:
	JMP Thwomp_Draw

Thwomp_ReturnToOrigin:
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

	LDA Objects_Timer, X
	BNE Thwomp_Draw

	LDA #$01
	STA Objects_Frame, X

	LDA #$F0
	STA <Objects_YVelZ, X
	JSR Object_Move

	LDA <Objects_YZ, X
	CMP Thwomp_StartY, X
	BNE Thwomp_Draw

	LDA <Objects_YHiZ, X
	CMP Thwomp_StartYHi, X
	BNE Thwomp_Draw

	LDA #$00
	STA Thwomp_Action, X

Thwomp_Draw:

	JSR Object_Draw16x32	 ; Draw left 2/3 of Thwomp

	LDY Object_SpriteRAMOffset,X	 ; Y = Sprite_RAM offset

	; The right sprites appear +16 away from Thwomp's left
	LDA Objects_SpritesHorizontallyOffScreen,X
	AND #SPRITE_2_INVISIBLE
	BNE Thwomp_DrawRTS

	LDA Objects_SpritesVerticallyOffScreen,X
	AND #SPRITE_0_VINVISIBLE
	BNE Thwomp_Draw1

	LDA Objects_SpriteX, X
	ADD #$10
	STA Sprite_RAMX + 16,Y

	LDA Objects_SpriteY, X
	STA Sprite_RAMY + 16,Y

	LDA Sprite_RAMAttr,Y
	ORA #SPR_HFLIP
	STA Sprite_RAMAttr + 16,Y

	
	LDA Sprite_RAMTile, Y
	STA Sprite_RAMTile + 16, Y

Thwomp_Draw1:
	LDA Objects_SpritesVerticallyOffScreen,X
	AND #SPRITE_1_VINVISIBLE
	BNE Thwomp_DrawRTS

	LDA Objects_SpriteX, X
	ADD #$10
	STA Sprite_RAMX + 20,Y

	LDA Objects_SpriteY, X
	ADD #$10
	STA Sprite_RAMY + 20,Y

	; Right sprite horizontally flipped
	LDA Sprite_RAMAttr + 8,Y
	ORA #SPR_HFLIP
	STA Sprite_RAMAttr + 20,Y

	LDA Sprite_RAMTile + 8, Y
	STA Sprite_RAMTile + 20, Y

Thwomp_DrawRTS:
	RTS		 ; Return    


ObjInit_AngryThwomp:
	LDA #$06
	STA Objects_SpritesRequested, X

	LDA #BOUND24x32
	STA Objects_BoundBox, X

	LDA #$03
	STA Thwomp_Action, X

	LDA <Objects_XZ, X
	ADD #$04
	STA <Objects_XZ, X

	LDA #$01
	STA Objects_Frame, X

	LDA #$05
	STA Objects_Health, X
	RTS

ObjNorm_AngryThwomp:
	LDA <Player_HaltGameZ
	BEQ AngryThwomp_Normal

	JMP Thwomp_Draw

AngryThwomp_Normal:

	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE AngryThwomp_DoAction

	LDA <Objects_XZ, X
	ADD #$08
	STA <Debris_X

	LDA <Objects_YZ, X
	STA <Debris_Y

	JSR Common_MakeDebris
	LDA #BRICK_DEBRIS
	STA BrickBust_Tile, Y

	LDA Objects_SpriteAttributes, X
	STA BrickBust_Pal, Y
	
	LDA <Objects_XZ, X

	LDA <Objects_YZ, X
	ADD #$10
	STA <Debris_Y

	JSR Common_MakeDebris
	LDA #BRICK_DEBRIS
	STA BrickBust_Tile, Y

	LDA Objects_SpriteAttributes, X
	STA BrickBust_Pal, Y
	JMP Object_Delete

AngryThwomp_DoAction:
	JSR Object_DeleteOffScreen

	LDA Thwomp_Action, X
	AND #$03

	JSR DynJump

	.word Thwomp_FallToGround
	.word AngryThwompWait
	.word Thwomp_FallToCeiling
	.word AngryThwompWait

AngryThwompWait:
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

	LDA Objects_Timer, X
	BNE AngryThwompWaitRTS

	
	LDA Objects_SpritesVerticallyOffScreen,X
	CMP #(SPRITE_0_VINVISIBLE | SPRITE_1_VINVISIBLE)
	BEQ AngryThwompWaitRTS

	JSR Object_XDistanceFromPlayer

	LDA <XDiff
	CMP #$40
	BCS AngryThwompWaitRTS

	INC Thwomp_Action, X
	LDA Objects_Frame, X
	EOR #$01
	STA Objects_Frame, X

	LDA #$00
	STA Thwomp_TilesDetected, X

AngryThwompWaitRTS:
	JMP Thwomp_Draw


Thwomp_FallToCeiling:
	INC Reverse_Gravity
	JSR Object_Move
	JSR Object_CalcBoundBox
	JSR Object_AttackOrDefeat

	INC Thwomp_Ticker, X
	LDA Thwomp_Ticker, X
	AND #$01
	TAY

	LDA Objects_BoundLeft, X
	ADD Thwomp_DetectXOffset, Y
	STA Tile_DetectionX

	LDA Objects_BoundLeftHi, X
	ADC #$00
	STA Tile_DetectionXHi

	LDA Objects_BoundTop, X
	STA Tile_DetectionY

	LDA Objects_BoundTopHi, X
	STA Tile_DetectionYHi

	JSR Object_DetectTile
	LDA Tile_LastProp
	CMP #TILE_PROP_SOLID_TOP
	BCC AngryThwomp_NoHit

	JSR Object_HitCeiling

	INC Thwomp_TilesDetected, X
	LDA Thwomp_TilesDetected, X
	CMP #$03
	BCS AngryThwomp_DetectCeil

	LDA #$E0
	STA <Objects_YVelZ, X

	LDA Tile_LastProp
	CMP #TILE_ITEM_COIN
	BCC AngryThwomp_NoBump

	JSR Object_DirectBumpBlocks

AngryThwomp_NoBump:
	JMP Thwomp_Draw

AngryThwomp_DetectCeil:
	LDA #$20
	STA Level_Vibration

	LDA #$30
	STA Objects_Timer, X

	LDA #SND_LEVELBABOOM
	STA Sound_QLevel1
	INC Thwomp_Action, X

AngryThwomp_NoHit:
	JMP Thwomp_Draw    