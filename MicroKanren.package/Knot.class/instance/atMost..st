listing
atMost: n
	^ n isZero
		ifTrue: [ Chain bottom ]
		ifFalse: [ [ :_ | self next value atMost: n - 1 ] links: item ]