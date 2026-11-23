"
I am the superclass of the theories, which group relations: each message of a theory answers a block, or a `Predicate` class, that answers a goal when it is evaluated with the arguments of the relation. My class methods `arith`, `montecarloLock` and `sexp` make a theory.
"
Class {
	#name : #Theory,
	#superclass : #Object,
	#category : #'MicroKanren-Theories-theories'
}

{ #category : #creating }
Theory class >> arith [
	^ ArithTheory new
]

{ #category : #creating }
Theory class >> montecarloLock [
	^ MontecarloLockTheory new
]

{ #category : #'as yet unclassified' }
Theory class >> sexp [
^ SexpTheory new
]
