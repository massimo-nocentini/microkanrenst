reification
reifyVar: aVar withCtor: aCtor 
	substitution
		at: aVar
		ifAbsentPut: [aCtor value: substitution size]