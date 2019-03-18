Extension { #name : #ByteSymbol }

{ #category : #'*MicroKanren-core' }
ByteSymbol >> asCons [
	^ Cons fromByteSymbol: self
]

{ #category : #'*MicroKanren-core' }
ByteSymbol >> asCons: aCdr [
	^ Cons fromByteSymbol: self lastCdr: aCdr
]
