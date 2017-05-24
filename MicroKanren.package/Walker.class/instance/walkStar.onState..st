walking
walkStar: aVar onState: aState
	^ (aState walk: aVar) walkStar: self onState: aState