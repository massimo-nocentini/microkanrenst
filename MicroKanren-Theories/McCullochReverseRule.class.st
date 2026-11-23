"
I relate the list `4 β` to the reverse of `γ` whenever my machine relates `β` to `γ`. I need `reverseo` of `SexpTheory`, which sends `!!` to a predicate class, which does not understand it.
"
Class {
	#name : #McCullochReverseRule,
	#superclass : #InductionRule,
	#category : #'MicroKanren-Theories-McCulloch machine\'s rules'
}

{ #category : #computing }
McCullochReverseRule >> relateo [
	| µ |
	µ := Theory sexp.
	^ [:alpha :alpha_reversed |
		[:beta :gamma |
			(alpha	unifyo value: (4 cons: beta)), 
			(µ reverseo value: gamma value: alpha_reversed), 
			(machine relateo value: beta value: gamma)] asGoal
		]
]
