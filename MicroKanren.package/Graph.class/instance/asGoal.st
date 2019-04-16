converting
asGoal
	^ [:x :y | 
	| g |

	g := Goal cond e.
	edges
		do: [:each | g
				if: (x unifyWith: each key)
				then: (y unifyWith: each value)].
	g]