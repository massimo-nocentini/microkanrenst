Extension { #name : #RBBlockNode }

{ #category : #'*MicroKanren-RB' }
RBBlockNode >> unifyWith: anObject usingUnifier: anUnifier [

	^ anObject unifyWithRBBlockNode: self usingUnifier: anUnifier
]
