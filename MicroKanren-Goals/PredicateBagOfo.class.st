Class {
	#name : #PredicateBagOfo,
	#superclass : #PredicateTernary,
	#instVars : [
		'variables'
	],
	#category : #'MicroKanren-Goals'
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

	^ variables ifNil: [ Error signal ] ifNotNil: [ 
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

		  aGoal := aDictionary values asCons unifyo value: thirdArgument.

		  aGoal onState: aState ]
]

{ #category : #accessing }
PredicateBagOfo >> variables: aCollection [

	variables := aCollection asCons
]
