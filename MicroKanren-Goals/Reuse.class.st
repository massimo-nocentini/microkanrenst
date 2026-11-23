"
I answer a tabled call out of the `cache` of a former one: I unify `args` with the cached answers, one after the other. `Tabled` makes me when its arguments are already in the table.

I refer to the classes `Waiting` and `Sequential`, which are not in the packages of this project.
"
Class {
	#name : #Reuse,
	#superclass : #TablingCall,
	#category : #'MicroKanren-Goals'
}

{ #category : #accessing }
Reuse >> onState: aState [ 
	| fix |
	fix := nil.
	fix := [:start :end | 
			| loop |
			loop := nil.
			loop := [:answers | answers = end
						ifTrue: [| data alpha |
							data := cache cons: start.
							alpha := data
										cons: [fix value: cache value: start].
							Waiting new streams: {alpha};
								 yourself
							"one element list"]
						ifFalse: [| reifiedAnswer combinator |
							reifiedAnswer := (aState trasparentReifier reifyVars: {answers first}) first.
							
							"Just use standard unification for now,
							`subunify` will follow."
							combinator := [(args  unifyo value: reifiedAnswer) onState: aState] suspended
										mplus: [loop value: answers allButFirst].
							Sequential new of: combinator]].
			loop value: start].
	^ fix value: cache value: LinkedList new
]
