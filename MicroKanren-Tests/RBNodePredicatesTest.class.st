Class {
	#name : #RBNodePredicatesTest,
	#superclass : #Srfi41AbstractTest,
	#traits : 'TIceImagesExporting',
	#classTraits : 'TIceImagesExporting classTrait',
	#category : #'MicroKanren-Tests'
}

{ #category : #tests }
RBNodePredicatesTest >> testSenderoBackwards [

	self
		assert: ([ :aSend | 
			 [ :o | o ] rbo: [ :ast | [ :o | ast sendso value: aSend ] ] ]
				 asGoal solutions next: 5)
		equals: { 
				(RBMessageNode
					 receiver: (RBVariableNode named: #x)
					 selector: #numberOfEdges).
				(RBMessageNode
					 receiver: (RBVariableNode named: #x)
					 selector: #testStackedVertically).
				(RBMessageNode
					 receiver: (RBVariableNode named: #x)
					 selector: #iconicHaloSpecifications).
				(RBMessageNode
					 receiver: (RBVariableNode named: #x)
					 selector: #packageModels).
				(RBMessageNode
					 receiver: (RBVariableNode named: #x)
					 selector: #testReversed) }
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
