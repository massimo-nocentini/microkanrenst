Extension { #name : #EFFormatter }

{ #category : #'*MicroKanren-RB' }
EFFormatter >> visitLogicVariableNode: aNode [

	self writeString: '◊' , aNode logicVar asString
]

{ #category : #'*MicroKanren-RB' }
EFFormatter >> visitSelectorNode: aNode [

	self writeString: aNode selector
]
