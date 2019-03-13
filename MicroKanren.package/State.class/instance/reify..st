reification
reify: vars
	| walker reifier reificationState |
	walker := Walker new.
	reifier := Reifier new.
	reificationState := Dictionary new asState.
	^ vars
		collect: [ :v | 
			| w s |
			w := walker walkStar: v onState: self.
			s := reifier reify: w onState: reificationState.
			walker walkStar: w onState: s ]