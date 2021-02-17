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
	  (MKPredicateBinaryAncestoro value: a value: b)
		  parentº: self parentº;
		  unifyº: self unifyº;
		  yourself ]
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

	^ [ :a :c :b | 
	  [ :d :e | 
	  | ancestor dRB |
	  dRB := d asRBNode.

	  ancestor := RBMessageNode
		              receiver:
		              (RBMessageNode
			               receiver: a
			               selector: #=
			               arguments: { b })
		              selector: #ifTrue:ifFalse:
		              arguments: { 
				              (RBBlockNode body:
					               (RBSequenceNode statements: { dRB })).
				              (RBBlockNode body:
					               (RBSequenceNode statements: { e asRBNode })) }.

	  " ancestor := [ 
	              a = b
		              ifTrue: [ d ]
		              ifFalse: [ e ] ] unaryRBNode 
		              substituteVariablesUsingDictionary: (Dictionary new
				               at: #a put: a;
				               at: #b put: b;
				               at: #d put: dRB;
				               at: #e put: e asRBNode;
				               yourself)."
	  (self unifyº value: ancestor value: c)
	  , ((self unifyº value: a value: dRB)
		   | (self ancestorº value: a value: dRB)) ] asGoal ]
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
TheLittleProver >> parentº [

	^ MKPredicateBinaryParento
]

{ #category : #predicates }
TheLittleProver >> unifyº [

	^ [ :a :b | a unifyo value: b ]
]
