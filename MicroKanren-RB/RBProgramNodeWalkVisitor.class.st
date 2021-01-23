Class {
	#name : #RBProgramNodeWalkVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'walker'
	],
	#category : #'MicroKanren-RB'
}

{ #category : #visiting }
RBProgramNodeWalkVisitor >> visitLiteralValueNode: aLiteralNode [

	^ RBLiteralValueNode value:
		  (aLiteralNode value walkStarUsingWalker: walker)
]

{ #category : #visiting }
RBProgramNodeWalkVisitor >> visitLogicVariableNode: aNode [

	^ (aNode logicVar walkStarUsingWalker: walker) asRBNode
]

{ #category : #visiting }
RBProgramNodeWalkVisitor >> visitMessageNode: aNode [

	^ RBMessageNode
		  receiver: (aNode receiver acceptVisitor: self)
		  selector: (aNode selectorNode acceptVisitor: self)
		  arguments:
		  (aNode arguments collect: [ :each | each acceptVisitor: self ])
]

{ #category : #visiting }
RBProgramNodeWalkVisitor >> visitSelectorNode: aNode [

	^ RBSelectorNode value: (aNode value walkStarUsingWalker: walker)
]

{ #category : #visiting }
RBProgramNodeWalkVisitor >> visitSequenceNode: aNode [

	^ RBSequenceNode statements:
		  (aNode statements collect: [ :each | each acceptVisitor: self ])
]

{ #category : #accessing }
RBProgramNodeWalkVisitor >> walker: anObject [

	walker := anObject
]
