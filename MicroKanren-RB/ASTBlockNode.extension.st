Extension { #name : 'ASTBlockNode' }

{ #category : '*MicroKanren-RB' }
ASTBlockNode >> unifyWith: anObject usingUnifier: anUnifier [

	^ anObject unifyWithRBBlockNode: self usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
ASTBlockNode >> unifyWithRBBlockNode: aRBBlockNode usingUnifier: anUnifier [

	^ anUnifier forRBBlockNode: self forRBBlockNode: aRBBlockNode
]
