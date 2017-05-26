dispatching
unify: anObj with: anotherObj onState: aState
	| aWalkedObj anotherWalkedObj |
	aWalkedObj := aState walk: anObj.
	anotherWalkedObj := aState walk: anotherObj.
	^ aWalkedObj unifyWith: anotherWalkedObj usingUnifier: self onState: aState