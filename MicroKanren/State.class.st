Class {
	#name : #State,
	#superclass : #Object,
	#instVars : [
		'substitution',
		'birthdate'
	],
	#category : 'MicroKanren-core'
}

{ #category : #'as yet unclassified' }
State >> at: aVar put: aValue [ 
	| s |
	s := substitution copy.
	s "check that if a key already exists at aVar, then the values must be the same"
		at: aVar
		ifPresent: [:v | aValue = v
				ifFalse: [UnificationError signal]]
		ifAbsentPut: aValue.
	^ self class new birthdate: birthdate;
		 substitution: s;
		 yourself
]

{ #category : #accessing }
State >> birthdate: anInteger [ 
	birthdate := anInteger
]

{ #category : #dispatching }
State >> collectVars: aCollection forFresh: aFresh [
	| nextState vars |
	nextState := self class new
		substitution: substitution;
		birthdate: birthdate + aCollection size;
		yourself.
	vars := aCollection collect: [ :i | Var id: i ].
	^ aFresh onState: nextState withVars: vars
]

{ #category : #'as yet unclassified' }
State >> reifier [
	^ Reifier on: self
]

{ #category : #reification }
State >> reifyVar: aVar [
	substitution
		at: aVar
		ifAbsentPut: [ ReifiedVar new
				id: substitution size;
				yourself ]
]

{ #category : #accessing }
State >> substitution: aCollection [ 
	substitution := aCollection
]

{ #category : #'as yet unclassified' }
State >> walk: anObj [
	"searches for the value of `anObj` in substitution"

	| k |
	k := anObj.
	[ k := substitution at: k ifAbsent: [ ^ k ] ] repeat
]

{ #category : #'as yet unclassified' }
State >> walker [
 ^Walker on: self
]
