Class {
	#name : #Var,
	#superclass : #Object,
	#instVars : [
		'id'
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

{ #category : #initializing }
Var >> id: aString [
	id := aString
]

{ #category : #dispatched }
Var >> isVar [
	^ true
]

{ #category : #printing }
Var >> printOn: aStream [
	aStream
		nextPutAll: self symbol;
		nextPutAll: id printSubscriptString
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
Var >> unifyWithCons: aCons usingUnifier: anUnifier [ 
	^ self unifyWithObject: aCons usingUnifier: anUnifier 
]

{ #category : #dispatched }
Var >> unifyWithLinkedList: aCollection usingUnifier: anUnifier [
	^ self unifyWithObject: aCollection usingUnifier: anUnifier
]

{ #category : #dispatched }
Var >> unifyWithObject: anObject usingUnifier: anUnifier [
	^ anUnifier forVar: self forObject: anObject
]

{ #category : #dispatched }
Var >> unifyWithVar: aVar usingUnifier: anUnifier [ 
	^ anUnifier forVar: self forVar: aVar
]
