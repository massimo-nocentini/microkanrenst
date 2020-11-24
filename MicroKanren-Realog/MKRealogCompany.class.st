Class {
	#name : #MKRealogCompany,
	#superclass : #MKRealogIDType,
	#category : #'MicroKanren-Realog'
}

{ #category : #dispatching }
MKRealogCompany >> reifyUsingReifier: aReifier [
	^ aReifier forRealogCompany: self
]

{ #category : #dispatching }
MKRealogCompany >> unifyWith: another usingUnifier: anUnifier [
	^ another unifyWithRealogCompany: self usingUnifier: anUnifier
]

{ #category : #'as yet unclassified' }
MKRealogCompany >> unifyWithRealogCompany: aCompany usingUnifier: anUnifier [
	^ anUnifier forRealogCompany: self forRealogCompany: aCompany
]

{ #category : #'as yet unclassified' }
MKRealogCompany >> walkStarUsingWalker: aWalker [
	^ aWalker forRealogCompany: self
]
