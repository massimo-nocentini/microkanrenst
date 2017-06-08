as yet unclassified
let: aCons be: aCar cons: aCdr
	^ (self let: aCar car: aCons) , (self let: aCdr cdr: aCons)