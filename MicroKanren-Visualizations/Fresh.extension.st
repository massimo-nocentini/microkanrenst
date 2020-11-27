Extension { #name : #Fresh }

{ #category : #'*MicroKanren-Visualizations' }
Fresh >> printOn: aStream renderer: aRenderer [

	aRenderer printOn: aStream aFresh: self
]
