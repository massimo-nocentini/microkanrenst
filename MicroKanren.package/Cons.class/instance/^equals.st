comparing
= anotherObject
	^ self species == anotherObject species
		and: [ self car = anotherObject car and: [ self cdr = anotherObject cdr ] ]