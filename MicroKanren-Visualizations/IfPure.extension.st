Extension { #name : #IfPure }

{ #category : #'*MicroKanren-Visualizations' }
IfPure >> printOn: aWriteStream renderer: aMKComputationTreeRenderer [

	aMKComputationTreeRenderer printOn: aWriteStream anIfPure: self
]
