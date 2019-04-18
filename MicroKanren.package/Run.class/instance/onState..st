as yet unclassified
onState: aState

^[	| states vars selector |
	states := goal onState: aState.
	vars := goal vars
				ifEmpty: [LinkedList with: Var tautology].
	selector := vars size = 1 ifTrue: #first ifFalse: #yourself.
	 states
		collect: [:s | selector
				value: (s reifier reifyVars: vars)] ] suspended