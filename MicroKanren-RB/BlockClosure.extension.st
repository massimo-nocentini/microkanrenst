Extension { #name : #BlockClosure }

{ #category : #'*MicroKanren-RB' }
BlockClosure >> context [
	^ self sourceNode body
		acceptVisitor: RBProgramNodeIdentityVisitor new
]
