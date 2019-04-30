*MicroKanren-core
zip: aSequenceable
	^ self zip: aSequenceable with: [ :s :o | s -> o ]