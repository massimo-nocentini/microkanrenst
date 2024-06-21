Extension { #name : 'Object' }

{ #category : '*MicroKanren-RB' }
Object >> asLiteralRBNode [

	^ self isLiteral
		  ifTrue: [ RBLiteralValueNode value: self ]
		  ifFalse: [ Error signal: 'I am not a literal value' ]
]

{ #category : '*MicroKanren-RB' }
Object >> equalRBLogicVariableNode: aNode [

	^ false
]
