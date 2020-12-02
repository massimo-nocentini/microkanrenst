"
I represent a logic computation as a tree.
"
Class {
	#name : #MKComputationTreeRenderer,
	#superclass : #Object,
	#instVars : [
		'statesStream'
	],
	#category : #'MicroKanren-Visualizations'
}

{ #category : #visualization }
MKComputationTreeRenderer >> gtInspectorTreeUsingCanvas: aCanvas [

	| states shapes edges assocs labelBuilder printers associations |
	labelBuilder := RSMultilineLabelBuilder new.
	states := statesStream asOrderedCollection.
	printers := states collect: [ :each | 
		            MKGoalPrinter new
			            state: each;
			            value ].
	associations := printers
		                flatCollect: [ :each | each associations ]
		                as: Set.
	shapes := associations
		          collect: [ :each | 
			          (labelBuilder shapeFor: each value)
				          model: each key;
				          draggable;
				          yourself ]
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

{ #category : #visualization }
MKComputationTreeRenderer >> gtInspectorTreesViewIn: composite [
	<gtInspectorPresentationOrder: 20>
	^ composite roassal3
		  title: 'Tree';
		  initializeCanvas: [ 
			  (self gtInspectorTreeUsingCanvas: RSCanvas new)
			  @ RSCanvasController ];
		  yourself
]

{ #category : #accessing }
MKComputationTreeRenderer >> statesStream: anObject [
	statesStream := anObject
]
