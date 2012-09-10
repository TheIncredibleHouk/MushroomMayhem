#POOF EFFECT
	
	; "Poof" sound
	LDA Sound_QLevel1
	ORA #SND_LEVELPOOF
	STA Sound_QLevel1

	; "Poof" effect
	LDA #$17
	STA Player_SuitLost

	Boo_Mode_Timer
	Boo_Mode_KillTimer

	Object $25 change map location:
		- Y > #$10 - Change map to low end
		- Y < #$10 and X even - Change X position
		- Y < #$10 and X odd - Change Y position

MAP SPRITE LOCATION:
	0x16148

PALETTE_LOCATION:
	0x36BE2

Y Postion Start:
	01 = 17
	05 = ?
	08 = 01
	0C = 15
	17   = 10
Quick tags:
#INVENTORY ITEM PALETTE		- Palette used for display of inventory items
#ITEM USE JUMP TABLE		- Code that uses an item
#INVENTORY SPRITES			- Definition of sprites for inventory items

Plains:		1Exxx,
Dungeon:	2Axxx,
Hilly:		20xxx,
Ice/Woods:		22xxx,

e-blocks
1-4X
2-5X
3-Ax

e-switch
1-02
2-05
3-04

Patternt Table Swap = PatTable_BankSel

Custom Blocks:
? Green Star -			Ice Flower
Brick Fire Flower -		Frog Suit
Brick Leaf -			Fox Leaf
Brick Star -			Koopa Shell
Brick Green Star -		Sledge Suit
M-Coin Block -			Pumpkin
Brick 1-Up -			Ninja Shroom
Wooden Blocks -			Hollow Eye Blocks
Green Note Blocks -		Moon Blocks
Brick Coins	-			Sun Blocks
Moveable Wood-			Ice
Silver Coins-			Frozen Coins		

Beta Tags
----------------------

a.lindstrom@live.se: .byte $02, $00, $00, $02, $02, $02
abbynfox@gmail.com: .byte $03, $03, $00, $01, $0E, $0F
ailure@gmail.com: .byte $02, $01, $0F, $03, $04, $18
nicole8174@gmail.com: .byte $12, $F1, $8F, $09, $24, $1F