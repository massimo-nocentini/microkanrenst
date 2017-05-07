*MicroKanren-core
cdr
	"Returns the tail of this list"

	^ self ifNotEmpty: [ self firstLink asLinkedList ]