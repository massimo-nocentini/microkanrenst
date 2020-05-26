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
RBProgramNodeSubstitutionVisitor >> visitArgumentNode: anArgumentNode [
	| node |
	node := substitution
		at: anArgumentNode name
		ifAbsent: [ RBArgumentNode new ].
	^ node
		named: anArgumentNode name start: anArgumentNode start;
		yourself
]
