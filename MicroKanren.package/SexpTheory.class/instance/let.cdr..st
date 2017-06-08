as yet unclassified
let: anObj cdr: anotherObj
	^ [ :a | anotherObj asCons unifyWith: (Cons car: a cdr: anObj asCons) ] fresh