tests
testDycko
	| g |
	g := [ :alpha | combTheory dycko: alpha ] fresh.
	self
		assert: (g solutions atMost: 20)
		equals:
			({nil . '()' . '(())' . '()()' . '(()())' . '()(())' . '(())()' . '()()()' . '(()()())'.
			'()(()())' . '(())(())' . '()()(())' . '((()))' . '()(())()' . '(())()()' . '()()()()'.
			'(()()()())' . '()(()()())' . '(())(()())' . '()()(()())'} collect: #asCons).
	g := [ :alpha | combTheory dycko: '(()(())()(' asCons ] fresh.	"an invalid Dyck path"
	self assert: g solutions all equals: {}