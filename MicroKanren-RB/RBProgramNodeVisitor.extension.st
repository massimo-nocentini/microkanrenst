Extension { #name : #RBProgramNodeVisitor }

{ #category : #'*MicroKanren-RB' }
RBProgramNodeVisitor >> visitLogicVariableNode: aRBMKVarNode [
	self visitVariableNode: aRBMKVarNode
]
