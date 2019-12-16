Extension { #name : #UnionFind }

{ #category : #'*MicroKanren' }
UnionFind >> asState [
	^ State fromUnionFind: self
]

{ #category : #'*MicroKanren' }
UnionFind >> at: aVar ifPresent: presentBlock ifAbsentPut: absentBlock [
	^ (self includesKey: aVar)
		ifTrue: [ | v |
			v := self at: aVar.
			aVar == v
				ifTrue: [ self union: aVar with: absentBlock value ]
				ifFalse: [ presentBlock cull: v ] ]
		ifFalse: [ self union: aVar with: absentBlock value ]
]

{ #category : #'*MicroKanren' }
UnionFind >> includesKey: aKey [
	^ dict includesKey: aKey
]

{ #category : #'*MicroKanren' }
UnionFind >> walk: anObj fromState: aState [
	^ aState walk: anObj inUnionFind: self
]
