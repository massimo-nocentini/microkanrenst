Class {
	#name : #RBNodePredicatesTest,
	#superclass : #Srfi41AbstractTest,
	#traits : 'TIceImagesExporting',
	#classTraits : 'TIceImagesExporting classTrait',
	#category : #'MicroKanren-Tests'
}

{ #category : #tests }
RBNodePredicatesTest >> testSendero [

	self
		assert: [ :selector | 
			| cm visitor |
			visitor := RBProgramNodeSenderoVisitor new
				           selectorVar: selector;
				           yourself.
			cm := RBProgramNodeSenderoVisitor >> #visitMessageNode:.
			cm sourceNode body acceptVisitor: visitor.
			visitor asGoal ] asGoal solutions
		equals: { 
				(RBSelectorNode value: #visitMessageNode:).
				(RBSelectorNode value: #unifyo).
				(RBSelectorNode value: #selectorNode).
				(RBSelectorNode value: #value:).
				(RBSelectorNode value: #add:) }
		modulo: #asOrderedCollection
]
