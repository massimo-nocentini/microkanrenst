Extension { #name : #State }

{ #category : #'*MicroKanren-Visualizations' }
State >> gtInspectorItemsInGLMPresentation: composite [

	<gtInspectorPresentationOrder: 20>
	| walker |
	walker := self walker.
	^ composite fastTable
		  title: 'Walked Variables';
		  display: [ (1 to: birthdate) collect: #asVar ];
		  beMultiple;
		  enableElementIndex;
		  wantsAutomaticRefresh: true;
		  column: 'Variable'
		  evaluated: [ :aVar :index | aVar asString ]
		  width: 50;
		  column: 'Named'
		  evaluated: [ :aVar :index | aVar name ]
		  width: 50;
		  column: 'Value'
		  evaluated: [ :value | 
			  GTObjectPrinter asTruncatedTextFrom: (self walk: value) ]
		  width: 300;
		  column: 'Walked Value'
		  evaluated: [ :value | 
			  GTObjectPrinter asTruncatedTextFrom: (walker value: value) ]
		  width: 300;
		  send: [ :result | "withSmalltalkSearch;
		showOnly: 50;
		helpMessage: 'Quick selection field. Given your INPUT, it executes: self select: [:each | INPUT ]'."
			  result ifNotNil: [ 
					  result isCollection
						  ifTrue: [ 
							  result size = 1
								  ifTrue: [ result anyOne ]
								  ifFalse: [ self species withAll: result ] ]
						  ifFalse: [ result ] ] ]
]
