as yet unclassified
inject: init into: aBlock 
	| accumulated |
	accumulated := aBlock value: init value: car.
	^ aBlock value: accumulated value: cdr