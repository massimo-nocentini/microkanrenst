Extension { #name : #Graph }

{ #category : #'*MicroKanren' }
Graph >> asGoal [
	^ [ :x :y | 
	| g |
	g := Goal cond e.
	edges
		do: [ :each | 
			g
				if: (x unifyo value: each from content)
				then: (y unifyo value: each to content) ].
	g ]
]
