Class {
	#name : #Eta,
	#superclass : #Suspended,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Eta >> onState: aState [

	nestedGoal
		ifNil: [ nestedGoal := receiver value ]
		ifNotNil: [ Error signal ].
	^ super onState: aState
]

{ #category : #running }
Eta >> onState: aState afterPushingGoal: _ [

	^ [ nestedGoal onState: aState ] srfi41Stream
]
