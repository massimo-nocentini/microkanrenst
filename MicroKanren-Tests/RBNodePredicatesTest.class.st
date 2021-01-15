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
