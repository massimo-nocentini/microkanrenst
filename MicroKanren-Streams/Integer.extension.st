Extension { #name : #Integer }

{ #category : #'*MicroKanren-Streams' }
Integer >> nextFromLink: aLink [

	^ aLink nextInteger: self
]
