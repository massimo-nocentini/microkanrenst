Class {
	#name : #Atomic,
	#superclass : #Goal,
	#category : #'MicroKanren-Goals'
}

{ #category : #'as yet unclassified' }
Atomic >> onState: aState afterPushingGoal: aGoal [

	<doc: #Realog topic: #( Succeed onState )>
	^ aState srfi41Singleton
]
