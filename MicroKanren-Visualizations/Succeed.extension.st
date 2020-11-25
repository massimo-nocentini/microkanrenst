Extension { #name : #Succeed }

{ #category : #'*MicroKanren-Visualizations' }
Succeed >> printOn: aWriteStream renderer: aMKComputationTreeRenderer [

	aMKComputationTreeRenderer printOn: aWriteStream aSucceed: self
]
