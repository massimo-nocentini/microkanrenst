*MicroKanren-core
cdr
	"Returns the tail of this list"

	^ self
		ifNotEmpty: [ firstLink nextLink
				ifNil: [ self class new ]
				ifNotNil: [ :nl | self class with: nl ] ]