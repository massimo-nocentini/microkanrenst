Class {
	#name : #Succeed,
	#superclass : #Atomic,
	#category : #'MicroKanren-Goals'
}

{ #category : #'as yet unclassified' }
Succeed >> popGoalFromPathOfState: aState forConj: aGoal [

	aState path: aState path nextLink
]
