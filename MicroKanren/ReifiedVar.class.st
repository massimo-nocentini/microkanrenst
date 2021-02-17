Class {
	#name : #ReifiedVar,
	#superclass : #Var,
	#category : #MicroKanren
}

{ #category : #converting }
ReifiedVar >> asRBNode [

	^ RBLogicVariableNode named: self symbol logicVar: self
]

{ #category : #accessing }
ReifiedVar >> formattedCode [

	^ '◊' , self asString
]

{ #category : #'as yet unclassified' }
ReifiedVar >> reifyUsingReifier: aReifier [

	^ aReifier forReifiedVar: self
]

{ #category : #printing }
ReifiedVar >> symbol [
	^ '•'
]
