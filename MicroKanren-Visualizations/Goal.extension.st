Extension { #name : #Goal }

{ #category : #'*MicroKanren-Visualizations' }
Goal >> printOn: aStream renderer: aRenderer [

	self subclassResponsibility
]

{ #category : #'*MicroKanren-Visualizations' }
Goal >> printOn: aStream variables: vars renderer: aRenderer [

	| bkp |
	bkp := variables.
	self
		variables: vars;
		printOn: aStream renderer: aRenderer;
		variables: bkp
]
