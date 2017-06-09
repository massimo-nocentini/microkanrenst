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
			'(()())' asCons}