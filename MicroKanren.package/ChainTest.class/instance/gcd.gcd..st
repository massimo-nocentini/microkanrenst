helpers
gcd: m gcd: n 
	^ [n isZero
		ifTrue: [Chain with: m]
		ifFalse: [self gcd: n gcd: m \\ n]]
		links: m