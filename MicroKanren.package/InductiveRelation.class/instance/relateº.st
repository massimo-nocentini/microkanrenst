computing
relateº
	^ [:anObj :anotherObj | 
	| g |
	g := Goal cond i.
	rules
		do: [:r | g
				if: (r relateº value: anObj value: anotherObj)
				then: true asGoal].
	 g]