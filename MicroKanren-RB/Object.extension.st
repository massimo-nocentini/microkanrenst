Extension { #name : #Object }

{ #category : #'*MicroKanren-RB' }
Object >> equalRBLogicVariableNode: aNode [

	^ false
]

{ #category : #'*MicroKanren-RB' }
Object >> unifyWithRBLogicVariableNode: aNode usingUnifier: anUnifier [

	^ aNode logicVar unifyWith: self usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-RB' }
Object >> unifyWithRBSequenceNode: aRBSequenceNode usingUnifier: anUnifier [

	^ anUnifier forObject: self forObject: aRBSequenceNode
]
