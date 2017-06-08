dispatched
reifyCons: aCons onState: aState
	| carState |
	carState := self reify: aCons car onState: aState.
	^ self reify: aCons cdr onState: carState