reification
reify: vars
	| walker reifier |
	walker := Walker new.
	reifier := Reifier new.
	^ vars
		collect: [ :v | 
			| w s |
			w := walker walkStar: v onState: self.
			s := reifier reify: w onState: self class empty.
			walker walkStar: w onState: s ]