Class {
	#name : #Succeed,
	#superclass : #Atomic,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Succeed >> onState: aState afterPushingGoal: aGoal [

	<doc: #Realog topic: #( Succeed onState )>
	^ super onState: aState afterPushingGoal: aGoal
]

{ #category : #'as yet unclassified' }
Succeed >> popGoalFromPathOfState: aState forConj: aGoal [

	aState path: aState path nextLink
]
