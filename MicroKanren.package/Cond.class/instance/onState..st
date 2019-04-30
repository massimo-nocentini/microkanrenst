running
onState: aState 
	| g |
	g := clauses foldr: if init: false asGoal.
	^ g onState: aState