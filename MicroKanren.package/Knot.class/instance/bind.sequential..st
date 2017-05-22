dispatched
bind: aGoal sequential: aSequential
	| chain |
	chain := aGoal onState: item.
	^ chain mplus: self next sequential: aSequential