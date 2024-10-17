Extension { #name : 'ASTLiteralValueNode' }

{ #category : '*MicroKanren-RB' }
ASTLiteralValueNode >> unifyWith: anObject usingUnifier: anUnifier [

	^ anObject unifyWithRBLiteralValueNode: self usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
ASTLiteralValueNode >> unifyWithRBLiteralValueNode: aNode usingUnifier: anUnifier [

	^ anUnifier forRBLiteralValueNode: self forRBLiteralValueNode: aNode
]
