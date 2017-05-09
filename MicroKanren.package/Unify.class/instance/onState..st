running
onState: aState
	^ this
		unifyWith: that
		using:
			(self unifier
				inState: aState;
				yourself)