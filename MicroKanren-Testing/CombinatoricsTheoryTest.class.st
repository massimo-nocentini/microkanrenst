Class {
	#name : #CombinatoricsTheoryTest,
	#superclass : #TestCase,
	#category : #'MicroKanren-Testing'
}

{ #category : #tests }
CombinatoricsTheoryTest >> testDycko [
	| g combTheory|
	combTheory := CombinatoricsTheory new.
	g := [ :alpha | combTheory dycko value: alpha ] fresh.
	self
		assert: (g solutions next: 20) contents
		equals:
			({nil . '()' . '(())' . '(()())' . '()()' . '()(())' . '()(()())'.
			'(()()())' . '()()()' . '(())()' . '()()(())' . '()()(()())'.
			'(())(())' . '()(()()())' . '()()()()' . '((()))' . '()(())()'.
			'(())(()())' . '()()()(())' . '()()()(()())'} collect: #asCons).
	g := [ :alpha | combTheory dycko value: '(()(())()(' asCons ] fresh.
	"an invalid Dyck path"
	self assert: g solutions contents equals: {}
]
