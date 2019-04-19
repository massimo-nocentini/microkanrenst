running
onState: aState 
	| key |
	key := aState reifier reifyVars: args.
	^ table
		at: key
		ifPresent: [:cache | 
			| r |
			r := Reuse new args: args;
						 cache: cache;
						 yourself.
			r onState: aState]
		ifAbsent: [| cache g m |
			cache := LinkedList new.
			table at: key put: cache.
			g := block valueWithArguments: args.
			m := Master new args: args;
						 cache: cache;
						 yourself.
			g , m onState: aState]