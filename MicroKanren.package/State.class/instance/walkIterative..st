as yet unclassified
walkIterative: anObj 
	"searches for the value of `anObj` in substitution"
	"^ substitution
	at: anObj
	ifPresent: [:v | 
	| w |
	w := self walk: v.
	substitution at: anObj put: w]
	ifAbsent: [anObj]"
	| k |
	k := anObj.
	[k := substitution
				at: k
				ifAbsent: [^ k]] repeat