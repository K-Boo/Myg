Class {
	#name : 'MygSkColorTests',
	#superclass : 'TestCase',
	#category : 'Myg-Sokoban-Tests',
	#package : 'Myg-Sokoban-Tests'
}

{ #category : 'tests' }
MygSkColorTests >> testBoardFinishedWithMatchingColors [
	"Vérifie que le niveau est fini seulement si les couleurs correspondent"
	| board box target |

	board := MygSkBoard createWithBoard: 
		(MygLevelImporter fromString: '@$ .' fromPackage: MygSkBoard package).
	
	box := board boxes first.
	box color: #red.
	
	target := (board grid contents select: [ :each | each isTarget ]) first.
	target color: #red.
	
	board player moveEast.
	
	self assert: board isFinished.
]

{ #category : 'tests' }
MygSkColorTests >> testBoardNotFinishedWithMismatchingColors [ 
	"Vérifie que le niveau n'est pas fini si les couleurs ne correspondent pas"
	| board box target |
	board := MygSkBoard createWithBoard: 
		(MygLevelImporter fromString: '@$ .' fromPackage: MygSkBoard package).
	
	box := board boxes first.
	box color: #red.
	
	target := (board grid contents select: [ :each | each isTarget ]) first.
	target color: #blue.
	
	board player moveEast.
	
	self deny: board isFinished.
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
