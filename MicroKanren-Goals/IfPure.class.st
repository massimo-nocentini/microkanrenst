Class {
	#name : #IfPure,
	#superclass : #If,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
IfPure >> onState: aState [

	| disj |
	disj := chainCombinationStrategy value
		        either: question , answer;
		        or: otherwise;
		        yourself.

	^ (super onState: aState) , (disj onState: aState)
]
