running
onState: aState
	^ [ | extended_state |
	extended_state :=aState unifier value: this value: that.
	Goal succeed onState: extended_state ]
		on: UnificationError
		do: [ Goal fail onState: aState ]