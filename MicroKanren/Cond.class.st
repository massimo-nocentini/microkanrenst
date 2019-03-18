Class {
	#name : #Cond,
	#superclass : #Goal,
	#instVars : [
		'clauses',
		'if',
		'else'
	],
	#category : 'MicroKanren-core'
}

{ #category : #initializing }
Cond >> clauses: aCollection [
	clauses := aCollection
]

{ #category : #initializing }
Cond >> e [
	self ifPure: Sequential new
]

{ #category : #initializing }
Cond >> else: aGoal [
	else := true asGoal , aGoal
]

{ #category : #'as yet unclassified' }
Cond >> i [
	self ifPure: Interleaved new
]

{ #category : #initializing }
Cond >> if: ifGoal then: thenGoal [
	clauses add: ifGoal -> thenGoal
]

{ #category : #'as yet unclassified' }
Cond >> ifPure: aStrategy [
	if := [ :clause :otherwise | 
	IfPure new
		question: clause key answer: clause value otherwise: otherwise;
		streamCombinationStrategy: aStrategy;
		yourself ]
]

{ #category : #initializing }
Cond >> initialize [
	super initialize.
	clauses := LinkedList new
]

{ #category : #running }
Cond >> onState: aState [
	| g |
	else ifNil: [ self else: false asGoal ].
	g := clauses copy
		add: else;
		reduceRight: if.
	^ g onState: aState
]
