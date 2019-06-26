Class {
	#name : #InductiveRelation,
	#superclass : #Object,
	#instVars : [
		'rules'
	],
	#category : 'MicroKanren-ext'
}

{ #category : #computing }
InductiveRelation >> relateo [
	^ [:anObj :anotherObj | 
	| g |
	g := Goal cond i.
	rules
		do: [:r | g
				if: (r relateo value: anObj value: anotherObj)
				then: true asGoal].
	g]
]

{ #category : #initializing }
InductiveRelation >> rules: aCollection [ 
	rules := aCollection collect: [:each | each machine: self; yourself]
]
