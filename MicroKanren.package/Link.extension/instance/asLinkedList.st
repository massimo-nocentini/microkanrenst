*MicroKanren-core
asLinkedList
	"comment stating purpose of message"

	^ nextLink ifNil: [ LinkedList new ] ifNotNil: [ LinkedList with: nextLink ]