"
I add the answer of a tabled goal to its `cache`: if no answer in there is equivalent to `args` in the given state (`isAlphaEquivalentTo:inState:`), I put `args`, reified, at the front of the cache and succeed; otherwise I fail. `Tabled` runs me after the goal of its block.
"
Class {
	#name : #Master,
	#superclass : #TablingCall,
	#category : #'MicroKanren-Goals'
}

{ #category : #'as yet unclassified' }
Master >> onState: aState [ 
	| allSatisfied |
	allSatisfied := cache
				allSatisfy: [:answers | (args isAlphaEquivalentTo: answers inState: aState) not].
	"possibly change to `any`"
	allSatisfied
		ifTrue: [cache
				addFirst: (aState trasparentReifier reifyVars: args)]. "`#addFirst` is the counter part of `cons`."
	^ allSatisfied asGoal onState: aState
]
