Class {
	#name : #DisuniteConstraints,
	#superclass : #Object,
	#instVars : [
		'argument',
		'constraints'
	],
	#category : #MicroKanren
}

{ #category : #accessing }
DisuniteConstraints >> argument [

	^ argument
]

{ #category : #accessing }
DisuniteConstraints >> argument: anObject [

	argument := anObject
]

{ #category : #accessing }
DisuniteConstraints >> constraints [

	^ constraints
]

{ #category : #accessing }
DisuniteConstraints >> constraints: anObject [

	constraints := anObject
]

{ #category : #printing }
DisuniteConstraints >> printOn: aStream [

	| aCons |
	argument printOn: aStream.
	aStream nextPutAll: ' : '.

	aCons := constraints.
	[ aCons ] whileNotNil: [ 
		aStream nextPutAll: '('.
		aCons car car printOn: aStream.
		aStream nextPutAll: ' ~= '.
		aCons car cdr printOn: aStream.
		aStream nextPutAll: ')'.
		aCons := aCons cdr ]
]
