tests
testConso
	| g µ |
	µ := Theory sexp.
	g := µ conso
				value: 'abc' asCons
				value: 'de' asCons
				value: 'abcde' asCons.
	self assert: g solutions contents equals: {}.
	g := [:l | µ conso
				value: 'abc' asCons
				value: 'de' asCons
				value: l] fresh.
	self assert: g solutions contents equals: {{{$a. $b. $c}. $d. $e} asCons}.
	g := [:l | µ conso
				value: #(#a #b #c) asCons
				value: #(#(#d #e)) asCons
				value: l] fresh.
	self assert: g solutions contents equals: {#(#(#a #b #c) #(#d #e)) asCons}.
	g := [:l | µ conso
				value: l
				value: #(#b #c #d) asCons
				value: #(#a #b #c #d) asCons] fresh.
	self assert: g solutions contents equals: {#a}.
	g := [:l | [:x :y :z | (l unifyo value: {#e. #a. #d. x} asCons)
				, (µ conso
						value: y
						value: {#a. z. #c} asCons
						value: l)] fresh] fresh.
	self assert: g solutions contents equals: {#(#e #a #d #c) asCons}