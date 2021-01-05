Extension { #name : #Pruning }

{ #category : #'*MicroKanren-Visualizations' }
Pruning >> printOn: aStream renderer: aRenderer [

	aRenderer printOn: aStream aPruning: self
]
