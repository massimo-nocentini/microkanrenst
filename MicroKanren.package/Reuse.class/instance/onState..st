accessing
onState: aState 
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
						ifFalse: [| g reifiedAnswer combinator |
							reifiedAnswer := (aState trasparentReifier reifyVars: {answers first}) first.
							g := args unifyWith: reifiedAnswer.
							"Just use standard unification for now,
							`subunify` will follow."
							combinator := (g onState: aState)
										mplus: [loop value: answers allButFirst].
							Sequential new of: combinator]].
			loop value: start].
	^ fix value: cache value: LinkedList new