Extension { #name : #State }

{ #category : #'*MicroKanren-Visualizations' }
State >> inspectionWalkedVariables [
	"The GT inspector is gone since Pharo 10: the same table of variables as a pane of the Spec inspector."

	<inspectorPresentationOrder: 20 title: 'Walked Variables'>
	| walker |
	walker := self walker.
	^ SpTablePresenter new
		  items: ((1 to: birthdate) collect: #asVar);
		  addColumn: (SpStringTableColumn
				   title: 'Variable'
				   evaluated: [ :aVar | aVar asString ]);
		  addColumn:
			  (SpStringTableColumn title: 'Named' evaluated: [ :aVar | aVar name ]);
		  addColumn: (SpStringTableColumn
				   title: 'Value'
				   evaluated: [ :aVar | (self walk: aVar) printString ]);
		  addColumn: (SpStringTableColumn
				   title: 'Walked Value'
				   evaluated: [ :aVar | (walker value: aVar) printString ]);
		  yourself
]
