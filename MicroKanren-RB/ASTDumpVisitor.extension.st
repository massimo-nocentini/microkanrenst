Extension { #name : 'ASTDumpVisitor' }

{ #category : '*MicroKanren-RB' }
ASTDumpVisitor >> visitLogicVariableNode: aRBMKVarNode [
	self visitVariableNode: aRBMKVarNode.
	stream nextPutAll: aRBMKVarNode logicVar asString
]
