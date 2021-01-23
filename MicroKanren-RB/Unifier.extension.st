Extension { #name : #Unifier }

{ #category : #'*MicroKanren-RB' }
Unifier >> forRBLiteralValueNode: aNode forRBLiteralValueNode: anotherNode [

	^ aNode value unifyWith: anotherNode value usingUnifier: self
]

{ #category : #'*MicroKanren-RB' }
Unifier >> forRBMessageNode: aRBMessageNode forRBMessageNode: anotherRBMessageNode [

	state := aRBMessageNode receiver
		         unifyWith: anotherRBMessageNode receiver
		         usingUnifier: self.
	state := aRBMessageNode selectorNode
		         unifyWith: anotherRBMessageNode selectorNode
		         usingUnifier: self.
	state := aRBMessageNode arguments
		         unifyWith: anotherRBMessageNode arguments
		         usingUnifier: self.
	^ state
]

{ #category : #'*MicroKanren-RB' }
Unifier >> forRBSelectorNode: aNode forRBSelectorNode: anotherNode [

	state := aNode value unifyWith: anotherNode value usingUnifier: self.
	^ state
]

{ #category : #'*MicroKanren-RB' }
Unifier >> forRBVariableNode: aNode forRBVariableNode: anotherNode [

	state := aNode name unifyWith: anotherNode name usingUnifier: self.
	^ state
]
