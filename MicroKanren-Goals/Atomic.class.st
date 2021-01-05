Class {
	#name : #Atomic,
	#superclass : #Goal,
	#category : #'MicroKanren-Goals'
}

{ #category : #'as yet unclassified' }
Atomic >> onState: aState afterPushingGoal: aGoal [

	^ aState srfi41Singleton
]

{ #category : #'as yet unclassified' }
Atomic >> pruning: aPruningStrategy [

	^ Pruning new
		  receiver: aPruningStrategy;
		  nestedGoal: self;
		  yourself
]
