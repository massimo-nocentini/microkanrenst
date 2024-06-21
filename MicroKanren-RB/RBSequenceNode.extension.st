Extension { #name : 'RBSequenceNode' }

{ #category : '*MicroKanren-RB' }
RBSequenceNode >> unifyWith: anObject usingUnifier: anUnifier [

	^ anObject unifyWithRBSequenceNode: self usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
RBSequenceNode >> unifyWithRBSequenceNode: aNode usingUnifier: anUnifier [

	^ anUnifier forRBSequenceNode: self forRBSequenceNode: aNode
]
