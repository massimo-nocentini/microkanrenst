reification
reifyVar: aVar
	substitution at: aVar ifAbsentPut: [ (#_ , substitution size asString) asSymbol ]