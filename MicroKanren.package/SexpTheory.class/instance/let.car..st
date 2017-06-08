as yet unclassified
let: anObj car: anotherObj
	^ [ :d | anotherObj asCons unifyWith: (Cons car: anObj asCons cdr: d) ] fresh