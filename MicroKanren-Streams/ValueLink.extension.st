Extension { #name : #ValueLink }

{ #category : #'*MicroKanren-Streams' }
ValueLink >> appendMap: aBlock [

	| aStream |
	aStream := aBlock value: value.
	^ aStream appendStream: (super appendMap: aBlock)
]

{ #category : #'*MicroKanren-Streams' }
ValueLink >> appendStream: aStream [

	^ (super appendStream: aStream)
		  value: value;
		  yourself
]

{ #category : #'*MicroKanren-Streams' }
ValueLink >> putOn: aStream fromStream: rootStream [

	aStream nextPut: value.
	super putOn: aStream fromStream: rootStream
]

{ #category : #'*MicroKanren-Streams' }
ValueLink >> streamNext: n [

	^ (super streamNext: n) ifNotNil: [ :aValueLink | 
		  aValueLink
			  value: value;
			  yourself ]
]
