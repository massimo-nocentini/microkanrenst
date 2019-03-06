helpers
gcd: m gcd: n
	^ [ :useless
	 | 
	n isZero
		ifTrue: [ Chain with: m ]
		ifFalse: [ self gcd: n gcd: m \\ n ] ] links: m