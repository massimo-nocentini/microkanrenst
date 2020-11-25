Extension { #name : #Object }

{ #category : #'*MicroKanren-Visualizations' }
Object >> printOn: aWriteStream renderer: aMKComputationTreeRenderer [

	aMKComputationTreeRenderer printOn: aWriteStream anObject: self
]
