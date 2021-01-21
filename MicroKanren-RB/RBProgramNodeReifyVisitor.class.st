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
RBProgramNodeReifyVisitor >> visitLogicVariableNode: aNode [

	^ state := state reifier value: aNode logicVar
]

{ #category : #visiting }
RBProgramNodeReifyVisitor >> visitMessageNode: aNode [

	state := aNode receiver acceptVisitor: self.
	state := aNode selectorNode acceptVisitor: self.
	aNode arguments do: [ :each | state := each acceptVisitor: self ].
	^ state
]

{ #category : #visiting }
RBProgramNodeReifyVisitor >> visitSelectorNode: aNode [

	^ state reifier value: aNode value
]

{ #category : #visiting }
RBProgramNodeReifyVisitor >> visitSequenceNode: aSequenceNode [

	^ aSequenceNode statements
		  inject: state
		  into: [ :aState :each | aState reifier value: each ]
]
