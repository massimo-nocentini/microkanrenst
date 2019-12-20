Extension { #name : #UnionFind }

{ #category : #'*MicroKanren' }
UnionFind >> asState [
	^ State fromUnionFind: self
]

{ #category : #'*MicroKanren' }
UnionFind >> at: aVar ifPresent: presentBlock ifAbsentPut: absentBlock [
	^ self
		union: aVar
		with: absentBlock value
		consistent: [ :root :reprs | 
			reprs
				ifEmpty: [ root ]
				ifNotEmpty: [ reprs size = 1
						ifTrue: [ reprs atRandom ]
						ifFalse: [ UnificationError signal ] ] ]
]

{ #category : #'*MicroKanren' }
UnionFind >> walk: anObj fromState: aState [
	^ aState walk: anObj inUnionFind: self
]
