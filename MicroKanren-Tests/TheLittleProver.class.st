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
	  [ :x :y :astA | 
	  | g1 g2 |
	  g1 := astA statements first unifyo value: a.
	  g2 := [ :astB | astB statements first unifyo value: b ] 
		        asGoalWithASTof: [ false ].
	  g1 , g2 ] asGoalWithASTof: [ :x :y | (x cons: y) isAtom ] ]
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
	  [ :x :y :ast | 
	  (ast statements first unifyo value: a)
	  , (x asRBNode unifyo value: b) ] asGoalWithASTof: [ :x :y | 
		  (x cons: y) car ] ]
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

	^ [ :a :b | 
	  [ :x :ast | 
	  | g1 g2 |
	  g1 := ast statements first unifyo value: a.
	  g2 := [ :ast2 | ast2 statements first unifyo value: b ] 
		        asGoalWithASTof: [ true ].
	  g1 , { x } projectº , g2 ] asGoalWithASTof: [ :x | x = x ] ]
]

{ #category : #predicates }
TheLittleProver >> equalSwapº [

	^ [ :a :b | 
	  [ :x :y :ast | 
	  | g1 g2 |
	  g1 := ast statements first unifyo value: a.
	  g2 := [ :ast2 | ast2 statements first unifyo value: b ] 
		        asGoalWithASTof: [ y = x ].
	  g1 , g2 ] asGoalWithASTof: [ :x :y | x = y ] ]
]
