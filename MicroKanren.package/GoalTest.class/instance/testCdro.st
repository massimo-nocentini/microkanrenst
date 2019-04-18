tests
testCdro
	| g µ |
	µ := Theory sexp.
	g := [:r | [:d | (µ cdro value: 'acorn' asCons value: d)
				, (µ caro value: d value: r)] fresh] fresh.
	self assert: g solutions contents equals: {$c}.
	g := [:r | [:x :y | (µ cdro value: {#grape. #raisin. #pear} asCons value: x)
				, (µ caro value: {#a cons: nil. #b cons: nil. #c cons: nil} asCons value: y)
				, (µ conso
						value: x
						value: y
						value: r)] fresh] fresh.
	self assert: g solutions contents equals: {{{#raisin. #pear}. #a} asCons}.
	g := [:r | µ cdro value: 'acorn' asCons value: 'corn' asCons] fresh.
	self assert: g solutions contents equals: {0 asReifiedVar}.
	g := [:r | µ cdro value: 'acorn' asCons value: 'acorn' asCons] fresh.
	self assert: g solutions contents equals: {}.
	g := [:r | µ cdro value: 'corn' asCons value: {r. $r. $n} asCons] fresh.
	self assert: g solutions contents equals: {$o}.
	g := [:l | [:x | (µ caro value: l value: $a)
				, (µ cdro value: l value: 'corn' asCons)] fresh] fresh.
	self assert: g solutions contents equals: {'acorn' asCons}