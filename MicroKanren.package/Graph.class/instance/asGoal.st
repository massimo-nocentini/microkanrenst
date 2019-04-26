converting
asGoal
	^ [:x :y | 
	| g |
	g := Goal cond e.
	edges
		do: [:each | g
				if: x =° (each key)
				then: y =° (each value)].
	g]