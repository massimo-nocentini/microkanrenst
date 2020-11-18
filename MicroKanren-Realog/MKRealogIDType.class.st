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

{ #category : #accessing }
MKRealogIDType >> id [
	^ id
]

{ #category : #accessing }
MKRealogIDType >> id: anObject [
	id := anObject
]

{ #category : #dispatching }
MKRealogIDType >> unifyWith: another usingUnifier: anUnifier [
	self subclassResponsibility
]
