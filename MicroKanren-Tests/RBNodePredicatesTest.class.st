Class {
	#name : #RBNodePredicatesTest,
	#superclass : #Srfi41AbstractTest,
	#traits : 'TIceImagesExporting',
	#classTraits : 'TIceImagesExporting classTrait',
	#category : #'MicroKanren-Tests'
}

{ #category : #tests }
RBNodePredicatesTest >> arguments_testSenderoBackwards [

	| receiverNode messageNodes |
	"Preparing expected objects."
	receiverNode := 0 asReifiedVar asRBNode.
	messageNodes := { 
		                (RBMessageNode
			                 receiver: receiverNode
			                 selector: #numberOfEdges).
		                (RBMessageNode
			                 receiver: receiverNode
			                 selector: #testStackedVertically).
		                (RBMessageNode
			                 receiver: receiverNode
			                 selector: #iconicHaloSpecifications).
		                (RBMessageNode
			                 receiver: receiverNode
			                 selector: #packageModels).
		                (RBMessageNode
			                 receiver: receiverNode
			                 selector: #testReversed) }.

	self
		assert: ([ :aSend | 
			 [ :o :ast | ast sendso value: aSend ] asGoalWithASTof: [ :o | o ] ]
				 asGoal solutions next: messageNodes size)
		equals: messageNodes
		modulo: #asOrderedCollection.

	^ { 
		  receiverNode.
		  messageNodes }
]

{ #category : #tests }
RBNodePredicatesTest >> testSenderoBackwards [

	self arguments_testSenderoBackwards bind: [ :receiverNode :messageNodes | 
		self
			assert: ([ :aSend | 
				 [ :o :ast | ast sendso value: aSend ] asGoalWithASTof: [ :o | o ] ]
					 asGoal solutions next: messageNodes size)
			equals: messageNodes
			modulo: #asOrderedCollection ]
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
