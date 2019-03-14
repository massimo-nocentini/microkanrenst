helpers
gcd: m gcd: n 
	^ m cons: [n isZero
		ifTrue: [Chain with: m]
		ifFalse: [self gcd: n gcd: m \\ n]]
		