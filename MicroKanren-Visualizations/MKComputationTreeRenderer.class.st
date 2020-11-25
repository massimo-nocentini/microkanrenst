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

	| states goals shapes edges assocs |
	states := statesStream asOrderedCollection.
	states do: [ :each | 
		each path reversed asLinkedList overlappingPairsDo: [ :g :g_succ | 
			g innerVariables: g_succ variables ] ].
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
