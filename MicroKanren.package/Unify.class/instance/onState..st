running
onState: aState
	| extended_state |
	^ [ unifier state: aState.
	extended_state := this unifyWith: that using: unifier.
	Goal succeed onState: extended_state ]
		on: UnificationError
		do: [ Goal fail onState: aState ]