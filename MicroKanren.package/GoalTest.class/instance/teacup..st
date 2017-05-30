as yet unclassified
teacup: x
	^ (LinkedList
		with: (x unifyWith: #tea) -> true asGoal
		with: (x unifyWith: #cup) -> true asGoal) cond e