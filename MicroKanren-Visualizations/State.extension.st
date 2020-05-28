Extension { #name : #State }

{ #category : #'*MicroKanren-Visualizations' }
State >> gtInspectorWalkedVarsIn: composite [
	<gtInspectorPresentationOrder: 11>
	^ composite fastTable
		title: 'Walked vars';
		display: [ substitution keys ];
		column: 'Key'
			evaluated: [ :each | GTObjectPrinter asTruncatedTextFrom: each ];
		column: 'Value'
			evaluated:
				[ :each | GTObjectPrinter asTruncatedTextFrom: (self walker value: each) ];
		"selectionAct: [ :table | 
			table rawSelection do: [ :assoc | self removeKey: assoc key ].
			table update ]
			entitled: 'Remove item(s)';
		selectionPopulate: #selection
			entitled: 'Open key'
			with:
				[ :table | (table rawSelection collect: #key) gtInspectorInterestingObject ];"
			beMultiple;
		send: [ :selection | 
			"withSmalltalkSearch;
		showOnly: 50;
		helpMessage: 'Quick selection field. Given your INPUT, it executes: self select: [:each | INPUT ]'"
			selection
				ifNil: [ nil ]
				ifNotNil: [ selection size = 1
						ifTrue: [ selection anyOne value ]
						ifFalse: [ selection collect: #value ] ] ]
]
