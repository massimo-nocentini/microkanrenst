Extension { #name : 'OCLiteralValueNode' }

{ #category : '*MicroKanren-RB' }
OCLiteralValueNode >> unifyWith: anObject usingUnifier: anUnifier [

	^ anObject unifyWithRBLiteralValueNode: self usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
OCLiteralValueNode >> unifyWithRBLiteralValueNode: aNode usingUnifier: anUnifier [

	^ anUnifier forRBLiteralValueNode: self forRBLiteralValueNode: aNode
]
