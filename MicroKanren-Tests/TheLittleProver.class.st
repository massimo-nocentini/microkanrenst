Class {
	#name : #TheLittleProver,
	#superclass : #Object,
	#category : #'MicroKanren-Tests'
}

{ #category : #predicates }
TheLittleProver >> atomConsº [

	"
	(dethm atom/cons (x y)
	  (equal (atom (cons x y)) 'nil))"

	^ [ :a :b | 
	  [ :astA | 
	  [ :x :y | 
	  | g1 g2 |
	  g1 := astA unifyo value: a.
	  g2 := [ :astB | [ astB unifyo value: b ] ] asGoalWithUnaryASTof: [ 
		        false ].
	  g1 , g2 ] ] asGoalWithUnaryASTof: [ :x :y | (x cons: y) isAtom ] ]
]

{ #category : #predicates }
TheLittleProver >> atomNilº [

	"
	(dethm atom/cons (x y)
	  (equal (atom (cons x y)) 'nil))"

	^ [ :a :b | 
	  [ :ast1 | 
	  | g1 g2 |
	  g1 := ast1 statements first unifyo value: a.
	  g2 := [ :ast2 | ast2 statements first unifyo value: b ] 
		        asGoalWithASTof: [ true ].
	  g1 , g2 ] asGoalWithASTof: [ nil isAtom ] ]
]

{ #category : #predicates }
TheLittleProver >> carConsº [

	"
	(dethm atom/cons (x y)
	  (equal (atom (cons x y)) 'nil))"

	^ [ :a :b | 
	  [ :ast | [ :x :y | (ast unifyo value: a) , (x unifyo value: b) ] ] 
		  asGoalWithUnaryASTof: [ :x :y | (x cons: y) car ] ]
]

{ #category : #predicates }
TheLittleProver >> cdrConsº [

	"
	(dethm atom/cons (x y)
	  (equal (atom (cons x y)) 'nil))"

	^ [ :a :b | 
	  [ :x :y :ast | 
	  (ast statements first unifyo value: a)
	  , (y asRBNode unifyo value: b) ] asGoalWithASTof: [ :x :y | 
		  (x cons: y) cdr ] ]
]

{ #category : #'as yet unclassified' }
TheLittleProver >> chapter_1_OldGamesNewRules_frame_21: a value: b [

	^ #flapjack = (a cons: b) isAtom
]

{ #category : #predicates }
TheLittleProver >> equalSameº [

	"(dethm equal-same (x)
		(equal (equal x x) 't))"

	^ [ :a :b | 
	  [ :ast | 
	  [ :x | 
	  | g1 g2 |
	  g1 := ast unifyo value: a.
	  g2 := [ :ast2 | [ ast2 unifyo value: b ] ] asGoalWithUnaryASTof: [ 
		        true ].
	  g1 , g2 ] ] asGoalWithUnaryASTof: [ :x | x = x ] ]
]

{ #category : #predicates }
TheLittleProver >> equalSwapº [

	"(dethm equal-swap (x y)
		(equal (equal x y) (equal y x)))"

	^ [ :a :b | 
	  [ :ast | 
	  [ :x :y | 
	  | g1 g2 |
	  g1 := ast unifyo value: a.
	  g2 := [ :ast2 | 
	        [ :x1 :y1 | 
	        (x1 unifyo value: x) , (y1 unifyo value: y) , { 
		        x.
		        y } projectº , (ast2 unifyo value: b) ] ] 
		        asGoalWithUnaryASTof: [ :x1 :y1 | y1 = x1 ].
	  g1 , g2 ] ] asGoalWithUnaryASTof: [ :x :y | x = y ] ]
]
