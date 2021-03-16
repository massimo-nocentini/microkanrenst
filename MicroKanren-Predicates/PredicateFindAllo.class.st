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

	| states aGoal aCons walker |
	states := ((firstArgument onState: aState) select: [ :each | 
		           each isSound ]) asOrderedCollection.

	walker := Walker new.
	aCons := (states collect: [ :each | 
		          walker
			          state: each;
			          value: secondArgument ]) asCons.

	aGoal := aCons unifyo value: thirdArgument.

	^ aGoal onState: aState
]
