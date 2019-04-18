as yet unclassified
teacup: x 
	^ (LinkedList new add: x =° #tea -> true asGoal; add: x =° #cup -> true asGoal; yourself) cond e