dispatched
walkStarCons: aCons onState: aState
	^ Cons car: (self walkStar: aCons car onState: aState) cdr: (self walkStar: aCons cdr onState: aState)