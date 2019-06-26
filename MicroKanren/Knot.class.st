Class {
	#name : #Knot,
	#superclass : #Chain,
	#instVars : [
		'item',
		'rest'
	],
	#category : 'MicroKanren-chains'
}

{ #category : #'as yet unclassified' }
Knot >> bind: aBlockClosure interleaved: anInterleaved [ 
	| alpha beta |
	alpha := aBlockClosure value: item.
	beta := [rest bind: aBlockClosure interleaved: anInterleaved].
	^ alpha mplus: beta interleaved: anInterleaved
]

{ #category : #dispatched }
Knot >> bind: aBlockClosure sequential: aSequential [ 
	| alpha beta |
	alpha := aBlockClosure value: item.
	beta := [rest bind: aBlockClosure sequential: aSequential].
	^ alpha mplus: beta sequential: aSequential
]

{ #category : #listing }
Knot >> collect: aBlockClosure [ 
	| v |
	v := aBlockClosure value: item.
	^ v
		cons: [rest collect: aBlockClosure]
]

{ #category : #listing }
Knot >> contents [
	^ rest contents addFirst: item;
		 yourself
]

{ #category : #tabling }
Knot >> isReady [
	^ (item car = item cdr ) not
]

{ #category : #initializing }
Knot >> item: anObj [
	item := anObj
]

{ #category : #initializing }
Knot >> linker: aChain [ 
	rest := aChain
]

{ #category : #dispatched }
Knot >> mplus: aBlockClosure interleaved: anInterleaved [ 
	^ item
		cons: [aBlockClosure value mplus: [rest] interleaved: anInterleaved]
]

{ #category : #dispatched }
Knot >> mplus: anotherChain sequential: aSequential [ 
	^ item
		cons: [rest mplus: anotherChain sequential: aSequential]
]

{ #category : #listing }
Knot >> next: n [ 
	^ n = 1
		ifTrue: [Chain with: item]
		ifFalse: [item
				cons: [rest next: n - 1]]
]
