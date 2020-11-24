Class {
	#name : #MKRealogEmployee,
	#superclass : #MKRealogIDType,
	#category : #'MicroKanren-Realog'
}

{ #category : #'as yet unclassified' }
MKRealogEmployee >> reifyUsingReifier: aReifier [
	^ aReifier forRealogEmployee: self
]

{ #category : #dispatching }
MKRealogEmployee >> unifyWith: another usingUnifier: anUnifier [
	^ another unifyWithRealogEmployee: self usingUnifier: anUnifier
]

{ #category : #'as yet unclassified' }
MKRealogEmployee >> unifyWithRealogEmployee: anEmployee usingUnifier: anUnifier [
	^ anUnifier forRealogEmployee: self forRealogEmployee: anEmployee
]

{ #category : #'as yet unclassified' }
MKRealogEmployee >> walkStarUsingWalker: aWalker [
	^ aWalker forRealogEmployee: self
]
