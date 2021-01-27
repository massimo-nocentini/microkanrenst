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

	| array walker |
	walker := aState walker.
	array := Array with: aState with: (variables collect: [ :each | 
			          each -> (Dictionary new
				           at: #walk put: (aState walk: each);
				           at: #walkStar put: (walker value: each);
				           yourself) ]) asDictionary.
	array inspect.
	^ super onState: aState
]

{ #category : #'as yet unclassified' }
MKGoalProjector >> variables: aCollection [ 
	variables := aCollection
]
