Extension { #name : #RBLogicVariableNode }

{ #category : #'*MicroKanren-RB' }
RBLogicVariableNode >> unifyWith: anObject usingUnifier: anUnifier [

	^ logicVar unifyWith: anObject usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-RB' }
RBLogicVariableNode >> unifyWithRBLogicVariableNode: aNode usingUnifier: anUnifier [

	self halt.
	^ self unifyWithVar: aNode logicVar usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-RB' }
RBLogicVariableNode >> unifyWithVar: aVar usingUnifier: anUnifier [

	^ logicVar unifyWith: aVar usingUnifier: anUnifier
]
