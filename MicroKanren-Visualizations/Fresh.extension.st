Extension { #name : #Fresh }

{ #category : #'*MicroKanren-Visualizations' }
Fresh >> innerGoal [

	^ receiver valueWithArguments: variables
]

{ #category : #'*MicroKanren-Visualizations' }
Fresh >> printOn: aStream renderer: aRenderer [

	aRenderer printOn: aStream aFresh: self
]
