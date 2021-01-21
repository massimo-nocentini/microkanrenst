Extension { #name : #EFFormatter }

{ #category : #'*MicroKanren-RB' }
EFFormatter >> visitLogicVariableNode: aNode [

	self writeString: aNode logicVar asString
]
