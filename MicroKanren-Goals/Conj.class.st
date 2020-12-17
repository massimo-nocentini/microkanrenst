Class {
	#name : #Conj,
	#superclass : #Binary,
	#category : #'MicroKanren-Goals'
}

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
				               left onState: refinedState ] ] ]
	               >>= (right onState: aState).
	^ superStream , boundStream
]
