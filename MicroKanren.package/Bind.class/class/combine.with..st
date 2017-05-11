creating
combine: aGoal with: aCollection
	^ self new
		combiner: aGoal;
		stream: aCollection;
		yourself