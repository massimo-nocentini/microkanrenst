as yet unclassified
walk: anObj
	"searches for the value of `anObj` in substitution"

	| k |
	k := anObj.
	[ k := substitution at: k ifAbsent: [ ^ k ] ] repeat