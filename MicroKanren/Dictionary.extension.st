Extension { #name : #Dictionary }

{ #category : #'*MicroKanren-core' }
Dictionary >> asState [
	^ State new birthdate:0; substitution: self; yourself
]
