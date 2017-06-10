as yet unclassified
let: reversed reverse: reversing
	^ Goal cond e
		if: reversing nilo then: reversed nilo;
		else:
			[ :car :cdr :res | (reversing unifyWith: (car cons: cdr)) , ((self let: reversed be: res append: (car cons: nil)) & (self let: res reverse: cdr)) ]
				fresh