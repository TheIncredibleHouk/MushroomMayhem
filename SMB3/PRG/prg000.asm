
SpriteAttr .macro
	Sprite_RAMAttr + (4 * \1)
	.endm

SpriteTile .macro
	Sprite_RAMTile + (4 * \1)
	.endm

SpriteX .macro
	Sprite_RAMX + (4 * \1)
	.endm

SpriteY .macro
	Sprite_RAMY + (4 * \1)		
	.endm

Object_BoundBox:
	;    Left Right Top  Bot- offsets applied to sprite X/Y
	.byte  1,   6,   1,   15	; 8x16  BOUND8x16
	.byte  1,  14,   1,   16	; 16x16 BOUND16x16
	.byte  1,  14,   1,   23	; 16x24 BOUND16x24
	.byte  0,  16,   1,  16	;  ; solid block (16x16) BOUND16x16BLOCK
	.byte  0,  16,   0,  48	; BOUND16X48TALL
	.byte  2,  22,   2,  30	; BOUND24x32
	.byte  0,  32,  0,  16	; BOUND32x16BLOCK
	.byte  1,  14,   4,   26; 16x28 BOUND16x28
	.byte  2,  45,   0,  16	; 8 BOUND48x16
	.byte  0,  24,   0,  24	; 9 BOUND24X24
	.byte  1,  14,   1,  32	; A BOUND16x32 (16x32)
	.byte  1,  14,   1,  32	; A BOUND16x32TALL (16x32)
	.byte  1,  14,   1,  38	; C BOUND16x48
	.byte  4,  27,   2,  60	; E BOUND32x64
	.byte  4,  27,   2,  32	; E BOUND32x32
	.byte  2,  46,   2,  46	; F BOUND48x48

SpecialObject_FindEmpty:
	LDY #$05

SpecialObject_FindEmptyNext:
	LDA SpecialObj_ID,Y
	BEQ SpecialObject_FindEmptyFound

	DEY
	BPL SpecialObject_FindEmptyNext	

	CLC
	RTS

SpecialObject_FindEmptyFound:
	SEC
	RTS

	; Checks for and handles object touching conveyor belt, storing result into LRBounce_Vel
; $CF46


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_HitGround
;
; When object hits the ground, this aligns it properly to a tile
; 
; X = index of on-screen object
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $C515
Object_HitGround:
	LDA Objects_BoundBottom, X
	AND #$0F
	STA <Temp_Var1

	LDA <Objects_YZ,X
	SUB <Temp_Var1
	STA <Objects_YZ,X	 ; Align to tile and apply slope

	LDA <Objects_YHiZ, X
	SBC #$00
	STA <Objects_YHiZ, X

	LDA #$00
	STA <Objects_YVelZ, X	 ; Halt vertical movement
	STA Objects_YVelFrac, X	 

	RTS		 ; Return

Object_HitCeiling:

	LDA #$00
	STA <Objects_YVelZ,X	

Object_HitCeilingNoStop:
	LDA <Objects_YZ,X
	ADD #$0F
	AND #$f0
	STA <Objects_YZ,X	 ; Align to tile and apply slope

	LDA <Objects_YHiZ, X
	ADC #$00
	STA <Objects_YHiZ, X

	LDA <Objects_YZ,X
	SUB #$02
	STA <Objects_YZ,X
	
	LDA <Objects_YHiZ,X
	SBC #$00
	STA <Objects_YHiZ,X
	

Object_HitCeiling0:
	RTS
	; The only difference amongst the Object_WorldDetect[x] entries
	; are the input value, which specifies the limit that an object
	; should acknowledge a floor tile.  E.g., Object_DetectTiles
	; means the object will not detect a floor if it is more than
	; 4 pixels vertically down in to it.  "N1" (Negative one) is
	; thus basically to never use that limit because the object
	; can't be at a depth of "-1 pixels into the tile"

; $C54A
Object_DetectTilesForced:
	LDA <Objects_TilesDetectZ,X
	STA Objects_PreviousTilesDetect,X
	JMP Object_DetectTiles1

Object_DetectTiles:
	LDA <Objects_TilesDetectZ,X
	STA Objects_PreviousTilesDetect,X

	LDA Block_WasUpdated
	BNE Object_DetectTiles1

	LDA Objects_XYCS, X
	CMP Objects_XYCSPrev, X
	BNE Object_DetectTiles1
	RTS

Object_DetectTiles1:
PRG000_C559:

	LDA #$00
	STA <Objects_TilesDetectZ,X	; Clear Object's detection status

	JSR Object_GetTiles	 ; Fill in values for Object_VertTileProp/Quad and Object_HorzTileProp/Quad

	LDA Object_HorzTileProp, X	; A = detected tile index
	AND #$F0
	
	CMP #TILE_PROP_SOLID_ALL
	BEQ DetectedWall

	CMP #TILE_PROP_ITEM
	BNE PRG000_C584	 	


DetectedWall:
	; Object is touching solid wall tile

	LDA #$01		; A = 1

	LDY Objects_EffectiveXVel,X
	BPL PRG000_C580	 ; If object's X velocity >= 0 (still or moving rightward), jump to PRG000_C580

	; Negative X vel...
	ASL A		 	; A = 2

PRG000_C580:
	ORA <Objects_TilesDetectZ,X	; Set bit 0 or 1
	STA <Objects_TilesDetectZ,X	 ; Update Objects_TilesDetectZ

PRG000_C584:

	LDA <Objects_YVelZ,X
	BPL PRG000_C5A9	 	; If object's Y velocity >= 0 (still or moving downward), jump to PRG000_C5A9

PRG000_C59A:

	LDA Object_VertTileProp, X
	CMP #TILE_PROP_SOLID_ALL
	BCC PRG000_C5A8	 

PRG000_C5A2:
	; Flag ceiling impact
	LDA <Objects_TilesDetectZ,X
	ORA #$08
	STA <Objects_TilesDetectZ,X

PRG000_C5A8:
	RTS		 ; Return

PRG000_C5A9:

	; Object moving downwards (floor detection)
	LDA Object_VertTileProp, X
	AND #$F0
	CMP #TILE_PROP_SOLID_TOP
	BEQ PRG000_C5B4

	CMP #TILE_PROP_SOLID_ALL
	BCS PRG000_C5B4
	RTS

PRG000_C5B4:
	LDA Objects_BoundBottom, X
	AND #$0F
	CMP #$07
	BCS PRG000_C65C

	; Flag object as "hit ground"
	LDA <Objects_TilesDetectZ, X
	ORA #$04
	STA <Objects_TilesDetectZ, X

PRG000_C65C:
	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_GetTiles
;
; Gets tiles for an object based on its attribute settings and
; current state of movement.  Handles entering/leaving water.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Object_GetTiles:
	JSR Object_DetectTileCenter	; Get tile here

	STA Object_BodyTileProp, X
	TYA
	STA Object_BodyTileValue, X
	
	LDA Object_DisableWater
	BNE Object_GetRestTiles

	JSR Object_Check_Water

Object_GetRestTiles:
	LDA #$00
	STA Object_DisableWater

	LDA <Objects_YVelZ,X
	BMI PRG000_C713	 ; If object Y velocity is >= 0 (stopped or moving downward), jump to PRG000_C713

	JSR Object_DetectTileBottomEdge
	JMP PRG000_C714

PRG000_C713:
	JSR Object_DetectTileTopEdge	 ; Get tile

PRG000_C714: 
	; Store into tile index holders
	STA Object_VertTileProp, X
	TYA
	STA Object_VertTileValue, X

	LDA Objects_EffectiveXVel,X
	BMI PRG000_C797	 ; If object's X velocity < 0 (moving leftward), jump to PRG000_C797
	BNE Object_DoRightTile

	LDA Objects_Orientation, X
	AND #SPR_HFLIP
	BEQ PRG000_C797

Object_DoRightTile:	
	JSR Object_DetectTileRightEdge
	JMP PRG000_C798

PRG000_C797:
	JSR Object_DetectTileLeftEdge	 ; Get tile here

PRG000_C798:
	; Store into tile index holders
	STA Object_HorzTileProp, X
	TYA
	STA Object_HorzTileValue, X

	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_DetectTile
;
; Gets tile based on offset of object; the offset is set by the
; 'Y' register which indexes Object_TileDetectOffsets for the
; Y/X offset pair.  Seems kind of a limited way to go, but hey..
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $C7A9
Block_DetectX = Tile_DetectionX
Block_DetectXHi = Tile_DetectionXHi
Block_DetectY = Tile_DetectionY
Block_DetectYHi = Tile_DetectionYHi

Object_DetectTileCenter:
	LDA Objects_BoundRight, X
	SUB Objects_BoundLeft, X
	LSR A
	STA <Temp_Var1

	LDA Objects_BoundLeft, X
	ADD <Temp_Var1
	STA Tile_DetectionX
	STA Tile_CenterDetectionX

	LDA Objects_BoundLeftHi, X
	ADC #$00
	STA Tile_DetectionXHi
	STA Tile_CenterDetectionXHi

	LDA Objects_BoundBottom, X
	SUB Objects_BoundTop, X
	LSR A
	STA <Temp_Var1

	LDA Objects_BoundTop, X
	ADD <Temp_Var1
	STA Tile_DetectionY
	STA Tile_CenterDetectionY

	LDA Objects_BoundTopHi, X
	ADC #$00
	STA Tile_DetectionYHi
	STA Tile_CenterDetectionYHi
	JMP Object_DetectTile

Object_DetectTileRightEdge:
	LDA Objects_BoundRight, X
	STA Tile_DetectionX

	LDA Objects_BoundRightHi, X
	STA Tile_DetectionXHi

	LDA Objects_BoundBottom, X
	SUB Objects_BoundTop, X
	LSR A
	STA <Temp_Var1

	LDA Objects_BoundTop, X
	ADD <Temp_Var1
	STA Tile_DetectionY

	LDA Objects_BoundTopHi, X
	ADC #$00
	STA Tile_DetectionYHi
	JMP Object_DetectTile

Object_DetectTileLeftEdge:
	LDA Objects_BoundLeft, X
	STA Tile_DetectionX

	LDA Objects_BoundLeftHi, X
	STA Tile_DetectionXHi

	LDA Objects_BoundBottom, X
	SUB Objects_BoundTop, X
	LSR A
	STA <Temp_Var1

	LDA Objects_BoundTop, X
	ADD <Temp_Var1
	STA Tile_DetectionY

	LDA Objects_BoundTopHi, X
	ADC #$00
	STA Tile_DetectionYHi
	JMP Object_DetectTile

Object_DetectTileTopEdge:
	LDA Objects_BoundTop, X
	STA Tile_DetectionY

	LDA Objects_BoundTopHi, X
	STA Tile_DetectionYHi

	LDA Objects_BoundRight, X
	SUB Objects_BoundLeft, X
	LSR A
	ADD Objects_BoundLeft, X
	STA Tile_DetectionX

	LDA Objects_BoundLeftHi, X
	ADC #$00
	STA Tile_DetectionXHi
	JMP Object_DetectTile


Object_DetectTileBottomEdge:
	LDA Objects_BoundBottom, X
	STA Tile_DetectionY

	LDA Objects_BoundBottomHi, X
	STA Tile_DetectionYHi

	LDA Objects_BoundRight, X
	SUB Objects_BoundLeft, X
	LSR A
	ADD Objects_BoundLeft, X
	STA Tile_DetectionX

	LDA Objects_BoundLeftHi, X
	ADC #$00
	STA Tile_DetectionXHi
	JMP Object_DetectTile

Object_DetectTileAhead:
	STA <Temp_Var1
	LDA <Objects_XVelZ, X
	BPL TileAhead1

	LDA Objects_BoundLeft, X
	SUB <Temp_Var1
	STA Tile_DetectionX

	LDA Objects_BoundLeftHi, X
	SBC #$00
	STA Tile_DetectionXHi
	JMP TileAhead2

TileAhead1:
	LDA Objects_BoundRight, X
	ADD <Temp_Var1
	STA Tile_DetectionX

	LDA Objects_BoundRightHi, X
	ADC #$00
	STA Tile_DetectionXHi

TileAhead2:
	LDA Objects_BoundTop, X
	STA Tile_DetectionY

	LDA Objects_BoundTopHi, X
	STA Tile_DetectionYHi
	JMP Object_DetectTile

Object_DetectTile:
	LDA Tile_DetectionYHi
	BEQ TileYFine
	BPL CheckTileLow

TileTooHigh:
	LDA #$00
	STA Tile_DetectionY
	STA Tile_DetectionYHi
	BEQ TileYFine

CheckTileLow:
	CMP #$01
	BCC TileYFine

	LDA Tile_DetectionY
	CMP #$B0
	BCC TileYFine

	LDA #$A0
	STA Tile_DetectionY


TileYFine:
	LDA Tile_DetectionYHi 	; -> Tile_DetectionYHi (high)
	AND #$01
	STA <Temp_Var3	 ; Temp_Var3 = 0 or 1, depending if Y lo is on odd line or not

	LDA Tile_DetectionY
	AND #$F0
	STA Tile_DetectionY

	LDA Tile_DetectionXHi
	BPL TileXFine

	LDA #$00
	STA Tile_DetectionXHi

	LDA #$00
	STA Tile_DetectionX

TileXFine:
	LDA Tile_DetectionX
	AND #$F0
	STA Tile_DetectionX

	LDA Tile_DetectionXHi
	ASL A		 ; Change high part into 2 byte index to select the screen
	TAY		 ; -> 'Y'

	; Calculate Temp_Var2/1 (tile address)
	LDA Tile_Mem_Addr,Y
	STA <Temp_Var1

	LDA Tile_Mem_Addr+1,Y
	ADC <Temp_Var3	
	STA <Temp_Var2	

	; Calculate tile offset within screen
	LDA Tile_DetectionX
	LSR A	
	LSR A	
	LSR A	
	LSR A	
	ORA Tile_DetectionY

	TAY		 	; -> 'Y'

PRG000_C82A:
	LDA [Temp_Var1],Y	; Get tile
	JSR PSwitch_SubstTileAndAttr	 ; Substitute tile if P-Switch is active
	TAY
	LDA TileProperties, Y
	STA Tile_LastProp
	STY Tile_LastValue
	RTS	 ; Jump to PRG000_C834

PRG000_C832:
	LDA #$00	; No tile detected
	STA Tile_LastValue	; Store tile index detected
	STA Tile_LastProp

PRG000_C834:

	RTS		 ; Return

	; When Object hits water, splash!
Object_WaterSplash:
	LDA #$00
	STA Splash_IsOil

Object_WaterSplashNorm:
	LDA <Objects_YVelZ, X
	STA <Temp_Var2

	LDX #$05

FindSplash:
	LDA Objects_State, X
	BEQ MakeSplash

	INX
	CPX #$08
	BNE FindSplash

	LDX <CurrentObjectIndexZ
	RTS

Splash_Vel:
	.byte $80, $00

Splash_Offsets:
	.byte $00, $F0
	.byte $FA, $0A

Splash_OffsetsHi:
	.byte $00, $FF
	.byte $FF, $00	

Splash_Orientations:
	.byte $00, $00
	.byte SPR_VFLIP, SPR_VFLIP	

MakeSplash:
	STY <Temp_Var1

	LDA <Temp_Var2
	AND #$80
	CMP Splash_Vel, Y
	BEQ SetSplash

	INY
	INY 

SetSplash:	
	LDA Tile_DetectionX
	STA <Objects_XZ, X

	LDA Tile_DetectionXHi
	STA <Objects_XHiZ, X

	LDA Tile_DetectionY
	ADD Splash_Offsets, Y
	STA <Objects_YZ, X

	LDA Tile_DetectionYHi
	ADC Splash_OffsetsHi, Y
	STA <Objects_YHiZ, X

	LDA #OBJ_WATERSPLASH
	STA Objects_ID, X

	LDA #OBJSTATE_FRESH
	STA Objects_State, X 
	
	LDA #$0F
	STA Objects_Timer, X

	LDA Splash_IsOil
	STA WaterSplash_IsOil, X

	LDA Splash_Orientations, Y
	STA Objects_Orientation, X

	LDX <CurrentObjectIndexZ
	LDY <Temp_Var1
	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Objects_HandleScrollAndUpdate
;
; THE function which spawns objects as they appear on screen and 
; calls updates on all objects based on their state etc.  Also
; updates the timers.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Objects_HandleScrollAndUpdate:
;	INC Save_Ram_Boundary_Start
;	INC Save_Ram_Boundary_End
	JSR Objects_AssignSprites
	JSR Objects_ResetDetects

	; Set page @ A000 to 5
	LDA #19
	STA PAGE_A000
	JSR PRGROM_Change_A000

	JSR LevelEvent_Do 		; Perform event as set by Level_Event
	JSR Player_CalcBoundBox
	JSR Level_SpawnObjects	; Handle if Player bounced off block and spawn new objects as screen scrolls

PRG000_C973:
	LDA #$00
	STA <CurrentObjectIndexZ
	STA Player_OnObject
	STA Object_Count

PRG000_C975:
	LDX <CurrentObjectIndexZ	 ; Backup current object index -> CurrentObjectIndexZ

	LDA <Player_HaltGameZ
	BNE PRG000_C9B6	 ; If gameplay is halted, jump to PRG000_C9B6


	LDA Objects_State, X
	BEQ PRG000_C9D2

	LDA Stop_Watch
	BNE PRG000_C9B6

	LDA Objects_Timer,X
	BEQ PRG000_C983	 ; If this timer is already at zero, jump to PRG000_C983

	DEC Objects_Timer,X	 ; Otherwise, decrement it

PRG000_C983:

	LDA Objects_Timer2,X
	BEQ PRG000_C98B	 ; If this timer is already at zero, jump to PRG000_C98B

	DEC Objects_Timer2,X	; Otherwise, decrement it

PRG000_C98B:

	CPX #$05
	BGE PRG000_C9B6	 ; If object slot index >= 5, jump to PRG000_C9B6

	; Non-special objects in slots 0 to 4...
	INC Object_Count

	LDA Explosion_Timer, X
	BEQ DoNot_Explode

	CMP #$40
	BNE NoExplosion_Colors

	LDA #$40
	STA Objects_ColorCycle,X

NoExplosion_Colors:

	DEC Explosion_Timer, X
	BNE DoNot_Explode

	JSR Object_Explode

DoNot_Explode:

	LDA Objects_Timer4,X
	BEQ PRG000_C996	 ; If this timer is already at zero, jump to PRG000_C997

	DEC Objects_Timer4,X	; Otherwise, decrement it

PRG000_C996:
	LDA Objects_SlowTimer,X
	BEQ PRG000_C997	 ; If this timer is already at zero, jump to PRG000_C997

	LDA <Counter_1
	AND #$01
	BEQ PRG000_C997
	DEC Objects_SlowTimer,X	; Otherwise, decrement it

PRG000_C997:
	LDA Objects_Timer3,X
	BEQ PRG000_C9B6	 ; If timer is zero, jump to PRG000_C9B6

	CMP #$60	 
	BLT PRG000_C9B3	 ; If timer value is < $60, jump to PRG000_C9B3

	LDA #$01	 ; A = 1

	LDY Objects_State,X
	CPY #OBJSTATE_NORMAL
	BEQ PRG000_C9B3	 ; If object's state is Normal, jump to PRG000_C9B3

	CPY #$04	 
	BNE PRG000_C9AF	 ; If object's state is NOT 4 (being held), jump to PRG000_C9AF

	; Object being held...

	LDA #$03	 ; A = 3
PRG000_C9AF:
	AND <Counter_1
	BNE PRG000_C9B6	 ; Every A:A+1 ticks, jump to PRG000_C9B6

PRG000_C9B3:
	DEC Objects_Timer3,X	 ; Every 4 ticks, decrement Objects_Timer3

PRG000_C9B6:
	JSR Object_DoStateAction 	; Do whatever's required by this object by its current state
	LDX <CurrentObjectIndexZ

	LDA Objects_State,X
	BNE PRG000_C9D2	 ; If object's state is not 0 (dead/empty), jump to PRG000_C9D2

	; Remove object's associated spawn index
	LDA #$ff
	STA Objects_SpawnIdx,X

PRG000_C9D2:
	INC <CurrentObjectIndexZ
	LDA <CurrentObjectIndexZ
	CMP #$08
	BEQ PRG000_C9E5
	JMP PRG000_C975	 ; While X >= 0, loop!

PRG000_C9E5:
	LDA Level_JctCtl
	BEQ PRG000_CA40	 ; If no level junction is occurring, jump to PRG000_CA40

	STA LevelPartialInit	; Flag that we need a level partial initialization

PRG000_CA40:
	RTS		 ; Return

	; Breaks up every 36 object IDs to make smaller jump tables
ObjectID_BaseVals:
	.byte 00, 20, 40, 60, 80, 100, 120, 140, 160

ObjectID_CodeBank:
	.byte 01, 02, 03, 04, 05, 14, 15, 16, 17

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_DoStateAction
;
; Do whatever is required by the current Objects_State value
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Object_DoStateAction:
	LDA Objects_State,X
	BEQ PRG000_CA40	 ; If this object is "dead/empty", jump to PRG000_CA40

	LDY #$08	 ; Y = 4

	; Try to locate the group that this object ID belongs to
	; Groups are defined by ObjectID_BaseVals, every 36 values.
PRG000_CA51:
	LDA Objects_ID,X	; Get object ID
	CMP ObjectID_BaseVals,Y	; Compare to this base value
	BGE PRG000_CA5C	 ; If this object ID >= the base value, jump to PRG000_CA5C

	; Object ID is smaller, thus not this group...

	DEY		 ; Y--
	BNE PRG000_CA51	 ; If Y > 0, loop!

PRG000_CA5C:
	SUB ObjectID_BaseVals,Y ; Subtract next group's ID to make this object's ID relative to group

	STA ObjGroupRel_Idx ; Set ObjGroupRel_Idx to this group-relative index value

	LDA ObjectID_CodeBank, Y
	STA PAGE_A000	 ; Set new page

	LDY ObjGroupRel_Idx		; Object group-relative index -> 'Y'
		 

	JSR PRGROM_Change_A000	 ; Set page @ A000 to appropriate object page...

	; Object's can request a particular pattern set to be available to them.
	; They may set either the fifth or sixth bank of CHRROM, which is specified
	; by bit 7.  
	LDX #$00
	
	LDA ObjectGroup_PatTableSel,Y	 ; Load CHRROM bank request for this object, if any
	BEQ PRG000_CA7F	 ; If CHRROM bank request is zero, no change, jump to PRG000_CA7F
	BPL PRG000_CA7A	 ; If CHRROM bank request does not have bit 7 set, jump to PRG000_CA7A
	INX		 ; Otherwise, X = 1 (sixth CHRROM bank)

PRG000_CA7A:
	AND #$7f	 ; Bit 7 is used to specify which bank, so filter it here
	STA PatTable_BankSel+4,X	 ; Store pattern bank
	STX LastPatTab_Sel

PRG000_CA7F:
	LDX <CurrentObjectIndexZ		 ; Restore X as the object slot index

PRG000_CA81:
	JSR Object_DetermineVerticallyOffScreen	; Set flags based on which sprites of this object are vertically visible
	JSR Object_DetermineHorizontallyOffScreen	; Set flags based on which sprites of this object are horizontally visible
	JSR Object_CalcSpriteXY_NoHi

	LDA Objects_State,X	 ; Get object state...
	BEQ PRG000_CA82


PRG000_CA82:
	JSR DynJump

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word ObjState_DeadEmpty	; 0 - Dead/Empty
	.word ObjState_Initializing	; 1 - Initializing
	.word ObjState_Normal		; 2 - Normal operation
	.word ObjState_Shelled		; 3 - Shelled
	.word ObjState_Kicked		; 4 - Kicked
	.word ObjState_Killed		; 5 - Killed 
	.word ObjState_Fresh		; 6
	.word ObjState_DeadEmpty	; 7
	.word ObjState_Frozen		; 8
	.word ObjState_Frozen		; 9
	.word ObjState_Killed		; 10
	
	
ObjState_Frozen:
	LDA #(ATTR_WINDAFFECTS  | ATTR_CARRYANDBUMP | ATTR_BUMPNOKILL)
	STA Objects_BehaviorAttr, X

	LDA #(ATTR_ICEPROOF)
	STA Objects_WeaponAttr, X

	LDA Objects_State, X
	CMP #OBJSTATE_FROZENSOLID
	BEQ Frozen_CheckHalt

	LDA Player_EffectiveSuit
	CMP #MARIO_ICE
	BNE Frozen_Die

Frozen_CheckHalt:
	LDA <Player_HaltGameZ
	BEQ Frozen_Normal

	JMP Frozen_Draw

Frozen_Normal:
	JSR Object_DeleteOffScreen
	JSR Object_Move
	JSR Object_CalcBoundBoxForced

	LDA Objects_State, X
	CMP #OBJSTATE_FROZENSOLID
	BEQ Frozen_Hold

	LDA Objects_Timer, X
	BNE Frozen_Hold

	JMP Frozen_Die

Frozen_Hold:
	LDA Objects_XVelZ, X
	ORA Objects_BeingHeld, X
	BEQ Frozen_NotKilledOthers
	
	JSR Shell_KillOthers
	BCC Frozen_NotKilledOthers

	JMP Frozen_Die

Frozen_NotKilledOthers:
	JSR Object_DetectTiles
	JSR Object_CheckForeground

	JSR Object_DetectPlayer
	BCC Frozen_DetectTiles

	LDA Objects_BeingHeld, X
	BNE Frozen_Carry

Frozen_PlayerStand:
	JSR ObjHit_SolidStand
 	BCC Frozen_Carry

	LDA Objects_XVelZ, X
	STA Player_CarryXVel
	JMP Frozen_DetectTiles

Frozen_Carry:
	JSR Object_Hold	
	BCS Frozen_DoDraw

	JSR Object_GetKicked

Frozen_DetectTiles
	LDA Objects_FrozenKicked, X
	BNE Frozen_NotDampen

	JSR Object_DampenVelocity

Frozen_NotDampen:
	LDA Objects_FrozenKicked, X
	BEQ Frozen_InteractTiles

	LDA <Objects_TilesDetectZ, X
	AND #(HIT_LEFTWALL | HIT_RIGHTWALL | HITTEST_TOP)
	BEQ Frozen_InteractTiles
	
	JSR Object_TestTopBumpBlocks
	JSR Object_TestSideBumpBlocks
	
	JMP Frozen_Die

Frozen_InteractTiles:
	JSR Object_InteractWithTiles

Frozen_DoDraw:
	JMP Frozen_Draw
	
Frozen_Die:
	JSR Object_EarnExp
	JMP Object_BurstIce

Frozen_Draw:
	LDA <Player_HaltGameZ
	PHA
	
	LDA #$01
	STA <Player_HaltGameZ


	;LDA Objects_Kicked, X
	;BEQ Frozen_NotKicked
	
	;LDY #$00
	;JSR Kicked_DrawNoAnimate
	;JMP Frozen_DrawNormal

; Frozen_NotKicked:
	LDA Objects_Shelled, X
	BEQ Frozen_NotShelled

	JSR Object_DrawShelled
	JMP Frozen_DrawNormal

Frozen_NotShelled:
	LDA Objects_Kicked, X
	BEQ Frozen_NotKicked

	LDY #$00
	JSR Kicked_DrawNoAnimate
	JMP Frozen_DrawNormal

Frozen_NotKicked:
	JSR ObjState_Normal

Frozen_DrawNormal:	
	PLA
	STA <Player_HaltGameZ

	LDX <CurrentObjectIndexZ
	
	LDA Objects_SpritesRequested, X
	STA <Temp_Var1
	DEC <Temp_Var1
	
	LDA #$00
	STA <Temp_Var2

	LDA Objects_State, X
	CMP #OBJSTATE_FROZENSOLID
	BNE Frozen_ClearPal

	LDA #SPR_PAL2
	STA <Temp_Var2

Frozen_ClearPal:
	LDA <Temp_Var1
	ASL A
	ASL A
	ADD Object_SpriteRAMOffset, X
	TAY

	LDA Sprite_RAMAttr, Y
	AND #~SPR_PAL3
	ORA <Temp_Var2
	STA Sprite_RAMAttr, Y

	DEC <Temp_Var1
	BPL Frozen_ClearPal
	RTS
	; In units of $10 ticks by timer 3...
PRG000_CAF1:
	.byte %00000010, %00000010, %00000100, %00001000, %00010000, %00010000

	; Some objects have "feet" when they are waking up, 
	; this offsets their Y depending on whether v-flipped
ObjWakeUp_FeetYOff:	.byte 10, -10

Object_DampenVelocity:
	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ Object_DampenVelocityRTS

	LDA <Objects_YVelZ,X 
	CMP #$0F
	BCC Object_DampenStop

	JSR Half_Value
	JSR Negate
	PHA

	JSR Object_HitGround

	PLA 
	STA <Objects_YVelZ,X 

	LDA <Objects_TilesDetectZ, X
	AND #~HIT_GROUND
	STA <Objects_TilesDetectZ, X
	
	LDA <Objects_XVelZ,X 
	JSR Half_Value
	STA <Objects_XVelZ,X 
	RTS

Object_DampenStop:
	LDA #$00
	STA <Objects_XVelZ,X 

Object_DampenVelocityRTS:
	RTS


	; Called for an object in state 3 to do its "shelled" routine
ObjState_Shelled:
	LDA <Player_HaltGameZ	 
	BNE ObjState_Shelled3	 ; If gameplay is halted, jump to PRG000_CB5B

	INC Objects_Shelled, X

	JSR Object_DeleteOffScreen
	JSR Object_Move
	JSR Object_CalcBoundBox	
	JSR Object_RespondToTailAttack
	JSR Object_InteractWithPlayer

	PHP
	JSR Object_DetectTiles
	PLP

	BCC ObjState_Shelled1

	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BEQ ObjState_Shelled3

	CMP #OBJSTATE_SHELLED
	BNE ObjState_Shelled0

	LDA Objects_BeingHeld, X
	BNE ObjState_Shelled0

	JMP Object_GetKicked

ObjState_Shelled0:
	
	JSR Object_CheckForeground
	JSR Object_CalcBoundBoxForced
	JSR Shell_KillOthers
	BCC ObjState_Shelled2

	LDA #$FF
	STA Objects_Health, X

	LDA #$00
	STA Objects_BeingHeld, X

	JSR Object_GetKilled

	JMP Object_DrawShelled

ObjState_Shelled1:
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BEQ ObjState_Shelled3

	JSR Object_InteractWithObjects
	BCS ObjState_Shelled2

	JSR Object_DampenVelocity
	JSR Object_TestTopBumpBlocks
	JSR Object_InteractWithTiles

ObjState_Shelled2:
	
	JSR Object_ShellDoWakeUp	 

ObjState_Shelled3:
	JMP Object_DrawShelled


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_DrawShelled
;
; Draw object in "shelled" state
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $CB61

Object_SetShakeAwakeTimer:

	; Set timer for object to wake up from

	LDA Objects_Timer3,X
	CMP #$60	 
	BGE PRG000_CB7A	 ; If timer 3 >= $60, jump to PRG000_CB7A

	AND #$07
	STA Objects_Timer4,X	; Timer 4 = 0-7, based on timer3

PRG000_CB7A:
	RTS		 ; Return

Object_DrawShelled:
	; Set object frame to 2
	LDA #$02	 
	STA Objects_Frame,X
	JSR Object_DrawMirrored	 ; Draw mirrored sprit
	JSR Object_SetShakeAwakeTimer	 ; Set the "shake awake" timers
	JSR Object_Vibrate

PRG000_CBB3:
	RTS		 ; Return


Object_Vibrate:
	LDA Objects_Timer3,X
	CMP #$50
	BGE PRG000_CC23	 ; If timer 3 >= $50, jump to PRG000_CC23

	LSR A
	LSR A
	LSR A
	LSR A
	TAY		 ; Y = index into PRG000_CAF1 (proper bit mask for shaking speed)

	; Various speed shake by timer 3
	LDA Objects_Timer3,X
	AND PRG000_CAF1,Y
	BEQ PRG000_CC23	 ; If not shaking on this bit, jump to PRG000_CC23

	LDA #$01	 ; A = 1 (object not vertically flipped)

	LDY Objects_Orientation,X	 
	BMI PRG000_CBD4	 ; If object is vertically flipped, jump to PRG000_CBD4

	LSR A		 ; A = 0 (object vertically flipped)

PRG000_CBD4:
	LDY Object_SpriteRAMOffset,X	 ; Y = object's Sprite_RAM offset

	TAX		 ; X = 0 or 1 (proper Y offset for foot)

	; One foot
	LDA Sprite_RAM+$00,Y
	CMP #$f8
	BEQ PRG000_CBEA	 ; If sprite Y = $F8, jump to PRG000_CBEA

	ADD ObjWakeUp_FeetYOff,X ; Add the foot offset
	CMP #$c5
	BGE PRG000_CBF8	 ; If the offset >= $C5, jump to PRG000_CBF8

	STA Sprite_RAM+$08,Y	 ; Foot Y

PRG000_CBEA:

	; Other foot
	LDA Sprite_RAM+$04,Y
	CMP #$f8
	BEQ PRG000_CBF8	 ; If sprite Y = $F8, jump to PRG000_CBF8

	ADD ObjWakeUp_FeetYOff,X ; Add the foot offset
	STA Sprite_RAM+$0C,Y	 ; Other foot Y

PRG000_CBF8:

	; Foot Xs
	LDA Sprite_RAM+$03,Y
	SUB #$03
	STA Sprite_RAM+$0B,Y

	LDA Sprite_RAM+$07,Y
	ADD #$03
	STA Sprite_RAM+$0F,Y

	; Foot attributes
	LDA Sprite_RAM+$02,Y
	AND #$80
	ORA #$03
	STA Sprite_RAM+$0A,Y

	; Flip the other foot
	ORA #$40
	STA Sprite_RAM+$0E,Y

	; Feet pattern
	LDA #$f9
	STA Sprite_RAM+$09,Y
	STA Sprite_RAM+$0D,Y

	LDX <CurrentObjectIndexZ ; Restore 'X' as object index

PRG000_CC23:
	RTS		 ; Return

ObjState_Kicked:
	LDA <Player_HaltGameZ 
	BEQ ObjState_Kicked1	 ; If gameplay is NOT halted, jump to PRG000_CC75
 
	JMP DrawKickedShell	 ; Jump to PRG000_CD46 

ObjState_Kicked1:
	INC Objects_Kicked, X

	JSR Object_DeleteOffScreen
	JSR Object_Move
	JSR Object_CalcBoundBox	
	JSR Object_AttackOrDefeat
	JSR Shell_KillOthers
	BCC ObjState_Kicked2

	LDA <Kill_WasKicked
	BEQ ObjState_Kicked2

	LDA #$FF
	STA Objects_Health, X

	LDA #$00
	STA Objects_BeingHeld, X

	JSR Object_GetKilled

	JMP Object_DrawShelled

ObjState_Kicked2:
	JSR Object_DetectTiles
	JSR Object_TestTopBumpBlocks
	JSR Object_TestSideBumpBlocks
	BCS DrawKickedShell

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BNE Kicked_NotCliff

	LDA Objects_PreviousTilesDetect, X
	AND #HIT_GROUND
	BEQ Kicked_NotCliff

	LDA #$14
	STA <Objects_YVelZ, X

Kicked_NotCliff:

	JSR Object_InteractWithTiles

Kicked_NotAir:
	LDA <Objects_TilesDetectZ, X
	AND #(HIT_CEILING | HIT_LEFTWALL | HIT_RIGHTWALL)
	BEQ DrawKickedShell

	LDA Sound_QPlayer
	ORA #SND_PLAYERBUMP
	STA Sound_QPlayer
	
DrawKickedShell:
	LDA Game_Counter
	LSR A	
	AND #$03
	TAY		 ; Y = 0 to 3, by counter

Kicked_DrawNoAnimate:
	LDA Objects_Orientation,X
	AND #~SPR_HFLIP
	ORA ObjShell_AnimFlipBits,Y	 
	STA Objects_Orientation,X	 ; Apply flip as appropriate

	; Set animation frame as appropriate
	LDA ObjShell_AnimFrame,Y
	STA Objects_Frame,X

	LDA Objects_Frame,X
	TYA
	AND #$01
	BNE DrawKickedShell1	 ; Every other tick, jump to PRG000_CD74

	JMP Object_DrawMirrored	; Draw sprite and don't come back

DrawKickedShell1:
	JMP Object_Draw ; Update sprite data, draw sprite, and don't come back


Kill_TypeCheck = Temp_Var16
Kill_WasKicked = Temp_Var15

Shell_KillOthers:
	LDA #ATTR_SHELLPROOF
	STA <Kill_TypeCheck
	BNE Object_KillOthers

Explosion_KillOthers:
	LDA #ATTR_EXPLOSIONPROOF
	STA <Kill_TypeCheck

Object_KillOthers:
	LDA #$00
	STA <Kill_WasKicked

	LDY #$04

Object_KillOthers1:
	CPY <CurrentObjectIndexZ
	BEQ Object_KillOthers2

	LDA Objects_State, Y
	BEQ Object_KillOthers2

	CMP #OBJSTATE_KILLED
	BEQ Object_KillOthers2
	
	CMP #OBJSTATE_KICKED
	BNE Kill_NotKicked

	INC <Kill_WasKicked

Kill_NotKicked:
	LDA Objects_BehaviorAttr, Y
	AND <Kill_TypeCheck
	BNE Object_KillOthers2

	LDX <CurrentObjectIndexZ
	JSR Object_DetectObjects
	BCC Object_KillOthers2


Kill_Normal:	
	TYA
	TAX

	LDA #$FF
	STA Objects_Health, X

	LDA <Kill_TypeCheck
	STA Objects_PlayerProjHit, X

	JSR Object_KickSound
	JSR Object_GetKilled

Object_KillOthers3:
	TXA
	TAY

	LDX <CurrentObjectIndexZ
	SEC
	RTS

Object_KillOthers2:
	DEY
	BPL Object_KillOthers1

	CLC

	TXA
	TAY
	LDX <CurrentObjectIndexZ
	RTS	
	
	; Kicked shell object animation frames and flips
ObjShell_AnimFlipBits:	.byte $00, $00, $00, $40
ObjShell_AnimFrame:	.byte $04, $06, $05, $06

	; Copies all brick bust data over to the second bust slots
	; (So up to 2 bricks may be scattering debris at once)
BrickBust_MoveOver:
	LDA BrickBust_En
	STA BrickBust_En+1

	LDA Brick_DebrisYHi
	STA Brick_DebrisYHi+1

	LDA Brick_DebrisY
	STA Brick_DebrisY+1

	LDA Brick_DebrisX
	STA Brick_DebrisX+1

	LDA BrickBust_YVel
	STA BrickBust_YVel+1
	
	LDA Brick_DebrisXDist
	STA Brick_DebrisXDist+1

	LDA BrickBust_HEn
	STA BrickBust_HEn+1
	
	LDA BrickBust_Pal
	STA BrickBust_Pal+1

	LDA BrickBust_Tile
	STA BrickBust_Tile+1

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_BumpBlocks
;
; Provides an arbitrary object with the ability to hit objects
; with its "head"; used by Boom Boom, though Boom Boom never 
; gets a chance to employ that in the game...
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $CDD2
Object_TopBumpBlocks:
	LDA Object_VertTileValue, X
	STA Tile_LastValue

	LDA Object_VertTileProp, X
	STA Tile_LastProp

	; Transfer tile detection 
	LDA Objects_BoundTop, X
	AND #$F0
	STA <Temp_Var14	

	LDA Objects_BoundTopHi, X
	STA <Temp_Var13	

	LDA Objects_BoundRight, X
	SUB Objects_BoundLeft, X
	LSR A
	ADD Objects_BoundLeft, X
	AND #$F0
	STA <Temp_Var16	

	LDA Objects_BoundLeftHi, X
	ADC #$00
	STA <Temp_Var15	

	JMP Object_BumpBlocks

Object_BottomBumpBlocks:
	LDA Object_VertTileValue, X
	STA Tile_LastValue

	LDA Object_VertTileProp, X
	STA Tile_LastProp

	; Transfer tile detection 
	LDA Objects_BoundBottom, X
	STA <Temp_Var14	

	LDA Objects_BoundBottomHi, X
	STA <Temp_Var13	

	LDA Objects_BoundRight, X
	SUB Objects_BoundLeft, X
	LSR A
	ADD Objects_BoundLeft, X
	AND #$F0
	STA <Temp_Var16	

	LDA Objects_BoundRightHi, X
	ADC #$00
	STA <Temp_Var15	

	JMP Object_BumpBlocks

Object_DirectBumpBlocks:
	; Transfer tile detection 
	LDA Tile_DetectionY
	STA <Temp_Var14	

	LDA Tile_DetectionYHi
	STA <Temp_Var13	

	LDA Tile_DetectionX
	STA <Temp_Var16	

	LDA Tile_DetectionXHi
	STA <Temp_Var15	
	JMP Object_BumpBlocks

Object_SideBumpBlocks:
	LDA Object_HorzTileValue, X
	STA Tile_LastValue

	LDA Object_HorzTileProp, X
	STA Tile_LastProp

	; Transfer tile detection 
	LDA Objects_BoundBottom, X
	SUB Objects_BoundTop, X
	LSR A
	ADD Objects_BoundTop, X
	AND #$F0
	STA <Temp_Var14	

	LDA Objects_BoundTopHi, X
	ADC #$00
	STA <Temp_Var13	

	LDA <Objects_XVelZ, X
	BMI Object_SideBumpBlocks1

	LDA Objects_BoundRight, X
	AND #$F0
	STA <Temp_Var16	

	LDA Objects_BoundRightHi, X
	STA <Temp_Var15	
	JMP Object_BumpBlocks

Object_SideBumpBlocks1:
	LDA Objects_BoundLeft, X
	AND #$F0
	STA <Temp_Var16	

	LDA Objects_BoundLeftHi, X
	STA <Temp_Var15	

Object_BumpBlocks:
	; Backup current PAGE_A000 bank
	LDA PAGE_A000
	PHA	

	; Change page @ A000 to 8
	LDA #$08
	STA PAGE_A000
	JSR PRGROM_Change_A000

	INC ObjectBump

	LDA Tile_LastProp
	STA Bump_Prop

	LDA Tile_LastValue
	STA Bump_Value

	JSR Tiles_BumpBlocks

	LDX <CurrentObjectIndexZ	; X = object slot index

	; Restore page @ A000 to previous page
	PLA
	STA PAGE_A000
	JSR PRGROM_Change_A000

	RTS		 ; Return


	; X velocities depending on kick direction, added to by half of Player's X velocit
	; X velocities depending on kick direction
	; Different X and X Hi offsets applied to object being held by Player
	; Changes whether not doing anything special, in pipe, etc.
ObjectHoldXOff:		.byte $0B, -$0B, $04, -$04, $04, $0B, -$13, $04, -$08, $04, $00
ObjectHoldXHiOff:	.byte $00,  $FF, $00,  $FF, $00, $00,  $FF, $00,  $FF, $00, $00

Object_DropXOffset:
	.byte $03, $FD, $00, $FF

Object_GetKicked:
	LDA #$10
	STA Objects_Timer2, X
	STA Objects_Kicked, X

	LDA <Pad_Holding
	AND #PAD_DOWN
	BEQ Object_WillGetKicked

	LDA #$00
	STA <Objects_YVelZ, X
	STA Objects_BeingHeld, X

	LDY #$00
	LDA <Player_FlipBits
	BNE Object_DropRight

	INY

Object_DropRight:
	LDA <Objects_XZ, X
	ADD Object_DropXOffset, Y
	STA <Objects_XZ, X

	LDA <Objects_XHiZ, X
	ADC Object_DropXOffset + 2, Y
	STA <Objects_XHiZ, X
	RTS

Object_WillGetKicked:

	JSR Object_KickSound

	; Have Player do kick frame
	LDA #$0c
	STA Player_Kick

Object_GetKicked1:
	LDA #$F0
	STA <Objects_YVelZ,X

	LDA #$00
	STA Objects_BeingHeld, X

	LDA <Pad_Holding
	AND #PAD_UP
	BEQ Object_SetKickedState

	LDA #$B0
	STA <Objects_YVelZ,X

	LDA <Player_XVelZ
	BEQ Object_NotKickState

Object_SetKickedState:
	INC Objects_FrozenKicked, X
	
	LDA Objects_State, X
	CMP #OBJSTATE_SHELLED
	BNE Object_NotKickState

	LDA #OBJSTATE_KICKED
	STA Objects_State, X

Object_NotKickState:

	LDA <Pad_Holding
	AND #PAD_UP
	BEQ Kicked_FindXVel

	LDA <Player_XVelZ
	BEQ Kicked_SetUpXVel

	LDA <Player_XVelZ
	CMP #$30
	BCC Kicked_CalcXVel

	CMP #$D0
	BCC Kicked_FindXVel

Kicked_CalcXVel:
	LDY Player_FlipBits
	BNE Kicked_UpXVelAdd

	SUB #$04
	BNE Kicked_SetUpXVel

Kicked_UpXVelAdd:
	ADD #$04

Kicked_SetUpXVel:
	STA <Objects_XVelZ, X
	RTS

Kicked_FindXVel:
	LDA #$30

	LDY Player_FlipBits
	BNE Kicked_DownXVel

	EOR #$FF
	ADD #$01

Kicked_DownXVel:
	STA <Objects_XVelZ, X
	RTS

Kicked_FindRelVel:
	RTS

Object_PositionHeld:
	LDA Level_PipeMove
	BEQ PRG000_CEFD	 ; If Player is NOT moving through pipes, jump to PRG000_CEFD

	LDA Objects_SpriteAttributes, X
	ORA #SPR_BEHINDBG
	STA Objects_SpriteAttributes, X

	LDA Level_PipeMove
	BPL Held_NotBehind

Held_NotBehind:
	LDY #$0a	 ; Y = 10
	BNE PRG000_CF1A	 ; Jump (technically always) to PRG000_CF1A

PRG000_CEFD:
	LDY #$00	 ; Y = 0

	LDA <Player_FlipBits
	BNE PRG000_CF04	 ; If Player is turned around, jump to PRG000_CF04

	INY		 ; Y = 1

PRG000_CF04:
	LDA Player_PipeFace
	BEQ PRG000_CF1F	 ; If Player is NOT "pipe facing" (facing forward in pipe), jump to PRG000_CF1F

	; Y += 2
	INY
	INY

	CMP #$05	
	BLT PRG000_CF1A	 ; If less than 5 ticks remaining on the "pipe face", jump to PRG000_CF1A

	INY		 ; Otherwise, Y++

PRG000_CF1A:

	; Set object to occupy Sprite_RAM offset $10
	LDA #$10
	STA Object_SpriteRAMOffset,X

PRG000_CF1F:

	; Set held object's proper X position
	LDA <Player_X	
	ADD ObjectHoldXOff,Y
	STA <Objects_XZ,X	

	LDA <Player_XHi	
	ADC ObjectHoldXHiOff,Y
	STA <Objects_XHiZ,X	

	LDA Objects_BoundBottom, X
	SUB Objects_BoundTop, X
	ADD #$04
	STA <Temp_Var1
	
	LDA Player_BoundBottom
	SUB <Temp_Var1
	STA <Objects_YZ, X

	LDA Player_BoundBottomHi
	SBC #$00
	STA <Objects_YHiZ, X

	LDA <Player_YVelZ
	STA <Objects_YVelZ, X

	LDA <Player_XVelZ
	STA <Objects_XVelZ, X

	LDA Objects_Orientation, X
	AND #~(SPR_HFLIP)
	STA <Temp_Var1

	LDA <Player_FlipBits
	AND #SPR_HFLIP
	ORA <Temp_Var1
	STA Objects_Orientation, X

PRG000_CF98:
	RTS		 ; Return


ObjState_Killed:
	JSR Object_FallAndDelete	; Have object fall and delete if it gets too low (at which point we don't return)

	LDY ObjGroupRel_Idx	 ; Y = object's group relative index

	LDA ObjectGroup_KillAction,Y
	AND #%00001111
	BEQ Object_DoKillAction	 ; If kill action is zero, jump to Object_DoKillAction (i.e. do NOT set frame 2)

	CPX #$05	 
	BGE Object_DoKillAction	 ; If object slot >= 5 (i.e. not a "general" objects), jump to Object_DoKillAction (i.e. do NOT set frame 2)

	; Do the kill action
Object_DoKillAction:
	JSR DynJump

	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!!
	.word Object_StarBurstDeath	; 0
	.word Object_NormalWhileKilled	; 1

Object_StandardKill:
	JMP Object_DoKilledAction

Object_NormalAndKilled:
	JSR Object_DoNormal
	JMP Object_DoKilledAction

Object_NormalWhileKilled:
	JMP Object_DoNormal

Object_StarBurstDeath:
	LDA #OBJ_STARS
	STA Objects_ID, X

	LDA #$00
	STA Stars_Timer, X

	JSR Object_NoInteractions
	
	LDA #$00
	STA <Temp_Var1
	STA <Temp_Var2

	LDA Objects_BoundRight, X
	SUB Objects_BoundLeft, X
	LSR A
	SUB #$04
	BCS Star_StoreLeft

	DEC <Temp_Var1

Star_StoreLeft:
	ADD Objects_BoundLeft, X
	STA <Objects_XZ, X

	LDA Objects_BoundLeftHi, X
	ADC <Temp_Var1
	STA <Objects_XHiZ, X
 
	LDA Objects_BoundBottom, X
	SUB Objects_BoundTop, X
	LSR A
	SUB #$08
	BCS Star_StoreTop

	DEC <Temp_Var2

Star_StoreTop:
	ADD Objects_BoundTop, X
	STA <Objects_YZ, X

	LDA Objects_BoundTopHi, X
	ADC <Temp_Var2
	STA <Objects_YHiZ, X
	
	LDA #$04
	STA Objects_SpritesRequested,X

	LDA #BOUND8x16
	STA Objects_BoundBox, X

	LDA #OBJSTATE_KILLED
	STA Objects_State, X
	RTS

Object_PoofDie:
	LDA #OBJSTATE_DEADEMPTY
	STA Objects_State, X

	LDA Objects_SpritesHorizontallyOffScreen, X
	ORA Objects_SpritesVerticallyOffScreen, X
	BNE Object_PoofDieRTS

	LDA <Objects_YZ, X
	STA <Poof_Y

	LDA <Objects_XZ, X
	STA <Poof_X
	
	JSR Common_MakePoof

Object_PoofDieRTS:
	RTS	

	; If object was killed by sinking in quicksand or just killed, do this...
Object_DoKilledAction:
	; Dead object, not sinking in quicksand

	; Vertically flip
	;LDA Objects_Orientation,X
	;ORA #SPR_VFLIP
	;STA Objects_Orientation,X

Object_MoveNotHalted:
	;LDA <Player_HaltGameZ
	;BNE PRG000_D054	 ; If gameplay halted, jump to PRG000_D054 (RTS)

	;JSR Object_Move	 ; Perform standard object movements
	;JSR Object_CalcBoundBox
	;JSR Object_DetectTiles
	;JSR Object_CheckForeground

PRG000_D054:
	RTS		 ; Return


	; If killed object falls too low, delete it
Object_FallAndDelete:
	LDA <Objects_YHiZ,X
	CMP #$02
	BLS PRG000_D054	 ; If object Y Hi < 2 (way low), jump to PRG000_D054

	; Do NOT return to caller!
	PLA
	PLA

PRG000_D068:
	JMP Object_SetDeadEmpty	 ; Jump to Object_SetDeadEmpty

Object_MaxFalls:
	.byte OBJECT_MAXFALL, OBJECT_MAXFALLINWATER, OBJECT_MAXFALL

Object_MaxAntiGravity:
	.byte -OBJECT_MAXFALL, -OBJECT_MAXFALLINWATER, OBJECT_MAXFALL
	; Gravity of object 
Object_Gravity:
	.byte OBJECT_FALLRATE, OBJECT_FALLRATEINWATER, OBJECT_SLOWFALLRATE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_Move
;
; Links all code together to move an object with velocity
; including intersecting with the world etc.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $D097
Object_Move:
	LDA <Objects_XVelZ,X	; Get Object's X velocity
	PHA		 	; Save it

	LDY Objects_InWater,X
	BEQ PRG000_D0A9	 	; If object is not in water, jump to PRG000_D0A9

	; This is basically an pseudo-ASR, a right shift preserving the sign
	ASL A			; Bit 7 pushed into carry
	ROR <Objects_XVelZ,X	; X velocity rotated right (divided by 2) and proper sign of bit 7 in place

PRG000_D0A9:
	JSR Object_ApplyXVel	 ; Applies object's X velocity

	PLA		 ; Restore Object's X velocity

	STA <Objects_XVelZ,X	 ; Undoes Object_ApplyXVel

Object_ApplyY_With_Gravity:
	JSR Object_ApplyYVel_NoGravity	 ; Apply Y velocity without limit

	LDY Objects_SlowFall, X
	BNE Apply_SlowFall

	LDY Objects_InWater,X	; Y = whether in-water

Apply_SlowFall:
	LDA <Objects_YVelZ,X
	BPL PRG000_D0CA	 	; If object is object is still or moving downward, jump to PRG000_D0CA

	; Object is moving upward...

	CPY #$00
	BEQ PRG000_D0CA	 ; If object is NOT in water, jump to PRG000_D0CA

	CMP #OBJECT_MAXWATERUPWARD
	BGE PRG000_D0CA	 ; If object's Y velocity is between OBJECT_MAXWATERUPWARD and 0, jump to PRG000_D0CA

	LDA #OBJECT_MAXWATERUPWARD	 
	STA <Objects_YVelZ,X ; Otherwise, cut off velocity at OBJECT_MAXWATERUPWARD

PRG000_D0CA:
	LDA NoGravity
	BNE PRG000_D0DE

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BNE PRG000_D0DE

	LDA Reverse_Gravity
	BNE PRG000_D0DF

	LDA <Objects_YVelZ,X
	ADD Object_Gravity,Y
	STA <Objects_YVelZ,X	; Apply gravity to object

	BMI PRG000_D0DE	 	; If Y velocity is negative, jump to PRG000_D0DE (RTS)

	CMP Object_MaxFalls,Y
	BCC PRG000_D0DE	 	; If object is not falling at the max rate, jump to PRG000_D0DE (RTS)

	LDA Object_MaxFalls,Y
	STA <Objects_YVelZ,X	; Cap fall at max rate

PRG000_D0DE:
	LDA #$00
	STA NoGravity
	STA Reverse_Gravity
	JMP Object_XYCheckSum

PRG000_D0DF:
	LDA #$00
	STA Reverse_Gravity

	LDA <Objects_YVelZ,X
	SUB Object_Gravity,Y
	STA <Objects_YVelZ,X	; Apply gravity to object

	BPL PRG000_D0DE	 	; If Y velocity is negative, jump to PRG000_D0DE (RTS)

	CMP Object_MaxAntiGravity,Y
	BCS PRG000_D0DE	 	; If object is not falling at the max rate, jump to PRG000_D0DE (RTS)

	LDA Object_MaxAntiGravity,Y
	STA <Objects_YVelZ,X	; Cap fall at max rate

Object_XYCheckSum:

	LDA Objects_XYCS, X
	STA Objects_XYCSPrev, X

	LDA <Objects_XZ, X
	EOR <Objects_YZ, X
	ADD <Objects_XZ, X
	STA Objects_XYCS, X
	RTS

ObjectHeld_WakeUpDir:	.byte $40, $00 

	; Handle shelled object "waking up" from a shelled state, if timer 3 expired...
Object_ShellDoWakeUp:

	; Object is not a Bob-omb and not an Ice Block... 
	LDA Objects_Timer3,X 
	BNE PRG000_D15A	 ; If timer 3 is not expired, jump to PRG000_D15A (RTS) 

	LDA Objects_BeingHeld, X
	BEQ PRG000_D147	 ; If object is not currently being held, jump to PRG000_D147

	
	LDA Object_BodyTileProp, X
	CMP #TILE_PROP_SOLID_ALL
	BCS Objbect_DieNow

	LDA <Objects_TilesDetectZ,X 
	BEQ PRG000_D147	 ; If held object did not impact anything, jump to PRG000_D147 

Objbect_DieNow:
	LDA #$FF
	STA Objects_Health, X
	PLA
	PLA
	JMP Object_GetKilled
	;JMP Object_FlipFall

PRG000_D147: 

	; Held object did NOT impact... (time to wake up!)

	
	; Set object state to Normal
	LDA #OBJSTATE_NORMAL
	STA Objects_State,X

	LDA #$00
	STA Objects_BeingHeld, X

	LDA Objects_Orientation, X
	AND #~SPR_VFLIP
	STA Objects_Orientation, X

	JSR Object_MoveTowardsPlayer
	PLA
	PLA

PRG000_D155:
PRG000_D15A:
	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_Reverse
;
; Object reverses travel and facing direction
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $D15B 
Object_Reverse:
	LDA <Objects_XVelZ,X
	BEQ  Object_FlipFaceRTS

	JSR Negate
	STA <Objects_XVelZ,X	 ; Negate object's X velocity

	LDA Objects_XVelFrac,X
	JSR Negate 
	STA Objects_XVelFrac,X

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_FlipFace
;
; Object reverses facing direction
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $D162
Object_FlipFace:
	LDA Objects_Orientation,X
	EOR #SPR_HFLIP
	STA Objects_Orientation,X	 ; Flip left/right flag

Object_FlipFaceRTS:
	RTS		 ; Return

PRG000_D16B:	.byte -$08, $08

Object_FaceMovement:
	LDA Objects_XVelZ, X
	BEQ Object_FaceMovement1
	LDA Objects_Orientation, X
	AND #~SPR_HFLIP
	STA Objects_Orientation, X
	LDA Objects_XVelZ, X
	BMI Object_FaceMovement1

	LDA Objects_Orientation, X
	ORA #SPR_HFLIP
	STA Objects_Orientation, X

Object_FaceMovement1:
	RTs

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_HandleBumpUnderneath
;
; Handles an object getting killed or shelled when hit from under
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $D16D
Object_HandleBumpUnderneath:
	
	LDA Object_VertTileValue, X 
	BEQ Object_HandleBumpUnderneath0

	AND #$3F
	BEQ Object_HandleBumpUnderneath1

Object_HandleBumpUnderneath0:
	RTS

	; Object detected a block bump tile (object got bumped)

Object_HandleBumpUnderneath1:
	LDA Objects_BehaviorAttr, X
	AND #ATTR_BUMPNOKILL
	BNE Object_HandleBumpUnderneath3

	LDA <Player_YVelZ
	PHA

	LDA Player_InAir
	PHA

	JSR Object_Defeated

	PLA
	STA Player_InAir

	PLA
	STA <Player_YVelZ

	LDA Objects_State, X
	CMP #OBJSTATE_SHELLED
	BEQ Object_HandleBumpUnderneath2

	LDA #$FF
	STA Objects_Health, X
	JSR Object_GetKilled

Object_HandleBumpUnderneath2:
Object_HandleBumpUnderneath3:
	JMP Object_FallAwayFromPlayer 

Object_AttackOrDefeat:
	LDA Objects_Timer2,X
	ORA Objects_BeingHeld, X
	BNE PRG000_D1C4	 ; If timer 2 hasn't expired, jump to PRG000_D1C4 (RTS)

	JSR Object_RespondToTailAttack
	JSR Object_DetectPlayer
	BCS PRG000_D1C5	 ; If collision occurred, jump to PRG000_D1C5

PRG000_D1C4:
	RTS		 ; Return

PRG000_D1C5:
	JSR Object_DetermineContactKill
	BCC PRG000_D1C6
	RTS

PRG000_D1C6:
	LDA Objects_WeaponAttr, X
	AND #ATTR_DASHPROOF
	BEQ Object_HurtNoDash

	LDA Player_FireDash
	BNE Object_DefeatedRTS

Object_HurtNoDash:
	LDA Player_InWater
	BNE Object_HurtPlayer
	
	LDA Objects_WeaponAttr, X
	AND #ATTR_STOMPPROOF
	BNE Object_HurtPlayer

	LDA <HitTest_Result
	AND #(HITTEST_BOTTOM)
	BEQ Object_HurtPlayer

	LDA Player_BoundBottom
	SUB Objects_BoundTop, X
	CMP #$08
	BCC Object_Stomped
	

Object_HurtPlayer:
	JSR Player_GetHurt
	SEC
	RTS

Object_Stomped:
	LDA #HIT_STOMPED
	STA Objects_PlayerProjHit, X

Object_Defeated:
	JSR Object_DetermineChange
	BCS Object_DefeatedRTS

	JSR Object_GetKilled
	
	LDA #-$40
	STA <Player_YVelZ
	STA Player_InAir
	
	JMP Object_DefeatSound

Object_DefeatedRTS:
	RTS


Object_DetermineChange:
	LDA ObjGroupRel_Idx
	ASL A
	TAY

	LDA ObjectGroup_CollideJumpTable + 1, Y
	CMP #$08
	BEQ Object_DoChange

	CLC
	RTS

Object_DoChange:
	LDA ObjectGroup_CollideJumpTable, Y
	STA Objects_ID, X
	
	LDA #$08
	STA Objects_Timer2, X

	LDA Sound_QPlayer
	ORA #SND_PLAYERSWIM
	STA Sound_QPlayer

	LDA Objects_PlayerProjHit, X
	AND #HIT_STOMPED
	BEQ Change_NotStomped

	LDA #-$40
	STA <Player_YVelZ
	STA Player_InAir

	LDA #$00
	STA <Objects_YVelZ, X
	STA Objects_PlayerProjHit, X

	JSR Object_MoveTowardsPlayer

Change_NotStomped:
	SEC
	RTS

	; A very popular RTS @ $D3A0
ObjState_DeadEmpty:	
ObjInit_DoNothing:
ObjNorm_DoNothing:
ObjHit_DoNothing:
ObjHalt_DoNothing:
	RTS		 ; Return

	; Called for an object in state 1 to perform initialization logic
ObjState_Initializing:
	JSR Object_New ; Prepare the object

ObjState_Fresh:

	LDA #OBJSTATE_NORMAL
	STA Objects_State,X	 	; Set object state to 2 (Normal run)
	JSR Object_SetPaletteFromAttr	; Set object's palette

	LDA ObjGroupRel_Idx	 ; Get object's group relative index
	ASL A		 ; Shift left 1 (2 byte index)
	TAY		 ; -> Y

	JSR Object_CallInit

	LDX <CurrentObjectIndexZ
	JSR Object_CalcBoundBox

	LDA Objects_DynamicallySpawned, X
	BEQ ObjectState_InitRTS

	LDA #$00
	STA Objects_DynamicallySpawned, X

	LDA Objects_BoundRight, X
	SUB Objects_BoundLeft, X
	LSR A
	ADD Objects_BoundLeft, X
	STA <Point_X

	LDA Objects_BoundLeftHi, X
	ADC #$00
	STA <Point_XHi

	LDA Objects_BoundBottom, X
	SUB Objects_BoundTop, X
	LSR A
	ADD Objects_BoundTop, X
	STA <Point_Y

	LDA Objects_BoundBottomHi, X
	ADC #$00
	STA <Point_YHi

	JSR CheckPoint_OffScreen
	BCC ObjectState_InitRTS

	LDA <Point_X
	SUB #$08
	STA <Poof_X

	LDA <Point_Y
	SUB #$08
	STA <Poof_Y

	JSR Common_MakePoof

ObjectState_InitRTS:
	RTS

Object_CallInit:
	; Get jump address specific to this object
	INC ObjSplash_Disabled, X

	LDA ObjectGroup_InitJumpTable,Y
	STA <Temp_Var1

	LDA ObjectGroup_InitJumpTable+1,Y
	STA <Temp_Var2
	JMP [Temp_Var1]	 ; Dynamically jump to object's init routine 

	; Set object's palette value

; $D3BC
Object_SetPaletteFromAttr:
	LDY ObjGroupRel_Idx	 	; Y = object's relative group index
	LDA ObjectGroup_Attributes,Y	; Get attributes
	AND #OA1_PALMASK 		; Keep only bits 0 and 1 (palette)
	STA Objects_SpriteAttributes,X	 	; Set this object's palette
	RTS		 ; Return



	; $D3E0

Object_DeleteInPit:
	LDA <Objects_YHiZ, X
	BEQ Object_DeleteInPitRTS
	BMI Object_DeleteInPitRTS

	LDA <Objects_YZ, X
	CMP #$C0
	BCC Object_DeleteInPitRTS
	JMP Object_SetDeadAndNotSpawned

Object_DeleteInPitRTS:
	RTS

DeleteRange = Temp_Var16

Object_DeleteOffScreenRange:
	STA DeleteRange
	
	JSR Object_CheckOffScreen
	BCC Object_DeleteOffScreenRangeRTS

	JMP Object_SetDeadAndNotSpawned

Object_DeleteOffScreenRangeRTS:
	RTS

Object_DeleteOffScreen:
	LDA Objects_BoundBox, X
	BMI Object_DeleteOffScreenRTS

	LDA #$28
	STA <DeleteRange

	JSR Object_CheckOffScreen
	BCC Object_DeleteOffScreenRTS

	JMP Object_SetDeadAndNotSpawned

Object_DeleteOffScreenRTS:
	RTS

Object_CheckOffScreen:

	LDA Objects_SpritesVerticallyOffScreen, X
	ORA Objects_SpritesHorizontallyOffScreen, X
	BEQ Object_NotOffScreen

	LDA <Objects_YHiZ, X
	BEQ Object_NotTooLow
	BMI Object_IsTooHigh

	LDA <Objects_YZ, X
	CMP #$C0
	BCS Object_IsOffScreen
	BCC Object_NotTooLow

Object_IsTooHigh:
	LDA <Objects_YZ, X
	CMP #$A0
	BCC Object_IsOffScreen

Object_NotTooLow:
	LDA Objects_SpritesHorizontallyOffScreen, X
	BEQ Object_NotOffScreen

	JSR Object_XDistanceFromPlayer
	CPY #$00
	BEQ Object_DeleteOffScreen1

	LDA <Horz_Scroll
	SUB <DeleteRange
	STA <Temp_Var12

	LDA <Horz_Scroll_Hi
	SBC #$00
	STA <Temp_Var13

	LDA Objects_BoundRight, X
	SUB <Temp_Var12

	LDA Objects_BoundRightHi, X
	SBC <Temp_Var13
	BMI Object_IsOffScreen
	BPL Object_NotOffScreen

Object_DeleteOffScreen1:
	LDA <Horz_Scroll
	ADD <DeleteRange
	STA <Temp_Var12

	LDA <Horz_Scroll_Hi
	ADC #$01
	STA <Temp_Var13

	LDA <Temp_Var12
	SUB Objects_BoundLeft, X

	LDA <Temp_Var13
	SBC Objects_BoundLeftHi, X
	BMI Object_IsOffScreen

Object_NotOffScreen:
	CLC
	RTS

Object_IsOffScreen:
	SEC
	RTS

Object_SetDeadAndNotSpawned:

	LDY Objects_SpawnIdx,X	 ; Get the spawn index of this object
	BMI Object_SetDeadEmpty	 ; If object is spawned, jump to Object_SetDeadEmpty

	JSR Object_Respawn

Object_Delete:
Object_SetDeadEmpty: 
	LDA #OBJSTATE_DEADEMPTY
	STA Objects_State,X

	LDA #$00
	STA Objects_ID,X
	STA Objects_BeingHeld, X

	SEC

PRG000_D463:
	RTS		 ; Return

Object_InitBuffer:
	LDY #$01
	LDA Buffer_Occupied, Y
	BEQ UseThisBuffer
	
	DEY 
	LDA Buffer_Occupied, Y
	BEQ UseThisBuffer

	PLA
	PLA

UseThisBuffer:
	RTS


Object_FreeBuffer:
	LDA #$00
	STA Buffer_Occupied, Y
	RTS

Object_Respawn:
	LDY Objects_SpawnIdx,X

	LDA #$01
	STA Level_ObjectsSpawned,Y
	RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_New
;
; Prepares a new object by initializing all of the many object
; variables to zero...
;
; X = index of on-screen object
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $D499
Object_New:
	; Clear various object variables
	LDA #80
	STA Objects_XYCSPrev, X

	LDA #$00
	STA Objects_Global, X
	STA Objects_WeaponAttr, X
	STA Objects_BehaviorAttr, X
	STA Objects_Data1, X
	STA Objects_Data2, X
	STA Objects_Data3,X
	STA Objects_Data4,X
	STA Objects_Data5,X
	STA Objects_Data6,X
	STA Objects_Data7,X
	STA <Objects_SpriteX,X
	STA Objects_Timer,X
	STA Objects_Timer2,X

	STA <Objects_XVelZ,X
	STA <Objects_YVelZ,X
	STA Objects_XVelFrac,X 
	STA Objects_YVelFrac,X 
	STA Objects_Orientation,X
	STA Objects_Frame,X	
	STA Objects_ColorCycle,X
	STA <Objects_TilesDetectZ,X
	STA Objects_PreviousTilesDetect,X
	STA Objects_XYCS, X
	STA Objects_PlayerProjHit, X
	STA Objects_BoundRight, X
	STA Objects_BoundRightHi, X
	STA Objects_BoundLeft, X
	STA Objects_BoundLeftHi, X
	STA Objects_BoundTop, X
	STA Objects_BoundTopHi, X
	STA Objects_BoundBottom, X
	STA Objects_BoundBottomHi, X
	STA Objects_NoExp, X
	STA Objects_Regen, X
	STA Objects_BoundBox, X
	STA ObjSplash_Disabled, X
	STA Objects_BoundBox, X
	STA Objects_BeingHeld,X
	
	CPX #$05
	BGE PRG000_D4C8	 ; If using slot index >= 6, jump to PRG000_D4C8 (skip variables available only to slots 0 to 5)

	; Clear some more variables (object slots 0 to 5 ONLY)
	STA Objects_FrozenKicked,X
	STA Objects_SlowTimer,X
	STA Objects_Data8,X
	STA Objects_Data9,X
	STA Objects_Data10,X
	STA Objects_Data11,X
	STA Objects_Data12,X
	STA Objects_Data13,X
	STA Objects_Ticker, X

PRG000_D4C8:
	; Clear even more variables (object slots 0 to 4 [major objects] ONLY!!)
	STA Objects_InWater,X
	STA Objects_SlowFall, X
	STA Objects_PlayerHitStat,X

	CPX #$05
	BGE PRG000_D506	 ; If using slot index >= 5, jump to PRG000_D506 (skip variables available only to slots 0 to 4)

	STA Objects_Health,X
	STA Explosion_Timer, X

PRG000_D506:
	LDA #$02
	STA Objects_SpritesRequested, X

	LDA #$01
	STA Objects_ExpPoints, X
	RTS		 ; Return


	; Called for an object in state 2 to do its "normal" routine
ObjState_Normal:
Object_DoNormal:
	CPX #$05
	BCS No_KickShellClear

	LDA #$00
	STA Objects_Kicked, X
	STA Objects_Shelled, X

No_KickShellClear:
	LDA ObjGroupRel_Idx
	ASL A		 
	TAY		 ; Y = object's group relative index * 2 (2 byte index for jump table)
	
	; Get jump address specific to this object
	LDA ObjectGroup_NormalJumpTable,Y
	STA <Temp_Var1
	LDA ObjectGroup_NormalJumpTable+1,Y
	STA <Temp_Var2
	JMP [Temp_Var1]	 ; Dynamically jump to object's "normal" routine 



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_CalcSpriteXY_NoHi
;
; Calculate SpriteX/Y without considering the "High" parts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $D554
Object_CalcSpriteXY_NoHi:
	LDA <Objects_YZ,X
	SUB Vert_Scroll
	STA <Objects_SpriteY,X

	LDA <Objects_XZ,X
	SUB <Horz_Scroll
	STA <Objects_SpriteX,X

	RTS		 ; Return


; $D564
Fish_FixedY_ExceptHitFloor:
Fish_FixedYIfAppro:	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_ShakeAndCalcSprite
;
; The routine for a held object to "shake awake" (shelled enemies)
; and calculates sprite related info
;
; X = index of on-screen object
;
; Returns lots of stuff:
; Temp_Var1 = Object sprite Y
; Temp_Var2 = Object sprite X
; Temp_Var3 = Object's LR flag
; Temp_Var4 = Object's attributes
; Temp_Var5 = Objects_SpritesVerticallyOffScreen
; Temp_Var6 = Object's starting tiles index (and -> 'X')
; Temp_Var7 = Object's Sprite_RAM offset (and -> 'Y')
; Temp_Var8 = Objects_SpritesHorizontallyOffScreen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $D589
Object_ShakeAndCalcSprite:
	LDA <Objects_YZ,X	; Get object's Y
	SUB Vert_Scroll	; Make relative
	STA <Objects_SpriteY,X	; Store as sprite Y
	STA <Temp_Var1		; Also -> Temp_Var1

	; This is the object "shakin' awake" routine!  (Enemies in shell etc.)
 
	SEC		 ; Set carry (remember, this is the default for not applying carry to subtraction)

	LDA Objects_Timer4,X
	BEQ PRG000_D5A0	 ; If Timer4 = 0, jump to PRG000_D5A0

	CMP #$40
	BLT PRG000_D59F	 ; If Timer4 < $40, jump to PRG000_D59F

	LSR A
	LSR A

PRG000_D59F:
	LSR A	; Shift right 1 (if Timer4 < $40) or 3 (basically applies a carry sort of sporadically for "shakin' awake")

PRG000_D5A0:
	LDA <Objects_XZ,X	; Get object's X
	SBC <Horz_Scroll	; Make relative
	STA <Objects_SpriteX,X	; Store as sprite X
	STA <Temp_Var2		; Also -> Temp_Var2

	LDA Objects_Orientation,X
	STA <Temp_Var3		; Temp_Var3 = object's LR flag

	LDY ObjGroupRel_Idx	; Y = object's group relative index

	LDA Objects_ColorCycle,X
	BEQ PRG000_D5BC	 	; If Objects_ColorCycle = 0, jump to PRG000_D5BC

	DEC Objects_ColorCycle,X	; Objects_ColorCycle--
	AND #$03	 
	BPL PRG000_D5BF	 	; Jump (technically always) to PRG000_D5BF

PRG000_D5BC:	
	LDA Objects_SpriteAttributes,X	; Otherwise, just get the normal attributes

PRG000_D5BF:
	STA <Temp_Var4		; Decided attributes -> Temp_Var4

	LDA Objects_SpritesVerticallyOffScreen,X
	STA <Temp_Var5		; Temp_Var5 = Objects_SpritesVerticallyOffScreen

	LDA Objects_SpritesHorizontallyOffScreen,X
	STA <Temp_Var8		; Temp_Var8 = Objects_SpritesVerticallyOffScreen

	; Each "frame" value moves up two bytes to the next pair
	LDA Objects_Frame,X
	ASL A	
	STA <Temp_Var6		; Temp_Var6 = Objects_Frame << 1

	LDA ObjectGroup_PatternStarts,Y
	ADD <Temp_Var6	
	STA <Temp_Var6		; Temp_Var6 += ObjectGroup_PatternStarts[Y] (set base tile index)

	TAX		 	; -> 'X' 

	LDY <CurrentObjectIndexZ	; Y = object slot index

	LDA Object_SpriteRAMOffset,Y
	STA <Temp_Var7		; Temp_Var7 = Object_SpriteRAMOffset[Y] 

	TAY		 	; -> 'Y' 

	RTS		 ; Return

	; Object "shaking awake" and draw its sprite
; $D5E7

Object_DrawAligned:
	LDA #$01
	STA AlignSpriteFlag
	BNE Object_Draw1

Object_Draw:
	LDA #$00
	STA AlignSpriteFlag

Object_Draw1:
	JSR Object_ShakeAndCalcSprite
	
Object_Draw16x16:	
	JSR Object_Draw16x16Sprite

	LDA AlignSpriteFlag
	BEQ Object_Draw2

	TYA
	TAX
	DEC Sprite_RAM,X
	DEC Sprite_RAM+4,X

Object_Draw2:
	LDX <CurrentObjectIndexZ
	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_DrawMirrored
;
; Used to draw 16x16 mirrored object sprites.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $D5F0


Object_DrawMirrored:
	JSR Object_Draw; Draw object and "shake awake"
	; Keep all attributes except horizontal flip
	LDA Sprite_RAM+$02,Y
	AND #%10111111	 
	STA Sprite_RAM+$02,Y

	; Flip opposite sprite
	ORA #$40
	STA Sprite_RAM+$06,Y

	RTS		 ; Return

; $D601
Object_DrawTallAndHFlip:

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_Draw16x32
;
; Used to draw 16x32 object sprites.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $D618
Object_Draw16x32Mirrored:
	JSR Object_Draw16x32

	LDY Object_SpriteRAMOffset,X

	LDA Sprite_RAMAttr + 4, Y
	ORA #SPR_HFLIP
	STA Sprite_RAMAttr + 4, Y

	LDA Sprite_RAMAttr + 12, Y
	ORA #SPR_HFLIP
	STA Sprite_RAMAttr + 12, Y
	RTS

Object_Draw16x32:
	JSR Object_ShakeAndCalcSprite

	LDX <CurrentObjectIndexZ	; X = object slot index

	LDA Objects_Frame,X
	ASL A		 
	ADD <Temp_Var6	
	STA <Temp_Var6	 ; Temp_Var6 += object's frame
	TAX


	JSR Object_Draw16x16Sprite	 
	INC <Temp_Var6
	INC <Temp_Var6
	LDX <Temp_Var6

	LDA #$10
	ADD <Temp_Var1	 ; Sprite Y
	STA <Temp_Var1	 ; Temp_Var1 += 16

	LDA <Temp_Var7
	ADD #$08
	STA <Temp_Var7

	LDY <Temp_Var7

	JSR Object_Draw16x16Sprite	 
	LDX <CurrentObjectIndexZ
	LDA <Temp_Var3	 ; Objects_Orientation
	BPL PRG000_D63F	 ; If Objects_Orientation bit 7 set, jump to PRG000_D63F


	LDY Object_SpriteRAMOffset, X

	LDA Sprite_RAMY, Y
	PHA
	
	LDA Sprite_RAMY + 8, Y
	STA Sprite_RAMY, Y

	PLA
	STA Sprite_RAMY + 8, Y

	LDA Sprite_RAMY + 4, Y
	PHA
	
	LDA Sprite_RAMY + 12, Y
	STA Sprite_RAMY + 4, Y

	PLA
	STA Sprite_RAMY + 12, Y

PRG000_D63F:
	RTS		 ; Return

Object_Draw16x48:
	JSR Object_ShakeAndCalcSprite

Object_Draw16x48PreCalc:
	LDX <CurrentObjectIndexZ	; X = object slot index

	LDA Objects_Frame,X
	ASL A		 
	ADD <Temp_Var6	
	STA <Temp_Var6	 ; Temp_Var6 += object's frame
	TAX


	JSR Object_Draw16x16Sprite	 
	INC <Temp_Var6
	INC <Temp_Var6
	LDX <Temp_Var6

	LDA #$10
	ADD <Temp_Var1	 ; Sprite Y
	STA <Temp_Var1	 ; Temp_Var1 += 16

	LDA <Temp_Var7
	ADD #$08
	STA <Temp_Var7

	LDY <Temp_Var7

	JSR Object_Draw16x16Sprite	 

	INC <Temp_Var6
	INC <Temp_Var6
	LDX <Temp_Var6

	LDA #$10
	ADD <Temp_Var1	 ; Sprite Y
	STA <Temp_Var1	 ; Temp_Var1 += 16

	LDA <Temp_Var7
	ADD #$08
	STA <Temp_Var7

	LDY <Temp_Var7

	JSR Object_Draw16x16Sprite
	LDX <CurrentObjectIndexZ
	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_DrawWide
;
; Draws a wide 48x16 object
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Object_Draw48x16:
	JSR Object_ShakeAndCalcSprite

Object_Draw48x16PreCalc:
	LDX <CurrentObjectIndexZ	; X = object slot index

	LDA Objects_Frame,X
	TAX
	LDA #$00

AddFrame48x16:
	DEX
	BMI SetFrame48x16

	ADD #$06
	BNE AddFrame48x16
	
SetFrame48x16:
	STA <Temp_Var6	 ; Temp_Var6 += object's frame
	TAX

	JSR Object_Draw16x16Sprite
	
	INC <Temp_Var6
	INC <Temp_Var6
	LDX <Temp_Var6

	LDA #$10
	ADD <Temp_Var2	 ; Sprite X
	STA <Temp_Var2	 ; Temp_Var1 += 16

	LDA <Temp_Var7
	ADD #$08
	STA <Temp_Var7

	ASL <Temp_Var8
	ASL <Temp_Var8

	LDY <Temp_Var7
	JMP Continue32x16_Draw

Object_Draw32x16:
	JSR Object_ShakeAndCalcSprite

	LDX <CurrentObjectIndexZ	; X = object slot index

	LDA Objects_Frame,X
	ASL A		 
	ADD <Temp_Var6	
	STA <Temp_Var6	 ; Temp_Var6 += object's frame
	TAX

Continue32x16_Draw:
	JSR Object_Draw16x16Sprite
	
	INC <Temp_Var6
	INC <Temp_Var6
	LDX <Temp_Var6

	LDA #$10
	ADD <Temp_Var2	 ; Sprite X
	STA <Temp_Var2	 ; Temp_Var1 += 16

	LDA <Temp_Var7
	ADD #$08
	STA <Temp_Var7

	ASL <Temp_Var8
	ASL <Temp_Var8
	
	LDY <Temp_Var7

	JSR Object_Draw16x16Sprite	 

	LDA <Temp_Var3	 ; Objects_Orientation
	AND #SPR_HFLIP
	BEQ Object_Draw32x16RTS	

	LDX <CurrentObjectIndexZ
	LDY Object_SpriteRAMOffset, X
	
	LDA Sprite_RAMTile + 4, Y
	PHA 

	LDA Sprite_RAMTile, Y
	PHA 

	LDA Sprite_RAMTile + 8, Y
	STA Sprite_RAMTile, Y

	LDA Sprite_RAMTile + 12, Y
	STA Sprite_RAMTile + 4, Y

	PLA 
	STA Sprite_RAMTile + 8, Y

	PLA 
	STA Sprite_RAMTile + 12, Y
	
Object_Draw32x16RTS:
	LDX <CurrentObjectIndexZ
	RTS		 ; Return

VisMask:
	.byte $81, $41, $21, $11, $82, $42, $22, $12

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_Draw16x16Sprite
;
; Used to draw 16x16 object sprites.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $D680
Object_Draw16x16Sprite:
; Temp_Var1 = Object sprite Y
; Temp_Var2 = Object sprite X
; Temp_Var3 = Object's LR flag
; Temp_Var4 = Object's attributes
; Temp_Var5 = Objects_SpritesVerticallyOffScreen
; Temp_Var6 = Object's starting tiles index (and -> 'X')
; Temp_Var7 = Object's Sprite_RAM offset (and -> 'Y')
; Temp_Var8 = Objects_SpritesHorizontallyOffScreen
	LDA <Temp_Var5	; Check sprite vertical visibility
	LSR A		; Shift right (checking lowest bit)
	BCS PRG000_D693	; If this bit is set, this sprite piece is invisible, jump to PRG000_D6C6 (RTS)

	LDA <Temp_Var1	; Get sprite Y

	BIT <Temp_Var8	; Testing bit 7 of horizontal sprite visibility
	BMI PRG000_D68E	; If bit 7 is set (this sprite is horizontally off-screen), jump to PRG000_D68E

	STA Sprite_RAM+$00,Y	 ; Otherwise, OK to set sprite Y

PRG000_D68E:
	BVS PRG000_D693	 ; If bit 6 is set, jump to PRG000_D693

	STA Sprite_RAM+$04,Y	 ; Otherwise, OK set second sprite Y

PRG000_D693:
	LDA <Temp_Var2		; Get sprite X
	STA Sprite_RAM+$03,Y	; Store into Sprite RAM

	ADD #$08	 	; +8 for next sprite over
	STA Sprite_RAM+$07,Y	; Store into second sprite

	LDA ObjectGroup_PatternSets,X	; Get first sprite pattern index
	STA Sprite_RAM+$01,Y	; -> Sprite RAM

	LDA ObjectGroup_PatternSets+1,X	; Get second sprite pattern index
	STA Sprite_RAM+$05,Y	; -> Sprite RAM

	LDA <Temp_Var3		 
	ORA <Temp_Var4		 ; Joins base attributes to H-flip flag
	STA Sprite_RAM+$02,Y	 ; Store into both sprite's attributes
	STA Sprite_RAM+$06,Y	 ; Store into both sprite's attributes

	BIT <Temp_Var3		
	BVC PRG000_D6C6	 ; If sprite is not horizontally flipped, jump to PRG000_D6C6 (RTS)

	; If flipped, swap sprite attributes
	LDA Sprite_RAM+$01,Y
	PHA		
	LDA Sprite_RAM+$05,Y
	STA Sprite_RAM+$01,Y
	PLA
	STA Sprite_RAM+$05,Y

PRG000_D6C6:
	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_GetUnusedSprite
;
; Gets a semi-random "near by" sprite as appropriate for an
; object; it's a "friendly" way of getting an additional sprite
; for an object that's going over the normal limit.
;
; X = index of on-screen object
;
; Returns:
;	Temp_Var7 = offset to the blank sprite (also in 'Y')
;	Temp_Var8 = 5 or 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	; Selection table for the 5/1... doesn't seem like the
	; values actually mean anything, it just checks > 5?
	; Kept in Temp_Var9 anyway...

; $D736
Object_GetUnusedSprite:

	LDY Sprite_FreeRAM
	BEQ Object_GetUnusedSpriteRTS

	LDA Sprite_FreeRAM
	ADD #$04
	STA Sprite_FreeRAM

Object_GetUnusedSpriteRTS:
	RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_DetermineHorizontallyOffScreen
; Object_DetermineHorizontallyOffScreenY
;
; Determines how many of each horizontal sprite of an object are
; invisible (off-screen), based on size of object
;
; X = index of on-screen object
; Y = width of object; 0-5 or 8, 16, 24, 32, 40, 48 respectively (Object_DetermineHorizontallyOffScreenY only)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; Pixel width minus 8 of objects
Object_Widths:
	.byte  0	; 0
	.byte  8	; 1
	.byte 16	; 2
	.byte 24	; 3
	.byte 32	; 4
	.byte 40	; 5
	.byte 48	; 6

	; Respective bit to set per width checked
Object_WidthFlags:
	.byte %10000000	; 0
	.byte %01000000	; 1
	.byte %00100000	; 2
	.byte %00010000	; 3
	.byte %00001000	; 4
	.byte %00000100	; 5
	.byte %00000010	; 6

; $D79E
Object_DetermineHorizontallyOffScreen:
	LDY ObjGroupRel_Idx	 	; Y = object group relative index
	
	LDA ObjectGroup_Attributes,Y	; Get object's attributes
	AND #OA1_WIDTHMASK	 ; Keep only bits 4-6
	LSR A		 
	LSR A		 
	LSR A		 
	LSR A		 ; shift right 4
	TAY		 ; Y = Width of object (0-5 or 0, 8, 16, 24, 32, or 40, -8)

	LDA Objects_State,X
	CMP #OBJSTATE_NORMAL
	BGS PRG000_D7B8	 ; If this object's state >= OBJSTATE_NORMAL (not dead or initializing), jump to PRG000_D7B8

	; If object is dead/empty or initializing, mark all sprites as invisible
	LDA #%11111100
	STA Objects_SpritesHorizontallyOffScreen,X

	RTS		 ; Return

PRG000_D7B8:
	LDA #$00
	STA Objects_SpritesHorizontallyOffScreen,X	 ; Clear until determined

PRG000_D7BD:
	LDA <Objects_XZ,X
	ADD Object_Widths,Y
	STA <Temp_Var15		; Temp_Var15 = object's X + ??

	LDA <Objects_XHiZ,X
	ADC #$00	 
	STA <Temp_Var16		; Temp_Var16 = Object's X Hi with carry applied

	LDA <Temp_Var15
	CMP <Horz_Scroll

	LDA <Temp_Var16	
	SBC <Horz_Scroll_Hi
	BEQ PRG000_D7DE	 ; If sprite is not horizontally off-screen, jump to PRG000_D7DE

	; This sprite is off left/right of screen...
	LDA Objects_SpritesHorizontallyOffScreen,X	 ; Get appropriate invisibility bit
	ORA Object_WidthFlags,Y	 ; OR it
	STA Objects_SpritesHorizontallyOffScreen,X	 ; Store it

PRG000_D7DE:
	DEY		 ; Y--
	BPL PRG000_D7BD	 ; While Y >= 0, loop

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_DetermineVerticallyOffScreen
; Object_DetermineVerticallyOffScreenY
;
; Determines how many of each vertical sprite of an object are
; invisible (off-screen), based on size of object
;
; X = index of on-screen object
; Y = height of object; 0-3 or 16, 32, 48, 64 respectively (Object_DetermineVerticallyOffScreenY only)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $D7E2
Object_DetermineVerticallyOffScreen:
	LDY ObjGroupRel_Idx	 	; Y = object group relative index
	LDA ObjectGroup_Attributes,Y	; Get object's attributes
	AND #OA1_HEIGHTMASK	 ; keep only bits 2 and 3
	LSR A		 
	LSR A		 ; shift right 2
	TAY		 ; Y = size of object (0-3 or 16, 32, 48, 64)

	LDA #$01
	STA <Temp_Var3	 ; Temp_Var3 = 1

	LDA #$00
	STA Objects_SpritesVerticallyOffScreen,X	 ; Clear until determined

	; Copy object's Y Hi/Lo -> Temp_Var1/2
	LDA <Objects_YHiZ,X
	STA <Temp_Var1	
	LDA <Objects_YZ,X
	STA <Temp_Var2	

PRG000_D7FE:

	; Add 16 to copy of object's Y (bottom of this sprite)
	LDA <Temp_Var2
	ADD #16
	STA <Temp_Var2

	BCC PRG000_D809	 ; If no carry, jump to Objects_SpritesVerticallyOffScreen

	INC <Temp_Var1		 ; Otherwise, apply carry

PRG000_D809:
	LDA <Temp_Var2		
	SUB Vert_Scroll
	STA <Temp_Var4		 ; Temp_Var4 = screen-relative Y

	LDA <Temp_Var1		
	SBC Vert_Scroll_Hi	
	BNE PRG000_D81E	 ; If relative position is off-screen, jump to PRG000_D81E

	; Otherwise...
	LDA <Temp_Var4
	CMP #240
	BLT PRG000_D826	 ; If object sprite is higher than 240 (not off bottom of screen), jump to PRG000_D826

PRG000_D81E:

	; This sprite is off top/bottom of screen...
	LDA <Temp_Var3		 ; Get current set bit
	ORA Objects_SpritesVerticallyOffScreen,X	 
	STA Objects_SpritesVerticallyOffScreen,X	 ; Mark this part as invisible

PRG000_D826:
	ASL <Temp_Var3	 ; Temp_Var3 <<= 1
	DEY		 ; Y--
	BPL PRG000_D7FE	 ; While Y >= 0, loop!

PRG000_D82B:
	RTS		 ; Return

	

; $D83B
Object_InteractWithPlayer:
	LDA Objects_Timer2, X
	BEQ Object_CheckInteraction

	CLC
	RTS

Object_CheckInteraction:
	LDA Objects_BeingHeld, X
	BEQ Object_InteractWithPlayer1
	
	JSR Object_Hold
	SEC

	RTS

Object_InteractWithPlayer1:
	JSR Object_DetectPlayer
	BCC No_Collission

	JSR Object_DoCollision ; Otherwise...

	SEC		 ; Set carry

	LDA <HitTest_Result

No_Collission:
	RTS		 ; Return

PRG000_D834:
	.byte -8, 8

Player_BoundBox:
	;  Left Right  Top Bot - offsets applied to sprite X/Y
	.byte 2,  13, 17, 31	; small/ducking
	.byte 1, 14,  10, 31	; otherwise


Player_CalcBoundBox:
	LDY #$04
	LDA Player_IsDucking
	BNE Player_CalcBoundBox1

	LDA Player_Suit
	BNE Player_CalcBoundBox2

Player_CalcBoundBox1:
	LDY #$00
	
Player_CalcBoundBox2:

	LDA <Player_X
	ADD Player_BoundBox,Y	
	STA Player_BoundLeft

	LDA <Player_XHi
	ADC #$00
	STA Player_BoundLeftHi

	LDA <Player_X
	ADD Player_BoundBox + 1,Y	
	STA Player_BoundRight

	LDA <Player_XHi
	ADC #$00
	STA Player_BoundRightHi

	LDA <Player_YZ
	ADD Player_BoundBox+2,Y	
	STA Player_BoundTop

	LDA <Player_YHiZ
	ADC #$00
	STA Player_BoundTopHi

	LDA <Player_YZ
	ADD Player_BoundBox+3,Y	
	STA Player_BoundBottom

	LDA <Player_YHiZ
	ADC #$00
	STA Player_BoundBottomHi

	LDA Player_TailAttack
	BEQ Player_BoundRTS
	; Tail attack only kicks at counter values $09 and $0C

	CMP #$0c
	BEQ PRG000_DB26	 ; If tail attack counter = $0C, jump to PRG000_DB26

	CMP #$09
	BNE Player_BoundRTS	 ; If tail attack counter <> $09, jump to PRG000_DB16 (RTS)

PRG000_DB26:
	LDA <Player_FlipBits
	AND #$40
	BEQ PRG000_DB2F	 ; If 'Y' = 0, jump to PRG000_DB2F

	LDA Player_BoundRightHi
	STA Tail_BoundLeftHi

	LDA Player_BoundRight
	STA Tail_BoundLeft
	ADD #$0B
	STA Tail_BoundRight

	LDA Tail_BoundLeftHi
	ADC #$00
	STA Tail_BoundRightHi
	JMP PRG000_DB30

PRG000_DB2F:
	LDA Player_BoundLeftHi
	STA Tail_BoundRightHi

	LDA Player_BoundLeft
	STA Tail_BoundRight
	SUB #$0B
	STA Tail_BoundLeft

	LDA Tail_BoundRightHi
	SBC #$00
	STA Tail_BoundLeftHi

PRG000_DB30:
	LDA Player_BoundBottom
	SUB #$04
	STA Tail_BoundBottom

	LDA Player_BoundBottomHi
	SBC #$00
	STA Tail_BoundBottomHi

	LDA Tail_BoundBottom
	SUB #$05
	STA Tail_BoundTop

	LDA Tail_BoundBottomHi
	SBC #$00
	STA Tail_BoundTopHi

Player_BoundRTS:
	RTS

Object_CalcBoundBox:
	LDA Objects_XYCS, X
	CMP Objects_XYCSPrev, X
	BNE Object_CalcBoundBox1

Object_CalcBoundBoxRTS:
	RTS

Object_CalcBoundBoxForced:
Object_CalcBoundBox1:
	LDA Objects_BoundBox, X	 ; Get this object's attribute flags
	ASL A
	ASL A
	TAY		 ; -> Y (selected bounding box for this object)

	; Calculate upper left of bounding box and lower right offsets
	LDA <Objects_XZ,X
	ADD Object_BoundBox,Y	
	STA Objects_BoundLeft, X

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Objects_BoundLeftHi, X

	LDA <Objects_XZ, X
	ADD Object_BoundBox+1,Y
	STA Objects_BoundRight, X
	
	LDA <Objects_XHiZ, X
	ADC #$00
	STA Objects_BoundRightHi, X

	LDA <Objects_YZ,X
	ADD Object_BoundBox+2,Y	
	STA Objects_BoundTop, X

	LDA <Objects_YHiZ, X
	ADC #$00
	STA Objects_BoundTopHi, X

	LDA <Objects_YZ,X
	ADD Object_BoundBox+3,Y	
	STA Objects_BoundBottom, X

	LDA <Objects_YHiZ, X
	ADC #$00
	STA Objects_BoundBottomHi, X

	RTS		 ; Return


	; Calculates the upper-left and returns the lower-right offsets
	; of this object's bounding box...
	; Temp_Var3 - upper left of bounding box
	; Temp_Var4 - offset to right bounding box
	; Temp_Var7 - bottom of bounding box
	; Temp_Var8 - offset to top bounding box
; $D955

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ObjectObject_Intersect
;
; Determines if the Player/Object and the OTHER Object indexed
; by 'X' have intersected according to the bounding box data
;
; X = index of on-screen object
;
; Returns carry SET if Player/Object and Object intersected
; Temp_Var12 holds specific info:
;	Bit 0 - Set if Player/Object's bbox bottom is HIGHER than 
;	        object's bbox bottom
;	Bit 1 - Set if Player/Object's bbox left edge is to the LEFT of
;	        object's bbox left edge
;
; Note that this is performed by the "sprite" (or screen-relative)
; positions of the Player/Object and the OTHER Object, and may not 
; be accurate (because it's not a full 16-bit coordinate check) and 
; more logic is needed after this to determine completely if there 
; should be an actual collision.  See use of ObjectObject_Intersect 
; to get an idea what else needs to be done...
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $D97B

HitTest_Result = Temp_Var10
HitTest_Count = Temp_Var11
HITTEST_RIGHT	= 01
HITTEST_LEFT	= 02
HITTEST_BOTTOM = 04
HITTEST_TOP		= 08

Object_DetectTail:
	LDY #$0A
	JMP Object_DetectObjects

Object_DetectPlayer:
	LDA Objects_BeingHeld, X
	BEQ Object_DoDetectPlayer

	SEC
	RTS

Object_SpecialDetectPlayer:
Object_DoDetectPlayer:

	LDY #$08

Object_DetectObjects:
	LDA #$00
	STA <HitTest_Result 
	STA <HitTest_Count

	LDA Objects_BoundLeft, X
	SUB Objects_BoundLeft, Y

	LDA Objects_BoundLeftHi, X
	SBC Objects_BoundLeftHi, Y
	BMI ODORight

	LDA Objects_BoundRight, Y
	SUB Objects_BoundLeft, X

	LDA Objects_BoundRightHi, Y
	SBC Objects_BoundLeftHi, X
	BMI ODORight

	LDA #HITTEST_LEFT
	STA <HitTest_Result
	INC <HitTest_Count
	BNE ODOBottom

ODORight:
	LDA Objects_BoundRight, X
	SUB Objects_BoundLeft, Y

	LDA Objects_BoundRightHi, X
	SBC Objects_BoundLeftHi, Y
	BMI ODOBottom

	LDA Objects_BoundRight, Y
	SUB Objects_BoundRight, X

	LDA Objects_BoundRightHi, Y
	SBC Objects_BoundRightHi, X
	BMI ODOHorzIntersect

	LDA #HITTEST_RIGHT
	STA <HitTest_Result
	INC <HitTest_Count
	BNE ODOBottom

ODOHorzIntersect:
	LDA Objects_BoundLeft, Y
	SUB Objects_BoundLeft, X
	
	LDA Objects_BoundLeftHi, Y
	SBC Objects_BoundLeftHi, X
	BMI ODOBottom

	LDA Objects_BoundRight, X
	SUB Objects_BoundRight, Y
	
	LDA Objects_BoundRightHi, X
	SBC Objects_BoundRightHi, Y
	BMI ODOBottom

	LDA #(HITTEST_RIGHT | HITTEST_LEFT)
	STA <HitTest_Result
	INC <HitTest_Count

ODOBottom:
	LDA <HitTest_Count

ODOBottom1:
	BEQ ODOFin

	LDA Objects_BoundBottom, X
	SUB Objects_BoundTop, Y

	LDA Objects_BoundBottomHi, X
	SBC Objects_BoundTopHi, Y
	BMI ODOTop

	LDA Objects_BoundBottom, Y
	SUB Objects_BoundBottom, X
	
	LDA Objects_BoundBottomHi, Y
	SBC Objects_BoundBottomHi, X
	BMI ODOTop

	LDA #HITTEST_TOP
	ORA <HitTest_Result
	STA <HitTest_Result
	INC <HitTest_Count
	BNE ODOFin

ODOTop:
	LDA Objects_BoundTop, X
	SUB Objects_BoundTop, Y

	LDA Objects_BoundTopHi, X
	SBC Objects_BoundTopHi, Y
	BMI ODOVertIntersect

	LDA Objects_BoundBottom, Y
	SUB Objects_BoundTop, X
	
	LDA Objects_BoundBottomHi, Y
	SBC Objects_BoundTopHi, X
	BMI ODOVertIntersect

	LDA #HITTEST_BOTTOM
	ORA <HitTest_Result
	STA <HitTest_Result
	INC <HitTest_Count
	BNE ODOFin

ODOVertIntersect:	
	LDA Objects_BoundTop, Y ; smaller object
	SUB Objects_BoundTop, X
	
	LDA Objects_BoundTopHi, Y  ; smaller object
	SBC Objects_BoundTopHi, X
	BMI ODOFin

	LDA Objects_BoundBottom, X  ; smaller object
	SUB Objects_BoundBottom, Y
	
	LDA Objects_BoundBottomHi, X
	SBC Objects_BoundBottomHi, Y
	BMI ODOFin

	LDA #(HITTEST_TOP | HITTEST_BOTTOM)
	ORA <HitTest_Result
	STA <HitTest_Result
	INC <HitTest_Count

ODOFin:
	LDA <HitTest_Count
	CMP #$02
	BCS ODOFin2

	LDA #$00
	CLC
	RTS

ODOFin2:
	LDA <HitTest_Result
	SEC
	RTS

	; Proper Collision routine for this object
; $D9BB
Object_DoCollision:
	LDX <CurrentObjectIndexZ	; X = the current object slot

	LDA ObjGroupRel_Idx	; Get the object's group relative index
	ASL A		 	; Shift left 1 (2 byte index)
	TAY		 	; -> Y

	; Get address from ObjectGroup_CollideJumpTable...
	LDA ObjectGroup_CollideJumpTable,Y
	STA <Temp_Var1

	LDA ObjectGroup_CollideJumpTable+1,Y
	STA <Temp_Var2	

	JMP [Temp_Var1]	 ; Jump to the acquired address!

; $D9D3
Player_GetHurt:
	LDA Player_FlashInv		; ... flashing invincible ...
	ORA Player_StarInv		; ... invincible by star 
	ORA <Player_HaltGameZ		; ... gameplay halted ...
	ORA Player_HaltTick		; ... Player halted ...
	BNE PRG000_D9B7	 ; ... then jump to PRG000_D9B7 (RTS)

	JMP PRG000_DA15	 ; Jump to PRG000_DA15 (skips lost/dead Japanese version code)

PRG000_D9B7:
	RTS
; $D9EC

PRG000_DA15:
	LDA Player_Frozen
	BEQ Player_NotFrozen

	JSR Unfreeze

Player_NotFrozen:
	LDA PowerUp_Reserve
	CMP #ITEM_1_HP
	BCC Player_NoHP
	
	CMP #(ITEM_3_HP + 1)
	BCS Player_NoHP

	DEC PowerUp_Reserve

	LDA PowerUp_Reserve
	CMP #ITEM_1_HP
	BCS Player_PoofHurt

	LDA #$00
	STA PowerUp_Reserve
	BEQ Player_PoofHurt

Player_NoHP:
	LDA <Player_Suit
	CMP #PLAYERSUIT_FIRE		; RAS: Change this to "PLAYERSUIT_SUPERSUITBEGIN" and you restore Japanese version's "always shrink" code!!
	BLS PRG000_DA4E	 ; If Player is Big or small, jump to PRG000_DA4E

	LDA Player_Level
	CMP #ABILITY_EXTRAHIT
	BCC PRG000_DA4E

	LDA #$02
	STA Player_QueueSuit	 ; Queue power-up change

	LDA #$80
	STA Player_FlyTime

Player_PoofHurt:
	LDA #$17
	STA Player_SuitLost	 ; Player_SuitLost = $17

	; Play Power up lost sound
	LDA Sound_QLevel1
	ORA #SND_LEVELPOOF
	STA Sound_QLevel1


PRG000_DA47:
	LDA #$00	 
	BEQ PRG000_DA6D	 ; Jump (technically always) to PRG000_DA6D

PRG000_DA4E:

	; Player is only big or small...

	LDA <Player_Suit
	BEQ PRG000_DA7A	 ; If Player is small, jump to PRG000_DA7A (gonna die!!)

	LDA #$02
	STA Player_QueueSuit	 ; Return to Big

PRG000_DA50:
	DEC Player_QueueSuit	; Get small!

	LDA Player_Vehicle
	BNE Player_PoofHurt

	; Play shrinking sound!!
	LDA Sound_QPlayer
	ORA #SND_PLAYERPIPE
	STA Sound_QPlayer

	LDA #$2f	
	STA Player_Grow	 	; Player_Grow = $2f (shrinking!)

PRG000_DA6D: 
	LDA #$71

	LDY Player_Level
	CPY #ABILITY_RECOVERY
	BCC Store_Recovery

	ASL A

Store_Recovery:	
	STA Player_FlashInv	 ; Player_FlashInv = $71

	LDA #$00
	STA Player_Flip	 ; Player not somersaulting

	RTS		 ; Return

PRG000_DA7A:
	LDX <CurrentObjectIndexZ	 ; X = CurrentObjectIndexZ

	JMP Player_Die

Object_RespondToTailAttack:

	LDA Player_TailAttack
	BEQ Object_RespondToTailAttack2	 ; If Player is not tail attacking, jump to PRG000_DB16 (RTS)

	SUB #$09
	BMI Object_RespondToTailAttack2
	;CMP #$0c
	;BEQ Object_RespondToTailAttack1	 ; If tail attack counter = $0C, jump to PRG000_DB26

	;CMP #$09
	;BNE Object_RespondToTailAttack2	 ; If tail attack counter <> $09, jump to PRG000_DB16 (RTS)

Object_RespondToTailAttack1:
	LDY Objects_State, X	; Y = object's current state

	LDA Objects_WeaponAttr,X
	AND #ATTR_TAILPROOF
	BNE Object_RespondToTailAttack2	 ; If OA3_TAILATKIMMUNE is SET (Object cannot be tail-attacked), jump to PRG000_DB16 (RTS)

	LDA Objects_SpritesHorizontallyOffScreen,X
	ORA Objects_SpritesVerticallyOffScreen,X
	BNE Object_RespondToTailAttack2	 ; If any sprite of the object is off-screen, jump to PRG000_DB16 (RTS)

	JSR Object_DetectTail
	BCC Object_RespondToTailAttack2	 ; If Player and object are not intersecting, jump to PRG000_DB16 (RTS)

	LDA #$00
	STA Objects_BeingHeld, X

	LDA Objects_PlayerProjHit, X
	ORA #HIT_TAIL
	STA Objects_PlayerProjHit, X

	JSR Object_KickSound
	JSR Object_DetermineChange
	JSR Object_FlipFallAwayFromHit
	JSR Object_GetKilled
	
	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE Object_TailNotKilled

	LDA #$FF
	STA Objects_Health, X

Object_TailNotKilled:
	PLA
	PLA

Object_RespondToTailAttack2:
	RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ObjectToObject_HitTest
;
; Determines if the object specified in 'X' has collided
; with any of the other active objects not including
; Player (see Object_HitTest/Object_InteractWithPlayer)
;
; If the object has collided with another object:
;  Carry flag is SET
;  'Y' = index of the collided-with object 
;  'A' = ObjectID of the collided-with object
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; Enable object-to-object by state (0 = Enabled, 1 = Disabled)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_CalcCoarseXDiff
;
; Calculates a "coarse" X difference with the Player,
; returning a one byte value that determines the
; difference in X/XHi coordinates in units of 4 pixels
; in Temp_Var15.  Temp_Var16 is set to $40 and the
; carry flag is set if the difference was negative.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $DCA2 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_CalcCoarseYDiff
;
; Calculates a "coarse" Y difference with the Player,
; returning a one byte value that determines the
; difference in Y/YHi coordinates in units of 8 pixels.
; Returns Temp_Var15 in the format of a crude signed
; value for Y Hi in bit 6 and 7 
; [00 -> Y Hi = 0, 01 -> Y Hi = 1, 11 -> Y Hi = negative]
; and the base Y difference in the bits 0 - 5 (so units 
; of 8 pixels.)
; Temp_Var16 holds the raw difference in "Y Hi"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $DCB9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_ApplyYVel
; Object_ApplyYVel_NoGravity
;
; Adds the 4.4FP Y velocity to object and prevents object
; from falling faster than OBJECT_MAXFALL (unless using
; Object_ApplyYVel_NoGravity which does not enforce this)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $DCCD
Object_ApplyYVel:
	LDA <Objects_YVelZ,X	 
	BMI Object_ApplyYVel_NoGravity	 ; If Object's Y Vel < 0 (moving upward), jump to Object_ApplyYVel_NoGravity

	CMP #OBJECT_MAXFALL	 
	BLS Object_ApplyYVel_NoGravity	 ; If Object's Y Vel < OBJECT_MAXFALL, jump to Object_ApplyYVel_NoGravity

	LDA #OBJECT_MAXFALL	 
	STA <Objects_YVelZ,X	 ; Cap Y Velocity to OBJECT_MAXFALL

; $DCD9
Object_ApplyYVel_NoGravity:
	TXA		 
	ADD #(Objects_YVelZ - Objects_XVelZ)
	TAX		 ; Offset to Y velocities

	LDA Stop_Watch
	BNE Object_ApplyYVel_NoGravity1

	JSR Object_AddVelFrac	 ; Apply the velocity to the object's position

		 ; Restore X as Object slot index
Object_ApplyYVel_NoGravity1:
	LDX <CurrentObjectIndexZ
	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_ApplyXVel
;
; Adds the 4.4FP X velocity to object and will disable
; X Hi's application if the object wants it that way..
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $DCE4
Object_ApplyXVel:
	LDA Stop_Watch
	BNE Object_ApplyXVel1
	
	JSR Object_ApplyWindEffect
	JSR Object_CheckConveyors
	LDA <Objects_XVelZ, X
	PHA

	LDA Objects_EffectiveXVel, X
	STA <Objects_XVelZ, X
	JSR Object_AddVelFrac

	PLA
	STA <Objects_XVelZ, X

Object_ApplyXVel1:
	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_AddVelFrac
;
; Adds the 4.4FP velocity to X or Y of object
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Object_AddVelFrac:
	LDA <Objects_XVelZ,X	; Get Velocity
	ASL A		 
	ASL A		 
	ASL A		 
	ASL A		 	; Fractional part shifted up
	ADD Objects_XVelFrac,X	 
	STA Objects_XVelFrac,X	; Add to object's vel fractional accumulator

	PHP		 ; Save CPU state
	PHP		 ; Save CPU state

	LDY #$00	 ; Y = 0 (positive high part)

	LDA <Objects_XVelZ,X	; Get Velocity
	LSR A
	LSR A
	LSR A
	LSR A		 ; Whole part shifted down (integer)
	CMP #%00001000	 ; Check the sign bit
	BLT PRG000_DD19	 ; If the value was not negatively signed, jump to PRG000_DD19

	ORA #%11110000	 ; Otherwise, apply a sign extension
	DEY		 ; Y = $FF (negative high part)
PRG000_DD19:
	PLP		 ; Restore CPU state

	PHA		 ; Save integer of velocity

	ADC <Objects_XZ,X 
	STA <Objects_XZ,X ; Add with carry

	TYA		 ; A = $00 or $FF as appropriate

	ADC <Objects_XHiZ,X
	STA <Objects_XHiZ,X ; Add to the high part

	PLA		 ; Restore integer of Velocity

	PLP		 ; Restore CPU state
	RTS		 ; Return

XDiff = Temp_Var14
XDiffLeftRight = Temp_Var13

Object_XDistanceFromPlayer:
	LDA Objects_BoundRight, X
	SUB Objects_BoundLeft, X
	LSR A
	ADD Objects_BoundLeft, X
	STA <Temp_Var1

	LDA Objects_BoundLeftHi, X
	ADC #$00
	STA <Temp_Var2

	LDA Player_BoundRight
	SUB Player_BoundLeft
	LSR A
	ADD Player_BoundLeft
	STA <Temp_Var3

	LDA Player_BoundLeftHi
	ADC #$00
	STA <Temp_Var4

	LDA <Temp_Var1
	SUB <Temp_Var3
	STA <XDiff

	LDA <Temp_Var2
	SBC <Temp_Var4
	BMI Object_ToRight_O

	CMP #$01
	BNE Object_ToLeft1_O

	LDA #$FF
	STA <XDiff

Object_ToLeft1_O:
	LDY #$00
	STY <XDiffLeftRight

	LDA <XDiff
	RTS

Object_ToRight_O:
	CMP #$FE
	BNE Object_ToRight1_O

	LDA #$01
	STA <XDiff

Object_ToRight1_O:
	LDY #$01
	STY <XDiffLeftRight

	LDA <XDiff
	EOR #$FF
	ADD #$01
	STA <XDiff
	RTS

YDiff = Temp_Var14
YDiffAboveBelow = Temp_Var13
Object_YDistanceFromPlayer:
	LDA Objects_BoundBottom, X
	SUB Objects_BoundTop, X
	LSR A
	ADD Objects_BoundTop, X
	STA <Temp_Var1

	LDA Objects_BoundTopHi, X
	ADC #$00
	STA <Temp_Var2

	LDA Player_BoundBottom
	SUB Player_BoundTop
	LSR A
	ADD Player_BoundTop
	STA <Temp_Var3

	LDA Player_BoundTopHi
	ADC #$00
	STA <Temp_Var4

	LDA <Temp_Var1
	SUB <Temp_Var3
	STA <YDiff

	LDA <Temp_Var2
	SBC <Temp_Var4
	BMI Object_ToBottom_O

	CMP #$01
	BNE Object_ToTop1_O

	LDA #$FF
	STA <YDiff

Object_ToTop1_O:
	LDY #$00
	STY <YDiffAboveBelow
	
	LDA <YDiff
	RTS

Object_ToBottom_O:
	CMP #$FE
	BNE Object_ToBottom1_O

	LDA #$01
	STA <YDiff

Object_ToBottom1_O:
	LDY #$01
	STY <YDiffAboveBelow

	LDA <YDiff
	BEQ Object_ToBottom1_O1

	EOR #$FF
	ADD #$01
	STA <YDiff
	RTS

Object_ToBottom1_O1:
	LDA #$FF
	STA <YDiff
	RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Negate
;
; "NEG" is not REALLY an opcode of its own
; This makes it a subroutine, though...
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $DD4E
Negate:
	NEG
	RTS		 ; Return

	; Initializes a "block bump" effect, if one of the 2 slots is open...


ASHIM .func \1-AScroll_Movement-1
	; This is the initial movement table for horizontal auto scroll levels, minus 1
	; Level_AScrlLimitSel selects which entry to use, which sets Level_AScrlVar (the actual index value)



	; This routine is a much more simplified version of the water check. It basically checks the tile based on
	; the water flag for the tile rather than all these range comparisons
Object_Check_Water:
	LDA Objects_WeaponAttr,X
	AND #ATTR_FIREPROOF
	BNE Object_Check_Water1

	LDA Object_BodyTileProp, X
	CMP #(TILE_PROP_FOREGROUND | TILE_PROP_WATER | TILE_PROP_HARMFUL)
	BEQ Object_Check_Water0

	CMP #(TILE_PROP_WATER | TILE_PROP_HARMFUL)
	BNE Object_Check_Water1

Object_Check_Water0:
	LDA #OBJSTATE_KILLED
	STA Objects_State, X
	RTS

Object_Check_Water1:
	LDY #$00
	
	LDA Object_BodyTileProp, X
	CMP #TILE_PROP_SOLID_TOP
	BCS NotWater

	AND #TILE_PROP_WATER
	BEQ NotWater

InWater:
	INY

NotWater:
	TYA
	CMP Objects_InWater,X	
	BEQ PRG000_C6FA	 	; If object is either still in water / out of water (hasn't changed), jump to PRG000_C6FA

	LDA ObjSplash_Disabled, X
	BNE PRG000_C6FA

	JSR Object_WaterSplash	 ; Hit water; splash!
	LDA Objects_InWater, X
	BNE PRG000_C6FA

	LDA <Objects_YVelZ, X
	JSR Half_Value
	STA <Objects_YVelZ, X

PRG000_C6FA:
	TYA
	STA Objects_InWater,X	 ; Set object's in-water flag

	LDA #$00
	STA ObjSplash_Disabled, X
	RTS

Object_TestTopBumpBlocks:
	LDA <Objects_TilesDetectZ,X
	AND #HIT_CEILING
	BEQ Object_TestTopBumpBlocks1

	LDA Object_VertTileProp, X
	CMP #TILE_PROP_ITEM
	BCC Object_TestTopBumpBlocks1

	JSR Object_TopBumpBlocks
	SEC
	RTS

Object_TestTopBumpBlocks1:
	CLC
	RTS

Object_TestBottomBumpBlocks:
	LDA <Objects_TilesDetectZ,X
	AND #HIT_GROUND
	BEQ Object_TestTopBumpBlocks1

	LDA Object_VertTileProp, X
	CMP #TILE_PROP_ITEM
	BCC Object_TestBottomBumpBlocks1

	JSR Object_BottomBumpBlocks

Object_TestBottomBumpBlocks1:
	RTS

Object_TestSideBumpBlocks:
	LDA Objects_SpritesHorizontallyOffScreen,X
	ORA Objects_SpritesVerticallyOffScreen,X
	BNE Object_TestSideBumpBlocks1

	LDA Object_HorzTileProp, X
	CMP #TILE_PROP_ITEM
	BCC Object_TestSideBumpBlocks1

	JSR Object_SideBumpBlocks
	JSR Object_Reverse
	SEC
	RTS

Object_TestSideBumpBlocks1:
	CLC
	RTS



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Object_InteractWithTiles
;
; Calls Object_Move and handles the object responding to hitting
; the floor/ceiling, or bump blocks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $A966
Object_InteractWithTilesWallStops:
	LDA #$01
	STA Object_WallStops

Object_InteractWithTiles:
	LDA Block_WasUpdated
	BNE Object_InteractWithTiles1

	LDA Objects_XYCS, X
	CMP Objects_XYCSPrev, X
	BNE Object_InteractWithTiles1

	LDA #$00
	STA Object_WallStops
	RTS

Object_InteractWithTiles1:
	LDA <Objects_XVelZ, X
	BNE Object_InteractWithTiles2

	INC Object_WallStops

Object_InteractWithTiles2:
	LDA <Objects_TilesDetectZ,X
	TAY		 ; Object detection status -> 'Y'
	AND #$04	 
	BEQ PRG001_A973	 ; If object did NOT hit floor, jump to PRG001_A973

	JSR Object_HitGround ; Object hit ground, align

PRG001_A973:
	TYA		 ; Object detection status -> 'A'
	AND #$08
	BEQ PRG001_A993	 ; If object did NOT hit ceiling, jump to PRG001_A97C
	
	LDA Object_CeilingStops
	BNE Ceiling_NoStop

	JSR Object_HitCeiling
	JMP PRG001_A993

Ceiling_NoStop:
	JSR Object_HitCeilingNoStop

PRG001_A993:

	; Object didn't hit the bump tile 

	TYA		 ; Object detection status -> 'A'
	AND #$03
	BEQ PRG001_A9B7	 ; If object did NOT hit a wall, jump to PRG001_A9B7 (RTS)

	LDA Object_WallStops
	BEQ Object_DoReverse


Object_WallStop:
	LDA Objects_EffectiveXVel, X
	BEQ PRG001_A9B7
	BPL Object_HitRightWall

	LDA Objects_BoundLeft, X
	EOR #$FF
	ADD #$01
	AND #$0F
	ADD <Objects_XZ, X
	STA <Objects_XZ, X

	LDA <Objects_XHiZ, X
	ADC #$00
	STA <Objects_XHiZ, X

	LDA #$00
	STA <Objects_XVelZ, X
	JMP PRG001_A9B7

Object_HitRightWall:
	LDA Objects_BoundRight, X
	AND #$0F
	STA <Temp_Var1
	
	LDA <Objects_XZ, X
	SUB <Temp_Var1
	STA <Objects_XZ, X

	LDA <Objects_XHiZ, X
	SBC #$00
	STA <Objects_XHiZ, X

	LDA #$00
	STA <Objects_XVelZ, X
	JMP PRG001_A9B7

Object_DoReverse:
	JSR Object_Reverse

PRG001_A9B7:
	LDA #$00
	STA Object_WallStops
	STA Object_CeilingStops
	JSR Object_CheckForeground
	JSR Object_HandleBumpUnderneath
	JSR Object_CheckConveyors
	
	RTS		 ; Return

Conveyer_Effect:
	.byte $F0, $10
	.byte $FF, $00

Conveyer_EffectMin:
	.byte $04, $FC

Object_CheckConveyors:
	LDA <Objects_TilesDetectZ,X
	AND #HIT_GROUND
	BEQ Object_CheckConveyorsRTS
	
	LDY #$00

	LDA Object_VertTileProp, X
	CMP #TILE_PROP_ITEM
	BCS Object_CheckConveyorsRTS

	AND #$0F
	CMP #(TILE_PROP_MOVE_LEFT)
	BEQ Object_ConveryAffected

	CMP #(TILE_PROP_MOVE_RIGHT)
	BNE Object_CheckConveyorsRTS
	INY

Object_ConveryAffected:	
	LDA <Objects_XVelZ, X
	STA <Temp_Var1

	ADD Conveyer_Effect, Y

	STA <Temp_Var2
	EOR <Temp_Var1
	BPL Apply_ConveyorAffect

	LDA <Objects_XVelZ, X
	BEQ Apply_ConveyorAffect

	LDA Conveyer_EffectMin, Y
	STA <Temp_Var2

Apply_ConveyorAffect:
	LDA <Temp_Var2
	STA Objects_EffectiveXVel, X

Object_CheckConveyorsRTS:
	RTS	

Object_CheckForeground:
	LDA Objects_SpriteAttributes, X
	AND #$DF
	STA Objects_SpriteAttributes, X

	LDY #$02

SetSpriteFG1:
	LDA Object_VertTileProp, X
	CMP #TILE_PROP_SOLID_ALL
	BCS SetSpriteFG2
	
	AND #TILE_PROP_FOREGROUND
	BNE SetBehindFg

SetSpriteFG2:
	LDA Object_HorzTileProp, X
	CMP #TILE_PROP_SOLID_ALL
	BCS SetSpriteFG3
	
	AND #TILE_PROP_FOREGROUND
	BNE SetBehindFg


SetSpriteFG3:
SetSpriteFG4:
	LDA Object_BodyTileProp, X
	CMP #TILE_PROP_SOLID_ALL
	BCS Object_CheckForegroundRTS

	AND #TILE_PROP_FOREGROUND
	BEQ Object_CheckForegroundRTS

SetBehindFg:
	LDA Objects_SpriteAttributes, X
	ORA #SPR_BEHINDBG
	STA  Objects_SpriteAttributes, X
	
Object_CheckForegroundRTS:	
	RTS


Object_FindEmptyX:
	LDX #$04

Object_FindEmptyX1:
	LDA Objects_ID, X
	LDA Objects_State, X
	BEQ Object_FindEmptyX2	 ; If this object slot's state is Dead/Empty, jump to PRG002_A5AE

	DEX		 ; X--
	BPL Object_FindEmptyX1	 ; While X >= 0, loop!
	CLC

	LDX <CurrentObjectIndexZ
	RTS

Object_FindEmptyX2:
	JSR Object_New

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	LDA #$FF
	STA Objects_SpawnIdx, X

	SEC
	RTS

Object_FindEmptyY:
	LDY #$04

Object_FindEmptyY1:
	LDA Objects_State,Y
	BEQ Object_FindEmptyY2	 ; If this object slot's state is Dead/Empty, jump to PRG002_A5AE

	DEY		 ; X--
	BPL Object_FindEmptyY1	 ; While X >= 0, loop!
	CLC
	RTS

Object_FindEmptyY2:
	TYA
	TAX

	JSR Object_New

	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

	LDA #$FF
	STA Objects_SpawnIdx, X

	LDX <CurrentObjectIndexZ
	SEC
	RTS

Obj_Boss:
	LDA #17
	STA PAGE_A000
	JSR PRGROM_Change_A000
	JMP ObjNorm_Boss	

GiantXFrame:
	.byte $00, $08, $10, $18, $00, $08, $10, $18

GiantYFrame:
	.byte $00, $00, $00, $00, $10, $10, $10, $10

GiantFlipOffset:
	.byte $03, $01, $FF, $FD, $03, $01, $FF, $FD

Object_DrawGiantMirrored:
	LDA #$01
	BNE Object_DrawGiant1

Giant_TilesLow = Temp_Var10
Giant_TilesHi = Temp_Var11
Giant_SpriteOffset = Temp_Var7

Object_DrawGiant:
	LDA Object_SpriteRAMOffset, X
	STA <Giant_SpriteOffset

	LDA #$00

Object_DrawGiant1
	STA <Temp_Var12

	JSR Object_CalcSpriteXY_NoHi
	LDA Objects_Frame, X
	ASL A
	ASL A
	ASL A
	STA <Temp_Var6

	LDA Objects_SpritesHorizontallyOffScreen, X
	AND #$F0
	ORA Objects_SpritesVerticallyOffScreen, X
	STA <Temp_Var1

	LDA Objects_Orientation, X
	AND #SPR_HFLIP
	STA <Temp_Var16

	LDA #$00
	STA <Temp_Var2
	
DrawNextGiant:
	JSR DrawGiantSprite
	INC <Temp_Var6
	INC <Temp_Var2

	LDA <Giant_SpriteOffset
	ADD #$04
	STA <Giant_SpriteOffset

	LDA <Temp_Var2
	CMP #$08
	BNE DrawNextGiant

	JMP DrawGiant_CheckVert

DrawGiantSprite:
	LDY <Temp_Var6
	LDA <Temp_Var16
	BEQ DrawGiantSprite1

	LDY <Temp_Var2
	LDA GiantFlipOffset, Y
	ADD <Temp_Var6
	TAY

DrawGiantSprite1:
	LDA [Giant_TilesLow], Y
	STA <Temp_Var3
	LDY <Temp_Var2
	LDX <CurrentObjectIndexZ
	
	LDA GiantXFrame, Y
	ADD Objects_SpriteX,X
	STA <Temp_Var4

	LDA GiantYFrame, Y
	ADD Objects_SpriteY,X
	STA <Temp_Var5


	LDA VisMask, Y
	AND <Temp_Var1
	BNE DontDrawGiant

	LDY <Giant_SpriteOffset
	LDA <Temp_Var5
	STA Sprite_RAM, Y

	LDA <Temp_Var3
	STA Sprite_RAM + 1, Y

	LDA Objects_SpriteAttributes,X
	ORA Objects_Orientation,X
	STA Sprite_RAM + 2, Y

	LDA <Temp_Var4
	STA Sprite_RAM + 3, Y

	LDA <Temp_Var12
	BEQ DontDrawGiant

	LDA <Temp_Var2
	AND #$03
	CMP #$02
	BCC DontDrawGiant

	LDA Sprite_RAM + 2, Y
	ORA #SPR_HFLIP
	STA Sprite_RAM + 2, Y

DrawGiant_CheckVert:
	LDX <CurrentObjectIndexZ
	LDY Object_SpriteRAMOffset, X

	LDA Objects_Orientation, X
	AND #SPR_VFLIP
	BEQ DontDrawGiant

	LDA Sprite_RAMY + 16, Y
	PHA

	LDA Sprite_RAMY, Y
	STA Sprite_RAMY + 16, Y
	STA Sprite_RAMY + 20, Y
	STA Sprite_RAMY + 24, Y
	STA Sprite_RAMY + 28, Y

	PLA
	STA Sprite_RAMY, Y
	STA Sprite_RAMY + 4, Y
	STA Sprite_RAMY + 8, Y
	STA Sprite_RAMY + 12, Y
	
DontDrawGiant:
	RTS


Object_InteractWithObjects:
	LDA Objects_State, X
	AND #$FE
	CMP #OBJSTATE_NORMAL
	BEQ DetectObjects

Object_InteractWithObjectsSkip:
	CLC
	RTS

Object_DetectBit:
	.byte %00000001, %0000010, %00000100, %00001000, %00010000

DetectObjects:
	LDY #$04

DetectNextSprite:
	CPY <CurrentObjectIndexZ
	BEQ GoNextSprite

	;LDA Objects_DetectedObject, X
	;AND Object_DetectBit, Y
	;BNE GoNextSprite

	;LDA Object_DetectBit, X
	;ORA Objects_DetectedObject, Y
	;STA Objects_DetectedObject, Y
	
	LDA Objects_State, Y
	CMP #OBJSTATE_FROZEN
	BCS Detect_ThisObject

	AND #$FE
	CMP #OBJSTATE_NORMAL
	BNE GoNextSprite

Detect_ThisObject:
	LDA Objects_BehaviorAttr,Y
	AND #ATTR_CARRYANDBUMP
	BEQ GoNextSprite

	LDX <CurrentObjectIndexZ
	JSR Object_DetectObjects
	BCC GoNextSprite

	LDA Objects_BoundBottom, X
	SUB Objects_BoundTop, Y
	CMP #$09
	BCC Object_Carry

	CMP #$10
	BCC Objects_BumpOff
	BCS GoNextSprite
	
Object_Carry:
	LDA Objects_YVelZ, X
	BMI GoNextSprite

	LDA Objects_BoundTop, Y
	SUB #$10
	STA <Objects_YZ, X

	LDA Objects_BoundTopHi, Y
	SBC #$00
	STA <Objects_YHiZ, X

	LDA Objects_XVelZ, Y
	STA Objects_XVelZ, X

	LDA Objects_XVelFrac,Y
	STA Objects_XVelFrac,X

	LDA #$00
	STA <Objects_YVelZ, X
	STA Objects_YVelFrac,X
	SEC
	RTS

GoNextSprite:
	DEY
	BPL DetectNextSprite

	CLC
	LDX <CurrentObjectIndexZ
	RTS

Objects_BumpOff:
	TYA
	TAX

	JSR Object_Reverse
	JSR Object_ApplyXVel
	JSR Object_ApplyXVel
	JSR Object_CalcBoundBox

	LDX <CurrentObjectIndexZ
	JSR Object_Reverse
	JSR Object_ApplyXVel
	JSR Object_ApplyXVel
	JSR Object_CalcBoundBox

Objects_BumpOff1:
	CLC
	RTS

InitPatrol:
	LDA #$06
	STA Patrol_Blocks, X

InitPatrol_NoTimers:
	LDA Objects_Property, X
	JSR DynJump

	.word InitPatrolHorizontal
	.word InitPatrolVertical
	.word InitDiagonal
	.word InitDiagonal2
	.word InitCircleCCW
	.word InitCircleCW
	.word InitPatrol_Chase


InitPatrolHorizontal:
	LDA #$01
	STA Patrol_XVelocityChange, X

	LDA #$10
	STA Patrol_XAccelLimit, X
	RTS

InitPatrolVertical:
	LDA #$01
	STA Patrol_YVelocityChange, X

	LDA #$10
	STA Patrol_YAccelLimit, X
	RTS

InitDiagonal:
	JSR InitPatrolHorizontal
	JMP InitPatrolVertical

InitDiagonal2:
	JSR InitPatrolHorizontal
	JSR InitPatrolVertical

	LDA Patrol_YVelocityChange, X
	EOR #$FF
	ADD #$01
	STA Patrol_YVelocityChange, X
	
	LDA Patrol_YAccelLimit, X
	EOR #$FF
	ADD #$01
	STA Patrol_YAccelLimit, X

	LDA <Objects_YVelZ, X
	EOR #$FF
	ADD #$01
	STA <Objects_YVelZ, X

	RTS
	
InitCircleCCW:
	JSR InitCircleCW

	LDA Patrol_XAccelLimit, X
	JSR Negate
	STA Patrol_XAccelLimit, X

	LDA <Objects_XVelZ, X
	JSR Negate
	STA <Objects_XVelZ, X

	LDA #$FF
	STA Patrol_XVelocityChange, X
	RTS

InitCircleCW:
	LDY Patrol_BlockDiameter, X
	LDA Patrol_CircleTimers, Y
	STA Patrol_XAccelLimit, X
	STA Patrol_YAccelLimit, X
	STA <Objects_XVelZ, X

	LDA #$01
	STA Patrol_XVelocityChange, X
	STA Patrol_YVelocityChange, X

	LDA #(Patrol_CircleTimer - Patrol_BlockTimers)
	STA Patrol_Blocks, X
	RTS

InitPatrol_Chase:
	LDA #$10
	STA ChaseVel_LimitHi, X

	LDA #$F0
	STA ChaseVel_LimitLo, X
	RTS

Patrol_XAccelLimit = Objects_Data7
Patrol_YAccelLimit = Objects_Data8
Patrol_XVelocityChange = Objects_Data9
Patrol_YVelocityChange = Objects_Data10
Patrol_XCycleTimer = Objects_Data11
Patrol_YCycleTimer = Objects_Data12
Patrol_Blocks = Objects_Data13
Patrol_BlockDiameter = Objects_Data13

ChaseVel_LimitLo = Objects_Data10
ChaseVel_LimitHi = Objects_Data11

	.byte $01, $03, $01, $01, $01, $01
Patrol_BlockTimersTable:
Patrol_BlockTimers = Patrol_BlockTimersTable - 6
	.byte $09, $18, $27, $36, $45, $54, $63, $72

Patrol_CircleTimer:	
	.byte $01

Patrol_CircleTimersTable:
Patrol_CircleTimers = Patrol_CircleTimersTable - 4
	.byte $0F, $11, $13, $15, $16, $17, $19, $1A

Object_MovePattern:
	LDA Objects_Property, X

	JSR DynJump
	.word PatrolBackForth
	.word PatrolUpDown
	.word PatrolDiagonal
	.word PatrolDiagonal
	.word PatrolDiagonal
	.word PatrolDiagonal
	.word Object_ChasePlayer

PatrolDiagonal:
	LDA Objects_Ticker, X
	PHA

	JSR PatrolUpDown

	PLA
	STA Objects_Ticker, X
	
PatrolBackForth:
	LDA Patrol_XCycleTimer,X
	BEQ PatrolBackForth_Accel	 ; If timer is not expired, jump to PRG004_B2FB

	DEC Patrol_XCycleTimer,X
	BNE PatrolBackForth_Move

	LDA Patrol_XVelocityChange, X
	EOR #$FF
	ADD #$01
	STA Patrol_XVelocityChange, X

	LDA Patrol_XAccelLimit, X
	EOR #$FF
	ADD #$01
	STA Patrol_XAccelLimit, X


PatrolBackForth_Accel:
	INC Objects_Ticker, X
	LDA Objects_Ticker, X
	AND #$03
	BNE PatrolBackForth_Move

	LDA <Objects_XVelZ,X
	CMP Patrol_XAccelLimit, X
	BNE PatrolBackForth_SetVel

	LDY Patrol_Blocks, X
	LDA Patrol_BlockTimers, Y
	STA Patrol_XCycleTimer, X
	
	LDA #$00
	STA Objects_Ticker, X

	LDA Patrol_XAccelLimit, X

PatrolBackForth_SetVel:
	ADD Patrol_XVelocityChange,X
	STA <Objects_XVelZ,X

PatrolBackForth_Move:
	JSR Object_ApplyXVel	 ; Apply X velocity
	RTS

PatrolUpDown:
	LDA Patrol_YCycleTimer,X
	BEQ PatrolUpDown_Accel	 ; If timer is not expired, jump to PRG004_B2FB

	DEC Patrol_YCycleTimer,X
	BNE PatrolUpDown_Move

	LDA Patrol_YVelocityChange, X
	EOR #$FF
	ADD #$01
	STA Patrol_YVelocityChange, X

	LDA Patrol_YAccelLimit, X
	EOR #$FF
	ADD #$01
	STA Patrol_YAccelLimit, X

PatrolUpDown_Accel:
	INC Objects_Ticker, X
	LDA Objects_Ticker, X
	AND #$03
	BNE PatrolUpDown_Move

	LDA <Objects_YVelZ,X
	CMP Patrol_YAccelLimit, X
	BNE PatrolUpDown_SetVel

	LDY Patrol_Blocks, X
	LDA Patrol_BlockTimers, Y
	STA Patrol_YCycleTimer, X

	LDA #$00
	STA Objects_Ticker, X

	LDA Patrol_YAccelLimit, X

PatrolUpDown_SetVel:
	ADD Patrol_YVelocityChange,X
	STA <Objects_YVelZ,X

PatrolUpDown_Move:
	JSR Object_ApplyYVel	 ; Apply X velocity
	RTS

Object_ChasePlayer:
	JSR Object_ChasePlayerX
	JMP Object_ChasePlayerY
	
Object_ChasePlayerX:
	LDA Objects_InWater, X
	BEQ ChaseDetermineX

	LDA Game_Counter
	AND #$03
	BEQ Chase_Move

ChaseDetermineX:	
	JSR Object_XDistanceFromPlayer

	CPY #$00
	BNE ChaseDetermineXRight

	LDA <Objects_XVelZ,X
	CMP ChaseVel_LimitLo,X	
	BEQ Object_ChasePlayerXRTS	 

	ADD #$FF	 
	STA <Objects_XVelZ,X	 
	JMP Object_ChasePlayerXRTS

ChaseDetermineXRight:
	LDA <Objects_XVelZ,X
	CMP ChaseVel_LimitHi,X	
	BEQ Object_ChasePlayerXRTS	 ; If Boo is at his acceleration limit, jump to PRG002_A8EE

	ADD #$01	 ; Boo accelerates!
	STA <Objects_XVelZ,X	 ; Update Boo's X velocity

Object_ChasePlayerXRTS:
	RTS

Object_ChasePlayerY:
	JSR Object_YDistanceFromPlayer

	CPY #$00
	BNE ChaseDetermineYUp

	LDA <Objects_YVelZ,X
	CMP ChaseVel_LimitLo,X	
	BEQ Chase_Move	 ; If Boo is at his acceleration limit, jump to PRG002_A8EE

	ADD #$FF	 ; Boo accelerates!
	STA <Objects_YVelZ,X	 ; Update Boo's X velocity
	JMP Chase_Move

ChaseDetermineYUp:
	LDA <Objects_YVelZ,X
	CMP ChaseVel_LimitHi,X	
	BEQ Chase_Move	 ; If Boo is at his acceleration limit, jump to PRG002_A8EE

	ADD #$01	 ; Boo accelerates!
	STA <Objects_YVelZ,X	 ; Update Boo's X velocity

Chase_Move:
	JSR Object_ApplyXVel	 ; Apply X velocity
	JSR Object_ApplyYVel	 ; Apply Y Velocity

	RTS

Object_FleePlayer:
	LDA Objects_InWater, X
	BEQ FleeDetermineX

	LDA Game_Counter
	AND #$03
	BEQ Flee_Move

FleeDetermineX:	
	JSR Object_XDistanceFromPlayer

	CPY #$01
	BNE FleeDetermineXRight

	LDA <Objects_XVelZ,X
	CMP ChaseVel_LimitLo,X	
	BEQ Flee_DetermineY	 ; If Boo is at his acceleration limit, jump to PRG002_A8EE

	ADD #$FF	 ; Boo accelerates!
	STA <Objects_XVelZ,X	 ; Update Boo's X velocity
	JMP Flee_DetermineY

FleeDetermineXRight:
	LDA <Objects_XVelZ,X
	CMP ChaseVel_LimitHi,X	
	BEQ Flee_DetermineY	 ; If Boo is at his acceleration limit, jump to PRG002_A8EE

	ADD #$01	 ; Boo accelerates!
	STA <Objects_XVelZ,X	 ; Update Boo's X velocity

Flee_DetermineY:
	JSR Object_YDistanceFromPlayer

	CPY #$01
	BNE FleeDetermineYUp

	LDA <Objects_YVelZ,X
	CMP ChaseVel_LimitLo,X	
	BEQ Flee_Move	 ; If Boo is at his acceleration limit, jump to PRG002_A8EE

	ADD #$FF	 ; Boo accelerates!
	STA <Objects_YVelZ,X	 ; Update Boo's X velocity
	JMP Flee_Move

FleeDetermineYUp:
	LDA <Objects_YVelZ,X
	CMP ChaseVel_LimitHi,X	
	BEQ Flee_Move	 ; If Boo is at his acceleration limit, jump to PRG002_A8EE

	ADD #$01	 ; Boo accelerates!
	STA <Objects_YVelZ,X	 ; Update Boo's X velocity

Flee_Move:
	JSR Object_ApplyXVel	 ; Apply X velocity
	JSR Object_ApplyYVel	 ; Apply Y Velocity

	RTS

FaceDirection: .byte $00, SPR_HFLIP

Object_MoveDirectionFacing:
	LDA Objects_Orientation, X
	AND #SPR_HFLIP
	BNE Object_MoveDirectionFacing1

	LDA #$F8
	STA <Objects_XVelZ, X
	RTS

Object_MoveDirectionFacing1:
	LDA #$08
	STA <Objects_XVelZ, X
	RTS

Object_FaceDirectionMoving:
	LDY #$00

	LDA <Objects_XVelZ, X
	BEQ Object_FaceDirectionMoving2
	BMI Object_FaceDirectionMoving1

	INY

Object_FaceDirectionMoving1:
	LDA Objects_Orientation, X
	AND #~SPR_HFLIP
	ORA FaceDirection, Y
	STA Objects_Orientation, X

Object_FaceDirectionMoving2:
	RTS


Object_FacePlayer:
	JSR Object_XDistanceFromPlayer

Object_FacePlayer1:
	LDA Objects_Orientation, X
	AND #~SPR_HFLIP
	ORA FaceDirection, Y
	STA Objects_Orientation, X
	RTS

AwayFromPlayerSpeed: .byte $08, -$08, $10, -$18
TowardsPlayerSpeed:	 .byte -$08, $08, -$10, $10

Object_FacePlayerOnLanding:
	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ Object_FacePlayerOnLanding1

	LDA Objects_PreviousTilesDetect, X
	AND #HIT_GROUND
	BNE Object_FacePlayerOnLanding1

	JSR Object_FacePlayer
	LDA TowardsPlayerSpeed,Y
	STA <Objects_XVelZ, X

Object_FacePlayerOnLanding1:
	RTS

Object_MoveTowardsPlayerFast:
	JSR Object_FacePlayer

	LDA TowardsPlayerSpeed + 2,Y
	STA <Objects_XVelZ, X
	RTS

Object_MoveTowardsPlayer:
	JSR Object_FacePlayer
	LDA TowardsPlayerSpeed,Y
	STA <Objects_XVelZ, X
	RTS

Object_MoveAwayFromPlayerFast:
	JSR Object_FacePlayer
	LDA AwayFromPlayerSpeed+2,Y
	STA <Objects_XVelZ, X
	RTS

Object_MoveAwayFromPlayer:
	JSR Object_FacePlayer
	LDA AwayFromPlayerSpeed,Y
	STA <Objects_XVelZ, X
	RTS

Object_HitWall:
	LDA <Objects_XVelZ, X
	BPL Object_HitWall1

	LDA <Objects_XZ, X
	ADD #$08
	AND #$F0
	STA <Objects_XZ, X

	LDA <Objects_XHiZ, X
	ADC #$00
	STA <Objects_XHiZ, X

	LDA #$00
	STA <Objects_XVelZ, X
	STA Objects_XVelFrac,X	 
	RTS

Object_HitWall1:
	LDA <Objects_XZ, X
	AND #$F0
	STA <Objects_XZ, X
	
	LDA #$00
	STA <Objects_XVelZ, X
	STA Objects_XVelFrac,X	 
	RTS


Object_EarnExp:
	LDA Objects_NoExp, X
	BNE Object_EarnExpRTS

	LDA #$30
	STA Kill_Tally_Ticker

	LDA Objects_ExpPoints, X
	LDY Player_EffectiveSuit
	BNE Add_KillyTally

	ADD Objects_ExpPoints, X

Add_KillyTally:	
	ADD Kill_Tally

	STA Kill_Tally
	STA Exp_Earned

	INC Kill_Count

Object_EarnExpRTS:
	RTS

Object_GetKilled:
	LDA Objects_State, X
	CMP #OBJSTATE_FROZEN
	BCC Object_KilledNormal

	JMP Frozen_Die

Object_KilledNormal:	
	LDA Objects_Health, X
	BMI KillEnemy

	LDA Objects_BehaviorAttr, X
	AND #ATTR_HASSHELL
	BEQ KillEnemy

	LDA #OBJSTATE_SHELLED
	STA Objects_State, X

	LDA #$00
	STA Objects_Health, X
	STA Objects_BeingHeld, X

	LDA #$ff
	STA Objects_Timer3,X

	LDA Objects_PlayerProjHit, X
	AND #HIT_TAIL
	BEQ ObjectNoFlipped

	LDA #$00
	STA Objects_PlayerProjHit, X

ObjectNoFlipped:	
	RTS

KillEnemy:
	JSR Object_EarnExp

	LDA Objects_State, X
	CMP #OBJSTATE_FROZEN
	BCC Kill_NotFrozen

	LDA <Kill_TypeCheck
	CMP #ATTR_ICEPROOF
	BEQ KillEnemy1

	JSR Object_BurstIce
	JMP Kill_CheckRespawn

Kill_NotFrozen:
	LDA #OBJSTATE_KILLED
	STA Objects_State,X

Kill_CheckRespawn:
	LDA Objects_Regen, X
	BEQ Kill_NoRespawn

	JSR Object_Respawn

Kill_NoRespawn:
	LDA Objects_BeingHeld, X
	BEQ KillEnemy1

KillEnemy1:
	; Set object Y velocity to -$40 (fly up after death)
	RTS

Object_Hold:
	LDA Player_Shell
	ORA Player_IsDying
	BNE Object_HoldRTS

	JSR Object_DetermineContactKill
	BCC Can_Hold
	CLC
	PLA
	PLA
	RTS

Can_Hold:
	LDA Player_InPipe
	BEQ Check_BHold

	LDA Objects_BeingHeld, X
	BNE Object_HoldRTS0
	BEQ Object_HoldRTS
	
Check_BHold:
	LDA <Pad_Holding
	AND #PAD_B
	BEQ Object_Kick

Assume_Hold:
	LDA Objects_BeingHeld, X
	BNE Object_HoldRTS0

	LDA Player_IsHolding
	BNE Object_HoldRTS

	LDA Objects_ID, X
	STA Objects_BeingHeld, X
	STA Player_IsHolding

	LDA #$00
	STA Player_Flip

	LDA Player_FlipBits
	AND #SPR_HFLIP
	STA <Temp_Var1

	LDA Objects_Orientation,X
	AND #~SPR_HFLIP
	ORA <Temp_Var1
	STA Objects_Orientation,X

Object_HoldRTS0:
	JSR Object_PositionHeld
	SEC
	RTS

Object_HoldRTS:
	CLC
	RTS

Object_XPreventStuck:
	.byte $0C, $F4
	.byte $00, $FF

Object_Kick:
	LDA Player_Shell
	BNE Object_KickRTS

	LDA Objects_BeingHeld, X
	BEQ Object_KickRTS

	JSR Object_GetKicked
	JSR Object_DetectTilesForced

	LDA Object_HorzTileProp, X
	CMP #(TILE_PROP_SOLID_ALL)
	BCS Object_ReverseXVel

	LDA Object_BodyTileProp, X
	CMP #(TILE_PROP_SOLID_ALL)
	BCC Object_KickRTS

Object_ReverseXVel:
	LDA Objects_State, X
	CMP #OBJSTATE_FROZEN
	BCS Do_Reverse
	
	CMP #OBJSTATE_NORMAL
	BNE Object_DieInstead

Do_Reverse:
	LDY Player_Direction
	LDA <Objects_XZ, X
	ADD Object_XPreventStuck, Y 
	STA <Objects_XZ, X

	LDA <Objects_XHiZ, X
	ADC Object_XPreventStuck + 2, Y
	STA <Objects_XHiZ, X

	LDA #$08
	STA Objects_Timer2, X
	RTS

Object_DieInstead:	
	LDA #$FF
	STA Objects_Health, X
	JSR Object_GetKilled

	PLA
	PLA
	SEC
	RTS

Object_KickNotWall:
Object_KickRTS:
	RTS

Object_Explode:
	LDA #OBJ_EXPLOSION
	STA Objects_ID, X

	LDA #$00
	STA Objects_Timer, X

	LDA #$08
	STA Objects_Timer2, X

	LDA #OBJSTATE_INIT
	STA Objects_State, X

	JSR Object_NoInteractions
	JMP Object_Respawn

Object_ChangeBlock:
	LDY Block_NeedsUpdate
	BEQ Object_ChangeBlock1
	CLC
	RTS

Object_ChangeBlock1:
	STA Block_UpdateValue
	INC Block_NeedsUpdate	 ; Store type of block change!

	LDA Block_DetectX
	AND #$F0
	STA Block_ChangeX

	LDA Block_DetectY
	AND #$F0		; Align to nearest grid coordinate
	STA Block_ChangeY

	LDA Block_DetectXHi
	STA Block_ChangeXHi

	LDA Block_DetectYHi
	STA Block_ChangeYHi
	
	SEC
	RTS

Object_BurstTile = Temp_Var1
Object_BurstPalette = Temp_Var2

Object_BurstBricks:
	LDA #BRICK_DEBRIS
	STA Object_BurstTile

	LDA #SPR_PAL3
	STA Object_BurstPalette
	JMP Object_Burst

Object_BurstIce:
	LDA #ICE_DEBRIS
	STA Object_BurstTile

	LDA #SPR_PAL2
	STA Object_BurstPalette
	JMP Object_Burst

Object_Burst:
	LDA Objects_SpritesHorizontallyOffScreen,X
	ORA Objects_SpritesVerticallyOffScreen,X
	BNE Object_Burst1


	JSR BrickBust_MoveOver	 ; Copy the bust values over (mainly because Bowser uses both)

	; Set the brick bust
	LDA #$02
	STA BrickBust_En

	; Brick bust upper Y
	LDA <Objects_YZ, X
	CLC
	SBC Vert_Scroll
	STA Brick_DebrisYHi

	; Brick bust lower Y
	ADD #$08
	STA Brick_DebrisY

	; Brick bust X
	LDA <Objects_XZ, X
	SUB <Horz_Scroll	
	STA Brick_DebrisX

	; reset brick bust X distance, no horizontal
	LDA #$00
	STA Brick_DebrisXDist
	STA BrickBust_HEn

	; Brick bust Y velocity
	LDA #-$06
	STA BrickBust_YVel

	LDA <Object_BurstTile
	STA BrickBust_Tile

	LDA <Object_BurstPalette
	STA BrickBust_Pal

Object_Burst1:
	JMP Object_Delete

Solid_Walls = Temp_Var8

ObjHit_SolidStand:
	LDA #$00
	STA <Solid_Walls

	LDA <HitTest_Result
	AND #HITTEST_BOTTOM
	BNE HitFrom_Top
	CLC
	RTS

ObjHit_SolidBlock:
	LDA #$01
	STA <Solid_Walls

	LDA <HitTest_Result
	AND #HITTEST_BOTTOM
	BEQ TestHit_FromBelow

HitFrom_Top:
	LDA Player_BoundBottom
	SUB Objects_BoundTop, X
	CMP #$07
	BCS TestHit_FromLeft

	LDY <Player_YVelZ
	BMI HitFrom_Top1

	STA <Temp_Var1

	LDA <Player_YZ
	SUB <Temp_Var1
	STA <Player_YZ

	LDA <Player_YHiZ
	SBC #$00
	STA <Player_YHiZ

	LDA #$00
	STA Player_InAir
	STA <Player_YVelZ

	LDA Objects_YVelFrac, X
	STA Player_YVelFrac

	LDA <Objects_YVelZ, X
	STA <Player_CarryYVel

	INC <Player_OnObject

HitFrom_Top1:
	SEC
	RTS

TestHit_FromBelow:
	LDA <HitTest_Result
	AND #HITTEST_TOP
	BEQ TestHit_FromLeft

	LDA <Player_YVelZ
	BPL TestHit_FromLeft

	LDA Objects_BoundBottom, X
	SUB Player_BoundTop
	CMP #$0F
	BCS TestHit_FromLeft
	STA <Temp_Var1

	LDA <Player_YZ
	ADD <Temp_Var1
	STA <Player_YZ

	LDA <Player_YHiZ
	ADC #$00
	STA <Player_YHiZ

	LDA #$10
	STA <Player_YVelZ
	CLC
	RTS

TestHit_FromLeft:
	LDA <Solid_Walls
	BEQ PlayerTestDone

	LDA <HitTest_Result
	AND #HITTEST_LEFT
	BEQ HitFrom_Right

	LDA Player_BoundRight
	SUB Objects_BoundLeft, X
	CMP #$05
	BCC TestHit_FromLeft1

	JSR Player_Die

TestHit_FromLeft1:
	LDA Player_BoundRight
	SUB Objects_BoundLeft, X
	STA <Temp_Var1

	LDA <Player_X
	SUB <Temp_Var1
	STA <Player_X

	LDA <Player_XHi
	SBC #$00
	STA <Player_XHi

	LDA <Player_XVelZ
	BEQ PlayerTestDone
	BMI PlayerTestDone

	LDA #$00
	STA <Player_XVelZ

	CLC
	RTS

HitFrom_Right:
	LDA <HitTest_Result
	AND #HITTEST_RIGHT
	BEQ PlayerTestDone

	LDA Objects_BoundRight, X
	SUB Player_BoundLeft
	CMP #$05
	BCC TestHit_FromRight1

	JSR Player_Die

TestHit_FromRight1:	
	
	LDA Objects_BoundRight, X
	SUB Player_BoundLeft
	STA <Temp_Var1

	LDA <Player_X
	ADD <Temp_Var1
	STA <Player_X

	LDA <Player_XHi
	ADC #$00
	STA <Player_XHi
	
	LDA <Player_XVelZ
	BEQ PlayerTestDone
	BPL PlayerTestDone

	LDA #$00
	STA <Player_XVelZ
	
PlayerTestDone:
	CLC
	RTS

Object_AttackXVel:
	.byte $09, $0C, $0D, $0D, $0D, $0D, $0D, $0D
	.byte $06, $0B, $0C, $0C, $0C, $0D, $0D, $0D
	.byte $04, $09, $0B, $0C, $0C, $0C, $0C, $0D
	.byte $03, $08, $0A, $0B, $0C, $0C, $0C, $0C
	.byte $03, $07, $09, $0A, $0B, $0C, $0C, $0C
	.byte $02, $06, $08, $0A, $0B, $0B, $0C, $0C
	.byte $02, $05, $07, $09, $0A, $0B, $0B, $0C
	.byte $02, $05, $07, $09, $0A, $0B, $0B, $0C


Object_AttackYVel:
	.byte $09, $04, $03, $02, $01, $01, $01, $01
	.byte $0B, $07, $05, $04, $03, $02, $02, $02
	.byte $0C, $09, $07, $05, $04, $03, $03, $03
	.byte $0C, $0A, $08, $06, $05, $04, $04, $03
	.byte $0D, $0B, $09, $07, $06, $05, $05, $04
	.byte $0D, $0B, $0A, $08, $07, $06, $05, $05
	.byte $0D, $0C, $0A, $09, $08, $07, $06, $05
	.byte $0D, $0C, $0A, $09, $08, $07, $06, $05


Object_AimProjectileRandom:
	STY TempY
	JSR Object_XDistanceFromPlayer
	STY <Temp_Var5

	JSR Object_YDistanceFromPlayer
	STY <Temp_Var6

	LDA RandomN
	AND #$3F
	JMP Object_AimProjectile0

Object_AimProjectile:
	STY TempY
	JSR Object_XDistanceFromPlayer
	STY <Temp_Var5
	LSR A
	LSR A
	LSR A
	LSR A
	LSR A
	STA <Temp_Var10

	JSR Object_YDistanceFromPlayer
	STY <Temp_Var6
	LSR A
	AND #$F8
	ORA <Temp_Var10
	
	CMP #$40
	BCC Object_AimProjectile0 ; if we're out of range, fire blindly

	LDA RandomN
	AND #$3F

Object_AimProjectile0:
	TAX
	LDY TempY
	LDA Object_AttackXVel, X
	STA SpecialObj_XVel, Y

	LDA Object_AttackYVel, X
	STA SpecialObj_YVel, Y

	LDX <CurrentObjectIndexZ
	LDA <Temp_Var5
	BNE Object_AimProjectile1

	LDA SpecialObj_XVel, Y
	EOR #$FF
	ADD #$01
	STA SpecialObj_XVel, Y

Object_AimProjectile1:
	LDA <Temp_Var6
	BNE Object_AimProjectile2

	LDA SpecialObj_YVel, Y
	EOR #$FF
	ADD #$01
	STA SpecialObj_YVel, Y

Object_AimProjectile2:	
	RTS

;Object_AimObjectRandom:
;	STY TempY
;	JSR Object_XDistanceFromPlayer
;	STY <Temp_Var5

;	JSR Object_YDistanceFromPlayer
;	STY <Temp_Var6

;	LDA RandomN
;	AND #$3F
;	JMP Object_AimObject0

;Object_AimObject:
;	STY TempY
;	JSR Object_XDistanceFromPlayer
;	STY <Temp_Var5
;	LSR A
;	LSR A
;	LSR A
;	LSR A
;	LSR A
;	STA <Temp_Var10

;	JSR Object_YDistanceFromPlayer
;	STY <Temp_Var6
;	LSR A
;	AND #$F8
;	ORA <Temp_Var10
	
;	CMP #$40
;	BCC Object_AimObject0 ; if we're out of range, fire blindly

;	LDA RandomN
;	AND #$3F

;Object_AimObject0:
;	TAY
	
;	LDA Object_AttackXVel, Y
;	STA <Objects_XVelZ, X

;	LDA Object_AttackYVel, Y
;	STA <Objects_YVelZ, X

;	LDA <Temp_Var5
;	BNE Object_AimObject1

;	LDA <Objects_XVelZ, X
;	EOR #$FF
;	ADD #$01
;	STA <Objects_XVelZ, X

;Object_AimObject1:
;	LDA <Temp_Var6
;	BNE Object_AimObject2

;	LDA <Objects_YVelZ, X
;	EOR #$FF
;	ADD #$01
;	STA <Objects_YVelZ, X

;Object_AimObject2:	
;	RTS

Object_ShootFireBallStraight:
	JSR Object_PrepProjectile
	BCC Object_ShootFireBallStraight1

	LDA #SOBJ_FIREBALL
	STA SpecialObj_ID, Y

	LDA #$01
	STA SpecialObj_Data1, Y
	SEC

Object_ShootFireBallStraight1:
	RTS

Object_PrepProjectile:
	JSR SpecialObject_FindEmpty
	CPY #$FF
	BNE Object_PrepProjectile1
	CLC
	RTS

Proj_YOff = Temp_Var1
Proj_XOff = Temp_Var2

Object_PrepProjectile1:
	LDA #$00
	STA SpecialObj_HurtEnemies, Y
	STA SpecialObj_Data1, Y
	STA SpecialObj_Data2, Y
	STA SpecialObj_Data3, Y
	STA SpecialObj_Stompable, Y
	STA SpecialObj_Timer, Y

	LDA <Objects_XZ, X
	ADD <Proj_XOff
	STA SpecialObj_X, Y

	LDA <Objects_XHiZ, X
	ADC #$00
	STA SpecialObj_XHi, Y

	LDA <Objects_YZ, X
	ADD <Proj_YOff
	STA SpecialObj_Y, Y

	LDA <Objects_YHiZ, X
	ADC #$00
	STA SpecialObj_YHi, Y

	SEC
	RTS

Object_IsHammerNinjaShellProof:
	LDA Objects_WeaponAttr, X
	AND #ATTR_SHELLPROOF
	RTS


Object_FlipFall:
	RTS

Object_FallAwayFromPlayer:
	LDA #$C0
	STA <Objects_YVelZ, X

	JMP Object_MoveAwayFromPlayer

Object_FlipFallAwayFromHit:
	LDA #$C0
	STA <Objects_YVelZ, X

	LDA Objects_Orientation, X
	ORA #SPR_VFLIP
	STA Objects_Orientation, X

	LDA <HitTest_Result
	AND #HITTEST_RIGHT
	BNE Object_FlipFallAwayFromHit1

	LDA #$04
	STA <Objects_XVelZ, X
	RTS

Object_FlipFallAwayFromHit1:
	LDA #$FC
	STA <Objects_XVelZ, X
	RTS

Object_DetermineContactKill:
	LDA Player_StarInv
	BEQ Check_FireDash

	LDA Objects_WeaponAttr, X
	AND #ATTR_INVINCIBLE
	BEQ Object_GetsHurt
	BNE Object_NotHurt

Check_FireDash:
	LDA Player_FireDash
	BEQ Check_ShellAttack

	LDA Objects_WeaponAttr, X
	AND #ATTR_DASHPROOF
	BEQ Object_GetsHurt
	BNE Object_NotHurt

Check_ShellAttack:
	LDA Player_Shell
	BEQ Object_NotHurt

	LDA Objects_BehaviorAttr, X
	AND #ATTR_SHELLPROOF
	BEQ Object_GetsHurt
	BNE Object_NotHurt
	
Object_GetsHurt:
	LDA #$FF
	STA Objects_Health, X
	
	JSR Object_GetKilled
	JSR Object_KickSound

	SEC
	RTS

Object_NotHurt:
	CLC
	RTS

Object_ApplyWindEffect:
	LDA Wind
	BEQ Object_NoWind

	LDA Objects_InWater, X
	BNE Object_NoWind

	LDA Objects_BehaviorAttr, X
	AND #ATTR_WINDAFFECTS
	BEQ Object_NoWind

	LDA Wind
	JSR Half_Value
	ADD <Objects_XVelZ, X
	STA Objects_EffectiveXVel, X
	SEC
	RTS

Object_NoWind:
	LDA <Objects_XVelZ, X
	STA Objects_EffectiveXVel, X
	CLC
	RTS

Object_EdgeMarch:
	LDA <Objects_XVelZ, X
	BEQ Object_EdgeMarchRTS

	LDA Objects_PreviousTilesDetect, X
	AND #HIT_GROUND
	BEQ Object_EdgeMarchRTS

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BNE Object_EdgeMarchRTS

	JSR Object_Reverse
	JSR Object_ApplyXVel

	;LDA #HIT_GROUND
	;STA <Objects_TilesDetectZ, X

Object_EdgeMarchRTS:
	RTS

Defeat_Sounds:
	.byte SND_PLAYERSWIM, SND_PLAYERKICK

Object_KickSound:
	LDY #$01
	BNE Object_MakeSound

Object_DefeatSound:
	LDY #$00
	LDA Objects_BehaviorAttr, X
	AND #ATTR_STOMPKICKSOUND
	BEQ Object_MakeSound

	INY

Object_MakeSound:
	LDA Sound_QPlayer 
	ORA Defeat_Sounds, Y
	STA Sound_QPlayer
	RTS

Object_NoInteractions:
	LDA #ATTR_ALLWEAPONPROOF
	STA Objects_WeaponAttr, X

	LDA #(ATTR_EXPLOSIONPROOF | ATTR_SHELLPROOF | ATTR_BUMPNOKILL)
	STA Objects_BehaviorAttr, X
	RTS