OBJ_8WAYBULLETBILLS 	= $B4	
OBJ_GREENCHEEPBEGIN		= $B5	
OBJ_GOLDENCHEEPSWARM	= $B6


; This spawns new objects as the screen scrolls, and also
; incidentally handles spawning the "bounced block" effect object
; if the Player just bounced off such a block... kind of weird to
; put those together, but I guess it has to go somewhere...
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Level_SpawnObjects:
	; Do scene-change-reset, if needed
	; NOTE!! Does NOT return here if it did!
	JSR Level_DoChangeReset	

	LDA <Object_SpawnScrollCount
	BPL Level_ObjectsSpawnByScroll

	LDA <Horz_Scroll
	AND #$F0
	CMP <Object_LastScrollColumn
	STA <Object_LastScrollColumn
	BNE Level_ObjectsSpawnByScrolling

	LDA <Object_SpawnColumnOffset
	ADD <Horz_Scroll
	AND #$F0
	STA <Spawn_Column

	LDA <Horz_Scroll_Hi
	ADC #$00
	STA <Spawn_ColumnHi

	LDA <Object_SpawnColumnOffset
	ADD #$10
	STA <Object_SpawnColumnOffset

	LDA <Spawn_Column
	SUB <Player_X
	CMP #$10
	BCC Level_SpawnObjectsRTS

	CMP #$F0
	BCS Level_SpawnObjectsRTS

	LDA #$01
	STA <Spawn_Dynamically
	JMP Level_ObjectsSpawnByColumn
	
Level_SpawnObjectsRTS:
	RTS	
	; This defines the values used as "look ahead" when screen is moving
	; Basically the values are $110 (one screen over + 16)
	; and -$20 (32 pixels to the left)
LOSBS_LookAhead:	.byte 16, -32
LOSBS_LookAheadHi:	.byte $01, $FF	; sign extensions
HARD_FLAG	= $20
DAY_FLAG		= $40
NIGHT_FLAG		= $60

Spawn_Column = Temp_Var6
Spawn_ColumnHi  = Temp_Var7
Spawn_Dynamically = Temp_Var16

Level_ObjectsSpawnByScrolling:
	LDA #$02
	STA <Object_SpawnScrollCount
	
Level_ObjectsSpawnByScroll:
	DEC <Object_SpawnScrollCount

	LDA #$00
	STA <Spawn_Dynamically

	LDY <Scroll_LastDir	 

	LDA <Horz_Scroll
	ADD LOSBS_LookAhead,Y
	AND #$f0
	STA <Temp_Var6	 ; Temp_Var6 = Horz_Scroll + LOSBS_LookAhead[Y] (appropriate "look ahead" values)

	LDA <Horz_Scroll_Hi
	ADC LOSBS_LookAheadHi,Y
	STA <Temp_Var7	 ; Temp_Var7 = "look ahead" high part

	CMP <Level_Width
	BEQ Level_ObjectsSpawnByColumn	
	BLT Level_ObjectsSpawnByColumn	 ; If the "high part" is <= the level width, jump to PRG005_B852

	JMP PRG005_B956	 ; Otherwise, at the end, jump to PRG005_B956 (RTS)

Level_ObjectsSpawnByColumn:
	LDX <Temp_Var7	 ; X = "look ahead" high part

	LDA Level_ObjIdxStartByScreen,X	 ; Get starting Level_Objects index for this screen
	BMI PRG005_B872	 ; If no objects on this screen, jump to PRG005_B872 (RTS)
 
	STA <Temp_Var2	 ; Starting index -> Temp_Var2
	TAX		 ; -> 'X'

	ASL A		 
	ADD <Temp_Var2	 ; Multiply by 3 (get to appropriate object)
	TAY		 ; -> 'Y'

	DEY		 ; Y-- (offset to object column, decrement to counteract Y += 3 on first pass)
	DEX		 ; X-- (basically to counteract following INX on first pass) 

PRG005_B863:
	INX		 ; X++ (next object index)

	INY
	INY
	INY		 ; Y += 3 (next object, aligned to "column" element)

	LDA Level_Objects,Y	 ; Get object column
	LSR A
	LSR A
	LSR A
	LSR A		 ; Divide by 16 to get "screen" (16 columns per screen)
	CMP <Temp_Var7	 
	BEQ PRG005_B873	 ; If object is on this "look ahead" screen, jump to PRG005_B873

PRG005_B872:
	RTS		 ; Return

PRG005_B873:
	LDA Level_Objects-1,Y	 ; Get object ID (we're aligned by column, hence -1)
	CMP #$ff	 
	BEQ PRG005_B872	 ; If this is the terminator, jump to PRG005_B872 (RTS)

	LDA Level_ObjectsSpawned,X 
	BMI PRG005_B863	 ; If this object is already currently spawned, jump to PRG005_B863 (skip to next object)

	AND <Spawn_Dynamically
	BNE PRG005_B863
	
	STX <LevelSpawn_IndexZ
	LDA Level_Objects,Y	 ; Get object column
	ASL A		 
	ASL A		 
	ASL A		 
	ASL A		 ; Multiply by 16 (make pixel position)
	CMP <Temp_Var6	 
	BNE PRG005_B863	 ; If object not equal to "look ahead" low component, jump to PRG005_B863 (skip to next object)

	; Object should be spawned...

	STX <Temp_Var2		 ; Backup object index -> Temp_Var2
	STA <Temp_Var1		 ; Backup pixel X position -> Temp_Var1

	LDA Level_Objects-1,Y	 ; Get object ID
	CMP #OBJ_AUTOSCROLL
	BNE PRG005_B8CB	 ; If object ID <> OBJ_AUTOSCROLL, jump to PRG005_B8CB

	TYA		 ; Level_Objects index -> 'A'
	PHA		 ; Save it

	JSR ObjAutoScroller_Init ; Initialization code for OBJ_AUTOSCROLL

	PLA
	TAY		 ; Restore Level_Objects index

PRG005_B8BE:
	LDX <Temp_Var2	 ; Restore object index

	LDA Level_ObjectsSpawned,X
	ORA #$81	 
	STA Level_ObjectsSpawned,X	; Mark object as already spawned (even though technically it isn't, but prevents re-triggering)

	JMP PRG005_B863	 ; Jump to PRG005_B863 (next object)

PRG005_B8CB:
	LDA Level_Objects-1,Y	 ; Get object ID

	CMP #OBJ_8WAYBULLETBILLS
	BLT PRG005_B909	 ; If object ID < OBJ_8WAYBULLETBILLS, jump to PRG005_B909


	LDY Spawn_Dynamically
	BNE PRG005_B863
	; All object IDs higher than OBJ_8WAYBULLETBILLS are handled specially:

	CMP #OBJ_CFIRE_BULLETBILL
	BLT PRG005_B902	 ; If object ID < OBJ_CFIRE_BULLETBILL, jump to PRG005_B902

	; Object ID >= OBJ_CFIRE_BULLETBILL...

	SBC #OBJ_CFIRE_BULLETBILL	 ; Zero base it
	ADD #$01	 ; +1 (because zero means "empty/unused" in Cannon Fire)
	STY TempY


	JSR ObjectGenerator_Init	 ; Initialize the Cannon Fire
	LDX <LevelSpawn_IndexZ

	JMP PRG005_B863	 ; Jump to PRG005_B863 (next object)

PRG005_B902:
	; Trigger Level_Event
	SUB #(OBJ_8WAYBULLETBILLS-1)	; Base at 1
	STA Level_Event	 		; Set Level_Event

	RTS		 ; Return

PRG005_B909:
	LDX #$04	 ; X = 4

PRG005_B913:

	LDA Objects_State,X	
	BEQ PRG005_B91E	 ; If this object slot is "dead/empty", jump to PRG005_B91E
	DEX		 ; X--
	BPL PRG005_B913	 ; While X >= 0, loop!
	JMP PRG005_B956	 ; Jump to PRG005_B956 (RTS)

PRG005_B91E:

	LDA <Spawn_Dynamically
	STA Objects_DynamicallySpawned, X
	
	; Set object X
	LDA <Temp_Var1
	STA <Objects_XZ,X

	LDA <Temp_Var7
	STA <Objects_XHiZ,X

	INY		 ; Y++ (different way of getting at row, I guess)

	LDA Level_Objects,Y
	AND #$E0
	LSR A
	LSR A
	LSR A
	LSR A
	LSR A
	STA Objects_Property, X

	; Upper 4 bits shifted right (high Y)
	LDA Level_Objects,Y	 ; Get object row
	AND #$10	 
	LSR A		 
	LSR A		 
	LSR A		 
	LSR A		 
	STA <Objects_YHiZ,X

	; Lower 4 bits shifted left (low Y)
	LDA Level_Objects,Y	 ; Get object row
	AND #$0f	 
	ASL A		 
	ASL A		 
	ASL A		 
	ASL A		 
	STA <Objects_YZ,X

	DEY		 
	DEY		 ; Y -= 2 (at object ID now)

	; Set object ID
	LDA Level_Objects,Y
	STA Objects_ID,X

	LDY <Temp_Var2			; Object index -> 'Y'

	; Mark this object as spawned
	LDA Level_ObjectsSpawned,Y
	ORA #$80
	STA Level_ObjectsSpawned,Y

	TYA		 ; Object index -> 'A'

	; Store original spawn index
	STA Objects_SpawnIdx,X

	; Set object state to 1
	INC Objects_State,X

PRG005_B956:
	RTS		 ; Return

	; OBJ_AUTOSCROLL specific initialization
	; Placing it on row $60 causes it to activate "water line" mode
	; This mode is used in 3-2 to have water tiles at the bottom
	; of the level.  Sprites do not appear below the line.  Only really
	; looks right when there's no vertical scrolling.
ObjAutoScroller_Init:
	LDA Level_Objects+1,Y
	AND #$E0
	LSR A
	LSR A
	LSR A
	LSR A
	LSR A

	STA Level_AScrlSelect
	
	LDA <Vert_Scroll
	STA Level_AScrlPosV	 ; Level_AScrlPosV = Vert_Scroll

	INC Level_HAutoScroll	 ; Level_HAutoScroll = 1 (enable auto horizontal scroll!)
	RTS		 ; Return



ObjectGenerator_Init:
	STA <Temp_Var16	 ; Store index value (1+)
	STY TempY

	LDX #$07

Find_EmptyGenerator:
	
	LDA ObjectGenerator_ID, X
	BEQ Found_EmptyGenerator

	DEX
	BPL Find_EmptyGenerator

	RTS

Found_EmptyGenerator:
	; Upper 4 bits shifted right -> ObjectGenerator_YHi (high Y)
	STY TempY

	LDA Level_Objects+1,Y	 ; Get object row
	AND #$10	 
	LSR A		 
	LSR A		 
	LSR A		 
	LSR A		 
	STA ObjectGenerator_YHi, X

	; Upper 4 bits shifted left -> ObjectGenerator_Y (low Y)
	LDA Level_Objects+1,Y	 ; Get object row
	AND #$0f	
	ASL A		
	ASL A		
	ASL A		
	ASL A		
	STA ObjectGenerator_Y, X

	LDA <Temp_Var7	
	STA ObjectGenerator_XHi, X	 ; ObjectGenerator_XHi = (pixel high X of object)

	LDA <Temp_Var1	
	STA ObjectGenerator_X, X	 ; ObjectGenerator_X = (pixel X position of object)

	LDA #$00
	STA ObjectGenerator_Var, X	; Clear Cannon Fire variable
	STA ObjectGenerator_Timer2, X	; Clear Cannon Fire timer 2

	LDA #$10
	STA ObjectGenerator_Timer, X	 ; ObjectGenerator_Timer = $00 or $60, depending on whether we're a 4-Way cannon

	LDA <Temp_Var16	
	STA ObjectGenerator_ID, X
	
	LDA Level_Objects+1,Y
	AND #$E0
	LSR A
	LSR A
	LSR A
	LSR A
	LSR A
	STA ObjectGenerator_Property, X

	LDY <LevelSpawn_IndexZ

	LDA Level_ObjectsSpawned,Y
	ORA #$80	
	STA Level_ObjectsSpawned,Y

	LDA <LevelSpawn_IndexZ
	STA ObjectGenerator_Parent, X

	LDY TempY
	
	RTS		 ; Return

Level_ObjectsSpawnByScrollV:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LevelEvent_Do
;
; Performs a "level event" based on the value of Level_Event
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LevelEvent_Do:
	LDA Level_Event	
	BEQ LevelEvent_DoRTS	 ; If no level event, jump to PRG005_BBBF (RTS)
	JSR DynJump	 ; Dynamic jump based on Level_Event... 
	
	; THESE MUST FOLLOW DynJump FOR THE DYNAMIC JUMP TO WORK!! 

	.word LevelEvent_DoNothing	; 0 - Do nothing (not used!)
	.word LevelEvent_8WayBulletBills	; 1 - $B4
	.word LevelEvent_ProduceMines	; 2 - $B5
	.word LevelEvent_SpawnGoldCheeps	; 3 - $B6
	.word LevelEvent_SpawnGoldYurarin	; 4 - $B7
	.word LevelEvent_SpawnBlooper	; 5 - $B8
	.word LevelEvent_WoodPlatforms	; 6 - Random wooden platforms 
	.word LevelEvent_TreasureBox	; 7 - Get a treasure box
	.word LevelEvent_Cancel		; 8 - Does nothing but clear Level_Event

GEN_CANCEL		= 0
GEN_8WAYBULLETS = 8
GEN_MINES		= 2
GEN_GOLDCHEEPS	= 3
GEN_GOLDYURARIN = 4
GEN_BLOOPERS	= 5

LevelEvent_DoNothing:
LevelEvent_DoRTS:
	RTS

CheepCheepXOffsets:
	.byte $E8, $F8, $08, $18, $E8, $F8, $08, $18

CheepCheepXHiOffsets
	.byte $FF, $FF, $00, $00, $00, $00, $01, $01

CheepCheepXVelocity:
	.byte $19, $16, $13, $10, $F0, $ED, $EA, $E7

CheepCheepTimers:
	.byte $80, $60, $80, $A0, $80, $60, $A0, $E0

LevelEvent_GenerateCheepCheeps:
	LDA Level_EventTimer
	BEQ GenerateCheepCheep

	DEC Level_EventTimer
	RTS

GenerateCheepCheep:
	LDA RandomN + 1
	AND #$07
	TAY

	LDA CheepCheepTimers, Y
	STA Level_EventTimer


	LDA #$00
	STA <Temp_Var1

	LDY #$04

CheepCheep_EnemyCount:
	LDA Objects_ID, Y
	LDA Objects_State, Y
	BEQ EnemyCount_NoInc

	INC <Temp_Var1

EnemyCount_NoInc:
	DEY
	BPL CheepCheep_EnemyCount

	LDA <Temp_Var1
	CMP #$03
	BCS GenerateCheepCheepRTS

	LDA RandomN
	AND #$07
	TAY

	JSR Object_FindEmptyX
	BCC GenerateCheepCheepRTS

	LDA #OBJSTATE_FRESH
	STA Objects_State, X

	LDA #OBJ_JUMPINGCHEEP
	STA Objects_ID,X


	LDA <Horz_Scroll
	ADD CheepCheepXOffsets, Y
	STA <Objects_XZ,X

	LDA <Horz_Scroll_Hi
	ADC CheepCheepXHiOffsets, Y
	STA <Objects_XHiZ,X

	LDA <Vert_Scroll
	ADD #$B0
	STA <Objects_YZ, X

	LDA <Vert_Scroll_Hi
	ADC #$00
	STA <Objects_YHiZ, X

	LDA CheepCheepXVelocity, Y
	STA <Objects_XVelZ, X

	LDA #$90
	STA <Objects_YVelZ, X
	STA Objects_NoExp, X

	LDA #$03
	STA Objects_Property, X

GenerateCheepCheepRTS:
	RTS

LevelEvent_Cancel:

PRG005_BBBF:
	RTS		 ; Return


WoodenPlatform_XVel:
	.byte -$04, -$08, -$06, -$08

LevelEvent_WoodPlatforms:
	LDA Game_Counter
	AND #$7f
	BNE PRG005_BC41	 ; Only do anything every 127 ticks

	;LDA #OBJ_PLATFORM_PATH
	JSR Level_CountNotDeadObjs
	CPY #$03
	BCS PRG005_BC41	 ; If there's already at least 3 wooden platforms, jump to PRG005_BC41 (RTS)

	JSR Level_SpawnObj	 ; Spawn new object (Note: If no slots free, does not return)

	; ?? ObjectID 0?
	LDA #$00
	STA Objects_ID,X

	LDA RandomN,X
PRG005_BBDF:
	AND #$7f
	ADD #$40
	ADD Level_VertScroll
	AND #$e0	; Locks to 32 pixel grid
	ORA #$0f
	STA <Temp_Var1	 ; Temp_Var1 = 64 + (Random 0 to 127), locked to 32 pixel grid with 15 offset
	PHP		 ; Save process status

	; Now comes a lengthy check to make sure that no wooden 
	; platform appears where another already is (vertically)
	LDY #$04
PRG005_BBF1:
	LDA Objects_State,Y
	BEQ PRG005_BC11	 ; If this object slot is "dead/empty", jump to PRG005_BC11

	LDA Objects_ID,Y
	;CMP #OBJ_PLATFORM_PATH
	BNE PRG005_BC11	 ; If this object slot is a OBJ_PLATFORM_PATH, jump to PRG005_BC11

	; This check specifically prevents two platforms from appearing in the same place
	LDA Objects_YZ,Y
	CMP <Temp_Var1	
	BNE PRG005_BC11	 ; If this object slot's Y position does not match what we generated, jump to PRG005_BC11

	; Random + $30
	LDA RandomN,X
	ADD #$30
	STA RandomN,X

	PLP		 ; Restore process status
	JMP PRG005_BBDF	 ; Jump to PRG005_BBDF

PRG005_BC11:
	DEY		 ; Y--
	BPL PRG005_BBF1	 ; While Y >= 0, loop!

	; Y coordinate checks out, assign!
	LDA <Temp_Var1
	STA <Objects_YZ,X
	PLP		 ; Restore process status
	LDA <Vert_Scroll_Hi
	ADC #$00
	STA <Objects_YHiZ,X

	; Set X coordinate
	LDA <Horz_Scroll
	ADD #$ff
	STA <Objects_XZ,X
	LDA <Horz_Scroll_Hi
	ADC #$00
	STA <Objects_XHiZ,X

	; Set X velocity
	LDA RandomN,X
	AND #$03
	TAY		 ; Y = random 0 to 3
	LDA WoodenPlatform_XVel,Y
	STA <Objects_XVelZ,X

	; Force palette 3
	LDA #SPR_PAL3
	STA Objects_SpriteAttributes,X

	; Set wooden platform ID at last
	;LDA #OBJ_PLATFORM_PATH
	STA Objects_ID,X

PRG005_BC41:
	RTS		 ; Return

LevelEvent_BooWaves:
	LDA Level_EventTimer
	BEQ BooWave_Generate	 
	
	DEC Level_EventTimer
	RTS

BooWave_Generate:
	LDA #OBJ_BOOWAVE
	STA <Object_Check

	JSR CheckObjectsOfType2

	LDA <Num_Objects
	CMP #$02
	BCS BooWave_GenerateRTS

	JSR Level_SpawnObj

	LDA #OBJSTATE_INIT
	STA Objects_State, X

	LDA #OBJ_BOOWAVE
	STA Objects_ID,X	 

	LDA #$DF
	STA Level_EventTimer

BooWave_GenerateRTS:
	RTS	

LevelEvent_TreasureBox:

	; Used as delay until collected box kicks back to map
	LDY LevelEvent_Cnt
	BEQ PRG005_BCB6	 ; If LevelEvent_Cnt = 0, jump to PRG005_BCB6

	DEC LevelEvent_Cnt	; LevelEvent_Cnt--
	BNE PRG005_BCB5	 	; If LevelEvent_Cnt <> 0, jump to PRG005_BCB5 (RTS)

	; Exit to map
	INC Level_ExitToMap
	LDA #$00
	STA Map_ReturnStatus

PRG005_BCB5:
	RTS		 ; Return

PRG005_BCB6:

	; The following loop limits the appearance of the treasure box
	; to only when there's no objects...
	LDY #$07	 ; Y = 7

PRG005_BCB8:
	LDA SpecialObj_ID,Y
	BNE PRG005_BCF4	 ; If special object slot <> 0 (dead/empty), jump to PRG005_BCF4 (RTS)

	CPY #$05
	BGE PRG005_BCCD	 ; If Y >= 5, jump to PRG005_BCCD

	LDA Objects_ID,Y
	CMP #OBJ_BIRDO	 
	BEQ PRG005_BCCD	 ; If object ID = OBJ_BIRDO (the Giant World block controller), jump to PRG005_BCCD

	LDA Objects_State,Y	
	BNE PRG005_BCF4	 ; If this object slot is not "dead/empty", jump to PRG005_BCF4

PRG005_BCCD:
	DEY		 ; Y--
	BPL PRG005_BCB8	 ; While Y >= 0, loop!

	; Set treasure box state to Init
	LDA #OBJSTATE_INIT
	STA Objects_State

	; Set treasure box ID
	LDA #OBJ_SPINTULA
	STA Objects_ID

	; Treasure box always appears at Y coordinate $0170
	LDA #$01
	STA <Objects_YHiZ
	LDA #$70
	STA <Objects_YZ

	; Treasure box attempts to appear roughly at left quarter of screen
	LDA #$30
	LDY <Player_X
	BMI PRG005_BCEA
	LDA #$c0
PRG005_BCEA:
	ADC <Horz_Scroll
	STA <Objects_XZ
	LDA <Horz_Scroll_Hi
	ADC #$00
	STA <Objects_XHiZ

PRG005_BCF4:
	RTS		 ; Return


BB8WayXVels:
	.byte -$16, -$20, -$16, $00, $16, $20,  $16, $00

BB8WayYVels:
	.byte -$16,  $00,  $16, $18, $16, $00, -$16, -$18

BB8WayXOffset:
	.byte $F8, $F8, $F8, $80, $00, $00, $00, $80

BB8WayYOffset:
	.byte $C0, $60, $00, $00, $00, $60, $C0, $C0

BB8Way_Timers:
	.byte $80, $60, $80, $A0

LevelEvent_8WayBulletBills:	
	LDA Level_EventTimer
	BEQ EightWay_Fire

	DEC Level_EventTimer
	RTS

EightWay_Fire:
	LDA EventType
	CMP #EVENT_8WAY_BULLETS
	BNE EightWay_CanFire

	LDA TrapSet
	BEQ EightWay_RTS

EightWay_CanFire:
	LDA RandomN
	AND #$C0
	
	LSR A
	LSR A
	LSR A
	LSR A
	LSR A
	LSR A

	TAX

	LDA BB8Way_Timers, X
	STA Level_EventTimer

	JSR Level_SpawnObj	 ; Spawn new object (Note: If no slots free, does not return)

	LDA #OBJSTATE_FRESH
	STA Objects_State, X

	LDA #OBJ_BULLETBILL
	STA Objects_ID,X

	LDA RandomN
	AND #$07

	CMP Last_EventGen
	BNE EightWay_NotSame
	ADD #$04
	AND #$07
	
EightWay_NotSame:
	STA Last_EventGen
	TAY

	LDA Level_VertScroll
	ADD BB8WayYOffset, Y
	STA <Objects_YZ,X

	LDA <Vert_Scroll_Hi
	ADC #$00
	STA <Objects_YHiZ,X

	
	LDA <Horz_Scroll 	; Horz_Scroll + X offset
	ADD BB8WayXOffset, Y
	STA <Objects_XZ,X	; Store as object's X

	; Apply carry as needed
	LDA <Horz_Scroll_Hi
	ADC #$00
	STA <Objects_XHiZ,X
	
	LDA BB8WayXVels, Y
	STA <Objects_XVelZ,X	 ; Set X velocity

	LDA BB8WayYVels, Y
	STA <Objects_YVelZ,X	 ; Set Y velocity = -$48

	LDA Sound_QLevel1
	ORA #SND_LEVELBABOOM
	STA Sound_QLevel1

	STA Objects_NoExp, X

EightWay_RTS:
	RTS		 ; Return


LevelEvent_ProduceMines:
	LDA Level_EventTimer
	BEQ LevelEvent_ProduceMinesMake
	
	DEC Level_EventTimer
	RTS

LevelEvent_ProduceMinesMake:
	LDA <Player_HaltGameZ
	BNE LevelEvent_ProduceMinesRTS

	JSR Level_SpawnObj

	LDA #OBJ_FLOATMINE
	STA Objects_ID,X

	LDA #OBJSTATE_FRESH
	STA Objects_State, X
	
	LDA <Horz_Scroll
	STA <Objects_XZ, X

	LDA <Horz_Scroll_Hi
	ADD #$01
	STA <Objects_XHiZ, X
	
	LDA #$07
	STA Objects_Property, X
	
	LDA <Player_YZ
	STA <Objects_YZ, X

	LDA <Player_YHiZ
	STA <Objects_YHiZ, X

	LDA #$D0
	STA <Objects_XVelZ, X

	LDA #$80
	STA Level_EventTimer

LevelEvent_ProduceMinesRTS:
	RTS		 ; Return

LevelEvent_SpawnGoldCheeps:
	LDA <Horz_Scroll_Hi
	CMP #$0E
	BEQ LevelEvent_SpawnGoldCheepsRTS

	LDA Level_EventTimer
	BEQ Generate_GoldCheep
	
	DEC Level_EventTimer

LevelEvent_SpawnGoldCheepsRTS:	
	RTS

GoldCheep_YVel:
	.byte $00, $E8

GoldCheep_Timer:
	.byte $FF, $EF, $DF, $CF, $AF, $9F, $8F, $80
	.byte $80, $80, $80, $80, $80, $80, $80, $80

Generate_GoldCheep:	
	JSR Level_SpawnObj	 ; Spawn new object (Note: If no slots free, does not return)

	; Set Spike Cheep's object ID
	LDA #OBJ_GOLDCHEEPCHEEP
	STA Objects_ID,X
	
	LDA #OBJSTATE_INIT
	STA Objects_State, X

	LDA RandomN
	AND #$01
	TAY
	
	LDA GoldCheep_YVel, Y
	STA <Objects_YVelZ, X

	LDA <Player_YZ
	SUB #$18
	STA <Objects_YZ, X

	LDA <Player_YHiZ
	SBC #$00
	STA <Objects_YHiZ, X
	
	LDA <Horz_Scroll
	STA <Objects_XZ, X

	LDA <Horz_Scroll_Hi
	ADD #$01
	STA <Objects_XHiZ, X

	LDY Horz_Scroll_Hi
	LDA GoldCheep_Timer, Y
	STA Level_EventTimer
	RTS		 ; Return

LevelEvent_SpawnGoldYurarin:
	LDA <Horz_Scroll_Hi
	CMP #$0E
	BEQ LevelEvent_SpawnGoldYurarinRTS


Try_SpawnGoldYurarin:	
	LDA Level_EventTimer
	BEQ Generate_YurarinCheep
	
	DEC Level_EventTimer

LevelEvent_SpawnGoldYurarinRTS:
	RTS

GoldYurarin_YVel:
	.byte $00, $E8

GoldYurarin_Timer:
	.byte $FF, $EF, $EF, $DF, $DF, $CF, $CF, $B0
	.byte $A0, $90, $90, $80, $80, $80, $80, $80

Generate_YurarinCheep:	
	JSR Level_SpawnObj	 ; Spawn new object (Note: If no slots free, does not return)

	; Set Spike Cheep's object ID
	LDA #OBJ_YURARIN
	STA Objects_ID,X

	LDA #$02
	STA Objects_Property, X
	
	LDA #OBJSTATE_INIT
	STA Objects_State, X

	LDA RandomN
	AND #$01
	TAY
	
	LDA GoldYurarin_YVel, Y
	STA <Objects_YVelZ, X

	LDA <Player_YZ
	SUB #$18
	STA <Objects_YZ, X

	LDA <Player_YHiZ
	SBC #$00
	STA <Objects_YHiZ, X
	
	LDA <Horz_Scroll
	STA <Objects_XZ, X

	LDA <Horz_Scroll_Hi
	ADD #$01
	STA <Objects_XHiZ, X

	LDY Horz_Scroll_Hi
	LDA GoldYurarin_Timer, Y
	STA Level_EventTimer
	RTS		 ; Return


LevelEvent_SpawnBlooper:
	LDA <Horz_Scroll_Hi
	CMP #$0E
	BEQ LevelEvent_SpawnBlooperRTS


Try_SpawnBlooper:	
	LDA Level_EventTimer
	BEQ Generate_Blooper
	
	DEC Level_EventTimer

LevelEvent_SpawnBlooperRTS:
	RTS

Generate_BlooperTimer:
	.byte $FF, $EF, $EF, $DF, $DF, $CF, $CF, $B0
	.byte $A0, $90, $90, $80, $80, $80, $80, $80

Generate_BlooperY:
	.byte $40, $60, $80, $A0

Generate_Blooper:	
	JSR Level_SpawnObj	 ; Spawn new object (Note: If no slots free, does not return)

	; Set Spike Cheep's object ID
	LDA #OBJ_BLOOPER
	STA Objects_ID,X

	LDA #OBJSTATE_INIT
	STA Objects_State, X

	LDA RandomN
	AND #$03
	TAY

	LDA <Vert_Scroll
	ADD Generate_BlooperY, Y
	STA <Objects_YZ, X

	LDA <Vert_Scroll_Hi
	ADC #$00
	STA <Objects_YHiZ, X
	
	LDA <Horz_Scroll
	STA <Objects_XZ, X

	LDA <Horz_Scroll_Hi
	ADD #$01
	STA <Objects_XHiZ, X

	LDY Horz_Scroll_Hi
	LDA Generate_BlooperTimer, Y
	STA Level_EventTimer
	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Level_SpawnObj	-- slots 0 - 4
; Level_SpawnObjSetMax	-- slots 0 - input X register
;
; This function "spawns" a new object (finds an empty object slot 
; from slots 0 - 4 (or custom) and preps it for normal operation.)
; Does not set up X, Y, ID, etc -- this is the responsibility of
; the caller to do so.
; NOTE!! If no slot is free, this function does NOT RETURN TO
; THE CALLER!! So no additional logic checking is necessary.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Level_SpawnObj:
	LDX #$04	 ; X = 4

Level_SpawnObjSetMax:
	LDA Objects_State,X	 ; Check the state of this object slot

	BEQ PRG005_BE26	 ; If this object slot is "dead/empty", jump to PRG005_BE26

	DEX		 ; X--
	BPL Level_SpawnObjSetMax	 ; While X >= 0, loop!

	; When no slots are open, does not return to caller!
	PLA		 
	PLA		 ; Do not return to caller!!

	RTS		 ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Level_CountNotDeadObjs
;
; This function counts the number of objects that are not in the
; "dead/empty" state in object slots 0 - 4
; It also sets X = CurrentObjectIndexZ
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Level_CountNotDeadObjs:
	STA <Temp_Var1	 ; Store object ID we're hunting for -> Temp_Var1

	LDY #$00	 ; Y = 0 (count how many of this object already exist)
	LDX #$04	 ; X = 4

PRG005_BE13:
	LDA Objects_State,X
	BEQ PRG005_BE20	 ; If this object slot is "dead", jump to PRG005_BE20

	LDA Objects_ID,X
	CMP <Temp_Var1	
	BNE PRG005_BE20	 ; If this object slot does not have the same ID as what was input, jump to PRG005_BE20

	INY		 ; Otherwise, increment count

PRG005_BE20:
	DEX		 ; X--
	BPL PRG005_BE13	 ; While X >= 0, loop!

	LDX <CurrentObjectIndexZ	 ; X = CurrentObjectIndexZ
	RTS		 ; Return


PRG005_BE26:
	JSR Object_New	 ; Prepare new object!

	LDA #OBJSTATE_NORMAL
	STA Objects_State,X	 ; Objects_State[X] = OBJSTATE_NORMAL (item alive, default state)

	RTS		 ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Level_DoChangeReset
;
; Whenever a new "scene" of a level is entered into, the initial
; screen needs to be set up (clears old objects out, spawns new
; ones in!)  This activates only when Level_ObjectsInitialized = 0!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Level_DoChangeReset: 
	LDA Level_ObjectsInitialized
	BEQ PRG005_BE35	 ; If Level_ObjectsInitialized not set, jump to PRG005_BE35

	RTS		 ; Return

PRG005_BE35:

	LDY #$09	 	; Y = 9

PRG005_BE37:
	STA SpecialObj_ID,Y	; Set special object ID to 0

	CPY #$08	 
	BGE PRG005_BE41	 	; If Y >= 8, jump to PRG005_BE41

	LDX Level_KeepObjects
	BNE PRG005_BE41
	STA ObjectGenerator_ID,Y

PRG005_BE41:
	CPY #$05
	BGE PRG005_BE4B	 ; If Y >= 5, jump to PRG005_BE4B


PRG005_BE4B:
	CPY #$03
	BEQ PRG005_BE64	 	; If Y = 3, jump to PRG005_BE64
	BGE PRG005_BE67	 	; If Y > 3, jump to PRG005_BE67

	STA BrickBust_En,Y	; Clear any brick busting effects

	CPY #$02
	BGE PRG005_BE64	 	; If Y >= 2, jump to PRG005_BE64

	STA Buffer_Occupied,Y 	; Clear the buffer occupation flags
	STA PlayerProj_ID,Y 	; Clear Player projectiles

PRG005_BE64:
	STA CoinPUp_State,Y	; Clear power-up coin state

PRG005_BE67:
	DEY		 ; Y--
	BPL PRG005_BE37	 ; While Y >= 0, loop

	; Clear a bunch of stuff!
	STA EndCard_Flag
	STA RotatingColor_Cnt
	STA Player_TwisterSpin
	STA Level_Vibration
	STA Vert_Scroll_Off
	STA Player_VibeDisable
	STA Level_Event	
	STA LevelEvent_Cnt
	STA Splash_DisTimer
	STA Level_ScrollDiffH
	STA Wind
	STA WeatherActive
	STA Level_ScrollDiffV

	INC Top_Needs_Redraw
	INC Bottom_Needs_Redraw

	LDX Level_KeepObjects
	BNE PRG005_BE91

	; Clear Level_ObjectsSpawned (nothing spawned)
	LDY #$2f	 ; Y = $2F

PRG005_BE90:
	STA Level_ObjectsSpawned,Y
	DEY		 ; Y--
	BPL PRG005_BE90	 ; While Y >= 0, loop!

PRG005_BE91:
	LDY #$FF
	STY Level_ObjectsInitialized
	STA Level_ObjIdxStartByScreen
	STA Player_InWater
	STA Air_Change
	STA Power_Change
	STA AScrlURDiag_WrapState_Copy
	STA AScrlURDiag_WrapState
	STA Level_AScrlVVel
	STA <Temp_Var1

	TAX		 ; X = 0

	TAY
	INY		 ; Y = 1

PRG005_BEB6:
	CPX #$10	 
	BEQ PRG005_BEFC	 ; If X = $10, jump to PRG005_BEFC
 
	LDA Level_Objects,Y
	CMP #$ff	 
	BEQ PRG005_BEE5	 ; If terminator, jump to PRG005_BEE5

	LDA Level_Objects+1,Y	; Get object column

PRG005_BECE:
	LSR A
	LSR A
	LSR A
	LSR A		 ; Get appropriate screen offset
	STA <Temp_Var2	 ; -> Temp_Var2

	CPX <Temp_Var2	
	BNE PRG005_BEE5	 ; If X <> screen offset, jump to PRG005_BEE5

	INC <Temp_Var1	 ; Temp_Var1++

	LDA <Temp_Var1	
	STA Level_ObjIdxStartByScreen+1,X ; Calculated first object index for next screen

	INY
	INY 
	INY		 ; Y += 3 (next object)
	JMP PRG005_BEB6	 ; Jump to PRG005_BEB6

PRG005_BEE5:
	LDA <Temp_Var1	 

	CPX #$0f	 
	BEQ PRG005_BEEE	 ; If X = $F, jump to PRG005_BEEE

	STA Level_ObjIdxStartByScreen+1,X ; Calculated first object index for next screen

PRG005_BEEE:
	CMP Level_ObjIdxStartByScreen,X	 
	BNE PRG005_BEF8	 ; If Level_ObjIdxStartByScreen[X] <> 0, jump to PRG005_BEF8

	LDA #$ff	 
	STA Level_ObjIdxStartByScreen,X	 ; Level_ObjIdxStartByScreen[X] = $FF (means no objects this screen)

PRG005_BEF8:
	INX		 ; X++
	JMP PRG005_BEB6	 ; Jump to PRG005_BEB6

	; Clear all object states

Check_GlobalHeld:
	LDA Objects_BeingHeld, X
	BEQ PRG005_BF01

	LDA <Player_X
	STA <Objects_XZ, X

	LDA <Player_XHi
	STA <Objects_XHiZ, X

	LDA <Player_YZ
	STA <Objects_YZ, X

	LDA <Player_YHiZ
	STA <Objects_YHiZ, X
	JMP PRG005_BF01

PRG005_BEFC:
PRG005_BEFD:
	LDX #$07	 ; X = 7

PRG005_BF001:
	LDA Objects_ID, X
	LDA Objects_Global, X
	BNE Check_GlobalHeld

	LDA Level_KeepObjects
	BEQ PRG005_BF002

	LDA Objects_State, X
	CMP #OBJSTATE_NORMAL
	BNE PRG005_BF002
	
	JSR Object_SetDeadAndNotSpawned

PRG005_BF002:
	LDA #OBJSTATE_DEADEMPTY
	STA Objects_State,X	 ; Clear object state
	STA Objects_BeingHeld, X

PRG005_BF01:
	DEX		 ; X--
	BPL PRG005_BF001	 ; While X >= 0, loop!

PRG005_BF02:
	;LDA #$4f	 
	;STA PatTable_BankSel+5	 ; Set sixth pattern table to $4F

	LDA <Horz_Scroll
	PHA		 ; Save Horz_Scroll

	LDA LOSBS_LookAhead	 ; $10
	SUB LOSBS_LookAhead+1	 ; $10 - $E0 = $30

	; Adds $130 to Horz_Scroll/Hi (basically one screen over to the right of the start)

	ADD <Horz_Scroll ; Horz_Scroll += $30

	AND #$f0	 ; Align to grid

	STA <Temp_Var14	 ; -> Temp_Var14

	LDA <Horz_Scroll_Hi
	PHA		 ; Save Horz_Scroll_Hi

	ADC LOSBS_LookAheadHi	 ; Add 1 with carry (LOSBS_LookAheadHi = 1)
	STA <Temp_Var15	 ; -> Temp_Var15

	LDA #$01
	STA <Scroll_LastDir	 ; Scroll_LastDir = 1 (screen last moved left)

	JSR GraphicsBuf_Prep_And_WaitVSync
	
	; Fake leftward scroll by 16
	LDA <Horz_Scroll
	SUB #16
	STA <Horz_Scroll	; Horz_Scroll -= $10

	BCS PRG005_BF49	 	; If carry set, jump to PRG005_BF49
	DEC <Horz_Scroll_Hi	; Apply carry

	; This loop spawns all objects which should be visible at the initial
	; screen of the level by pretending to scroll a whole screen's worth

PRG005_BF49:

	LDA <Horz_Scroll
	ADC #$10
	AND #$f0
	STA <Horz_Scroll ; Horz_Scroll += $10, aligned to grid

	BCC PRG005_BF55	 ; If no carry, jump to PRG005_BF55
	INC <Horz_Scroll_Hi	 ; Apply carry

PRG005_BF55:

	; Ensures all objects that should appear on the initial screen, will appear
	JSR Level_ObjectsSpawnByScroll
	JSR Level_ObjectsSpawnByScroll
	JSR Level_ObjectsSpawnByScroll

	LDA <Temp_Var15
	CMP <Horz_Scroll_Hi
	BNE PRG005_BF49	 ; If we haven't reached the high target yet, loop

	LDA <Temp_Var14	
	CMP <Horz_Scroll
	BNE PRG005_BF49	 ; If we haven't reached the low target yet, loop

	PLA
	STA <Horz_Scroll_Hi	 ; Restore Horz_Scroll_Hi

	PLA
	STA <Horz_Scroll	 ; Restore Horz_Scroll

	; Do not return to caller!!
	PLA
	PLA

	RTS		 ; Return

CheckObjectsOfType2:
	LDA #$00
	STA <Num_Objects

	LDX #$04

CheckNextObject2:
	LDA Objects_State, X
	BEQ NotObject_Checking2

	LDA Objects_ID, X
	CMP <Object_Check
	BNE NotObject_Checking2

	INC <Num_Objects

NotObject_Checking2:
	DEX
	BPL CheckNextObject2
	RTS
; Rest of ROM bank was empty...