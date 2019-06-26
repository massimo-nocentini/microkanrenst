tests
testCaro
	| g µ |
	µ := Theory sexp.
	g := [:r | µ caro value: 'acorn' asCons value: r] fresh.
	self assert: g solutions contents equals: {$a}.
	g := [:r | [:x :y | (µ caro value: {#grape. #raisin. #pear} asCons value: x)
				, (µ caro value: {#a cons: nil. #b cons: nil. #c cons: nil} asCons value: y)
				, (µ conso &&!{x. y.r})] fresh] fresh.
	self assert: g solutions contents equals: {{#grape. #a} asCons}