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
		| aConstraint |
		aConstraint := aCons car.

		aStream nextPutAll: '('.

		[ aConstraint ] whileNotNil: [ "aStream nextPutAll: '('."
			aConstraint car car printOn: aStream.
			aStream nextPutAll: ' ~= '.
			aConstraint car cdr printOn: aStream.
			aConstraint cdr ifNotNil: [ aStream nextPutAll: ', ' ].
			aConstraint := aConstraint cdr ].
		aStream nextPutAll: ')'.
		aCons cdr ifNotNil: [ aStream nextPutAll: ', ' ].
		aCons := aCons cdr ]
]
