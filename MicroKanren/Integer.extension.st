Extension { #name : #Integer }

{ #category : #'*MicroKanren-core' }
Integer >> asReifiedVar [
	^ ReifiedVar new
		id: self;
		yourself
]
