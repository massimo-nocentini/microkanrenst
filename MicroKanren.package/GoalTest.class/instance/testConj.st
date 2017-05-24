as yet unclassified
testConj
	| g |
	g := [ :q | false asGoal , (true unifyWith: q) ] fresh.
	self assert: g solutions all equals: {}.
	g := [ :q | true asGoal , (false unifyWith: q) ] fresh.
	self assert: g solutions all equals: {false}.
	g := [ :a | (3 unifyWith: a) , (4 unifyWith: a) ] fresh.
	self assert: g solutions all equals: {}.
	g := [ :a | (a unifyWith: 4) , (4 unifyWith: a) ] fresh.
	self assert: g solutions all equals: {4}.
	g := [ :a | (3 unifyWith: a) , [ :b | 4 unifyWith: b ] fresh ] fresh.
	self assert: g solutions all equals: {3}.
	g := [ :a :b | (3 unifyWith: a) , (4 unifyWith: b) ] fresh.
	self assert: g solutions all equals: (LinkedList with: {3 . 4})