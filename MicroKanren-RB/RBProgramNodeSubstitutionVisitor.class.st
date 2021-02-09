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

	^ (substitution at: aNode) copy in: [ :aVar | 
		  aVar parent ifNil: [ aVar parent: aNode parent ].
		  aVar ]
]

{ #category : #visiting }
RBProgramNodeSubstitutionVisitor >> visitTemporaryNode: aNode [

	^ aNode isVariable
		  ifTrue: [ 
			  (substitution at: aNode name) copy "Here assume to talk with RBLogicVariable objs."
				  parent: aNode parent;
				  yourself ]
		  ifFalse: [ aNode ]
]
