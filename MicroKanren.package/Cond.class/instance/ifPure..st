as yet unclassified
ifPure: aStrategy
	if := [ :clause :otherwise | 
	IfPure new
		question: clause key answer: clause value otherwise: otherwise;
		streamCombinationStrategy: aStrategy;
		yourself ]