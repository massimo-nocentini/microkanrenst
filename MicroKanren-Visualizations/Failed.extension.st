Extension { #name : #Failed }

{ #category : #'*MicroKanren-Visualizations' }
Failed >> printOn: aWriteStream renderer: aMKComputationTreeRenderer [

	aMKComputationTreeRenderer printOn: aWriteStream aFailed: self
]
