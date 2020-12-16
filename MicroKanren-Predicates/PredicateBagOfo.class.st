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
	aDictionary := (firstArgument onState: aState)
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
				         | aConj |
				         aConj := (variables unifyo value: each key)
				                  ,
				                  (each value asCons unifyo value: thirdArgument).
				         aConj | aDisj ]
			         init: false asGoal ].

	^ aGoal onState: aState
]

{ #category : #accessing }
PredicateBagOfo >> variables: aCollection [

	variables := aCollection asCons
]
