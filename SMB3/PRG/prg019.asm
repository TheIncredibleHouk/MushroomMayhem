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

	LDA #$00
	STA Level_ObjectsSpawned,X	; Mark object as already spawned (even though technically it isn't, but prevents re-triggering)

	JMP PRG005_B863	 ; Jump to PRG005_B863 (next object)

PRG005_B8CB:
	LDA Level_Objects-1,Y	 ; Get object ID

	CMP #OBJ_8WAYBULLETBILLS
	BLT PRG005_B909	 ; If object ID < OBJ_8WAYBULLETBILLS, jump to PRG005_B909


	LDX Spawn_Dynamically
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

	LDA Level_Objects+1,Y
	AND #$E0
	LSR A
	LSR A
	LSR A
	LSR A
	LSR A
	STA Level_EventProperty

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
	.word LevelEvent_GenerateCheepCheeps	; 6 - $B9 Random wooden platforms 
	.word LevelEvent_Ruster	; 7 - $BA Ruster generator
	.word LevelEvent_Snifit	; 8 - $BB Snifit generator
	.word LevelEvent_BooWaves ; 9 - NO OBJECT
	.word LevelEvent_CoinAlert ; A - NO OBJECT
	

GEN_CANCEL		= 0
GEN_8WAYBULLETS = 8
GEN_MINES		= 2
GEN_GOLDCHEEPS	= 3
GEN_GOLDYURARIN = 4
GEN_BLOOPERS	= 5
GEN_SWOOPERS	= 9
GEN_COINALERT	= 10

LevelEvent_DoNothing:
LevelEvent_DoRTS:
	RTS

CheepCheepXOffsets:
	.byte $F0, $00, $10, $20, $E0, $F0, $08, $10

CheepCheepXHiOffsets
	.byte $FF, $FF, $00, $00, $00, $00, $01, $01

CheepCheepXVelocity:
	.byte $14, $10, $0C, $08, $F8, $F4, $F0, $EC

CheepCheepTimers:
	.byte $80, $80, $A0, $60, $60, $A0, $80, $40

LevelEvent_GenerateCheepCheeps:
	LDA Level_EventTimer
	BEQ GenerateCheepCheep

	DEC Level_EventTimer
	RTS

GenerateCheepCheep:
	LDA RandomN + 1
	AND #$07
	TAY

	LDA #$40
	STA Level_EventTimer

	LDA #OBJ_JUMPINGCHEEP
	STA <Object_Check

	JSR CheckObjectsOfType2

	LDA <Num_Objects
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

	LDA #$98
	STA <Objects_YVelZ, X

	LDA #$01
	STA Objects_ExpPoints, X

	LDA #$03
	STA Objects_Property, X

	LDA #$02
	STA Objects_SlowFall, X

	LDA Level_EventProperty
	BNE GenerateCheepCheep_AntiGrav

GenerateCheepCheepRTS:
	RTS

GenerateCheepCheep_AntiGrav:
	LDA #$04
	STA Objects_Property, X

	LDA <Objects_YZ, x
	SUB #$B0
	STA <Objects_YZ, X

	LDA <Objects_YHiZ, X
	SBC #$00
	STA <Objects_YHiZ, X

	LDA <Objects_YVelZ, X
	JSR Negate
	STA <Objects_YVelZ, X
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

LevelEvent_Ruster:
	LDA Level_EventTimer
	BEQ LevelEvent_RusterCheck

	DEC Level_EventTimer
	RTS
 
LevelEvent_RusterCheck:
	LDA #$00
	STA <Temp_Var1

Ruster_CountLoop:	
	LDA #OBJ_RUSTER
	STA <Object_Check

	JSR CheckObjectsOfType2

	LDA <Num_Objects
	CMP #$03
	BCS LevelEvent_RusterRTS

	JSR Level_SpawnObj

	LDA #OBJ_RUSTER
	STA Objects_ID, X

	LDA #$01
	STA Objects_Property, X

	LDA #$01
	STA Ruster_Attacked, X
	STA Ruster_Reps, X

	LDA <Vert_Scroll
	STA Objects_YZ, X

	LDA #$00
	STA <Objects_YHiZ, X

	LDA <Horz_Scroll
	STA <Objects_XZ, X

	LDA RandomN
	AND #$01
	ADD <Horz_Scroll_Hi
	STA <Objects_XHiZ, X

	LDA #OBJSTATE_FRESH
	STA Objects_State, X

LevelEvent_RusterRTS:	
	LDA #$C0
	STA Level_EventTimer
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
	.byte $FF, $F8, $E8, $E0, $D8, $D0, $C8, $C0, $B8, $B0, $A8, $A0, $98, $90, $88, $80

LevelEvent_8WayBulletBills:
	LDA <Player_HaltGameZ
	BNE EightWay_FireRTS

	LDA Level_EventTimer
	BEQ EightWay_Fire

	DEC Level_EventTimer

EightWay_FireRTS:	
	RTS

EightWay_Fire:
	LDA EventType
	CMP #EVENT_8WAY_BULLETS
	BNE EightWay_CanFire

	LDA TrapSet
	BEQ EightWay_RTS

EightWay_CanFire:
	LDX <Horz_Scroll_Hi

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

	LDA #$01
	STA Objects_ExpPoints, X

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
	ADD #$08
	STA <Objects_YZ, X

	LDA <Player_YHiZ
	ADC #$00
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
	LDA #OBJ_BLOOPER
	STA <Object_Check

	JSR CheckObjectsOfType2

	LDA <Num_Objects
	CMP #$02
	BCS LevelEvent_SpawnBlooperRTS

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
	STA Tile_DetectionY

	LDA <Vert_Scroll_Hi
	ADC #$00
	STA <Objects_YHiZ, X
	STA Tile_DetectionYHi
	
	LDA <Horz_Scroll
	STA <Objects_XZ, X
	STA Tile_DetectionX

	LDA <Horz_Scroll_Hi
	ADD #$01
	STA <Objects_XHiZ, X
	STA Tile_DetectionXHi

	JSR Object_DetectTile
	LDA Tile_LastProp
	CMP #TILE_PROP_SOLID_ALL
	BCC Blooper_Generate

	JSR Object_Delete

Blooper_Generate:
	LDY Horz_Scroll_Hi
	LDA Generate_BlooperTimer, Y
	STA Level_EventTimer
	RTS		 ; Return

LevelEvent_Snifit:
	LDX #$07

Snifit_CheckDimmer:
	LDA SpinnerBlocksTimers, X
	BNE Snifit_GeneratorActive

	DEX
	BPL Snifit_CheckDimmer

	LDA #$00
	STA Level_EventTimer
	RTS

Snifit_GeneratorActive:
	LDA Level_EventTimer
	BEQ Generate_Snifit	

	DEC Level_EventTimer
	RTS

Snifit_GenSideXOffset:
	.byte $40, $C0
	.byte $00, $FF

Generate_Snifit:
	LDA #OBJ_SNIFIT
	STA <Object_Check

	JSR CheckObjectsOfType2

	LDA <Num_Objects
	CMP #$01
	BCC Generate_SnifitDo

	RTS

Snifit_SpawnXOffset:
	.byte $60, $A0
	.byte $00, $FF

Generate_SnifitDo:
	LDA RandomN, X
	AND #$01
	TAY

	LDA <Player_X
	ADD Snifit_SpawnXOffset, Y
	STA Tile_DetectionX

	LDA <Player_XHi
	ADC Snifit_SpawnXOffset + 2, Y
	STA Tile_DetectionXHi

	LDA <Player_YZ
	SUB #$30
	STA Tile_DetectionY

	LDA <Player_YHiZ
	SBC #$00
	STA Tile_DetectionYHi

	JSR Object_DetectTile

	LDA Tile_LastProp
	CMP #TILE_PROP_SOLID_ALL
	BCC Snifit_Spawn

	RTS

Snifit_Spawn:
	JSR Level_SpawnObj

	LDA #OBJ_SNIFIT
	STA Objects_ID, X

	LDA #OBJSTATE_FRESH
	STA Objects_State, X

	LDA #$00
	STA Objects_Property, X

	LDA Tile_DetectionX
	STA <Objects_XZ, X
	STA <Poof_X

	LDA Tile_DetectionXHi
	STA <Objects_XHiZ, X

	LDA Tile_DetectionY
	STA <Objects_YZ, X
	STA <Poof_Y

	LDA Tile_DetectionYHi
	STA <Objects_YHiZ, X
	
	JSR Common_MakePoof

	LDA #$80
	STA Level_EventTimer
	RTS
	
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
	STA Level_Vibration
	STA Vert_Scroll_Off
	STA Player_VibeDisable
	STA Level_Event	
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

	JSR SetObjects_SpawnPoints
	JMP PRG005_BEFD

SetObjects_SpawnPoints:
	LDA #$00
	STA <Temp_Var1
	TAX		 ; X = 0

	LDY #$01

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
	RTS

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
	STA <Horz_Scroll_Backup		 ; Save Horz_Scroll

	LDA LOSBS_LookAhead	 ; $10
	SUB LOSBS_LookAhead+1	 ; $10 - $E0 = $30

	; Adds $130 to Horz_Scroll/Hi (basically one screen over to the right of the start)

	ADD <Horz_Scroll ; Horz_Scroll += $30

	AND #$f0	 ; Align to grid

	STA <Temp_Var14	 ; -> Temp_Var14

	LDA <Horz_Scroll_Hi
	STA <Horz_ScrollHi_Backup		 ; Save Horz_Scroll_Hi

	ADC LOSBS_LookAheadHi	 ; Add 1 with carry (LOSBS_LookAheadHi = 1)
	STA <Temp_Var15	 ; -> Temp_Var15

	LDA #$01
	STA <Scroll_LastDir	 ; Scroll_LastDir = 1 (screen last moved left)

	LDA <Horz_Scroll
	PHA

	LDA <Horz_Scroll_Hi
	PHA

	LDA <Horz_Scroll_Backup
	STA <Horz_Scroll

	LDA <Horz_ScrollHi_Backup
	STA <Horz_Scroll_Hi

	JSR GraphicsBuf_Prep_And_WaitVSync

	PLA
	STA <Horz_Scroll_Hi

	PLA
	STA <Horz_Scroll

	; Fake leftward scroll by 16
	LDA <Horz_Scroll
	SUB #16
	STA <Horz_Scroll	; Horz_Scroll -= $10

	BCS PRG005_BF49	 	; If carry set, jump to PRG005_BF49
	DEC <Horz_Scroll_Hi	; Apply carry

	; This loop spawns all objects which should be visible at the initial
	; screen of the level by pretending to scroll a whole screen's worth

PRG005_BF49:
	LDA Objects_State
	BEQ Test_Spawn

	LDA Objects_State + 1
	BEQ Test_Spawn

	LDA Objects_State + 2
	BEQ Test_Spawn
	
	LDA Objects_State + 3
	BEQ Test_Spawn
	
	LDA Objects_State + 4
	BNE End_Spawn

Test_Spawn:
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

End_Spawn:
	LDA <Horz_ScrollHi_Backup
	STA <Horz_Scroll_Hi	 ; Restore Horz_Scroll_Hi

	LDA <Horz_Scroll_Backup
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

CoinAlert_Colors:
	.byte $0F, $06 

CoinAlert_Alarm = Objects_Data1

CoinAlert_ObjectSpawnX:
	.byte $40, $C0
	.byte $00, $FF

LevelEvent_CoinAlert:
	LDA Level_EventTimer
	BNE CoinAlert_DecTimer

	LDA Level_EventData
	BEQ CoinAlert_CheckCoins

	LSR A
	LSR A
	LSR A

	AND #$01
	TAY

	LDA CoinAlert_Colors, Y
	STA Pal_Data
	STA Pal_Data + 16
	STA Palette_Buffer
	STA Palette_Buffer + 16

	DEC Level_EventData
	BNE ObjNorm_CoinAlertRTS

	LDA #$02
	STA Level_EventTimer
	RTS

CoinAlert_CheckCoins:	
	LDA Sound_QLevel1
	AND #SND_LEVELCOIN
	BEQ ObjNorm_CoinAlertRTS

	LDA #$40
	STA Level_EventData

	LDA Level_EventProperty
	JSR DynJump

	.word CoinAlarm_MontyMole
	.word CoinAlarm_Bullets
	.word CoinAlarm_FireBalls

CoinAlert_DecTimer:
	DEC Level_EventTimer

ObjNorm_CoinAlertRTS:
	RTS

CoinAlarm_MontyMole:

	JSR Object_FindEmptyY
	BCC ObjNorm_CoinAlertRTS

	LDA #OBJ_MONTYMOLE
	STA Objects_ID, Y

	LDA #OBJSTATE_FRESH
	STA Objects_State, Y

	LDA RandomN
	AND #$01
	TAX

	LDA <Player_X
	ADD CoinAlert_ObjectSpawnX, X
	STA Objects_XZ, Y

	LDA <Player_XHi
	ADC CoinAlert_ObjectSpawnX + 2, X
	STA Objects_XHiZ, Y

	LDA <Vert_Scroll
	ADD #$C0
	STA Objects_YZ, Y

	LDA <Vert_Scroll_Hi
	ADC #$00
	STA Objects_YHiZ, Y

	LDA #$01
	STA Objects_Property, Y
	RTS

CoinAlarm_BulletYOffset:
	.byte $10, $E0

CoinAlarm_BulletYHiOffset:
	.byte $00, $FF

CoinAlarm_BulletXOffset:
	.byte $F0, $10

CoinAlarm_BulletXHiOffset:
	.byte $FF, $01

CoinAlarm_BullXVel:
	.byte $30, $D0	

CoinAlarm_Bullets:
	LDY #$01

CoinAlarm_MoreBullets:
	JSR Object_FindEmptyX	 ; Spawn new object (Note: If no slots free, does not return)
	BCC CoinAlarm_BulletRTS

	LDA #OBJ_BULLETBILL
	STA Objects_ID, X

	LDA #OBJSTATE_FRESH
	STA Objects_State, X

	LDA <Player_YZ
	ADD CoinAlarm_BulletYOffset, Y
	STA <Objects_YZ, X

	LDA <Player_YHiZ
	ADC CoinAlarm_BulletYHiOffset, Y
	STA <Objects_YHiZ, X

	LDA <Horz_Scroll
	ADD CoinAlarm_BulletXOffset, Y
	STA <Objects_XZ, X

	LDA <Horz_Scroll_Hi
	ADC CoinAlarm_BulletXHiOffset, Y
	STA <Objects_XHiZ, X

	LDA CoinAlarm_BullXVel, Y
	STA <Objects_XVelZ, X

	LDA #SND_LEVELBABOOM
	STA Sound_QLevel1

	DEY
	BPL CoinAlarm_MoreBullets

CoinAlarm_BulletRTS:
	RTS


Alert_FireballXOffset:
	.byte $08, $00, $F8, $00

Alert_FireballYOffset:
	.byte $00, $01, $00, $C0

Alert_FireballXVel:
	.byte $20, $00, $E0, $00

Alert_FireballYVel:
	.byte $00, $20, $00, $E0

CoinAlarm_FireBalls:
	LDX #$03

CoinAlarm_FireBallLoop:
	JSR Object_PrepProjectile
	BCC CoinAlert_FireballRTS

	LDA #SOBJ_FIREBALL
	STA SpecialObj_ID, Y

	LDA #$01
	STA SpecialObj_Data3, Y

	LDA Alert_FireballXOffset, X
	BNE CoinAlert_SetFireBallX

	LDA <Player_X
	ADD #$04
	STA SpecialObj_X, Y

	LDA <Player_XHi
	ADC #$00
	STA SpecialObj_XHi, Y
	JMP Coin_AlertSetFireballY

CoinAlert_SetFireBallX:
	ADD <Horz_Scroll
	STA SpecialObj_X, Y

	LDA <Horz_Scroll_Hi
	ADC #$00
	STA SpecialObj_XHi, Y

Coin_AlertSetFireballY:
	LDA Alert_FireballYOffset, X
	BNE CoinAlert_SetFireBallY

	LDA <Player_YZ
	ADD #$08
	STA SpecialObj_Y, Y

	LDA <Player_YHiZ
	ADC #$00
	STA SpecialObj_YHi, Y
	JMP CoinAlert_SetVel

CoinAlert_SetFireBallY:
	ADD <Vert_Scroll
	STA SpecialObj_Y, Y

	LDA <Vert_Scroll_Hi
	ADC #$00
	STA SpecialObj_YHi, Y
	
CoinAlert_SetVel:
	LDA Alert_FireballXVel, X
	STA SpecialObj_XVel, Y

	LDA Alert_FireballYVel, X
	STA SpecialObj_YVel, Y
	DEX
	BPL CoinAlarm_FireBallLoop

CoinAlert_FireballRTS:
	RTS

; BADGE SHOP
ObjNorm_BadgeShopDo:
	LDA BadgeShop_Drawn, X
	BNE BadgeShop_TryInstructions

	INC BadgeShop_Drawn, X
	JMP BadgeShop_UpdateWindow

BadgeShop_TryInstructions:
	LDA BadgeShop_InstructionsDrawn, X
	BNE BadgeShop_Norm

	JSR BadgeShop_WriteInstructions
	JMP BadgeShop_Draw

BadgeShop_Norm:		
	LDA #$10
	STA Player_HaltTick

	LDA Pad_Input
	AND #PAD_UP
	BEQ BadgeShop_TryExit

	JSR BadgeShop_Explanation
	JMP BadgeShop_Draw

BadgeShop_TryExit:	
	LDA Pad_Input
	AND #PAD_B
	BEQ BadgeShop_TryBuy

	LDA #$01
	STA <Level_ExitToMap
	STA Map_ReturnStatus

	LDA #MUS1_STOPMUSIC
	STA Sound_QMusic1

	CLR_MSG
	JMP BadgeShop_Draw

BadgeShop_TryBuy:	
	LDA Pad_Input
	AND #PAD_A
	BEQ BadgeShop_Prev

	LDA #$00
	STA Message_Id

	JSR BadgeShop_BuyBadge
	JMP BadgeShop_Draw

BadgeShop_Prev:	
	LDA Pad_Input
	AND #PAD_LEFT
	BEQ BadgeShop_Next

	LDA #$00
	STA Message_Id

	LDA Sound_QLevel1
	ORA #SND_LEVELBLIP
	STA Sound_QLevel1

	DEC BadgeShop_Window, X
	BPL BadgeShop_Update

	LDA #$05
	STA BadgeShop_Window, X

	JMP BadgeShop_Update

BadgeShop_Next:
	LDA Pad_Input
	AND #PAD_RIGHT
	BEQ BadgeShop_Draw

	LDA #$00
	STA Message_Id

	LDA Sound_QLevel1
	ORA #SND_LEVELBLIP
	STA Sound_QLevel1

	INC BadgeShop_Window, X
	LDA BadgeShop_Window, X
	CMP #$06
	BCC BadgeShop_Update

	LDA #$00
	STA BadgeShop_Window, X

BadgeShop_Update:
	JSR BadgeShop_UpdateWindow

BadgeShop_Draw:
	LDA #$00
	STA Objects_Frame, X

	LDA #SPR_PAL1
	STA Objects_SpriteAttributes, X

	JSR Object_Draw

	LDA Object_SpriteRAMOffset, X
	ADD #$08 
	STA Object_SpriteRAMOffset, X

	LDA #SPR_PAL3
	STA Objects_SpriteAttributes, X
	JSR Object_Draw

	LDA Object_SpriteRAMOffset, X
	SUB #$08
	TAY

	LDA #$A5
	STA Sprite_RAMTile, Y
	
	LDA #$A7
	STA Sprite_RAMTile + 4, Y

	LDA #$A9
	STA Sprite_RAMTile + 8, Y
	
	LDA #$AB
	STA Sprite_RAMTile + 12, Y
	RTS

BadgeShop_List:
	.byte BADGE_RADAR
	.byte BADGE_AIR
	.byte BADGE_XP
	.byte BADGE_PMETER 
	.byte BADGE_COIN
	.byte BADGE_ITEMRESERVE
	.byte BADGE_RADAR 		
	.byte BADGE_AIR

BadgeShop_Tiles:
	.byte $FF, $FF, $FF, $FF ; $00
	.byte $B2, $B3, $C2, $C3 ; $01
	.byte $B6, $B7, $C2, $C3 ; $02
	.byte $C6, $C7, $C2, $C3 ; $03
	.byte $BA, $BB, $CA, $CB ; $04
	.byte $B0, $B1, $C0, $C1 ; $05
	.byte $FF, $FF, $FF, $FF ; $06
	.byte $FF, $FF, $FF, $FF ; $07
	.byte $FF, $FF, $FF, $FF ; $08
	.byte $B4, $B5, $C4, $C5 ; $09
	

BadgeShop_Cost:
	.byte 0		; $00
	.byte 6	 	; $01
	.byte 8		; $02
	.byte 10	; $03
	.byte 4		; $04
	.byte 10	; $05
	.byte 00
	.byte 00
	.byte 00
	.byte 10	; $06

Badge_Descriptions:
	.db "     INVALID    "; 00
	.db "    DOUBLE XP   "; 01
	.db " DOUBLE P METER "; 02
	.db "  DOUBLE COINS  "; 03
	.db "  INCREASED AIR "; 04
	.db "  ITEM RESERVE  "; 05
	.db "                "; 06
	.db "                "; 07
	.db "                "; 08
	.db "   STAR RADAR   "; 09

BadgeShop_Window = Objects_Data1
BadgeShop_Badge1 = Temp_Var1
BadgeShop_Badge2 = Temp_Var2
BadgeShop_Badge3 = Temp_Var3
BadgeShop_Drawn = Objects_Data2
BadgeShop_InstructionsDrawn = Objects_Data3
BadgeShop_HalfOff = Objects_Data4
BadgeShop_Free = Objects_Data5

BadgeShop_UpdateWindow:
	LDA BadgeShop_Window, X
	TAY

	LDA BadgeShop_List, Y
	STA BadgeShop_Badge1

	LDA BadgeShop_List + 1, Y
	STA BadgeShop_Badge2

	LDA BadgeShop_List + 2, Y
	STA BadgeShop_Badge3

	LDY Graphics_BufCnt

	LDA #$28
	STA Graphics_Buffer, Y
	INY

	LDA #$EC
	STA Graphics_Buffer, Y
	INY

	LDA #$08
	STA Graphics_Buffer, Y
	INY 

	LDA BadgeShop_Badge1
	ASL A
	ASL A
	TAX

	LDA BadgeShop_Tiles, X
	STA Graphics_Buffer, Y
	INY

	LDA BadgeShop_Tiles + 1, X
	STA Graphics_Buffer, Y
	INY	

	LDA #$F2
	STA Graphics_Buffer, Y
	INY	

	LDA BadgeShop_Badge2
	ASL A
	ASL A
	TAX

	LDA BadgeShop_Tiles, X
	STA Graphics_Buffer, Y
	INY

	LDA BadgeShop_Tiles + 1, X
	STA Graphics_Buffer, Y
	INY	

	LDA #$F8
	STA Graphics_Buffer, Y
	INY	

	LDA BadgeShop_Badge3
	ASL A
	ASL A
	TAX

	LDA BadgeShop_Tiles, X
	STA Graphics_Buffer, Y
	INY

	LDA BadgeShop_Tiles + 1, X
	STA Graphics_Buffer, Y
	INY	

	LDA #$29
	STA Graphics_Buffer, Y
	INY

	LDA #$0C
	STA Graphics_Buffer, Y
	INY

	LDA #$08
	STA Graphics_Buffer, Y
	INY 

	LDA BadgeShop_Badge1
	ASL A
	ASL A
	TAX

	LDA BadgeShop_Tiles + 2, X
	STA Graphics_Buffer, Y
	INY

	LDA BadgeShop_Tiles + 3, X
	STA Graphics_Buffer, Y
	INY	

	LDA #$F2
	STA Graphics_Buffer, Y
	INY	

	LDA BadgeShop_Badge2
	ASL A
	ASL A
	TAX

	LDA BadgeShop_Tiles + 2, X
	STA Graphics_Buffer, Y
	INY

	LDA BadgeShop_Tiles + 3, X
	STA Graphics_Buffer, Y
	INY	

	LDA #$F8
	STA Graphics_Buffer, Y
	INY	

	LDA BadgeShop_Badge3
	ASL A
	ASL A
	TAX

	LDA BadgeShop_Tiles + 2, X
	STA Graphics_Buffer, Y
	INY

	LDA BadgeShop_Tiles + 3, X
	STA Graphics_Buffer, Y
	INY

	LDA #$28
	STA Graphics_Buffer, Y
	INY

	LDA #$A8
	STA Graphics_Buffer, Y
	INY

	LDA #$10
	STA Graphics_Buffer, Y
	INY

	LDA #$00

	LDX BadgeShop_Badge2

BadgeShop_Loop:	
	ADD #$10
	DEX
	BNE BadgeShop_Loop

	TAX

	LDA #$0F
	STA <Temp_Var4

BadgeShop_Name:
	LDA Badge_Descriptions, X
	STA Graphics_Buffer, Y
	INY
	INX

	DEC <Temp_Var4
	BPL BadgeShop_Name

	LDA #$29
	STA Graphics_Buffer, Y
	INY

	LDA #$4E
	STA Graphics_Buffer, Y
	INY

	LDA #$03
	STA Graphics_Buffer, Y
	INY	

	LDA #$D5
	STA Graphics_Buffer, Y
	INY	

	LDA BadgeShop_Badge2
	TAX

	LDA BadgeShop_Cost, X
	STA <DigitsParam

	LDA BadgeShop_HalfOff, X
	BEQ BadgeShop_Digits

	LSR <DigitsParam

BadgeShop_Digits:	
	JSR BytesTo2Digits

	LDA <DigitsResult + 1
	ORA #$30
	STA Graphics_Buffer, Y
	INY

	LDA <DigitsResult 
	ORA #$30
	STA Graphics_Buffer, Y
	INY

	LDA #$00
	STA Graphics_Buffer, Y
	INY
	
BadgeShop_Finish:
	TYA
	ADD Graphics_BufCnt
	STA Graphics_BufCnt

	LDX <CurrentObjectIndexZ
	RTS	

BadgeShop_BuyBadge:
	LDY BadgeShop_Window, X
	LDA BadgeShop_List + 1, Y
	TAY

	LDA BadgeShop_Cost, Y
	LDY BadgeShop_HalfOff, X
	BEQ BadgeShop_Subtract

	LSR A

BadgeShop_Subtract:
	STA <Temp_Var4

	LDA Player_Cherries
	SUB <Temp_Var4
	BCC BadgeShop_CannotBuy
	
	STA Player_Cherries
	LDX <CurrentObjectIndexZ
	LDY BadgeShop_Window, X

	LDA BadgeShop_List + 1, Y
	STA Player_Badge

	LDA Sound_QMap
	ORA #SND_MAPBONUSAPPEAR
	STA Sound_QMap
	RTS

BadgeShop_CannotBuy:
	LDA Sound_QMap
	ORA #SND_MAPDENY
	STA Sound_QMap

	LDX <CurrentObjectIndexZ
	RTS

BadgeShop_Instructions:
	.byte $29, $A9, 14
	.db ": AND ; SELECT"

	.byte $29, $C9, 11
	.db "A BUY BADGE"

	.byte $29, $E9, 6
	.db "B EXIT"

	.byte $2A, $09, 14
	.db "< EXPLANATION "

	.byte $00

BadgeShop_WriteInstructions:
	LDY Graphics_BufCnt
	BNE BadgeShop_WriteInstructionsRTS
	
	LDX #$00

BadgeShop_InstructionLoop:	
	LDA BadgeShop_Instructions, X
	STA Graphics_Buffer, Y
	INY 
	INX

	CPX #58
	BCC  BadgeShop_InstructionLoop

	TYA
	ADD Graphics_BufCnt
	STA Graphics_BufCnt

	LDX <CurrentObjectIndexZ
	INC BadgeShop_InstructionsDrawn, X

BadgeShop_WriteInstructionsRTS:
	RTS

Badge_Explanations:
	.byte $00
	 MSG_ID Badge_A_Explanation
	 MSG_ID Badge_B_Explanation
	 MSG_ID Badge_C_Explanation
	 MSG_ID Badge_D_Explanation
	 MSG_ID Badge_E_Explanation
	 MSG_ID Badge_F_Explanation
	 MSG_ID Badge_F_Explanation
	 MSG_ID Badge_F_Explanation
	 MSG_ID Badge_F_Explanation

BadgeShop_Explanation:
	LDY BadgeShop_Window, X
	LDA BadgeShop_List + 1, Y
	TAY

	LDA Badge_Explanations, Y
	STA Message_Id
	RTS


Credits_LineTimerLow = Objects_Data2
Credits_LineTimerHi = Objects_Data3
Credits_LineIndex = Objects_Data4
Credits_LineWriteIndex = Objects_Data5
Credits_LineWriteColumn = Objects_Data6
Credits_LineWriteTimer = Objects_Data7
Credits_LineWriteToggle = Objects_Data8

Credits_PPUAddr1:
	vaddr $2886

Credits_PPUAddr2:
	vaddr $28C6

Credits_Lines:
	.word Credits_Line1
	.word Credits_Line2
	.word Credits_Line3
	.word Credits_Line4
	.word Credits_Line5
	.word Credits_Line6
	.word Credits_Line7
	.word Credits_Line8
	.word Credits_Line9
	.word Credits_Line10
	.word Credits_Line11
	.word Credits_Line12
	.word Credits_Line13

Credits_Line1
	.db "   THANK YOU FOR    "
	.db "CLEARING THE MALICE "

Credits_Line2
	.db "FROM THE LANDS RULED"
	.db "   BY KING BOWSER   "

Credits_Line3
	.db " HE CAN RIGHTFULLY  "
	.db "RETURN TO HIS THRONE"

Credits_Line4
	.db " WE ARE SURE MARIO  "
	.db "WILL BE THANKED FOR "

Credits_Line5
	.db "  HIS DEEEDS ACROSS "
	.db "ALL OF KOOPA KINGDOM"

Credits_Line6:
	.db "    DEVELOPED BY    "
	.db "   SCARLETT VIXEN   "

Credits_Line7:
	.db "   BETA TESTED BY   "
	.db "        AWAL        "

Credits_Line8:
	.db "   BETA TESTED BY   "
	.db "      RETROHAX      "

Credits_Line9:
	.db "   BETA TESTED BY   "
	.db " KRYSTIAN POLKOWSKI "

Credits_Line10:
	.db "   SPECIAL THANKS   "
	.db "   MY  OTTER HALF   "

Credits_Line11:
	.db "   SPECIAL THANKS   "
	.db "   MY  WINTERWOLF    "

Credits_Line12:
	.db "   SPECIAL THANKS   "
	.db "      MY KIDDO      "

Credits_Line13:
	.db "   SPECIAL THANKS   "
	.db " TO YOU THE PLAYER! "

Credits_Low = Temp_Var1
Credits_Hi = Temp_Var2

Credits_Roll:
	LDA #$5C
	STA PatTable_BankSel

	LDA Credits_LineTimerLow, X
	ORA Credits_LineTimerHi, X
	BEQ Credits_LineAction

Credits_RollTimer:
	DEC Credits_LineTimerLow, X
	BNE Credits_RollRTS

	LDA Credits_LineTimerHi, X
	BEQ Credits_RollRTS

	DEC Credits_LineTimerHi, X

	LDA #$20
	STA Credits_LineTimerLow, X

Credits_RollRTS:
	RTS

Credits_LineAction:	
	LDA Credits_LineWriteToggle, X
	BNE Credits_WriteLines
	JMP Credits_LineClear

Credits_WriteLines:
	DEC Credits_LineWriteTimer, X
	BNE Credits_RollRTS

	LDA Graphics_BufCnt
	BNE Credits_RollRTS

	LDA #$02
	STA Credits_LineWriteTimer, X

	JSR Credits_LoadDrawBuffer

	LDA Credits_LineWriteIndex, X
	ASL A
	TAY

	LDA Credits_Lines, Y
	STA <Credits_Low

	LDA Credits_Lines + 1, Y
	STA <Credits_Hi

	LDY Credits_LineWriteColumn, X
	
	LDA [Credits_Low], Y
	STA Graphics_Buffer + 3

	TYA
	ADD #20
	TAY
	
	LDA [Credits_Low], Y
	STA Graphics_Buffer + 7

	LDA #$00
	STA Graphics_Buffer + 8

	LDA #$09
	STA Graphics_BufCnt

	LDA Credits_LineWriteColumn, X
	CMP #19
	BEQ Credits_WriteDone

	INC Credits_LineWriteColumn, X

	LDA #$02
	STA Credits_LineWriteTimer, X
	RTS

Credits_WriteDone:
	INC Credits_LineWriteIndex, X

Credits_WriteLineReset:
	LDA #$20
	STA Credits_LineTimerLow, X

	LDA #$04
	STA Credits_LineTimerHi, X

	LDA Credits_LineWriteToggle, X
	EOR #$01
	STA Credits_LineWriteToggle, X

	LDA #$02
	STA Credits_LineWriteTimer, X

	LDA #$00
	STA Credits_LineWriteColumn, X

	LDA Credits_LineWriteToggle, X
	BEQ Credits_WriteLineResetRTS

	LDA Credits_LineWriteIndex, X
	CMP #13
	BNE Credits_WriteLineResetRTS

	JMP Credits_PlotTwist

Credits_WriteLineResetRTS:
	RTS

Credits_LineClear:
	DEC Credits_LineWriteTimer, X
	BNE Credits_WriteLineResetRTS

	LDA Graphics_BufCnt
	BNE Credits_WriteLineResetRTS

	JSR Credits_LoadDrawBuffer

	LDY Credits_LineWriteColumn, X
	
	LDA #$FF
	STA Graphics_Buffer + 3
	STA Graphics_Buffer + 7

	LDA #$00
	STA Graphics_Buffer + 8

	LDA #$09
	STA Graphics_BufCnt

	LDA Credits_LineWriteColumn, X
	CMP #20
	BEQ Credits_WriteLineReset

	INC Credits_LineWriteColumn, X

	LDA #$02
	STA Credits_LineWriteTimer, X
	RTS

Credits_LoadDrawBuffer:
	LDA Credits_PPUAddr1
	STA Graphics_Buffer

	LDA Credits_PPUAddr1 + 1
	ADD Credits_LineWriteColumn, X
	STA Graphics_Buffer + 1

	LDA Credits_PPUAddr2
	STA Graphics_Buffer + 4

	LDA Credits_PPUAddr2 + 1
	ADD Credits_LineWriteColumn, X
	STA Graphics_Buffer + 5

	LDA #$01
	STA Graphics_Buffer + 2
	STA Graphics_Buffer + 6
	RTS	

Credits_PlotTwist:
	LDA #$0F
	LDY #$0F

Credits_ClearPalette:	
	STA MasterPal_Data, Y
	STA Pal_Data, Y
	DEY
	BPL Credits_ClearPalette

	LDA #OBJ_BOWSER
	STA Objects_ID + 4

	LDA #$C0
	STA <Objects_YZ, X

	LDA #$00
	STA <Objects_YHiZ, X

	LDA #$78
	STA <Objects_XZ, X

	LDA #$00
	STA <Objects_XHiZ, X
	STA <Objects_XVelZ, X
	
	LDA #$18
	STA Bowser_Action + 4

	LDA #MUS2B_BOSS
	STA Sound_QMusic2

	LDA #$80
	STA Objects_Timer, X

	LDA #$1B
	STA Palette_Buffer + 25

	LDA #$30
	STA Palette_Buffer + 26

	LDA #$27
	STA Palette_Buffer + 27

	LDA #$06
	STA <Graphics_Queue

	RTS 

Bower_SpriteXOffset:
	.byte $00, $08, $10, $18, $00, $08, $10, $18, $00, $08, $10, $18

Bower_SpriteYOffset:
	.byte $00, $00, $00, $00, $10, $10, $10, $10, $20, $20, $20, $20

Bowser_FlipOffset:
	.byte $03, $01, $FF, $FD, $03, $01, $FF, $FD, $03, $01, $FF, $FD

Bowser_Palette:
	.byte SPR_PAL2, SPR_PAL2, SPR_PAL2, SPR_PAL2, SPR_PAL2, SPR_PAL2
	.byte SPR_PAL1, SPR_PAL1, SPR_PAL1, SPR_PAL1, SPR_PAL1, SPR_PAL1, SPR_PAL1

Bowser_CrouchedFrames:
	.byte $00, $01, $00, $00, $00, $00
	.byte $00, $01, $00, $00, $00, $00, $00

Bowser_MirroredFrame:
	.byte $00, $00, $00, $00, $01, $01
	.byte $00, $00, $00, $00, $01, $01, $00

Bowser_Frames:
	; Idle 1
	.byte $89, $8B, $8D, $9F
	.byte $A9, $AB, $AD, $AF
	.byte $C9, $CB, $CD, $CF

	; Idle 2
	.byte $89, $8B, $8D, $9F
	.byte $A9, $AB, $AD, $AF
	.byte $D1, $D3, $D5, $D7

	; Breath 1
	.byte $91, $93, $95, $97
	.byte $B1, $B3, $B5, $B7
	.byte $C9, $CB, $CD, $CF

	; Breath 2
	.byte $91, $9B, $9D, $97
	.byte $B9, $BB, $BD, $B7
	.byte $C9, $CB, $CD, $CF

	; Pound 1
	.byte $C1, $C3, $C3, $C5
	.byte $E1, $E3, $E3, $E1
	.byte $E9, $EB, $EB, $E9

	; Pound 2
	.byte $C5, $C7, $C7, $C5
	.byte $E5, $E7, $E7, $E5
	.byte $ED, $EF, $EF, $ED

	; Malice Idle 1
	.byte $89, $8B, $8D, $9F
	.byte $A9, $AB, $D9, $DB
	.byte $C9, $CB, $F9, $FB

	; Malice Idle 2
	.byte $89, $8B, $8D, $9F
	.byte $A9, $AB, $D9, $DB
	.byte $D1, $D3, $FD, $FF

	; Malice Breath 1
	.byte $91, $93, $95, $97
	.byte $B1, $B3, $F1, $F3
	.byte $C9, $CB, $F9, $FB

	; Malice Breathe 2
	.byte $91, $9B, $9D, $97
	.byte $B9, $BB, $F5, $F7
	.byte $C9, $CB, $F9, $FB	

	; Malice Pound 1
	.byte $C1, $C3, $C3, $C5
	.byte $E1, $E3, $E3, $E1
	.byte $E9, $EB, $EB, $E9

	; Malice Pound 2
	.byte $C5, $C7, $C7, $C5
	.byte $BF, $E7, $E7, $BF
	.byte $ED, $EF, $EF, $ED	

	; Malice Throw 1
	.byte $89, $8B, $8D, $9F
	.byte $85, $87, $A5, $DB
	.byte $9F, $A7, $F9, $FB

Bowser_Action = Objects_Data1
Bowser_Health = Objects_Data2
Bowser_MaliceMode = Objects_Data3
Bowser_AttackPhase = Objects_Data4
Bowser_StarPower = Objects_Data5
Bowser_UpdateStarCount = Objects_Data6
Bowser_WaitTimerLo = Objects_Data7
Bowser_WaitTimerHi = Objects_Data8

Object_Bowser:
	LDA <Player_HaltGameZ
	BEQ Bowser_DoAction

	JMP Bowser_NormDraw

Bowser_DoAction:
	JSR Bowser_ProcessHealth

	LDA Bowser_Action, X
	JSR DynJump

	.word Bowser_Init				; 0
	.word Bowser_NormIdle			; 1
	.word Bowser_NormBreatheFire	; 2
	.word Bowser_NormJump			; 3
	.word Bowser_NormSoar			; 4
	.word Bowser_NormPound			; 5
	.word Bowser_NormPoundIdle		; 6
	.word Bowser_MaliceTransition	; 7
	.word Bowser_MalicePowerUp		; 8
	.word Bowser_MaliceIdle			; 9
	.word Bowser_MaliceBreatheFire	; A
	.word Bowser_MaliceJump			; B
	.word Bowser_MaliceSoar			; C
	.word Bowser_MalicePound		; D
	.word Bowser_MalicePoundIdle	; E
	.word Bowser_MaliceBigFire		; F
	.word Bowser_ThrowHammer		; 10
	.word Bowser_Die				; 11
	.word Bowser_DieBottom			; 12
	.word Bowser_WaitEnding			; 13
	.word Bowser_StartEnding		; 14
	.word SuperCredits_FadeOut		; 15
	.word SuperCredits_FixPalette	; 16
	.word SuperCredits_Roll			; 17
	.word Bowser_EjectMario	        ; 18
	.word Bowser_ByeByeMario
	.word Bowser_NextQuest

Bowser_AttachPhaseHealth:
	.byte 60, 45, 30, 15, 00

Bowser_ProcessHealth:
	LDA Bowser_Health, X
	BMI Bowser_HealthRTS

	LDA Objects_State, X
	CMP #OBJSTATE_KILLED
	BNE Bowser_SetHealth

	DEC Bowser_Health, X
	DEC Bowser_Health, X
	DEC Bowser_Health, X
	
	LDA Objects_PlayerProjHit, X
	AND #HIT_STOMPED
	BEQ Bowser_LowDamage
	
	DEC Bowser_Health, X
	DEC Bowser_Health, X
	DEC Bowser_Health, X
	DEC Bowser_Health, X
	DEC Bowser_Health, X
	DEC Bowser_Health, X

Bowser_LowDamage:
	LDA #$40
	STA Objects_Timer2, X

	LDA Bowser_Health, X
	BPL Bowser_NotDead

	LDA #MUS1_BOWSERFALL
	STA Sound_QMusic1

	LDA #$E0
	STA <Objects_YVelZ, X

	LDA #$11
	STA Bowser_Action, X

	LDA #$00
	STA Player_Invincible

	LDA #$FF
	STA Objects_Timer, X
	RTS

Bowser_NotDead:
	CMP #76
	BCS Bowser_NoMaliceYet

	STA Bowser_MaliceMode, X

	LDY Bowser_AttackPhase, X
	CMP Bowser_AttachPhaseHealth, Y
	BCS Bowser_NoMaliceYet

	INC Bowser_AttackPhase, X

Bowser_NoMaliceYet:
	LDA #OBJSTATE_NORMAL
	STA Objects_State, X

Bowser_SetHealth:
	LDA Bowser_Health, X
	LSR A
	STA Enemy_Health

Bowser_HealthRTS:
	RTS

Bowser_Init:
	LDA #$00
	STA Player_Cherries
	STA Player_Coins
	STA PowerUp_Reserve
	STA Player_Badge

	LDA #BOUND32x32
	STA Objects_BoundBox, X

	JSR Object_CalcBoundBox
	JSR Object_FacePlayer

	LDA #100
	STA Bowser_Health, X
	STA Enemy_Health_Mode

	INC Bowser_Action, X

	LDA #ATTR_NOICE
	STA Objects_BehaviorAttr, X

	LDA #$00
	STA Objects_WeaponAttr, X

	LDA #$C0
	STA Objects_Timer, X

	LDA #14
	STA Objects_SpritesRequested, X

	JMP Bowser_NormDraw


Bowser_NormIdleNextActions:
	.byte $02, $03

Bowser_NormIdleNextTimers:
	.byte $20, $20

Bowser_NormIdle_BackVel:
	.byte $40, $C0
	
Bowser_NormIdle:
	JSR Bowser_Interaction
	JSR Object_FacePlayer

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ Bowser_NormMarioNotClose

	LDA #$00
	STA <Objects_XVelZ, X

Bowser_NormIdleNotGround:
	JSR Object_YDistanceFromPlayer

	CMP #$30
	BCS Bowser_NormMarioNotClose

	JSR Object_XDistanceFromPlayer
	CMP #$20
	BCS Bowser_NormMarioNotClose	

	LDA #$E0
	STA <Objects_YVelZ, X
	
	LDA <Objects_XZ, X
	ADD #$30
	CMP #$3D
	BCS Bowser_NormJumpBack

	TYA
	EOR #$01
	TAY

Bowser_NormJumpBack:
	LDA Bowser_NormIdle_BackVel, Y
	STA <Objects_XVelZ, X

Bowser_NormMarioNotClose:
	LDA Objects_Timer, X
	BNE Bowser_NormIdleDone

	LDA Bowser_MaliceMode, X
	BEQ Bowser_NoMaliceTransition

	LDA #$07
	STA Bowser_Action, X

	LDA #$7F
	STA Objects_Timer, X

	JMP Bowser_NormDraw

Bowser_NoMaliceTransition:
	LDA RandomN
	AND #$01
	TAY

	LDA Bowser_NormIdleNextActions, Y
	STA Bowser_Action, X

	LDA Bowser_NormIdleNextTimers, Y
	STA Objects_Timer, X

	LDA #$00
	STA <Objects_XVelZ, X

Bowser_NormIdleDone:
	LDA Objects_Timer, X
	LSR A
	LSR A
	LSR A
	LSR A
	AND #$01
	STA Objects_Frame, X

	JMP Bowser_NormDraw

Bowser_Interaction:
	LDA Bowser_Action, X
	CMP #$09
	BCC Bowser_DoInteractions

	JSR Bowser_ProcessStarPower

	LDA #ATTR_ATTACKPROOF
	LDY Poison_Mode
	BEQ Bowser_SetMaliceVulnerability

	ORA #ATTR_INVINCIBLE

Bowser_SetMaliceVulnerability:
	STA Objects_WeaponAttr, X

Bowser_DoInteractions:
	JSR Object_Move
	JSR Bowser_CalcBoundBox
	JSR Object_DetectTiles
	JSR Object_InteractWithTilesWallStops
	JSR Object_AttackOrDefeat
	RTS

Bowser_CalcBoundBox:
	LDA <Objects_XZ, X
	ADD #$04
	STA Objects_BoundLeft, X

	LDA <Objects_XHiZ, X
	ADC #$00
	STA Objects_BoundLeftHi, X

	LDA Objects_BoundLeft, X
	ADD #24
	STA Objects_BoundRight, X

	LDA Objects_BoundLeftHi, X
	ADC #$00
	STA Objects_BoundRightHi, X
	
	LDA <Objects_YZ, X
	ADD #13
	STA Objects_BoundTop, X

	LDA <Objects_YHiZ, X
	ADC #$00
	STA Objects_BoundTopHi, X

	LDA Objects_BoundTop, X
	ADD #$24
	STA Objects_BoundBottom, X

	LDA Objects_BoundTopHi, X
	ADC #$00
	STA Objects_BoundBottomHi, X
	RTS

Bowser_NormDraw:
	LDY Objects_Frame, X

	LDA Bowser_MirroredFrame, Y
	BNE Bowser_MirrorDraw

	JMP Bowser_Draw

Bowser_MirrorDraw:
	JMP Bowser_DrawMirrored


Bowser_FrameOffset = Temp_Var1
Bowser_SpriteOffset = Temp_Var2
Bowser_SpriteIndex = Temp_Var3
Bowser_SpriteVisMask = Temp_Var4
Bowser_SpriteX = Temp_Var5
Bowser_SpriteY = Temp_Var6
Bowser_SpriteTile = Temp_Var12
Bowser_SpriteOrientation = Temp_Var13

Bowser_DrawMirrored:
	JSR Bowser_Draw

	LDY Object_SpriteRAMOffset, X

	LDA Sprite_RAMAttr, Y
	AND #~SPR_HFLIP
	STA Sprite_RAMAttr, Y
	STA Sprite_RAMAttr+4, Y
	STA Sprite_RAMAttr+16, Y
	STA Sprite_RAMAttr+20, Y
	STA Sprite_RAMAttr+32, Y
	STA Sprite_RAMAttr+36, Y

	ORA #SPR_HFLIP
	STA Sprite_RAMAttr+8, Y
	STA Sprite_RAMAttr+12, Y
	STA Sprite_RAMAttr+24, Y
	STA Sprite_RAMAttr+28, Y
	STA Sprite_RAMAttr+40, Y
	STA Sprite_RAMAttr+44, Y
	RTS

Bowser_Draw:
	JSR Object_CalcSpriteXY_NoHi
	LDY Objects_Frame, X

	LDA Objects_Timer2, X
	BEQ Bowser_NoFlash

	AND #$04
	BEQ Bowser_NoFlash

	LDA #SPR_PAL3
	BNE Bowser_SetPalette

Bowser_NoFlash:
	LDA Bowser_Palette, Y

Bowser_SetPalette:	
	STA Objects_SpriteAttributes, X

	LDA Bowser_CrouchedFrames, Y
	BEQ Bowser_NotCrouched

	LDA Objects_SpriteY, X
	ADD #$04
	STA Objects_SpriteY, X

Bowser_NotCrouched:
	LDY Objects_Frame, X

	LDA #$00
	STA <Bowser_SpriteIndex

	LDA #$3A
	STA PatTable_BankSel + 4

	LDA #$3B
	STA PatTable_BankSel + 5

	LDA Object_SpriteRAMOffset, X
	STA <Bowser_SpriteOffset

	LDA Objects_Frame, X
	ASL A
	ASL A

	STA <Temp_Var7
	ASL A

	ADD <Temp_Var7
	STA <Bowser_FrameOffset

	LDA Objects_SpritesHorizontallyOffScreen, X
	AND #$F0
	ORA Objects_SpritesVerticallyOffScreen, X
	STA <Bowser_SpriteVisMask

	LDA Objects_Orientation, X
	AND #SPR_HFLIP
	STA <Bowser_SpriteOrientation
	
Bowser_DrawLoop:
	LDY <Bowser_FrameOffset

	JSR Bowser_DrawSprite
	INC <Bowser_SpriteIndex
	INC <Bowser_FrameOffset

	LDA <Bowser_SpriteOffset
	ADD #$04
	STA <Bowser_SpriteOffset

	LDA <Bowser_SpriteIndex
	CMP #$0C
	BNE Bowser_DrawLoop

	LDX <CurrentObjectIndexZ
	LDY Object_SpriteRAMOffset, X

	JSR Bowser_CheckHFlip
	JSR Bowser_CheckVFlip
Bowser_DrawRTS:
	RTS

Bowser_CheckHFlip:
	LDA Objects_Orientation, X
	AND #SPR_HFLIP
	BEQ Bowser_CheckHFlipRTS

	LDY Object_SpriteRAMOffset, X

	LDA Sprite_RAMX + 12, Y
	PHA

	LDA Sprite_RAMX + 8, Y
	PHA

	LDA Sprite_RAMX, Y
	STA Sprite_RAMX + 12, Y
	STA Sprite_RAMX + 28, Y
	STA Sprite_RAMX + 44, Y

	LDA Sprite_RAMX + 4, Y
	STA Sprite_RAMX + 8, Y
	STA Sprite_RAMX + 24, Y
	STA Sprite_RAMX + 40, Y

	PLA
	STA Sprite_RAMX + 4, Y
	STA Sprite_RAMX + 20, Y
	STA Sprite_RAMX + 36, Y

	PLA
	STA Sprite_RAMX , Y
	STA Sprite_RAMX + 16, Y
	STA Sprite_RAMX + 32, Y

Bowser_CheckHFlipRTS:
	RTS

Bowser_CheckVFlip:
	LDA Objects_Orientation, X
	AND #SPR_VFLIP
	BEQ Bowser_CheckVFlipRTS

	LDY Object_SpriteRAMOffset, X

	LDA Sprite_RAMY + 32, Y
	PHA

	LDA Sprite_RAMY, Y
	STA Sprite_RAMY + 32, Y
	STA Sprite_RAMY + 36, Y
	STA Sprite_RAMY + 40, Y
	STA Sprite_RAMY + 44, Y

	PLA
	STA Sprite_RAMY , Y
	STA Sprite_RAMY + 4, Y
	STA Sprite_RAMY + 8, Y
	STA Sprite_RAMY + 12, Y

Bowser_CheckVFlipRTS:	
	RTS	

Bowser_DrawSprite:
	LDA Bowser_Frames, Y
	BEQ Bowser_DrawSpriteRTS
	
	STA <Bowser_SpriteTile
	
	LDY <Bowser_SpriteIndex
	LDX <CurrentObjectIndexZ
	
	LDA Bower_SpriteXOffset, Y
	ADD Objects_SpriteX,X
	STA <Bowser_SpriteX

	LDA Bower_SpriteYOffset, Y
	ADD Objects_SpriteY,X
	STA <Bowser_SpriteY

	LDA VisMask, Y
	AND <Bowser_SpriteVisMask
	BNE Bowser_DrawSpriteRTS

	LDY <Bowser_SpriteOffset
	LDA <Bowser_SpriteY
	STA Sprite_RAMY, Y
	
	LDA Objects_SpriteAttributes,X
	ORA Objects_Orientation,X
	STA Sprite_RAMAttr, Y

	LDA <Bowser_SpriteX
	STA Sprite_RAMX, Y

	LDA <Bowser_SpriteTile
	STA Sprite_RAMTile, Y

	LDA <Bowser_SpriteOrientation
	AND #$03
	CMP #$02
	BCC Bowser_DrawSpriteRTS

	LDA Sprite_RAM + 2, Y
	ORA #SPR_HFLIP
	STA Sprite_RAM + 2, Y

Bowser_DrawSpriteRTS:
	RTS

Bowser_NormBreatheFire:
	JSR Bowser_Interaction

	LDA Objects_Timer, X
	BNE Bowser_NormFireballSetFrames

	JSR SpecialObject_FindEmpty
	BCC Bowser_NormFireballSetFrames

	LDA #SND_LEVELFLAME
	STA Sound_QLevel2

	LDA #SOBJ_BIGFIREBALL
	STA SpecialObj_ID,Y

	LDA #$10
	STA SpecialObj_Timer,Y

	LDA #$00
	STA SpecialObj_HurtEnemies, Y

	LDA <Objects_XZ,X
	STA SpecialObj_X,Y

	LDA <Objects_XHiZ,X
	STA SpecialObj_XHi,Y

	LDA <Objects_YZ,X
	ADD #$10
	STA SpecialObj_Y,Y

	LDA <Objects_YHiZ, X
	ADC #$00
	STA SpecialObj_YHi,Y

	LDA #$F0
	STA SpecialObj_XVel,Y

	LDA Objects_Orientation, X	
	BEQ Bowser_NormBreatheFireReset

	LDA #$10
	STA SpecialObj_XVel, Y

	LDA SpecialObj_X, Y
	ADD #$10
	STA SpecialObj_X, Y

Bowser_NormBreatheFireReset:
	LDA #$01
	STA Bowser_Action, X

	LDA #$C0
	STA Objects_Timer, X

Bowser_NormFireballSetFrames:
	LDA Objects_Timer, X
	LSR	A
	LSR	A
	LSR	A
	LSR	A
	AND #$01
	EOR #$01
	ADD #$02
	STA Objects_Frame, X

	JMP Bowser_NormDraw

Bowser_JumpDistance:
	; .byte $FC, $F8, $F4, $F0, $EC, $E8, $E4, $E0, $DC, $D8, $D4, $D0
	.byte $F8, $F0, $E8, $E0, $D8, $D0, $C8, $C0, $B8, $B0, $A8, $A0, $A0, $A0

Bowser_NormJump:
	JSR Bowser_Interaction

	LDA Objects_Timer, X
	BNE Bowser_NormJumpDone

	JSR Object_XDistanceFromPlayer
	LSR A
	LSR A
	LSR A
	LSR A
	TAY

	LDA Bowser_JumpDistance, Y
	STA <Objects_XVelZ, X

	LDA Objects_Orientation, X
	BEQ Bowser_NormSetJump

	LDA <Objects_XVelZ, X
	JSR Negate
	STA <Objects_XVelZ, X

Bowser_NormSetJump:
	LDA #$A0
	STA <Objects_YVelZ, X

	LDA #$04
	STA Bowser_Action, X

	LDA #$20
	STA Objects_Timer, X

Bowser_NormJumpDone:
	LDA #$01
	STA Objects_Frame, X
	JMP Bowser_NormDraw	

Bowser_NormSoar:
	JSR Bowser_Interaction

	LDA Objects_Timer, X
	BNE Bowser_NormSoarDone

	LDA <Objects_XVelZ, X
	BEQ Bowser_NormStopSoar

	LDA <Objects_YVelZ, X
	BPL Bowser_NormStopSoar

	JSR Object_XDistanceFromPlayer
	CMP #18
	BCS Bowser_NormSoarDone

Bowser_NormStopSoar:
	LDA #$05
	STA Bowser_Action, X

	LDA #$10
	STA Objects_Timer, X

Bowser_NormSoarDone:
	LDA #$00
	STA Objects_Frame, X

	JMP Bowser_NormDraw

Bowser_NormPound:
	LDA #$00
	STA <Objects_XVelZ, X

	JSR Bowser_Interaction

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ Bowser_NormPoundCheckFloat

	LDA #$20
	STA Level_Vibration

	LDA #$06
	STA Bowser_Action, X

	LDA #SND_LEVELBABOOM
	STA Sound_QLevel1

	LDA #$40
	STA Objects_Timer, X
	JMP Bowser_NormPoundDone

Bowser_NormPoundCheckFloat:
	LDA Objects_Timer, X
	BEQ Bowser_NormPoundDown

	LDA #$F8
	STA <Objects_YVelZ, X
	BNE Bowser_NormPoundDone

Bowser_NormPoundDown:
	LDA #$60
	STA <Objects_YVelZ, X

Bowser_NormPoundDone:
	LDA #$04
	STA Objects_Frame, X

	LDA #$00
	STA Objects_Orientation, X

	JMP Bowser_NormDraw

Bowser_NormPoundIdle:
	JSR Bowser_Interaction

	LDA Objects_Timer, X
	BNE Bowser_NormPoundIdleDone
	
	LDA #$01
	STA Bowser_Action, X

	LDA #$C0
	STA Objects_Timer, X

Bowser_NormPoundIdleDone:
	LDA #$05
	STA Objects_Frame, X

	LDA #$00
	STA Objects_Orientation, X

	JMP Bowser_NormDraw
	
Bowser_MaliceTransition:

	LDA #$01
	STA Player_VibeDisable
	
	LDY Object_SpriteRAMOffset, X

	LDA Objects_Timer, X
	BNE Bowser_TransitionWait

	LDA #SND_LEVELPOWER
	STA Sound_QLevel1

	LDA #$08
	STA Bowser_Action, X

	LDA #$30
	STA Objects_Timer, X
	JMP Bowser_NormDraw

Bowser_TransitionWait:
	ADD #$80
	EOR #$FF
	ADD #$01
	STA Sprite_RAMY + 52, Y
	STA Sprite_RAMY + 56, Y

	LDA <Objects_XZ, X
	ADD #$08
	STA Sprite_RAMX + 52, Y
	
	ADD #$08
	STA Sprite_RAMX + 56, Y

	LDA #$79
	STA Sprite_RAMTile + 52, Y
	STA Sprite_RAMTile + 56, Y

	LDA #SPR_PAL1
	STA Sprite_RAMAttr + 52, Y

	ORA #SPR_HFLIP
	STA Sprite_RAMAttr + 56, Y

Bowser_MaliceTransitionDone:
	LDA #$00
	STA Objects_Frame, X

	JMP Bowser_NormDraw

Bowser_PowerUpFrames:
	.byte  $06, $00

Bowser_MalicePowerUp:
	LDA #$01
	STA Player_VibeDisable

	LDA Objects_Timer, X
	BNE Bowser_MalicePowerUpFrame

	LDA #$09
	STA Bowser_Action, X

	LDA #$60
	STA Objects_Timer, X
	JMP Bowser_NormDraw	

Bowser_MalicePowerUpFrame:
	LDA Objects_Timer, X
	LSR A
	LSR A
	AND #$01
	TAY
	LDA Bowser_PowerUpFrames, Y
	STA Objects_Frame, X

Bowser_MalicePowerUpDone:
	JMP Bowser_NormDraw	


Bowser_MaliceIdleNextActions:
	.byte $0A, $0B, $0A, $0B, $0A, $0B, $0A, $0B
	.byte $0F, $0B, $0A, $0F, $0B, $0A, $0B, $0A
	.byte $0F, $0B, $10, $0B, $0F, $10, $0A, $10
	.byte $0F, $0B, $10, $0B, $0F, $10, $0F, $0B
	.byte $0F, $0B, $10, $0B, $0B, $10, $0F, $0B

Bowser_MaliceIdleNextTimers:
	.byte $20, $20, $20, $20, $20, $20, $20, $20
	.byte $60, $20, $20, $60, $20, $20, $20, $20
	.byte $60, $20, $60, $20, $60, $60, $20, $60
	.byte $30, $10, $30, $10, $30, $30, $10, $30
	.byte $30, $08, $30, $08, $08, $30, $08, $30
	
Bowser_MaliceIdle:
	JSR Bowser_Interaction
	JSR Object_FacePlayer

	LDA Objects_Timer, X
	BNE Bowser_MaliceIdleDone

	LDA Random_Pool, X
	AND #$07
	STA <Temp_Var1

	LDA Bowser_AttackPhase, X
	ASL A
	ASL A
	ASL A
	ORA <Temp_Var1
	TAY

	LDA Bowser_MaliceIdleNextActions, Y
	STA Bowser_Action, X

	LDA Bowser_MaliceIdleNextTimers, Y
	STA Objects_Timer, X

	LDA #$00
	STA <Objects_XVelZ, X

Bowser_MaliceIdleDone:
	LDA Objects_Timer, X
	LSR A
	LSR A
	LSR A
	LSR A
	AND #$01
	ADD #$06
	STA Objects_Frame, X

	JMP Bowser_NormDraw

Bowser_MaliceBreatheFire:
	JSR Bowser_Interaction

	LDA Objects_Timer, X
	BNE Bowser_MaliceFireballSetFrames

	JSR SpecialObject_FindEmpty
	BCC Bowser_MaliceBreatheFireReset

	LDA #SND_LEVELFLAME
	STA Sound_QLevel2

	JSR Bowser_MaliceMakeFire

	LDA #$03
	STA SpecialObj_YVel, Y

	JSR SpecialObject_FindEmpty
	BCC Bowser_MaliceBreatheFireReset

	JSR Bowser_MaliceMakeFire

	LDA #$FD
	STA SpecialObj_YVel, Y

	JSR SpecialObject_FindEmpty
	BCC Bowser_MaliceBreatheFireReset

	JSR Bowser_MaliceMakeFire

Bowser_MaliceBreatheFireReset:
	LDA #$09
	STA Bowser_Action, X

	LDA #$60
	STA Objects_Timer, X

Bowser_MaliceFireballSetFrames:
	LDA Objects_Timer, X
	LSR	A
	LSR	A
	LSR	A
	LSR	A
	AND #$01
	EOR #$01
	ADD #$08
	STA Objects_Frame, X

	JMP Bowser_NormDraw

Bowser_MaliceMakeFire:
	LDA #SOBJ_BIGFIREBALL
	STA SpecialObj_ID,Y

	LDA #$10
	STA SpecialObj_Timer,Y

	LDA #$00
	STA SpecialObj_HurtEnemies, Y

	LDA <Objects_XZ,X
	STA SpecialObj_X,Y

	LDA <Objects_XHiZ,X
	STA SpecialObj_XHi,Y

	LDA <Objects_YZ,X
	ADD #$10
	STA SpecialObj_Y,Y

	LDA <Objects_YHiZ, X
	ADC #$00
	STA SpecialObj_YHi,Y

	LDA #$F0
	STA SpecialObj_XVel,Y

	LDA Objects_Orientation, X	
	BEQ Bowser_MaliceMakeFireRTS

	LDA #$10
	STA SpecialObj_XVel, Y

	LDA SpecialObj_X, Y
	ADD #$10
	STA SpecialObj_X, Y

Bowser_MaliceMakeFireRTS	
	RTS

Bowser_MaliceJump:
	JSR Bowser_Interaction

	LDA Objects_Timer, X
	BNE Bowser_MaliceJumpDone

	JSR Object_XDistanceFromPlayer
	LSR A
	LSR A
	LSR A
	LSR A
	TAY

	LDA Bowser_JumpDistance, Y
	STA <Objects_XVelZ, X

	LDA Objects_Orientation, X
	BEQ Bowser_MaliceSetJump

	LDA <Objects_XVelZ, X
	JSR Negate
	STA <Objects_XVelZ, X

Bowser_MaliceSetJump:
	LDA #$A0
	STA <Objects_YVelZ, X

	LDA #$0C
	STA Bowser_Action, X

	LDA #$20
	STA Objects_Timer, X

Bowser_MaliceJumpDone:
	LDA #$07
	STA Objects_Frame, X
	JMP Bowser_NormDraw	

Bowser_MaliceSoar:
	JSR Bowser_Interaction

	LDA Objects_Timer, X
	BNE Bowser_MaliceSoarDone

	LDA <Objects_XVelZ, X
	BEQ Bowser_MaliceStopSoar

	LDA <Objects_YVelZ, X
	BPL Bowser_MaliceStopSoar

	JSR Object_XDistanceFromPlayer
	CMP #18
	BCS Bowser_MaliceSoarDone

Bowser_MaliceStopSoar:
	LDA #$0D
	STA Bowser_Action, X

	LDA #$10
	STA Objects_Timer, X

Bowser_MaliceSoarDone:
	LDA #$06
	STA Objects_Frame, X

	JMP Bowser_NormDraw

Bowser_MalicePound:
	LDA #$00
	STA <Objects_XVelZ, X

	JSR Bowser_Interaction

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BNE Bowser_MalicePoundGround
	
	JMP Bowser_MalicePoundCheckFloat

Bowser_MalicePoundGround:
	LDA #$20
	STA Level_Vibration

	LDA #$0E
	STA Bowser_Action, X

	LDA #SND_LEVELBABOOM
	STA Sound_QLevel1

	LDA #$20
	STA Objects_Timer, X

	JSR SpecialObject_FindEmpty
	BCC Bowser_MalicePoundDone

	LDA #SOBJ_LIGHTNINGBOLT
	STA SpecialObj_ID, Y

	LDA #$04
	STA SpecialObj_Data2, Y

	LDA #$C0
	STA SpecialObj_XVel,Y

	LDA #$00
	STA SpecialObj_YVel, Y

	LDA <Objects_XZ, X
	ADD #$08
	STA SpecialObj_X,Y

	LDA <Objects_XHiZ, X
	STA SpecialObj_XHi,Y

	LDA <Objects_YZ, X
	ADD #$28
	STA SpecialObj_Y,Y

	LDA <Objects_YHiZ, X
	ADC #$00
	STA SpecialObj_YHi,Y

	JSR SpecialObject_FindEmpty
	BCC Bowser_MalicePoundDone

	LDA #SOBJ_LIGHTNINGBOLT
	STA SpecialObj_ID, Y
	
	LDA #$04
	STA SpecialObj_Data2, Y

	LDA #$30
	STA SpecialObj_XVel,Y

	LDA #$00
	STA SpecialObj_YVel, Y

	LDA <Objects_XZ, X
	ADD #$08
	STA SpecialObj_X,Y

	LDA <Objects_XHiZ, X
	STA SpecialObj_XHi,Y

	LDA <Objects_YZ, X
	ADD #$28
	STA SpecialObj_Y,Y

	LDA <Objects_YHiZ, X
	ADC #$00
	STA SpecialObj_YHi,Y	
	JMP Bowser_MalicePoundDone

Bowser_MalicePoundCheckFloat:
	LDA Objects_Timer, X
	BEQ Bowser_MalicePoundDown

	LDA #$F8
	STA <Objects_YVelZ, X
	BNE Bowser_MalicePoundDone

Bowser_MalicePoundDown:
	LDA #$60
	STA <Objects_YVelZ, X

Bowser_MalicePoundDone:
	LDA #$0A
	STA Objects_Frame, X

	LDA #$00
	STA Objects_Orientation, X

	JMP Bowser_NormDraw

Bowser_MalicePoundIdle:
	JSR Bowser_Interaction

	LDA Objects_Timer, X
	BNE Bowser_MalicePoundIdleDone
	
	LDA #$09
	STA Bowser_Action, X

	LDA #$60
	STA Objects_Timer, X

Bowser_MalicePoundIdleDone:
	LDA #$0B
	STA Objects_Frame, X

	LDA #$00
	STA Objects_Orientation, X

	JMP Bowser_NormDraw	


Bowser_BigFirePull:
	.byte $18, $E8

Bowser_MaliceBigFire:
	JSR Bowser_Interaction

	LDA Objects_Timer, X
	BNE Bowser_MaliceBigFireSetFrames

	JSR SpecialObject_FindEmpty
	BCC Bowser_MaliceBigFireReset

	LDA #SND_LEVELFLAME
	STA Sound_QLevel2

	LDA #$00
	STA SndCur_Level2

	LDA #$00
	STA <Temp_Var1
	JSR Bowser_MaliceMakeFastFire

	LDA #$FB
	STA SpecialObj_YVel, Y

	JSR SpecialObject_FindEmpty
	BCC Bowser_MaliceBigFireReset

	LDA #$02
	STA <Temp_Var1
	JSR Bowser_MaliceMakeFastFire

	LDA #$FD
	STA SpecialObj_YVel, Y

	JSR SpecialObject_FindEmpty
	BCC Bowser_MaliceBigFireReset

	LDA #$04
	STA <Temp_Var1
	JSR Bowser_MaliceMakeFastFire

	LDA #$FF
	STA SpecialObj_YVel, Y

	JSR SpecialObject_FindEmpty
	BCC Bowser_MaliceBigFireReset

	LDA #$06
	STA <Temp_Var1
	JSR Bowser_MaliceMakeFastFire

	LDA #$01
	STA SpecialObj_YVel, Y

	JSR SpecialObject_FindEmpty
	BCC Bowser_MaliceBigFireReset

	LDA #$08
	STA <Temp_Var1
	JSR Bowser_MaliceMakeFastFire

	LDA #$03
	STA SpecialObj_YVel, Y

Bowser_MaliceBigFireReset:
	LDA #$09
	STA Bowser_Action, X

	LDA #$60
	STA Objects_Timer, X

	LDA #$00
	STA Player_CarryXVel
	BEQ Bowser_MaliceBigFireNoPull

Bowser_MaliceBigFireSetFrames:
	JSR Object_XDistanceFromPlayer
	
	LDA Bowser_BigFirePull, Y
	STA Player_CarryXVel

Bowser_MaliceBigFireNoPull:
	LDA Sound_QLevel2
 	BNE Bowser_NoWoosh

	LDA #SND_LEVELAIRSHIP
	STA Sound_QLevel2

Bowser_NoWoosh:	
	LDA Objects_Timer, X
	LSR	A
	LSR	A
	LSR	A
	LSR	A
	LSR	A
	LSR	A
	AND #$01
	EOR #$01
	ADD #$08
	STA Objects_Frame, X

	JMP Bowser_NormDraw

Bowser_MaliceMakeFastFire:
	STA <Temp_Var1

	LDA #SOBJ_BIGFIREBALL
	STA SpecialObj_ID,Y

	LDA #$10
	STA SpecialObj_Timer,Y

	LDA #$00
	STA SpecialObj_HurtEnemies, Y

	LDA <Objects_XZ,X
	STA SpecialObj_X,Y

	LDA <Objects_XHiZ,X
	STA SpecialObj_XHi,Y

	LDA <Objects_YZ,X
	ADD #$10
	STA SpecialObj_Y,Y

	LDA <Objects_YHiZ, X
	ADC #$00
	STA SpecialObj_YHi,Y

	LDA #$EC
	SUB <Temp_Var1
	STA SpecialObj_XVel,Y

	LDA Objects_Orientation, X	
	BEQ Bowser_MaliceMakeFastFireRTS

	LDA SpecialObj_XVel,Y
	JSR Negate
	STA SpecialObj_XVel,Y


	LDA SpecialObj_X, Y
	ADD #$10
	STA SpecialObj_X, Y

Bowser_MaliceMakeFastFireRTS:
	RTS	

Bowser_HammerXVel:
	.byte $E0, $E6, $EC, $F2, $F8, $FE

Bowser_HammerThrowFrame:
	.byte $0C, $06

Bowser_ThrowHammer:
	JSR Bowser_Interaction

	LDA Objects_Timer, X
	AND #$0F
	BNE Bowser_ThrowSetFrame

	JSR SpecialObject_FindEmpty
	BCC Bowser_ThrowSetFrame

	LDA Objects_Timer, X
	LSR A
	LSR A
	LSR A
	LSR A
	TAX

	LDA #$00
	STA SpecialObj_HurtEnemies, X

	LDA #SOBJ_HAMMER
	STA SpecialObj_ID, Y

	LDA Bowser_HammerXVel, X
	STA SpecialObj_XVel, Y

	LDA #$90
	STA SpecialObj_YVel, Y

	LDX <CurrentObjectIndexZ
	LDA <Objects_XZ, X
	ADD #$02
	STA SpecialObj_X, Y

	LDA <Objects_XHiZ, X
	ADC #$00
	STA SpecialObj_XHi, Y

	LDA <Objects_YZ, X
	ADD #$06
	STA SpecialObj_Y, Y

	LDA <Objects_YHiZ, X
	ADC #$00
	STA SpecialObj_YHi, Y

	LDA Objects_Orientation, X
	BEQ Bowser_CheckHammerDone

	LDA SpecialObj_XVel, Y
	JSR Negate
	STA SpecialObj_XVel, Y

	LDA SpecialObj_X, Y
	ADD #$14
	STA SpecialObj_X, Y

	LDA SpecialObj_XHi, Y
	ADC #$00
	STA SpecialObj_XHi, Y

Bowser_CheckHammerDone:
	LDA Objects_Timer, X
	BNE Bowser_ThrowSetFrame

Bowser_ThrowDone:
	LDA #$09
	STA Bowser_Action, X

	LDA #$60
	STA Objects_Timer, X

	LDA #$00
	STA Objects_Frame, X
	JMP Bowser_NormDraw

Bowser_ThrowSetFrame:
	LDA Objects_Timer, X
	AND #$08
	LSR A
	LSR A
	LSR A
	TAY

	LDA Bowser_HammerThrowFrame, Y
	STA Objects_Frame, X
	JMP Bowser_NormDraw

MAX_STARS = 189

Bowser_ProcessStarPower:
	JSR Bowser_DetectStar
	BCS Bowser_NoStarIncrease

	LDA Poison_Mode
	BNE Bowser_MarioIsPoison

	LDA Player_Invincible
	BNE Bowser_DecreaseStarPower

Bowser_MarioIsPoison:
	LDA Bowser_StarPower, X
	CMP #MAX_STARS
	BCC Bowser_IncreaseStarPower

	JSR Object_FindEmptyY
	BCC Bowser_NoStarIncrease

	LDA #OBJ_MAGICSTAR_1
	STA Objects_ID, Y

	LDA #OBJSTATE_FRESH
	STA Objects_State, Y

	LDA #$01
	STA Paper_StarInvincibility, Y
	STA Objects_Property, Y

	LDA #$7C
	STA Objects_XZ, Y

	LDA #$00
	STA Objects_XHiZ, Y
	STA Objects_YHiZ, Y

	LDA #$E0
	STA Objects_YZ, Y
	STA Bowser_UpdateStarCount, X
	RTS

Bowser_IncreaseStarPower:
	LDA Game_Counter
	AND #$01
	BNE Bowser_NoStarIncrease

	INC Bowser_StarPower, X

	LDA Bowser_UpdateStarCount, X
	BEQ Bowser_NoStarIncrease

	LDA Bowser_StarPower, X
	INC Paper_Stars

Bowser_NoStarIncrease:
	RTS

Bowser_DecreaseStarPower:
	DEC Bowser_StarPower, X
	DEC Player_Invincible
	DEC Paper_Stars
	RTS

Bowser_MakeStar:

Bowser_DetectStar:
	LDY #$04
	CPY <CurrentObjectIndexZ
	BEQ Bowser_HisIndex

Bowser_StarFindLoop:
	LDA Objects_State, Y
	BNE Bowser_StarFound

Bowser_HisIndex:
	DEY 
	BPL Bowser_StarFindLoop
	CLC
	RTS

Bowser_StarFound:
	SEC
	RTS

Bowser_Die:
	LDA Objects_Timer, X
	BNE Bowser_DieFall

	LDA #SND_LEVELBABOOM
	STA Sound_QLevel1

	LDA #$20
	STA Level_Vibration

	INC Bowser_Action, X

	LDA #$60
	STA Objects_Timer, X
	RTS

Bowser_DieFall:
	LDA #$00
	STA <Objects_TilesDetectZ, X

	LDA Objects_Orientation, X
	ORA #SPR_VFLIP
	STA Objects_Orientation, X

	LDA <Objects_YHiZ, X
	BEQ Bowser_DieFallDown

	LDA <Objects_YZ, X
	CMP #$C0
	BCS Bowser_DieRTS

Bowser_DieFallDown:
	JSR Object_ApplyY_With_Gravity

Bowser_DieRTS:	
	JMP Bowser_NormDraw

Bowser_WaitTimer:
	LDA Bowser_WaitTimerLo, X
	ORA Bowser_WaitTimerHi, X
	BEQ Bowser_WaitNoTime

	DEC Bowser_WaitTimerLo, X
	BPL Bowser_WaitTimerRTS

	LDA Bowser_WaitTimerHi, X
	BEQ Bowser_WaitNoTime

	DEC Bowser_WaitTimerHi, X

	LDA #59
	STA Bowser_WaitTimerLo, X

Bowser_WaitTimerRTS:
	SEC
	RTS

Bowser_WaitNoTime:
	CLC
	RTS

Bowser_DieBottom:
	LDA Objects_Timer, X
	BNE Bowser_DieBottomRTS

	LDA #MUS1_WORLDVICTORY
	STA Sound_QMusic1

	LDA #7
	STA Bowser_WaitTimerHi, X

	LDA #$00
	STA Bowser_WaitTimerLo, X

	INC Bowser_Action, X
	
Bowser_DieBottomRTS:	
	RTS

Bowser_WaitEnding:
	JSR Bowser_WaitTimer
	BCS Bowser_WaitEndingRTS

	INC Bowser_Action, X

Bowser_WaitEndingRTS:
	RTS

Bowser_StartEnding:
	LDA #MUS2A_ENDING
	STA Level_MusicQueue
	STA Credits_Triggered

	INC Bowser_Action, X

	LDA #15
	STA Bowser_WaitTimerHi, X

	LDA #$00
	STA Bowser_WaitTimerLo, X

	LDA #$07
	STA SuperCreditsFade_Tick, X

	LDA #$00
	STA SuperCreditsFade_Index, X
	RTS

SuperCredits_Action = Objects_Data9
SuperCreditsFade_Tick = Objects_Data10
SuperCreditsFade_Index = Objects_Data11

SuperCredits_FadeOut:
	LDA SuperCreditsFade_Tick, X
	BNE SuperCredits_FadeTickDecrease

	LDY #$0F

	LDA #$06
	STA <Graphics_Queue
	
SuperCredits_FadeOutLoop:
	LDA MasterPal_Data, Y
	SUB SuperCreditsFade_Index, X
	BPL SuperCredits_FadeOutStore

	LDA #$0F

SuperCredits_FadeOutStore:
	STA Palette_Buffer, Y
	DEY
	BPL SuperCredits_FadeOutLoop

	LDA SuperCreditsFade_Index, X
	ADD #$10
	CMP #$50
	BCC SuperCredits_Reset

	INC Bowser_Action, X
	RTS

SuperCredits_Reset:
	STA SuperCreditsFade_Index, X

	LDA #$07
	STA SuperCreditsFade_Tick, X

SuperCredits_FadeTickDecrease:
	DEC SuperCreditsFade_Tick, X

Bowser_FadeOutRTS:
	RTS

Bowser_Hold:
	RTS

SuperCredits_LineTimerLow = Objects_Data7
SuperCredits_LineTimerHi = Objects_Data8
SuperCredits_LineIndex = Objects_Data9
SuperCredits_LineWriteIndex = Objects_Data10
SuperCredits_LineWriteColumn = Objects_Data11
SuperCredits_LineWriteTimer = Objects_Data12
SuperCredits_LineWriteToggle = Objects_Data13

SuperCredits_FixPalette:
	LDA Graphics_BufCnt
	BNE SuperCredits_FixPaletteRTS

	LDA #$30
	STA Palette_Buffer + 1

	LDA #$06
	STA Graphics_Queue
	
	LDA #$00
	STA SuperCredits_LineTimerHi, X
	STA SuperCredits_LineTimerLow, X

	LDA #$01
	STA SuperCredits_LineWriteToggle, X

	LDA #$00
	STA SuperCredits_LineWriteColumn, X
	STA SuperCredits_LineWriteIndex, X

	LDA #$02
	STA SuperCredits_LineWriteTimer, X

	INC Bowser_Action, X

SuperCredits_FixPaletteRTS:	
	RTS

SuperCredits_PPUAddr1:
	vaddr $2886

SuperCredits_PPUAddr2:
	vaddr $28C6

SuperCredits_Lines:
	.word SuperCredits_Line1
	.word SuperCredits_Line2
	.word SuperCredits_Line3
	.word SuperCredits_Line4
	.word SuperCredits_Line5
	.word SuperCredits_Line6
	.word SuperCredits_Line7
	.word SuperCredits_Line8
	.word SuperCredits_Line9
	.word SuperCredits_Line10
	.word SuperCredits_Line11
	.word SuperCredits_Line12
	.word SuperCredits_Line13

SuperCredits_Line1
	.db "  CONGRATULATIONS!  "
	.db "                    "

SuperCredits_Line2
	.db "   YOU TOOK ON THE  "
	.db "    THE CHALLENGE   "

SuperCredits_Line3
	.db "   AND MANAGE TO    "
	.db "DEFEAT MALICE BOWSER"

SuperCredits_Line4
	.db " THANK YOU SO MUCH  "
	.db "FOR SEEING ALL THIS "

SuperCredits_Line5
	.db " HACK HAS TO OFFER! "
	.db "                    "

SuperCredits_Line6:
	.db "  THANKS AGAIN FOR  "
	.db "  PLAYING THE GAME  "

SuperCredits_Line7:
	.db "                    "
	.db "                    "


SuperCredits_Line8:
	.db "                    "
	.db "                    "


SuperCredits_Line9:
	.db "      BUT WAIT!     "
	.db "   THERE IS MORE!   "

SuperCredits_Line10:
	.db "   WANT A TOUGHER   "
	.db "     CHALLENGE?     "

SuperCredits_Line11:
	.db "    TRY TAKING ON   "
	.db "  THE MASTER QUEST! "


SuperCredits_Line12:
	.db "    STARTING...     "
	.db "                    "


SuperCredits_Line13:
	.db "      RIGHT         "
	.db "      NOW!!         "

SuperCredits_Low = Temp_Var1
SuperCredits_Hi = Temp_Var2

SuperCredits_Roll:
	LDA #$5C
	STA PatTable_BankSel

	LDA SuperCredits_LineTimerLow, X
	ORA SuperCredits_LineTimerHi, X
	BEQ SuperCredits_LineAction

SuperCredits_RollTimer:
	DEC SuperCredits_LineTimerLow, X
	BNE SuperCredits_RollRTS

	LDA SuperCredits_LineTimerHi, X
	BEQ SuperCredits_RollRTS

	DEC SuperCredits_LineTimerHi, X

	LDA #$20
	STA SuperCredits_LineTimerLow, X

SuperCredits_RollRTS:
	RTS

SuperCredits_LineAction:	
	LDA SuperCredits_LineWriteToggle, X
	BNE SuperCredits_WriteLines
	JMP SuperCredits_LineClear

SuperCredits_WriteLines:
	DEC SuperCredits_LineWriteTimer, X
	BNE SuperCredits_RollRTS

	LDA Graphics_BufCnt
	BNE SuperCredits_RollRTS

	LDA #$02
	STA SuperCredits_LineWriteTimer, X

	JSR SuperCredits_LoadDrawBuffer

	LDA SuperCredits_LineWriteIndex, X
	ASL A
	TAY

	LDA SuperCredits_Lines, Y
	STA <SuperCredits_Low

	LDA SuperCredits_Lines + 1, Y
	STA <SuperCredits_Hi

	LDY SuperCredits_LineWriteColumn, X
	
	LDA [SuperCredits_Low], Y
	STA Graphics_Buffer + 3

	TYA
	ADD #20
	TAY
	
	LDA [SuperCredits_Low], Y
	STA Graphics_Buffer + 7

	LDA #$00
	STA Graphics_Buffer + 8

	LDA #$09
	STA Graphics_BufCnt

	LDA SuperCredits_LineWriteColumn, X
	CMP #19
	BEQ SuperCredits_WriteDone

	INC SuperCredits_LineWriteColumn, X

	LDA #$02
	STA SuperCredits_LineWriteTimer, X
	RTS

SuperCredits_WriteDone:
	INC SuperCredits_LineWriteIndex, X

SuperCredits_WriteLineReset:
	LDA #$20
	STA SuperCredits_LineTimerLow, X

	LDA #$04
	STA SuperCredits_LineTimerHi, X

	LDA SuperCredits_LineWriteToggle, X
	EOR #$01
	STA SuperCredits_LineWriteToggle, X

	LDA #$02
	STA SuperCredits_LineWriteTimer, X

	LDA #$00
	STA SuperCredits_LineWriteColumn, X

	LDA SuperCredits_LineWriteToggle, X
	BEQ SuperCredits_WriteLineResetRTS

	LDA SuperCredits_LineWriteIndex, X
	CMP #13
	BNE SuperCredits_WriteLineResetRTS

	JMP SuperCredits_Finish

SuperCredits_WriteLineResetRTS:
	RTS

SuperCredits_LineClear:
	DEC SuperCredits_LineWriteTimer, X
	BNE SuperCredits_WriteLineResetRTS

	LDA Graphics_BufCnt
	BNE SuperCredits_WriteLineResetRTS

	JSR SuperCredits_LoadDrawBuffer

	LDY SuperCredits_LineWriteColumn, X
	
	LDA #$FF
	STA Graphics_Buffer + 3
	STA Graphics_Buffer + 7

	LDA #$00
	STA Graphics_Buffer + 8

	LDA #$09
	STA Graphics_BufCnt

	LDA SuperCredits_LineWriteColumn, X
	CMP #20
	BEQ SuperCredits_WriteLineReset

	INC SuperCredits_LineWriteColumn, X

	LDA #$02
	STA SuperCredits_LineWriteTimer, X
	RTS

SuperCredits_LoadDrawBuffer:
	LDA SuperCredits_PPUAddr1
	STA Graphics_Buffer

	LDA SuperCredits_PPUAddr1 + 1
	ADD SuperCredits_LineWriteColumn, X
	STA Graphics_Buffer + 1

	LDA SuperCredits_PPUAddr2
	STA Graphics_Buffer + 4

	LDA SuperCredits_PPUAddr2 + 1
	ADD SuperCredits_LineWriteColumn, X
	STA Graphics_Buffer + 5

	LDA #$01
	STA Graphics_Buffer + 2
	STA Graphics_Buffer + 6
	RTS

SuperCredits_Finish:
	LDA #MUS1_STOPMUSIC
	STA Level_MusicQueue


	LDA #$00
	LDY #$10

Reset_Levels:
	STA Paper_Stars_Collected1, Y
	STA Paper_Stars_Collected2, Y
	STA Paper_Stars_Collected3, Y
	STA Levels_Complete, Y
	DEY
	BPL Reset_Levels

	LDA #$00	
	STA Paper_Stars

	LDA #SECOND_QUEST
	STA SecondQuest

	LDA #ABILITY_MAX
	STA Player_Level

	LDA #$00
	STA Credits_Triggered

	LDA #$01
	STA World_Num

	LDA #$20
	STA World_Map_X
	STA Map_Entered_X
	STA Map_Previous_X

	LDA #$50
	STA Map_Entered_Y
	STA Map_Previous_Y
	STA World_Map_Y

	LDA #$00
	STA Map_Entered_XHi
	STA Map_Previous_XHi
	STA World_Map_XHi

	JSR Save_Game

	JMP IntReset

Bowser_EjectMario:
	LDA #96
	STA Bowser_Health, X

	LDA #$01
	STA Objects_Timer2, X
	STA Player_VibeDisable

	LDA #$40
	STA <Objects_YVelZ, X

	JSR Bowser_Interaction

	LDA <Objects_TilesDetectZ, X
	AND #HIT_GROUND
	BEQ Bowser_EjectMarioRTS

	LDA #$20
	STA Level_Vibration
	INC Bowser_Action, X

	LDA #SND_LEVELBABOOM
	STA Sound_QLevel1

	LDA #$5
	STA Objects_Frame, X
	JMP Bowser_NormDraw	

Bowser_EjectMarioRTS:
	LDA #$04
	STA Objects_Frame, X
	JMP Bowser_NormDraw	

Bowser_ByeByeMario:
	LDA #$C0
	STA <Player_YVelZ
	STA <Player_InAir

	LDA <Player_YHiZ
	BNE Bowser_ContByeByeMario

	LDA <Player_YZ
	CMP #$80
	BCS Bowser_ContByeByeMario

	LDA #$01
	STA CompleteLevelTimer

	LDA #$00
	STA Credits_Triggered	

	INC Bowser_Action, X

Bowser_ContByeByeMario:
	LDA #$05
	STA Objects_Frame, X
	JMP Bowser_NormDraw

Bowser_NextQuest:
	RTS