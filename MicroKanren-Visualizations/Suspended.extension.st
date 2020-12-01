Extension { #name : #Suspended }

{ #category : #'*MicroKanren-Visualizations' }
Suspended >> printOnNestedGoalOn: aStream renderer: aRenderer [

	nestedGoal
		ifNil: [ Error signal ]
		ifNotNil: [ nestedGoal printOn: aStream renderer: aRenderer ]
]
