Class {
	#name : 'MygSkUndoTest',
	#superclass : 'TestCase',
	#category : 'Myg-Sokoban-Tests',
	#package : 'Myg-Sokoban-Tests'
}

{ #category : 'tests' }
MygSkUndoTest >> testMultipleUndos [ 
	"context: Le joueur effectue deux déplacements vers le sud."
	| board player startPos |
	board := MygSkBoard boardTest.
	player := board player.
	startPos := player position.
	board movePlayer: CpDirection south.
	board movePlayer: CpDirection south.
	
	"trigger: Annuler deux fois."
	board undo.
	board undo.
	
	"assert-check: Le joueur doit être revenu à sa position initiale."
	self assert: player position equals: startPos.

]

{ #category : 'tests' }
MygSkUndoTest >> testResetClearsHistory [ 
	"context: Le joueur bouge, puis reset le plateau."
	| board |
	board := MygSkBoard boardTest.
	board movePlayer: CpDirection south.
	
	"trigger: Réinitialiser le plateau."
	board reset. 
	
	"assert-check: L'historique doit être vide."
	self assert: board history isEmpty.

]

{ #category : 'tests' }
MygSkUndoTest >> testUndoBoxPush [ 
	"context: Le joueur est à côté d'une caisse. Joueur à 3@5, Caisse à 4@5. La case à 5@5 est vide."
	| board player box startPos boxStartPos |
	board := MygSkBoard boardTest.
	player := board player.
	
	"Setup: Déplacer le joueur pour qu'il soit à l'ouest de la caisse"
	board movePlayer: CpDirection south. "Joueur maintenant à 3@5"
	startPos := player position.
	box := board boxes detect: [ :b | b position = (4@5) ].
	boxStartPos := box position.
	
	"trigger: Pousser la caisse vers l'est, puis annuler."
	board movePlayer: CpDirection east. "Pousse la caisse à 5@5"
	board undo.
	
	"assert-check: Le joueur doit être revenu à 3@5. La caisse doit être revenue à 4@5."
	self assert: player position equals: startPos.
	self assert: box position equals: boxStartPos.
]

{ #category : 'tests' }
MygSkUndoTest >> testUndoEmptyHistory [ 
	"context: Le jeu vient de commencer, aucune action n'a été effectuée."
	| board player startPos |
	board := MygSkBoard boardTest.
	player := board player.
	startPos := player position.
	
	"trigger: Tenter d'annuler sans historique."
	board undo.
	
	"assert-check: Le joueur ne doit pas avoir bougé et aucune erreur ne doit survenir."
	self assert: player position equals: startPos.

]

{ #category : 'tests' }
MygSkUndoTest >> testUndoSimpleMove [
	"context: Le joueur est sur une case de départ (3@4). La case au sud (3@5) est vide."
	| board player startPos |
	board := MygSkBoard boardTest.
	player := board player.
	startPos := player position.
	
	"trigger: Déplacer le joueur vers le sud, puis annuler."
	board movePlayer: CpDirection south.
	board undo.
	
	"assert-check: Le joueur doit être revenu à sa position de départ (3@4)."
	self assert: player position equals: startPos.
]
