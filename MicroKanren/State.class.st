Class {
	#name : #State,
	#superclass : #Object,
	#instVars : [
		'substitution',
		'birthdate'
	],
	#category : #MicroKanren
}

{ #category : #'instance creation' }
State class >> fromDictionary: aDictionary [
	^ self new
		birthdate: 0;
		substitution: aDictionary;
		yourself
]

{ #category : #'instance creation' }
State class >> fromUnionFind: aUF [
	^ self new
		birthdate: 0;
		substitution: aUF;
		yourself
]

{ #category : #'as yet unclassified' }
State >> at: aVar put: aValue [
	| s |
	s := substitution copy.
	s at: aVar ifPresent: [ :v | self error ] ifAbsentPut: [ aValue ].
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
	^ Reifier new
		state: self;
		varCtor: aSymbol;
		yourself
]

{ #category : #reification }
State >> reifyVar: aVar withCtor: aCtor [
	substitution
		at: aVar
		ifPresent: [ :v | self error ]
		ifAbsentPut: [ aCtor value: substitution size ]
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
	^ substitution walk: anObj fromState: self
]

{ #category : #'as yet unclassified' }
State >> walk: anObj inDictionary: aDictionary [
	^ self walkIterative: anObj inDictionary: aDictionary
]

{ #category : #'as yet unclassified' }
State >> walk: anObj inUnionFind: aUF [
	^ (aUF includesKey: anObj)
		ifTrue: [ aUF representativeAt: anObj ]
		ifFalse: [ anObj ]
]

{ #category : #'as yet unclassified' }
State >> walkIterative: anObj inDictionary: aDictionary [
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
	[ k := aDictionary at: k ifAbsent: [ ^ k ] ] repeat
]

{ #category : #'as yet unclassified' }
State >> walkRecursive: anObj inDictionary: aDictionary [
	^ aDictionary
		at: anObj
		ifPresent: [ :v | 
			aDictionary
				at: anObj
				put: (self walkRecursive: v inDictionary: aDictionary) ]
		ifAbsent: [ anObj ]
]

{ #category : #'as yet unclassified' }
State >> walker [
	^ Walker on: self
]
