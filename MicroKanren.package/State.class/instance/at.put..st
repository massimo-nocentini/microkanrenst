as yet unclassified
at: aVar put: aValue 
	| s |
	s := substitution copy.
	s
		at: aVar
		ifPresent: [:v | "check that if a key already exists at aVar, then the values
			must be the same"
			aValue = v
				ifFalse: [
					UnificationError signal]]
		ifAbsentPut: aValue.
	^ self class new birthdate: birthdate;
		 substitution: s;
		 yourself