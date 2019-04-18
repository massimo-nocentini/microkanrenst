as yet unclassified
testAlphaRuleo
	| g µ |
	µ := Theory sexp.
	g := [:x :y | µ alphaRuleo value: x value: y] fresh.
	self assert: g solutions contents equals: {}.
	g := [[:x :y | x =° 3 , (y =° 3)
				, (µ alphaRuleo value: x value: y)] fresh] eta.
	self assert: g solutions contents equals: {Var tautology}.
	g := [[:x :y | x =° 3 , (y =° 4)
				, (µ alphaRuleo value: x value: y)] fresh] eta.
	self assert: g solutions contents equals: {}.
	g := [:x :y | x =° y
				, (µ alphaRuleo value: x value: y)] fresh.
	self assert: g solutions contents equals: {{0 asReifiedVar. 0 asReifiedVar}}.
	g := [:x :y | (µ alphaRuleo value: x value: y)
				, (x =° y)] fresh.
	self assert: g solutions contents equals: {}
	"alphaRuleo is an impure operator."