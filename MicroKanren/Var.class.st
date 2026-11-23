"
I am a logic variable. My `id` identifies me, so that two variables of the same class are equal when their ids are, and I print as `o` followed by the id as a subscript. My name (`named`) is that of the block argument that a `Fresh` goal has introduced me for.

`State` makes me when a goal asks for new variables; `Integer>>asVar` makes me out of an id, `1 asVar` for example. I take part in the double dispatches of unification (`Unifier`), reification (`Reifier`), lookup (`State`) and occur check (`OccurChecker`).

`Var class>>tautology` answers the symbol `#tautology`, which is the answer of a goal without variables.
"
Class {
	#name : #Var,
	#superclass : #Object,
	#instVars : [
		'id',
		'named'
	],
	#category : #MicroKanren
}

{ #category : #creating }
Var class >> id: anInteger [
	^ self new
		id: anInteger;
		yourself
	"id: ('var_' , anInteger asString) asSymbol;"
]

{ #category : #creating }
Var class >> tautology [
	^ #tautology
]

{ #category : #comparing }
Var >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ anObject equalVar: self
]

{ #category : #visiting }
Var >> acceptOccurChecker: aChecker [

	^ aChecker forVar: self
]

{ #category : #comparing }
Var >> equalVar: anotherReifiedVar [
	^ id = anotherReifiedVar id
]

{ #category : #comparing }
Var >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ id hash
]

{ #category : #initializing }
Var >> id [
	^ id
]

{ #category : #initializing }
Var >> id: aString [
	id := aString
]

{ #category : #accessing }
Var >> name [

	^ named
]

{ #category : #accessing }
Var >> named: anObject [

	named := anObject
]

{ #category : #printing }
Var >> printOn: aStream [
	aStream
		nextPutAll: self symbol;
		nextPutAll: id asString subscript
]

{ #category : #dispatching }
Var >> reifyUsingReifier: aReifier [ 
	^ aReifier forVar: self 
]

{ #category : #printing }
Var >> symbol [
	^ 'o'
]

{ #category : #dispatching }
Var >> unifyWith: another usingUnifier: anUnifier [

	^ another unifyWithVar: self usingUnifier: anUnifier
]

{ #category : #dispatched }
Var >> unifyWithObject: anObject usingUnifier: anUnifier [

	^ anUnifier forVar: self forObject: anObject
]

{ #category : #dispatched }
Var >> unifyWithVar: aVar usingUnifier: anUnifier [

	^ anUnifier forVar: self forVar: aVar
]

{ #category : #'as yet unclassified' }
Var >> walkSBRAL: aSBRAL forState: aState [

	^ aState walkVar: self inSBRAL: aSBRAL
]
