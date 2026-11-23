"
I collect the values that a template takes in the sound states of a goal, grouped by the values of some `variables` in the same states: for each group I unify the variables with their values, and my third argument with the list of the group. I fail if there are no groups. My arguments are the goal, the template and the object for the list. I override `onState:`, hence I have no `goal`.

`Goal class>>bagOfo` answers my class; send `variables:` to the predicate, with an empty collection to have one group.

I send `foldrStrict:init:` to the stream of the states, which no package of this project implements.
"
Class {
	#name : #PredicateBagOfo,
	#superclass : #PredicateTernary,
	#instVars : [
		'variables'
	],
	#category : #'MicroKanren-Predicates'
}

{ #category : #running }
PredicateBagOfo >> goal [

	self shouldNotImplement
]

{ #category : #accessing }
PredicateBagOfo >> name [

	^ 'bagOfº'
]

{ #category : #running }
PredicateBagOfo >> onState: aState [

	| aDictionary aGoal |
	aDictionary := ((firstArgument onState: aState) select: [ :each | 
		                each isSound ])
		               foldrStrict: [ :each :aDict | 
			               | walker walkedTemplate key |
			               walker := each walker.
			               walkedTemplate := walker value: secondArgument.
			               key := walker value: variables.
			               aDict
				               at: key
				               ifPresent: [ :aCons | 
					               aDict at: key put: (walkedTemplate cons: aCons) ]
				               ifAbsentPut: [ walkedTemplate cons: nil ];
				               yourself ]
		               init: [ Dictionary new ].

	aGoal := aDictionary ifEmpty: [ false asGoal ] ifNotEmpty: [ 
		         aDictionary associations
			         foldr: [ :each :aDisj | 
				         (variables unifyo value: each key)
				         , (each value asCons unifyo value: thirdArgument) | aDisj ]
			         init: false asGoal ].

	^ aGoal onState: aState
]

{ #category : #accessing }
PredicateBagOfo >> variables: aCollection [

	variables := aCollection asCons
]
