"
I represent a logic computation as a tree.
"
Class {
	#name : #MKComputationTreeRenderer,
	#superclass : #Object,
	#instVars : [
		'statesStream',
		'innerVariables'
	],
	#category : #'MicroKanren-Visualizations'
}

{ #category : #visualization }
MKComputationTreeRenderer >> gtInspectorTreeUsingCanvas: aCanvas [

	| states goals shapes edges assocs |
	innerVariables := IdentityDictionary new.
	states := statesStream asOrderedCollection.
	states do: [ :each | 
		each path reversed asLinkedList overlappingPairsDo: [ :g :g_succ | 
			innerVariables
				at: g
				ifPresent: [ :vars | self assert: vars = g_succ variables ]
				ifAbsentPut: [ g_succ variables ] ] ].
	goals := states
		         flatCollect: [ :each | each path asLinkedList ]
		         as: Set.
	shapes := goals
		          collect: [ :each | 
			          RSLabel new
				          text: (self printGoal: each);
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

{ #category : #printing }
MKComputationTreeRenderer >> printClause: anAssociation on: aStream [

	aStream nextPut: $(.
	anAssociation key printOn: aStream renderer: self.
	aStream nextPutAll: ' → '.
	anAssociation value printOn: aStream renderer: self.
	aStream nextPut: $)
]

{ #category : #visualization }
MKComputationTreeRenderer >> printGoal: aGoal [

	^ String streamContents: [ :aStream | 
		  aGoal printOn: aStream renderer: self ]
]

{ #category : #printing }
MKComputationTreeRenderer >> printOn: aStream aCond: aCond [

	aCond clauses ifNotEmpty: [ :clauses | 
		clauses allButLastDo: [ :each | 
			self printClause: each on: aStream.
			aStream nextPutAll: ';° ' ].
		self printClause: clauses last on: aStream ]
]

{ #category : #printing }
MKComputationTreeRenderer >> printOn: aStream aConj: aConj [

	aStream nextPut: $(.
	aConj both printOn: aStream renderer: self.
	aStream nextPutAll: ') ,° ('.
	aConj and printOn: aStream renderer: self.
	aStream nextPut: $)
]

{ #category : #printing }
MKComputationTreeRenderer >> printOn: aStream aDisj: aDisj [

	aStream nextPut: $(.
	aDisj either printOn: aStream renderer: self.
	aStream nextPutAll: ') v° ('.
	aDisj or printOn: aStream renderer: self.
	aStream nextPut: $)
]

{ #category : #printing }
MKComputationTreeRenderer >> printOn: aStream aFailed: aGoal [

	aStream nextPutAll: 'Ø°'
]

{ #category : #printing }
MKComputationTreeRenderer >> printOn: aStream aFresh: aGoal [

	aGoal variables ifNotEmpty: [ :variables | 
		aStream nextPut: $!.
		variables allButLastDo: [ :each | 
			each printOn: aStream.
			aStream nextPut: Character space ].
		variables last printOn: aStream.
		aStream nextPutAll: '. ' ].
	aStream nextPutAll: 'aFresh'
	"aGoal innerGoal
		printOn: aStream
		variables: (innerVariables at: aGoal)
		renderer: self"
]

{ #category : #printing }
MKComputationTreeRenderer >> printOn: aStream aSucceed: aSucceed [

	aStream nextPutAll: '✓°'
]

{ #category : #printing }
MKComputationTreeRenderer >> printOn: aStream anEta: anEta [

	anEta goal receiver printOn: aStream.
	aStream nextPut: $°
]

{ #category : #printing }
MKComputationTreeRenderer >> printOn: aStream anIfPure: anIfPure [

	aStream nextPutAll: 'if '.
	anIfPure question printOn: aStream renderer: self.
	aStream nextPutAll: ' then '.
	anIfPure answer printOn: aStream renderer: self.
	aStream nextPutAll: ' else '.
	anIfPure otherwise printOn: aStream renderer: self
]

{ #category : #printing }
MKComputationTreeRenderer >> printOn: aWriteStream anObject: anObject [

	anObject printOn: aWriteStream
]

{ #category : #printing }
MKComputationTreeRenderer >> printOn: aStream anUnify: anUnify [

	anUnify this printOn: aStream renderer: self.
	aStream nextPutAll: ' =° '.
	anUnify that printOn: aStream renderer: self
]

{ #category : #accessing }
MKComputationTreeRenderer >> statesStream: anObject [
	statesStream := anObject
]
