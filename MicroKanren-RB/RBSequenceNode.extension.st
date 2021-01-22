Extension { #name : #RBSequenceNode }

{ #category : #'*MicroKanren-RB' }
RBSequenceNode >> unifyWith: anObject usingUnifier: anUnifier [

	^ anObject unifyWithRBSequenceNode: self usingUnifier: anUnifier
]

{ #category : #'*MicroKanren-RB' }
RBSequenceNode >> unifyWithRBSequenceNode: aRBSequenceNode usingUnifier: anUnifier [

	^ self statements
		  unifyWith: aRBSequenceNode statements
		  usingUnifier: anUnifier
]
