Extension { #name : #Integer }

{ #category : #'*MicroKanren-Visualization' }
Integer >> printSubscriptString [
	| subscripts |
	subscripts := Object subscripts.
	^ self printString collect: [ :each | subscripts at: each ]
]
