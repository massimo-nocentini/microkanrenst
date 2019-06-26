as yet unclassified
teacup: x 
	^ (LinkedList new add: (x unifyo value: #tea) -> true asGoal; add: (x unifyo value: #cup) -> true asGoal; yourself) cond e