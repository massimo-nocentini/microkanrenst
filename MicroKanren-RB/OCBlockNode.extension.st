Extension { #name : 'OCBlockNode' }

{ #category : '*MicroKanren-RB' }
OCBlockNode >> unifyWith: anObject usingUnifier: anUnifier [

	^ anObject unifyWithRBBlockNode: self usingUnifier: anUnifier
]

{ #category : '*MicroKanren-RB' }
OCBlockNode >> unifyWithRBBlockNode: aRBBlockNode usingUnifier: anUnifier [

	^ anUnifier forRBBlockNode: self forRBBlockNode: aRBBlockNode
]
