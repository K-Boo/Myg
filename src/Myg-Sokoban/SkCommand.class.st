Class {
	#name : 'SkCommand',
	#superclass : 'Object',
	#category : 'Myg-Sokoban-Model',
	#package : 'Myg-Sokoban',
	#tag : 'Model'
}

{ #category : 'executing' }
SkCommand >> execute [ 
	self subclassResponsibility

]

{ #category : 'executing' }
SkCommand >> undo [ 
	self subclassResponsibility

]
