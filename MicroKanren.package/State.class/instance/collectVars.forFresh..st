dispatching
collectVars: aCollection forFresh: aFresh 
	| nextState vars |
	nextState := self class new substitution: substitution;
				 birthdate: birthdate + aCollection size;
				 yourself.
	vars := aCollection
				collect: #asVar.
	^ aFresh onState: nextState withVars: vars