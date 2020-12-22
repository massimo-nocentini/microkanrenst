Extension { #name : #Suspended }

{ #category : #'*MicroKanren-Visualizations' }
Suspended >> printOnNestedGoalOn: aStream renderer: aRenderer [

	nestedGoal
		ifNil: [ "aStream nextPutAll: receiver sourceNode body formattedCode" 
			aStream nextPutAll: '…' ]
		ifNotNil: [ nestedGoal printOn: aStream renderer: aRenderer ]
]
