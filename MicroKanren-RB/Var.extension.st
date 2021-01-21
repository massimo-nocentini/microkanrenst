Extension { #name : #Var }

{ #category : #'*MicroKanren-RB' }
Var >> asRBLogicVariable [

	^ RBLogicVariableNode named: named logicVar: self
]
