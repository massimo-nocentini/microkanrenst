Extension { #name : #Object }

{ #category : #'*MicroKanren-RB' }
Object >> equalRBLogicVariableNode: aNode [

	^ false
]

{ #category : #'*MicroKanren-RB' }
Object >> unifyWithRBLogicVariableNode: aNode usingUnifier: anUnifier [

	^ self unifyWithRBNode: aNode usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-RB' }
Object >> unifyWithRBSequenceNode: aNode usingUnifier: anUnifier [

	^ self unifyWithRBNode: aNode usingUnifier: anUnifier
]
