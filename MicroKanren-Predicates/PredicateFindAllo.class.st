"
I collect the values that a template takes in the states of a goal: my arguments are the goal, the template and the object to unify with the list of the values. `Goal class>>findAllo` answers my class. I override `onState:`, hence I have no `goal`.

As it is, `onState:` sends `walker` to the whole stream of the sound states of the goal, rather than to each of them.
"
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
	states := OrderedCollection with:
		          ((firstArgument onState: aState) select: [ :each |
			           each isSound ]).

	aCons := (states collect: [ :each |
		          each walker value: secondArgument ]) asCons.

	aGoal := aCons unifyo value: thirdArgument.

	^ aGoal onState: aState
]
