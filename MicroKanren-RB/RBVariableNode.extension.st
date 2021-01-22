Extension { #name : #RBVariableNode }

{ #category : #'*MicroKanren-RB' }
RBVariableNode >> unifyWith: anObject usingUnifier: anUnifier [

	^ anObject unifyWithRBVariableNode: self usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-RB' }
RBVariableNode >> unifyWithRBVariableNode: aNode usingUnifier: anUnifier [

	^ anUnifier forRBVariableNode: self forRBVariableNode: aNode
]
