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

{ #category : #accessing }
MKRealogContract >> type [
	^ type
]

{ #category : #accessing }
MKRealogContract >> type: anObject [
	type := anObject
]
