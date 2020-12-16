Class {
	#name : #PredicateFindAllo,
	#superclass : #PredicateTernary,
	#category : #'MicroKanren-Predicates'
}

{ #category : #running }
PredicateFindAllo >> goal [

	self shouldNotImplement
]

{ #category : #accessing }
PredicateFindAllo >> name [

	^ 'findAllº'
]

{ #category : #running }
PredicateFindAllo >> onState: aState [

	| states aGoal aCons |
	states := (firstArgument onState: aState) asOrderedCollection.

	aCons := (states collect: [ :each | 
		          each walker value: secondArgument ]) asCons.

	aGoal := aCons unifyo value: thirdArgument.

	^ aGoal onState: aState
]
