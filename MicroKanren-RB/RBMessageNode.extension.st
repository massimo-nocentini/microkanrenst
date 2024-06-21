Extension { #name : 'RBMessageNode' }

{ #category : '*MicroKanren-RB' }
RBMessageNode >> unifyWith: anObject usingUnifier: anUnifier [

	^ anObject unifyWithRBMessageNode: self usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
RBMessageNode >> unifyWithRBMessageNode: aNode usingUnifier: anUnifier [

	^ anUnifier forRBMessageNode: self forRBMessageNode: aNode
]
