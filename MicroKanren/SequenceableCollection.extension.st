Extension { #name : #SequenceableCollection }

{ #category : #'*MicroKanren-core' }
SequenceableCollection >> cond [
 |g|
	g := Goal cond.
	self do: [:each | g if: each key then: each value].
	^ g
	
]
