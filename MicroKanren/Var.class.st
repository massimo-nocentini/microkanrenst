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
Var >> reifyUsing: aReifier [ 
	^ aReifier reifyVar: self 
]

{ #category : #dispatching }
Var >> unifyWith: another usingUnifier: anUnifier onState: aState [
	^ another unifyWithVar: self usingUnifier: anUnifier onState: aState
]

{ #category : #dispatched }
Var >> unifyWithCons: aCons usingUnifier: anUnifier onState: aState [
	^ self unifyWithObject: aCons usingUnifier: anUnifier onState: aState
]

{ #category : #dispatched }
Var >> unifyWithLinkedList: aCollection usingUnifier: anUnifier onState: aState [
	^ self unifyWithObject: aCollection usingUnifier: anUnifier onState: aState
]

{ #category : #dispatched }
Var >> unifyWithObject: anObject usingUnifier: anUnifier onState: aState [
	^ anUnifier unifyVar: self withObject: anObject onState: aState
]

{ #category : #dispatched }
Var >> unifyWithVar: aVar usingUnifier: anUnifier onState: aState [
	^ anUnifier unifyVar: self withVar: aVar onState: aState
]
