Class {
	#name : #Failed,
	#superclass : #Goal,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
Failed >> onState: aState [

	^ {  } asSrfi41Stream
]
