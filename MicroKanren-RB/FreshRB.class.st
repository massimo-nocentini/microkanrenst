Class {
	#name : #FreshRB,
	#superclass : #Fresh,
	#instVars : [
		'nodeBlock',
		'selectBlock',
		'contextVariables'
	],
	#category : #'MicroKanren-RB'
}

{ #category : #accessing }
FreshRB >> contextVariables: anObject [

	contextVariables := anObject
]

{ #category : #accessing }
FreshRB >> nodeBlock: anObject [

	nodeBlock := anObject
]

{ #category : #dispatched }
FreshRB >> onState: aState withVars: aCollection [

	| dict node rbLogicVariables |
	dict := Dictionary new.

	contextVariables do: [ :each | dict at: each name put: each ].

	rbLogicVariables := receiver argumentNames
		                    with: aCollection
		                    collect: [ :aName :aVar | 
			                    dict
				                    at: aName
				                    ifPresent: [ 
				                    Error signal:
					                    ('Variable {} duplicated!' format: { aName }) ]
				                    ifAbsentPut: [ aVar asRBNode ] ].

	node := receiver sourceNode body in: [ :aSequenceNode | 
		        | aNode |
		        aNode := selectBlock value: aSequenceNode.
		        aNode substituteVariablesUsingDictionary: dict ].

	receiver := nodeBlock value: node.

	^ super onState: aState withVars: rbLogicVariables
]

{ #category : #accessing }
FreshRB >> selectBlock: anObject [

	selectBlock := anObject
]
