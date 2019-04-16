as yet unclassified
at: aKey put: aValue 
	| aKeyDict aValueDict |
	aKeyDict := vertices
				at: aKey
				ifAbsentPut: [Dictionary new].
	aKeyDict
		at: #outgoings
		ifPresent: [:aSet | aSet add: aValue]
		ifAbsentPut: [LinkedList with: aValue].
	aValueDict := vertices
				at: aValue
				ifAbsentPut: [Dictionary new].
	aValueDict
		at: #incomings
		ifPresent: [:aSet | aSet add: aKey]
		ifAbsentPut: [LinkedList with: aKey].
	edges add: aKey -> aValue