Class {
	#name : #Suspended,
	#superclass : #Goal,
	#instVars : [
		'receiver',
		'nestedGoal'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #accessing }
Suspended >> receiver [

	^ receiver
]

{ #category : #accessing }
Suspended >> receiver: aBlockClosure [
	receiver := aBlockClosure
]
