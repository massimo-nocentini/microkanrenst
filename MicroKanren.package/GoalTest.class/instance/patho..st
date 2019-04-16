tests
patho: edgeo
	| patho |

	patho := nil.
	patho := [:x :y | Goal cond e
				if: (edgeo value: x value: y)
				then: true asGoal;
				 else: [:z | (edgeo value: x value: z)
					, (patho value: z value: y)] fresh;
				 yourself] tabled.
	^ patho