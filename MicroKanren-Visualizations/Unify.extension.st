Extension { #name : #Unify }

{ #category : #'*MicroKanren-Visualizations' }
Unify >> addUnifiedSubgoalsInSet: unified [

	unified
		add: left;
		add: right
]

{ #category : #'*MicroKanren-Visualizations' }
Unify >> printOn: aStream renderer: aRenderer [

	aRenderer printOn: aStream anUnify: self
]
