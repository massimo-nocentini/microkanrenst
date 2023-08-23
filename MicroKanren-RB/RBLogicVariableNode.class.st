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

{ #category : #comparing }
RBLogicVariableNode >> = anObject [

	^ anObject equalRBLogicVariableNode: self
]

{ #category : #visiting }
RBLogicVariableNode >> acceptVisitor: aProgramNodeVisitor [
	^ aProgramNodeVisitor visitLogicVariableNode: self
]

{ #category : #comparing }
RBLogicVariableNode >> equalRBLogicVariableNode: aNode [

	^ logicVar = aNode logicVar
]

{ #category : #comparing }
RBLogicVariableNode >> hash [

	^ logicVar hash
]

{ #category : #testing }
RBLogicVariableNode >> id [

	^ logicVar id
]

{ #category : #accessing }
RBLogicVariableNode >> logicVar [
	^ logicVar
]

{ #category : #accessing }
RBLogicVariableNode >> logicVar: anObject [
	logicVar := anObject
]

{ #category : #'as yet unclassified' }
RBLogicVariableNode >> unifyWith: anObject usingUnifier: anUnifier [

	^ anObject unifyWithRBLogicVariableNode: self usingUnifier: anUnifier
]

{ #category : #'as yet unclassified' }
RBLogicVariableNode >> unifyWithRBLogicVariableNode: aNode usingUnifier: anUnifier [

	^ anUnifier
		  forRBLogicVariableNode: self
		  forRBLogicVariableNode: aNode
]

{ #category : #'as yet unclassified' }
RBLogicVariableNode >> unifyWithRBNode: aNode usingUnifier: anUnifier [

	^ logicVar unifyWithObject: aNode usingUnifier: anUnifier
]

{ #category : #dispatched }
RBLogicVariableNode >> unifyWithVar: aVar usingUnifier: anUnifier [

	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
RBLogicVariableNode >> walkSBRAL: aSBRAL forState: aState [

	^ (aState walkVar: logicVar inSBRAL: aSBRAL) asRBNode in: [ :node | 
		  node
			  parent: parent;
			  yourself ]
]
