Extension { #name : 'ASTProgramNodeVisitor' }

{ #category : '*MicroKanren-RB' }
ASTProgramNodeVisitor >> visitLogicVariableNode: aRBMKVarNode [
	self visitVariableNode: aRBMKVarNode
]
