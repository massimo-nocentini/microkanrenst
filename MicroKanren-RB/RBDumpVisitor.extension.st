Extension { #name : #RBDumpVisitor }

{ #category : #'*MicroKanren-RB' }
RBDumpVisitor >> visitLogicVariableNode: aRBMKVarNode [
	self visitVariableNode: aRBMKVarNode.
	stream nextPutAll: aRBMKVarNode logicVar asString
]
