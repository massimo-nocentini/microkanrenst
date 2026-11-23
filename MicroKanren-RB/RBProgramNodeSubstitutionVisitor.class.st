"
I answer a copy of an AST with other nodes in place of its variables: my `substitution` maps the names of the temporaries, and the `RBLogicVariableNode` objects, to these nodes. `OCNode>>substituteVariablesUsingDictionary:` and `BlockClosure>>substituteVariablesUsingSequenceableCollection:` use me.

```smalltalk
[ :x :y | x + y ] substituteVariablesUsingSequenceableCollection: {
		1 asLiteralRBNode.
		2 asLiteralRBNode }.
""=> OCMessageNode(1 + 2)""
```
"
Class {
	#name : 'RBProgramNodeSubstitutionVisitor',
	#superclass : 'RBProgramNodeIdentityVisitor',
	#instVars : [
		'substitution'
	],
	#category : 'MicroKanren-RB',
	#package : 'MicroKanren-RB'
}

{ #category : 'accessing' }
RBProgramNodeSubstitutionVisitor >> substitution: anObject [
	substitution := anObject
]

{ #category : 'visiting' }
RBProgramNodeSubstitutionVisitor >> visitLogicVariableNode: aNode [

	^ substitution at: aNode
]

{ #category : 'visiting' }
RBProgramNodeSubstitutionVisitor >> visitTemporaryNode: aNode [

	^ aNode isVariable
		  ifTrue: [ substitution at: aNode name ]
		  ifFalse: [ aNode ]
]
