as yet unclassified
outgoingFrom: aKey to: aValue 
	| neighborhood |
	neighborhood := vertices
				at: aKey
				ifAbsentPut: [Dictionary new].
	^ neighborhood
		at: #outgoings
		ifPresent: [:children | children add: aValue]
		ifAbsentPut: [LinkedList with: aValue]