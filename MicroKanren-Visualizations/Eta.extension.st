Extension { #name : #Eta }

{ #category : #'*MicroKanren-Visualizations' }
Eta >> printOn: aWriteStream renderer: aMKComputationTreeRenderer [

	aMKComputationTreeRenderer printOn: aWriteStream anEta: self
]
