"
I relate an AST node and a node that has it as a part, at any depth: `MKPredicateBinaryParento` relates them, or it relates an intermediate node to the second one, and I relate the first one to it.

```smalltalk
([ :x |
	MKPredicateBinaryAncestoro
		value: x asRBNode
		value: [ 1 car cdr ] unaryRBNode ]
	asGoal solutions next: 2) readStream upToEnd.
""=> an Array(OCMessageNode(1 car) OCLiteralValueNode(1))""
```
"
Class {
	#name : 'MKPredicateBinaryAncestoro',
	#superclass : 'PredicateBinary',
	#category : 'MicroKanren-ACL',
	#package : 'MicroKanren-ACL'
}

{ #category : 'running' }
MKPredicateBinaryAncestoro >> goal [

	| g1 g2 |
	g1 := MKPredicateBinaryParento
		      value: firstArgument
		      value: secondArgument.
	g2 := [ :p | 
	      | pRB |
	      pRB := p asRBNode.
	      (MKPredicateBinaryParento value: pRB value: secondArgument)
	      , (self copy
			       firstArgument: firstArgument;
			       secondArgument: pRB;
			       yourself) ] asGoal.
	^ g1 | g2
]

{ #category : 'accessing' }
MKPredicateBinaryAncestoro >> name [

	^ 'ancestorº'
]
