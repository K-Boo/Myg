Class {
	#name : 'MygSkColorTests',
	#superclass : 'TestCase',
	#category : 'Myg-Sokoban-Tests',
	#package : 'Myg-Sokoban-Tests'
}

{ #category : 'tests' }
MygSkColorTests >> testBalancedColorsAssignment [
	"Vérifie que la distribution des couleurs est équilibrée en lançant une vraie partie via le GameManager."
	| manager board boxes targets redBoxes redTargets blueBoxes blueTargets greenBoxes greenTargets |
	

	manager := MygSkGameManager new.
	manager launchFromString: 
'#######' , String cr ,
'#@ $ .#' , String cr ,
'#  $ .#' , String cr ,
'#  $ .#' , String cr ,
'#  $ .#' , String cr ,
'#  $ .#' , String cr ,
'#  $ .#' , String cr ,
'#######'.
	board := manager currentBoardElement board.
	
	"La méthode assignBalancedColors a dû être appelée automatiquement lors de l'initialisation du plateau"
	
	boxes := board boxes.
	targets := board grid contents select: [ :e | e isTarget ].
	
	"on verifie que les boites et cibles sont bien rouges vertes ou bleues"
	boxes do: [ :b | self assert: ({#red. #blue. #green} includes: b color) ].
	targets do: [ :t | self assert: ({#red. #blue. #green} includes: t color) ].
	
	"on verifie qu'il y a le même nombre de cible/boites par couleur"
	redBoxes := boxes count: [ :b | b color = #red ].
	redTargets := targets count: [ :t | t color = #red ].
	
	blueBoxes := boxes count: [ :b | b color = #blue ].
	blueTargets := targets count: [ :t | t color = #blue ].
	
	greenBoxes := boxes count: [ :b | b color = #green ].
	greenTargets := targets count: [ :t | t color = #green ].
	
	"5. ASSERTIONS D'ÉQUILIBRE"
	self assert: redBoxes equals: redTargets.
	self assert: blueBoxes equals: blueTargets.
	self assert: greenBoxes equals: greenTargets.
]

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
