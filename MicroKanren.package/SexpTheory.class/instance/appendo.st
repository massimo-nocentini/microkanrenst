as yet unclassified
appendo
	^ [:aCollection :anotherCollection :aResult | Goal cond e
		if: (self nilo value: aCollection)
		then: (aResult unifyWith: anotherCollection);
		 else: [:a :d :rec | (self conso
			value: a
			value: d
			value: aCollection)
			, (self conso
					value: a
					value: rec
					value: aResult)
			, (self appendo
			    value: d
			value: anotherCollection
			value: rec)] fresh]