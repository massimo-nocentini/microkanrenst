Extension { #name : #RBBlockNode }

{ #category : #'*MicroKanren-RB' }
RBBlockNode >> unifyWith: anObject usingUnifier: anUnifier [

	^ anObject unifyWithRBBlockNode: self usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-RB' }
RBBlockNode >> unifyWithRBBlockNode: aRBBlockNode usingUnifier: anUnifier [

	^ anUnifier forRBBlockNode: self forRBBlockNode: aRBBlockNode
]
