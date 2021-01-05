Class {
	#name : #PruningStrategyMaxDepth,
	#superclass : #PruningStrategy,
	#instVars : [
		'maxDepth'
	],
	#category : #MicroKanren
}

{ #category : #'as yet unclassified' }
PruningStrategyMaxDepth >> description [

	^ String streamContents: [ :aStream | 
		  aStream
			  nextPutAll: 'Max depth of ';
			  nextPut: maxDepth;
			  nextPutAll: ' reached, too deep.' ]
]

{ #category : #accessing }
PruningStrategyMaxDepth >> maxDepth: anObject [

	maxDepth := anObject
]

{ #category : #'as yet unclassified' }
PruningStrategyMaxDepth >> onState: aState fromPruning: aGoal [

	^ aState path size <= maxDepth
		  ifTrue: [ aState ]
		  ifFalse: [ 
			self halt.
			  PrunedError new
				  pruningStrategy: self;
				  yourself ]
]
