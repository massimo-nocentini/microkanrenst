Extension { #name : #BlockClosure }

{ #category : #'*MicroKanren-Streams' }
BlockClosure >> appendStream: aStream [

	^ [ aStream appendStream: self value ]
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
BlockClosure >> streamNext: n [

	^ [ self value streamNext: n ]
]
