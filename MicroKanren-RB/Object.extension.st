Extension { #name : #Object }

{ #category : #'*MicroKanren-RB' }
Object >> unifyWithRBSequenceNode: aRBSequenceNode usingUnifier: anUnifier [

	^ anUnifier forObject: self forObject: aRBSequenceNode
]
