Extension { #name : #SequenceableCollection }

{ #category : #'*MicroKanren-core' }
SequenceableCollection >> asCons [
	^ Cons fromSequenceableCollection: self
]

{ #category : #'*MicroKanren-core' }
SequenceableCollection >> asConsWithCdr: aCdr [
	^ Cons fromSequenceableCollection: self lastCdr: aCdr
]

{ #category : #'*MicroKanren-core' }
SequenceableCollection >> cond [
 |g|
	g := Goal cond.
	self do: [:each | g if: each key then: each value].
	^ g
	
]
