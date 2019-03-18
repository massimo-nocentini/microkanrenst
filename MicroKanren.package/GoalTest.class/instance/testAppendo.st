tests
testAppendo
	| g |
	g := [ :l | sexpTheory let: l be: #(a b c) asCons append: #(d e) asCons ] fresh.
	self assert: g solutions all equals: {#(a b c d e) asCons}.
	g := [ :l | sexpTheory let: #(a b c d e) asCons be: #(a b c) asCons append: (#(d) asConsWithCdr: l) ]
		fresh.
	self assert: g solutions all equals: {(#e cons: nil)}.
	g := [ :l | sexpTheory let: (#(a b c d) asConsWithCdr: #e) be: #(a b c) asCons append: (#(d) asConsWithCdr: l) ]
		fresh.
	self assert: g solutions all equals: {#e}