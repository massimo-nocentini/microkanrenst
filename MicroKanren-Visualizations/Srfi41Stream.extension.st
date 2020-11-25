Extension { #name : #Srfi41Stream }

{ #category : #'*MicroKanren-Visualizations' }
Srfi41Stream >> asLogicComputationTree [

	^ MKComputationTreeRenderer new
		  statesStream: self;
		  yourself
]
