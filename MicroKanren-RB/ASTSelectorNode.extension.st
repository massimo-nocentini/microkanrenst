Extension { #name : 'ASTSelectorNode' }

{ #category : '*MicroKanren-RB' }
ASTSelectorNode >> unifyWith: aNode usingUnifier: anUnifier [

	^ aNode unifyWithRBSelectorNode: self usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
ASTSelectorNode >> unifyWithRBSelectorNode: aRBSelectorNode usingUnifier: anUnifier [

	^ anUnifier
		  forRBSelectorNode: self
		  forRBSelectorNode: aRBSelectorNode
]
