Extension { #name : 'ASTMessageNode' }

{ #category : '*MicroKanren-RB' }
ASTMessageNode >> unifyWith: anObject usingUnifier: anUnifier [

	^ anObject unifyWithRBMessageNode: self usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
ASTMessageNode >> unifyWithRBMessageNode: aNode usingUnifier: anUnifier [

	^ anUnifier forRBMessageNode: self forRBMessageNode: aNode
]
