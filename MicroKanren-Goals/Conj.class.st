Class {
	#name : #Conj,
	#superclass : #Goal,
	#instVars : [
		'both',
		'and'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #accessing }
Conj >> and [
	^ and
]

{ #category : #accessing }
Conj >> and: anotherGoal [ 
	and := anotherGoal
]

{ #category : #accessing }
Conj >> both [
	^ both
]

{ #category : #accessing }
Conj >> both: aGoal [ 
	both := aGoal
]

{ #category : #running }
Conj >> onState: aState afterPushingGoal: _ [

	| boundStream superStream |
	superStream := super onState: aState afterPushingGoal: _.
	boundStream := [ :refinedState | 
	               refinedState path value in: [ :aGoal | 
		               aGoal class = Failed
			               ifTrue: [ refinedState srfi41Singleton ]
			               ifFalse: [ "aGoal
					               popGoalFromPathOfState: refinedState
					               forConj: self." 
				               and onState: refinedState ] ] ]
	               >>= (both onState: aState).
	^ superStream , boundStream
]
