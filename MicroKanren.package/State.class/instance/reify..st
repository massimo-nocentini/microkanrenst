reification
reify: vars 
	| walker reifier |
	walker := Walker on: self.
	reifier := Reifier on: Dictionary new asState.
	^ vars
		collect: [:v | 
			| w s |
			w := walker walkStar: v.
			s := reifier reify: w.
			(Walker on: s) walkStar: w ]