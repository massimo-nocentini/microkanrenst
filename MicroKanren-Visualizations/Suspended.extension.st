Extension { #name : #Suspended }

{ #category : #'*MicroKanren-Visualizations' }
Suspended >> innerGoal [

	^ receiver valueWithArguments: self variables
]
