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
Link >> next: anObject [

	^ anObject nextFromLink: self
]

{ #category : #'*MicroKanren-Streams' }
Link >> nextFromLink: aLink [

	^ aLink nextLink: self
]

{ #category : #'*MicroKanren-Streams' }
Link >> nextInteger: n [

	^ n = 0
		  ifTrue: [ nil ]
		  ifFalse: [ self class nextLink: (nextLink nextInteger: n - 1) ]
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
