dispatched
bind: aGoal sequential: aSequential
	| alpha beta |
	alpha := aGoal onState: item.
	beta := [ self next bind: aGoal sequential: aSequential ].
	^ alpha mplus: beta sequential: aSequential