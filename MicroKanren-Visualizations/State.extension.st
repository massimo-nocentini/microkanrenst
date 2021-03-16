Extension { #name : #State }

{ #category : #'*MicroKanren-Visualizations' }
State >> gtInspectorItemsInGLMPresentation: composite [

	<gtInspectorPresentationOrder: 20>
	^ composite fastTable
		  title: 'Walked Variables';
		  display: [ (1 to: birthdate) collect: #asVar ];
		  beMultiple;
		  enableElementIndex;
		  wantsAutomaticRefresh: true;
		  column: 'Variable'
		  evaluated: [ :aVar :index | aVar asString ]
		  width: 50;
		  column: 'Named' evaluated: [ :aVar :index | aVar name ] width: 50;
		  column: 'Value'
		  evaluated: [ :value | 
			  GTObjectPrinter asTruncatedTextFrom: (self walk: value) ]
		  width: 300;
		  column: 'Walked Value' evaluated: [ :value | 
			  GTObjectPrinter asTruncatedTextFrom: (Walker new
						   state: self;
						   value: value) ]
		  width: 300;
		  send: [ :result | 
			  result ifNotNil: [ 
				  result isCollection
					  ifTrue: [ 
						  result size = 1
							  ifTrue: [ result anyOne ]
							  ifFalse: [ self species withAll: result ] ]
					  ifFalse: [ result ] ] ]
]
