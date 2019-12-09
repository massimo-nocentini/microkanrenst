Class {
	#name : #CombinatoricsTheoryTest,
	#superclass : #Srfi41AbstractTest,
	#category : #'MicroKanren-Testing'
}

{ #category : #tests }
CombinatoricsTheoryTest >> testDycko [
	| g combTheory |
	combTheory := CombinatoricsTheory new.
	g := [ :alpha | combTheory dycko value: alpha ] fresh.
	self
		assert: (g solutions next: 20)
		equals:
			({nil . '()' . '(())' . '(()())' . '()()' . '()(())' . '()(()())'.
			'(()()())' . '()()()' . '(())()' . '()()(())' . '()()(()())'.
			'(())(())' . '()(()()())' . '()()()()' . '((()))' . '()(())()'.
			'(())(()())' . '()()()(())' . '()()()(()())'} collect: #asCons)
		modulo: #asOrderedCollection.
	g := [ :alpha | combTheory dycko value: '(()(())()(' asCons ] fresh.
	"an invalid Dyck path"
	self assert: g solutions isEmpty
]
