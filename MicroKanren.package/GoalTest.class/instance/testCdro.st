tests
testCdro
	| g |
	g := [ :r | [ :d | (sexpTheory let: d cdr: 'acorn') , (sexpTheory let: r car: d) ] fresh ]
		fresh.
	self assert: g solutions all equals: {$c}.
	g := [ :r | 
	[ :x :y | 
	| l m vl |
	l := LinkedList new
		add: #grape;
		add: #raisin;
		add: #pear;
		yourself.
	m := LinkedList new
		add: (#a cons: nil);
		add: (#b cons: nil);
		add: (#c cons: nil);
		yourself.
	vl := x cons: y.
	(sexpTheory let: x cdr: l) , (sexpTheory let: y car: m) , (vl unifyWith: r)
		, (r unifyWith: vl) ] fresh ] fresh.
	self
		assert: g solutions all
		equals:
			{{{#raisin . #pear}.
			#a} asCons}.
	g := [ :r | sexpTheory let: 'corn' cdr: 'acorn' ] fresh.
	self assert: g solutions all equals: {0 asReifiedVar}.
	g := [ :r | sexpTheory let: 'acorn' cdr: 'acorn' ] fresh.
	self assert: g solutions all equals: {}.
	g := [ :r | 
	sexpTheory
		let:
			{r.
			$r.
			$n}
		cdr: 'corn' ] fresh.
	self assert: g solutions all equals: {$o}.
	g := [ :l | [ :x | (sexpTheory let: $a car: l) , (sexpTheory let: 'corn' cdr: l) ] fresh ]
		fresh.
	self assert: g solutions all equals: {'acorn' asCons}