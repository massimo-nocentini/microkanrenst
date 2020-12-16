Class {
	#name : #Disequality,
	#superclass : #PredicateBinary,
	#category : #'MicroKanren-Predicates'
}

{ #category : #accessing }
Disequality >> name [

	^ '≠º'
]

{ #category : #running }
Disequality >> onState: aState [

	aState pushGoal: self copy.
	^ aState srfi41Singleton "don't use `false asGoal` for now"
]
