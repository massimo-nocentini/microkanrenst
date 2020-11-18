Extension { #name : #Walker }

{ #category : #'*MicroKanren-Realog' }
Walker >> forRealogCompany: aCompany [
	^ MKRealogCompany new
		  id: (self value: aCompany id);
		  yourself
]

{ #category : #'*MicroKanren-Realog' }
Walker >> forRealogContract: aContract [
	^ MKRealogContract new
		  id: (self value: aContract id);
		  employee: (self value: aContract employee);
		  company: (self value: aContract company);
		  type: (self value: aContract type);
		  yourself
]

{ #category : #'*MicroKanren-Realog' }
Walker >> forRealogEmployee: anEmployee [
	^ MKRealogEmployee new
		  id: (self value: anEmployee id);
		  yourself
]
