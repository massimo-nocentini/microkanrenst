running
onState: aState
	^ [ | extended_state |
	extended_state := this unifyWith: that usingUnifier: Unifier new onState: aState.
	Goal succeed onState: extended_state ]
		on: UnificationError
		do: [ Goal fail onState: aState ]