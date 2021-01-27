Class {
	#name : #MKGoalProjector,
	#superclass : #Atomic,
	#instVars : [
		'variables'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
MKGoalProjector >> onState: aState [

	| walker |
	walker := aState walker.
	(variables collect: [ :each | 
		 each -> (Dictionary new
			  at: #walk put: (aState walk: each);
			  at: #walkStar put: (walker value: each);
			  yourself) ]) asDictionary inspect.

	^ super onState: aState
]

{ #category : #'as yet unclassified' }
MKGoalProjector >> variables: aCollection [ 
	variables := aCollection
]
