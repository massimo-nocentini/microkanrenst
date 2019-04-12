as yet unclassified
testAlphaRule
	| g µ |
	µ := Theory sexp.
	g := [:x :y | µ alphaRuleo value: x value: y] fresh.
	self assert: g solutions all equals: {}.
	g := [[:x :y | (x unifyWith: 3)
				, (y unifyWith: 3)
				, (µ alphaRuleo value: x value: y)] fresh] eta.
	self assert: g solutions all equals: {Var tautology}.
	g := [[:x :y | (x unifyWith: 3)
				, (y unifyWith: 4)
				, (µ alphaRuleo value: x value: y)] fresh] eta.
	self assert: g solutions all equals: {}.
	g := [:x :y | (x unifyWith: y)
				, (µ alphaRuleo value: x value: y)] fresh.
	self assert: g solutions all equals: {{0 asReifiedVar. 0 asReifiedVar}}.
	g := [:x :y | (µ alphaRuleo value: x value: y)
				, (x unifyWith: y)] fresh.
	self assert: g solutions all equals: {} "alphaRuleo is an impure operator."