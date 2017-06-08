as yet unclassified
let: aResult be: aCollection append: anotherCollection
	^ Goal cond e
		if: aCollection nilo then: (aResult unifyWith: anotherCollection);
		else:
			[ :a :d :rec | 
			(self let: aCollection be: a cons: d) , (self let: aResult be: a cons: rec)
				, (self let: rec be: d append: anotherCollection) ] fresh