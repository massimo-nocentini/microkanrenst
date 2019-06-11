computing
relateo
	^ [:anObj :anotherObj | 
	| g |
	g := Goal cond i.
	rules
		do: [:r | g
				if: (r relateo value: anObj value: anotherObj)
				then: true asGoal].
	g]