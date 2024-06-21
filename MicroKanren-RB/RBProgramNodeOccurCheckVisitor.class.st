Class {
	#name : 'RBProgramNodeOccurCheckVisitor',
	#superclass : 'RBProgramNodeMKVisitor',
	#instVars : [
		'occurChecker'
	],
	#category : 'MicroKanren-RB',
	#package : 'MicroKanren-RB'
}

{ #category : 'accessing' }
RBProgramNodeOccurCheckVisitor >> occurChecker: anObject [

	occurChecker := anObject
]

{ #category : 'visiting' }
RBProgramNodeOccurCheckVisitor >> visitBlockNode: aNode [

	^ aNode arguments
		  inject: (self visitNode: aNode body)
		  into: [ :aBoolean :each | aBoolean or: [ self visitNode: each ] ]
]

{ #category : 'visiting' }
RBProgramNodeOccurCheckVisitor >> visitLiteralValueNode: aLiteralNode [

	^ occurChecker value: aLiteralNode value
]

{ #category : 'visiting' }
RBProgramNodeOccurCheckVisitor >> visitLogicVariableNode: aNode [

	^ occurChecker value: aNode logicVar
]

{ #category : 'visiting' }
RBProgramNodeOccurCheckVisitor >> visitMessageNode: aNode [

	^ (aNode receiver acceptVisitor: self) or: [ 
		  aNode arguments
			  inject: (aNode selectorNode acceptVisitor: self)
			  into: [ :aBoolean :each | 
			  aBoolean or: [ each acceptVisitor: self ] ] ]
]

{ #category : 'visiting' }
RBProgramNodeOccurCheckVisitor >> visitSelectorNode: aNode [

	^ occurChecker value: aNode value
]

{ #category : 'visiting' }
RBProgramNodeOccurCheckVisitor >> visitSequenceNode: aSequenceNode [

	^ aSequenceNode statements
		  inject: false
		  into: [ :aBoolean :each | 
		  aBoolean or: [ occurChecker value: each ] ]
]
