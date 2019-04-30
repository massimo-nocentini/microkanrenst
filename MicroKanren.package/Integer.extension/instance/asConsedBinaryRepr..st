*MicroKanren-core
asConsedBinaryRepr: lastDigit 
	^ self isZero
		ifTrue: [lastDigit]
		ifFalse: [self odd
				ifTrue: [1
						cons: (self - 1 / 2 asConsedBinaryRepr: lastDigit)]
				ifFalse: [0 "self is a positive and even integer"
						cons: (self / 2 asConsedBinaryRepr: lastDigit)]]