Extension { #name : #Unifier }

{ #category : #'*MicroKanren-RB' }
Unifier >> forRBBlockNode: aRBBlockNode forRBBlockNode: anotherRBBlockNode [

	| aState |
	aState := self
		          value: aRBBlockNode arguments
		          value: anotherRBBlockNode arguments.
	^ self
		  state: aState;
		  value: aRBBlockNode body value: anotherRBBlockNode body
]

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

	| steps |
	steps := Array
		         with: [ :aState | 
			         self
				         state: aState;
				         value: aRBMessageNode receiver
				         value: anotherRBMessageNode receiver ]
		         with: [ :aState | 
			         self
				         state: aState;
				         value: aRBMessageNode selectorNode
				         value: anotherRBMessageNode selectorNode ]
		         with: [ :aState | 
			         self
				         state: aState;
				         value: aRBMessageNode arguments
				         value: anotherRBMessageNode arguments ].

	^ steps inject: state into: [ :aState :each | each value: aState ]
]

{ #category : #'*MicroKanren-RB' }
Unifier >> forRBSelectorNode: aNode forRBSelectorNode: anotherNode [

	^ self value: aNode value value: anotherNode value
]

{ #category : #'*MicroKanren-RB' }
Unifier >> forRBSequenceNode: aNode forRBSequenceNode: anotherNode [

	^ self value: aNode statements value: anotherNode statements
]
