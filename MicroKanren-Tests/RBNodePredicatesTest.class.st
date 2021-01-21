Class {
	#name : #RBNodePredicatesTest,
	#superclass : #Srfi41AbstractTest,
	#traits : 'TIceImagesExporting',
	#classTraits : 'TIceImagesExporting classTrait',
	#category : #'MicroKanren-Tests'
}

{ #category : #tests }
RBNodePredicatesTest >> testSenderoBackwards [

	| receiverNode |
	receiverNode := 0 asReifiedVar asRBLogicVariableNamed: '•'.
	self assert: receiverNode asString equals: 'RBLogicVariableNode(•₀)'.

	self
		assert: ([ :aSend | 
			 [ :o | o ] rbo: [ :ast | [ :o | ast sendso value: aSend ] ] ]
				 asGoal solutions next: 5)
		equals: { 
				(RBMessageNode receiver: receiverNode selector: #numberOfEdges).
				(RBMessageNode
					 receiver: receiverNode
					 selector: #testStackedVertically).
				(RBMessageNode
					 receiver: receiverNode
					 selector: #iconicHaloSpecifications).
				(RBMessageNode receiver: receiverNode selector: #packageModels).
				(RBMessageNode receiver: receiverNode selector: #testReversed) }
		modulo: #asOrderedCollection
]

{ #category : #tests }
RBNodePredicatesTest >> testSenderoForBlockClosure [

	| aBlock |
	aBlock := [ :aMessageNode :goals :selectorVar | 
	          super visitMessageNode: aMessageNode.
	          goals add:
		          (selectorVar unifyo value: aMessageNode selectorNode) ].
	self
		assert:
		[ :selector | aBlock sendso value: selector ] asGoal solutions
		equals: { 
				(RBSelectorNode value: #visitMessageNode:).
				(RBSelectorNode value: #unifyo).
				(RBSelectorNode value: #selectorNode).
				(RBSelectorNode value: #value:).
				(RBSelectorNode value: #add:) }
		modulo: #asOrderedCollection.

	self deny: (super respondsTo: #visitMessageNode:)
]

{ #category : #tests }
RBNodePredicatesTest >> testSenderoForCompiledMethod [

	self
		assert: [ :selector | 
			(RBProgramNodeSendsoVisitor >> #visitMessageNode:) sendso value:
				selector ] asGoal solutions
		equals: { 
				(RBSelectorNode value: #visitMessageNode:).
				(RBSelectorNode value: #unifyo).
				(RBSelectorNode value: #selectorNode).
				(RBSelectorNode value: #value:).
				(RBSelectorNode value: #add:) }
		modulo: #asOrderedCollection
]

{ #category : #tests }
RBNodePredicatesTest >> testSenderoForEmptyBlockClosure [

	self
		assert: [ :selector | [  ] sendso value: selector ] asGoal solutions
		equals: #(  )
		modulo: #asOrderedCollection
]

{ #category : #tests }
RBNodePredicatesTest >> testSenderoForIdentityBlockClosure [

	self
		assert:
		[ :selector | [ :o | o ] sendso value: selector ] asGoal solutions
		equals: #(  )
		modulo: #asOrderedCollection
]
