running
onState: aState
	| g |
	else ifNil: [ self else: false asGoal ].
	g := clauses
		add: else;
		reduceRight: if.
	^ g onState: aState