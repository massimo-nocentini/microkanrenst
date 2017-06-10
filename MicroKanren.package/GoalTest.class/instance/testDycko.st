tests
testDycko
	| g |
	g := [ :alpha | combTheory dycko: alpha ] fresh.
	self
		assert: (g solutions atMost: 5)
		equals:
			{nil.
			'()' asCons.
			'(())' asCons.
			'()()' asCons.
			'(()())' asCons}.
	g := [ :alpha | combTheory dycko: '(()(())()(' asCons ] fresh.	"an invalid Dyck path"
	self assert: g solutions all equals: {}