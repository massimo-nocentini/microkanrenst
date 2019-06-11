as yet unclassified
at: aKey put: aValue 
	self outgoingFrom: aKey to: aValue;
	incomingTo:aValue from:aKey.
	edges add: aKey -> aValue