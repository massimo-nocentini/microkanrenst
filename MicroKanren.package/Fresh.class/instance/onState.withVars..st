dispatched
onState: aState withVars: aCollection
	| g |
	vars := aCollection.
	g := receiver valueWithArguments: vars.
	^ g onState: aState