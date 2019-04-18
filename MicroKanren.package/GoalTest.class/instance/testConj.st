tests
testConj
	| g |
	g := [:q | false asGoal , (true =° q)] fresh.
	self assert: g solutions contents equals: {}.
	g := [:q | true asGoal , (false =° q)] fresh.
	self assert: g solutions contents equals: {false}.
	g := [:a | 3 =° a , (4 =° a)] fresh.
	self assert: g solutions contents equals: {}.
	g := [:a | a =° 4 , (4 =° a)] fresh.
	self assert: g solutions contents equals: {4}.
	g := [:a | 3 =° a , [:b | 4 =° b] fresh] fresh.
	self assert: g solutions contents equals: {3}.
	g := [:a :b | 3 =° a , (4 =° b)] fresh.
	self
		assert: g solutions contents
		equals: (LinkedList with: {3. 4}).
		
	"interleaved conj"
	g := [:x :y | (x =° 5)
				& (y =° 6)] fresh.
	self assert: g solutions contents equals: {#(5 6)}