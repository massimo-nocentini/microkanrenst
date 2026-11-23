"
I am the superclass of the predicates, goals with a `name` that are run by means of another goal: subclasses answer it in `goal`, which is sent at every run, so that a predicate may refer to itself. My name is what `MKGoalPrinter` prints.

My subclasses `PredicateUnary`, `PredicateBinary` and `PredicateTernary` hold one, two and three arguments. A predicate class can be used in place of a block that answers a goal, since it understands `value:`, `value:value:` or `value:value:value:` accordingly.
"
Class {
	#name : #Predicate,
	#superclass : #Goal,
	#category : #'MicroKanren-Predicates'
}

{ #category : #running }
Predicate >> goal [
	self subclassResponsibility
]

{ #category : #accessing }
Predicate >> name [

	self subclassResponsibility
]

{ #category : #running }
Predicate >> onState: aState [
	^ self goal onState: aState
]

{ #category : #predicates }
Predicate >> unifyº [

	^ [ :a :b | a unifyo value: b ]
]
