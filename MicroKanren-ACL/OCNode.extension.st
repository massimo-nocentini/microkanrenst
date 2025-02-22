Extension { #name : 'OCNode' }

{ #category : '*MicroKanren-ACL' }
OCNode >> acl: aBlock contextVariables: aCollection [

	^ ACL new
		  node: self;
		  contextVariables: aCollection;
		  in: [ :acl | 
			  aBlock value: acl.
			  acl asGoal ]
]

{ #category : '*MicroKanren-ACL' }
OCNode >> acl: aBlock then: goalBlock contextVariables: aCollection [

	^ ACL new
		  node: self;
		  contextVariables: aCollection;
		  then: goalBlock;
		  in: [ :acl | 
			  aBlock value: acl.
			  acl asGoal ]
]
