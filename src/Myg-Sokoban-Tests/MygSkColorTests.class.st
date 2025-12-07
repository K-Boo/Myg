Class {
	#name : 'MygSkColorTests',
	#superclass : 'TestCase',
	#category : 'Myg-Sokoban-Tests',
	#package : 'Myg-Sokoban-Tests'
}

{ #category : 'tests' }
MygSkColorTests >> testBoardFinishedWithMatchingColors [
	| board grid box target ground player |
	
	"1. Création manuelle des éléments car bug sinon"
	player := MygSkPlayer new.
	player background: MygSkGround new. 
	
	box := MygSkBox new.
	ground := MygSkGround new.
	box background: ground.
	
	target := MygSkTarget new.
	
	"2. Configuration des couleurs"
	box color: #red.
	target color: #red.
	
	"3. Création de la grille (3 cases de large : Joueur | Boite | Cible)"
	grid := CTNewArray2D width: 3 height: 1.
	grid at: 1@1 put: player.
	grid at: 2@1 put: box.
	grid at: 3@1 put: target.
	
	"4. Initialisation du plateau"
	board := MygSkBoard new.
	board configureGrid: grid. 
	
	"5. Action : Le joueur pousse la boite vers la cible"
	board player moveEast.
	
	"6. Vérification"
	self assert: board isFinished.
]

{ #category : 'tests' }
MygSkColorTests >> testBoardNotFinishedWithMismatchingColors [ 
	| board grid box target ground player |
	
	"1. Création manuelle des éléments car bug sinon"
	player := MygSkPlayer new.
	player background: MygSkGround new. 
	
	box := MygSkBox new.
	ground := MygSkGround new.
	box background: ground.
	
	target := MygSkTarget new.
	
	"2. Configuration des couleurs differentes"
	box color: #red.
	target color: #blue.
	
	"3. Création de la grille (3 cases de large : Joueur | Boite | Cible)"
	grid := CTNewArray2D width: 3 height: 1.
	grid at: 1@1 put: player.
	grid at: 2@1 put: box.
	grid at: 3@1 put: target.
	
	"4. Initialisation du plateau"
	board := MygSkBoard new.
	board configureGrid: grid. 
	
	"5. Action : Le joueur pousse la boite vers la cible"
	board player moveEast.
	
	"6. Vérification"
	self assert: board isFinished.
]

{ #category : 'tests' }
MygSkColorTests >> testColorAssignment [
	"Vérifie que l'on peut donner une couleur à une boite et une cible"
	| box target |
	box := MygSkBox new.
	target := MygSkTarget new.
	
	box color: #red.
	target color: #blue.
	
	self assert: box color equals: #red.
	self assert: target color equals: #blue.
]

{ #category : 'tests' }
MygSkColorTests >> testTargetAcceptsMatchingBox [
	"Vérifie que la cible accepte une boite de la même couleur"
	| box target |
	box := MygSkBox new.
	box color: #red.
	
	target := MygSkTarget new.
	target color: #red.
	
	self assert: (target acceptsBox: box).
]

{ #category : 'tests' }
MygSkColorTests >> testTargetRefusesDifferentBox [
	"Vérifie que la cible refuse une boite de couleur différente"
	| box target |
	box := MygSkBox new.
	box color: #red.
	
	target := MygSkTarget new.
	target color: #blue.
	
	self deny: (target acceptsBox: box).
]
