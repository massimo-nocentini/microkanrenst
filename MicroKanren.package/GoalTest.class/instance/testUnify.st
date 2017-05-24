as yet unclassified
testUnify
	| g |
	g := 3 unifyWith: 3.
	self assert: g solutions all equals: {Var tautology}.
	g := 4 unifyWith: 3.
	self assert: g solutions all equals: {}.

	"symmetry"
	g := [ :q | 4 unifyWith: q ] fresh.
	self assert: g solutions all equals: {4}.
	g := [ :q | q unifyWith: 4 ] fresh.
	self assert: g solutions all equals: {4}.

	"reification"
	g := [ :q | true asGoal ] fresh.
	self assert: g solutions all equals: {#_0}.
	g := [ :r | 
	[ :x :y | 
	r
		unifyWith:
			{x.
			y} ] fresh ] fresh.
	self assert: g solutions all equals: (Array with: {#_0 . #_1}).
	g := [ :r | [ :x :y | r unifyWith: (LinkedList with: x with: y) ] fresh ] fresh.
	self assert: g solutions all equals: (Array with: {#_0 . #_1})