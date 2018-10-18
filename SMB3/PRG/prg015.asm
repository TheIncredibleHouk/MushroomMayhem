    .org ObjectGroup_InitJumpTable
;****************************** OBJECT INITIALIZATION ******************************


    .org ObjectGroup_NormalJumpTable
;****************************** OBJECT GAME LOOP ******************************


    .org ObjectGroup_CollideJumpTable
;****************************** OBJECT PLAYER INTERACTION ******************************


    .org ObjectGroup_PatTableSel
;****************************** OBJECT PALETTE/SIZE ******************************


    .org ObjectGroup_PatTableSel
;****************************** OBJECT PATTERN TABLE ******************************


	.org ObjectGroup_KillAction	
;****************************** OBJECT DEATH ROUTINE ******************************



OG6_POff .func (\1 - ObjectGroup06_PatternSets)

	.org ObjectGroup_PatternStarts	; <-- help enforce this table *here*
;****************************** OBJECT FRAME TABLE ******************************



	.org ObjectGroup_PatternSets	; <-- help enforce this table *here*
;****************************** OBJECT FRAMES DEFINITION ******************************    
ObjectGroup06_PatternSets: