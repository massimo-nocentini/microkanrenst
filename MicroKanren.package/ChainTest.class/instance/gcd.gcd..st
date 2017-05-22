helpers
gcd: m gcd: n
	^ [ :_ | 
	n isZero
		ifTrue: [ Chain with: m ]
		ifFalse: [ self gcd: n gcd: m % n ] ] links: m