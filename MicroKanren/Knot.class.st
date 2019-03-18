Class {
	#name : #Knot,
	#superclass : #Chain,
	#instVars : [
		'item',
		'linker'
	],
	#category : 'MicroKanren-core'
}

{ #category : #'as yet unclassified' }
Knot >> bind: aGoal interleaved: anInterleaved [
	| alpha beta |
	alpha := aGoal onState: item.
	beta := [ self next bind: aGoal interleaved: anInterleaved ].
	^ alpha mplus: beta interleaved: anInterleaved
]

{ #category : #dispatched }
Knot >> bind: aGoal sequential: aSequential [
	| alpha beta |
	alpha := aGoal onState: item.
	beta := [ self next bind: aGoal sequential: aSequential ].
	^ alpha mplus: beta sequential: aSequential
]

{ #category : #listing }
Knot >> collect: aBlockClosure [ 
	| v |
	v := aBlockClosure value: item.
	^ v
		cons: [self next collect: aBlockClosure]
]

{ #category : #listing }
Knot >> contents [
	^ self next contents
		addFirst: item;
		yourself
]

{ #category : #initializing }
Knot >> item: anObj [
	item := anObj
]

{ #category : #initializing }
Knot >> linker: aBlockClosure [
	linker := aBlockClosure
]

{ #category : #dispatched }
Knot >> mplus: anotherChain interleaved: anInterleaved [ 
	^item cons: [anotherChain value
		mplus: [self next]
		interleaved: anInterleaved]
		
]

{ #category : #dispatched }
Knot >> mplus: anotherChain sequential: aSequential [ 
	^ item cons: [self next mplus: anotherChain sequential: aSequential]
		
]

{ #category : #listing }
Knot >> next [
	^ linker value
]

{ #category : #listing }
Knot >> next: n [ 
	^ n = 1
		ifTrue: [Chain with: item]
		ifFalse: [item
				cons: [self next next: n - 1]]
]
