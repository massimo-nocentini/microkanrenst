*MicroKanren-core
foldr: aBlock init: init 
	| cell |
	cell := init.
	self
		reverseDo: [:each | cell := aBlock value: each value: cell].
	^ cell