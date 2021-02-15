"
I contains theorems described in ""The Littler Prover"".
"
Class {
	#name : #TheLittleProver,
	#superclass : #Object,
	#category : #'MicroKanren-ACL'
}

{ #category : #predicates }
TheLittleProver >> ancestorº [

	^ [ :a :b | 
	  [ :p | 
	  | pRB |
	  pRB := p asRBNode.
	  (self parentº value: a value: pRB)
	  , ((self unifyº value: pRB value: b)
		   | [ self ancestorº value: pRB value: b ] asGoal) ] asGoal ]
]

{ #category : #predicates }
TheLittleProver >> carConsº [

	"(dethm car/cons (x y)
		(equal (car (cons x y)) x))"

	^ [ :x :y | (x cons: y) car ] <~~> [ :a :b | a ]
]

{ #category : #predicates }
TheLittleProver >> cdrConsº [

	"(dethm cdr/cons (x y)
		(equal (cdr (cons x y)) y))"

	^ [ :x :y | (x cons: y) cdr ] <~~> [ :x :y | y ]
]

{ #category : #predicates }
TheLittleProver >> cdrOfConsº [

	^ [ :c :d | 
	  [ :a | 
	  c unifyo value:
		  (RBMessageNode
			   receiver: a asRBNode
			   selector: #cons:
			   arguments: { d }) ] asGoal ]
]

{ #category : #predicates }
TheLittleProver >> consº [

	^ [ :a :d :c | self unifyº value: (a cons: d) value: c ]
]

{ #category : #predicates }
TheLittleProver >> equalIfº [

	^ [ :a :b | 
	  [ :c :d :e | 
	  | ancestor |
	  ancestor := [ 
	              a = c
		              ifTrue: [ d ]
		              ifFalse: [ e ] ] unaryRBNode 
		              substituteVariablesUsingDictionary: (Dictionary new
				               at: #a put: a;
				               at: #c put: c asRBNode;
				               at: #d put: d asRBNode;
				               at: #e put: e asRBNode;
				               yourself).

	  (self ancestorº value: a value: ancestor)
	  ", (self unifyº value: 3 asLiteralRBNode value: d asRBNode)
	  ", (self unifyº value: c asRBNode value: b)
	  ", ((self unifyº value: a value: d asRBNode)
		   | (self ancestorº value: a value: d asRBNode))
	  " ]
		  asGoal ]
]

{ #category : #predicates }
TheLittleProver >> equalSameº [

	"(dethm equal-same (x)
		(equal (equal x x) 't))"

	^ [ :x | x = x ] <~> [ :x | true ]
]

{ #category : #predicates }
TheLittleProver >> equalSwapº [

	"(dethm equal-swap (x y)
		(equal (equal x y) (equal y x)))"

	^ [ :x :y | x = y ] <~~> [ :x :y | y = x ]
]

{ #category : #predicates }
TheLittleProver >> ifFalseº [

	"(dethm cdr/cons (x y)
		(equal (cdr (cons x y)) y))"

	^ [ :x :y | 
	  false
		  ifTrue: [ x ]
		  ifFalse: [ y ] ] <~~> [ :x :y | y ]
]

{ #category : #predicates }
TheLittleProver >> ifSameº [

	"(dethm cdr/cons (x y)
		(equal (cdr (cons x y)) y))"

	^ [ :x :y | 
	  x
		  ifTrue: [ y ]
		  ifFalse: [ y ] ] <~~> [ :x :y | y ]
]

{ #category : #predicates }
TheLittleProver >> ifTrueº [

	"(dethm cdr/cons (x y)
		(equal (cdr (cons x y)) y))"

	^ [ :x :y | 
	  true
		  ifTrue: [ x ]
		  ifFalse: [ y ] ] <~~> [ :x :y | x ]
]

{ #category : #predicates }
TheLittleProver >> isAtomConsº [

	"(dethm atom/cons (x y)
	  (equal (atom (cons x y)) 'nil))"

	^ [ :x :y | (x cons: y) isAtom ] <~~> [ :x :y | false ]
]

{ #category : #predicates }
TheLittleProver >> isAtomNilº [

	"
	(dethm atom/nil (x y)
	  (equal (atom 'nil) 't))"

	^ [ :_ | nil isAtom ] <~> [ :_ | true ]
]

{ #category : #predicates }
TheLittleProver >> memberº [

	^ [ :aCons :anObject | 
	  [ :a :d | 
	  (self consº value: a asRBNode value: d value: aCons)
	  , ((self unifyº value: a asRBNode value: anObject)
		   | [ self memberº value: d value: anObject ] asGoal) ] asGoal ]
]

{ #category : #predicates }
TheLittleProver >> parentº [

	^ [ :a :b | 
	  | sequenceGoal blockGoal messageNode |
	  sequenceGoal := self unifyº
		                  value: b
		                  value: (RBSequenceNode statements: { a }).

	  messageNode := [ :c | 
	                 | equal1 equal2 equal cRB if |
	                 cRB := c asRBNode.
	                 equal1 := self unifyº
		                           value: b
		                           value:
			                           ([ :q :w | q = w ] 
				                            substituteVariablesUsingSequenceableCollection:
				                            (Array with: a with: cRB)).
	                 equal2 := self unifyº
		                           value: b
		                           value:
			                           ([ :q :w | w = q ] 
				                            substituteVariablesUsingSequenceableCollection:
				                            (Array with: a with: cRB)).
	                 equal := equal1 | equal2.

	                 if := [ :r | 
	                       | rRB if1 if2 if3 |
	                       rRB := r asRBNode.
	                       if1 := self unifyº
		                              value: b
		                              value: ([ :q :w :e | 
			                               q
				                               ifTrue: [ w ]
				                               ifFalse: [ e ] ] 
				                               substituteVariablesUsingSequenceableCollection:
				                               (Array with: a with: cRB with: rRB)).
	                       if2 := self unifyº
		                              value: b
		                              value: ([ :q :w :e | 
			                               w
				                               ifTrue: [ q ]
				                               ifFalse: [ e ] ] 
				                               substituteVariablesUsingSequenceableCollection:
				                               (Array with: a with: cRB with: rRB)).
	                       if3 := self unifyº
		                              value: b
		                              value: ([ :q :w :e | 
			                               w
				                               ifTrue: [ e ]
				                               ifFalse: [ q ] ] 
				                               substituteVariablesUsingSequenceableCollection:
				                               (Array with: a with: cRB with: rRB)).

	                       if1 | if2 | if3 ] asGoal.

	                 equal | if ] asGoal.

	  blockGoal := self unifyº
		               value: b
		               value:
		               (RBBlockNode body: (RBSequenceNode statements: { a })).

	  sequenceGoal | messageNode | blockGoal ]
]

{ #category : #predicates }
TheLittleProver >> unifyº [

	^ [ :a :b | a unifyo value: b ]
]
