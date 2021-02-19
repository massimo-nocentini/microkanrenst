Class {
	#name : #RBProgramNodeSubstitutionVisitor,
	#superclass : #RBProgramNodeIdentityVisitor,
	#instVars : [
		'substitution'
	],
	#category : #'MicroKanren-RB'
}

{ #category : #accessing }
RBProgramNodeSubstitutionVisitor >> substitution: anObject [
	substitution := anObject
]

{ #category : #visiting }
RBProgramNodeSubstitutionVisitor >> visitLogicVariableNode: aNode [

	^ substitution at: aNode
]

{ #category : #visiting }
RBProgramNodeSubstitutionVisitor >> visitTemporaryNode: aNode [

	^ aNode isVariable
		  ifTrue: [ substitution at: aNode name ]
		  ifFalse: [ aNode ]
]
