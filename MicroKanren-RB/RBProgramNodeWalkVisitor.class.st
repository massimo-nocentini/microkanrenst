Class {
	#name : 'RBProgramNodeWalkVisitor',
	#superclass : 'RBProgramNodeMKVisitor',
	#instVars : [
		'walker'
	],
	#category : 'MicroKanren-RB',
	#package : 'MicroKanren-RB'
}

{ #category : 'visiting' }
RBProgramNodeWalkVisitor >> visitBlockNode: aNode [

	^ RBBlockNode
		  arguments:
		  (aNode arguments collect: [ :each | each acceptVisitor: self ])
		  body: (aNode body acceptVisitor: self)
]

{ #category : 'visiting' }
RBProgramNodeWalkVisitor >> visitLiteralValueNode: aLiteralNode [

	^ RBLiteralValueNode value:
		  (aLiteralNode value walkStarUsingWalker: walker)
]

{ #category : 'visiting' }
RBProgramNodeWalkVisitor >> visitLogicVariableNode: aNode [

	^ (walker value: aNode logicVar) asRBNode
]

{ #category : 'visiting' }
RBProgramNodeWalkVisitor >> visitMessageNode: aNode [

	^ RBMessageNode
		  receiver: (aNode receiver acceptVisitor: self)
		  selector: (aNode selectorNode acceptVisitor: self)
		  arguments:
		  (aNode arguments collect: [ :each | each acceptVisitor: self ])
]

{ #category : 'visiting' }
RBProgramNodeWalkVisitor >> visitSelectorNode: aNode [

	^ RBSelectorNode value: (walker value: aNode value)
]

{ #category : 'visiting' }
RBProgramNodeWalkVisitor >> visitSequenceNode: aNode [

	^ RBSequenceNode statements:
		  (aNode statements collect: [ :each | each acceptVisitor: self ])
]

{ #category : 'accessing' }
RBProgramNodeWalkVisitor >> walker: anObject [

	walker := anObject
]
