dispatched
walkStarCons: aCons
	| car cdr|
		car:= (self walkStar: aCons car).
		cdr:= (self walkStar: aCons cdr).
		^ car cons: cdr