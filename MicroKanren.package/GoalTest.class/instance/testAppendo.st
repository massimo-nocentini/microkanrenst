tests
testAppendo
	| g |
	g := [ :l | sexpTheory appendo   value: #(a b c) asCons value: #(d e) asCons value: l] fresh.
	self assert: g solutions all equals: {#(a b c d e) asCons}.
	g := [ :l | sexpTheory appendo  value: #(a b c) asCons value: (#(d) asConsWithCdr: l) value: #(a b c d e) asCons  ]
		fresh.
	self assert: g solutions all equals: {(#e cons: nil)}.
	g := [ :l | sexpTheory appendo  value: #(a b c) asCons value: (#(d) asConsWithCdr: l)value: (#(a b c d) asConsWithCdr: #e)  ]
		fresh.
	self assert: g solutions all equals: {#e}