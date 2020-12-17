Class {
	#name : #Atomic,
	#superclass : #Goal,
	#category : #'MicroKanren-Goals'
}

{ #category : #'as yet unclassified' }
Atomic >> onState: aState afterPushingGoal: aGoal [

	<doc: #Realog topic: #( Succeed onState )>
	^ (super onState: aState afterPushingGoal: aGoal)
	  , aState srfi41Singleton
]
