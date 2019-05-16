dispatched
bind: aBlockClosure sequential: aSequential 
	| alpha beta |
	alpha := aBlockClosure value: item.
	beta := [rest bind: aBlockClosure sequential: aSequential].
	^ alpha mplus: beta sequential: aSequential