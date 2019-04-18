as yet unclassified
bind: aGoal interleaved: anInterleaved 
	| alpha beta |
	alpha := aGoal onState: item.
	beta := [rest bind: aGoal interleaved: anInterleaved].
	^ alpha mplus: beta interleaved: anInterleaved