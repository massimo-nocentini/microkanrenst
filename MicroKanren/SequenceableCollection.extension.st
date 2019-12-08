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

{ #category : #'*MicroKanren-core' }
SequenceableCollection >> foldr1: aBlock [ 
	^ self allButLast foldr: aBlock init: self last
]

{ #category : #'*MicroKanren-core' }
SequenceableCollection >> foldr: aBlock init: init [
	| cell |
	cell := init.
	self reverseDo: [ :each | cell := aBlock value: each value: cell ].
	^ cell
]

{ #category : #'*MicroKanren-core' }
SequenceableCollection >> zip: aSequenceable [
	^ self zip: aSequenceable with: [ :s :o | s -> o ]
]

{ #category : #'*MicroKanren-core' }
SequenceableCollection >> zip: aSequenceable with: aBlock [
	| l |
	l := self class new.
	1 to: (self size min: aSequenceable size) do: [ :i | 
		| v |
		v := aBlock value: (self at: i) value: (aSequenceable at: i).
		l add: v ].
	^ l
]
