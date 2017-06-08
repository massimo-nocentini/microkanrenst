dispatched
unifyCons: aCons withCons: anotherCons onState: aState
	| carState |
	carState := self unify: aCons car with: anotherCons car onState: aState.
	^ self unify: aCons cdr with: anotherCons cdr onState: carState