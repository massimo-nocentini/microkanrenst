Extension { #name : #RBLogicVariableNode }

{ #category : #'*MicroKanren-RB' }
RBLogicVariableNode >> unifyWith: anObject usingUnifier: anUnifier [

	^ anObject unifyWithRBLogicVariableNode: self usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-RB' }
RBLogicVariableNode >> unifyWithObject: anObject usingUnifier: anUnifier [

	^ logicVar unifyWithObject: anObject usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-RB' }
RBLogicVariableNode >> unifyWithRBLogicVariableNode: aNode usingUnifier: anUnifier [

	^ logicVar unifyWithVar: aNode logicVar usingUnifier: anUnifier
]
