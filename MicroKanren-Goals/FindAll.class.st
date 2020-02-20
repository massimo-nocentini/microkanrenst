Class {
	#name : #FindAll,
	#superclass : #BagOf,
	#category : #'MicroKanren-Goals'
}

{ #category : #running }
FindAll >> onState: aState [
	| aStream |
	aStream := (receiver onState: aState)
		collect: [ :s | 
			| args |
			args := s identityReifier reifyVars: vars.
			template valueWithArguments: args ].
	^ (Goal unify: value with: aStream asOrderedCollection asCons)
		onState: aState
]
