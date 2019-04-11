running
onState: aState 
	| values |
	values := aState reifier reifyVars: {x . y}.
	^ (values first
		= values second) asGoal onState: aState