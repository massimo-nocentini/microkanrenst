Extension { #name : #Disj }

{ #category : #'*MicroKanren-Visualizations' }
Disj >> printOn: aWriteStream renderer: aMKComputationTreeRenderer [

	aMKComputationTreeRenderer printOn: aWriteStream aDisj: self
]
