Extension { #name : #BlockClosure }

{ #category : #'*MicroKanren-Streams' }
BlockClosure >> appendMap: aBlock [

	^ [ self value appendMap: aBlock ]
]

{ #category : #'*MicroKanren-Streams' }
BlockClosure >> appendStream: aStream [

	^ [ aStream appendStream: self value ]
]

{ #category : #'*MicroKanren-Streams' }
BlockClosure >> collect: aFullBlockClosure [

	^ [ self value collect: aFullBlockClosure ]
]

{ #category : #'*MicroKanren-Streams' }
BlockClosure >> next: n [

	^ [ self value next: n ]
]

{ #category : #'*MicroKanren-Streams' }
BlockClosure >> nextInteger: n [

	^ [ self value nextInteger: n ]
]

{ #category : #'*MicroKanren-Streams' }
BlockClosure >> putOn: aStream fromStream: rootStream [

	self value putOn: aStream fromStream: rootStream
]

{ #category : #'*MicroKanren-Streams' }
BlockClosure >> readStream [

	^ self value readStream
]

{ #category : #'*MicroKanren-Streams' }
BlockClosure >> select: aFullBlockClosure [

	^ [ self value select: aFullBlockClosure ]
]
