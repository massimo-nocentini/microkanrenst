Extension { #name : #Unify }

{ #category : #'*MicroKanren-Visualizations' }
Unify >> printOn: aWriteStream renderer: aMKComputationTreeRenderer [

	aMKComputationTreeRenderer printOn: aWriteStream anUnify: self
]
