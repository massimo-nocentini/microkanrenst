Class {
	#name : #RBMKVarNode,
	#superclass : #RBVariableNode,
	#instVars : [
		'logicVar'
	],
	#category : #'MicroKanren-RB'
}

{ #category : #visiting }
RBMKVarNode >> acceptVisitor: aProgramNodeVisitor [
	^ aProgramNodeVisitor visitLogicVariableNode: self
]

{ #category : #accessing }
RBMKVarNode >> logicVar [
	^ logicVar
]

{ #category : #accessing }
RBMKVarNode >> logicVar: anObject [
	logicVar := anObject
]
