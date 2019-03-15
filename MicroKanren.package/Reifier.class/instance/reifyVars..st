reification
reifyVars: vars 
	| walker reifier |
	walker := state walker.
	reifier := Dictionary new asState reifier.
	^ vars
		collect: [:v | 
			| w s |
			w := walker walkStar: v.
			s := reifier reify: w.
			s walker walkStar: w]