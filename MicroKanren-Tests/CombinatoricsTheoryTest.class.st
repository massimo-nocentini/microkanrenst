Class {
	#name : #CombinatoricsTheoryTest,
	#superclass : #GoalAbstractTest,
	#category : #'MicroKanren-Tests'
}

{ #category : #tests }
CombinatoricsTheoryTest >> testDycko [
	| g combTheory |
	combTheory := CombinatoricsTheory new.
	g := [ :alpha | combTheory dycko value: alpha ] asGoal.
	self
		assert: (g solutions next: 20)
		equals:
			({nil . '()' . '(())' . '()()' . '(()())' . '(())()' . '()(())' . '(()()())'.
			'((()))' . '(())(())' . '()()()' . '(()()()())' . '((())())'.
			'(()())()' . '(())()()' . '()(()())' . '(()()()()())' . '((())()())'.
			'(()()())()' . '((()))()'} collect: #asCons)
		modulo: #asOrderedCollection.
	g := [ :alpha | combTheory dycko value: '(()(())()(' asCons ] asGoal.
	"an invalid Dyck path"
	self assert: g solutions isEmpty
]
