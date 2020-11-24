Class {
	#name : #Cond,
	#superclass : #Goal,
	#instVars : [
		'clauses',
		'if'
	],
	#category : #'MicroKanren-Goals'
}

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

{ #category : #printing }
Cond >> printClause: anAssociation on: aStream [

	aStream nextPut: $(.
	anAssociation key printOn: aStream.
	aStream nextPutAll: ' → '.
	anAssociation value printOn: aStream.
	aStream nextPut: $)
]

{ #category : #printing }
Cond >> printOn: aStream [

	clauses allButLastDo: [ :each | 
		self printClause: each on: aStream.
		aStream nextPutAll: ';° ' ].
	self printClause: clauses last on: aStream
]
