Extension { #name : #BlockClosure }

{ #category : #'*MicroKanren-Tests' }
BlockClosure >> withEnumeratedReifiedVars [
	^ self
		valueWithArguments: ((0 to: self numArgs - 1) collect: [ :i | i asReifiedVar ])
]
