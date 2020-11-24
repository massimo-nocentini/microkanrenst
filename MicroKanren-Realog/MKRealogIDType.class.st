Class {
	#name : #MKRealogIDType,
	#superclass : #Object,
	#instVars : [
		'id'
	],
	#category : #'MicroKanren-Realog'
}

{ #category : #'as yet unclassified' }
MKRealogIDType class >> company: id [
	^ MKRealogCompany new
		  id: id;
		  yourself
]

{ #category : #'as yet unclassified' }
MKRealogIDType class >> contract: id [
	^ MKRealogContract new
		  id: id;
		  yourself
]

{ #category : #'as yet unclassified' }
MKRealogIDType class >> employee: id [
	^ MKRealogEmployee new
		  id: id;
		  yourself
]

{ #category : #printing }
MKRealogIDType >> betweenParenthesisPrintOn: aStream [
	id printOn: aStream
]

{ #category : #accessing }
MKRealogIDType >> id [
	^ id
]

{ #category : #accessing }
MKRealogIDType >> id: anObject [
	id := anObject
]

{ #category : #printing }
MKRealogIDType >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	self betweenParenthesisPrintOn: aStream.
	aStream nextPut: $)
]

{ #category : #dispatching }
MKRealogIDType >> unifyWith: another usingUnifier: anUnifier [
	self subclassResponsibility
]
