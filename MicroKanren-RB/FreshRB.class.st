Class {
	#name : #FreshRB,
	#superclass : #Fresh,
	#instVars : [
		'nodeBlock'
	],
	#category : #'MicroKanren-RB'
}

{ #category : #accessing }
FreshRB >> nodeBlock: anObject [

	nodeBlock := anObject
]

{ #category : #dispatched }
FreshRB >> onState: aState withVars: aCollection [

	| dict node logicVariableNodes |
	dict := Dictionary new.
	logicVariableNodes := receiver argumentNames
		                      with: aCollection
		                      collect: [ :aName :aVar | 
		                      dict at: aName put: aVar asRBNode ].

	node := receiver sourceNode body substituteVariablesUsingDictionary:
		        dict.

	receiver := nodeBlock valueWithArguments:
		            logicVariableNodes , { node }.

	^ super onState: aState withVars: logicVariableNodes
]
