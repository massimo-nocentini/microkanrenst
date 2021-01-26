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
	  ([ :x :y :ast | ast statements first unifyo value: a ] 
		   asGoalWithASTof: [ :x :y | (x cons: y) isAtom ])
	  ,
		  ([ :ast | ast statements first unifyo value: b ] asGoalWithASTof: [ 
			   false ]) ]
]

{ #category : #'as yet unclassified' }
TheLittleProver >> chapter_1_OldGamesNewRules_frame_21: a value: b [

	^ #flapjack = (a cons: b) isAtom
]
