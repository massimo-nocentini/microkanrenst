*MicroKanren-core
asGraph
	|G|
	G := Graph new.
	self do: [:each | G at: each key put: each value].
	^G