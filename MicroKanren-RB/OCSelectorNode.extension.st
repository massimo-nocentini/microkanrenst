Extension { #name : 'OCSelectorNode' }

{ #category : '*MicroKanren-RB' }
OCSelectorNode >> unifyWith: aNode usingUnifier: anUnifier [

	^ aNode unifyWithRBSelectorNode: self usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
OCSelectorNode >> unifyWithRBSelectorNode: aRBSelectorNode usingUnifier: anUnifier [

	^ anUnifier
		  forRBSelectorNode: self
		  forRBSelectorNode: aRBSelectorNode
]
