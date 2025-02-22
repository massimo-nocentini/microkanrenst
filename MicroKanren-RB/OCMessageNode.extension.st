Extension { #name : 'OCMessageNode' }

{ #category : '*MicroKanren-RB' }
OCMessageNode >> unifyWith: anObject usingUnifier: anUnifier [

	^ anObject unifyWithRBMessageNode: self usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
OCMessageNode >> unifyWithRBMessageNode: aNode usingUnifier: anUnifier [

	^ anUnifier forRBMessageNode: self forRBMessageNode: aNode
]
