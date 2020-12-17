Class {
	#name : #IfPure,
	#superclass : #If,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
IfPure >> onState: aState [

	| disj |
	disj := chainCombinationStrategy value
		        left: question , answer;
		        right: otherwise;
		        yourself.

	^ (super onState: aState) , (disj onState: aState)
]
