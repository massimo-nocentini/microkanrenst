converting
collect: aBlock 
	| a d |
	a := car class = Cons
				ifTrue: [car collect: aBlock]
				ifFalse: [aBlock value: car].
	d := cdr class = Cons
				ifTrue: [cdr collect: aBlock]
				ifFalse: [cdr ifNotNil:[aBlock value: cdr]].
	^ a cons: d