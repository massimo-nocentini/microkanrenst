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
Cond >> onState: aState afterPushingGoal: _ [

	^ [ 
	  | g |
	  g := clauses foldr: if init: false asGoal.
	  g onState: aState ] srfi41Stream
]

{ #category : #initializing }
Cond >> otherwise: aGoal [
	self if: true asGoal then: aGoal
]

{ #category : #running }
Cond >> pruning: aPruningStrategy [

	clauses := clauses collect: [ :each | 
		           | k v |
		           k := each key pruning: aPruningStrategy.
		           v := each value pruning: aPruningStrategy.
		           k -> v ]
]
