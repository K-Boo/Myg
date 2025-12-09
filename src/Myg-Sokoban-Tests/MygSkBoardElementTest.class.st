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
	board := nil.
	
	gameManager := MygSkGameManager new.
	"Initialiser un dictionnaire de paquets factice pour éviter les erreurs dans registerLevel"
	gameManager packDictionary: (Dictionary new
		at: 'test' put: Dictionary new;
		yourself).
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

{ #category : 'tests' }
MygSkBoardElementTest >> testMoveCountUpdatesOnMove [
	| string |
	string := '#@$ .#'.
	gameManager launchFromString: string inDictionary: 'test' at: 1.
	boardElement := gameManager currentBoardElement.
	
	"Vérifier l'état initial"
	self assert: (((boardElement moveCountLabel children first) text asString) findString: 'Moves: 0') > 0.
	
	"Effectuer un mouvement valide (vers l'est)"
	boardElement manageEvent: (BlKeyDownEvent new key: KeyboardKey right).
	
	"Attendre la mise à jour de l'interface"
	BlSpace pulseUntilEmptyTaskQueue: boardElement space timeout: 200 milliSeconds.
	
	"Vérifier que le compteur a été mis à jour"
	self assert: (((boardElement moveCountLabel children first) text asString) findString: 'Moves: 1') > 0.
	
	space := boardElement space.
]

{ #category : 'tests' }
MygSkBoardElementTest >> testUndoButtonDisplayed [ 
	"context: Le jeu est lancé avec un plateau simple"
	| string |
	string := '#@$ .#'.
	gameManager := MygSkGameManager new.	
	gameManager launchFromString: string.
	boardElement := gameManager currentBoardElement.
	
	"trigger: (Pas d'action spécifique, juste l'initialisation)"
	
	"assert-check: Le bouton 'Annuler' doit être présent et visible"
	self assert: boardElement undoButton isNotNil.
	self assert: boardElement undoButton labelText equals: 'Annuler'.
	space := boardElement space.
]
