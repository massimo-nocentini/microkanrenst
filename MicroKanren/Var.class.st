Class {
	#name : #Var,
	#superclass : #Object,
	#instVars : [
		'id'
	],
	#category : 'MicroKanren-core'
}

{ #category : #creating }
Var class >> id: anInteger [
	^ self new
		id: ('var_' , anInteger asString) asSymbol;
		yourself
]

{ #category : #creating }
Var class >> tautology [
	^ #tautology
]

{ #category : #initializing }
Var >> id: aString [
	id := aString
]

{ #category : #dispatching }
Var >> reifyUsingReifier: aReifier [ 
	^ aReifier forVar: self 
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
