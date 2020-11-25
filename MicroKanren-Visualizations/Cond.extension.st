Extension { #name : #Cond }

{ #category : #'*MicroKanren-Visualizations' }
Cond >> printOn: aWriteStream renderer: aMKComputationTreeRenderer [

	aMKComputationTreeRenderer printOn: aWriteStream aCond: self
]
