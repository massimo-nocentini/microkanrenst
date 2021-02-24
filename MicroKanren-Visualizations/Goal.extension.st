Extension { #name : #Goal }

{ #category : #'*MicroKanren-Visualizations' }
Goal >> addUnifiedSubgoalsInSet: unified [

	"Nothing to do here because a generic goal cannot unify anything."

	
]

{ #category : #'*MicroKanren-Visualizations' }
Goal >> asLogicComputationTreeLimitedTo: n [

	^ MKComputationTreeRenderer new
		  statesStream: (self asStatesStream next: n);
		  yourself
]

{ #category : #'*MicroKanren-Visualizations' }
Goal >> printOn: aStream renderer: aRenderer [

	self subclassResponsibility
]
