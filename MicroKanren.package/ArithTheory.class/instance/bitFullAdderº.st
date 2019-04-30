as yet unclassified
bitFullAdderº
	^ [:b :x :y :r :c | [:w :xy :wz |( self bitHalfAdderº
		value: x
		value: y
		value: w
		value: xy), ( self bitHalfAdderº
		value: w
		value: b
		value: r
		value: wz),(self bitXorº value: xy value: wz value: c)] fresh]