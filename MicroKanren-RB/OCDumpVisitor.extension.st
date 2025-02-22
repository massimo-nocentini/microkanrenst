Extension { #name : 'OCDumpVisitor' }

{ #category : '*MicroKanren-RB' }
OCDumpVisitor >> visitLogicVariableNode: aRBMKVarNode [
	self visitVariableNode: aRBMKVarNode.
	stream nextPutAll: aRBMKVarNode logicVar asString
]
