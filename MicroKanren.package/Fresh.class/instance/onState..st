running
onState: aState
	^ aState collectVars: (1 to: receiver numArgs) forFresh: self