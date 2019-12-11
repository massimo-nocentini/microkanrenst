Class {
	#name : #State,
	#superclass : #Object,
	#instVars : [
		'substitution',
		'birthdate'
	],
	#category : #MicroKanren
}

{ #category : #'as yet unclassified' }
State >> at: aVar put: aValue [
	| s |
	s := substitution copy.
	s
		at: aVar
		ifPresent: [ :v | 
			"check that if a key already exists at aVar, then the values
			must be the same"
			aValue = v
				ifFalse: [ UnificationError signal ] ]
		ifAbsentPut: aValue.
	^ self class new
		birthdate: birthdate;
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
	vars := aCollection collect: [ :each | (each + birthdate) asVar ].
	^ aFresh onState: nextState withVars: vars
]

{ #category : #reification }
State >> reifier [
	^ self reifierWithVarCtor: #asReifiedVar
]

{ #category : #reification }
State >> reifierWithVarCtor: aSymbol [
	^ Reifier new state: self; varCtor: aSymbol; yourself
]

{ #category : #reification }
State >> reifyVar: aVar withCtor: aCtor [ 
	substitution
		at: aVar
		ifAbsentPut: [aCtor value: substitution size]
]

{ #category : #accessing }
State >> substitution: aCollection [ 
	substitution := aCollection
]

{ #category : #reification }
State >> trasparentReifier [
	^ self reifierWithVarCtor: #asVar
]

{ #category : #creating }
State >> unifier [
	^ Unifier new state: self; yourself
]

{ #category : #'as yet unclassified' }
State >> walk: anObj [ 
	^ self walkIterative: anObj
]

{ #category : #'as yet unclassified' }
State >> walkIterative: anObj [ 
	"searches for the value of `anObj` in substitution"
	"^ substitution
	at: anObj
	ifPresent: [:v | 
	| w |
	w := self walk: v.
	substitution at: anObj put: w]
	ifAbsent: [anObj]"
	| k |
	k := anObj.
	[k := substitution
				at: k
				ifAbsent: [^ k]] repeat
]

{ #category : #'as yet unclassified' }
State >> walkRecursive: anObj [ 
	^ substitution
		at: anObj
		ifPresent: [:v | 
			
			substitution at: anObj put: (self walk: v)]
		ifAbsent: [anObj]
]

{ #category : #'as yet unclassified' }
State >> walker [
 ^Walker on: self
]
