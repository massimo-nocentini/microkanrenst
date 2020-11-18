Extension { #name : #Walker }

{ #category : #'*MicroKanren-Realog' }
Walker >> forRealogEmployee: anEmployee [
	^ MKRealogEmployee new
		  id: (self value: anEmployee id);
		  yourself
]
