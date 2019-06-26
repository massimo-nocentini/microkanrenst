converting
asGoal
	^ [:x :y | 
	| g |
	g := Goal cond e.
	edges
		do: [:each | g
				if: (x unifyo value: (each key))
				then: (y unifyo value: (each value))].
	g]