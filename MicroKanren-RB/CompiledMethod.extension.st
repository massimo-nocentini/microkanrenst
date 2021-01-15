Extension { #name : #CompiledMethod }

{ #category : #'*MicroKanren-RB' }
CompiledMethod >> sendso [

	^ [ :anObject | 
	  RBProgramNodeSendsoVisitor new
		  selectorVar: anObject;
		  visitNode: self sourceNode body;
		  asGoal ]
]
