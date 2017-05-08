dispatched
onState: aState withVars: aCollection
	| g |
	g := receiver valueWithArguments: aCollection.
	^ aState into: g