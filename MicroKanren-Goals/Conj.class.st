Class {
	#name : #Conj,
	#superclass : #Binary,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Conj >> onState: aState afterPushingGoal: _ [

	^ (left onState: aState) appendMap: [ :refinedState | 
		  refinedState path value in: [ :aGoal | 
			  aGoal onState: refinedState forGoal: right fromConj: self ] ]
]
