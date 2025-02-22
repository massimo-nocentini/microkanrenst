Extension { #name : 'OCProgramNodeVisitor' }

{ #category : '*MicroKanren-RB' }
OCProgramNodeVisitor >> visitLogicVariableNode: aRBMKVarNode [
	self visitVariableNode: aRBMKVarNode
]
