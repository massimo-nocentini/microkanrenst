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
State class >> emptyWithSubstitution: aCollection [
	^ self new
		birthdate: 0;
		substitution: aCollection;
		yourself
]

{ #category : #'instance creation' }
State class >> fromDictionary: aDictionary [
	^ self emptyWithSubstitution: aDictionary
]

{ #category : #'instance creation' }
State class >> fromSBRAL: aSBRAL [
	^ self emptyWithSubstitution: aSBRAL
]

{ #category : #'instance creation' }
State class >> fromUnionFind: aUF [
	^ self emptyWithSubstitution: aUF
]

{ #category : #'as yet unclassified' }
State >> at: aVar put: aValue [
	^ self class new
		birthdate: birthdate;
		substitution: (substitution at: birthdate - aVar id + 1 put: (Maybe just: aValue));
		yourself
]

{ #category : #accessing }
State >> birthdate: anInteger [ 
	birthdate := anInteger
]

{ #category : #dispatching }
State >> collectVars: aCollection forFresh: aFresh [
	| nextState vars extendedSubstitution |
	vars := aCollection collect: [ :each | (each + birthdate) asVar ].
	extendedSubstitution := vars
		inject: substitution
		into: [ :aSBRAL :each | aSBRAL add: Maybe nothing ].
	nextState := self class new
		substitution: extendedSubstitution;
		birthdate: birthdate + aCollection size;
		yourself.
	^ aFresh onState: nextState withVars: vars
]

{ #category : #reification }
State >> reifier [
	^ self reifierClass: Reifier
]

{ #category : #reification }
State >> reifierClass: aClass [
	^ aClass new
		state: self;
		yourself
]

{ #category : #reification }
State >> reifyVar: aVar forReifier: aReifier [
	substitution
		at: aVar
		ifPresent: [ :v | self error ]
		ifAbsentPut: [ aReifier intToVar: substitution size ]
]

{ #category : #accessing }
State >> substitution: aCollection [ 
	substitution := aCollection
]

{ #category : #reification }
State >> trasparentReifier [
	^ self reifierClass: TrasparentReifier
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
State >> walk: anObj inSBRAL: aSBRAL [
	| each |
	each := anObj.
	[ each isVar
		ifTrue: [ | maybe |
			maybe := aSBRAL at: birthdate - each id + 1.
			maybe
				ifNothing: [ ^ each ]
				ifJust: [ :aJust | each := aJust content ] ]
		ifFalse: [ ^ each ] ] repeat
]

{ #category : #'as yet unclassified' }
State >> walk: anObj inUnionFind: aUF [
	^ (aUF includesKey: anObj)
		ifTrue: [ aUF at: anObj ]
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
