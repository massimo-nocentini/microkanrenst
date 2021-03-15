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

	^ MKPredicateBinaryAncestoro
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
TheLittleProver >> consCarCdrº [

	^ [ :a :c :b | 
	  [ :d :e :x :y :z | 
	  | ancestor cons |
	  ancestor := [ 
	              x isAtom
		              ifTrue: [ d ]
		              ifFalse: [ e ] ] unaryRBNode 
		              substituteVariablesUsingDictionary: (Dictionary new
				               at: #x put: x asRBNode;
				               at: #d put: d asRBNode;
				               at: #e put: e asRBNode;
				               yourself).

	  cons := [ x car cons: x cdr ] unaryRBNode 
		          substituteVariablesUsingDictionary: (Dictionary new
				           at: #x put: x asRBNode;
				           at: #y put: y asRBNode;
				           at: #z put: z asRBNode;
				           yourself).

	  (self unifyº value: a value: cons)
	  , (self unifyº value: b value: x asRBNode)
	  , (self unifyº value: ancestor value: c)
	  , ((self unifyº value: x asRBNode value: e asRBNode)
		   | (self ancestorº value: x asRBNode value: e asRBNode)) ] asGoal ]
]

{ #category : #predicates }
TheLittleProver >> consº [

	^ [ :a :d :c | self unifyº value: (a cons: d) value: c ]
]

{ #category : #predicates }
TheLittleProver >> disuniteº [

	^ [ :a :b | a disuniteo value: b ]
]

{ #category : #predicates }
TheLittleProver >> equalIf0º [

	^ [ :a :c :b | 
	  [ :d :e | 
	  | ancestor dRB |
	  dRB := d asRBNode.

	  ancestor := [ 
	              a = b
		              ifTrue: [ d ]
		              ifFalse: [ e ] ] unaryRBNode 
		              substituteVariablesUsingDictionary: (Dictionary new
				               at: #a put: a;
				               at: #b put: b;
				               at: #d put: dRB;
				               at: #e put: e asRBNode;
				               yourself).

	  (self unifyº value: ancestor value: c)
	  , (self unifyº value: a value: dRB) ] asGoal ]
]

{ #category : #predicates }
TheLittleProver >> equalIfº [

	^ [ :a :c :b | 
	  [ :d :e | 
	  | ancestor dRB |
	  dRB := d asRBNode.

	  ancestor := [ 
	              a = b
		              ifTrue: [ d ]
		              ifFalse: [ e ] ] unaryRBNode 
		              substituteVariablesUsingDictionary: (Dictionary new
				               at: #a put: a;
				               at: #b put: b;
				               at: #d put: dRB;
				               at: #e put: e asRBNode;
				               yourself).

	  (self unifyº value: ancestor value: c)
	  , ((self ancestorº value: a value: dRB)
		   | (self unifyº value: a value: dRB)) ] asGoal ]
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
TheLittleProver >> ifNestedOtherwiseº [

	^ [ :a :c :b | 
	  [ :d :e :x :y :z | 
	  | ancestor if |
	  ancestor := [ 
	              x
		              ifTrue: [ d ]
		              ifFalse: [ e ] ] unaryRBNode 
		              substituteVariablesUsingDictionary: (Dictionary new
				               at: #x put: x asRBNode;
				               at: #d put: d asRBNode;
				               at: #e put: e asRBNode;
				               yourself).

	  if := [ 
	        x
		        ifTrue: [ y ]
		        ifFalse: [ z ] ] unaryRBNode 
		        substituteVariablesUsingDictionary: (Dictionary new
				         at: #x put: x asRBNode;
				         at: #y put: y asRBNode;
				         at: #z put: z asRBNode;
				         yourself).

	  (self unifyº value: a value: if)
	  , (self unifyº value: b value: z asRBNode)
	  , (self unifyº value: ancestor value: c)
	  , (self ancestorº value: if value: e asRBNode) ] asGoal ]
]

{ #category : #predicates }
TheLittleProver >> ifNestedThenº [

	^ [ :a :c :b | 
	  [ :d :e :x :y :z | 
	  | ancestor if |
	  ancestor := [ 
	              x
		              ifTrue: [ d ]
		              ifFalse: [ e ] ] unaryRBNode 
		              substituteVariablesUsingDictionary: (Dictionary new
				               at: #x put: x asRBNode;
				               at: #d put: d asRBNode;
				               at: #e put: e asRBNode;
				               yourself).

	  if := [ 
	        x
		        ifTrue: [ y ]
		        ifFalse: [ z ] ] unaryRBNode 
		        substituteVariablesUsingDictionary: (Dictionary new
				         at: #x put: x asRBNode;
				         at: #y put: y asRBNode;
				         at: #z put: z asRBNode;
				         yourself).

	  (self unifyº value: a value: if)
	  , (self unifyº value: b value: y asRBNode)
	  , (self unifyº value: ancestor value: c)
	  , (self ancestorº value: if value: d asRBNode) ] asGoal ]
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
TheLittleProver >> jabberwockyº [

	^ MKPredicateUnaryJabberwockyo
]

{ #category : #predicates }
TheLittleProver >> parentº [

	^ MKPredicateBinaryParento
]

{ #category : #predicates }
TheLittleProver >> unifyº [

	^ [ :a :b | a unifyo value: b ]
]
