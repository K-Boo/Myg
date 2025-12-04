"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them.

Public API and Key Messages

- message one
- message two
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.

Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : 'MygSkTarget',
	#superclass : 'MygSkObject',
	#category : 'Myg-Sokoban-Model',
	#package : 'Myg-Sokoban',
	#tag : 'Model'
}

{ #category : 'default encoding' }
MygSkTarget class >> textualMapCharacter [ 

	^ $.
]

{ #category : 'testing' }
MygSkTarget >> acceptsBox: aBox [
	"Si la cible n'a pas de couleur c'est une cible classique qui accepte tout"
	self color ifNil: [ ^ true ].
	"sinon on compare la couleur de la cible avec celle de la boite"
	^ self color = aBox color
]

{ #category : 'accessing' }
MygSkTarget >> backgroundRepresentation [

	^ MygSkBoxElement  targetIcon
]

{ #category : 'move' }
MygSkTarget >> isTarget [ 
	^ true
]
