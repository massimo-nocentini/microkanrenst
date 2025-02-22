Extension { #name : 'OCSequenceNode' }

{ #category : '*MicroKanren-RB' }
OCSequenceNode >> unifyWith: anObject usingUnifier: anUnifier [

	^ anObject unifyWithRBSequenceNode: self usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
OCSequenceNode >> unifyWithRBSequenceNode: aNode usingUnifier: anUnifier [

	^ anUnifier forRBSequenceNode: self forRBSequenceNode: aNode
]
