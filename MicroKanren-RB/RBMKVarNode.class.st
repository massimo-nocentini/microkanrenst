Class {
	#name : #RBMKVarNode,
	#superclass : #RBVariableNode,
	#instVars : [
		'logic_var'
	],
	#category : #'MicroKanren-RB'
}

{ #category : #accessing }
RBMKVarNode >> logic_var: anObject [
	logic_var := anObject
]
