Extension { #name : #UndefinedObject }

{ #category : #'*MicroKanren-Streams' }
UndefinedObject >> appendMap: aBlock [

	^ self
]

{ #category : #'*MicroKanren-Streams' }
UndefinedObject >> appendStream: aStream [

	^ aStream
]

{ #category : #'*MicroKanren-Streams' }
UndefinedObject >> putOn: aStream fromStream: rootStream [

	"nothing to do"

	
]

{ #category : #'*MicroKanren-Streams' }
UndefinedObject >> readStream [

	^ #(  ) readStream
]

{ #category : #'*MicroKanren-Streams' }
UndefinedObject >> streamNext: n [

	^ self
]
