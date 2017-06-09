accessing structure variables
testConjInterleaved
	| g |
	g := [ :x :y | (x unifyWith: 5) & (y unifyWith: 6) ] fresh.
	self assert: (g solutions atMost: 5) equals: {#(5 6)}