Class {
	#name : #Failed,
	#superclass : #Goal,
	#category : #'MicroKanren-Goals'
}

{ #category : #printing }
Failed >> printOn: aStream [
	aStream nextPut: $Ø
]
