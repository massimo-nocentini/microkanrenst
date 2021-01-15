Class {
	#name : #RBProgramNodeSenderoVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'goals',
		'selectorVar'
	],
	#category : #'MicroKanren-RB'
}

{ #category : #initialization }
RBProgramNodeSenderoVisitor >> asGoal [

	^ goals foldr: [ :each :g | each | g ] init: false asGoal
]

{ #category : #initialization }
RBProgramNodeSenderoVisitor >> initialize [

	super initialize.

	goals := OrderedCollection new
]

{ #category : #accessing }
RBProgramNodeSenderoVisitor >> selectorVar: anObject [

	selectorVar := anObject
]

{ #category : #visiting }
RBProgramNodeSenderoVisitor >> visitMessageNode: aMessageNode [

	super visitMessageNode: aMessageNode.

	goals add: (selectorVar unifyo value: aMessageNode selectorNode)
]
