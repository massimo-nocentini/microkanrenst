Class {
	#name : #RBProgramNodeReifyVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'state'
	],
	#category : #'MicroKanren-RB'
}

{ #category : #accessing }
RBProgramNodeReifyVisitor >> state [

	^ state
]

{ #category : #accessing }
RBProgramNodeReifyVisitor >> state: anObject [

	state := anObject
]

{ #category : #visiting }
RBProgramNodeReifyVisitor >> visitLiteralValueNode: aLiteralNode [

	state := state reifier value: aLiteralNode value
]

{ #category : #visiting }
RBProgramNodeReifyVisitor >> visitLogicVariableNode: aNode [

	state := state reifier value: aNode logicVar
]

{ #category : #visiting }
RBProgramNodeReifyVisitor >> visitMessageNode: aNode [

	aNode receiver acceptVisitor: self.
	aNode selectorNode acceptVisitor: self.
	aNode arguments do: [ :each | each acceptVisitor: self ]
]

{ #category : #visiting }
RBProgramNodeReifyVisitor >> visitSelectorNode: aNode [

	state := state reifier value: aNode value
]

{ #category : #visiting }
RBProgramNodeReifyVisitor >> visitSequenceNode: aSequenceNode [

	state := aSequenceNode statements
		         inject: state
		         into: [ :aState :each | aState reifier value: each ]
]
