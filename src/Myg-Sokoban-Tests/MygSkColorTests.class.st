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
	
	"context"
	manager := MygSkGameManager new.
	manager launchFromString: 
'#######' , String cr ,
'#     #' , String cr ,
'#@ $ .#' , String cr ,
'#  $ .#' , String cr ,
'#  $ .#' , String cr ,
'#  $ .#' , String cr ,
'#  $ .#' , String cr ,
'#  $ .#' , String cr ,
'#     #' , String cr ,
'#######'.
	board := manager currentBoardElement board.
	
	boxes := board boxes.
	targets := board grid contents select: [ :e | e isTarget ].
	
	"assert"
	boxes do: [ :b | self assert: ({#red. #blue. #green} includes: b color) ].
	targets do: [ :t | self assert: ({#red. #blue. #green} includes: t color) ].
	
	redBoxes := boxes count: [ :b | b color = #red ].
	redTargets := targets count: [ :t | t color = #red ].
	
	blueBoxes := boxes count: [ :b | b color = #blue ].
	blueTargets := targets count: [ :t | t color = #blue ].
	
	greenBoxes := boxes count: [ :b | b color = #green ].
	greenTargets := targets count: [ :t | t color = #green ].
	
	self assert: redBoxes equals: redTargets.
	self assert: blueBoxes equals: blueTargets.
	self assert: greenBoxes equals: greenTargets.
]

{ #category : 'tests' }
MygSkColorTests >> testBoardFinishedWithMatchingColors [
	"Vérifie que le niveau est fini si les couleurs correspondent"
	| board grid box target ground player |
	
	"context"
	player := MygSkPlayer new.
	player background: MygSkGround new.
	
	box := MygSkBox new.
	ground := MygSkGround new.
	box background: ground.
	
	target := MygSkTarget new.
	
	box color: #red.
	target color: #red.
	
	grid := CTNewArray2D width: 3 height: 1.
	grid at: 1@1 put: player.
	grid at: 2@1 put: box.
	grid at: 3@1 put: target.
	
	board := MygSkBoard new.
	board configureGrid: grid.
	
	"trigger"
	board player moveEast.
	
	"assert"
	self assert: board isFinished.
]

{ #category : 'tests' }
MygSkColorTests >> testBoardNotFinishedWithMismatchingColors [ 
	"Vérifie que le niveau n'est pas fini si les couleurs ne correspondent pas"
	| board grid box target ground player |
	
	"context"
	player := MygSkPlayer new.
	player background: MygSkGround new.
	
	box := MygSkBox new.
	ground := MygSkGround new.
	box background: ground.
	
	target := MygSkTarget new.
	
	box color: #red.
	target color: #blue.
	
	grid := CTNewArray2D width: 3 height: 1.
	grid at: 1@1 put: player.
	grid at: 2@1 put: box.
	grid at: 3@1 put: target.

	board := MygSkBoard new.
	board configureGrid: grid.
	
	"trigger"
	board player moveEast.
	
	"assert"
	self assert: board isFinished.
]

{ #category : 'tests' }
MygSkColorTests >> testColorAssignment [
	"Vérifie que l'on peut donner une couleur à une boite et une cible"
	"context"
	| box target |
	box := MygSkBox new.
	target := MygSkTarget new.
	
	"trigger"
	box color: #red.
	target color: #blue.
	
	"assert"
	self assert: box color equals: #red.
	self assert: target color equals: #blue.
]

{ #category : 'tests' }
MygSkColorTests >> testTargetAcceptsMatchingBox [
	"Vérifie que la cible accepte une boite de la même couleur"
	"context"
	| box target |
	box := MygSkBox new.
	box color: #red.
	
	"trigger"
	target := MygSkTarget new.
	target color: #red.
	
	"assert"
	self assert: (target acceptsBox: box).
]

{ #category : 'tests' }
MygSkColorTests >> testTargetRefusesDifferentBox [
	"Vérifie que la cible refuse une boite de couleur différente"
	"context"
	| box target |
	box := MygSkBox new.
	box color: #red.
	
	"trigger"
	target := MygSkTarget new.
	target color: #blue.
	
	"assert"
	self deny: (target acceptsBox: box).
]
