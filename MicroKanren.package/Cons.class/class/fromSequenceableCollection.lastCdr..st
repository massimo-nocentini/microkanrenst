creating
fromSequenceableCollection: aCollection lastCdr: aCdr
	| cell |
	cell := aCdr asCons.
	aCollection reverseDo: [ :each | cell := self car: each asCons cdr: cell ].
	^ cell