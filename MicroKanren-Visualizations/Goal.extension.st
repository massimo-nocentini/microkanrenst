Extension { #name : #Goal }

{ #category : #'*MicroKanren-Visualizations' }
Goal >> gtInspectorTreeUsingCanvas: aCanvas [
	| states goals shapes edges assocs |
	states := ((self onState: SBRAL new asState) next: 20)
		          asOrderedCollection.
	goals := states
		         flatCollect: [ :each | each path asLinkedList ]
		         as: Set.
	shapes := goals
		          collect: [ :each | 
			          RSLabel new
				          model: each;
				          draggable ]
		          as: RSGroup.
	assocs := states flatCollect: [ :each | 
		          each path asLinkedList overlappingPairsCollect: [ 
			          :aLink 
			          :anotherLink | anotherLink value -> aLink value ] ].
	edges := RSEdgeBuilder orthoVertical
		         withVerticalAttachPoint;
		         shapes: shapes;
		         useAssociations: assocs.
	RSTreeLayout on: shapes edges: edges.
	^ aCanvas
		  addAll: shapes;
		  addAll: edges;
		  yourself
]

{ #category : #'*MicroKanren-Visualizations' }
Goal >> gtInspectorTreesViewIn: composite [
	<gtInspectorPresentationOrder: 20>
	^ composite roassal3
		  title: 'Tree';
		  initializeCanvas: [ 
			  (self gtInspectorTreeUsingCanvas: RSCanvas new)
			  @ RSCanvasController ];
		  yourself
]
