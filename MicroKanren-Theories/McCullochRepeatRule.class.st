Class {
	#name : #McCullochRepeatRule,
	#superclass : #InductionRule,
	#category : #'MicroKanren-Theories-McCulloch machine\'s rules'
}

{ #category : #computing }
McCullochRepeatRule >> relateo [

	| µ |
	µ := Theory sexp.
	^ [ :alpha :gamma_gamma | 
	  [ :beta :gamma | 
	  (alpha unifyo value: (5 cons: beta))
	  , (µ appendo value: gamma value: gamma value: gamma_gamma)
	  , (machine relateo value: beta value: gamma) ] asGoal ]
]
