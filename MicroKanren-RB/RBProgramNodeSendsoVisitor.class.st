"
I collect `goals` about the messages sent in an AST: `asGoal` answers their disjunction, the goal that my `selectorVar` is the selector node of one of them. For a logic variable in the AST I add a goal for every unary selector of the image, that my `selectorVar` is that message sent to a new variable.

`sendso`, understood by blocks, compiled methods and AST nodes, uses me:

```smalltalk
[ :x | [ :o | o + 1 ] sendso value: x ]
	asGoal solutions readStream upToEnd.
""=> an Array(OCSelectorNode(+))""
```
"
Class {
	#name : 'RBProgramNodeSendsoVisitor',
	#superclass : 'RBProgramNodeMKVisitor',
	#instVars : [
		'goals',
		'selectorVar'
	],
	#category : 'MicroKanren-RB',
	#package : 'MicroKanren-RB'
}

{ #category : 'initialization' }
RBProgramNodeSendsoVisitor >> asGoal [

	^ goals foldr: [ :each :g | each | g ] init: false asGoal
]

{ #category : 'initialization' }
RBProgramNodeSendsoVisitor >> initialize [

	super initialize.

	goals := OrderedCollection new
]

{ #category : 'accessing' }
RBProgramNodeSendsoVisitor >> selectorVar: anObject [

	selectorVar := anObject
]

{ #category : 'visiting' }
RBProgramNodeSendsoVisitor >> visitLogicVariableNode: aNode [

	super visitLogicVariableNode: aNode.

	Symbol selectorTable
		select: [ :each | each isUnary ]
		thenDo: [ :each | 
			goals add: [ :receiver | 
				selectorVar unifyo value:
					(RBMessageNode
						 receiver: receiver asRBNode
						 selector: (RBSelectorNode value: each)) ] asGoal ]
]

{ #category : 'visiting' }
RBProgramNodeSendsoVisitor >> visitMessageNode: aMessageNode [

	super visitMessageNode: aMessageNode.

	goals add: (selectorVar unifyo value: aMessageNode selectorNode)
]

{ #category : 'as yet unclassified' }
RBProgramNodeSendsoVisitor >> visitSelectorNode: aNode [
	"Pharo 15 visits the selector node of a message node too: #visitMessageNode: takes care of it."

	^ aNode
]
