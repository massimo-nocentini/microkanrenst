Class {
	#name : #Suspended,
	#superclass : #Goal,
	#instVars : [
		'receiver'
	],
	#category : #'MicroKanren-Goals'
}

{ #category : #accessing }
Suspended >> receiver: aBlockClosure [
	receiver := aBlockClosure
]
