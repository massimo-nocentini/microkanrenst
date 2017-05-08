*MicroKanren-core
zip: aSequenceable with: aBlock
	| l |
	l := self class new.
	1 to: (self size min: aSequenceable size) do: [ :i | 
		| v |
		v := aBlock value: (self at: i) value: (aSequenceable at: i).
		l add: v ].
	^ l