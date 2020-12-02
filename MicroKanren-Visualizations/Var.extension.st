Extension { #name : #Var }

{ #category : #'*MicroKanren-Visualizations' }
Var >> printOn: aWriteStream renderer: aMKComputationTreeRenderer [

	aMKComputationTreeRenderer printOn: aWriteStream aVar: self
]
