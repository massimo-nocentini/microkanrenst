dispatching
value: anObj value: anotherObj 
	| aWalkedObj anotherWalkedObj |
	aWalkedObj := state walk: anObj.
	anotherWalkedObj := state walk: anotherObj.
	^ aWalkedObj
		unifyWith: anotherWalkedObj
		usingUnifier: self