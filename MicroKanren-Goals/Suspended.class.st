Class {
	#name : #Suspended,
	#superclass : #Goal,
	#instVars : [
		'receiver',
		'nestedGoal'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #'as yet unclassified' }
Suspended >> onState: aState afterPushingGoal: _ [

	^ [ nestedGoal onState: aState ] srfi41Stream
]

{ #category : #accessing }
Suspended >> receiver [

	^ receiver
]

{ #category : #accessing }
Suspended >> receiver: aBlockClosure [
	receiver := aBlockClosure
]
