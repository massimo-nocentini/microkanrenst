Extension { #name : #Context }

{ #category : #'*MicroKanren-Extensions' }
Context >> tempByValueDict [

	| dict |
	dict := IdentityDictionary new.
	self tempNames do: [ :name | 
		dict at: (self tempNamed: name) put: name ].
	^ dict
]
