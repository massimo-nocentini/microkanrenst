Extension { #name : #Disunite }

{ #category : #'*MicroKanren-Visualizations' }
Disunite >> printOn: aStream renderer: aRenderer [

	aRenderer printOn: aStream aDisunite: self
]
