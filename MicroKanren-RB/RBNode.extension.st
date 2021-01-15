Extension { #name : #RBNode }

{ #category : #'*MicroKanren-RB' }
RBNode >> substituteVariablesUsingDictionary: aDict [

	^ self acceptVisitor: (RBProgramNodeSubstitutionVisitor new
			   substitution: aDict;
			   yourself)
]
