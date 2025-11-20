Class {
	#name : 'MygSkBoardElementTest',
	#superclass : 'TestCase',
	#instVars : [
		'boardElement',
		'gameManager',
		'board',
		'space'
	],
	#category : 'Myg-Sokoban-Tests',
	#package : 'Myg-Sokoban-Tests'
}

{ #category : 'running' }
MygSkBoardElementTest >> setUp [
	super setUp.
	space := nil.
	boardElement := nil.
	gameManager := nil.
	board := nil
]

{ #category : 'running' }
MygSkBoardElementTest >> tearDown [
		"Libérer les ressources graphiques après chaque test."
	space ifNotNil: [ 
		BlSpace pulseUntilEmptyTaskQueue: space timeout: 200 milliSeconds. "attendre la fin des animations/effets graphiques"
		space close. "fermer l'interface graphique de test"
		BlSpace pulseUntilEmptyTaskQueue: space timeout: 200 milliSeconds ]. "attendre la fermeture effective de tous les éléments graphiques"
	super tearDown
]

{ #category : 'tests' }
MygSkBoardElementTest >> testInitialMoveCountDisplay [
	" Vérifier que le compteur est affiché avec la valeur 0 lors de l'initialisation de la vue. "
	
	| string |
	string := '#@$ .#'.
	gameManager := MygSkGameManager new.	
	gameManager launchFromString: string.
	boardElement := gameManager currentBoardElement.
	
	self assert: boardElement moveCountLabel isNotNil.
	self assert: (((boardElement moveCountLabel children first) text asString) findString: 'Moves: 0') > 0.
	space := boardElement space.
]
