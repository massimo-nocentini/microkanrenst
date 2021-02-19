Extension { #name : #Link }

{ #category : #'*MicroKanren-Streams' }
Link >> putOn: aStream fromStream: rootStream [

	nextLink putOn: aStream fromStream: rootStream
]

{ #category : #'*MicroKanren-Streams' }
Link >> readStream [

	^ (Array streamContents: [ :aStream | 
		   self putOn: aStream fromStream: self ]) readStream
]
