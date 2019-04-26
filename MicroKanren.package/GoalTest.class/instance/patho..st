tests
patho: edgeo
	| patho |

	patho := nil.
	patho := [:x :y | 
				 (edgeo value: x value: y) | 
				  [:z | (edgeo value: x value: z)
					, (patho value: z value: y)] fresh
				] tabled.
	^ patho