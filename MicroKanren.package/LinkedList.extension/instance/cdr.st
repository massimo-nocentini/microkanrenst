*MicroKanren-core
cdr
	"Returns the tail of this list"

	^ self
		ifNotEmpty: [ firstLink nextLink ifNil: [ self class new ] ifNotNilDo: [ :nl | self class with: nl ] ]