Extension { #name : #UnionFind }

{ #category : #'*MicroKanren' }
UnionFind >> asState [
	^ State fromUnionFind: self
]

{ #category : #'*MicroKanren' }
UnionFind >> at: aVar ifPresent: presentBlock ifAbsentPut: absentBlock [
	^ (self includesKey: aVar)
		ifTrue: [ | w |
			w := self at: aVar.
			w == aVar
				ifTrue: [ self union: w with: absentBlock value ]
				ifFalse: [ presentBlock cull: w ] ]
		ifFalse: [ self union: aVar with: absentBlock value ]
]

{ #category : #'*MicroKanren' }
UnionFind >> walk: anObj fromState: aState [
	^ aState walk: anObj inUnionFind: self
]
