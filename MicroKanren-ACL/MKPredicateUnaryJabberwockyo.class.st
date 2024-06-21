Class {
	#name : 'MKPredicateUnaryJabberwockyo',
	#superclass : 'PredicateTernary',
	#category : 'MicroKanren-ACL',
	#package : 'MicroKanren-ACL'
}

{ #category : 'running' }
MKPredicateUnaryJabberwockyo >> goal [

	^ [ :x :d :e :f :g :h :i | 
	  | ancestor ancestorTrue ancestorFalse dRB eRB fRB gRB xRB hRB iRB goal ifTrueGoal ifFalseGoal a c b |
	  a := firstArgument.
	  c := secondArgument.
	  b := thirdArgument.

	  xRB := x asRBNode.
	  dRB := d asRBNode.
	  eRB := e asRBNode.
	  fRB := f asRBNode.
	  gRB := g asRBNode.
	  hRB := h asRBNode.
	  iRB := i asRBNode.

	  ancestor := [ 
	              x isUffish
		              ifTrue: [ d ]
		              ifFalse: [ e ] ] unaryRBNode 
		              substituteVariablesUsingDictionary: (Dictionary new
				               at: #x put: xRB;
				               at: #d put: dRB;
				               at: #e put: eRB;
				               yourself).

	  ancestorTrue := [ 
	                  x isSlithy
		                  ifTrue: [ f ]
		                  ifFalse: [ g ] ] unaryRBNode 
		                  substituteVariablesUsingDictionary:
			                  (Dictionary new
				                   at: #x put: xRB;
				                   at: #f put: fRB;
				                   at: #g put: gRB;
				                   yourself).

	  ancestorFalse := [ 
	                   x isBrillig
		                   ifTrue: [ h ]
		                   ifFalse: [ i ] ] unaryRBNode 
		                   substituteVariablesUsingDictionary:
			                   (Dictionary new
				                    at: #x put: xRB;
				                    at: #h put: hRB;
				                    at: #i put: iRB;
				                    yourself).

	  goal := (self unifyº value: ancestor value: c)
	          ,
	          (MKPredicateBinaryAncestoro value: ancestorTrue value: dRB)
	          ,
	          (MKPredicateBinaryAncestoro value: ancestorFalse value: eRB).

	  ifTrueGoal := (MKPredicateBinaryAncestoro value: a value: fRB)
	                , (self unifyº
			                 value: a
			                 value:
			                 (RBMessageNode receiver: xRB selector: #mimsy))
	                ,
	                (self unifyº
		                 value: #borogove asLiteralRBNode
		                 value: b)
	                |
		                ((MKPredicateBinaryAncestoro value: a value: gRB)
		                 , (self unifyº
				                  value: a
				                  value:
				                  (RBMessageNode receiver: xRB selector: #mome))
		                 ,
		                 (self unifyº value: #rath asLiteralRBNode value: b)).

	  ifFalseGoal := (MKPredicateBinaryAncestoro value: a value: hRB)
	                 , (self unifyº
			                  value: a
			                  value:
			                  (RBMessageNode receiver: xRB selector: #frumious))
	                 ,
	                 (self unifyº
		                  value: #bandersnatch asLiteralRBNode
		                  value: b)
	                 |
		                 ((MKPredicateBinaryAncestoro value: a value: iRB)
		                  , (self unifyº
				                   value: a
				                   value:
				                   (RBMessageNode
					                    receiver: xRB
					                    selector: #frabjous))
		                  ,
		                  (self unifyº
			                   value: #beamish asLiteralRBNode
			                   value: b)).

	  goal , (ifTrueGoal | ifFalseGoal) ] asGoal
]

{ #category : 'accessing' }
MKPredicateUnaryJabberwockyo >> name [

	^ 'jabberwockyº'
]
