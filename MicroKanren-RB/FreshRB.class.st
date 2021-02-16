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

	| dict node rbLogicVariables swapping aStream |
	dict := Dictionary new.

	contextVariables keysAndValuesDo: [ :aSymbol :aRBVar | 
		dict at: aSymbol put: aRBVar ].

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

	swapping := receiver.
	receiver := nodeBlock value: node.

	aStream := super onState: aState withVars: aCollection.

	receiver := swapping.

	^ aStream
]

{ #category : #accessing }
FreshRB >> selectBlock: anObject [

	selectBlock := anObject
]
