Extension { #name : 'Var' }

{ #category : '*MicroKanren-RB' }
Var >> asRBNode [

	^ RBLogicVariableNode named: named logicVar: self
]
