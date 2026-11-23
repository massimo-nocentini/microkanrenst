"
I am the superclass of the AST visitors that bring the operations on logic terms to AST nodes; subclasses implement `visitSelectorNode:`.
"
Class {
	#name : 'RBProgramNodeMKVisitor',
	#superclass : 'OCProgramNodeVisitor',
	#category : 'MicroKanren-RB',
	#package : 'MicroKanren-RB'
}

{ #category : 'as yet unclassified' }
RBProgramNodeMKVisitor >> visitSelectorNode: aNode [

	self subclassResponsibility
]
