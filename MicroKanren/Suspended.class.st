Class {
	#name : #Suspended,
	#superclass : #Chain,
	#instVars : [
		'block'
	],
	#category : 'MicroKanren-chains'
}

{ #category : #'as yet unclassified' }
Suspended >> bind: aBlockClosure interleaved: anInterleaved [ 
	^ block value bind: aBlockClosure interleaved: anInterleaved
]

{ #category : #dispatched }
Suspended >> bind: aBlockClosure sequential: aSequential [ 
	^ block value bind: aBlockClosure sequential: aSequential
]

{ #category : #accessing }
Suspended >> block: aBlockClosure [ 
	block := aBlockClosure
]

{ #category : #listing }
Suspended >> collect: aBlockClosure [ 
	^ self class new block: [block value collect: aBlockClosure]; yourself
]

{ #category : #listing }
Suspended >> contents [
	^ block value contents
]

{ #category : #dispatched }
Suspended >> mplus: aBlockClosure interleaved: anInterleaved [ 
	^ [aBlockClosure value mplus: block interleaved: anInterleaved] suspended
]

{ #category : #dispatched }
Suspended >> mplus: aBlockClosure sequential: aSequential [ 
	^ block value mplus: aBlockClosure sequential: aSequential
]

{ #category : #listing }
Suspended >> next: anInteger [ 
	^ block value next: anInteger
]
