Extension { #name : #Cut }

{ #category : #'*MicroKanren-Visualizations' }
Cut >> printOn: aWriteStream renderer: aMKComputationTreeRenderer [

	aMKComputationTreeRenderer printOn: aWriteStream aCut: self
]
