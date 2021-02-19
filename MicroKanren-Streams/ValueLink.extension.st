Extension { #name : #ValueLink }

{ #category : #'*MicroKanren-Streams' }
ValueLink >> appendStream: aStream [

	^ self class new
		  value: value;
		  nextLink: (nextLink appendStream: aStream);
		  yourself
]

{ #category : #'*MicroKanren-Streams' }
ValueLink >> putOn: aStream fromStream: rootStream [

	aStream nextPut: value.
	super putOn: aStream fromStream: rootStream
]

{ #category : #'*MicroKanren-Streams' }
ValueLink >> streamNext: n [

	^ n = 0
		  ifTrue: [ nil ]
		  ifFalse: [ 
			  self class
				  value: value;
				  nextLink: (nextLink streamNext: n - 1);
				  yourself ]
]
