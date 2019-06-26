Class {
	#name : #Bottom,
	#superclass : #Chain,
	#category : 'MicroKanren-chains'
}

{ #category : #dispatched }
Bottom >> bind: aGoal interleaved: anInterleaved [
	^ self
]

{ #category : #dispatched }
Bottom >> bind: aGoal sequential: aSequential [
	^ self
]

{ #category : #listing }
Bottom >> collect: aBlockClosure [ 
	^ self
]

{ #category : #listing }
Bottom >> contents [
	^ LinkedList new
]

{ #category : #dispatched }
Bottom >> mplus: anotherChain interleaved: anInterleaved [
	^ anotherChain value
]

{ #category : #dispatched }
Bottom >> mplus: anotherChain sequential: aSequential [
	^ anotherChain value
]

{ #category : #tabling }
Bottom >> mplusWithWaitedStreams: anArray sequential: aSequential [ 
	^ self
]

{ #category : #dispatched }
Bottom >> next: anInteger [
]
