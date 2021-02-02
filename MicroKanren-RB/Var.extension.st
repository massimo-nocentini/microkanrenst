Extension { #name : #Var }

{ #category : #'*MicroKanren-RB' }
Var >> asRBNode [

	^ RBLogicVariableNode named: named logicVar: self
]

{ #category : #'*MicroKanren-RB' }
Var >> unifyWithRBLiteralValueNode: aNode usingUnifier: anUnifier [

	^ self unifyWithRBNode: aNode usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-RB' }
Var >> unifyWithRBLogicVariableNode: aNode usingUnifier: anUnifier [

	"
	^ aNode unifyWithVar: self usingUnifier: anUnifier"

	^ self unifyWithRBNode: aNode usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-RB' }
Var >> unifyWithRBMessageNode: aNode usingUnifier: anUnifier [

	^ self unifyWithRBNode: aNode usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-RB' }
Var >> unifyWithRBNode: aNode usingUnifier: anUnifier [

	^ self unifyWithObject: aNode usingUnifier: anUnifier
]
