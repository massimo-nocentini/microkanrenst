dispatching
collectVars: aCollection forFresh: aFresh
	| nextState |
	nextState := self class new
		substitution: substitution;
		birthdate: birthdate + aCollection size;
		yourself.
	vars := aCollection collect: [ :i | Var id: i ].
	^ aFresh onState: nextState withVars: vars