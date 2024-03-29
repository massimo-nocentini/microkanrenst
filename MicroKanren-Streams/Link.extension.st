Extension { #name : #Link }

{ #category : #'*MicroKanren-Streams' }
Link >> appendMap: aBlock [

	^ nextLink appendMap: aBlock
]

{ #category : #'*MicroKanren-Streams' }
Link >> appendStream: aStream [

	^ self class nextLink: (nextLink appendStream: aStream)
]

{ #category : #'*MicroKanren-Streams' }
Link >> collect: aBlock [

	^ self class nextLink: (nextLink collect: aBlock)
]

{ #category : #'*MicroKanren-Streams' }
Link >> putOn: aStream fromStream: rootStream [

	nextLink putOn: aStream fromStream: rootStream
]

{ #category : #'*MicroKanren-Streams' }
Link >> readStream [

	^ (Array streamContents: [ :aStream | 
		   self putOn: aStream fromStream: self ]) readStream
]

{ #category : #'*MicroKanren-Streams' }
Link >> select: aBlock [

	^ self class nextLink: (nextLink select: aBlock)
]
