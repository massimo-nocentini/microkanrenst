"
I represent a goal that always *fails*, namely it produces an empty stream regardless of the given state.
"
Class {
	#name : #Failed,
	#superclass : #Goal,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Failed >> onState: aState [

	^ {  } asSrfi41Stream
]
