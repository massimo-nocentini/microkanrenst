Extension { #name : #RBSelectorNode }

{ #category : #'*MicroKanren-RB' }
RBSelectorNode >> unifyWith: aNode usingUnifier: anUnifier [

	^ aNode unifyWithRBSelectorNode: self usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-RB' }
RBSelectorNode >> unifyWithRBSelectorNode: aRBSelectorNode usingUnifier: anUnifier [

	^ anUnifier
		  forRBSelectorNode: self
		  forRBSelectorNode: aRBSelectorNode
]
