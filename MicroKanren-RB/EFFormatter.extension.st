Extension { #name : #EFFormatter }

{ #category : #'*MicroKanren-RB' }
EFFormatter >> visitLogicVariableNode: aNode [

	"super visitLogicVariableNode: aNode.
"
	self writeString: aNode logicVar asString
]
