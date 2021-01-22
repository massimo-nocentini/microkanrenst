Extension { #name : #RBLogicVariableNode }

{ #category : #'*MicroKanren-RB' }
RBLogicVariableNode >> unifyWith: anObject usingUnifier: anUnifier [

	^ logicVar unifyWith: anObject usingUnifier: anUnifier
]
