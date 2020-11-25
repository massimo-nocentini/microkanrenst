Extension { #name : #Conj }

{ #category : #'*MicroKanren-Visualizations' }
Conj >> printOn: aWriteStream renderer: aMKComputationTreeRenderer [

	aMKComputationTreeRenderer printOn: aWriteStream aConj: self
]
