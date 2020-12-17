Class {
	#name : #Conj,
	#superclass : #Binary,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Conj >> onState: aState afterPushingGoal: _ [

	^ [ :refinedState | 
	  refinedState path value in: [ :aGoal | 
		  aGoal onState: refinedState forGoal: right fromConj: self ] ]
	  >>= (left onState: aState)
]
