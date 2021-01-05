Class {
	#name : #Pruning,
	#superclass : #Suspended,
	#category : #'MicroKanren-Goals'
}

{ #category : #accessing }
Pruning class >> maxDepth: anInteger [

	^ PruningStrategyMaxDepth new
		  maxDepth: 10;
		  yourself
]

{ #category : #'as yet unclassified' }
Pruning >> continueOnState: aState [

	^ (nestedGoal pruning: receiver) onState: aState
]

{ #category : #running }
Pruning >> onState: aState [

	| aStateOrException |
	aStateOrException := receiver onState: aState fromPruning: self.
	^ aStateOrException onState: aState afterPruning: self
]
