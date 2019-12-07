Class {
	#name : #IfPure,
	#superclass : #If,
	#category : #MicroKanren
}

{ #category : #running }
IfPure >> onState: aState [
	^ [ question , answer onState: aState ] srfi41Stream
		+ [ otherwise onState: aState ] srfi41Stream
]
