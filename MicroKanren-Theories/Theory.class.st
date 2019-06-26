Class {
	#name : #Theory,
	#superclass : #Object,
	#category : #'MicroKanren-Theories'
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
