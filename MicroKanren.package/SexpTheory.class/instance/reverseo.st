as yet unclassified
reverseo
	^ [:reversing :reversed | Goal cond e
		if: (self nilo value: reversing)
		then: (self nilo value: reversed);
		 else: [:car :cdr :res | (self conso
			value: car
			value: cdr
			value: reversing)
			, (self appendo
					value: res
					value: (car cons: nil)
					value: reversed)
			, (self reverseo value: cdr value: res)] fresh]