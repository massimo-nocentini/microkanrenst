reification
reifyVars: vars 
	| walker reifier |
	walker := state walker.
	reifier := Dictionary new asState reifier.
	^ vars
		collect: [:v | 
			| w s |
			w := walker value: v.
			s := reifier value: w.
			s walker value: w]