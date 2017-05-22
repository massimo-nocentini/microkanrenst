helpers
collatz: o
	^ [ :_ | 
	o even
		ifTrue: [ self collatz: o / 2 ]
		ifFalse: [ self collatz: 3 * o + 1 ] ] links: o