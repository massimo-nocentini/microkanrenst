Class {
	#name : #Disj,
	#superclass : #Goal,
	#instVars : [
		'either',
		'or',
		'interleaving'
	],
	#category : 'MicroKanren-core'
}

{ #category : #creating }
Disj class >> either: e or: o [
	^ self new
		either: e or: o;
		yourself
]

{ #category : #accessing }
Disj >> either: e or: o [
	either := e.
	or := o
]

{ #category : #'as yet unclassified' }
Disj >> initialize [
	super initialize.
	interleaving := Interleaved new
]

{ #category : #running }
Disj >> onState: aState [
	^ interleaving of: ((either onState: aState) mplus: [ or onState: aState ])
]
