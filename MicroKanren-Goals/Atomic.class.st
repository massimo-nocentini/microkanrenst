"
I am a goal without subgoals: I answer the stream with the given state only, after I have been pushed on its path.
"
Class {
	#name : #Atomic,
	#superclass : #Goal,
	#category : #'MicroKanren-Goals'
}

{ #category : #'as yet unclassified' }
Atomic >> onState: aState afterPushingGoal: aGoal [

	^ ValueLink value: aState
]
