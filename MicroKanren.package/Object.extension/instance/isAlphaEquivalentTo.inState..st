*MicroKanren-core
isAlphaEquivalentTo: y inState: aState
	| values |
	values := aState reifier reifyVars: {self. y}.
	^ values first = values second