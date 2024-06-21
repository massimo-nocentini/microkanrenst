Extension { #name : 'Class' }

{ #category : '*MicroKanren-RB' }
Class >> asGlobalRBNode [
	^ RBGlobalNode named: name
]
