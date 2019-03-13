testing
testNumbers
	self assert: Chain bottom contents equals: LinkedList new.
	self
		assert: (self nats next: 10) contents
		equals: (0 to: 9).
	self
		assert: (self upto2 next: 10) contents
		equals: (0 to: 2).
		self
		assert: (self upto2_usingCons next: 10) contents
		equals: (0 to: 2).
	self
		assert: (self upto2 next: 1) contents
		equals: (0 to: 0).
	self assert: (self fibs next: 10) contents equals: {0. 1. 1. 2. 3. 5. 8. 13. 21. 34}.
	self assert: ((self collatz: 10)
			next: 10) contents equals: {10. 5. 16. 8. 4. 2. 1. 4. 2. 1}.
	self assert: ((self gcd: 18 gcd: 32)
			next: 10) contents equals: {18. 32. 18. 14. 4. 2. 2}.
	self assert: ((Chain repeat: 4)
			next: 10) contents equals: {4. 4. 4. 4. 4. 4. 4. 4. 4. 4}