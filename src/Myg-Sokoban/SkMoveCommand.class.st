Class {
	#name : 'SkMoveCommand',
	#superclass : 'SkCommand',
	#instVars : [
		'direction',
		'player',
		'board',
		'boxPushed'
	],
	#category : 'Myg-Sokoban',
	#package : 'Myg-Sokoban'
}

{ #category : 'accessing' }
SkMoveCommand >> board: aBoard [ 
	board := aBoard

]

{ #category : 'accessing' }
SkMoveCommand >> direction: aDirection [ 
	direction := aDirection

]

{ #category : 'executing' }
SkMoveCommand >> execute [
	"Exécute le déplacement et enregistre si une boîte a été poussée"
	| previousPosition newPosition neighbor |
	
	previousPosition := player position.
	newPosition := direction * previousPosition.
	neighbor := board atPosition: newPosition.
	
	"Vérifie si l'on est en train de pousser une boîte"
	(neighbor isBox) ifTrue: [
		boxPushed := player move: direction.
		^ boxPushed
	].
	
	boxPushed := false.
	^ player move: direction


]

{ #category : 'as yet unclassified' }
SkMoveCommand >> oppositeDirection [ 
	direction class = CpNorthDirection ifTrue: [ ^ CpDirection south ].
	direction class = CpSouthDirection ifTrue: [ ^ CpDirection north ].
	direction class = CpEastDirection ifTrue: [ ^ CpDirection west ].
	direction class = CpWestDirection ifTrue: [ ^ CpDirection east ].
	^ direction

]

{ #category : 'accessing' }
SkMoveCommand >> player: aPlayer [ 
	player := aPlayer


]

{ #category : 'executing' }
SkMoveCommand >> undo [ 
	| oppositeDirection currentPosition neighbor |
	oppositeDirection := self oppositeDirection.
	
	"Reculer le joueur"
	player move: oppositeDirection.
	
	"Si une boîte a été poussée, la ramener en arrière"
	boxPushed ifTrue: [
		currentPosition := player position.
		neighbor := board atPosition: (direction * (direction * currentPosition)).
		neighbor move: oppositeDirection.
	]

]
