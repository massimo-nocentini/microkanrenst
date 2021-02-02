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

	| dict node |
	dict := Dictionary new.

	receiver argumentNames
		with: aCollection
		do: [ :aName :aVar | dict at: aName put: aVar asRBNode ].

	node := receiver sourceNode body in: [ :aSequenceNode | 
		        | aNode |
		        aNode := selectBlock value: aSequenceNode.
		        aNode substituteVariablesUsingDictionary: dict ].

	receiver := nodeBlock value: node.

	^ super onState: aState withVars: aCollection
]

{ #category : #accessing }
FreshRB >> selectBlock: anObject [

	selectBlock := anObject
]
