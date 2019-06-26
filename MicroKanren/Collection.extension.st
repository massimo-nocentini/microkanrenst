Extension { #name : #Collection }

{ #category : #'*MicroKanren-core' }
Collection >> asGraph [
	|G|
	G := Graph new.
	self do: [:each | G at: each key put: each value].
	^G
]
