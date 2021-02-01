Extension { #name : #Var }

{ #category : #'*MicroKanren-RB' }
Var >> asRBNode [

	^ RBLogicVariableNode named: named logicVar: self
]

{ #category : #'*MicroKanren-RB' }
Var >> unifyWithRBLogicVariableNode: aNode usingUnifier: anUnifier [

	^ anUnifier forVar: self forVar: aNode logicVar
]
