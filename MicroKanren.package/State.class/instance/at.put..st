as yet unclassified
at: aVar put: aValue 
	| s |
	s := substitution copy.
	s "check that if a key already exists at aVar, then the values must be the same"
		at: aVar
		ifPresent: [:v | aValue = v
				ifFalse: [UnificationError signal]]
		ifAbsentPut: aValue.
	^ self class new birthdate: birthdate;
		 substitution: s;
		 yourself