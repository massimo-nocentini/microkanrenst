Class {
	#name : #Conj,
	#superclass : #Binary,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Conj >> onState: aState afterPushingGoal: _ [

	^ [ :refinedState | 
	  refinedState path value in: [ :aGoal | 
		  aGoal class = Failed
			  ifTrue: [ refinedState srfi41Singleton ]
			  ifFalse: [ "aGoal
					               popGoalFromPathOfState: refinedState
					               forConj: self." 
				  right onState: refinedState ] ] ] >>= (left onState: aState)
]
