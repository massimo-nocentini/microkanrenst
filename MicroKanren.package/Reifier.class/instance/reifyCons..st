dispatched
reifyCons: aCons 
	| carState |
	carState := self reify: aCons car.
	^ (Reifier on: carState) reify: aCons cdr