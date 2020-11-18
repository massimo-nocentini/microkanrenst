Class {
	#name : #MKRealogContract,
	#superclass : #MKRealogIDType,
	#instVars : [
		'employee',
		'company',
		'type'
	],
	#category : #'MicroKanren-Realog'
}

{ #category : #accessing }
MKRealogContract >> company [
	^ company
]

{ #category : #accessing }
MKRealogContract >> company: anObject [
	company := anObject
]

{ #category : #accessing }
MKRealogContract >> employee [
	^ employee
]

{ #category : #accessing }
MKRealogContract >> employee: anObject [
	employee := anObject
]

{ #category : #dispatching }
MKRealogContract >> reifyUsingReifier: aReifier [
	^ aReifier forRealogContract: self
]

{ #category : #accessing }
MKRealogContract >> type [
	^ type
]

{ #category : #accessing }
MKRealogContract >> type: anObject [
	type := anObject
]

{ #category : #dispatching }
MKRealogContract >> unifyWith: another usingUnifier: anUnifier [
	^ another unifyWithRealogContract: self usingUnifier: anUnifier
]

{ #category : #'as yet unclassified' }
MKRealogContract >> unifyWithRealogContract: aContract usingUnifier: anUnifier [
	^ anUnifier forRealogContract: self forRealogContract: aContract
]

{ #category : #'as yet unclassified' }
MKRealogContract >> walkStarUsingWalker: aWalker [
	^ aWalker forRealogContract: self
]
