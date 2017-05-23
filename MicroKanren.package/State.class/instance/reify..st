reification
reify: vars
	^ vars
		collect: [ :v | 
			| w s |
			w := Walker new star: v onState: self.
			s := Reifier new reify: w onState: self class empty.
			Walker new star: w onState: s ]