Class {
	#name : #ACLPredicateAtomCons,
	#superclass : #ACLPredicate,
	#category : #'MicroKanren-ACL'
}

{ #category : #evaluating }
ACLPredicateAtomCons >> value: x value: y [
	^ [ :v :z | 
	| match then |
	match := x unifyo
		value:
			(RBMessageNode
				receiver:
					(RBMessageNode
						receiver: v asRBMKVarNode
						selector: #cons:
						arguments: z asRBMKVarNode)
				selector: #isAtom).
	then := y unifyo value: (RBLiteralValueNode value: false).
	match , then ] fresh
]
