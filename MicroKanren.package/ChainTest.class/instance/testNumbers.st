testing
testNumbers
	self assert: Chain bottom mature equals: LinkedList new.
	self
		assert: (self nats atMost: 10) mature
		equals: (0 to: 9).
	self
		assert: (self upto2 atMost: 10) mature
		equals: (0 to: 2).
	self
		assert: (self upto2 atMost: 1) mature
		equals: (0 to: 0).
	self assert: (self fibs atMost: 10) mature equals: {0. 1. 1. 2. 3. 5. 8. 13. 21. 34}.
	self assert: ((self collatz: 10)
			atMost: 10) mature equals: {10. 5. 16. 8. 4. 2. 1. 4. 2. 1}.
	self assert: ((self gcd: 18 gcd: 32)
			atMost: 10) mature equals: {18. 32. 18. 14. 4. 2. 2}.
			self assert: ((Chain repeat: 4)
			atMost: 10) mature equals: {4. 4. 4. 4. 4. 4. 4. 4. 4. 4}