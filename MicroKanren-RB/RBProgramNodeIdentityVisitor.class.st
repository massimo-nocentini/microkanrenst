"
I am a node program visitor that reconstruct an exact copy of the visited RBNode object.
"
Class {
	#name : #RBProgramNodeIdentityVisitor,
	#superclass : #RBProgramNodeVisitor,
	#category : #'MicroKanren-RB'
}

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitArgumentNode: anArgumentNode [

	self shouldBeImplemented
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitArgumentNodes: aNodeCollection [
	self shouldBeImplemented
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitArrayNode: anArrayNode [
	self shouldBeImplemented
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitAssignmentNode: anAssignmentNode [
	self shouldBeImplemented
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitBlockNode: aBlockNode [

	self shouldBeImplemented
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitCascadeNode: aCascadeNode [
	self shouldBeImplemented
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitEnglobingErrorNode: anEnglobingErrorNode [

	self shouldBeImplemented
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitGlobalNode: aSelfNode [
	self shouldBeImplemented
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitInstanceVariableNode: aSelfNode [
	self shouldBeImplemented
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitLiteralArrayNode: aRBLiteralArrayNode [
	self shouldBeImplemented
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitLiteralNode: aLiteralNode [
	self shouldBeImplemented
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitLiteralValueNode: aRBLiteralValueNode [

	^ aRBLiteralValueNode
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitLogicVariableNode: aRBMKVarNode [

	self shouldNotImplement
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitMessageNode: aMessageNode [
	^ RBMessageNode
		receiver: (aMessageNode receiver acceptVisitor: self)
		selector: aMessageNode selector
		keywordsPositions: aMessageNode keywordsPositions
		arguments:
			(aMessageNode arguments
				collect: [ :aNode | aNode acceptVisitor: self ])
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitMethodNode: aMethodNode [
	self shouldBeImplemented
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitNode: aNode [
	self shouldBeImplemented
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitParseErrorNode: anErrorNode [
	self shouldBeImplemented
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitPatternBlockNode: aRBPatternBlockNode [
	self shouldBeImplemented
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitPatternWrapperBlockNode: aRBPatternWrapperBlockNode [
	self shouldBeImplemented
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitPragmaNode: aPragmaNode [
	self shouldBeImplemented
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitReturnNode: aReturnNode [
	self shouldBeImplemented
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitSelfNode: aSelfNode [
	self shouldBeImplemented
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitSequenceNode: aSequenceNode [

	^ RBSequenceNode
		  temporaries: (aSequenceNode temporaries collect: [ :aNode | 
				   aNode acceptVisitor: self ])
		  statements: (aSequenceNode statements collect: [ :aNode | 
				   aNode acceptVisitor: self ])
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitSuperNode: aSuperNode [
	self shouldBeImplemented
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitTemporaryDeclarationNode: aTemporaryDeclarationNode [
	self shouldBeImplemented
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitTemporaryNode: aNode [
	self shouldBeImplemented
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitTemporaryNodes: aNodeCollection [
	self shouldBeImplemented
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitThisContextNode: aThisContextNode [
	self shouldBeImplemented
]

{ #category : #visiting }
RBProgramNodeIdentityVisitor >> visitVariableNode: aVariableNode [
	self shouldBeImplemented
]
