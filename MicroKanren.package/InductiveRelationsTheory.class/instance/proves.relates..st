computing
proves: anObj relates: anotherObj
	| g |
	g := Goal cond i.
	rules do: [ :r | g if: (r consumes: anObj produces: anotherObj machine: self) then: true asGoal ].
	^ g