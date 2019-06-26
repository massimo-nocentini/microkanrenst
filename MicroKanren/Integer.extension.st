Extension { #name : #Integer }

{ #category : #'*MicroKanren-core' }
Integer >> asConsedBinaryRepr [
	^ self asConsedBinaryRepr: nil
]

{ #category : #'*MicroKanren-core' }
Integer >> asConsedBinaryRepr: lastDigit [ 
	^ self isZero
		ifTrue: [lastDigit]
		ifFalse: [self odd
				ifTrue: [1
						cons: (self - 1 / 2 asConsedBinaryRepr: lastDigit)]
				ifFalse: [0 "self is a positive and even integer"
						cons: (self / 2 asConsedBinaryRepr: lastDigit)]]
]

{ #category : #'*MicroKanren-core' }
Integer >> asReifiedVar [
	^ self asReifiedWithVarClass: ReifiedVar
]

{ #category : #'*MicroKanren-core' }
Integer >> asReifiedWithVarClass: aClass [
	^ aClass new
		id: self;
		yourself
]

{ #category : #'*MicroKanren-core' }
Integer >> asVar [
	^ self asReifiedWithVarClass: Var
]
