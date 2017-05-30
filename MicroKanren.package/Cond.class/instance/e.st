initializing
e
	if := [ :clause :otherwise | 
	IfE new
		question: clause key answer: clause value otherwise: otherwise;
		yourself ]