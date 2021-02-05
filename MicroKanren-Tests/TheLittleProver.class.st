Class {
	#name : #TheLittleProver,
	#superclass : #Object,
	#category : #'MicroKanren-Tests'
}

{ #category : #predicates }
TheLittleProver >> carConsº [

	"(dethm car/cons (x y)
		(equal (car (cons x y)) x))"

	^ [ :x :y | (x cons: y) car ] ··> [ :x :y | x ]
]

{ #category : #predicates }
TheLittleProver >> cdrConsº [

	"(dethm cdr/cons (x y)
		(equal (cdr (cons x y)) y))"

	^ [ :x :y | (x cons: y) cdr ] ··> [ :x :y | y ]
]

{ #category : #'as yet unclassified' }
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
TheLittleProver >> equalSameº [

	"(dethm equal-same (x)
		(equal (equal x x) 't))"

	^ [ :x | x = x ] ·> [ :x | true asLiteralRBNode ]
]

{ #category : #predicates }
TheLittleProver >> equalSwapº [

	"(dethm equal-swap (x y)
		(equal (equal x y) (equal y x)))"

	^ [ :x :y | x = y ]
	  ··> [ :x :y | 
	  RBMessageNode receiver: y selector: #= arguments: { x } ]
]

{ #category : #predicates }
TheLittleProver >> isAtomConsº [

	"(dethm atom/cons (x y)
	  (equal (atom (cons x y)) 'nil))"

	^ [ :x :y | (x cons: y) isAtom ]
	  ··> [ :x :y | false asLiteralRBNode ]
]

{ #category : #predicates }
TheLittleProver >> isAtomNilº [

	"
	(dethm atom/nil (x y)
	  (equal (atom 'nil) 't))"

	^ [ :_ | nil isAtom ] ·> [ :_ | true asLiteralRBNode ]
]

{ #category : #'as yet unclassified' }
TheLittleProver >> unifyº [

	^ [ :a :b | a unifyo value: b ]
]
