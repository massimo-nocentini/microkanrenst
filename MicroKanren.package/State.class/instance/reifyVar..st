reification
reifyVar: aVar
	substitution
		at: aVar
		ifAbsentPut: [ ReifiedVar new
				id: substitution size;
				yourself ]