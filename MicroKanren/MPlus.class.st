Class {
	#name : #MPlus,
	#superclass : #StreamCombination,
	#instVars : [
		'left',
		'right'
	],
	#category : 'MicroKanren-core'
}

{ #category : #'as yet unclassified' }
MPlus class >> with: aCollection with: anotherCollection [
	^ self new
		left: aCollection;
		right: anotherCollection;
		yourself
]

{ #category : #dispatched }
MPlus >> interleavedStrategy: anInterleaved [
	^ left mplus: right interleaved: anInterleaved
]

{ #category : #accessing }
MPlus >> left: aCollection [
	left := aCollection
]

{ #category : #accessing }
MPlus >> right: aCollection [
	right := aCollection
]

{ #category : #dispatched }
MPlus >> sequentialStrategy: aSequential [
	^ left mplus: right sequential: aSequential
]
