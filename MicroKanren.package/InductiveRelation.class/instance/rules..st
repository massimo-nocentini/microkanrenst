initializing
rules: aCollection 
	rules := aCollection collect: [:each | each machine: self; yourself]