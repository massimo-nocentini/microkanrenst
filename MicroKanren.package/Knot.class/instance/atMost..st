listing
atMost: n
	^ n isZero
		ifTrue: [ Chain bottom ]
		ifFalse: [ [ :useless | self next value atMost: n - 1 ] links: item ]