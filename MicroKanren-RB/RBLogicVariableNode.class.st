Class {
	#name : #RBLogicVariableNode,
	#superclass : #RBVariableNode,
	#instVars : [
		'logicVar'
	],
	#category : #'MicroKanren-RB'
}

{ #category : #'instance creation' }
RBLogicVariableNode class >> named: aString logicVar: aVar [

	^ (self named: aString)
		  logicVar: aVar;
		  yourself
]

{ #category : #visiting }
RBLogicVariableNode >> acceptVisitor: aProgramNodeVisitor [
	^ aProgramNodeVisitor visitLogicVariableNode: self
]

{ #category : #accessing }
RBLogicVariableNode >> logicVar [
	^ logicVar
]

{ #category : #accessing }
RBLogicVariableNode >> logicVar: anObject [
	logicVar := anObject
]
