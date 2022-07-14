InitPals_Per_MapPUp:
	; Palettes as indexed by InitPal_Per_MapPowerup
	; Note that the first byte is never actually used.
	; Also note this should agree with Map_PostJC_PUpPP1/2 in PRG010
	; See also PRG027 InitPals_Per_MapPUp
	.byte $FF,  $0F, $16, $36	; 0 - Mario default palette
	.byte $FF,  $0F, $16, $36	; 1 - #DAHRKDAIZ SUPER MARIO
	.byte $FF,  $06, $30, $36	; 2 - Fire Flower
	.byte $FF,  $0F, $16, $36	; 3 - Leaf (Not used, uses 0 or 1 as appropriate)
	.byte $FF,  $0F, $28, $36	; 4 - Frog Suit
	.byte $FF,  $0F, $19, $36	; 5 - #DAHRKDAIZ Koopa Suit
	.byte $FF,  $0F, $30, $27	; 6 - Hammer Suit
	.byte $FF,  $01, $30, $31	; 7 - #DAHRKDAIZ Ice Mario
	.byte $FF,  $06, $27, $36	; 8 - #DAHRKDAIZ Fire Fox Mario
	.byte $FF,  $01, $30, $31	; 9 - Unused
	.byte $FF,  $0F, $06, $30	; A - #DAHRKDAIZ Boo Mario
	.byte $FF,  $0F, $36, $36	; B - #DAHRKDAIZ Ninja Mario

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Setup_PalData
;
; This subroutine loads the Pal_Data array with a set
; of colors based on Level_Tileset and the values in
; PalSel_Tile_Colors and PalSel_Obj_Colors OR base on
; the override value Pal_Force_Set12.  This also
; performs the corrections of red/green for Mario vs.
; Luigi (see Map_PlayerPalFix and BonusGame_PlayerPal)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Setup_PalData:
	LDX #$01
	LDA PaletteEffect
	
	CMP #$02
	BNE SetDNActive1
	
	LDX #$00

SetDNActive1:
	STX DayNightActive

	LDA PAGE_C000
	STA DAIZ_TEMP1

	LDA #20
	STA PAGE_C000

	JSR PRGROM_Change_C000

	LDA #$00
	STA <Temp_Var2

	LDA PaletteIndex
	STA <Temp_Var1
	CLC
	ROL <Temp_Var1
	ROL <Temp_Var2

	ROL <Temp_Var1
	ROL <Temp_Var2

	ROL <Temp_Var1
	ROL <Temp_Var2

	ROL <Temp_Var1
	ROL <Temp_Var2

	ROL <Temp_Var1
	ROL <Temp_Var2

	LDA <Temp_Var2
	CLC
	ADC #$C0
	STA <Temp_Var2
	; Copy 32 bytes of data into Pal_Data
	LDY #31	 ; Y = 31 (32 bytes total, a whole bg/sprite palette set)
	LDX #$0F

PRG027_B85E:
	LDA [Temp_Var1],Y
	STA Pal_Data,Y	
	
	CPY #$10
	BCS SkipMasterBackup
	STA MasterPal_Data, X
	DEX

SkipMasterBackup:
	DEY		 ; Y--
	BPL PRG027_B85E	 ; While Y >= 0, loop

	LDA DayNightActive
	BEQ No_Darken
	LDA DayNight
	BEQ No_Darken
	LDA Pal_Data
	CMP #$0F
	BEQ No_Darken

	LDX #$0F

Darken_Pal:
	LDA Pal_Data, X
	SEC
	SBC #$10
	BMI Skip_Darken
	STA Pal_Data, X

Skip_Darken:
	DEX
	BPL Darken_Pal

	LDA #$0F
	STA Pal_Data

No_Darken:
	; Technically all transparent colors are duplicates, but this basically
	; ensures that they're all equivalent in the palette RAM copy...
	LDA Pal_Data
	STA Pal_Data+16
	STA Pal_Data+20
	STA Pal_Data+24
	STA Pal_Data+28


	; The following patches in the correct palette for the
	; power-up the Player current has active.  Note this is
	; ONLY for the INITIAL LOADING of the map screen.

	LDA World_Map_Power	; A = World_Map_Power of this player
	ASL A		 
	ASL A		 
	TAY		 	; Y <<= 2

	; Store the correct power-up suit colors over the Player colors
	LDA InitPals_Per_MapPUp+3,Y
	STA Pal_Data+19
	LDA InitPals_Per_MapPUp+2,Y
	STA Pal_Data+18
	LDA InitPals_Per_MapPUp+1,Y
	STA Pal_Data+17 

PRG027_B8F9:
	; restores the C000 bank
	LDA DAIZ_TEMP1
	STA PAGE_C000
	JSR PRGROM_Change_C000

	RTS		 ; Return

Messages_Lookup:
	.word Empty_Message
	.word Test_Message

Empty_Message:
	.byte $00

Test_Message:                ;V 
	.db "TESTING MESSAGE TIME!"
	.db "WILL THIS DRAW OUT?"
	.byte 00

Message_Low = Temp_Var1
Message_Hi = Temp_Var2
Message_Text_Top = Status_Bar_Top
Message_Text_Bottom = Status_Bar_Bottom - 21

Messages_Display:
	LDA Message_Drawn
	BNE Messages_DisplayRTS

	LDA #$01
	STA Top_Needs_Redraw
	STA Bottom_Needs_Redraw

	LDA Message_Id
	ASL A
	TAX

	LDA Messages_Lookup, X
	STA <Message_Low

	LDA Messages_Lookup + 1, X
	STA <Message_Hi

	LDY #$00

Message_Load:	
	LDA [Message_Low], Y
	BEQ Message_Fill

	CPY #21
	BCS Message_Write_Bottom

	STA Message_Text_Top, Y
	JMP Message_Loop

Message_Write_Bottom:
	STA Message_Text_Bottom, Y

Message_Loop:
	INY
	CPY #42
	BCC Message_Load

	INC Message_Drawn
	RTS

Message_Fill:
	LDA #$20

	CPY #$21
	BCS Message_Fill_Bottom
	STA Message_Text_Top, Y
	JMP Message_Fill_Loop

Message_Fill_Bottom:
	STA Message_Text_Bottom, Y

Message_Fill_Loop:	
	INY
	CPY #42
	BCC Message_Fill

	INC Message_Drawn

Messages_DisplayRTS:	
	RTS