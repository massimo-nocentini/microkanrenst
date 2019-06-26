Extension { #name : #ByteSymbol }

{ #category : #'*MicroKanren-core' }
ByteSymbol >> asCons [
	^ Cons fromByteSymbol: self
]
