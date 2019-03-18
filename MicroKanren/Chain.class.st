Class {
	#name : #Chain,
	#superclass : #Object,
	#category : 'MicroKanren-core'
}

{ #category : #creating }
Chain class >> bottom [
	^ Bottom new
]

{ #category : #creating }
Chain class >> item: anObj linker: aBlockClosure [
	^ Knot new
		item: anObj;
		linker: aBlockClosure;
		yourself
]

{ #category : #creating }
Chain class >> repeat: anObj [ 
	^ anObj cons: [self repeat: anObj]
		
]

{ #category : #creating }
Chain class >> with: anObj [ 
	^ anObj cons: Chain bottom
		
]

{ #category : #dispatching }
Chain >> bind: aBinder [
	^ Bind combine: aBinder with: self
]

{ #category : #'as yet unclassified' }
Chain >> bind: aGoal interleaved: anInterleaved [
	self subclassResponsibility
]

{ #category : #dispatched }
Chain >> bind: aBinder sequential: aSequential [
	self subclassResponsibility
]

{ #category : #listing }
Chain >> collect: aBlockClosure [ 
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
Chain >> consedObject: car [ 
	^ car cons: [self]
]

{ #category : #listing }
Chain >> contents [
	self subclassResponsibility
]

{ #category : #dispatching }
Chain >> mplus: anotherChain [
	^ MPlus with: self with: anotherChain
]

{ #category : #dispatched }
Chain >> mplus: anotherChain interleaved: anInterleaved [
	self subclassResponsibility
]

{ #category : #dispatched }
Chain >> mplus: anotherChain sequential: aSequential [
	self subclassResponsibility
]

{ #category : #listing }
Chain >> next: anInteger [ 
	self subclassResponsibility
]
