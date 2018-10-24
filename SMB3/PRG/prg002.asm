    .org ObjectGroup_InitJumpTable
;****************************** OBJECT INITIALIZATION ******************************
	; 
OBJ_POWERUP 		= $01

	.word ObjInit_DoNothing	; Object $00

	
	.org ObjectGroup_NormalJumpTable	; <-- help enforce this table *here*
;****************************** OBJECT GAME LOOP ******************************
	.word ObjNorm_DoNothing	; Object $00	

	.org ObjectGroup_CollideJumpTable	; <-- help enforce this table *here*
;****************************** OBJECT PLAYER INTERACTION ******************************
	.word ObjHit_DoNothing	; Object $00	

	.org ObjectGroup_Attributes	; <-- help enforce this table *here*
;****************************** OBJECT PALETTE/SIZE ******************************
	.byte OA1_PAL1 | OA1_HEIGHT16 | OA1_WIDTH16	; Object $00	

	.org ObjectGroup_PatTableSel	; <-- help enforce this table *here*
;****************************** OBJECT PATTERN TABLE ******************************
	.byte OPTS_NOCHANGE		; Object $00

	
	.org ObjectGroup_KillAction	; <-- help enforce this table *here*
;****************************** OBJECT DEATH ROUTINE ******************************
	.byte KILLACT_POOFDEATH		; Object $00


OG2_POff .func (\1 - ObjectGroup02_PatternSets)

	.org ObjectGroup_PatternStarts	; <-- help enforce this table *here*

	; Index by object group relative index (ObjGroupRel_Idx)
	.byte OG2_POff(ObjP14), OG2_POff(ObjP15), OG2_POff(ObjP16), OG2_POff(Obj17)
    .byte OG2_POff(ObjP18), OG2_POff(ObjP19), OG2_POff(ObjP1A), OG2_POff(Obj1B)
    .byte OG2_POff(ObjP1C), OG2_POff(ObjP1D), OG2_POff(ObjP1E), OG2_POff(Obj1F)
    .byte OG2_POff(ObjP20), OG2_POff(ObjP21), OG2_POff(ObjP22), OG2_POff(Obj21)
    .byte OG2_POff(ObjP22), OG2_POff(ObjP23), OG2_POff(ObjP24), OG2_POff(Obj25)

ObjectGroup02_PatternSets:

ObjP14:
ObjP15:
ObjP16:
ObjP17:
ObjP18:
ObjP19:
ObjP1A:
ObjP1B:
ObjP1C:
ObjP1D:
ObjP1E:
ObjP1F:
ObjP20:
ObjP21:
ObjP22:
ObjP23:
ObjP24:
ObjP25: