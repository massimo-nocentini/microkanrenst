as yet unclassified
at: aVar put: aValue
	substitution
		at: aVar
		ifPresent: [ :v | 
			aValue = v
				ifFalse: [ UnificationError signal ] ]
		ifAbsent: [ substitution at: aVar put: aValue ]