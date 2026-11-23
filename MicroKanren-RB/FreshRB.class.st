"
I am a `Fresh` goal about the AST of a block, my receiver: I introduce a variable for each argument of it, take its body with these variables in place of the arguments, as `RBLogicVariableNode` objects, and give it to my `nodeBlock`, which has to answer a block that makes the goal out of the variables.

`BlockClosure>>asGoalWithASTof:` makes me; its longer forms set the other instance variables too:

- `selectBlock`: takes the sequence node of the body and answers the node to consider, the whole or its only statement
- `contextVariables`: a dictionary from other names that occur in the body to the nodes to put in their place

```smalltalk
[ :a |
	[ :ast | [ :x | a asRBNode unifyo value: ast ] ]
		asGoalWithUnaryASTof: [ :x | 3 + 4 ]
		contextVariables: #(  ) ]
			asGoal solutions readStream upToEnd.
""=> an Array(OCMessageNode(3 + 4))""
```
"
Class {
	#name : 'FreshRB',
	#superclass : 'Fresh',
	#instVars : [
		'nodeBlock',
		'selectBlock',
		'contextVariables'
	],
	#category : 'MicroKanren-RB',
	#package : 'MicroKanren-RB'
}

{ #category : 'accessing' }
FreshRB >> contextVariables: anObject [

	contextVariables := anObject
]

{ #category : 'accessing' }
FreshRB >> nodeBlock: anObject [

	nodeBlock := anObject
]

{ #category : 'dispatched' }
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

{ #category : 'accessing' }
FreshRB >> selectBlock: anObject [

	selectBlock := anObject
]
