Class {
	#name : #FreshRB,
	#superclass : #Fresh,
	#instVars : [
		'nodeBlock',
		'selectBlock'
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

	node := receiver sourceNode body in: [ :aSequenceNode | 
		        | aNode |
		        aNode := selectBlock value: aSequenceNode.
		        aNode substituteVariablesUsingDictionary: dict ].

	receiver := nodeBlock valueWithArguments: aCollection , { node }.

	^ super onState: aState withVars: aCollection
]

{ #category : #accessing }
FreshRB >> selectBlock: anObject [

	selectBlock := anObject
]
