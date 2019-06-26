tests
testConj
	| g |
	g := [:q | false asGoal , (true unifyo value: q)] fresh.
	self assert: g solutions contents equals: {}.
	g := [:q | true asGoal , (false unifyo value: q)] fresh.
	self assert: g solutions contents equals: {false}.
	g := [:a | (3 unifyo value: a) , (4 unifyo value: a)] fresh.
	self assert: g solutions contents equals: {}.
	g := [:a | (a unifyo value: 4) , (4 unifyo value: a)] fresh.
	self assert: g solutions contents equals: {4}.
	g := [:a | (3 unifyo value: a) , [:b | 4 unifyo value: b] fresh] fresh.
	self assert: g solutions contents equals: {3}.
	g := [:a :b |( 3 unifyo value: a) , (4 unifyo value: b)] fresh.
	self
		assert: g solutions contents
		equals: (LinkedList with: {3. 4}).
		
	"interleaved conj"
	g := [:x :y | (x unifyo value: 5)
				, (y unifyo value: 6)] fresh.
	self assert: g solutions contents equals: {#(5 6)}