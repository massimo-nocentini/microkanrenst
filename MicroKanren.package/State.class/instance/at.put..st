as yet unclassified
at: aVar put: aValue
	| s |
	s := substitution copy.
	s
		at: aVar
		ifPresent: [ :v | 
			aValue = v
				ifFalse: [ UnificationError signal ] ]
		ifAbsent: [ s at: aVar put: aValue ].
	^ self class new
		birthdate: birthdate;
		substitution: s;
		yourself