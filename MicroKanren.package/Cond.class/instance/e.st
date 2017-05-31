initializing
e
	if := [ :clause :otherwise | 
	IfPure new
		question: clause key answer: clause value otherwise: otherwise;
		streamCombinationStrategy: Sequential new;
		yourself ]