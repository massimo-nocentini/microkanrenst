Extension { #name : 'RBLiteralValueNode' }

{ #category : '*MicroKanren-RB' }
RBLiteralValueNode >> unifyWith: anObject usingUnifier: anUnifier [

	^ anObject unifyWithRBLiteralValueNode: self usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
RBLiteralValueNode >> unifyWithRBLiteralValueNode: aNode usingUnifier: anUnifier [

	^ anUnifier forRBLiteralValueNode: self forRBLiteralValueNode: aNode
]
