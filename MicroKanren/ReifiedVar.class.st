Class {
	#name : #ReifiedVar,
	#superclass : #Var,
	#category : #MicroKanren
}

{ #category : #comparing }
ReifiedVar >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ anObject equalReifiedVar: self
]

{ #category : #converting }
ReifiedVar >> asRBLogicVariable [

	^ RBLogicVariableNode named: self symbol logicVar: self
]

{ #category : #comparing }
ReifiedVar >> equalReifiedVar: anotherReifiedVar [
	^ id = anotherReifiedVar id
]

{ #category : #comparing }
ReifiedVar >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ id hash
]

{ #category : #accessing }
ReifiedVar >> id [
	^ id
]

{ #category : #'as yet unclassified' }
ReifiedVar >> reifyUsingReifier: aReifier [ 
	"No work to be done here because a ReifiedVar is already reified, btw."

	^ aReifier forReifiedVar: self
]

{ #category : #printing }
ReifiedVar >> symbol [
	^ '•'
]
