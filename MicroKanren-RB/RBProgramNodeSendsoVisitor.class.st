Class {
	#name : #RBProgramNodeSendsoVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'goals',
		'selectorVar'
	],
	#category : #'MicroKanren-RB'
}

{ #category : #initialization }
RBProgramNodeSendsoVisitor >> asGoal [

	^ goals foldr: [ :each :g | each | g ] init: false asGoal
]

{ #category : #initialization }
RBProgramNodeSendsoVisitor >> initialize [

	super initialize.

	goals := OrderedCollection new
]

{ #category : #accessing }
RBProgramNodeSendsoVisitor >> selectorVar: anObject [

	selectorVar := anObject
]

{ #category : #visiting }
RBProgramNodeSendsoVisitor >> visitMessageNode: aMessageNode [

	super visitMessageNode: aMessageNode.

	goals add: (selectorVar unifyo value: aMessageNode selectorNode)
]
