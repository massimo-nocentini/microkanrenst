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
