Class {
	#name : #Graph,
	#superclass : #Object,
	#instVars : [
		'vertices',
		'edges'
	],
	#category : 'MicroKanren-datastructures'
}

{ #category : #converting }
Graph >> asGoal [
	^ [:x :y | 
	| g |
	g := Goal cond e.
	edges
		do: [:each | g
				if: (x unifyo value: (each key))
				then: (y unifyo value: (each value))].
	g]
]

{ #category : #'as yet unclassified' }
Graph >> at: aKey put: aValue [ 
	self outgoingFrom: aKey to: aValue;
	incomingTo:aValue from:aKey.
	edges add: aKey -> aValue
]

{ #category : #'as yet unclassified' }
Graph >> incomingTo: aValue from: aKey [ 
	| neighborooh |
	neighborooh := vertices
				at: aValue
				ifAbsentPut: [Dictionary new].
	neighborooh
		at: #incomings
		ifPresent: [:parents | parents add: aKey]
		ifAbsentPut: [LinkedList with: aKey]
]

{ #category : #'as yet unclassified' }
Graph >> initialize [
	vertices := Dictionary new.
	edges := LinkedList new " we don't care about ordering, just the chronological one for insertion time"
]

{ #category : #'as yet unclassified' }
Graph >> outgoingFrom: aKey to: aValue [ 
	| neighborhood |
	neighborhood := vertices
				at: aKey
				ifAbsentPut: [Dictionary new].
	^ neighborhood
		at: #outgoings
		ifPresent: [:children | children add: aValue]
		ifAbsentPut: [LinkedList with: aValue]
]

{ #category : #accessing }
Graph >> vertices [
	^  vertices copy
]
