Extension { #name : #Var }

{ #category : #'*MicroKanren-RB' }
Var >> asRBLogicVariableNamed: aName [

	^ RBLogicVariableNode named: aName logicVar: self
]
