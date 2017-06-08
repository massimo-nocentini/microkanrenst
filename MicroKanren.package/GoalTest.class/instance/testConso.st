tests
testConso
	| g |
	g := [ :l | sexpTheory let: l be: #(a b c) cons: #(d e) ] fresh.
	self assert: g solutions all equals: {#(#(a b c) d e) asCons}.
	g := [ :l | sexpTheory let: l be: #(a b c) cons: #(#(d e)) ] fresh.
	self assert: g solutions all equals: {#(#(a b c) #(d e)) asCons}.
	g := [ :l | sexpTheory let: #(a b c d) be: l cons: #(b c d) ] fresh.
	self assert: g solutions all equals: {#a}.
	g := [ :l | 
	[ :x :y :z | 
	(l
		unifyWith:
			(LinkedList new
				add: #e;
				add: #a;
				add: #d;
				add: x;
				asCons)) , (sexpTheory let: l be: y cons: (LinkedList with: #a with: z with: #c)) ]
		fresh ] fresh.
	self assert: g solutions all equals: {#(e a d c) asCons}