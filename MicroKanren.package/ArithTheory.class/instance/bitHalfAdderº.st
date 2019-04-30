as yet unclassified
bitHalfAdderº
	^ [:x :y :r :c | 
		(self bitXorº value: x value: y value: r),
		(self bitAndº value: x value: y value: c)		]