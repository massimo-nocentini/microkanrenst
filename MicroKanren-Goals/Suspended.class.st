"
I am a goal made by a block, my `receiver`: subclasses get a `nestedGoal` out of it, and I answer a block that runs that goal, so that nothing is computed until the stream is asked for.
"
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

	^ [ nestedGoal onState: aState ]
]

{ #category : #accessing }
Suspended >> receiver [

	^ receiver
]

{ #category : #accessing }
Suspended >> receiver: aBlockClosure [
	receiver := aBlockClosure
]
