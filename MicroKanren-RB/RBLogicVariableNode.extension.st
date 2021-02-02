Extension { #name : #RBLogicVariableNode }

{ #category : #'*MicroKanren-RB' }
RBLogicVariableNode >> unifyWith: anObject usingUnifier: anUnifier [

	^ anObject unifyWithRBLogicVariableNode: self usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-RB' }
RBLogicVariableNode >> unifyWithRBLogicVariableNode: aNode usingUnifier: anUnifier [

	^ anUnifier
		  forRBLogicVariableNode: self
		  forRBLogicVariableNode: aNode
]
