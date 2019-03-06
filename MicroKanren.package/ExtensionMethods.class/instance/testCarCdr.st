about linked lists
testCarCdr
	"Tests about extension methods on LinkedList objects"

	| ll |
	ll := LinkedList with: #a with: #b.
	self
		assert: ll car equals: #a;
		assert: ll cdr car equals: #b;
		assert: ll cdr equals: (LinkedList with: #b);
		assert: ll cdr cdr equals: LinkedList new;
		assert: ll cdr cdr cdr equals: LinkedList new;
		should: [ ll cdr cdr car ] raise: Error