dispatched
forCons: aCons forCons: anotherCons 
	| carState |
	carState := state unifier value: aCons car value: anotherCons car.
	^ carState unifier value: aCons cdr value: anotherCons cdr