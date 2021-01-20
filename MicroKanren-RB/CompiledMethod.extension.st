Extension { #name : #CompiledMethod }

{ #category : #'*MicroKanren-RB' }
CompiledMethod >> sendso [

	^ self sourceNode body sendso
]
