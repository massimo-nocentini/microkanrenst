Extension { #name : #RBProgramNodeVisitor }

{ #category : #'*MicroKanren-RB' }
RBProgramNodeVisitor >> visitLogicVariableNode: aRBMKVarNode [
	self visitVariableNode: aRBMKVarNode
]

{ #category : #'*MicroKanren-RB' }
RBProgramNodeVisitor >> visitSelectorNode: aNode [

	self subclassResponsibility
]
