running
reify: states
	| vars |
	vars := goal vars ifEmpty: [ {Var tautology} ].
	^ states
		collect: [ :s | 
			| rs |
			rs := s reify: vars.
			rs size = 1
				ifTrue: [ rs first ]
				ifFalse: [ rs ] ]