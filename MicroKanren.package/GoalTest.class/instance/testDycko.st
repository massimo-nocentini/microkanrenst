tests
testDycko
	| g |
	g := [:alpha | combTheory dyckº value: alpha] fresh.
	self
		assert: (g solutions next: 20) contents
		equals: ({nil. '()'. '(())'. '(()())'. '()()'. '(()()())'. '()(())'. '(())()'. '()(()())'. '((()))'. '()()()'. '(())(())'. '()(()()())'. '(()()()())'. '()()(())'. '(())(()())'. '()(())()'. '(()())()'. '()()(()())'. '(())()()'} collect: #asCons).
	"{nil. '()'. '(())'. '()()'. '(()())'. '()(())'. '(())()'. '()()()'. '(()()())'. '()(()())'.
	'(())(())'. '()()(())'. '((()))'. '()(())()'. '(())()()'. '()()()()'. '(()()()())'.
	'()(()()())'. '(())(()())'. '()()(()())'}"
	g := [:alpha | combTheory dyckº value: '(()(())()(' asCons] fresh.
	"an invalid Dyck path"
	self assert: g solutions contents equals: {}