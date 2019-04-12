as yet unclassified
walkRecursive: anObj 
	^ substitution
		at: anObj
		ifPresent: [:v | 
			
			substitution at: anObj put: (self walk: v)]
		ifAbsent: [anObj]