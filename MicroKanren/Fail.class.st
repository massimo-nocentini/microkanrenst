"
Falsehood is a goal that admits no solutions at all.
"
Class {
	#name : #Fail,
	#superclass : #Goal,
	#category : #MicroKanren
}

{ #category : #running }
Fail >> onState: aState [
	^ {} asSrfi41Stream
]
