running
onState: aState
	^ [ | extended_state |
	extended_state := Unifier new unify: this with: that onState: aState.
	Goal succeed onState: extended_state ]
		on: UnificationError
		do: [ Goal fail onState: aState ]