tests
testCaro
	| g |
	g := [:r | sexpTheory let: r car: 'acorn'] fresh.
	self assert: g solutions all equals: {$a}.
	g := [:r | [:x :y | 
			| l m vl |
			l := LinkedList new add: #grape;
						 add: #raisin;
						 add: #pear;
						 yourself.
			m := {#a cons: nil. #b cons: nil. #c cons: nil}.
			vl := x cons: y.
			(sexpTheory let: x car: l)
				, (sexpTheory let: y car: m)
				, (vl unifyWith: r)
				, (r unifyWith: vl)] fresh] fresh.
	"(l caro: x) , (m caro: y) , (vl unifyWith: r) , (r unifyWith: vl) ] fresh ]
	fresh."
	self assert: g solutions all equals: {{#grape . #a} asCons}