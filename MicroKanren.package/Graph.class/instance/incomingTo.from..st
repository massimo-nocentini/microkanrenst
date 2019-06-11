as yet unclassified
incomingTo: aValue from: aKey 
	| neighborooh |
	neighborooh := vertices
				at: aValue
				ifAbsentPut: [Dictionary new].
	neighborooh
		at: #incomings
		ifPresent: [:parents | parents add: aKey]
		ifAbsentPut: [LinkedList with: aKey]