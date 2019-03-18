creating
fromSequenceableCollection: aCollection lastCdr: aCdr 
	^ aCollection
		foldr: [:each :acc | self car: each asCons cdr: acc asCons]
		init: aCdr