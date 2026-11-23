"
I am the theory of S-expressions, that is of conses and nil. `Theory class>>sexp` makes me.

- `conso`, `caro`, `cdro` and `appendo` answer a predicate class.
- `nilo`, `pairo`, `lengtho` and `reverseo` answer a block; the numbers of `lengtho` are those of `ArithTheory`.
- `alphaRuleo` answers a block that makes an `AlphaRule`.

`pairo` and `reverseo`, and `lengtho` by `pairo`, send `!!` to a predicate class, which does not understand it.

```smalltalk
[ :l :r |
	Theory sexp appendo value: l value: r value: #( 1 ) asCons ]
	asGoal solutions readStream upToEnd.
""=> an Array(an Array(nil (1)) an Array((1) nil))""
```
"
Class {
	#name : #SexpTheory,
	#superclass : #Theory,
	#category : #'MicroKanren-Theories-theories'
}

{ #category : #'lambda calculus' }
SexpTheory >> alphaRuleo [
	^ [:x :y | Goal alpha: x rule: y]
]

{ #category : #'as yet unclassified' }
SexpTheory >> appendo [

	^ MKPredicateSexpAppendo
]

{ #category : #'as yet unclassified' }
SexpTheory >> caro [

	^ MKPredicateSexpCaro
]

{ #category : #'as yet unclassified' }
SexpTheory >> cdro [

	^ MKPredicateSexpCdro
]

{ #category : #'as yet unclassified' }
SexpTheory >> conso [

	^ MKPredicateSexpConso
]

{ #category : #'as yet unclassified' }
SexpTheory >> lengtho [
	| µ |
	µ := Theory arith.
	^ [ :lst :n | 
	(lst nilo , n zeroo)
		|
			(lst pairo , n positiveo
				,
					[ :cdr :res | 
					| recº |
					recº := [ self lengtho
						!!
							{cdr.
							res} ] asGoal.
					self cdro
						!!
							{lst.
							cdr}
						,
							(µ succo
								!!
									{res.
									n}) , recº ] asGoal) ]
]

{ #category : #'as yet unclassified' }
SexpTheory >> nilo [
	^ [:anObj | anObj unifyo value: nil]
]

{ #category : #'as yet unclassified' }
SexpTheory >> pairo [
	^ [:lst | [:a :d | self conso !! {a. d. lst}] asGoal]
]

{ #category : #'as yet unclassified' }
SexpTheory >> reverseo [
	^ [:reversing :reversed | Goal cond e if: reversing nilo then: reversed nilo;
		 if: true asGoal then: [:car :cdr :res | self conso !! {car. cdr. reversing} , (self appendo !! {res. {car} asCons. reversed}) , [self reverseo !! {cdr.res}] asGoal] asGoal]
]
