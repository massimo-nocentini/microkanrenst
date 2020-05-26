Extension { #name : #BlockClosure }

{ #category : #'*MicroKanren-RB' }
BlockClosure >> context [
	^ self sourceNode body
		acceptVisitor:
			(RBProgramNodeSubstitutionVisitor new
				substitution:
					(Dictionary new
						at: #x
							put:
							(RBMKVarNode new
								logic_var: 3;
								yourself);
						yourself);
				yourself)
]
