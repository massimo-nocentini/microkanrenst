as yet unclassified
appendo
	^ [:aCollection :anotherCollection :aResult |( LinkedList new add: (self nilo value: aCollection)
			-> (aResult =° anotherCollection);
		 add: true asGoal -> [:a :d :rec | (self conso
				value: a
				value: d
				value: aCollection)
				, (self conso
						value: a
						value: rec
						value: aResult) , [self appendo
					value: d
					value: anotherCollection
					value: rec] eta] fresh; yourself) cond e]