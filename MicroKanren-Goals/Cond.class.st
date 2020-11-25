Class {
	#name : #Cond,
	#superclass : #Goal,
	#instVars : [
		'clauses',
		'if'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #accessing }
Cond >> clauses [
	^ clauses
]

{ #category : #initializing }
Cond >> e [

	self ifPure: [ Disj appended ]
]

{ #category : #'as yet unclassified' }
Cond >> i [

	self ifPure: [ Disj interleaved ]
]

{ #category : #initializing }
Cond >> if: ifGoal then: thenGoal [
	clauses add: ifGoal -> thenGoal
]

{ #category : #'as yet unclassified' }
Cond >> ifPure: aStrategy [
	if := [ :clause :otherwise | 
	IfPure new
		question: clause key;
		answer: clause value;
		otherwise: otherwise;
		chainCombinationStrategy: aStrategy;
		yourself ]
]

{ #category : #initializing }
Cond >> initialize [
	super initialize.
	clauses := OrderedCollection new
]

{ #category : #running }
Cond >> onState: aState [

	^ [ 
	  | g |
	  g := clauses foldr: if init: false asGoal.
	  (super onState: aState) , (g onState: aState) ] srfi41Stream
]

{ #category : #initializing }
Cond >> otherwise: aGoal [
	self if: true asGoal then: aGoal
]
