Extension { #name : #Unifier }

{ #category : #'*MicroKanren-RB' }
Unifier >> forRBLiteralValueNode: aNode forRBLiteralValueNode: anotherNode [

	^ self value: aNode value value: anotherNode value
]

{ #category : #'*MicroKanren-RB' }
Unifier >> forRBLogicVariableNode: aNode forRBLogicVariableNode: anotherNode [

	^ self value: aNode logicVar value: anotherNode logicVar
]

{ #category : #'*MicroKanren-RB' }
Unifier >> forRBMessageNode: aRBMessageNode forRBMessageNode: anotherRBMessageNode [

	| aState |
	
	aState := self
		          value: aRBMessageNode receiver
		          value: anotherRBMessageNode receiver.
	aState := aState unifier
		          continuation: continuation;
		          value: aRBMessageNode selectorNode
		          value: anotherRBMessageNode selectorNode.
	aState := aState unifier
		          continuation: continuation;
		          value: aRBMessageNode arguments
		          value: anotherRBMessageNode arguments.
	^ aState
]

{ #category : #'*MicroKanren-RB' }
Unifier >> forRBSelectorNode: aNode forRBSelectorNode: anotherNode [

	^ self value: aNode value value: anotherNode value
]

{ #category : #'*MicroKanren-RB' }
Unifier >> forRBSequenceNode: aNode forRBSequenceNode: anotherNode [

	^ self value: aNode statements value: anotherNode statements
]
