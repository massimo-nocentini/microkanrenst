Extension { #name : 'Class' }

{ #category : '*MicroKanren-RB' }
Class >> asGlobalRBNode [
	"RBGlobalNode is gone since Pharo 12: a variable node, bound by the semantic analysis to the global."

	^ RBVariableNode named: name
]
