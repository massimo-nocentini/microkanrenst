tests
testLengtho
	| g µ |
	µ := Theory sexp.
	g := µ lengtho value: {} asCons value: 0 asConsedBinaryRepr.
	self assert: g solutions contents equals: {Var tautology}.
	g := [:n | µ lengtho value: {#anElement} asCons value: n] fresh.
	self assert: (g solutions next: 1) contents equals: {1 asConsedBinaryRepr}.
	g := µ lengtho &&! {(1 to: 10) asCons. 10 asConsedBinaryRepr}.
	self assert: g solutions contents equals: {Var tautology}.
	g := [:lst | µ lengtho &&! {lst. 3 asConsedBinaryRepr}] fresh.
	self assert: g solutions contents equals: {{0 asReifiedVar. 1 asReifiedVar. 2 asReifiedVar} asCons}.
	self flag: 'FIXME: workaround to preveent unbounded computation'.
	g := [:n | µ lengtho &&! {(1 to: 10) asCons. n}] fresh.
	self assert: (g solutions next: 1) contents equals: {10 asConsedBinaryRepr}