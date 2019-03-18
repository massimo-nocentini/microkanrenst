Class {
	#name : #InductiveRelationsTheory,
	#superclass : #Object,
	#instVars : [
		'rules',
		'sexpTheory'
	],
	#category : 'MicroKanren-theories'
}

{ #category : #initialization }
InductiveRelationsTheory >> initialize [
	super initialize.
	sexpTheory := SexpTheory new
]

{ #category : #computing }
InductiveRelationsTheory >> proves: anObj relates: anotherObj [
	| g |
	g := Goal cond i.
	rules do: [ :r | g if: (r consumes: anObj produces: anotherObj machine: self) then: true asGoal ].
	^ g
]

{ #category : #initializing }
InductiveRelationsTheory >> rules: aCollection [
	rules := aCollection
]

{ #category : #accessing }
InductiveRelationsTheory >> sexpTheory [
	^ sexpTheory
]
