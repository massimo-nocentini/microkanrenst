Extension { #name : 'ASTSequenceNode' }

{ #category : '*MicroKanren-RB' }
ASTSequenceNode >> unifyWith: anObject usingUnifier: anUnifier [

	^ anObject unifyWithRBSequenceNode: self usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
ASTSequenceNode >> unifyWithRBSequenceNode: aNode usingUnifier: anUnifier [

	^ anUnifier forRBSequenceNode: self forRBSequenceNode: aNode
]
