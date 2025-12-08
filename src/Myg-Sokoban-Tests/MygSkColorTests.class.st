Class {
	#name : 'MygSkColorTests',
	#superclass : 'TestCase',
	#category : 'Myg-Sokoban-Tests',
	#package : 'Myg-Sokoban-Tests'
}

{ #category : 'tests' }
MygSkColorTests >> testBoardFinishedWithMatchingColors [
	"Vérifie que le niveau est fini si les couleurs correspondent"
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
	
	"5. Action : Le joueur pousse la boite vers la cible)"
	board player moveEast.
	
	"6. Vérification"
	self assert: board isFinished.
]

{ #category : 'tests' }
MygSkColorTests >> testBoardNotFinishedWithMismatchingColors [ 
	"Vérifie que le niveau n'est pas fini si les couleurs ne correspondent pas"
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
	
	"5. Action : Le joueur pousse la boite vers la cible)"
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
MygSkColorTests >> testParsingAssignsCorrectColors [
	"Vérifie que les 6 nouveaux caractères (R, r, B, b, G, g) sont correctement convertis en objets colorés."
	| board redBox redTarget blueBox blueTarget greenBox greenTarget |
	
	board := MygSkBoard createWithBoard: (MygLevelImporter fromString: 
'#######' , String cr ,
'#@ R B G #' , String cr ,
'# r b g #' , String cr ,
'#######' fromPackage: MygSkBoard package).
	
	"recuperation des boites"
	redBox := board boxes detect: [ :e | e color = #red ] ifNone: [ nil ].
	blueBox := board boxes detect: [ :e | e color = #blue ] ifNone: [ nil ].
	greenBox := board boxes detect: [ :e | e color = #green ] ifNone: [ nil ].
	
	"récupération des cibles "
	redTarget := (board grid contents select: [ :e | e isTarget and: [ e color = #red ] ]) first.
	blueTarget := (board grid contents select: [ :e | e isTarget and: [ e color = #blue ] ]) first.
	greenTarget := (board grid contents select: [ :e | e isTarget and: [ e color = #green ] ]) first.

	"verif des 6 elements"
	"Rouge"
	self assert: redBox class equals: MygSkBox.
	self assert: redBox color equals: #red.
	self assert: redTarget class equals: MygSkTarget.
	self assert: redTarget color equals: #red.

	"Bleu"
	self assert: blueBox class equals: MygSkBox.
	self assert: blueBox color equals: #blue.
	self assert: blueTarget class equals: MygSkTarget.
	self assert: blueTarget color equals: #blue.

	"Vert"
	self assert: greenBox class equals: MygSkBox.
	self assert: greenBox color equals: #green.
	self assert: greenTarget class equals: MygSkTarget.
	self assert: greenTarget color equals: #green.

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
